
-- AUTOMOBILES NORMALIZATION

DROP TABLE IF EXISTS model;
DROP TABLE IF EXISTS make;

CREATE TABLE make (
    id SERIAL PRIMARY KEY,
    name VARCHAR(128) UNIQUE
);

CREATE TABLE model (
    id SERIAL PRIMARY KEY,
    name VARCHAR(128),
    make_id INTEGER REFERENCES make(id) ON DELETE CASCADE
);

INSERT INTO make (name) VALUES ('Lexus'), ('Suzuki');

INSERT INTO model (name, make_id) VALUES
('NX 200t AWD',        (SELECT id FROM make WHERE name='Lexus')),
('NX 200t AWD F Sport',(SELECT id FROM make WHERE name='Lexus')),
('NX 300',             (SELECT id FROM make WHERE name='Lexus')),
('Forsa Turbo',        (SELECT id FROM make WHERE name='Suzuki')),
('Grand Vitara',       (SELECT id FROM make WHERE name='Suzuki'));

-- Verification
SELECT make.name, model.name
FROM model
JOIN make ON model.make_id = make.id
ORDER BY make.name, model.name;
