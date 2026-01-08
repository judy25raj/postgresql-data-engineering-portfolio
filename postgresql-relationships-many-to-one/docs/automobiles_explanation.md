
# Automobiles Many-to-One Normalization (Explanation)

The goal is to convert:

make | model
-----|-----------------------
Lexus | NX 200t AWD
Lexus | NX 200t AWD F Sport
Lexus | NX 300
Suzuki | Forsa Turbo
Suzuki | Grand Vitara

Into:
- `make(id,name)`
- `model(id,name,make_id)`

This reduces redundancy and enforces proper relational structure.
