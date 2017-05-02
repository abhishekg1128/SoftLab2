

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.impl.util.Version;

/**
 * Servlet implementation class resume
 */
@WebServlet("/resume")
public class resume extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public resume() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
	    Statement pinfost = null;
	    Statement edust = null;
	    Statement skillsst = null;
	    Statement projectsst = null;
	    Statement languagesst = null;
	    Statement intrestst = null;
	    ResultSet pinfo = null;
	    ResultSet edu = null;
	    ResultSet skills = null;
	    ResultSet projects = null;
	    ResultSet intrest = null;

	    String url = "jdbc:mysql://localhost/profile";
	    String user = "root";
	    String password = "qwer1234";

		try {
	        Class.forName("com.mysql.jdbc.Driver");
	        
	        con = DriverManager.getConnection(url, user, password);
	        pinfost = con.createStatement();
	        edust = con.createStatement();
	        skillsst = con.createStatement();
	        projectsst = con.createStatement();
	        languagesst = con.createStatement();
	        intrestst = con.createStatement();
	        
	        pinfo = pinfost.executeQuery("SELECT * FROM pinfo;");
	        edu = edust.executeQuery("SELECT * FROM education;");
	        skills = skillsst.executeQuery("SELECT * FROM skill;");
	        projects = projectsst.executeQuery("SELECT * FROM project;");
	        intrest = intrestst.executeQuery("SELECT * FROM intrest;");
	        
	        request.setAttribute("pinfo", pinfo);
	        request.setAttribute("edu", edu);
	        request.setAttribute("skills", skills);
	        request.setAttribute("projects", projects);
	        request.setAttribute("intrest", intrest);
	    } catch (SQLException | ClassNotFoundException ex) {
	        Logger lgr = Logger.getLogger(Version.class.getName());
	        lgr.log(Level.SEVERE, ex.getMessage(), ex);

	    }
		
        request.getRequestDispatcher("resume.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
