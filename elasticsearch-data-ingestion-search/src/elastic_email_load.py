"""Elasticsearch Email Load

Loads at least the first 100 messages from the sakai.devel mbox feed into Elasticsearch.
"""

import io
import mailbox
import requests
from elasticsearch import Elasticsearch
from email.utils import parsedate_to_datetime
import hidden  # your hidden.py based on hidden_template.py


def get_es_client():
    secrets = hidden.elastic()
    host = secrets["host"]
    prefix = secrets.get("prefix", "elasticsearch")
    port = secrets.get("port", 443)
    scheme = secrets.get("scheme", "https")
    user = secrets["user"]
    password = secrets["pass"]

    es = Elasticsearch(
        [{
            "host": host,
            "port": port,
            "scheme": scheme,
            "url_prefix": prefix,
        }],
        http_auth=(user, password),
        timeout=30,
        max_retries=10,
        retry_on_timeout=True,
    )
    return es, user  # use user as index name


def main():
    es, index_name = get_es_client()

    print(f"Deleting index '{index_name}' (if exists)...")
    es.indices.delete(index=index_name, ignore=[400, 404])

    print(f"Creating index '{index_name}'...")
    es.indices.create(index=index_name, ignore=400)

    # Download mbox file
    mbox_url = "http://mbox.dr-chuck.net/sakai.devel/"
    print(f"Downloading mbox from {mbox_url} ...")
    resp = requests.get(mbox_url, timeout=60)
    resp.raise_for_status()

    # mailbox.mbox expects a file path; we can write to an in-memory file-like object,
    # but mailbox.mbox in stdlib strictly wants a filesystem path in many versions.
    # For simplicity here, write to a temporary file.
    import tempfile

    with tempfile.NamedTemporaryFile(delete=False) as tmp:
        tmp.write(resp.content)
        tmp_path = tmp.name

    mbox = mailbox.mbox(tmp_path)

    count = 0
    for message in mbox:
        if count >= 100:
            break

        try:
            from_addr = message.get("From", "")
            to_addr = message.get("To", "")
            subject = message.get("Subject", "")
            date_raw = message.get("Date", "")

            # Parse date to ISO 8601 if possible
            try:
                dt = parsedate_to_datetime(date_raw) if date_raw else None
                date_iso = dt.isoformat() if dt is not None else None
            except Exception:
                date_iso = None

            # Get payload as string
            if message.is_multipart():
                parts = []
                for part in message.walk():
                    if part.get_content_type() == "text/plain":
                        try:
                            parts.append(
                                part.get_payload(decode=True).decode(errors="replace")
                            )
                        except Exception:
                            continue
                body = "\n".join(parts)
            else:
                body = message.get_payload(decode=True)
                if isinstance(body, bytes):
                    body = body.decode(errors="replace")
                if body is None:
                    body = ""

            doc = {
                "type": "email",
                "from": from_addr,
                "to": to_addr,
                "subject": subject,
                "date": date_iso,
                "raw_date": date_raw,
                "body": body,
            }

            es.index(index=index_name, body=doc)
            count += 1

        except Exception as e:
            print("Error indexing one message, skipping:", e)
            continue

    print(f"Indexed {count} email messages into index '{index_name}'.")


if __name__ == "__main__":
    main()
