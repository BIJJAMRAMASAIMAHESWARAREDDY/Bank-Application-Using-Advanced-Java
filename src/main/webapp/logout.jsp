<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
<head>
    <title>Logout - TrustGuard Bank</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
    <style>
        /* Add your styles here */
    </style>
</head>
<body>
    <%
    HttpSession existingSession = request.getSession(false);
    if (existingSession != null) {
        existingSession.invalidate(); // Invalidate session
    }
    %>
    <div class="navbar">
        <!-- Include navbar here -->
    </div>
    
    <div class="main-content">
        <h2>You have successfully logged out.</h2>
        <a href="index.jsp">Click here to login again</a>
    </div>

    <div class="footer">
        <p>&copy; 2023 TrustGuard Bank. All rights reserved.</p>
    </div>
</body>
</html>
