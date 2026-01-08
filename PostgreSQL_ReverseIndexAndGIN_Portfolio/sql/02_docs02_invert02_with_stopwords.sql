-- ====================================================
-- Part 2: Reverse Index with Stop Words (docs02 / invert02)
-- ====================================================

DROP TABLE IF EXISTS invert02 CASCADE;
DROP TABLE IF EXISTS docs02 CASCADE;
DROP TABLE IF EXISTS stop_words CASCADE;

CREATE TABLE docs02 (
    id  SERIAL,
    doc TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE invert02 (
  keyword TEXT,
  doc_id  INTEGER REFERENCES docs02(id) ON DELETE CASCADE
);

CREATE TABLE stop_words (
  word TEXT UNIQUE
);

INSERT INTO stop_words (word) VALUES 
('i'), ('a'), ('about'), ('an'), ('are'), ('as'), ('at'), ('be'), 
('by'), ('com'), ('for'), ('from'), ('how'), ('in'), ('is'), ('it'), ('of'), 
('on'), ('or'), ('that'), ('the'), ('this'), ('to'), ('was'), ('what'), 
('when'), ('where'), ('who'), ('will'), ('with');

-- Insert same documents as docs01
INSERT INTO docs02 (doc) VALUES
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

-- Populate inverted index, ignoring stop words
INSERT INTO invert02 (keyword, doc_id)
SELECT DISTINCT
       kw AS keyword,
       d.id AS doc_id
FROM docs02 AS d,
     LATERAL (
       SELECT regexp_replace(lower(w), '[^a-z0-9]+', '', 'g') AS kw
       FROM unnest(string_to_array(d.doc, ' ')) AS w
     ) AS t
WHERE kw <> ''
  AND kw NOT IN (SELECT word FROM stop_words);

-- Verification sample
-- SELECT keyword, doc_id FROM invert02 ORDER BY keyword, doc_id LIMIT 10;
