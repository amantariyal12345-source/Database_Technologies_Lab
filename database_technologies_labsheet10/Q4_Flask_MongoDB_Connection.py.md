# Q4. Connect Flask with MongoDB

**Question:** Create a Flask application that connects to the `HospitalDB` database and accesses the `medicines` collection. Verify the connection between Python and MongoDB.

**Code (`app.py`):**

```python
from flask import Flask
from pymongo import MongoClient
from pymongo.errors import PyMongoError

app = Flask(__name__)

client = MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=5000)
db = client["HospitalDB"]
medicines = db["medicines"]

@app.route("/")
def home():
    try:
        client.admin.command("ping")
        return "Successfully connected to HospitalDB and medicines collection."
    except PyMongoError as error:
        return f"MongoDB connection failed: {error}", 500

if __name__ == "__main__":
    app.run(debug=True)
```

**Install dependencies:** `pip install flask pymongo`

Make sure the MongoDB server is running before starting the Flask application.
