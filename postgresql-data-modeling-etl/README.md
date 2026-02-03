<h1 align="center">PostgreSQL Data Modeling & CSV ETL Pipeline</h1>

<p align="center">
  Relational Modeling • ETL Pipelines • Docker • Data Validation
</p>

<hr/>

## 🧠 Overview
This project demonstrates an end-to-end data engineering workflow using PostgreSQL, covering schema design, CSV ingestion, transformation, validation, and reporting.

A Dockerized environment ensures reproducibility, while SQL-based ETL steps model a real production ingestion pipeline.

## 🎯 Capabilities Demonstrated
- Relational schema design with normalization  
- CSV ingestion and transformation  
- SQL-based ETL pipelines  
- Dockerized PostgreSQL environments  
- Data validation and reporting queries  

## 🛠 Environment (Docker)
```bash
docker-compose up -d
psql -h localhost -p 5432 -U admin musicdb
```

## 📂 Project Structure
```
postgresql-data-modeling-etl/
├── README.md
├── data/            # Raw CSV datasets
├── docs/            # Architecture & ETL explanations
├── results/         # Validation outputs
├── scripts/         # Automation helpers
├── sql/             # ETL SQL scripts
│   ├── 01_create_automagic.sql
│   ├── 02_create_track_raw.sql
│   ├── 03_create_ages.sql
│   ├── 04_load_track_raw.sql
│   └── 05_demo_queries.sql
└── docker-compose.yml
```

## ▶ How to Run
```sql
\i sql/01_create_automagic.sql
\i sql/02_create_track_raw.sql
\i sql/03_create_ages.sql
\i sql/04_load_track_raw.sql
\i sql/05_demo_queries.sql
```

## 🧠 Data Engineering Value
- Enables scalable ingestion of structured datasets  
- Enforces data quality through validation queries  
- Provides reproducible environments with Docker  
- Supports analytics-ready schema design  
