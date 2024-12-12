<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>TrustGuard Bank</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <i class="fas fa-university"></i>
            <span>TrustGuard Bank</span>
        </div>
        <div class="nav-links">
            <a href="login .jsp">Home</a>
            <a href="loanSchemes.jsp">Loan Schemes</a>
            <a href="about.jsp">About</a>
            <a href="mailto:TGB@gmail.com">TGB@gmail.com</a>
        </div>
    </div>
    <div class="banner">
        <span>WELCOME TO TRUSTGUARD BANK</span>
    </div>
    
    <div class="form-container" id="deposit-schemes">
        <h2>Deposit Schemes</h2>
        <p style="color:green">We offer elegant deposit schemes that meet the needs of individual and commercial customers.</p>
        <div class="left">
	        	<h1 style="color:brown">Bronze</h1>
	        	<h4 class="term">Short term</h4>
	        	<ul type="disc">
	        		<li>1 year </li>
	        		<li>1,3 or 5 lakh deposit amount</li>
	        	</ul>
	        	<p>If you are someone who requires to see the doctor once in a blue moon, 
	        	then the bronze plan could just be the right option for you. 
	        	Something like a yearly check-up or a prescription drug does not need you to have a heftier plan.
	        	Bronze plans allow you to keep a minimal coverage at the lowest premiums.
	        	However, if you need anything beyond primary preventive care,
	        	then your expenses could rise as you would be paying entirely from your side.</p>
	        	<a href="deposit.jsp"><input type="submit" class="select" value="select plan"></a>
        </div>
        <div class="middle">
        	<h1 style="color:white">Silver</h1>
        	<h4 class="term">Mid term</h4>
        	<ul type="disc">
        		<li>3 years </li>
        		<li>1,3 or 5 lakh deposit amount</li>
        	</ul>
        	<p>These plans are more comprehensive and will allow you to travel beyond state boundaries,
        	 but they aren't ideal for every situation. Silver plans often offer a lower 
        	 deductible and out-of-pocket limit compared to the Bronze plans.
        	 They encompass all prescription medicines as well as the majority of doctor's appointments.
        	 If you are someone who requires only preventive care instead of the more serious medical needs,
        	 then Silver plans could prove to be immensely advantageous.</p>
        	<a href="deposit.jsp"> <input type="submit" class="select" value="select plan"></a>
        </div>
        </form>
        <div class="right">
        	<h1 style="color:orange">Gold</h1>
        	<h4 class="term">Long term</h4>
        	<ul type="disc">
        		<li>5 years </li>
        		<li>1,3 or 5 lakh deposit amount</li>
        	</ul>
        	<p>Although this plan is premium, the benefits may justify the prices. 
        	It's dependable, cost-effective, and keeps you protected. 
        	The Gold plans offer the best solutions for people
        	who are aware that they will have various healthcare needs,
        	such as pregnancy and more rigorous health management. 
        	Monthly premiums will be higher, but your deductible will be lower. 
        	As a result, you'll spend less on any procedures or illnesses.</p>
        	<a href="deposit.jsp"><input type="submit" class="select" value="select plan"></a>
        
</body>
</html>