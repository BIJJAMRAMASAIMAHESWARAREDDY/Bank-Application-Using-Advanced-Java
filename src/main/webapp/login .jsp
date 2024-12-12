<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <html>
 <head>
  <title>
   TrustGuard Bank
  </title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&amp;display=swap" rel="stylesheet"/>
  <style>
   body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }
        .navbar {
            background-color: #333;
            overflow: hidden;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar a {
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar .logo {
            display: flex;
            align-items: center;
            padding: 0 16px;
        }
        .navbar .logo img {
            height: 40px;
            margin-right: 10px;
        }
        .navbar .logo span {
            color: #f2f2f2;
            font-size: 24px;
            font-weight: bold;
        }
        .navbar .nav-links {
            display: flex;
            align-items: center;
            padding: 0 16px;
        }
        .navbar .right {
            display: flex;
            align-items: center;
            padding: 0 16px;
        }
        .navbar .menu {
            display: none;
            flex-direction: column;
            align-items: flex-start;
            background-color: #333;
            position: absolute;
            top: 60px;
            right: 0;
            width: 200px;
            z-index: 1;
        }
        .navbar .menu a {
            padding: 10px 16px;
            width: 100%;
        }
        .navbar .menu a:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar .menu-btn {
            background-color: #333;
            color: white;
            padding: 14px 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }
        .navbar .menu-btn:focus + .menu,
        .navbar .menu:hover {
            display: flex;
        }
        .main-content {
            text-align: center;
            background: linear-gradient(to right, rgba(144, 238, 144, 0.5), rgba(173, 216, 230, 0.5), rgba(255, 255, 224, 0.5));
            color: white;
            padding: 100px 0;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .main-content img {
            width: 200px;
        }
        .main-content h2 {
            font-size: 36px;
            margin: 0;
            color: darkgreen;
        }
        .main-content p {
            font-size: 18px;
        }
        .info-section {
            display: flex;
            justify-content: space-around;
            padding: 50px 0;
            width: 100%;
            background-color: #f9f9f9;
        }
        .info-box {
            width: 30%;
            padding: 20px;
            color: white;
            text-align: center;
        }
        .info-box h3 {
            font-size: 24px;
        }
        .info-box p {
            font-size: 16px;
        }
        .info-box:nth-child(1) {
            background-color: #00c6ff;
        }
        .info-box:nth-child(2) {
            background-color: #00bfff;
        }
        .info-box:nth-child(3) {
            background-color: #00c6ff;
        }
        .info-box:nth-child(4) {
            background-color: #00bfff;
        }
        .info-box a {
            color: white;
            text-decoration: none;
        }
        .info-box a:hover {
            text-decoration: underline;
        }
        .footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 30px 0;
            width: 100%;
        }
        .footer p {
            margin: 0;
        }
  </style>
 </head>
 <body>
 <a href="login" method="post"></a>
  <div class="navbar">
   <div class="logo">
    <img alt="Bank Logo" src="https://via.placeholder.com/40" />
    <span>TrustGuard Bank</span>
   </div>
   <div class="nav-links">
    <a href="login .jsp">Home</a>
    <a href="DepositSchemeBefore.jsp">Deposit Schemes</a>
    <a href="loanSchemes.jsp">Loan Schemes</a>
    <a href="about.jsp">About</a>
    <a href="mailto:TGB@gmail.com">TGB@gmail.com</a>
   </div>
   <div class="right">
    <button class="menu-btn">
     <i class="fa fa-bars"></i>
    </button>
    <div class="menu">
     <a href="profile">Profile</a>
     <a href="update">Update</a>
     <a href="delete" method="post">Delete</a>
     
    </div>
   </div>
  </div>
  <div class="main-content">
   <h2>
    Our Services
   </h2>
   <img alt="Savings jar with coins" height="200" src="https://storage.googleapis.com/a1aa/image/oeT0Web13hjtoEdHzre0oeNFKCkJujpCZlQ0X0NHZ8s1MnqOB.jpg" width="200"/>
  </div>
  <div class="info-section">
   <div class="info-box">
    <h3>
     <a href="balnceenquiry.jsp">Balance Enquiry</a>
    </h3>
    <p>
     There is a variety of saving plans
    </p>
   </div>
   <div class="info-box">
    <h3>
     <a href="withdraw.jsp">Withdraw</a>
    </h3>
    <p>
     There is a variety of saving plans
    </p>
   </div>
   <div class="info-box">
    <h3>
     <a href="transfer .jsp">Transfer</a>
    </h3>
    <p>
     There is a variety of saving plans
    </p>
   </div>
    <div class="info-box" >
    <h3>
     <a href="addbalance.jsp">Add Balance</a>
    </h3>
    <p>
     There is a variety of saving plans
    </p>
   </div>
  </div>
  <div class="footer">
   <p>
    &copy; 2023 TrustGuard Bank. All rights reserved.
   </p>
  </div>
 </body>
</html>