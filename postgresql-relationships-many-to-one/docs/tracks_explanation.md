
# Musical Tracks Normalization

We load a raw CSV of iTunes track data into track_raw, then:

1. Extract distinct album names → insert album table  
2. Update track_raw to set album_id foreign key  
3. Insert normalized records into track table  

This converts raw CSV data into a relational track–album structure.
