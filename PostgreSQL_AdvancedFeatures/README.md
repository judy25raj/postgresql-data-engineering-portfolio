# PostgreSQL Project 4: Triggers, Regex, Bulk Text & Hash Puzzle (Professional Portfolio Project)

This project demonstrates several *intermediate to advanced* PostgreSQL and data-thinking skills:

1. **Audit-style trigger** to auto-update `updated_at` on row modification.  
2. **Regular expression filtering** on a large text dataset (`taxdata.purpose`).  
3. **Bulk text generation** using PL/pgSQL and loops (100,000 rows).  
4. **Hash collision puzzle** using a simple custom hash function (conceptual security thinking).

This is designed as a **standalone, portfolio-ready project** you can publish on GitHub.

---

## 🔧 Environment

You can run this project either:

- Against the course database: `pg.pg4e.com`, or  
- On any local PostgreSQL instance (recommended for portfolio use).

Example connection (course DB):

```bash
psql -h pg.pg4e.com -p 5432 -U pg4e_6b74d49971 pg4e_6b74d49971
```

Example local connection:

```bash
createdb pg4e_project4
psql pg4e_project4
```

---

## 📂 Repository Structure

```text
PostgreSQL_Project_4_AdvancedFeatures/
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

---

## ▶ How to Run

Inside `psql`:

```sql
\i sql/01_keyvalue_trigger.sql
\i sql/03_bigtext_generate.sql
```

The regex portion uses the readonly database and is documented in `docs/02_regex_explanation.md`.

Read `puzzles/hash_collision_notes.txt` for the hash collision explanation and example.

---

## ✅ Skills Demonstrated

- Writing **PL/pgSQL trigger functions** (`RETURNS TRIGGER`)  
- Using **BEFORE UPDATE triggers** to maintain audit metadata  
- Applying **PostgreSQL regular expressions** for text mining  
- Generating **large synthetic datasets** with PL/pgSQL loops  
- Understanding **hash functions**, collisions, and basic security mindset  

You can present this as:  
> “PostgreSQL Advanced Features: Triggers, Text Processing & Hash Collisions”  
on your resume or LinkedIn.
