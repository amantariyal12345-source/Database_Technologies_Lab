# Q9. Delete Medicine by ID

**Question:** Create a facility to delete a medicine using its Medicine ID. After deletion, verify that the document no longer exists in MongoDB.

**Flask code (`app.py`):**

```python
from flask import Flask, render_template, request
from pymongo import MongoClient

app = Flask(__name__)
client = MongoClient("mongodb://localhost:27017/")
medicines = client["HospitalDB"]["medicines"]

@app.route("/delete", methods=["GET", "POST"])
def delete_medicine():
    message = ""

    if request.method == "POST":
        try:
            medicine_id = int(request.form["medicine_id"])
            result = medicines.delete_one({"medicine_id": medicine_id})

            if result.deleted_count == 1:
                message = "Medicine deleted successfully."
            else:
                message = "Medicine ID not found."
        except ValueError:
            message = "Enter a valid Medicine ID."

    return render_template("delete.html", message=message)

if __name__ == "__main__":
    app.run(debug=True)
```

**HTML (`templates/delete.html`):**

```html
<!DOCTYPE html>
<html lang="en">
<head><meta charset="UTF-8"><title>Delete Medicine</title></head>
<body>
  <h1>Delete Medicine</h1>
  <form method="POST">
    <label>Medicine ID:</label>
    <input type="number" name="medicine_id" required>
    <button type="submit">Delete Medicine</button>
  </form>
  <p>{{ message }}</p>
</body>
</html>
```

**Verify in mongosh:**

```javascript
use HospitalDB
db.medicines.findOne({ medicine_id: 301 })
```

If the returned value is `null`, that medicine document has been deleted.
