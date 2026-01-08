# Book Load – Explanation

## Goal

Load a Gutenberg book from:

- `https://www.pg4e.com/gutenberg/cache/epub/18866/pg18866.txt`

Into an Elasticsearch index named after the user (`pg4e_6b74d49971`), with documents like:

```json
{
  "offset": 1237,
  "content": "This is a distinct eccentric from the ..."
}
```

The autograder will **search** for a term like `eccentric` and expects at least one hit.

## Approach

1. Use `requests` to download the text.
2. Split the text into logical chunks (e.g. paragraphs or fixed-size blocks).
3. For each chunk:
   - Maintain an `offset` (simple counter).
   - Store the text chunk in `content`.
4. Use `es.index(index=index_name, body=document)` to store each document.

Before loading, use:

```python
es.indices.delete(index=index_name, ignore=[400, 404])
```

to clear the index so the script is **repeatable**.
