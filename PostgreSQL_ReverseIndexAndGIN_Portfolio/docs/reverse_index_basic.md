# Reverse Index (docs01 / invert01) – Explanation

## Goal

Build a **reverse index** that maps each unique word (lowercased) to the `doc_id` values of documents that contain that word.

Tables:

```sql
CREATE TABLE docs01 (
    id  SERIAL,
    doc TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE invert01 (
  keyword TEXT,
  doc_id  INTEGER REFERENCES docs01(id) ON DELETE CASCADE
);
```

## Steps

1. Insert the 10 one-line documents into `docs01`.
2. Tokenize each `doc` into words.
3. Normalize each token:
   - Convert to lowercase.
   - Strip punctuation using `regexp_replace`.
4. Insert **distinct** `(keyword, doc_id)` pairs into `invert01`.

## Example Population Query

```sql
INSERT INTO invert01 (keyword, doc_id)
SELECT DISTINCT
       regexp_replace(lower(word), '[^a-z0-9]+', '', 'g') AS keyword,
       d.id AS doc_id
FROM docs01 AS d,
     unnest(string_to_array(d.doc, ' ')) AS word
WHERE regexp_replace(lower(word), '[^a-z0-9]+', '', 'g') <> '';
```

This builds an inverted index mapping each normalized word to the document IDs where it appears.

## Verification

```sql
SELECT keyword, doc_id
FROM invert01
ORDER BY keyword, doc_id
LIMIT 10;
```

You should see output like:

```text
keyword   | doc_id
----------+-------
a         | 3
a         | 5
a         | 7
about     | 10
also      | 9
amazingly | 9
and       | 7
and       | 8
and       | 10
at        | 9
```
