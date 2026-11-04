# Database Technologies Lab Sheet 9 — Student Record Management System

This folder contains 12 separate files, one for each question in the uploaded lab sheet.

## Requirements
- Python 3
- MongoDB Community Server running locally
- Flask
- PyMongo
- MongoDB Shell (`mongosh`) or MongoDB Compass

Install Python packages:

```bash
python -m pip install flask pymongo
```

Default MongoDB connection string used in the examples:

```text
mongodb://localhost:27017/
```

If your MongoDB server uses another connection string, replace it in the Python files.

## Running the examples
- Q1: Run `python check_imports.py` after creating the verification script shown in the file.
- Q2: Run the commands in `Q2_create_database_and_insert_students.md` in `mongosh`.
- Q3 and Q4: Save the HTML and CSS files in the same folder when using the standalone form.
- Q5–Q11: Run the corresponding Python file with `python filename.py`, then open the route shown in the question/code (for example, `http://127.0.0.1:5000/students`).
- Q12: Run `python Q12_complete_student_record_management_system.py` and open `http://127.0.0.1:5000/`.

## Important
The lab sheet asks for a local MongoDB database named `CollegeDB` and collection named `students`. Run Q2 first to insert sample records. Q6–Q12 use the same database and collection. Q2 is a Markdown file because it contains MongoDB Shell commands rather than Python code.
