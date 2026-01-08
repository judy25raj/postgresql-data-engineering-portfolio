# Project 7 Overview – Elasticsearch Integration

This project groups three Elasticsearch exercises into one cohesive portfolio:

1. **Elasticsearch Book Load**
   - Download a plain-text Gutenberg book.
   - Split into passages.
   - Index into Elasticsearch with an `offset` and `content`.

2. **Elasticsearch Email Load**
   - Read at least 100 messages from an mbox feed (`sakai.devel`).
   - Parse basic email headers / body.
   - Index messages into Elasticsearch.

3. **Elasticsearch Tweets**
   - Index a small set of short texts ("tweets").
   - Use fields like `author`, `type`, `text`, `timestamp`.

The common pattern:

- Use `hidden.elastic()` to obtain connection/credential details.
- Create an Elasticsearch client configured with `url_prefix` (i.e. `/elasticsearch`).
- Delete the existing index (`pg4e_6b74d49971`) before indexing.
- Index documents and verify via a simple search query.
