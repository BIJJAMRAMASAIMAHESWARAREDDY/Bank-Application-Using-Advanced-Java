<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration Success</title>
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
        input
        {
        background-color:blue;
        }
        /*additional styles omitted for brevity */
</style>
</head>
<body>
    <form action="register" method="get">
    <center>
        <div class="navbar">
            <div class="brand">TrustGuard Bank</div>
            <div class="middle-links">
                
            </div>
        </div>
        <br><br><br><br><br><br>
        <h1>User successfully registered. Your user ID is: <%= request.getAttribute("userId") %></h1><br>
        <h1> Your Account Number is: <%= request.getAttribute("accountnumber") %></h1><br>
       <center> <a href="index.jsp"><input style="margin-right: 750px;border-radius: 2px;font-size: 25px" type="button" value="Login"></a></center>
    </center>
    </form>
   </body>
    <footer>
        <p>© 2024 TRUSTGUARD BANK. All rights reserved.</p>
    </footer>

</html>
