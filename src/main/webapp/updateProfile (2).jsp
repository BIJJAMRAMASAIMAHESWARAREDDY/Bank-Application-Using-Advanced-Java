<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
 <head>
  <title>
   Update Customer Details
  </title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <style>
   body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #d4fc79, #96e6a1);
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #333;
            color: white;
            padding: 10px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .header .logo {
            display: flex;
            align-items: center;
            margin-left: 20px;
        }
        .header .logo img {
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
        }
        .header .bank-name {
            font-size: 20px;
            font-weight: bold;
        }
        .update-form {
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 50px auto;
        }
        .update-form h2 {
            margin-top: 0;
            margin-bottom: 20px;
            text-align: center;
        }
        .update-form label {
            display: block;
            margin-bottom: 5px;
        }
        .update-form input[type="text"],
        .update-form input[type="email"],
        .update-form input[type="tel"],
        .update-form input[type="number"],
        .update-form textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .update-form .gender {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .update-form .gender label {
            margin: 0;
        }
        .update-form button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .update-form button:hover {
            background-color: #45a049;
        }
        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
  </style>
 </head>
 <body>
  <div class="header">
   <div class="logo">
    <img alt="Bank Logo" height="40" src="https://storage.googleapis.com/a1aa/image/VQXTrnFUBeSIVq0ff3PJfZiMcsTrMuKnQeH97bWzd3QgWyXdC.jpg" width="40"/>
    <div class="bank-name">
     TrustGuard Bank
    </div>
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
   <div class="menu-icon">
    <i class="fas fa-bars">
    </i>
   </div>
  </div>
  <div class="update-form">
   <h2>
    Update Customer Details
   </h2>
   <form action="update" method="post">
    <label for="firstname">
     First Name:
    </label>
    <input id="firstname" name="firstname" required="" type="text"/>
    <label for="lastname">
     Last Name:
    </label>
    <input id="lastname" name="lastname" required="" type="text"/>
    <label for="email">
     Email:
    </label>
    <input id="email" name="email" required="" type="email"/>
    <label for="mobilenumber">
     Mobile Number:
    </label>
    <input id="mobilenumber" name="mobilenumber" required="" type="tel"/>
    <label for="age">
     Age:
    </label>
    <input id="age" name="age" required="" type="number"/>
    <div class="gender">
     <label>
      Gender:
     </label>
     <label>
      <input name="gender" required="" type="radio" value="male"/>
      Male
     </label>
     <label>
      <input name="gender" required="" type="radio" value="female"/>
      Female
     </label>
     <label>
      <input name="gender" required="" type="radio" value="other"/>
      Other
     </label>
    </div>
    <label for="address">
     Address:
    </label>
    <textarea id="address" name="address" required="" rows="4"></textarea>
    <button type="submit">
     Update
    </button>
   </form>
  </div>
  <div class="footer">
   © 2023 TrustGuard Bank. All rights reserved.
  </div>
 </body>
</html>