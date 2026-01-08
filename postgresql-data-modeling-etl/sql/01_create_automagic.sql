
DROP TABLE IF EXISTS automagic;
CREATE TABLE automagic (
  id SERIAL PRIMARY KEY,
  name VARCHAR(32) NOT NULL,
  height DOUBLE PRECISION NOT NULL
);
INSERT INTO automagic (name, height) VALUES ('Alice', 165.5), ('Bob', 172.3);
