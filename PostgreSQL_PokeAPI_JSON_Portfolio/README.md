<h1 align="center">PostgreSQL JSON & API Ingestion (PokéAPI)</h1>

<p align="center">
  API Integration • JSONB Storage • Python ETL • Semi-Structured Data
</p>

<hr/>

## 🧠 Overview
This project demonstrates how to ingest semi-structured data from a public REST API into PostgreSQL using the **JSONB** data type.

A Python-based ingestion pipeline fetches records from the PokéAPI and stores them as JSON documents, enabling flexible querying and analytics on nested data structures.

## 🎯 Capabilities Demonstrated
- REST API consumption using Python  
- Automated ingestion of JSON into PostgreSQL  
- Storage and querying with JSONB  
- Parameterized SQL and secure connection handling  

## 🛠 Environment
The project can be executed against:

- A local PostgreSQL instance (recommended)  
- A course-hosted PostgreSQL database  

**Local example:**
```bash
createdb pokeapi_db
psql pokeapi_db
