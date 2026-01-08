-- ==========================================
-- Part 2: Regular expression example (readonly DB)
-- This script is informational; it should be run
-- against the 'readonly' database provided by the course.
-- ==========================================

-- Connect:
-- psql -h pg.pg4e.com -p 5432 -U readonly readonly

-- Schema:
--  taxdata(purpose TEXT, ...)

-- Find all rows where:
-- - First character is uppercase [A-Z]
-- - Second character is lowercase [a-z]

SELECT purpose
FROM taxdata
WHERE purpose ~ '^[A-Z][a-z]'
ORDER BY purpose DESC
LIMIT 10;
