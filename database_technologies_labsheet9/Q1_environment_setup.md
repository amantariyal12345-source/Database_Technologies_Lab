# Q1. Install and configure Python, Flask, PyMongo, MongoDB, and MongoDB Compass or MongoDB Shell. Create a Python project and verify that Flask and PyMongo can be imported successfully.

## Commands

```bash
mkdir student_record_management
cd student_record_management

python -m venv venv

# Windows:
venv\Scripts\activate
# Linux/macOS:
source venv/bin/activate

python -m pip install flask pymongo
python -m pip freeze > requirements.txt
```

Install MongoDB Community Server and optionally MongoDB Compass from the official MongoDB website. Start the MongoDB service, then test imports.

Create `check_imports.py`:

```python
from flask import Flask
from pymongo import MongoClient

print("Flask and PyMongo imported successfully!")

app = Flask(__name__)

# Default local MongoDB connection string
client = MongoClient("mongodb://localhost:27017/", serverSelectionTimeoutMS=5000)

try:
    client.admin.command("ping")
    print("MongoDB connection successful!")
except Exception as error:
    print("MongoDB connection failed:", error)
```

Run:

```bash
python check_imports.py
```

If MongoDB is not running, start the MongoDB service before running the script.
