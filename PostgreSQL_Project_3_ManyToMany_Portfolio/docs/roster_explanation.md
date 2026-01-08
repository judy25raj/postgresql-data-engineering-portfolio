
# Course Roster – Many-to-Many Modeling

## Goal

Transform flat roster data like:

```text
Marin, si106, Instructor
Alessio, si106, Learner
...
```

Into a properly normalized relational model using three tables:

- `student(id, name)`
- `course(id, title)`
- `roster(id, student_id, course_id, role)`

Where:

- Each **student** can be linked to many **courses**.
- Each **course** can have many **students**.
- The **role** (1 = instructor, 0 = learner) is stored in the junction table `roster`.

This is a classic **many-to-many relationship** implemented through a **join table**.
