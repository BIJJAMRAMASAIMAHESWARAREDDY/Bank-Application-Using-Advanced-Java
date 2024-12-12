<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <html>
 <head>
  <title>
   TrustGuard Bank
  </title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <style>
   body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, lightgreen, lightblue, cream);
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .header {
            background-color: #333;
            color: white;
            padding: 10px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
        }
        .header img {
            margin-left: 20px;
        }
        .header nav {
            display: flex;
            align-items: center;
        }
        .header nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
        }
        .header nav a:hover {
            text-decoration: underline;
        }
        .header .menu-icon {
            margin-right: 20px;
            cursor: pointer;
        }
        .dropdown {
            display: none;
            position: absolute;
            right: 20px;
            top: 50px;
            background-color: black;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
        }
        .dropdown a {
            display: block;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
        }
        .dropdown a:hover {
            background-color: #444;
        }
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
        }
        .form-container form {
            background-color: white;
            padding: 40px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 50%;
            max-width: 600px;
        }
        .form-container form div {
            margin-bottom: 20px;
        }
        .form-container form label {
            display: block;
            margin-bottom: 10px;
            font-size: 18px;
        }
        .form-container form input {
            width: 100%;
            padding: 12px;
            box-sizing: border-box;
            font-size: 16px;
        }
        .form-container form button {
            width: 100%;
            padding: 15px;
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
        }
        .form-container form button:hover {
            background-color: #009acd;
        }
        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
        }
  </style>
  <script type="text/javascript">
   function toggleDropdown() {
            var dropdown = document.getElementById("dropdown");
            if (dropdown.style.display === "none" || dropdown.style.display === "") {
                dropdown.style.display = "block";
            } else {
                dropdown.style.display = "none";
            }
        }
    function showPopup() {
    document.getElementById("popup").style.display = "block";
    document.getElementById("overlay").style.display = "block";
}

function closePopup() {
    document.getElementById("popup").style.display = "none";
    document.getElementById("overlay").style.display = "none";
}
function validateForm() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var confirmpw = document.getElementById("confirmpw").value;
    if (username === "" || password === "" || confirmpw==="") {
        alert("Please enter both username and password.");
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}

window.onload = function() {
    showPopup();
}
  </script>
 </head>
 <body>
  <div class="header">
   <img alt="TrustGuard Bank Logo" height="40" src="https://storage.googleapis.com/a1aa/image/2hcQTeEGiySnWqfumV7TuJ2uiSTvKKrmcNcdfQRYQuPI9jVnA.jpg" width="40"/>
   <nav>
    <a href="#">
     Home
    </a>
    <a href="#">
     Deposit Schemes
    </a>
    <a href="#">
     About
    </a>
    <a href="mailto:TGB@gmail.com">
     TGB@gmail.com
    </a>
   </nav>
   <div class="menu-icon" onclick="toggleDropdown()">
    <i class="fas fa-bars">
    </i>
   </div>
   <div class="dropdown" id="dropdown">
    <a href="#">
     Profile
    </a>
    <a href="#">
     Update
    </a>
    <a href="#">
     Delete
    </a>
   </div>
  </div>
  <div class="form-container">
   <form action="forgot-password" onsubmit="return validateForm();">
    <div>
        <label for="email">Email</label>
        <input id="email" name="email" type="email" required />
        <% String s = (String) request.getAttribute("msg2");
        if (s != null) out.print(s); %>
    </div>
    <div>
        <label for="new-password">New Password</label>
        <input id="new-password" name="password" type="password" required />
    </div>
    <div>
        <label for="confirm-password">Confirm Password</label>
        <input id="confirm-password" name="confirmpassword" type="password" required />
        <% String s1 = (String) request.getAttribute("msg1");
        if (s1 != null) out.print(s1); %>
    </div>
    <button type="submit">Submit</button>
    <% String s2 = (String) request.getAttribute("msg3");
    if (s2 != null) out.print(s2); %>
</form>

  </div>
  <div class="footer">
   <p>
    © 2023 TrustGuard Bank. All rights reserved.
   </p>
  </div>
 </body>
</html>