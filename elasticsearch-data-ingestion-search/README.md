<h1 align="center">Search Engineering with Elasticsearch</h1>

<p align="center">
  Book • Email • Tweet Indexing • Python • Search Analytics
</p>

<hr/>

## 🧠 Overview
This project demonstrates building a full text search ingestion pipeline using Python and Elasticsearch.  
It indexes three different data sources—long-form books, email archives, and short text messages—into a single searchable index.

The solution reflects real-world search engineering patterns: ingestion, indexing, validation, and lifecycle management.

## 🎯 Capabilities Demonstrated
- Python integration with Elasticsearch
- Index lifecycle management (delete, create, re-index)
- Ingesting external data (HTTP, mbox, flat text)
- Query validation using full-text search
- Secure configuration via environment abstraction

## 📂 Project Structure
```
elasticsearch-data-ingestion-search/
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
├── results/
│   └── sample_outputs.txt
├── requirements.txt
└── SECURITY.md
```

## 🛠 Environment
```bash
pip install 'elasticsearch<7.14.0'
```

## ⚙️ Configuration
Create config file:

```bash
cd src
cp hidden_template.py hidden.py
```

Edit hidden.py:

```python
def elastic():
    return {
        "host": "www.pg4e.com",
        "prefix": "elasticsearch",
        "port": 443,
        "scheme": "https",
        "user": "YOUR_ELASTIC_USER",
        "pass": "YOUR_ELASTIC_PASSWORD",
    }
```

## ▶ How to Run
```bash
python elastic_book_load.py
python elastic_email_load.py
python elastic_tweets_load.py
```

## 🧠 Data Engineering Value
- Demonstrates hybrid search pipelines  
- Supports structured + unstructured analytics  
- Shows scalable ingestion & indexing design  
