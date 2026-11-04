# Q10. MongoDB Query Practice

**Question:** Write and execute MongoDB queries to: (a) display medicines belonging to a particular category, (b) display medicines costing more than ₹50, (c) display medicines costing less than ₹100, (d) display medicines having stock less than 30, (e) display medicines manufactured by a particular manufacturer, (f) sort medicines according to price, and (g) sort medicines according to stock.

**Code (MongoDB Shell / mongosh):**

```javascript
use HospitalDB

// (a) Medicines belonging to a particular category
db.medicines.find({ category: "Analgesic" })

// (b) Medicines costing more than Rs. 50
db.medicines.find({ price: { $gt: 50 } })

// (c) Medicines costing less than Rs. 100
db.medicines.find({ price: { $lt: 100 } })

// (d) Medicines having stock less than 30
db.medicines.find({ stock: { $lt: 30 } })

// (e) Medicines made by a particular manufacturer
db.medicines.find({ manufacturer: "ABC Pharma" })

// (f) Sort medicines by price: ascending order
db.medicines.find().sort({ price: 1 })

// (g) Sort medicines by stock: ascending order
db.medicines.find().sort({ stock: 1 })
```

Change `"Analgesic"` and `"ABC Pharma"` to other category/manufacturer values as required.
