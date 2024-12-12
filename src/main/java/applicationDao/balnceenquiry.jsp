<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Balance Enquiry</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: white;
            background: linear-gradient(to right, rgba(144, 238, 144, 0.5), rgba(173, 216, 230, 0.5), rgba(255, 255, 224, 0.5));
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
        .brand {
            margin-left: 40px;
            font-size: 18px;
            color: white;
        }
        .content {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 50px);
            background-color: pink;
        }
        .form-container {
            border: 1px solid black;
            width: 30%;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="brand">TrustGuard Bank</div>
    </div>
    <div class="content">
        <h1>Balance Enquiry</h1>
        <div class="form-container">
            <form action="BalanceEnquiryServlet" method="post">
                <label for="accountNumber">Account Number:</label><br>
                <input type="number" name="accountNumber" required><br><br>
                <label for="userId">User Name:</label><br>
                <input type="text" name="userId" required><br><br>
                <label for="password">Password:</label><br>
                <input type="password" name="password" required><br><br>
                <input type="submit" value="Check Balance">
            </form>
        </div>
    </div>
    <footer>
        <p>© 2024 TRUSTGUARD BANK. All rights reserved.</p>
    </footer>
</body>
</html>
    