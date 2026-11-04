"""
Q6. Connect the HTML student form with the Flask backend. When the user submits the form,
insert the student information into MongoDB. Verify that the newly added student appears in
the students collection.
"""
from flask import Flask, request, redirect, url_for, render_template_string
from pymongo import MongoClient
from pymongo.errors import DuplicateKeyError

app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/")
students = client["CollegeDB"]["students"]

FORM = """
<h2>Student Registration</h2>
<form method="POST" action="/add">
  Student ID: <input name="student_id" required><br>
  Name: <input name="name" required><br>
  Age: <input name="age" type="number" min="1" required><br>
  Gender: <select name="gender" required>
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    <option value="Other">Other</option>
  </select><br>
  Department: <input name="department" required><br>
  Marks: <input name="marks" type="number" min="0" max="100" required><br>
  <button type="submit">Add Student</button>
</form>
"""


@app.route("/")
def home():
    return FORM


@app.route("/add", methods=["POST"])
def add_student():
    student = {
        "student_id": request.form["student_id"].strip(),
        "name": request.form["name"].strip(),
        "age": int(request.form["age"]),
        "gender": request.form["gender"],
        "department": request.form["department"].strip(),
        "marks": float(request.form["marks"])
    }
    try:
        students.insert_one(student)
        return "Student added successfully! <a href='/'>Add another</a>"
    except DuplicateKeyError:
        return "A student with this ID already exists.", 409


if __name__ == "__main__":
    # Keep student IDs unique.
    students.create_index("student_id", unique=True)
    app.run(debug=True)
