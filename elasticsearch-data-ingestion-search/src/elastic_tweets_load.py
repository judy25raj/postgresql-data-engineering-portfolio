"""Elasticsearch Tweets Load

Indexes a fixed set of 'tweet-like' texts into Elasticsearch.
"""

from datetime import datetime, timezone
from elasticsearch import Elasticsearch
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

    tweets = [
        "This is looking much better so you try to communicate some more",
        "You must be the legendary god that comes from the sky",
        "We have been waiting for you for a long time",
        "Our legend says you will be very tasty with mustard",
        "print We will have a feast tonight unless you say",
    ]

    count = 0
    for text in tweets:
        doc = {
            "author": "pg4e_bot",
            "type": "tweet",
            "text": text,
            "timestamp": datetime.now(timezone.utc).isoformat(),
        }
        es.index(index=index_name, body=doc)
        count += 1

    print(f"Indexed {count} tweets into index '{index_name}'.")

    # Sample search: not used by autograder, but helpful for local debug
    try:
        res = es.search(
            index=index_name,
            body={"query": {"query_string": {"query": "legendary OR mustard"}}},
            size=5,
        )
        total = res.get("hits", {}).get("total", {}).get("value", 0)
        print(f"Sample search for 'legendary OR mustard' got {total} hit(s).")
    except Exception as e:
        print("Search check failed (not fatal):", e)


if __name__ == "__main__":
    main()
