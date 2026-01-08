"""Elasticsearch Book Load

Downloads a Gutenberg text and indexes it into Elasticsearch as chunks with:
- offset (integer)
- content (text)
"""

import requests
from elasticsearch import Elasticsearch
import hidden  # your own hidden.py based on hidden_template.py


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

    # Reset index for repeatability
    print(f"Deleting index '{index_name}' (if exists)...")
    es.indices.delete(index=index_name, ignore=[400, 404])

    print(f"Creating index '{index_name}'...")
    es.indices.create(index=index_name, ignore=400)

    # Download book text
    url = "https://www.pg4e.com/gutenberg/cache/epub/18866/pg18866.txt"
    print(f"Downloading book from {url} ...")
    resp = requests.get(url, timeout=30)
    resp.raise_for_status()
    text = resp.text

    # Simple splitting into paragraphs (split on blank lines)
    print("Splitting book into chunks...")
    raw_chunks = text.split("\n\n")
    offset = 0
    count = 0

    for chunk in raw_chunks:
        content = chunk.strip()
        if not content:
            continue

        doc = {
            "offset": offset,
            "content": content,
        }

        es.index(index=index_name, body=doc)
        offset += 1
        count += 1

    print(f"Indexed {count} paragraphs/chunks into index '{index_name}'.")

    # Quick sanity-check search (local run only; autograder uses its own tool)
    try:
        res = es.search(
            index=index_name,
            body={"query": {"query_string": {"query": "eccentric"}}},
            size=3,
        )
        hits = res.get("hits", {}).get("hits", [])
        print(f"Sample search for 'eccentric' returned {len(hits)} hit(s).")
    except Exception as e:
        print("Search check failed (this is not fatal for assignment):", e)


if __name__ == "__main__":
    main()
