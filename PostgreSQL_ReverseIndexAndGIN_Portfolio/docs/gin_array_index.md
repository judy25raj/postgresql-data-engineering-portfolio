# GIN Array Index (docs03 / array03) – Explanation

## Goal

Use a **GIN index over a `text[]` expression** to accelerate word lookups of the form:

```sql
SELECT id, doc
FROM docs03
WHERE '{conversation}' <@ string_to_array(lower(doc), ' ');
```

We want PostgreSQL to use a **Bitmap Index Scan** via the GIN index instead of a sequential scan.

## Schema

```sql
CREATE TABLE docs03 (
    id  SERIAL,
    doc TEXT,
    PRIMARY KEY(id)
);
```

Insert the 10 main documents, then add filler rows to make the index useful:

```sql
INSERT INTO docs03 (doc) VALUES
('This is looking much better so you try to communicate some more'),
('You must be the legendary god that comes from the sky'),
('We have been waiting for you for a long time'),
('Our legend says you will be very tasty with mustard'),
('print We will have a feast tonight unless you say'),
('SyntaxError Missing parentheses in call to print'),
('The conversation was going so well for a while and then you made the'),
('tiniest mistake using the Python language and Python brought the spears'),
('At this point you should also realize that while Python is amazingly'),
('complex and powerful and very picky about the syntax you use to');

INSERT INTO docs03 (doc)
SELECT 'Neon ' || generate_series(10000,20000);
```

## GIN Index

```sql
CREATE INDEX array03
ON docs03
USING gin (string_to_array(lower(doc), ' '));
```

## Query & EXPLAIN

```sql
SELECT id, doc
FROM docs03
WHERE '{conversation}' <@ string_to_array(lower(doc), ' ');

EXPLAIN SELECT id, doc
FROM docs03
WHERE '{conversation}' <@ string_to_array(lower(doc), ' ');
```

Once the index is fully built, you should see a plan using:

- `Bitmap Index Scan` on `array03`
- `Bitmap Heap Scan` on `docs03`

instead of a `Seq Scan`.
