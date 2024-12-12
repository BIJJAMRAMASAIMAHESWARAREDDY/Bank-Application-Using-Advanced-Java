package appilicationDao;
//
////import java.io.IOException;
////import java.sql.Connection;
////import java.sql.DriverManager;
////import java.sql.PreparedStatement;
////import java.sql.ResultSet;
////
////import javax.servlet.RequestDispatcher;
////import javax.servlet.ServletException;
////import javax.servlet.annotation.WebServlet;
////import javax.servlet.http.HttpServlet;
////import javax.servlet.http.HttpServletRequest;
////import javax.servlet.http.HttpServletResponse;
////
////import com.mysql.cj.jdbc.Driver;
////
////import applicationDto.UserDto;
////
////@WebServlet("/profile")
////public class ShowProfile extends HttpServlet {
////    
////    public Connection createConnection() throws Exception {
////        DriverManager.registerDriver(new Driver());
////        return DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingapplication?createDatabaseIfNotExist=true", "root", "root");
////    }
////
////    @Override
////    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
////        try {
////        	UserDto userDto=new UserDto();
////            Connection con = createConnection();
////            String email = userDto.getEmail();
////            
////            PreparedStatement ps = con.prepareStatement("SELECT * FROM userdetails WHERE email = ?");
////            ps.setString(1, email);
////            ResultSet rs = ps.executeQuery();
////            
////            if (rs.next()) {
////                req.setAttribute("firstname", rs.getString("firstname"));
////                req.setAttribute("lastname", rs.getString("lastname"));
////                req.setAttribute("email", rs.getString("email"));
////                req.setAttribute("gender", rs.getString("gender"));
////                req.setAttribute("age", rs.getInt("age"));
////                req.setAttribute("phono", rs.getLong("phono"));
////                req.setAttribute("address", rs.getString("address"));
////                
////                RequestDispatcher dispatch = req.getRequestDispatcher("show.jsp");
////                dispatch.forward(req, resp);
////            } else {
////                RequestDispatcher dispatch = req.getRequestDispatcher("index.jsp");
////                dispatch.include(req, resp);
////            }
////        } catch (Exception e) {
////            e.printStackTrace();
////            RequestDispatcher dispatch = req.getRequestDispatcher("error.jsp");
////            dispatch.forward(req, resp);
////        }
////    }
////}
//
//
//UserProfileServlet.java
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import appilicationDto.UserDto;


@WebServlet("/profile")
public class ShowProfile extends HttpServlet {
 
 private static final String DB_URL = "jdbc:mysql://localhost:3306/bankingapplication";
 private static final String DB_USER = "root"; 
 private static final String DB_PASSWORD = "root"; 

 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 RequestDispatcher dispatcher=req.getRequestDispatcher("show.jsp");
     dispatcher.forward(req, resp);
	}
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     HttpSession session = request.getSession();
     String email = (String) session.getAttribute("userEmail");
     System.out.println(email);
     
     UserDto userDto = null;

     try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
         String sql = "SELECT * FROM userdetails WHERE email = ?";
         try (PreparedStatement statement = connection.prepareStatement(sql)) {
             statement.setString(1, email);
             ResultSet resultSet = statement.executeQuery();

             if (resultSet.next()) {
                 userDto = new UserDto(
                     resultSet.getString("firstname"),
                     resultSet.getString("lastname"),
            		 resultSet.getString("email"),
            		 resultSet.getString("userid"),
            		 resultSet.getInt("age"),
            		 resultSet.getInt("id"),
            		 resultSet.getLong("phone"),
            		 resultSet.getLong("accountnumber")
                 );
             }
         }
     } catch (Exception e) {
         e.printStackTrace();
     }

     if (userDto != null) {
    	 request.setAttribute("userDto", userDto);
//         request.setAttribute("firstname", userDto.getFirstName());
//         request.setAttribute("lastname", userDto.getLastName());
//         request.setAttribute("email", userDto.getEmail());
//         request.setAttribute("phone", userDto.getPhone());
//         request.setAttribute("age", userDto.getAge());
//         request.setAttribute("gender", userDto.getGender());
//         request.setAttribute("address", userDto.getAddress());
     } else {
         request.setAttribute("errorMessage", "User not found");
     }

     
 }
}

