//package applicationDao;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//import java.io.IOException;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.mysql.cj.jdbc.Driver;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//@WebServlet("/WithdrawServlet")
//public class WithDrawServlet 
//{
//	public static Connection getConnection() throws SQLException 
//	{
//        String url = "jdbc:mysql://localhost:3306/bankapplication"; // Change to your database URL
//        String user = "root"; // Change to your DB username
//        String password = "root"; // Change to your DB password
//   DriverManager.registerDriver(new Driver());
//       Connection con=  DriverManager.getConnection(url, user, password);
//       
//       return con;
//	}
//	
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
//	{
//	        HttpSession session = request.getSession();
//	        String username = (String) session.getAttribute("username");
//	        String userId=request.getParameter("userid");
//	        String accountnumber=request.getParameter("accountnumber");
//	        String amount=request.getParameter("amount");// Assuming username is stored in session
//	        double amountToWithdraw = Double.parseDouble(request.getParameter("amount"));
//
//	        if (username != null) 
//	        {
//	            try 
//	            {
//	                Connection connection = getConnection(); // Your method to get DB connection
//	                String query = "SELECT balance FROM userdetails WHERE userid = ?";
//	                PreparedStatement preparedStatement = connection.prepareStatement(query);
//	                preparedStatement.setString(1, userId);
//	                ResultSet resultSet = preparedStatement.executeQuery();
//
//	                if (resultSet.next()) 
//	                {
//	                    double currentBalance = resultSet.getDouble("balance");
//	                    if(resultSet.getString("accountnumber").equals(accountnumber))
//	                    	
//	                    {
//	                    if (currentBalance >= amountToWithdraw) 
//	                    {
//	                        // Deduct amount
//	                        String updateQuery = "UPDATE userdetails SET balance = balance - ? WHERE userid = ?";
//	                        PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
//	                        updateStatement.setDouble(1, amountToWithdraw);
//	                        updateStatement.setString(2, userId);
//	                        updateStatement.executeUpdate();
//System.out.println("balance updated");
//	                        response.getWriter().println("Withdrawal successful! New balance: " + (currentBalance - amountToWithdraw));
//	                        RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
//	                    } 
//	                    else 
//	                    {
//	                        response.getWriter().println("Insufficient balance!");
//	                        System.out.println("no balance");
//	                    }
//	                } 
//	                }
//	                else 
//	                {
//	                	System.out.println("user not found");
//	                    response.getWriter().println("User not found!");
//	                }
//	            } 
//	            catch (SQLException e) 
//	            {
//	                e.printStackTrace();
//	                response.getWriter().println("An error occurred while processing your request.");
//	            }
//	        } 
//	        else 
//	        {
//	            response.getWriter().println("Please log in to withdraw money.");
//	        }
//	    }
//	}
//

package appilicationDao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.Driver;

import appilicationDto.UserDto;

@WebServlet("/WithdrawServlet")
public class WithDrawServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
  UserDto userDto=new UserDto();
    public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/bankapplication"; // Change to your database URL
        String user = "root"; // Change to your DB username
        String password = "root"; // Change to your DB password
        DriverManager.registerDriver(new Driver());
       Connection con= DriverManager.getConnection(url, user, password);
       
       return con;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String userId = request.getParameter("userid");
        String accountnumber = request.getParameter("accountnumber");
        double amountToWithdraw = Double.parseDouble(request.getParameter("amount"));

        if (userId != null) {
            try (Connection connection = getConnection()) {
                String query = "SELECT balance, accountnumber FROM userdetails WHERE userid = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, userId);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    double currentBalance = resultSet.getDouble("balance");
                    String dbAccountNumber = resultSet.getString("accountnumber");

                    if (dbAccountNumber.equals(accountnumber)) {
                        if (currentBalance >= amountToWithdraw) {
                            // Deduct amount
                            String updateQuery = "UPDATE userdetails SET balance = balance - ? WHERE userid = ?";
                            PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
                            updateStatement.setDouble(1, amountToWithdraw);
                            updateStatement.setString(2, userId);
                            updateStatement.executeUpdate();

                            response.getWriter().println("Withdrawal successful! New balance: " + (currentBalance - amountToWithdraw));
                            
                            RequestDispatcher dispatcher = request.getRequestDispatcher("withdrawsuccess.jsp");
                            dispatcher.forward(request, response);
                            request.setAttribute("balance",currentBalance  );
                        } else {
                        	 RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                             dispatcher.forward(request, response);
                        }
                    } else {
                        response.getWriter().println("Account number does not match!");
                    }
                } else {
                    response.getWriter().println("User not found!");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("An error occurred while processing your request.");
            }
        } else {
            response.getWriter().println("Please log in to withdraw money.");
        }
    }
}

