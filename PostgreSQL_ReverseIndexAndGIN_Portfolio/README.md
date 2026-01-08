# PostgreSQL Project 5: Reverse Indexes & GIN Search (Professional Portfolio Project)

This project demonstrates **natural-language style indexing in PostgreSQL** using:

1. A **reverse (inverted) index** built in pure SQL (docs01 / invert01).
2. A reverse index with **stop words** removed (docs02 / invert02).
3. A **GIN-based text[] index** using `string_to_array(lower(doc), ' ')` for word lookups.
4. A **GIN-based full-text search index** using `to_tsvector` / `to_tsquery`.

It is structured as a standalone, professional portfolio project you can publish to GitHub.

---

## 🔧 How to Run (Course DB or Local)

**Course DB:**

```bash
psql -h pg.pg4e.com -p 5432 -U pg4e_6b74d49971 pg4e_6b74d49971
```

**Local DB example:**

```bash
createdb pg4e_project5
psql pg4e_project5
```

Then inside `psql`, run the SQL scripts from the `sql/` directory, for example:

```sql
\i sql/01_docs01_invert01.sql
\i sql/02_docs02_invert02_with_stopwords.sql
\i sql/03_docs03_gin_array.sql
\i sql/04_docs03_gin_tsvector.sql
```

---

## 📂 Repository Structure

```text
PostgreSQL_Project_5_ReverseIndexAndGIN_Portfolio/
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

---

## ✅ Skills Demonstrated

- Tokenizing text in SQL using `string_to_array`.
- Normalizing tokens to **lowercase** for case-insensitive indexing.
- Building an **inverted index** (word → set of docs) using SQL only.
- Implementing **stop-word filtering** with a lookup table.
- Creating and using **GIN indexes** on `text[]` and `tsvector`.
- Using `EXPLAIN` to verify index usage instead of sequential scans.

You can refer to this as:

> **“PostgreSQL Natural Language Indexing: Reverse Index & GIN Search”**

on your resume / LinkedIn / portfolio.
