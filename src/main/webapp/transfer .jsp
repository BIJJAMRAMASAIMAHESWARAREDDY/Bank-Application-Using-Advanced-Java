<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>transfer</title>
<style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: white;
            background:linear-gradient(to right, rgba(144, 238, 144, 0.5), rgba(173, 216, 230, 0.5), rgba(255, 255, 224, 0.5));;
            
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            padding: 10px;
            color: white;
            position: relative;
        }
        .navbar .menu-icon {
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
        .content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 50px);
            background-color: pink;
        }
        .content .welcome-box {
            
            border: 1px solid black;
            width: 80%;
            height: 60%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: white;
            margin-bottom: 70px;
        }
        .content .welcome-box h1 {
            color: #FF69B4;
            font-size: 30px;
            text-align: center;
            margin-top: 0;
            
        }
        .content .button-group {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .content .button-group .button {
            background-color: #1E90FF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }
       
        footer {
    		background-color: #333;
   			color: white;
    		text-align: center;
    		padding: 3px;
    		position: fixed;
    		width: 100%;
    		bottom: 0;
		}
		input
		{
		float:right;}
		#cont
		{
		width:25vw;
		hieght:100vh;
		float: left;
		text-align: justify;
		margin-left: 600px;
		}
    </style>
    <script>
    function validateForm() {
    var userId = document.getElementsByName("userId")[0].value;
    var accountNumber = document.getElementsByName("accountNumber")[0].value;
    var amount = document.getElementsByName("amount")[0].value;
    var password = document.getElementsByName("password")[0].value;
    var receiverAccountNumber = document.getElementsByName("receiverAccountNumber")[0].value;

    if (userId === "" || accountNumber === "" || amount === "" || password === "" || receiverAccountNumber === "") {
        alert("Please fill all fields.");
        return false; // Prevent form submission
    }
    return true; 
}
    </script>
</head>
<body>
<form action="">
    <div class="navbar">
        <div class="menu-icon" onclick="toggleDropdown()">
            <i class="fas fa-bars"></i>
        </div>
        <div class="brand">TrustGuard Bank</div>
        <div class="middle-links">
            <a href="#" style="color: white;">Deposit Schemes</a>
            <a href="#" style="color: white;">Loan Schemes</a>
            <a href="mailto:TGB@gmail.com" style="color: white;">TBG@gmail.com</a>
        </div>
        
    </div>
    <center>
    	<h1 style="font-size: 40px;font-style: bold;">transfer amount from</h1><br><br>
    	<div id="cont">
    	<form action="transfer" method="post" onSubmit="return validateForm();">
       <label >Account Number:</label><input type="number" name="accountNumber" required ><br><br>
       <label>User Name:</label><input type="text" name="userId" required><br><br>
       <label>Password:</label><input type="password" name="password" required><br><br>
       Receiver Account Number:<input type="number" name="receiverAccountNumber" required><br><br>
    	Amount:<input type="number" name="amount" required><br><br><br>
    	<input style="margin-right: 60px;border-radius: 2px" type="submit" value="Submit">
    	<input style="margin-right: 20px;border-radius: 2px" type="reset" value="Reset">
    	</form>
    	</div>
    	<footer>
        <p>© 2024 TRUSTGUARD BANK. All rights reserved.</p>
    </footer>
		
    </center>
    
</form>
</body>
</html>