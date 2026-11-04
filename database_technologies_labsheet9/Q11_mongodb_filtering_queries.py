"""
Q11. Create separate MongoDB queries to display:
(a) students belonging to a particular department,
(b) students having marks greater than 75,
(c) students having marks between 50 and 80, and
(d) students older than 20.
Display the results through the Flask web application.
"""
from flask import Flask, render_template_string
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]

PAGE = """
<h2>Student Filtering Results</h2>
{% for heading, records in sections %}
  <h3>{{ heading }}</h3>
  <table border="1" cellpadding="6">
    <tr><th>ID</th><th>Name</th><th>Age</th><th>Department</th><th>Marks</th></tr>
    {% for s in records %}
      <tr>
        <td>{{ s.student_id }}</td><td>{{ s.name }}</td><td>{{ s.age }}</td>
        <td>{{ s.department }}</td><td>{{ s.marks }}</td>
      </tr>
    {% else %}
      <tr><td colspan="5">No matching students.</td></tr>
    {% endfor %}
  </table>
{% endfor %}
"""


@app.route("/filters")
def filter_students():
    department_name = "Computer Science"  # Change this department as required.
    sections = [
        ("Department: " + department_name,
         list(students.find({"department": department_name}, {"_id": 0}))),
        ("Marks greater than 75",
         list(students.find({"marks": {"$gt": 75}}, {"_id": 0}))),
        ("Marks between 50 and 80",
         list(students.find({"marks": {"$gte": 50, "$lte": 80}}, {"_id": 0}))),
        ("Age greater than 20",
         list(students.find({"age": {"$gt": 20}}, {"_id": 0})))
    ]
    return render_template_string(PAGE, sections=sections)


if __name__ == "__main__":
    app.run(debug=True)
