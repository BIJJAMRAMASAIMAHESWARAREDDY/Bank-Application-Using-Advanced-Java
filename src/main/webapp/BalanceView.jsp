<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Balance View</title>
    
    <style>
        /* Center the balance box on the page */
        .balance-box {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 500px;               /* Adjust width as needed */
            height: 300px;              /* Adjust height as needed */
            margin: auto;               /* Centers the box horizontally */
            background-color: #f5f5f5;  /* Box background color */
            border: 2px solid #4CAF50;  /* Border color */
            border-radius: 8px;         /* Rounded corners */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow */
            color: #333;                /* Text color */
            font-size: 24px;            /* Font size */
            font-weight: bold;          /* Bold font */
            text-align: center;
        }
        /* General button styles */
.button {
    background-color: #4CAF50; /* Green background */
    color: white; /* White text */
    border: none; /* No border */
    padding: 15px 20px; /* Padding for top/bottom and left/right */
    text-align: center; /* Center text */
    text-decoration: none; /* No underline */
    display: inline-block; /* Allow setting width and height */
    font-size: 16px; /* Increase font size */
    margin: 10px 2px; /* Margin around buttons */
    cursor: pointer; /* Pointer cursor on hover */
    border-radius: 5px; /* Rounded corners */
    transition: background-color 0.3s ease; 
    
    margin-left:45%;/* Smooth transition for hover */
}

/* Hover effect */
.button:hover {
    background-color: #45a049; /* Darker green on hover */
}

/* Active effect */
.button:active {
    background-color: #3e8e41; /* Even darker green when clicked */
    transform: translateY(1px); /* Slight downward shift */
}

/* Disabled button */
.button:disabled {
    background-color: #ccc; /* Gray background */
    color: #666; /* Darker gray text */
    cursor: not-allowed; /* Not allowed cursor */
}

    </style>
</head>
<body>
<form action="BalanceEnquiryServlet" method="get">
    <div class="balance-box">
        <%
            // Fetch balance from session and display it
            session = request.getSession();
            Object balance = session.getAttribute("balance"); 
           %>
           <h1> Your account balance is : <%= request.getAttribute("balance"); %></h1>
           
        
    </div>
    </form>
    <button type="button" class="button"><a href="Home.html">Back</a></button>

</body>
</html>
