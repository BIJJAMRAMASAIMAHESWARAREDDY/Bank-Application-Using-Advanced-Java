package appilicationDao;

import java.io.IOException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.cj.jdbc.Driver;
import appilicationDto.BankDto;
import appilicationDto.UserDto;

//@WebServlet("/hiddenform") // Ensure your servlet is mapped correctly
public class BankDao extends HttpServlet {

    private static final long serialVersionUID = 1L; // Recommended for serializable classes
    private Random ran = new Random();
    private static final String ALPHANUMERIC_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final SecureRandom random = new SecureRandom();

    public static String generateRandomString(int length) {
        StringBuilder result = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(ALPHANUMERIC_CHARACTERS.length());
            result.append(ALPHANUMERIC_CHARACTERS.charAt(index));
        }
        return result.toString();
    }

    public Connection createConnection() throws SQLException {
        DriverManager.registerDriver(new Driver());
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication?createDatabaseIfNotExist=true", "root", "root");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDto userDto = new UserDto();

        // Get user input
        String email = req.getParameter("email");
        

        // Set user details
        userDto.setEmail(email);
         // Assuming ID is sent as a string

        try (Connection con = createConnection()) {
            // Create table if it does not exist
            String createTableSQL =" CREATE TABLE IF NOT EXISTS bank (id INT AUTO_INCREMENT PRIMARY KEY,email VARCHAR(45) NOT NULL UNIQUE,userid VARCHAR(45) NOT NULL UNIQUE,accountnumber BIGINT NOT NULL UNIQUE)";
            	

            try (PreparedStatement preparedStatement = con.prepareStatement(createTableSQL)) {
                preparedStatement.execute();
            }

            // Generate random string and account number
            String randomString = generateRandomString(8);
            long accountNumber = ran.nextLong(10000000000000L, 9999999999999999L);

            // Insert into database
            String insertSQL = "INSERT INTO bank (id, email,userid, accountnumber) VALUES (?, ?,?, ?)";
            try (PreparedStatement prepareStatement = con.prepareStatement(insertSQL)) {
                prepareStatement.setInt(1, userDto.getId()); // Convert ID to string if necessary
                prepareStatement.setString(2, email);
                prepareStatement.setString(3, randomString);
                prepareStatement.setLong(4, accountNumber);
                prepareStatement.executeUpdate();
            }

            // Redirect to a success page
         //   resp.sendRedirect("Login.jsp"); // Create this page to inform the user of successful registration
        } catch (SQLException e) {
            e.printStackTrace();
            
        }
    }

	
}
