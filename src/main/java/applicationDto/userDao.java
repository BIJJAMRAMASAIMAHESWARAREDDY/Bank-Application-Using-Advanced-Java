

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet.*;

import com.mysql.cj.jdbc.Driver;

import appilicationDto.UserDto;


public class userDao extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDto userDto=new UserDto();
		String fname=req.getParameter("firstname");
		String lname=req.getParameter("lastname");
		String email=req.getParameter("email");
		String pwd=req.getParameter("password");
		String cpwd=req.getParameter("confirmpassword");
		//load and register
		try {
			DriverManager.registerDriver(new Driver());
			// establish connection
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdb?createDatabaseIfNotExist=true","root","root");
			PreparedStatement preparedStatement=con.prepareStatement("create table if not exists bankuser(id INT AUTO_INCREMENT PRIMARY KEY,fname VARCHAR(45),lname VARCHAR(45),email VARCHAR(45),password VARCHAR(45)	)");
			PreparedStatement pre=con.prepareStatement("insert into bankuser values(?,?,?,?,?)");
			pre.setInt(1,userDto.getId());
			pre.setString(2,fname);
			pre.setString(3,lname);
			pre.setString(4,email);
			pre.setString(5,pwd);
			preparedStatement.execute();
			pre.execute();
			preparedStatement.close();
			
			pre.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
	}
}