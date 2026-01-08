-- Project 6: PokéAPI JSON table

CREATE TABLE IF NOT EXISTS pokeapi (
    id   INTEGER,
    body JSONB
);

-- Optional: clear existing data when developing
-- DELETE FROM pokeapi;
