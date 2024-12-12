package appilicationDao;





import java.io.IOException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.Driver;

import appilicationDto.UserDto;

@WebServlet("/register")
public class UserDao extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String ALPHANUMERIC_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final SecureRandom random = new SecureRandom();
    private Random ran = new Random();
    public static String generateRandomString(int length) {
        StringBuilder result = new StringBuilder(length);
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(ALPHANUMERIC_CHARACTERS.length());
            result.append(ALPHANUMERIC_CHARACTERS.charAt(index));
        }
        return result.toString();
    }

    public Connection createConnection() throws Exception {
        // It's good practice to load database properties from an external file.
        // FileInputStream fileInputStream = new FileInputStream("/path/to/db.properties");
        // Properties properties = new Properties();
        // properties.load(fileInputStream);
        // String url = properties.getProperty("db.url");
        // String user = properties.getProperty("db.user");
        // String password = properties.getProperty("db.password");
        
        // Example connection string:
    	DriverManager.registerDriver(new Driver());
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication?createDatabaseIfNotExist=true", "root", "root");
        
        // Create the table if it does not exist
        try (PreparedStatement preparedStatement = con.prepareStatement("CREATE TABLE IF NOT EXISTS userDetails ("
                + "id INT AUTO_INCREMENT PRIMARY KEY,"
                + "firstname VARCHAR(45),"
                + "lastname VARCHAR(45),"
                + "email VARCHAR(45) UNIQUE,"
                + "password VARCHAR(45),"
                + "phono BIGINT,"
                + "age INT,"
                + "gender VARCHAR(45),"
                + "address VARCHAR(45),"
                + "userid VARCHAR(45) UNIQUE,"
                + "accountNumber BIGINT UNIQUE,"
                + "balance FLOAT)")) {
            preparedStatement.execute();
        }
        
        return con;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDto userdto = new UserDto();
            Connection con = createConnection();

            // Collecting parameters from the request
            String firstName = req.getParameter("firstname");
            String lastName = req.getParameter("lastname");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String address = req.getParameter("address");
            String gender = req.getParameter("gender");
            long phono = Long.parseLong(req.getParameter("phono"));
            int age = Integer.parseInt(req.getParameter("age"));
            String userId = generateRandomString(8);
            long accountNumber = ran.nextLong(90000000000000L, 9999999999999999L); // Ensure positive value
            float balance = Float.parseFloat(req.getParameter("balance"));

            // Inserting user data into the database
            try (PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO userDetails  VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
            	preparedStatement.setInt(1,userdto.getId() );
            	preparedStatement.setString(2, firstName);
                preparedStatement.setString(3, lastName);
                preparedStatement.setString(4, email);
                preparedStatement.setString(5, password);
                preparedStatement.setLong(6, phono);
                preparedStatement.setInt(7, age);
                preparedStatement.setString(8, gender);
                preparedStatement.setString(9, address);
                preparedStatement.setString(10, userId);
                preparedStatement.setLong(11, accountNumber);
                preparedStatement.setFloat(12, balance);

                preparedStatement.executeUpdate();
            }

            req.setAttribute("userId", userId);
            req.setAttribute("accountnumber",accountNumber);
            req.getRequestDispatcher("registerSuccess.jsp").forward(req, resp);

        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "Database error: " + e.getMessage());
            req.getRequestDispatcher("registration_form.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "An error occurred: " + e.getMessage());
            req.getRequestDispatcher("registration_form.jsp").forward(req, resp);
        }
    }
}

