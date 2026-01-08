
# Project 3 Overview – Many-to-Many Relationships

This project consists of two independent but related mini-scenarios:

1. **Course Roster (student–course)**  
   - Each student can be enrolled in multiple courses.  
   - Each course can have multiple students.  
   - Roles (Instructor / Learner) are stored in the junction table.

2. **Musical Tracks + Artists (track–artist)**  
   - Each track can have multiple artists (e.g., collaborations, compilations).  
   - Each artist can appear on multiple tracks.  
   - The many-to-many relationship is implemented using a `tracktoartist` join table.

Both examples demonstrate how to design and populate many-to-many structures using PostgreSQL with clean, normalized schemas.
