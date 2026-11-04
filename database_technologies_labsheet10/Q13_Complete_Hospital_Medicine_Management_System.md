# Q13. Complete Hospital Medicine Management System

**Question:** Combine the previous tasks into one working Hospital Medicine Management System containing Home, Add Medicine, View Medicines, Search Medicine, Update Stock, Delete Medicine, Low Stock, and Inventory Report features. Use HTML, CSS, Python Flask, PyMongo, and MongoDB.

## Project structure

```text
HospitalMedicineSystem/
├── app.py
├── requirements.txt
├── templates/
│   ├── base.html
│   ├── home.html
│   ├── add.html
│   ├── medicines.html
│   ├── search.html
│   ├── update.html
│   ├── delete.html
│   ├── low_stock.html
│   └── report.html
└── static/
    └── style.css
```

## 1. `app.py`

```python
from flask import Flask, render_template, request, redirect, url_for, flash
from pymongo import MongoClient
from pymongo.errors import DuplicateKeyError
import re

app = Flask(__name__)
app.secret_key = "replace-with-a-private-secret-key"

client = MongoClient("mongodb://localhost:27017/")
db = client["HospitalDB"]
medicines = db["medicines"]
medicines.create_index("medicine_id", unique=True)

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/add", methods=["GET", "POST"])
def add_medicine():
    if request.method == "POST":
        try:
            medicine = {
                "medicine_id": int(request.form["medicine_id"]),
                "name": request.form["name"].strip(),
                "category": request.form["category"].strip(),
                "price": float(request.form["price"]),
                "stock": int(request.form["stock"]),
                "manufacturer": request.form["manufacturer"].strip()
            }
            if medicine["price"] < 0 or medicine["stock"] < 0:
                flash("Price and stock cannot be negative.")
                return redirect(url_for("add_medicine"))
            if not all([medicine["name"], medicine["category"], medicine["manufacturer"]]):
                flash("Please fill in all fields.")
                return redirect(url_for("add_medicine"))

            medicines.insert_one(medicine)
            flash("Medicine added successfully.")
            return redirect(url_for("view_medicines"))
        except DuplicateKeyError:
            flash("That Medicine ID already exists.")
        except (ValueError, KeyError):
            flash("Please enter valid medicine details.")
    return render_template("add.html")

@app.route("/medicines")
def view_medicines():
    items = list(medicines.find({}, {"_id": 0}).sort("medicine_id", 1))
    return render_template("medicines.html", medicines=items)

@app.route("/search", methods=["GET", "POST"])
def search_medicine():
    results = []
    searched = False
    if request.method == "POST":
        searched = True
        term = request.form.get("search", "").strip()
        conditions = [{"name": {"$regex": re.escape(term), "$options": "i"}}]
        if term.isdigit():
            conditions.append({"medicine_id": int(term)})
        results = list(medicines.find({"$or": conditions}, {"_id": 0}))
    return render_template("search.html", medicines=results, searched=searched)

@app.route("/update", methods=["GET", "POST"])
def update_stock():
    updated = None
    message = ""
    if request.method == "POST":
        try:
            medicine_id = int(request.form["medicine_id"])
            new_stock = int(request.form["new_stock"])
            if new_stock < 0:
                message = "Stock cannot be negative."
            else:
                result = medicines.update_one(
                    {"medicine_id": medicine_id},
                    {"$set": {"stock": new_stock}}
                )
                if result.matched_count:
                    updated = medicines.find_one(
                        {"medicine_id": medicine_id}, {"_id": 0}
                    )
                    message = "Stock updated successfully."
                else:
                    message = "Medicine ID not found."
        except ValueError:
            message = "Enter valid numeric values."
    return render_template("update.html", updated=updated, message=message)

@app.route("/delete", methods=["GET", "POST"])
def delete_medicine():
    message = ""
    if request.method == "POST":
        try:
            medicine_id = int(request.form["medicine_id"])
            result = medicines.delete_one({"medicine_id": medicine_id})
            message = "Medicine deleted successfully." if result.deleted_count else "Medicine ID not found."
        except ValueError:
            message = "Enter a valid Medicine ID."
    return render_template("delete.html", message=message)

@app.route("/low-stock")
def low_stock():
    items = list(medicines.find({"stock": {"$lt": 30}}, {"_id": 0}).sort("stock", 1))
    return render_template("low_stock.html", medicines=items)

@app.route("/report")
def report():
    total_medicines = medicines.count_documents({})
    stock_data = list(medicines.aggregate([
        {"$group": {"_id": None, "total": {"$sum": "$stock"}}}
    ]))
    total_stock = stock_data[0]["total"] if stock_data else 0
    low_stock_count = medicines.count_documents({"stock": {"$lt": 30}})
    expensive = medicines.find_one({}, {"_id": 0}, sort=[("price", -1)])
    cheapest = medicines.find_one({}, {"_id": 0}, sort=[("price", 1)])
    return render_template(
        "report.html",
        total_medicines=total_medicines,
        total_stock=total_stock,
        low_stock_count=low_stock_count,
        expensive=expensive,
        cheapest=cheapest
    )

if __name__ == "__main__":
    app.run(debug=True)
```

