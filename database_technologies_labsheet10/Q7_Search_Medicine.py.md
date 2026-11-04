# Q7. Search Medicine by ID or Name

**Question:** Create a search facility that allows the user to search for a medicine using Medicine ID or Medicine Name. Display the matching medicine document and show a suitable message when no medicine is found.

**Flask code (`app.py`):**

```python
from flask import Flask, render_template, request
from pymongo import MongoClient
import re

app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/")
medicines = client["HospitalDB"]["medicines"]

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

if __name__ == "__main__":
    app.run(debug=True)
```

**HTML (`templates/search.html`):**

```html
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><title>Search Medicine</title></head>
<body>
  <h1>Search Medicine</h1>
  <form method="POST">
    <input type="text" name="search" placeholder="Enter Medicine ID or Name" required>
    <button type="submit">Search</button>
  </form>

  {% if searched %}
    {% if medicines %}
      {% for medicine in medicines %}
        <p>ID: {{ medicine.medicine_id }} | Name: {{ medicine.name }} |
           Category: {{ medicine.category }} | Price: {{ medicine.price }} |
           Stock: {{ medicine.stock }} | Manufacturer: {{ medicine.manufacturer }}</p>
      {% endfor %}
    {% else %}
      <p>No medicine found.</p>
    {% endif %}
  {% endif %}
</body>
</html>
```
