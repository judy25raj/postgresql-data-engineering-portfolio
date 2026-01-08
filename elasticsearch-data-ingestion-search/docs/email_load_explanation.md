# Email Load – Explanation

## Goal

Read **at least the first 100 messages** from:

- `http://mbox.dr-chuck.net/sakai.devel/`

And index them into Elasticsearch in the same user index (`pg4e_6b74d49971`).

The autograder will search the index and verify that email-like data has been loaded.

## Approach

1. Download the mbox stream.
2. Use Python's standard library `mailbox` module to parse messages.
3. Extract fields such as:
   - `from`, `to`, `subject`, `date`, and `body`.
4. For each message (up to 100):
   - Build a JSON document.
   - Index into Elasticsearch.

We again delete the index before loading. While the course provides an example (`elasticmail.py`), the script here is written as a clean, self-contained loader suitable for a portfolio.
