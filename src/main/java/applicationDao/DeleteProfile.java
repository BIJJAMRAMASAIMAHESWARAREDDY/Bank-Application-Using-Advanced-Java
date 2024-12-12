package appilicationDao;

 // Adjust the package name as per your project structure

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.Driver;

@WebServlet("/delete")
public class DeleteProfile extends HttpServlet {
    
    // Database configuration
    private static final String DB_URL = "jdbc:mysql://localhost:3306/bankapplication";
    private static final String DB_USER = "root"; // Replace with your DB username
    private static final String DB_PASSWORD = "root"; // Replace with your DB password
    
   
    	@Override
    	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 RequestDispatcher dispatcher=req.getRequestDispatcher("deleteProfile.jsp");
         dispatcher.forward(req, resp);
    	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password=request.getParameter("password");
        
        try {
        	DriverManager.registerDriver(new Driver());
        	Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        
             PreparedStatement preparedStatement = connection.prepareStatement("DELETE  FROM userdetails WHERE email = ?");

            // Set the email parameter
            preparedStatement.setString(1, email);

            // Execute the delete statement
            int rowsAffected = preparedStatement.executeUpdate();

            // Prepare response
            if (rowsAffected > 0) {
                request.setAttribute("message", "Profile deleted successfully.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "No user found with that email.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error occurred while deleting the profile.");
        }

        // Forward to a JSP page to display the message
       
    }
}
