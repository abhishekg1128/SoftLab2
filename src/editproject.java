

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.sun.corba.se.impl.util.Version;

/**
 * Servlet implementation class editproject
 */
@WebServlet("/editproject")
public class editproject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editproject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
	    Statement st = null;
	    
	    int rs = 0;

	    String url = "jdbc:mysql://localhost/profile";
	    String user = "root";
	    String password = "qwer1234";

	    String from = JOptionPane.showInputDialog("project start date");
	    String to = JOptionPane.showInputDialog("Project end date");
	    String name = JOptionPane.showInputDialog("Project name");
	    String desc = JOptionPane.showInputDialog("Project Description");
	    String id = request.getParameter("id");

		try {
	        Class.forName("com.mysql.jdbc.Driver");
	        
	        con = DriverManager.getConnection(url, user, password);
	        st = con.createStatement();
	        //rs = st.executeUpdate("insert into pinfo (tag, value) values('" + tag + "', '" + value + "');");

	        rs = st.executeUpdate("UPDATE project SET start='" + from + "', end='" + to + "', name='" + name + "', description='" + desc + "' where id=" + id + ";");
	        
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
