<h1 align="center">PostgreSQL Relationships – Many-to-Many Modeling</h1>

<p align="center">
  Relational Modeling • Junction Tables • Normalization • SQL-Only ETL
</p>

<hr/>

## 🧠 Overview
This project demonstrates how to design and implement many-to-many relationships using normalized schemas and junction tables.

Scenarios:
- Course roster with roles  
- Music tracks with multiple artists  

## 🎯 Capabilities Demonstrated
- Junction tables  
- Referential integrity  
- SQL-only ETL  

## 🛠 Environment
```bash
createdb m2m_db
psql m2m_db
```

## 📂 Project Structure
```
postgresql-relationships-many-to-many/
├── README.md
├── docs/
├── sql/
│   ├── roster_many_to_many.sql
│   └── tracks_artists_many_to_many.sql
└── results/
```

## ▶ How to Run
```sql
\i sql/roster_many_to_many.sql
\i sql/tracks_artists_many_to_many.sql
```

## 🧠 Data Engineering Value
Ensures scalable analytics with normalized relational design.
