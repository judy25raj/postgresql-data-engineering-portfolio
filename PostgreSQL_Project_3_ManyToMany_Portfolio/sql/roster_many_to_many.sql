
-- ==============================================
-- Project 3 – Part 1: Course Roster Many-to-Many
-- ==============================================

-- Drop existing tables if they exist (for re-runs)
DROP TABLE IF EXISTS roster CASCADE;
DROP TABLE IF EXISTS course CASCADE;
DROP TABLE IF EXISTS student CASCADE;

-- 1. Create core tables
CREATE TABLE student (
    id SERIAL,
    name VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE course (
    id SERIAL,
    title VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE roster (
    id SERIAL,
    student_id INTEGER REFERENCES student(id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES course(id) ON DELETE CASCADE,
    role INTEGER,
    UNIQUE(student_id, course_id),
    PRIMARY KEY (id)
);

-- 2. Insert students (names are unique)
INSERT INTO student (name) VALUES
('Marin'),
('Alessio'),
('Antonyo'),
('Hasini'),
('Kylah'),
('Awwal'),
('Clayton'),
('Danny'),
('Konar'),
('Yadgor'),
('Justinas'),
('Areez'),
('Briony'),
('Liesje'),
('Strachan');

-- 3. Insert courses
INSERT INTO course (title) VALUES
('si106'),
('si110'),
('si206');

-- 4. Insert roster data (0 = Learner, 1 = Instructor)

-- si106
INSERT INTO roster (student_id, course_id, role) VALUES
((SELECT id FROM student WHERE name='Marin'),    (SELECT id FROM course WHERE title='si106'), 1),
((SELECT id FROM student WHERE name='Alessio'),  (SELECT id FROM course WHERE title='si106'), 0),
((SELECT id FROM student WHERE name='Antonyo'),  (SELECT id FROM course WHERE title='si106'), 0),
((SELECT id FROM student WHERE name='Hasini'),   (SELECT id FROM course WHERE title='si106'), 0),
((SELECT id FROM student WHERE name='Kylah'),    (SELECT id FROM course WHERE title='si106'), 0);

-- si110
INSERT INTO roster (student_id, course_id, role) VALUES
((SELECT id FROM student WHERE name='Awwal'),    (SELECT id FROM course WHERE title='si110'), 1),
((SELECT id FROM student WHERE name='Clayton'),  (SELECT id FROM course WHERE title='si110'), 0),
((SELECT id FROM student WHERE name='Danny'),    (SELECT id FROM course WHERE title='si110'), 0),
((SELECT id FROM student WHERE name='Konar'),    (SELECT id FROM course WHERE title='si110'), 0),
((SELECT id FROM student WHERE name='Yadgor'),   (SELECT id FROM course WHERE title='si110'), 0);

-- si206
INSERT INTO roster (student_id, course_id, role) VALUES
((SELECT id FROM student WHERE name='Justinas'), (SELECT id FROM course WHERE title='si206'), 1),
((SELECT id FROM student WHERE name='Areez'),    (SELECT id FROM course WHERE title='si206'), 0),
((SELECT id FROM student WHERE name='Briony'),   (SELECT id FROM course WHERE title='si206'), 0),
((SELECT id FROM student WHERE name='Liesje'),   (SELECT id FROM course WHERE title='si206'), 0),
((SELECT id FROM student WHERE name='Strachan'), (SELECT id FROM course WHERE title='si206'), 0);

-- 5. Verification query (matches the autograder)
SELECT student.name, course.title, roster.role
FROM student 
JOIN roster ON student.id = roster.student_id
JOIN course ON roster.course_id = course.id
ORDER BY course.title, roster.role DESC, student.name;
