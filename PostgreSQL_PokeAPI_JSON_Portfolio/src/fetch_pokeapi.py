import os
import json
import time
import requests
import psycopg2
from psycopg2.extras import register_default_jsonb
from dotenv import load_dotenv

# Load environment variables from .env if present
load_dotenv()

PGHOST = os.getenv("PGHOST", "pg.pg4e.com")
PGPORT = os.getenv("PGPORT", "5432")
PGDATABASE = os.getenv("PGDATABASE", "pg4e_XXXX")  # replace XXXX as needed
PGUSER = os.getenv("PGUSER", "pg4e_XXXX")          # replace XXXX as needed
PGPASSWORD = os.getenv("PGPASSWORD", "")

POKEAPI_BASE = "https://pokeapi.co/api/v2/pokemon"

def get_connection():
    conn = psycopg2.connect(
        host=PGHOST,
        port=PGPORT,
        database=PGDATABASE,
        user=PGUSER,
        password=PGPASSWORD,
    )
    return conn

def main():
    print("Connecting to PostgreSQL...")
    conn = get_connection()
    conn.autocommit = False  # we'll commit at the end
    cur = conn.cursor()

    # Ensure table exists (safe if already created)
    cur.execute(
        """CREATE TABLE IF NOT EXISTS pokeapi (
                id   INTEGER,
                body JSONB
            );"""
    )

    # Optional: clear out prior data so the script is repeatable
    print("Clearing existing data from pokeapi...")
    cur.execute("DELETE FROM pokeapi;")

    # Register JSONB handler for psycopg2 (optional but good practice)
    register_default_jsonb(loads=json.loads, globally=True)

    try:
        for poke_id in range(1, 101):
            url = f"{POKEAPI_BASE}/{poke_id}"
            print(f"Fetching Pokémon {poke_id} from {url} ...")
            resp = requests.get(url, timeout=10)
            resp.raise_for_status()

            data = resp.json()

            # Insert JSON document
            cur.execute(
                "INSERT INTO pokeapi (id, body) VALUES (%s, %s);",
                (poke_id, json.dumps(data)),
            )

            # Be polite to the public API – small delay
            time.sleep(0.1)

        conn.commit()
        print("Successfully inserted 100 Pokémon JSON documents into pokeapi.")

    except Exception as e:
        conn.rollback()
        print("Error occurred, transaction rolled back.")
        print("Details:", e)

    finally:
        cur.close()
        conn.close()
        print("Connection closed.")

if __name__ == "__main__":
    main()
