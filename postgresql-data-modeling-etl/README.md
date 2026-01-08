
# PostgreSQL Data Modeling & CSV ETL Pipeline (Professional Portfolio Project)

A complete PostgreSQL project demonstrating relational schema design, ETL pipeline, CSV ingestion,
Dockerized database environment, SQL validation, and professional documentation.

## 🚀 How to Run (Docker)
```
docker-compose up -d
psql -h localhost -p 5432 -U admin musicdb
```

Run SQL scripts:
```
\i sql/01_create_automagic.sql
\i sql/02_create_track_raw.sql
\i sql/03_create_ages.sql
\i sql/04_load_track_raw.sql
\i sql/05_demo_queries.sql
```
