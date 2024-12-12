package appilicationDao;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/BalanceEnquiryServlet")
public class BalanceEnquiryServlet extends HttpServlet 
{
	public static Connection getConnection() throws SQLException 
	{
        String url = "jdbc:mysql://localhost:3306/bankingapplication"; // Change to your database URL
        String user = "root"; // Change to your DB username
        String password = "root"; // Change to your DB password
        	DriverManager.registerDriver(new Driver());
        Connection con= DriverManager.getConnection(url, user, password);
        return con;
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher=req.getRequestDispatcher("showbalance.jsp");
        dispatcher.forward(req, resp);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 HttpSession session = request.getSession();
         String email = (String) session.getAttribute("email");
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        long accountNumber = Long.parseLong(request.getParameter("accountNumber"));

        if (userId != null && password != null) {
            try {
                Connection connection = getConnection(); // Your method to get DB connection
                
                // Validate user credentials and get balance
                String query = "SELECT balance FROM userdetails WHERE email = ? AND password = ? AND accountnumber = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, password);
                preparedStatement.setLong(3, accountNumber);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                     resultSet.getDouble("balance");
                    resultSet.getString("email");
                    resultSet.getString("password");
                    resultSet.getString("accountnumber");
                   
                    RequestDispatcher dispatcher=request.getRequestDispatcher("balanceview.jsp");
                    dispatcher.forward(request, response);
                } else {
                    RequestDispatcher dispatcher=request.getRequestDispatcher("balnceenquiry.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("An error occurred while processing your request.");
            }
        } else {
            response.getWriter().println("Please log in to check your balance.");
        }
    }
}
