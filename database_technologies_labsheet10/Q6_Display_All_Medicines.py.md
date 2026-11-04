# Q6. Retrieve and Display All Medicines

**Question:** Retrieve all medicine documents from MongoDB and display them on an HTML page. The table should display Medicine ID, Medicine Name, Category, Price, Stock, and Manufacturer.

**Flask code (`app.py`):**

```python
from flask import Flask, render_template
from pymongo import MongoClient

app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/")
medicines = client["HospitalDB"]["medicines"]

@app.route("/medicines")
def view_medicines():
    medicine_list = list(medicines.find({}, {"_id": 0}).sort("medicine_id", 1))
    return render_template("medicines.html", medicines=medicine_list)

if __name__ == "__main__":
    app.run(debug=True)
```

**HTML (`templates/medicines.html`):**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>All Medicines</title>
</head>
<body>
  <h1>Medicine Inventory</h1>
  <table border="1" cellpadding="8">
    <tr>
      <th>Medicine ID</th><th>Medicine Name</th><th>Category</th>
      <th>Price</th><th>Stock</th><th>Manufacturer</th>
    </tr>
    {% for medicine in medicines %}
    <tr>
      <td>{{ medicine.medicine_id }}</td>
      <td>{{ medicine.name }}</td>
      <td>{{ medicine.category }}</td>
      <td>{{ medicine.price }}</td>
      <td>{{ medicine.stock }}</td>
      <td>{{ medicine.manufacturer }}</td>
    </tr>
    {% else %}
    <tr><td colspan="6">No medicines found.</td></tr>
    {% endfor %}
  </table>
</body>
</html>
```
