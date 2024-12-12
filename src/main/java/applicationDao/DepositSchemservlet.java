package appilicationDao;


	import java.io.IOException;
	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.Statement;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	@WebServlet("/depositSchemes")
	public class DepositSchemservlet extends HttpServlet {

		@Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        // Forward the request to the JSP page
			request.setAttribute("pop","Please Login to your account");
	        RequestDispatcher rd = request.getRequestDispatcher("DepositScheme.jsp");
	        rd.forward(request, response);
	    }

	}

