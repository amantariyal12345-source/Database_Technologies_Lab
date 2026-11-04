# Q5. Connect HTML Form with Flask and Store Medicine

**Question:** Connect the HTML medicine form with Flask. When the user submits the medicine form, store the medicine as a MongoDB document. Verify the inserted document in MongoDB.

**Code (`app.py`):**

```python
from flask import Flask, render_template, request, redirect, url_for, flash
from pymongo import MongoClient
from pymongo.errors import DuplicateKeyError

app = Flask(__name__)
app.secret_key = "change-this-secret-key"

client = MongoClient("mongodb://localhost:27017/")
db = client["HospitalDB"]
medicines = db["medicines"]
medicines.create_index("medicine_id", unique=True)

@app.route("/")
def home():
    return render_template("medicine_form.html")

@app.route("/add", methods=["POST"])
def add_medicine():
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
            return "Price and stock cannot be negative.", 400

        medicines.insert_one(medicine)
        return "Medicine added successfully. <a href='/'>Add another</a>"
    except DuplicateKeyError:
        return "A medicine with this Medicine ID already exists.", 409
    except (ValueError, KeyError):
        return "Please enter valid medicine details.", 400

if __name__ == "__main__":
    app.run(debug=True)
```

**HTML (`templates/medicine_form.html`):** Use the form from Q2 and set its form action to `/add` and method to `POST`.

**Verify in mongosh:**

```javascript
use HospitalDB
db.medicines.find().pretty()
```
