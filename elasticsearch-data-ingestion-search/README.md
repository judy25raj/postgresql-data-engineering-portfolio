# Project 7: Elasticsearch Book, Email & Tweet Indexing (Professional Portfolio Project)

This project demonstrates integrating **Python** with **Elasticsearch** for text indexing and search,
based on three classic PG4E assignments:

1. **Book Load (elasticbook)** – Load a Gutenberg book from a URL into Elasticsearch.
2. **Email Load (elasticmail)** – Load at least the first 100 messages from an mbox feed.
3. **Tweet Load (elastictweet)** – Index a set of short text messages ("tweets").

All three use:

- A shared `hidden.py` configuration
- The `elasticsearch<7.14.0` Python client
- A single index named after the user: `YOUR_ELASTIC_USER`
- Clean re-runs by **deleting the index before loading**

This repository is structured as a **professional, GitHub-ready Elasticsearch portfolio project**.

---

## 🔧 Environment & Dependencies

Install the Elasticsearch Python client:

```bash
python -m pip install 'elasticsearch<7.14.0'
```

Project layout:

```text
PostgreSQL_Project_7_Elasticsearch_Portfolio/
├── README.md
├── docs/
│   ├── overview.md
│   ├── book_load_explanation.md
│   ├── email_load_explanation.md
│   └── tweets_load_explanation.md
├── src/
│   ├── hidden_template.py
│   ├── elastic_book_load.py
│   ├── elastic_email_load.py
│   └── elastic_tweets_load.py
└── results/
    └── sample_outputs.txt
```

---

## ⚙️ Setup `hidden.py`

Copy the template:

```bash
cd PostgreSQL_Project_7_Elasticsearch_Portfolio/src
cp hidden_template.py hidden.py
```

Edit `hidden.py` and fill in your real values:

```python
def elastic():
    return {
        "host": "www.pg4e.com",
        "prefix": "elasticsearch",
        "port": 443,
        "scheme": "https",
        "user": "YOUR_ELASTIC_USER",
        "pass": "YOUR_ELASTIC_PASSWORD_HERE",
    }
```

---

## ▶ How To Run Each Loader

From the `src/` folder:

```bash
python elastic_book_load.py        # Project: Elasticsearch Book Load
python elastic_email_load.py       # Project: Elasticsearch Email Load
python elastic_tweets_load.py      # Project: Elasticsearch Tweets
```

Each script:

- Uses `hidden.elastic()` to build the Elasticsearch client
- Deletes the index returned by `elastic()['user']` before loading
- Indexes data into that index
- Prints summary and sample search checks

---

## ✅ Skills Demonstrated

- Using the official `elasticsearch` Python client
- Index lifecycle: delete / create / index / search
- Indexing long-form text (book), semi-structured content (emails), and short-form text (tweets)
- Handling external data sources: HTTP text, mbox feed
- Using query_string queries to validate indexing (like `elastictool.py`)

You can describe this as:

> **“Search Engineering with Elasticsearch: Book, Email, and Tweet Indexing in Python”**

in your resume or portfolio.
