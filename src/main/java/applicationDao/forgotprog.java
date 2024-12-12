//package applicationDao;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.mysql.cj.jdbc.Driver;
//@WebServlet("/forgot")
//public class forgotprog extends HttpServlet {
//	
//@Override
//protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	  String email =req.getParameter("email");
//	  String pwd=req.getParameter("password");
//	  String confirmpw=req.getParameter("confirmpw");
//	  try {
//		DriverManager.registerDriver(new Driver());
//		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingapplication","root","root");
//	    PreparedStatement pre=con.prepareStatement("select * from userDetails where email=?");
//	    pre.setString(1,email);
//	    ResultSet res=pre.executeQuery();
//	    resp.setContentType("text/html");
//	    PrintWriter printWriter=resp.getWriter();
//	    if(res.next())
//	    {
//	    	if(res.getString("email").equals(email))
//	    	{
//	    		if(pwd.equals(confirmpw))
//	    		{
//	    			PreparedStatement ps=con.prepareStatement("update  userDetails set password=?  where email=?");
//	    			ps.setString(1,pwd);
//	    			ps.setString(2,email);
//	    			req.setAttribute("msg3", "password updated");
//	    			RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
//					rd.forward(req, resp);
//	    		}
//	    		else {
//	    			req.setAttribute("msg1", "Password Mismatch");
//	    			RequestDispatcher rd=req.getRequestDispatcher("forgotpw.jsp");
//					rd.include(req, resp);
//	    		}
//	    	}
//	    	else
//	    	{
//	    		req.setAttribute("msg2", "Email Doesn't Exist");
//	    		RequestDispatcher rd=req.getRequestDispatcher("forgotpw.jsp");
//				rd.include(req, resp);
//	    	}
//	    }
//	} catch (SQLException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//}
//}



package appilicationDao;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.mysql.cj.jdbc.Driver;

@WebServlet("/forgot-password")
public class forgotprog extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String pwd = req.getParameter("password");
        String confirmpw = req.getParameter("confirmpassword");
        
        resp.setContentType("text/html");
        PrintWriter printWriter = resp.getWriter();
        
        try {
            DriverManager.registerDriver(new Driver());
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication", "root", "root");
            
            // Check if the email exists
            PreparedStatement pre = con.prepareStatement("SELECT * FROM userDetails WHERE email = ?");
            pre.setString(1, email);
            ResultSet res = pre.executeQuery();
            
            if (res.next()) {
                // Email exists
                if (pwd.equals(confirmpw)) {
                    // Update password
                    PreparedStatement ps = con.prepareStatement("UPDATE userDetails SET password = ? WHERE email = ?");
                    ps.setString(1, pwd);  // Consider using a hashing function here
                    ps.setString(2, email);
                    int rowsUpdated = ps.executeUpdate();
                    
                    if (rowsUpdated > 0) {
                        req.setAttribute("msg3", "Password updated successfully.");
                        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
                        rd.forward(req, resp);
                    } else {
                        req.setAttribute("msg2", "Password update failed.");
                        RequestDispatcher rd = req.getRequestDispatcher("forgotpw.jsp");
                        rd.include(req, resp);
                    }
                } else {
                    req.setAttribute("msg1", "Password Mismatch");
                    RequestDispatcher rd = req.getRequestDispatcher("forgotpw.jsp");
                    rd.include(req, resp);
                }
            } else {
                // Email doesn't exist
                req.setAttribute("msg2", "Email doesn't exist.");
                RequestDispatcher rd = req.getRequestDispatcher("forgotpw.jsp");
                rd.include(req, resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("msg2", "Database error occurred.");
            RequestDispatcher rd = req.getRequestDispatcher("forgotpw.jsp");
            rd.include(req, resp);
        }
    }
}

