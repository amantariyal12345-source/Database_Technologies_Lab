"""
Q9. Create an update facility that allows the user to modify a student's Name, Age,
Department, and Marks. Use MongoDB's update operation and verify the updated document.
"""
from flask import Flask, request, render_template_string
from pymongo import MongoClient

app = Flask(__name__)
students = MongoClient("mongodb://localhost:27017/")["CollegeDB"]["students"]

PAGE = """
<h2>Update Student</h2>
<form method="POST">
  Student ID: <input name="student_id" required><br>
  New Name: <input name="name" required><br>
  New Age: <input name="age" type="number" min="1" required><br>
  New Department: <input name="department" required><br>
  New Marks: <input name="marks" type="number" min="0" max="100" required><br>
  <button type="submit">Update Student</button>
</form>
{% if message %}<p>{{ message }}</p>{% endif %}
{% if updated %}<pre>{{ updated }}</pre>{% endif %}
"""


@app.route("/update", methods=["GET", "POST"])
def update_student():
    message = ""
    updated = None
    if request.method == "POST":
        student_id = request.form["student_id"].strip()
        result = students.update_one(
            {"student_id": student_id},
            {"$set": {
                "name": request.form["name"].strip(),
                "age": int(request.form["age"]),
                "department": request.form["department"].strip(),
                "marks": float(request.form["marks"])
            }}
        )
        if result.matched_count:
            message = "Student updated successfully."
            updated = students.find_one({"student_id": student_id}, {"_id": 0})
        else:
            message = "Student ID not found."
    return render_template_string(PAGE, message=message, updated=updated)


if __name__ == "__main__":
    app.run(debug=True)
