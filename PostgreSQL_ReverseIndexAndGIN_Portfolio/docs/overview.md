# Project 5 Overview – Natural Language & Indexing in PostgreSQL

This project simulates a tiny text search system built directly in PostgreSQL.  

We implement:

1. A **reverse/inverted index** – mapping each word to the document IDs that contain it.
2. A reverse index **with stop words removed** – mimicking basic IR preprocessing.
3. A **GIN-based array index** over `string_to_array(lower(doc), ' ')`.
4. A **GIN-based full-text index** using `to_tsvector` / `to_tsquery`.

The document set (`docs01`, `docs02`, `docs03`) contains short phrases about Python, conversations, and syntax, plus filler rows to make the indexing realistic.
