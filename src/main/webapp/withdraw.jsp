<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>withdrawform</title>
 <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background:linear-gradient(to right, rgba(144, 238, 144, 0.5), rgba(173, 216, 230, 0.5), rgba(255, 255, 224, 0.5));
            
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
		width:20vw;
		hieght:100vh;
		float: left;
		text-align: justify;
		margin-left: 600px;
		}
    </style>
    <script>
    function validateForm() {
        var userid = document.getElementById("userid").value;
        var password = document.getElementById("password").value;
        int accountnumber=document.getElementById("accountnumber").value;
        int amount=document.getElementbyId("amount").value;
        if (userid === "" || password === "" || accountnumber==="" || amount==="") {
            alert("Please enter both username and password.");
            return false; // Prevent form submission
        }
        return true; 
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
            <a href="#" style="color: white;">TBG@gm.com</a>
        </div>
        
    </div>
    <center>
    <form action="WithdrawServlet" onsubmit="return validateForm();" method="post">
    	<h1 style="font-size: 40px;font-style: bold;">withdraw from</h1><br><br>
    	<div id="cont">
    	
       <label >Account Number</label><input type="number" name="accountnumber" required><br><br>
       <label>User Name</label><input type="text" name="userid" required><br><br>
       <label>Password</label><input type="password" name="password" required><br><br>
    	Amount<input type="number" name="amount" required><br><br><br>
    	<a href="withdraw.jsp"><input style="margin-right: 60px;border-radius: 2px" type="submit" value="Reset" ></a>
    	<a href="login.jsp"><input style="margin-right: 20px;border-radius: 2px" type="submit" value="Submit" ></a>
    	
    	</div>
		</form>
    </center>
    
    <footer>
        <p>© 2024 TRUSTGUARD BANK. All rights reserved.</p>
    </footer>

</body>
</html>--%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Withdraw Form</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, rgba(144, 238, 144, 0.5), rgba(173, 216, 230, 0.5), rgba(255, 255, 224, 0.5));
        }
        .navbar {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }
        .navbar .brand {
            font-size: 24px;
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
    <script>
        function validateForm() {
            var userid = document.getElementById("userid").value;
            var accountnumber = document.getElementById("accountnumber").value;
            var amount = document.getElementById("amount").value;

            if (userid === "" || accountnumber === "" || amount === "") {
                alert("Please fill all fields.");
                return false; // Prevent form submission
            }
            return true; 
        }
    </script>
</head>
<body>
    <div class="navbar">
        <div class="brand">TrustGuard Bank</div>
        <div class="middle-links">
            <a href="#" style="color: white;">Deposit Schemes</a>
            <a href="#" style="color: white;">Loan Schemes</a>
            <a href="mailto:TBG@gm.com" style="color: white;">Contact Us</a>
        </div>
    </div>
    
    <center>
        <form action="WithdrawServlet" onsubmit="return validateForm();" method="post">
            <h1 style="font-size: 24px; font-weight: bold;">Withdraw Funds</h1>
            <div id="cont">
                <label>Account Number</label>
                <input type="number" id="accountnumber" name="accountnumber" required>
                <label>User ID</label>
                <input type="text" id="userid" name="userid" required>
                <label>Password</label>
                <input type="password" name="password" required>
                <label>Amount</label>
                <input type="number" id="amount" name="amount" required>
                <input type="reset" value="Reset">
                <input type="submit" value="Submit">
            </div>
        </form>
    </center>

    <footer>
        <p>© 2024 TRUSTGUARD BANK. All rights reserved.</p>
    </footer>
</body>
</html>

