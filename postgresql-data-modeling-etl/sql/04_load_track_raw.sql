
\copy track_raw(title, artist, album, count, rating, len)
FROM 'data/library_sample.csv'
WITH (FORMAT csv, HEADER true);
