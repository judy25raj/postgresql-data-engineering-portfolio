-- ==========================================
-- Part 1: keyvalue table + trigger
-- ==========================================

DROP TABLE IF EXISTS keyvalue CASCADE;

CREATE TABLE keyvalue ( 
  id SERIAL,
  key VARCHAR(128) UNIQUE,
  value VARCHAR(128) UNIQUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  PRIMARY KEY(id)
);

-- Trigger function to update 'updated_at' on UPDATE
CREATE OR REPLACE FUNCTION update_keyvalue_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger that calls the function
DROP TRIGGER IF EXISTS update_keyvalue_timestamp ON keyvalue;

CREATE TRIGGER update_keyvalue_timestamp
BEFORE UPDATE ON keyvalue
FOR EACH ROW
EXECUTE PROCEDURE update_keyvalue_timestamp();

-- Test example (optional):

-- INSERT INTO keyvalue(key, value) VALUES ('foo', 'bar');
-- SELECT * FROM keyvalue;
-- UPDATE keyvalue SET value = 'baz' WHERE key = 'foo';
-- SELECT * FROM keyvalue;
