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
        .header .logo-container {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }
        .header img {
            margin-right: 10px;
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
            position: relative;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            right: 20px;
            top: 50px;
            background-color: #333;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {
            background-color: #575757;
        }
        .menu-icon:hover .dropdown-content {
            display: block;
        }
        .content {
            flex: 1;
            background: linear-gradient(to right, #ff7e5f, #feb47b, #6a11cb, #2575fc, #43cea2, #185a9d);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .box {
            background-color: white;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            text-align: center;
            font-size: 24px;
            color: #333;
            width: 50%;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .box:hover {
            transform: scale(1.05);
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.3);
        }
        .box h2 {
            font-size: 36px;
            margin: 0;
            color: #ff7e5f;
        }
        .box button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 18px;
            color: white;
            background-color: #ff7e5f;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .box button:hover {
            background-color: #feb47b;
        }
        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
        }
  </style>
 </head>
 <body>
  <div class="header">
   <div class="logo-container">
    <img alt="Bank Logo" height="40" src="https://storage.googleapis.com/a1aa/image/xMhe5EqpWaXcKaY7mmOe4verV3YVR1mzWSgsHgr6foxgSgrOB.jpg" width="40"/>
    <span>
     TrustGuard Bank
    </span>
   </div>
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
    <div class="dropdown-content" id="dropdown">
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
  </div>
  <div class="content">
   <div class="box">
    <h2>
     Step Into Your Personal Dashboard
    </h2>
    <button type="submit" onclick="window.location.href='show.jsp'">
     Show
    </button>
   </div>
  </div>
  <div class="footer">
   © 2023 TrustGuard Bank. All rights reserved.
  </div>
  <script>
   function toggleDropdown() {
        var dropdown = document.getElementById("dropdown");
        if (dropdown.style.display === "block") {
            dropdown.style.display = "none";
        } else {
            dropdown.style.display = "block";
        }
    }
  </script>
 </body>
</html>