## 2. `requirements.txt`

```text
Flask
pymongo
```

## 3. `templates/base.html`

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hospital Medicine Management</title>
  <link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}">
</head>
<body>
  <header>
    <h1>Hospital Medicine Management System</h1>
    <nav>
      <a href="{{ url_for('home') }}">Home</a>
      <a href="{{ url_for('add_medicine') }}">Add Medicine</a>
      <a href="{{ url_for('view_medicines') }}">View Medicines</a>
      <a href="{{ url_for('search_medicine') }}">Search</a>
      <a href="{{ url_for('update_stock') }}">Update Stock</a>
      <a href="{{ url_for('delete_medicine') }}">Delete</a>
      <a href="{{ url_for('low_stock') }}">Low Stock</a>
      <a href="{{ url_for('report') }}">Report</a>
    </nav>
  </header>
  <main>
    {% with messages = get_flashed_messages() %}
      {% if messages %}
        {% for message in messages %}<p class="message">{{ message }}</p>{% endfor %}
      {% endif %}
    {% endwith %}
    {% block content %}{% endblock %}
  </main>
</body>
</html>
```

## 4. `templates/home.html`

```html
{% extends "base.html" %}
{% block content %}
<h2>Welcome</h2>
<p>Use this application to add, view, search, update and delete hospital medicine records.</p>
{% endblock %}
```

## 5. `templates/add.html`

```html
{% extends "base.html" %}
{% block content %}
<h2>Add Medicine</h2>
<form method="POST">
  <label>Medicine ID</label><input type="number" name="medicine_id" required>
  <label>Medicine Name</label><input type="text" name="name" required>
  <label>Category</label><input type="text" name="category" required>
  <label>Price</label><input type="number" name="price" min="0" step="0.01" required>
  <label>Stock</label><input type="number" name="stock" min="0" required>
  <label>Manufacturer</label><input type="text" name="manufacturer" required>
  <button type="submit">Add Medicine</button>
</form>
{% endblock %}
```

## 6. `templates/medicines.html`

```html
{% extends "base.html" %}
{% block content %}
<h2>All Medicines</h2>
<table>
  <tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Stock</th><th>Manufacturer</th></tr>
  {% for m in medicines %}
  <tr>
    <td>{{ m.medicine_id }}</td><td>{{ m.name }}</td><td>{{ m.category }}</td>
    <td>{{ m.price }}</td><td>{{ m.stock }}</td><td>{{ m.manufacturer }}</td>
  </tr>
  {% else %}
  <tr><td colspan="6">No medicines found.</td></tr>
  {% endfor %}
</table>
{% endblock %}
```

## 7. `templates/search.html`

```html
{% extends "base.html" %}
{% block content %}
<h2>Search Medicine</h2>
<form method="POST">
  <label>Medicine ID or Name</label>
  <input type="text" name="search" required>
  <button type="submit">Search</button>
