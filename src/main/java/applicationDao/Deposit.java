package appilicationDao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.Driver;
@WebServlet("/deposit")
public class Deposit extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	HttpSession session=req.getSession();
    	Object email =  session.getAttribute("email");
    	String accountNumber=req.getParameter("accountnumber");
    	
    	String depositamount=req.getParameter("amount");
    	int Sdepositamount=Integer.parseInt(depositamount);
    	String interest="7%";
    	
    	String deposittenure=req.getParameter("tenure");
    	int Sdeposittenure=Integer.parseInt(deposittenure);
    	
    	try {
    		DriverManager.registerDriver(new Driver());
    		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","root");
    		
    		PreparedStatement preparedStatement=con.prepareStatement("INSERT INTO deposit VALUES(?,?,?,?)");
    		preparedStatement.setString(1, accountNumber);
    		preparedStatement.setInt(2,Sdepositamount);
    		preparedStatement.setString(4,interest);
    		preparedStatement.setInt(3,Sdeposittenure );
    		
    		preparedStatement.execute();

    RequestDispatcher dispatcher=req.getRequestDispatcher("login .jsp");
    dispatcher.forward(req, resp);
    		con.close();
    	} catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    }
    	
    }

