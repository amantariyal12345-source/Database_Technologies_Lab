"""
Q12. Combine the previous tasks into one working Student Record Management System
containing Add Student, View Students, Search Student, Update Student, and Delete Student
features. Use HTML, CSS, Python Flask, PyMongo, and MongoDB.

This single-file version embeds its HTML templates and CSS so it can be saved as one file.
Install Flask and PyMongo, ensure MongoDB is running, then run this script.
"""
from flask import Flask, request, redirect, url_for, render_template_string
from pymongo import MongoClient
from pymongo.errors import DuplicateKeyError

app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/")
db = client["CollegeDB"]
students = db["students"]
students.create_index("student_id", unique=True)

STYLE = """
<style>
body{font-family:Arial,sans-serif;background:#f2f5f9;margin:30px;color:#263238}
main{max-width:900px;margin:auto;background:white;padding:24px;border-radius:10px}
nav a{margin-right:14px;color:#1769aa}
input,select{padding:8px;margin:5px 0;width:100%;box-sizing:border-box}
button{padding:9px 16px;background:#1769aa;color:white;border:0;border-radius:4px}
table{border-collapse:collapse;width:100%;margin-top:15px}
th,td{border:1px solid #bbb;padding:8px;text-align:left}
</style>
"""

LAYOUT = """
<!doctype html><html><head><title>Student Record Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
""" + STYLE + """
</head><body><main>
<h1>Student Record Management System</h1>
<nav>
<a href="/">Home</a><a href="/add">Add Student</a>
<a href="/view">View Students</a><a href="/search">Search Student</a>
<a href="/update">Update Student</a><a href="/delete">Delete Student</a>
</nav><hr>
{{ body|safe }}
</main></body></html>
"""

FORM_FIELDS = """
<label>Student ID</label><input name="student_id" required>
<label>Student Name</label><input name="name" required>
<label>Age</label><input name="age" type="number" min="1" required>
<label>Gender</label><select name="gender" required>
<option>Male</option><option>Female</option><option>Other</option></select>
<label>Department</label><input name="department" required>
<label>Marks</label><input name="marks" type="number" min="0" max="100" required>
"""

def page(body, **context):
    return render_template_string(LAYOUT, body=render_template_string(body, **context))


@app.route("/")
def home():
    return page("<h2>Welcome</h2><p>Use the navigation links to manage student records.</p>")


@app.route("/add", methods=["GET", "POST"])
def add_student():
    message = ""
    if request.method == "POST":
        record = {
            "student_id": request.form["student_id"].strip(),
            "name": request.form["name"].strip(),
            "age": int(request.form["age"]),
            "gender": request.form["gender"],
            "department": request.form["department"].strip(),
            "marks": float(request.form["marks"])
        }
        try:
            students.insert_one(record)
            message = "Student added successfully."
        except DuplicateKeyError:
            message = "That Student ID already exists."
    body = "<h2>Add Student</h2><form method='POST'>" + FORM_FIELDS + \
           "<button type='submit'>Add Student</button></form><p>{{ message }}</p>"
    return page(body, message=message)


@app.route("/view")
def view_students():
    records = list(students.find({}, {"_id": 0}))
    body = """
    <h2>All Students</h2><table>
    <tr><th>ID</th><th>Name</th><th>Age</th><th>Gender</th><th>Department</th><th>Marks</th></tr>
    {% for s in records %}<tr>
    <td>{{s.student_id}}</td><td>{{s.name}}</td><td>{{s.age}}</td>
    <td>{{s.gender}}</td><td>{{s.department}}</td><td>{{s.marks}}</td>
    </tr>{% else %}<tr><td colspan="6">No student records found.</td></tr>{% endfor %}
    </table>
    """
    return page(body, records=records)


@app.route("/search", methods=["GET", "POST"])
def search_student():
    student = None
    searched = False
    if request.method == "POST":
        searched = True
        student = students.find_one(
            {"student_id": request.form["student_id"].strip()}, {"_id": 0}
        )
    body = """
    <h2>Search Student</h2><form method="POST">
    <input name="student_id" placeholder="Enter Student ID" required>
    <button>Search</button></form>
    {% if student %}<pre>{{student}}</pre>
    {% elif searched %}<p>Student not found.</p>{% endif %}
    """
    return page(body, student=student, searched=searched)


@app.route("/update", methods=["GET", "POST"])
def update_student():
    message = ""
    if request.method == "POST":
        result = students.update_one(
            {"student_id": request.form["student_id"].strip()},
            {"$set": {
                "name": request.form["name"].strip(),
                "age": int(request.form["age"]),
                "department": request.form["department"].strip(),
                "marks": float(request.form["marks"])
            }}
        )
        message = "Student updated successfully." if result.matched_count else "Student ID not found."
    body = """
    <h2>Update Student</h2><form method="POST">
    <label>Student ID to update</label><input name="student_id" required>
    <label>New Name</label><input name="name" required>
    <label>New Age</label><input name="age" type="number" min="1" required>
    <label>New Department</label><input name="department" required>
    <label>New Marks</label><input name="marks" type="number" min="0" max="100" required>
    <button>Update Student</button></form><p>{{message}}</p>
    """
    return page(body, message=message)


@app.route("/delete", methods=["GET", "POST"])
def delete_student():
    message = ""
    if request.method == "POST":
        result = students.delete_one({"student_id": request.form["student_id"].strip()})
        message = "Student deleted successfully." if result.deleted_count else "Student ID not found."
    body = """
    <h2>Delete Student</h2><form method="POST">
    <input name="student_id" placeholder="Enter Student ID" required>
    <button>Delete Student</button></form><p>{{message}}</p>
    """
    return page(body, message=message)


if __name__ == "__main__":
    app.run(debug=True)
