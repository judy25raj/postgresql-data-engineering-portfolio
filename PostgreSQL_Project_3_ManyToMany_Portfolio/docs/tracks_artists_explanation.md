
# Musical Tracks + Artists – Many-to-Many with Junction Table

## Goal

Using an iTunes-like CSV export (`library.csv`), we:

1. Load raw data into a `track` table (temporarily including `artist` and `album` text fields).
2. Create normalized tables:
   - `album(id, title)`
   - `artist(id, name)`
   - `track(id, title, album_id, ...)`
   - `tracktoartist(id, track_id, artist_id)`
3. Use **INSERT ... SELECT** and `UPDATE` statements to:
   - Populate `album` from distinct album names.
   - Relate each `track` to an `album` via `album_id`.
   - Populate `tracktoartist` from distinct track–artist combinations.
   - Relate `tracktoartist` to both `track` and `artist` using foreign keys.
4. Drop no-longer-needed text columns (`artist`, `album`, etc.) to leave only IDs.

This creates a fully normalized many-to-many relationship between **tracks** and **artists**, where:

- A track can have multiple artists.
- An artist can appear on multiple tracks.