</form>
{% if searched %}
  {% if medicines %}
    {% for m in medicines %}
      <p>{{ m.medicine_id }} | {{ m.name }} | {{ m.category }} |
         Price: {{ m.price }} | Stock: {{ m.stock }} | {{ m.manufacturer }}</p>
    {% endfor %}
  {% else %}<p>No medicine found.</p>{% endif %}
{% endif %}
{% endblock %}
```

## 8. `templates/update.html`

```html
{% extends "base.html" %}
{% block content %}
<h2>Update Stock</h2>
<form method="POST">
  <label>Medicine ID</label><input type="number" name="medicine_id" required>
  <label>New Stock</label><input type="number" name="new_stock" min="0" required>
  <button type="submit">Update Stock</button>
</form>
<p>{{ message }}</p>
{% if updated %}<p>Updated: {{ updated.name }} — Stock: {{ updated.stock }}</p>{% endif %}
{% endblock %}
```

## 9. `templates/delete.html`

```html
{% extends "base.html" %}
{% block content %}
<h2>Delete Medicine</h2>
<form method="POST">
  <label>Medicine ID</label><input type="number" name="medicine_id" required>
  <button type="submit">Delete Medicine</button>
</form>
<p>{{ message }}</p>
{% endblock %}
```

## 10. `templates/low_stock.html`

```html
{% extends "base.html" %}
{% block content %}
<h2>Low Stock Medicines (below 30)</h2>
<table>
  <tr><th>ID</th><th>Name</th><th>Stock</th></tr>
  {% for m in medicines %}
  <tr><td>{{ m.medicine_id }}</td><td>{{ m.name }}</td><td>{{ m.stock }}</td></tr>
  {% else %}
  <tr><td colspan="3">No low-stock medicines.</td></tr>
  {% endfor %}
</table>
{% endblock %}
```

## 11. `templates/report.html`

```html
{% extends "base.html" %}
{% block content %}
<h2>Inventory Report</h2>
<p>Total medicines: {{ total_medicines }}</p>
<p>Total stock: {{ total_stock }}</p>
<p>Number of low-stock medicines: {{ low_stock_count }}</p>
<h3>Most Expensive Medicine</h3>
{% if expensive %}<p>{{ expensive.name }} — ₹{{ expensive.price }}</p>{% else %}<p>No records.</p>{% endif %}
<h3>Cheapest Medicine</h3>
{% if cheapest %}<p>{{ cheapest.name }} — ₹{{ cheapest.price }}</p>{% else %}<p>No records.</p>{% endif %}
{% endblock %}
```

## 12. `static/style.css`

```css
* { box-sizing: border-box; }
body {
  margin: 0;
  font-family: Arial, sans-serif;
  background: #f3f7f6;
  color: #263238;
}
header {
  background: #176b5b;
  color: white;
  padding: 20px;
  text-align: center;
}
nav {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 12px;
  margin-top: 15px;
}
nav a {
  color: white;
  text-decoration: none;
  padding: 8px 10px;
  border-radius: 4px;
}
nav a:hover { background: #105044; }
main {
  max-width: 1000px;
  margin: 25px auto;
  padding: 20px;
  background: white;
  border-radius: 8px;
}
form { max-width: 520px; }
label {
  display: block;
  margin: 12px 0 5px;
  font-weight: bold;
}
input {
  width: 100%;
  padding: 10px;
  border: 1px solid #b0bec5;
  border-radius: 4px;
}
button {
  margin-top: 18px;
  padding: 10px 18px;
  border: 0;
  border-radius: 4px;
  background: #176b5b;
  color: white;
  cursor: pointer;
}
button:hover { background: #105044; }
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 15px;
}
th, td {
  padding: 10px;
  border: 1px solid #cfd8dc;
  text-align: left;
}
th { background: #e0efeb; }
.message { color: #176b5b; font-weight: bold; }
```

## How to run the project

1. Install and start MongoDB locally.
2. Open a terminal in the project folder.
3. Create and activate a virtual environment if desired.
4. Install packages: `pip install -r requirements.txt`
5. Run the application: `python app.py`
6. Open `http://127.0.0.1:5000/` in your browser.

**Note:** This mini application uses the same `HospitalDB.medicines` collection created in Q1. Run Q1 first to insert sample records. For a real deployment, use an environment variable for the MongoDB URI and a secure Flask secret key.
