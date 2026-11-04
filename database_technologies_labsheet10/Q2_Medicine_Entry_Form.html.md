# Q2. HTML Medicine Entry Form

**Question:** Create an HTML medicine entry form that accepts Medicine ID, Medicine Name, Category, Price, Stock, and Manufacturer. Add a suitable Submit button.

**Code (`medicine_form.html`):**

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Medicine Entry Form</title>
</head>
<body>
  <h1>Hospital Medicine Entry</h1>

  <form action="/add" method="POST">
    <label for="medicine_id">Medicine ID:</label>
    <input type="number" id="medicine_id" name="medicine_id" required><br><br>

    <label for="name">Medicine Name:</label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="category">Category:</label>
    <input type="text" id="category" name="category" required><br><br>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" min="0" step="0.01" required><br><br>

    <label for="stock">Stock:</label>
    <input type="number" id="stock" name="stock" min="0" required><br><br>

    <label for="manufacturer">Manufacturer:</label>
    <input type="text" id="manufacturer" name="manufacturer" required><br><br>

    <button type="submit">Add Medicine</button>
  </form>
</body>
</html>
```
