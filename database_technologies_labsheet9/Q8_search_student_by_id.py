"""
Q8. Create a search facility where the user can enter a Student ID. Use MongoDB to find the
corresponding student document and display the student's details. Handle the situation where
the student does not exist.
"""
from flask import Flask, request, render_template_string
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]

PAGE = """
<h2>Search Student</h2>
<form method="POST">
  Student ID: <input name="student_id" required>
  <button type="submit">Search</button>
</form>
{% if student %}
  <h3>Student Found</h3>
  <p>ID: {{ student.student_id }}</p>
  <p>Name: {{ student.name }}</p>
  <p>Age: {{ student.age }}</p>
  <p>Gender: {{ student.gender }}</p>
  <p>Department: {{ student.department }}</p>
  <p>Marks: {{ student.marks }}</p>
{% elif searched %}
  <p>No student found with that ID.</p>
{% endif %}
"""


@app.route("/search", methods=["GET", "POST"])
def search_student():
    student = None
    searched = False
    if request.method == "POST":
        searched = True
        student = students.find_one(
            {"student_id": request.form["student_id"].strip()},
            {"_id": 0}
        )
    return render_template_string(PAGE, student=student, searched=searched)


if __name__ == "__main__":
    app.run(debug=True)
