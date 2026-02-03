<h1 align="center">PostgreSQL Relationships – Many-to-One Normalization</h1>

<p align="center">
  Relational Modeling • Normalization • ETL • Referential Integrity
</p>

<hr/>

## 🧠 Overview
This project demonstrates how to design and normalize many-to-one relationships in PostgreSQL using real-world datasets.

It covers three independent normalization scenarios, each transforming denormalized data into clean, relational schemas with foreign keys, constraints, and analytics-ready structures.

## 🎯 Capabilities Demonstrated
- Many-to-one relational schema design  
- Data normalization from flat/denormalized sources  
- Foreign key constraints & referential integrity  
- SQL-only ETL pipelines  
- Validation and reporting queries  

## 🗂️ Normalization Scenarios

| Domain | Relationship |
|--------|-------------|
| Automobiles | Make → Model |
| Music Library | Album → Track |
| UNESCO Sites | Category/State/Region/ISO → Site |

## 📂 Project Structure
```
postgresql-relationships-many-to-one/
├── README.md
├── docs/
├── sql/
├── results/
```

## ▶ How to Run
```bash
psql -h pg.pg4e.com -p 5432 -U <user> <database>
```

Run scripts in sql/ in order.

## 🧠 Data Engineering Value
- Enforces data consistency  
- Reduces duplication  
- Improves query performance  
- Supports scalable analytics
