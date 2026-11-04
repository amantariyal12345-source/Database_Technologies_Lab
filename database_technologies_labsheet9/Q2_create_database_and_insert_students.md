# Q2. Create a MongoDB database named CollegeDB and a collection named students. Insert at least 5 student documents containing student_id, name, age, gender, department, and marks. Verify the documents using MongoDB.

## MongoDB Shell commands

```javascript
use CollegeDB

db.students.insertMany([
  {
    student_id: "S101",
    name: "Aarav Sharma",
    age: 21,
    gender: "Male",
    department: "Computer Science",
    marks: 85
  },
  {
    student_id: "S102",
    name: "Diya Verma",
    age: 20,
    gender: "Female",
    department: "Information Technology",
    marks: 78
  },
  {
    student_id: "S103",
    name: "Kabir Singh",
    age: 22,
    gender: "Male",
    department: "Computer Science",
    marks: 92
  },
  {
    student_id: "S104",
    name: "Ananya Gupta",
    age: 19,
    gender: "Female",
    department: "Commerce",
    marks: 73
  },
  {
    student_id: "S105",
    name: "Rohan Das",
    age: 23,
    gender: "Male",
    department: "Information Technology",
    marks: 67
  }
])

db.students.find()
db.students.countDocuments()
```

The database and collection are created automatically when the first documents are inserted.
