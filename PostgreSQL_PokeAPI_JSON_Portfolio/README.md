<h1 align="center">PostgreSQL JSON & API Ingestion (PokéAPI)</h1>

<p align="center">
  API Integration • JSONB Storage • Python ETL • Semi-Structured Data
</p>

<hr/>

## 🧠 Overview
This project demonstrates ingestion of semi-structured data from a public REST API into PostgreSQL using the JSONB data type.

A Python pipeline fetches records from PokéAPI and stores them as JSON documents, enabling analytics on nested data.

## 🎯 Capabilities Demonstrated
- REST API consumption  
- Automated JSON ingestion  
- JSONB storage and querying  
- Parameterized SQL  

## 🛠 Environment
```bash
createdb pokeapi_db
psql pokeapi_db
```

## 📂 Project Structure
```
postgresql-json-api-ingestion/
├── README.md
├── docs/
├── sql/
│   └── 01_create_pokeapi_table.sql
├── src/
│   └── fetch_pokeapi.py
└── results/
```

## ▶ How to Run
```sql
\i sql/01_create_pokeapi_table.sql
```

```bash
pip install requests psycopg2-binary python-dotenv
python src/fetch_pokeapi.py
```

## 🧠 Data Engineering Value
Enables hybrid analytics on semi-structured data inside relational systems.
