-- ==========================================
-- Part 1: Reverse Index (docs01 / invert01)
-- ==========================================

DROP TABLE IF EXISTS invert01 CASCADE;
DROP TABLE IF EXISTS docs01 CASCADE;

CREATE TABLE docs01 (
    id  SERIAL,
    doc TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE invert01 (
  keyword TEXT,
  doc_id  INTEGER REFERENCES docs01(id) ON DELETE CASCADE
);

-- Insert documents
INSERT INTO docs01 (doc) VALUES
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

-- Populate inverted index, lowercasing and stripping punctuation
INSERT INTO invert01 (keyword, doc_id)
SELECT DISTINCT
       regexp_replace(lower(word), '[^a-z0-9]+', '', 'g') AS keyword,
       d.id AS doc_id
FROM docs01 AS d,
     unnest(string_to_array(d.doc, ' ')) AS word
WHERE regexp_replace(lower(word), '[^a-z0-9]+', '', 'g') <> '';

-- Verification sample
-- SELECT keyword, doc_id FROM invert01 ORDER BY keyword, doc_id LIMIT 10;
