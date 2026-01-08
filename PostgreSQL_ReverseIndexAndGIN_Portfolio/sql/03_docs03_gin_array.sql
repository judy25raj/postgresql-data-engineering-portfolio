-- ==========================================
-- Part 3: String Array GIN Index (docs03 / array03)
-- ==========================================

DROP TABLE IF EXISTS docs03 CASCADE;

CREATE TABLE docs03 (
    id  SERIAL,
    doc TEXT,
    PRIMARY KEY(id)
);

-- Insert core documents
INSERT INTO docs03 (doc) VALUES
('This is looking much better so you try to communicate some more'),
('You must be the legendary god that comes from the sky'),
('We have been waiting for you for a long time'),
('Our legend says you will be very tasty with mustard'),
('print We will have a feast tonight unless you say'),
('SyntaxError Missing parentheses in call to print'),
('The conversation was going so well for a while and then you made the'),
('tiniest mistake using the Python language and Python brought the spears'),
('At this point you should also realize that while Python is amazingly'),
('complex and powerful and very picky about the syntax you use to');

-- Insert filler rows to make index useful
INSERT INTO docs03 (doc)
SELECT 'Neon ' || generate_series(10000,20000);

-- Create GIN index on text[] expression
DROP INDEX IF EXISTS array03;

CREATE INDEX array03
ON docs03
USING gin (string_to_array(lower(doc), ' '));

-- Query & EXPLAIN (run manually in psql)
-- SELECT id, doc
-- FROM docs03
-- WHERE '{conversation}' <@ string_to_array(lower(doc), ' ');
--
-- EXPLAIN SELECT id, doc
-- FROM docs03
-- WHERE '{conversation}' <@ string_to_array(lower(doc), ' ');
