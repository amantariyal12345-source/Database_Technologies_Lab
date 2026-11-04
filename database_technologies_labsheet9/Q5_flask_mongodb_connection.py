"""
Q5. Create a Python Flask application that connects to the CollegeDB database and accesses
the students collection. Display a suitable message when the application successfully connects
to MongoDB.
"""
from flask import Flask
from pymongo import MongoClient
from pymongo.errors import PyMongoError

app = Flask(__name__)

MONGO_URI = "mongodb://localhost:27017/"
client = MongoClient(MONGO_URI, serverSelectionTimeoutMS=5000)
db = client["CollegeDB"]
students = db["students"]


@app.route("/")
def home():
    try:
        client.admin.command("ping")
        return "Successfully connected to CollegeDB and students collection!"
    except PyMongoError as error:
        return f"MongoDB connection failed: {error}", 500


if __name__ == "__main__":
    app.run(debug=True)
