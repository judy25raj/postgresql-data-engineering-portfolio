<h1 align="center">PostgreSQL Advanced Features & Data Processing</h1>

<p align="center">
  Triggers • Text Processing • Bulk Data • Conceptual Security
</p>

<hr/>

## 🧠 Overview
This project demonstrates advanced PostgreSQL capabilities through practical data and logic exercises, including trigger-based auditing, large-scale text processing, bulk data generation, and a conceptual hash collision puzzle.

It showcases how PostgreSQL can support data integrity, automation, analytics, and security-oriented thinking beyond basic queries.

## 🎯 Capabilities Demonstrated
- Audit-style triggers to automatically update metadata  
- Regular expression filtering on large text datasets  
- Bulk synthetic data generation using PL/pgSQL loops  
- Conceptual hash collision analysis for security awareness  

## 🛠 Environment
- Local PostgreSQL (recommended)
- Course-hosted PostgreSQL

```bash
createdb pg_project4
psql pg_project4
```

## 📂 Project Structure
```
postgresql-advanced-features/
├── README.md
├── docs/
│   ├── 01_keyvalue_trigger_explanation.md
│   ├── 02_regex_explanation.md
│   ├── 03_bigtext_explanation.md
│   └── 04_hash_puzzle_explanation.md
├── sql/
│   ├── 01_keyvalue_trigger.sql
│   ├── 02_regex_example.sql
│   └── 03_bigtext_generate.sql
├── puzzles/
│   └── hash_collision_notes.txt
└── results/
    └── sample_outputs.txt
```

## ▶ How to Run
```sql
\i sql/01_keyvalue_trigger.sql
\i sql/03_bigtext_generate.sql
```

## 🧠 Data Engineering Value
- Enforces data consistency with automation  
- Processes large text datasets  
- Generates scalable test data  
- Applies security concepts at the data layer  
