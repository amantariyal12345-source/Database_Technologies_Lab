# Q3. CSS Design for Medicine Entry Page

**Question:** Create a CSS file and design the medicine entry page. Include a page heading, form layout, labels, input fields, buttons, spacing, and simple medicine inventory styling.

**Code (`style.css`):**

```css
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  padding: 30px 15px;
  font-family: Arial, sans-serif;
  background: #f2f6f8;
  color: #263238;
}

h1 {
  text-align: center;
  color: #176b5b;
  margin-bottom: 25px;
}

form {
  max-width: 500px;
  margin: auto;
  padding: 25px;
  background: white;
  border-radius: 10px;
  box-shadow: 0 3px 12px rgba(0, 0, 0, 0.10);
}

label {
  display: block;
  margin: 12px 0 6px;
  font-weight: bold;
}

input {
  width: 100%;
  padding: 10px;
  border: 1px solid #b0bec5;
  border-radius: 5px;
  font-size: 15px;
}

button {
  width: 100%;
  margin-top: 20px;
  padding: 12px;
  border: none;
  border-radius: 5px;
  background: #176b5b;
  color: white;
  font-size: 16px;
  cursor: pointer;
}

button:hover {
  background: #105044;
}
```

**Note:** Add `<link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}">` inside the HTML `<head>` when using Flask.
