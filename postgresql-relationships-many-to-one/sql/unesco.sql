
-- UNESCO NORMALIZATION

DROP TABLE IF EXISTS unesco;
DROP TABLE IF EXISTS unesco_raw;

CREATE TABLE unesco_raw
 (name TEXT, description TEXT, justification TEXT, year INTEGER,
    longitude FLOAT, latitude FLOAT, area_hectares FLOAT,
    category TEXT, category_id INTEGER, 
    state TEXT, state_id INTEGER,
    region TEXT, region_id INTEGER,
    iso TEXT, iso_id INTEGER);

-- Load CSV manually:
-- \copy unesco_raw(name,description,justification,year,longitude,latitude,area_hectares,category,state,region,iso)
-- FROM 'whc-sites-2018-small.csv' WITH DELIMITER ',' CSV HEADER;

CREATE TABLE category (id SERIAL PRIMARY KEY, name VARCHAR(128) UNIQUE);
CREATE TABLE state    (id SERIAL PRIMARY KEY, name VARCHAR(128) UNIQUE);
CREATE TABLE region   (id SERIAL PRIMARY KEY, name VARCHAR(128) UNIQUE);
CREATE TABLE iso      (id SERIAL PRIMARY KEY, name VARCHAR(128) UNIQUE);

INSERT INTO category (name)
SELECT DISTINCT category FROM unesco_raw WHERE category IS NOT NULL
ON CONFLICT DO NOTHING;

INSERT INTO state (name)
SELECT DISTINCT state FROM unesco_raw WHERE state IS NOT NULL
ON CONFLICT DO NOTHING;

INSERT INTO region (name)
SELECT DISTINCT region FROM unesco_raw WHERE region IS NOT NULL
ON CONFLICT DO NOTHING;

INSERT INTO iso (name)
SELECT DISTINCT iso FROM unesco_raw WHERE iso IS NOT NULL
ON CONFLICT DO NOTHING;

UPDATE unesco_raw SET category_id = (SELECT id FROM category WHERE category.name = unesco_raw.category);
UPDATE unesco_raw SET state_id    = (SELECT id FROM state    WHERE state.name    = unesco_raw.state);
UPDATE unesco_raw SET region_id   = (SELECT id FROM region   WHERE region.name   = unesco_raw.region);
UPDATE unesco_raw SET iso_id      = (SELECT id FROM iso      WHERE iso.name      = unesco_raw.iso);

CREATE TABLE unesco AS
SELECT 
  name, description, justification, year,
  longitude, latitude, area_hectares,
  category_id, state_id, region_id, iso_id
FROM unesco_raw;

-- Verification
SELECT unesco.name, year, category.name, state.name, region.name, iso.name
FROM unesco
JOIN category ON unesco.category_id = category.id
JOIN iso ON unesco.iso_id = iso.id
JOIN state ON unesco.state_id = state.id
JOIN region ON unesco.region_id = region.id
ORDER BY state.name, unesco.name
LIMIT 3;
