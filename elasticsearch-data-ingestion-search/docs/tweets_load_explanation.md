# Tweets Load – Explanation

## Goal

Index a small list of short strings ("tweets") into an Elasticsearch index named after the user
(`pg4e_6b74d49971`) with fields:

- `author`
- `type` = "tweet"
- `text`
- `timestamp`

The autograder will search using `elastictool.py` for phrases (e.g. "mustard", "legendary", etc.)
that must appear in the `text`.

## Approach

1. Define the list of tweet texts exactly as provided.
2. Loop over these strings, create a document including:
   - A fake `author`
   - Current timestamp (ISO 8601)
3. Index each tweet as a separate document in Elasticsearch.

We reset the index at the start of the script to ensure **clean state**.
