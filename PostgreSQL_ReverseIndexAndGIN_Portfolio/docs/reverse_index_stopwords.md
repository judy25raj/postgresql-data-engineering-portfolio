# Reverse Index with Stop Words (docs02 / invert02) – Explanation

## Goal

Build a reverse index as before, but **exclude stop words** such as “a”, “the”, “is”, etc.

Tables:

```sql
CREATE TABLE docs02 (
    id  SERIAL,
    doc TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE invert02 (
  keyword TEXT,
  doc_id  INTEGER REFERENCES docs02(id) ON DELETE CASCADE
);

CREATE TABLE stop_words (word TEXT UNIQUE);
```

Stop words are pre-populated:

```sql
INSERT INTO stop_words (word) VALUES 
('i'), ('a'), ('about'), ('an'), ('are'), ('as'), ('at'), ('be'), 
('by'), ('com'), ('for'), ('from'), ('how'), ('in'), ('is'), ('it'), ('of'), 
('on'), ('or'), ('that'), ('the'), ('this'), ('to'), ('was'), ('what'), 
('when'), ('where'), ('who'), ('will'), ('with');
```

## Population Query

```sql
INSERT INTO invert02 (keyword, doc_id)
SELECT DISTINCT
       kw AS keyword,
       d.id AS doc_id
FROM docs02 AS d,
     LATERAL (
       SELECT regexp_replace(lower(w), '[^a-z0-9]+', '', 'g') AS kw
       FROM unnest(string_to_array(d.doc, ' ')) AS w
     ) AS t
WHERE kw <> ''
  AND kw NOT IN (SELECT word FROM stop_words);
```

This builds an inverted index over non-stopwords only.

## Verification

```sql
SELECT keyword, doc_id
FROM invert02
ORDER BY keyword, doc_id
LIMIT 10;
```

Example expected output:

```text
keyword    | doc_id
-----------+--------
also       | 9
amazingly  | 9
and        | 7
and        | 8
and        | 10
been       | 3
better     | 1
brought    | 8
call       | 6
comes      | 2
```
