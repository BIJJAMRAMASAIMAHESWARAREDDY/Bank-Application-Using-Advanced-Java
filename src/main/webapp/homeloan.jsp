<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .navbar {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar .logo {
            display: flex;
            align-items: center;
        }
        .navbar .logo i {
            margin-right: 10px;
        }
        .navbar .nav-links {
            display: flex;
            gap: 20px;
        }
        .navbar .nav-links a {
            color: white;
            text-decoration: none;
        }
        .navbar .nav-links a:hover {
            text-decoration: underline;
        }
        .banner {
            background-color: #ff69b4;
            color: white;
            overflow: hidden;
            white-space: nowrap;
            position: relative;
            height: 40px;
        }
        .banner span {
            display: inline-block;
            padding: 10px 20px;
            position: absolute;
            left: 100%;
            animation: scroll 10s linear infinite;
        }
        @keyframes scroll {
            0% {
                left: 100%;
            }
            100% {
                left: -100%;
            }
        }
        .form-container {
            padding: 20px;
            text-align: center;
        }
        .form-container form {
            display: flex;
            flex-direction: column;
            max-width: 400px;
            margin: 0 auto;
        }
        .form-container form label {
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-container form input, .form-container form select {
            margin-bottom: 15px;
            padding: 10px;
            font-size: 16px;
        }
        .form-container form button {
            padding: 10px;
            background-color: #333;
            color: white;
            border: none;
            cursor: pointer;
        }
        .form-container form button:hover {
            background-color: #555;
        }
        .left,.middle,.right{
        	height:65vh;
        	width:30vw;
        	float:left;
        	background-color:lavender;
        	margin-left:20px;
        	margin-top:10px;
        }
        .middle{
        	background-color:pink;
        }
        .right{
        	background-color:aqua;
        }
        .term{
        	background-color:green;
        	color:white;
        	border-radius:2px;
        	width:100px;
        	height:25px;
        	margin-left:170px;
        }
        .select{
        width:100px;
        height:30px;
        background-color:chocolate;
        color:white;
        border:none;
        border-radius:2px;
        margin-top:10vh;
        }
         #cont {
            width: 300px; /* Set a width for the form container */
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto; /* Center the container */
        }
        input[type="text"],
        input[type="number"],
        input[type="password"],
        input[type="reset"],
        input[type="submit"] {
            width: 100%; /* Full width for inputs */
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #1E90FF;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        footer {
            text-align: center;
            padding: 10px;
            background-color: #333;
            color: white;
            position: relative; /* Position footer normally */
            bottom: 0;
            width: 100%;
        }
      </style>
</head>
<body>
<div class="navbar">
        <div class="logo">
            <i class="fas fa-university"></i>
            <span>TrustGuard Bank</span>
        </div>
        <div class="nav-links">
            <a href="#deposit-schemes">Deposit Schemes</a>
            <a href="loanSchemes.jsp">Loan Schemes</a>
            <a href="about.jsp">About</a>
            <a href="mailto:TGB@gmail.com">TGB@gmail.com</a>
        </div>
    </div>
    <div class="banner">
        <span>WELCOME TO TRUSTGUARD BANK</span>
    </div>
    <center>
      <form action="loan" method="post">
            <h1 style="font-size: 24px; font-weight: bold;"> LOAN</h1>
            <div id="cont">
                <label>Account Number</label>
                <input type="number" id="accountnumber" name="accountnumber" required>
                <label>enter loan amount:</label>
                <input type="text" id="userid" name="amount" required>
                <label>enter type of loan:</label>
                <input type="text" id="userid" name="loan" required>
                <label>Password</label>
                <input type="password" name="password" required>
                <label>enter tenure :</label>
                <input type="number"  id="amount" name="tenure" required>
                <input type="reset" value="Reset">
                <input type="submit" value="Submit">
            </div>
        </form>
        </center>
</body>
</html>