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

@WebServlet("/update")
public class UpdateProfile extends HttpServlet {

    // Database configuration
    private static final String DB_URL = "jdbc:mysql://localhost:3306/bankingapplication";
    private static final String DB_USER = "root"; 
    private static final String DB_PASSWORD = "root"; 

    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 RequestDispatcher dispatcher=req.getRequestDispatcher("updateProfile.jsp");
     dispatcher.forward(req, resp);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp"); // Redirect if no session exists
            return;
        }

        // Get user data from request
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String phono = request.getParameter("phono");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");

        try {
        	DriverManager.registerDriver(new Driver());
        	Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "UPDATE userdetails SET firstname = ?, lastname = ?, phono = ?, age = ?, gender = ?, address = ? WHERE email = ?") ;

            // Set parameters
            preparedStatement.setString(1, firstName);
            preparedStatement.setString(2, lastName);
            preparedStatement.setString(3, phono);
            preparedStatement.setInt(4, Integer.parseInt(age));
            preparedStatement.setString(5, gender);
            preparedStatement.setString(6, address);
            preparedStatement.setString(7, email);

            // Execute update
            int rowsAffected = preparedStatement.executeUpdate();

            // Set a message based on the result
            if (rowsAffected > 0) {
                session.setAttribute("message", "Profile updated successfully.");
            } else {
                session.setAttribute("message", "No changes were made to your profile.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("message", "Error occurred while updating the profile.");
        }

       
        response.sendRedirect("show.jsp");
    }
}

