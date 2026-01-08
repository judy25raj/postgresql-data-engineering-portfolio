-- Sample verification queries for Project 6: PokéAPI

-- 1. Check row count (should be 100)
SELECT COUNT(*) AS total_rows FROM pokeapi;

-- 2. Inspect first few rows (pretty JSON)
SELECT id, jsonb_pretty(body) AS pokemon
FROM pokeapi
ORDER BY id
LIMIT 3;

-- 3. Extract some JSON fields
SELECT
    id,
    body->>'name' AS name,
    jsonb_array_length(body->'abilities') AS ability_count
FROM pokeapi
ORDER BY id
LIMIT 5;

/*
Example expected pattern of output (names & counts may vary as long as JSON is valid):

 total_rows
-----------
       100

 id |   name   | ability_count
----+----------+--------------
  1 | bulbasaur | 2
  2 | ivysaur   | 2
  3 | venusaur  | 3
 ...
*/
