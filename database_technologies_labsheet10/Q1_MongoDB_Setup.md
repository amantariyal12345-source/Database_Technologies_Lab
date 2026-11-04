# Q1. MongoDB Setup

**Question:** Create a MongoDB database named `HospitalDB` and a collection named `medicines`. Insert at least 8 medicine documents containing `medicine_id`, `name`, `category`, `price`, `stock`, and `manufacturer`. Verify the documents using MongoDB.

**Code (MongoDB Shell / mongosh):**

```javascript
use HospitalDB

db.createCollection("medicines")

db.medicines.insertMany([
  { medicine_id: 301, name: "Paracetamol", category: "Analgesic", price: 25, stock: 100, manufacturer: "ABC Pharma" },
  { medicine_id: 302, name: "Cetirizine", category: "Antihistamine", price: 35, stock: 50, manufacturer: "HealthCare Ltd" },
  { medicine_id: 303, name: "Amoxicillin", category: "Antibiotic", price: 85, stock: 20, manufacturer: "MediLife" },
  { medicine_id: 304, name: "Omeprazole", category: "Antacid", price: 60, stock: 15, manufacturer: "ABC Pharma" },
  { medicine_id: 305, name: "Vitamin C", category: "Supplement", price: 120, stock: 75, manufacturer: "NutriMed" },
  { medicine_id: 306, name: "Ibuprofen", category: "Analgesic", price: 55, stock: 25, manufacturer: "HealthCare Ltd" },
  { medicine_id: 307, name: "Azithromycin", category: "Antibiotic", price: 95, stock: 10, manufacturer: "MediLife" },
  { medicine_id: 308, name: "Calcium", category: "Supplement", price: 45, stock: 40, manufacturer: "NutriMed" }
])

// Verify inserted documents
db.medicines.find()
```
