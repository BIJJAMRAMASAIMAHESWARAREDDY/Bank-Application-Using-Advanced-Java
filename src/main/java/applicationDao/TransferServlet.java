package appilicationDao;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/transfer")

public class TransferServlet extends HttpServlet 
{
	public static Connection getConnection() throws SQLException 
	{
        String url = "jdbc:mysql://localhost:3306/bankapplication"; // Change to your database URL
        String user = "root"; // Change to your DB username
        String password = "root"; // Change to your DB password

        return DriverManager.getConnection(url, user, password);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher=req.getRequestDispatcher("transfersuccess.jsp");
        dispatcher.forward(req, resp);
	}
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = request.getParameter("userid");
        String password = request.getParameter("password");
        long senderAccountNumber = Long.parseLong(request.getParameter("accountNumber"));
        long receiverAccountNumber = Long.parseLong(request.getParameter("receiverAccountNumber"));
        double amountToTransfer = Double.parseDouble(request.getParameter("amount"));

        if (userId != null && password != null) {
            try {
                Connection connection = getConnection(); // Your method to get DB connection
                
                // Validate user credentials
                String validateUserQuery = "SELECT balance FROM userdetails WHERE userid = ? AND password = ? AND accountnumber = ?";
                PreparedStatement validateUserStmt = connection.prepareStatement(validateUserQuery);
                validateUserStmt.setString(1, userId);
                validateUserStmt.setString(2, password);
                validateUserStmt.setLong(3, senderAccountNumber);
                ResultSet userResultSet = validateUserStmt.executeQuery();

                if (userResultSet.next()) {
                    double senderBalance = userResultSet.getDouble("balance");

                    // Check if sender has enough balance
                    if (senderBalance >= amountToTransfer) {
                        // Check recipient balance
                        String queryRecipient = "SELECT accountnumber FROM userid WHERE accountnumber = ?";
                        PreparedStatement preparedStatementRecipient = connection.prepareStatement(queryRecipient);
                        preparedStatementRecipient.setLong(1, receiverAccountNumber);
                        ResultSet resultSetRecipient = preparedStatementRecipient.executeQuery();

                        if (resultSetRecipient.next()) {
                            // Deduct amount from sender
                            String updateSenderQuery = "UPDATE userdetails SET balance = balance - ? WHERE userid = ? AND accountnumber = ?";
                            PreparedStatement updateSenderStatement = connection.prepareStatement(updateSenderQuery);
                            updateSenderStatement.setDouble(1, amountToTransfer);
                            updateSenderStatement.setString(2, userId);
                            updateSenderStatement.setLong(3, senderAccountNumber);
                            updateSenderStatement.executeUpdate();

                            // Add amount to recipient
                            String updateRecipientQuery = "UPDATE userdetails SET balance = balance + ? WHERE accountnumber = ?";
                            PreparedStatement updateRecipientStatement = connection.prepareStatement(updateRecipientQuery);
                            updateRecipientStatement.setDouble(1, amountToTransfer);
                            updateRecipientStatement.setLong(2, receiverAccountNumber);
                            updateRecipientStatement.executeUpdate();

                            response.getWriter().println("Transfer successful! New balance: " + (senderBalance - amountToTransfer));
                            RequestDispatcher dispatcher=request.getRequestDispatcher("transfersuccess.jsp");
                            dispatcher.forward(request, response);
                        } else {
                            response.getWriter().println("Recipient account not found!");
                            RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
                            dispatcher.forward(request, response);
                        }
                    } else {
                        response.getWriter().println("Insufficient balance!");
                    }
                } else {
                    response.getWriter().println("Invalid username or password!");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.getWriter().println("An error occurred while processing your request.");
            }
        } else {
            response.getWriter().println("Please log in to transfer money.");
        }
    }
}

