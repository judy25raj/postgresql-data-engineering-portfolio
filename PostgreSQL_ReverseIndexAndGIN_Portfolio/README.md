<h1 align="center">PostgreSQL Natural Language Indexing: Reverse Index & GIN Search</h1>

<p align="center">
  Inverted Indexing • GIN Search • Full-Text Search • Performance Tuning
</p>

<hr/>

## 🧠 Overview
This project demonstrates how PostgreSQL can be used as a search and text analytics engine by implementing reverse (inverted) indexes and GIN-based full-text search.

It covers both SQL-only indexing strategies and native PostgreSQL indexing mechanisms to support fast word and document lookups.

## 🎯 Capabilities Demonstrated
- Building reverse (inverted) indexes using pure SQL  
- Removing stop-words for cleaner search indexes  
- Creating GIN indexes on `text[]` columns  
- Implementing PostgreSQL full-text search with `tsvector`  
- Validating performance using `EXPLAIN`  

## 🛠 Environment
```bash
createdb pg_project5
psql pg_project5
```

## 📂 Project Structure
```
postgresql-reverseindex-gin/
├── README.md
├── docs/
│   ├── overview.md
│   ├── reverse_index_basic.md
│   ├── reverse_index_stopwords.md
│   ├── gin_array_index.md
│   └── gin_tsvector_index.md
├── sql/
│   ├── 01_docs01_invert01.sql
│   ├── 02_docs02_invert02_with_stopwords.sql
│   ├── 03_docs03_gin_array.sql
│   └── 04_docs03_gin_tsvector.sql
└── results/
    └── sample_outputs.txt
```

## ▶ How to Run
```sql
\i sql/01_docs01_invert01.sql
\i sql/02_docs02_invert02_with_stopwords.sql
\i sql/03_docs03_gin_array.sql
\i sql/04_docs03_gin_tsvector.sql
```

## 🧠 Data Engineering Value
- Enables natural-language search directly in PostgreSQL  
- Reduces query latency using indexing strategies  
- Supports scalable analytics over text-heavy datasets  
