
# PostgreSQL Project 3: Many-to-Many Relationships & Roster Modeling (Professional Portfolio Project)

This project showcases how to design and implement **many-to-many relationships** in PostgreSQL using:

1. **Course Roster** – Students enrolled in multiple courses, with roles (Instructor / Learner).  
2. **Musical Tracks + Artists** – Tracks that can have multiple artists, implemented via a junction table.

The project demonstrates:

- Relational data modeling (1–M and M–M)
- Junction (join) tables and foreign keys
- Normalization of CSV data using SQL only
- Use of `INSERT ... SELECT` and `UPDATE ...` with subqueries
- Cleanup of denormalized text columns using `ALTER TABLE`

This repository is designed as a **professional, portfolio-grade PostgreSQL project** you can publish on GitHub.

---

## 🔧 How to Run (Against pg.pg4e.com or Any PostgreSQL)

If using the course database:

```bash
psql -h pg.pg4e.com -p 5432 -U pg4e_6b74d49971 pg4e_6b74d49971
```

Then inside `psql`, from the project folder:

```sql
\i sql/roster_many_to_many.sql
\i sql/tracks_artists_many_to_many.sql
```

If running locally, adjust the `psql` connection string accordingly.

---

## 📁 Repository Structure

```text
PostgreSQL_Project_3_ManyToMany_Portfolio/
├── README.md
├── docs/
│   ├── overview.md
│   ├── roster_explanation.md
│   └── tracks_artists_explanation.md
├── sql/
│   ├── roster_many_to_many.sql
│   └── tracks_artists_many_to_many.sql
└── results/
    └── sample_outputs.txt
```

---

## ✅ Skills Demonstrated

- Many-to-many schema design with a junction table (`roster`, `tracktoartist`)
- Foreign key constraints and `ON DELETE CASCADE`
- Use of `UNIQUE` constraints to prevent duplicate relationships
- Migration from denormalized text columns to normalized foreign keys
- SQL-only ETL: `\copy`, `INSERT ... SELECT`, `UPDATE` with subqueries
- Verification queries that join across multiple tables

You can reference this as a **“Many-to-Many Data Modeling in PostgreSQL”** project on your resume or LinkedIn.
