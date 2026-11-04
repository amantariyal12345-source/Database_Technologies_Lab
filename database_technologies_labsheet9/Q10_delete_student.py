"""
Q10. Create a delete facility that accepts a Student ID and removes the corresponding document
from MongoDB. Display a suitable message after deletion.
"""
from flask import Flask, request, render_template_string
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]

PAGE = """
<h2>Delete Student</h2>
<form method="POST">
  Student ID: <input name="student_id" required>
  <button type="submit">Delete</button>
</form>
{% if message %}<p>{{ message }}</p>{% endif %}
"""


@app.route("/delete", methods=["GET", "POST"])
def delete_student():
    message = ""
    if request.method == "POST":
        result = students.delete_one(
            {"student_id": request.form["student_id"].strip()}
        )
        if result.deleted_count == 1:
            message = "Student record deleted successfully."
        else:
            message = "Student ID not found. No record was deleted."
    return render_template_string(PAGE, message=message)


if __name__ == "__main__":
    app.run(debug=True)
