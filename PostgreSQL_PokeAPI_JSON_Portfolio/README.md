# PostgreSQL Project 6: Loading JSON from PokéAPI (Professional Portfolio Project)

This project demonstrates how to:

- Consume a public REST API (PokéAPI)
- Store JSON responses directly into PostgreSQL using the `JSONB` type
- Automate ingestion of the **first 100 Pokémon** using a Python script
- Keep a clean, reproducible structure suitable for a GitHub portfolio

Assignment goal (from pg4e):

> Create a table `pokeapi(id INTEGER, body JSONB)` and load the first 100 Pokémon
> JSON documents from `https://pokeapi.co/api/v2/pokemon/1..100`.

---

## 🔧 How to Run (against pg.pg4e.com or local PostgreSQL)

1. **Create the table** in PostgreSQL:

```bash
psql -h pg.pg4e.com -p 5432 -U pg4e_6b74d49971 pg4e_6b74d49971
```

Then in `psql`:

```sql
\i sql/01_create_pokeapi_table.sql
```

2. **Install Python dependencies** (locally):

```bash
pip install requests psycopg2-binary python-dotenv
```

3. **Configure connection settings**

Create a `.env` file (not committed) next to `src/fetch_pokeapi.py`:

```env
PGHOST=pg.pg4e.com
PGPORT=5432
PGDATABASE=pg4e_6b74d49971
PGUSER=pg4e_6b74d49971
PGPASSWORD=your_password_here
```

4. **Run the loader script**

From the project root:

```bash
python src/fetch_pokeapi.py
```

The script will:

- Connect to the database
- Optionally clear existing rows in `pokeapi`
- Fetch Pokémon `1..100` from PokéAPI
- Insert each JSON body into the `pokeapi` table

5. **Verify in SQL**

```sql
SELECT id, jsonb_pretty(body) AS pokemon
FROM pokeapi
ORDER BY id
LIMIT 5;
```

---

## ✅ Skills Demonstrated

- Python + `requests` for REST API consumption
- PostgreSQL `JSONB` storage
- Parameterized SQL with `psycopg2`
- Environment-based configuration using `.env`
- Clean logging and basic error handling

You can present this as:

> **“PokéAPI JSON Ingestion: Python + PostgreSQL JSONB Project”**

in your resume and GitHub portfolio.
