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
        background: linear-gradient(to right, rgba(144, 238, 144, 0.5), rgba(173, 216, 230, 0.5), rgba(255, 255, 224, 0.5));
    }
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #333;
        padding: 10px;
        color: white;
    }
    /* Additional styles omitted for brevity */
</style>
</head>
<body>
    <form action="register" method="get">
    <center>
        <div class="navbar">
            <div class="brand">TrustGuard Bank</div>
            <div class="middle-links">
                <a href="#" style="color: white;">Deposit Schemes</a>
                <a href="#" style="color: white;">Loan Schemes</a>
                <a href="#" style="color: white;">TBG@gm.com</a>
            </div>
        </div>
        <br><br><br><br><br><br>
        <h1>enter amount to add :</h1><br>
        <a href="index.jsp"><input style="margin-right: 750px;border-radius: 2px;font-size: 25px" type="button" value="Login"></a>
    </center>
    </form>
    
    <footer>
        <p>© 2024 TRUSTGUARD BANK. All rights reserved.</p>
    </footer>
</body>
</html>
