<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrustGuard Bank - Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            padding: 10px;
            color: white;
        }
        .navbar .bank-icon {
            font-size: 24px;
            cursor: pointer;
        }
        .navbar .nav-links {
            display: flex;
            gap: 20px;
        }
        .navbar .nav-links a {
            color: white; /* Set color to white */
            text-decoration: none;
            font-size: 14px;
        }
        .navbar .middle-links {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex: 1;
        }
        .navbar .brand {
            margin-left: 40px; /* Move the brand slightly to the right */
            font-size: 18px;
            color: white;
        }
        .navbar .logo {
            margin-right: 20px; /* Add some margin to the right */
        }
        .dropdown-menu {
            display: none;
            position: absolute;
            top: 50px;
            left: 10px;
            background-color: #333;
            border: 1px solid #ccc;
            z-index: 1;
            padding: 10px;
        }
        .dropdown-menu .dropdown-button {
            display: block;
            background-color: #1E90FF;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            margin-bottom: 10px;
            width: 100%;
            text-align: left;
        }
        .dropdown-menu .dropdown-button:hover {
            background-color: #575757;
        }
        .marquee {
            background-color: #FF69B4;
            color: white;
            padding: 10px 0;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            white-space: nowrap;
            overflow: hidden;
            position: relative;
        }
        .marquee span {
            display: inline-block;
            padding-left: 100%;
            animation: marquee 15s linear infinite;
        }
        @keyframes marquee {
            0% { transform: translateX(100%); }
            100% { transform: translateX(-100%); }
        }
        .content {
            display: flex;
            height: calc(100vh - 100px); /* Adjusted for the height of the navbar and marquee */
        }
        .content .left-side, .content .right-side {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column; /* Align items in a column */
        }
        .content .left-side {
            background-color: #fff;
        }
        .content .right-side {
            background-color: #f0f0f0;
        }
        .content .form-container {
            display: flex;
            flex-direction: column;
            gap: 20px; /* Increase gap between form elements */
            width: 100%;
            max-width: 400px; /* Increase the width of the form */
            background-color: white; /* Set background color to white */
            padding: 20px; /* Add padding */
            border-radius: 10px; /* Add border radius */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add box shadow */
        }
        .content .form-container input {
            padding: 15px; /* Increase padding for input fields */
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px; /* Increase font size */
            width: 100%;
        }
        .content .form-container .button-group {
            display: flex;
            gap: 10px; /* Add gap between buttons */
        }
        .content .form-container .button-group .button {
            flex: 1; /* Make buttons take equal space */
            background-color: #1E90FF;
            color: white;
            padding: 15px; /* Increase padding for button */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px; /* Increase font size */
            text-align: center;
        }
        .content .form-container .forgot-password {
            text-align: center;
            color: #1E90FF;
            text-decoration: none;
            font-size: 14px;
        }
        .content .form-container h2 {
            text-align: center;
            color: #333;
            font-size: 24px; /* Increase font size for heading */
        }
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            border: 1px solid black;
            padding: 20px;
            z-index: 1000;
            text-align: center;
        }
        .popup h2 {
            margin: 0;
            color: #FF69B4;
        }
        .popup .ok-button {
            margin-top: 20px;
            background-color: #1E90FF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        .email {
            text-align: center;
            margin-top: 20px;
            font-size: 16px;
            color: #333;
        }
        .email span {
            font-weight: bold;
        }
    </style>
    <script>
        function toggleDropdown() {
            var dropdown = document.getElementById("dropdown-menu");
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
            var email = document.getElementById("email").value;
            var password = document.getElementById("password").value;
            if (username === "" || password === "") {
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
    <div class="navbar">
        <div class="bank-icon">
            <i class="fas fa-university"></i>
        </div>
        <div class="brand">TrustGuard Bank</div>
        <div class="middle-links">
        	
            <a href="about.jsp" style="color: white; float:left;">About</a>
            <a href="mailto:TGB@gmail.com" style="color: white; float:left;">TGB@gmail.com</a>
        </div>
        <div id="dropdown-menu" class="dropdown-menu">
            <button class="dropdown-button" >Profile</button>
            <button class="dropdown-button">Update</button>
            <button class="dropdown-button">Delete</button>
        </div>
    </div>
    <div class="marquee">
        <span>WELCOME TO TRUSTGUARD BANK</span>
    </div>
    <div class="content">
        <div class="left-side">
            <img src="https://storage.googleapis.com/a1aa/image/epPxrXtxW33fxEMM1L8PLlDJwpGKJUbAGf9fX9WeyWUc0DTdC.jpg" alt="Bank Logo" width="200" height="200">
            <h2>TrustGuard Bank</h2>
        </div>
        <div class="right-side">
            <div class="form-container">
                <h2>SIGN IN</h2>
                <form action="login" method="post" onsubmit="return validateForm();">
                    <input type="text" id="username" placeholder="Username" name="email" required><br><br>
                    <input type="password" id="password" placeholder="Password" name="password" required><br><br>
                    <div class="button-group" style="width:40%;float:left">
                        <button type="submit" class="button">User Login</button>
                     </div>
                     </form>
                     <div class="button-group" style="width:40%;float:right">
                     
                     <a href="register.jsp"><button class="button" >CreateA/c</button></a>
                     </div>
                <a href="forgot-password" class="forgot-password">Forgot Password?</a>
            </div>
        </div>
    </div>
    <div id="popup" class="popup">
        <h2>Welcome to TrustGuard Bank</h2>
        <button class="ok-button" onclick="closePopup()">OK</button>
    </div>
    <div id="overlay" class="overlay"></div>
</body>
</html>