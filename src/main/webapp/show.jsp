<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
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
    </style><!-- Add your CSS file -->
</head>
<body>
<div class="navbar">
   <div class="logo">
    <img alt="Bank Logo" src="https://via.placeholder.com/40" />
    <span>TrustGuard Bank</span>
   </div>
   <div class="nav-links">
    <a href="#home">Home</a>
    <a href="#deposit-schemes">Deposit Schemes</a>
    <a href="#about">About</a>
    <a href="mailto:TGB@gmail.com">TGB@gmail.com</a>
   </div>
   <div class="right">
    <button class="menu-btn">
     <i class="fa fa-bars"></i>
    </button>
    <div class="menu">
     <a href="show.jsp">Profile</a>
     <a href="updateprofile.jsp">Update</a>
     <a href="deleteprofile.jsp">Delete</a>
     <a href="logout.jsp">Logout</a>
    </div>
    <div class="container">
        <h1>User Profile</h1>
        
        <c:if test="${not empty errorMessage}">
            <div class="error-message">
                <p>${errorMessage}</p>
            </div>
        </c:if>
        
        <c:if test="${not empty firstname}">
            <div class="user-details">
            <form action="profile" method="get">
                <div class="user-details">
               
                 <p><strong>First Name:</strong> ${userDto.firstname}</p>
            <p><strong>Last Name:</strong> ${userDto.lastname}</p>
            <p><strong>Email:</strong> ${userDto.email}</p>
            <p><strong>Phone:</strong> ${userDto.phone}</p>
            <p><strong>Age:</strong> ${userDto.age}</p>
            <p><strong>Gender:</strong> ${userDto.gender}</p>
            <p><strong>Address:</strong> ${userDto.address}</p>
            <p><strong>User ID:</strong> ${userDto.userid}</p>
            <p><strong>Account Number:</strong> ${userDto.accountnumber}</p>
                </form>
            </div>
            </div>
        </c:if>

        <div class="actions">
            <a href="editProfile.jsp">Edit Profile</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>
</body>
</html>
