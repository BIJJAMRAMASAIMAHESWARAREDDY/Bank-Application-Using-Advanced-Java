package Bank;


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

import com.mysql.cj.xdevapi.Statement;

@WebServlet("/UserReg")
public class Registration  extends HttpServlet{	
	
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

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	model m=new model();
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
         try {
        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank1?createDatabaseIfNotExist=true", "root", "root");
 			System.out.println("Driver Loaded and Db connection established");
 			PreparedStatement statement = con.prepareStatement("CREATE TABLE IF NOT EXISTS abzbank1 ("
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
 	                + "balance FLOAT)") ;
 	            statement.execute();
        	 PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO abzbank1  VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
         	preparedStatement.setInt(1,m.getId() );
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
         

         req.setAttribute("accountnumber", accountNumber);
         req.getRequestDispatcher("RegisterSuccess.jsp").forward(req, resp);
         }
      catch (SQLException e) {
         e.printStackTrace();
         req.setAttribute("error", "Database error: " + e.getMessage());
         req.getRequestDispatcher("Register.html").forward(req, resp);
     } catch (Exception e) {
         e.printStackTrace();
         req.setAttribute("error", "An error occurred: " + e.getMessage());
         req.getRequestDispatcher("Register.html").forward(req, resp);
     }
	
 }
}
	


