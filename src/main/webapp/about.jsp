<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
 <head>
  <title>
   About - TrustGuard Bank
  </title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
  <style>
   body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #333;
            overflow: hidden;
            padding: 10px 20px;
        }
        .navbar a {
            float: right;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar .logo {
            float: left;
            display: flex;
            align-items: center;
        }
        .navbar .logo img {
            height: 40px;
            width: 40px;
            margin-right: 10px;
        }
        .navbar .logo span {
            color: white;
            font-size: 20px;
            font-weight: bold;
        }
        .header {
            background: linear-gradient(to right, #d4fc79, #96e6a1);
            text-align: center;
            padding: 50px 20px;
        }
        .header h1 {
            color: green;
            font-size: 36px;
        }
        .header img {
            margin-top: 20px;
            width: 200px;
            height: 200px;
        }
        .content {
            padding: 20px;
            text-align: center;
        }
        .content h2 {
            font-size: 28px;
            color: #333;
        }
        .content p {
            font-size: 18px;
            color: #666;
            line-height: 1.6;
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
  <div class="navbar">
   <div class="logo">
    <img alt="TrustGuard Bank Logo" height="40" src="https://storage.googleapis.com/a1aa/image/clT4poLXgSIaKR5POfaLwdmfeSlUfr4KAumF1AEHF6mOworOB.jpg" width="40"/>
    <span>
     TrustGuard Bank
    </span>
   </div>
   <a href="#">
    <i class="fas fa-bars">
    </i>
   </a>
   <a href="mailto:TGB@gmail.com">
    TGB@gmail.com
   </a>
   <a href="#">
    About
   </a>
   <a href="DepositSchemeBefore.jsp">
    Deposit Schemes
   </a>
   <a href="loanSchemes.jsp">Loan Schemes</a>
   <a href="login .jsp">
    Home
   </a>
  </div>
  <div class="header">
   
   <img alt="Bank building" height="200" src="https://storage.googleapis.com/a1aa/image/yrnWaaiT8GZzMNh0pATLSSXNjMQBaIXuqn6E7E3nyJQfJd1JA.jpg" width="200"/>
  </div>
  <div class="content">
   <h2>
    Welcome to TrustGuard Bank
   </h2>
   <p>
    TrustGuard Bank has been serving the community since 1990. Our mission is to provide reliable and secure banking services to all our customers. We offer a variety of financial products and services to meet your needs, including savings accounts, loans, and investment options.
   </p>
   <p>
    Our team of experienced professionals is dedicated to helping you achieve your financial goals. We are committed to providing excellent customer service and ensuring that your banking experience is convenient and hassle-free.
   </p>
   <p>
    Thank you for choosing TrustGuard Bank. We look forward to serving you.
   </p>
  </div>
  <div class="footer">
   <p>
    © 2023 TrustGuard Bank. All rights reserved.
   </p>
  </div>
 </body>
</html>