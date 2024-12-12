//package applicationDao;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.Scanner;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.mysql.cj.jdbc.Driver;
//
//@WebServlet("/login")
//public class LoginDao extends HttpServlet{
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		  String email =req.getParameter("email");
//		  String pwd=req.getParameter("password");
//		  //load and register
//		  try {
//			DriverManager.registerDriver(new Driver());
//			// establish connection
//			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","root");
//		    PreparedStatement pre=con.prepareStatement("select * from user where email=?");
//		    pre.setString(1,email);
//		    ResultSet res=pre.executeQuery();
//		    resp.setContentType("text/html");
//		    PrintWriter printWriter=resp.getWriter();
//		    if(res.next())
//		    {
////		    	System.out.println("email exists");
////		    	System.out.println(res.getString("name")+" "+res.getString("phone"));
//		    	if(res.getString("password").equals(pwd))
//		    	{
//		    		//System.out.println("Login successful");
//		    			RequestDispatcher dispatcher=req.getRequestDispatcher("home.jsp");
////		    		dispatcher.forward(req,resp);
//		    	}
//		    	else
//		    	{
//		    		req.setAttribute("msg","password is invalid");
//		    		System.out.println("Incorrect password");
//		    		RequestDispatcher dispatcher=req.getRequestDispatcher("Login.jsp");
//		    		dispatcher.include(req,resp);
//		    	}
//		    }
//		    else
//		    {
//		    	req.setAttribute("msg","email is incorrect");
//		    	System.out.println("incorrect email");
//		    	RequestDispatcher dispatcher=req.getRequestDispatcher("Login.jsp");
//		    	dispatcher.include(req,resp);
//		    }
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//}


package appilicationDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.Driver;

@WebServlet("/login")
public class LoginDao extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  String email =req.getParameter("email");
		  String pwd=req.getParameter("password");
		  //load and register
		  try {
			DriverManager.registerDriver(new Driver());
			// establish connection
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankapplication","root","root");
		    PreparedStatement pre=con.prepareStatement("select * from userdetails where email=?");
		    pre.setString(1,email);
		    ResultSet res=pre.executeQuery();
		    resp.setContentType("text/html");
		    PrintWriter printWriter=resp.getWriter();
		    if(res.next())
		    {
//		    	System.out.println("email exists");
//		    	System.out.println(res.getString("name")+" "+res.getString("phone"));
		    	if(res.getString("password").equals(pwd))
		    	{
		    		System.out.println("Login successful");
		    		HttpSession session = req.getSession();
                    session.setAttribute("userEmail", email);
		    		RequestDispatcher dispatcher=req.getRequestDispatcher("login .jsp");
		    		dispatcher.forward(req,resp);
		    	}
		    	else
		    	{
		    		req.setAttribute("msg","password is invalid");
		    		System.out.println("Incorrect password");
		    		RequestDispatcher dispatcher=req.getRequestDispatcher("index.jsp");
		    		dispatcher.include(req,resp);
		    	}
		    }
		    else
		    {
		    	req.setAttribute("msg","email is incorrect");
		    	System.out.println("incorrect email");
		    	RequestDispatcher dispatcher=req.getRequestDispatcher("index.jsp");
		    	dispatcher.include(req,resp);
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}