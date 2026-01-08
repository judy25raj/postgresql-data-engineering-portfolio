-- ==========================================
-- Part 4: GIN ts_vector Index (docs03 / fulltext03)
-- ==========================================

-- Assumes docs03 is already populated as in 03_docs03_gin_array.sql

-- Create full-text GIN index
DROP INDEX IF EXISTS fulltext03;

CREATE INDEX fulltext03
ON docs03
USING gin (to_tsvector('english', doc));

-- Query & EXPLAIN (run manually in psql)
-- SELECT id, doc
-- FROM docs03
-- WHERE to_tsquery('english', 'conversation')
--       @@ to_tsvector('english', doc);
--
-- EXPLAIN SELECT id, doc
-- FROM docs03
-- WHERE to_tsquery('english', 'conversation')
--       @@ to_tsvector('english', doc);
