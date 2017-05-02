

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.sun.corba.se.impl.util.Version;

/**
 * Servlet implementation class deleteproject
 */
@WebServlet("/deleteproject")
public class deleteproject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteproject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
	    Statement st = null;	

	    String url = "jdbc:mysql://localhost/profile";
	    String user = "root";
	    String password = "qwer1234";

	    String id = request.getParameter("id");

		try {
	        Class.forName("com.mysql.jdbc.Driver");
	        
	        con = (Connection) DriverManager.getConnection(url, user, password);
	        st = (Statement) con.createStatement();
	        st.executeUpdate("DELETE FROM project WHERE id = " + id + ";");
	        
	    } catch (SQLException | ClassNotFoundException ex) {
	        Logger lgr = Logger.getLogger(Version.class.getName());
	        lgr.log(Level.SEVERE, ex.getMessage(), ex);

	    }
		

	    response.sendRedirect("http://localhost:8080/SoftLAB2/resume");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
