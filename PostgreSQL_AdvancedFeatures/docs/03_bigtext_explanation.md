# Big Text Generation – Explanation

## Goal

Create a table `bigtext(content TEXT)` and insert 100,000 rows with text like:

```text
This is record number 100000 of quite a few text records.
...
This is record number 199999 of quite a few text records.
```

We use a PL/pgSQL `DO` block and a `FOR` loop to generate synthetic data.

This demonstrates:

- Server-side loops in PL/pgSQL
- Efficient bulk insertion logic
- Generating realistic demo/test data inside the database
