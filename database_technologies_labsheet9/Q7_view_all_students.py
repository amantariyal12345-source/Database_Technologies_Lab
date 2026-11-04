"""
Q7. Create a Flask route that retrieves all student documents from MongoDB and displays them
on an HTML page in a table containing Student ID, Name, Age, Gender, Department, and Marks.
"""
from flask import Flask, render_template_string
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]

PAGE = """
<h2>All Students</h2>
<table border="1" cellpadding="8">
  <tr>
    <th>Student ID</th><th>Name</th><th>Age</th>
    <th>Gender</th><th>Department</th><th>Marks</th>
  </tr>
  {% for s in students %}
  <tr>
    <td>{{ s.student_id }}</td><td>{{ s.name }}</td><td>{{ s.age }}</td>
    <td>{{ s.gender }}</td><td>{{ s.department }}</td><td>{{ s.marks }}</td>
  </tr>
  {% endfor %}
</table>
"""


@app.route("/students")
def view_students():
    records = list(students.find({}, {"_id": 0}))
    return render_template_string(PAGE, students=records)


if __name__ == "__main__":
    app.run(debug=True)
