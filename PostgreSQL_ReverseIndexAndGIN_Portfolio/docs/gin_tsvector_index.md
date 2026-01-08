# GIN ts_vector Index (docs03 / fulltext03) – Explanation

## Goal

Use PostgreSQL’s full-text search to find documents containing “conversation” with:

```sql
SELECT id, doc
FROM docs03
WHERE to_tsquery('english', 'conversation')
      @@ to_tsvector('english', doc);
```

and ensure it uses a **GIN index** rather than a sequential scan.

## Schema

We reuse `docs03` from the previous section. If needed:

```sql
CREATE TABLE docs03 (
    id  SERIAL,
    doc TEXT,
    PRIMARY KEY(id)
);
```

Same 10 documents + filler rows are inserted as before.

## GIN Full-text Index

```sql
CREATE INDEX fulltext03
ON docs03
USING gin (to_tsvector('english', doc));
```

## Query & EXPLAIN

```sql
SELECT id, doc
FROM docs03
WHERE to_tsquery('english', 'conversation')
      @@ to_tsvector('english', doc);

EXPLAIN SELECT id, doc
FROM docs03
WHERE to_tsquery('english', 'conversation')
      @@ to_tsvector('english', doc);
```

Once the index build finishes, the plan should show:

- `Bitmap Index Scan` on `fulltext03`
- `Bitmap Heap Scan` on `docs03`

This demonstrates **full-text search** with GIN in PostgreSQL.
