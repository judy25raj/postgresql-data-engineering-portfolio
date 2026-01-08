# PokéAPI JSON Loading – Project Explanation

## Objective

The goal is to:

1. Create a PostgreSQL table:

```sql
CREATE TABLE IF NOT EXISTS pokeapi (
    id   INTEGER,
    body JSONB
);
```

2. Write a Python script that:
   - Loops from 1 to 100
   - Calls `https://pokeapi.co/api/v2/pokemon/<id>`
   - Stores each JSON document in the `pokeapi` table

The autograder for the course simply checks that *some* valid JSON data for these Pokémon has been stored in rows in the `pokeapi` table.

---

## Design Choices

### 1. Table Design

The table is intentionally minimal to match the assignment:

- `id` – the numeric Pokémon ID from the URL
- `body` – full JSON payload as `JSONB`

Script uses a `DELETE FROM pokeapi;` at the start so it can be re-run safely.

---

### 2. Python Script Design

The Python script:

- Uses `requests` to fetch each Pokémon JSON
- Uses `psycopg2` for PostgreSQL access
- Reads connection settings from environment variables (or `.env`)
- Logs progress every few IDs
- Handles HTTP and database errors with basic try/except blocks

Key loop:

```python
for poke_id in range(1, 101):
    url = f"https://pokeapi.co/api/v2/pokemon/{poke_id}"
    resp = requests.get(url, timeout=10)
    data = resp.json()
    cur.execute(
        "INSERT INTO pokeapi (id, body) VALUES (%s, %s)",
        (poke_id, json.dumps(data))
    )
```

---

### 3. Verification

You can run:

```sql
SELECT id,
       body->>'name' AS name,
       jsonb_array_length(body->'abilities') AS ability_count
FROM pokeapi
ORDER BY id
LIMIT 10;
```

This proves that:

- The JSON is parsed correctly by PostgreSQL
- You can query inside JSONB using operators (`->`, `->>`)
