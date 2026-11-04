# Q11. Embedded Supplier Documents

**Question:** Modify the medicine document structure to include supplier information as an embedded document containing name, phone, and city. Insert at least three medicines containing embedded supplier information. Retrieve and display the medicine and supplier information through the Flask application.

**Insert documents (mongosh):**

```javascript
use HospitalDB

db.medicines.insertMany([
  {
    medicine_id: 401, name: "Dolo 650", category: "Analgesic",
    price: 30, stock: 80, manufacturer: "ABC Pharma",
    supplier: { name: "City Medical Supplies", phone: "9876543210", city: "Dehradun" }
  },
  {
    medicine_id: 402, name: "Allegra", category: "Antihistamine",
    price: 110, stock: 45, manufacturer: "HealthCare Ltd",
    supplier: { name: "North Pharma Distributors", phone: "9876501234", city: "Haridwar" }
  },
  {
    medicine_id: 403, name: "Pantoprazole", category: "Antacid",
    price: 70, stock: 25, manufacturer: "MediLife",
    supplier: { name: "Medico Traders", phone: "9812345670", city: "Rishikesh" }
  }
])
```

**Flask code (`app.py`):**

```python
from flask import Flask, render_template
from pymongo import MongoClient

app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/")
medicines = client["HospitalDB"]["medicines"]

@app.route("/suppliers")
def show_suppliers():
    medicine_list = list(medicines.find(
        {"supplier": {"$exists": True}},
        {"_id": 0}
    ))
    return render_template("suppliers.html", medicines=medicine_list)

if __name__ == "__main__":
    app.run(debug=True)
```

**HTML (`templates/suppliers.html`):**

```html
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><title>Medicine Suppliers</title></head>
<body>
  <h1>Medicines and Supplier Details</h1>
  {% for medicine in medicines %}
    <section>
      <h2>{{ medicine.name }} (ID: {{ medicine.medicine_id }})</h2>
      <p>Category: {{ medicine.category }} | Price: {{ medicine.price }} |
         Stock: {{ medicine.stock }}</p>
      <h3>Supplier</h3>
      <p>Name: {{ medicine.supplier.name }}</p>
      <p>Phone: {{ medicine.supplier.phone }}</p>
      <p>City: {{ medicine.supplier.city }}</p>
    </section>
  {% else %}
    <p>No medicine with supplier information found.</p>
  {% endfor %}
</body>
</html>
```
