
# UNESCO Heritage Sites Normalization

The raw CSV contains repeated category, state, region, and ISO text.

We normalize these into separate lookup tables:
- category
- state
- region
- iso

Then build final table `unesco` with proper foreign keys.
