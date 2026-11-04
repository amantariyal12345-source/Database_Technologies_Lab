# Q12. Medicine Inventory Report

**Question:** Create a Flask page that displays the total number of medicines, total stock, medicines with low stock, the most expensive medicine, and the cheapest medicine. Use MongoDB queries and Python to generate the report.

**Flask code (`app.py`):**

```python
from flask import Flask, render_template
from pymongo import MongoClient

app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/")
medicines = client["HospitalDB"]["medicines"]

@app.route("/report")
def inventory_report():
    total_medicines = medicines.count_documents({})
    stock_result = list(medicines.aggregate([
        {"$group": {"_id": None, "total_stock": {"$sum": "$stock"}}}
    ]))
    total_stock = stock_result[0]["total_stock"] if stock_result else 0

    low_stock = list(medicines.find({"stock": {"$lt": 30}}, {"_id": 0}))
    most_expensive = medicines.find_one(
        {}, {"_id": 0}, sort=[("price", -1)]
    )
    cheapest = medicines.find_one(
        {}, {"_id": 0}, sort=[("price", 1)]
    )

    return render_template(
        "report.html",
        total_medicines=total_medicines,
        total_stock=total_stock,
        low_stock=low_stock,
        most_expensive=most_expensive,
        cheapest=cheapest
    )

if __name__ == "__main__":
    app.run(debug=True)
```

**HTML (`templates/report.html`):**

```html
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><title>Inventory Report</title></head>
<body>
  <h1>Medicine Inventory Report</h1>
  <p>Total number of medicines: {{ total_medicines }}</p>
  <p>Total stock: {{ total_stock }}</p>

  <h2>Low Stock Medicines (less than 30)</h2>
  <ul>
    {% for medicine in low_stock %}
      <li>{{ medicine.name }} - Stock: {{ medicine.stock }}</li>
    {% else %}
      <li>No low-stock medicines.</li>
    {% endfor %}
  </ul>

  <h2>Most Expensive Medicine</h2>
  {% if most_expensive %}
    <p>{{ most_expensive.name }} - Price: {{ most_expensive.price }}</p>
  {% else %}
    <p>No medicine records available.</p>
  {% endif %}

  <h2>Cheapest Medicine</h2>
  {% if cheapest %}
    <p>{{ cheapest.name }} - Price: {{ cheapest.price }}</p>
  {% else %}
    <p>No medicine records available.</p>
  {% endif %}
</body>
</html>
```
