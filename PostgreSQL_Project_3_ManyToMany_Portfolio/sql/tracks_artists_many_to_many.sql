
-- ===================================================
-- Project 3 – Part 2: Tracks + Artists Many-to-Many
-- ===================================================

-- Drop any existing tables to allow re-runs
DROP TABLE IF EXISTS tracktoartist CASCADE;
DROP TABLE IF EXISTS artist CASCADE;
DROP TABLE IF EXISTS track CASCADE;
DROP TABLE IF EXISTS album CASCADE;

-- 1. Create normalized tables

CREATE TABLE album (
    id SERIAL,
    title VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE track (
    id SERIAL,
    title TEXT,
    artist TEXT,
    album TEXT,
    album_id INTEGER REFERENCES album(id) ON DELETE CASCADE,
    count INTEGER,
    rating INTEGER,
    len INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE artist (
    id SERIAL,
    name VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE tracktoartist (
    id SERIAL,
    track VARCHAR(128),         -- temporary text column
    track_id INTEGER REFERENCES track(id) ON DELETE CASCADE,
    artist VARCHAR(128),        -- temporary text column
    artist_id INTEGER REFERENCES artist(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);

-- 2. Load raw CSV data into track table (run in psql)
-- NOTE: Run this from the folder where library.csv is located.
-- \copy track(title,artist,album,count,rating,len)
--   FROM 'library.csv'
--   WITH DELIMITER ',' CSV;

-- 3. Populate album table from distinct album names
INSERT INTO album (title)
SELECT DISTINCT album
FROM track
WHERE album IS NOT NULL
ON CONFLICT DO NOTHING;

-- 4. Set foreign key album_id in track
UPDATE track
SET album_id = (
    SELECT album.id
    FROM album
    WHERE album.title = track.album
);

-- 5. Populate tracktoartist with distinct (track, artist) text pairs
INSERT INTO tracktoartist (track, artist)
SELECT DISTINCT title AS track, artist
FROM track
WHERE artist IS NOT NULL;

-- 6. Populate artist table from distinct artist names
INSERT INTO artist (name)
SELECT DISTINCT artist
FROM tracktoartist
WHERE artist IS NOT NULL
ON CONFLICT DO NOTHING;

-- 7. Set track_id in tracktoartist using track.title
UPDATE tracktoartist
SET track_id = (
    SELECT track.id
    FROM track
    WHERE track.title = tracktoartist.track
);

-- 8. Set artist_id in tracktoartist using artist.name
UPDATE tracktoartist
SET artist_id = (
    SELECT artist.id
    FROM artist
    WHERE artist.name = tracktoartist.artist
);

-- 9. Drop denormalized text columns

ALTER TABLE track DROP COLUMN album;
ALTER TABLE track DROP COLUMN artist;

ALTER TABLE tracktoartist DROP COLUMN track;
ALTER TABLE tracktoartist DROP COLUMN artist;

-- 10. Verification query (matches autograder)
SELECT track.title, album.title, artist.name
FROM track
JOIN album ON track.album_id = album.id
JOIN tracktoartist ON track.id = tracktoartist.track_id
JOIN artist ON tracktoartist.artist_id = artist.id
ORDER BY track.title
LIMIT 3;
