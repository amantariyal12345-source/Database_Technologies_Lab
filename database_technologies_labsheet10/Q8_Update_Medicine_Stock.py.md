# Q8. Update Medicine Stock

**Question:** Create a facility to update the stock of a medicine. The user should provide Medicine ID and New Stock. Update the corresponding MongoDB document and display the updated information.

**Flask code (`app.py`):**

```python
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/")
medicines = client["HospitalDB"]["medicines"]

@app.route("/update-stock", methods=["GET", "POST"])
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

    return render_template("update_stock.html", updated=updated, message=message)

if __name__ == "__main__":
    app.run(debug=True)
```

**HTML (`templates/update_stock.html`):**

```html
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><title>Update Stock</title></head>
<body>
  <h1>Update Medicine Stock</h1>
  <form method="POST">
    <label>Medicine ID:</label>
    <input type="number" name="medicine_id" required>
    <label>New Stock:</label>
    <input type="number" name="new_stock" min="0" required>
    <button type="submit">Update Stock</button>
  </form>
  <p>{{ message }}</p>
  {% if updated %}
    <h2>Updated Medicine</h2>
    <pre>{{ updated }}</pre>
  {% endif %}
</body>
</html>
```
