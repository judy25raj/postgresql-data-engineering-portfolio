-- ==========================================
-- Part 3: Generate 100,000 text records
-- ==========================================

DROP TABLE IF EXISTS bigtext;

CREATE TABLE bigtext (
    content TEXT
);

DO $$
BEGIN
  FOR i IN 100000..199999 LOOP
    INSERT INTO bigtext(content)
    VALUES ('This is record number ' || i || ' of quite a few text records.');
  END LOOP;
END
$$;

-- Quick validation:
-- SELECT COUNT(*) FROM bigtext;   -- expect 100000
-- SELECT * FROM bigtext ORDER BY content LIMIT 5;
