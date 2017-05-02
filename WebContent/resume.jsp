<%@ page import="java.sql.*" %>

<% 
Class.forName("com.mysql.jdbc.Driver");

ResultSet pinfo = (ResultSet) request.getAttribute("pinfo");
ResultSet edu = (ResultSet) request.getAttribute("edu");
ResultSet skill = (ResultSet) request.getAttribute("skills");
ResultSet project = (ResultSet) request.getAttribute("projects");
ResultSet intrest = (ResultSet) request.getAttribute("intrest");
%>


<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #bababa;
    text-align: left;
    padding: 8px;
}	

tr:nth-child(even) {
    background-color: #ababab;
}
a.button {
    -webkit-appearance: button;
    -moz-appearance: button;
    appearance: button;

    text-decoration: none;
    color: initial;
    padding: 5px;
        margin-bottom: 5px;
}
</style>
	
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-3">
			<img src="images/vnit.png" height="100px">
        </div>
		<div class="col-md-6">
			<h1 class="text-center" style="font-size: 5em;">VNIT</h1>
        </div>
		<div class="col-md-3">
			<img src="images/abhishek.jpg" height="100px" style="float: right;">
        </div>
	</div>
</div>
<nav class="navbar navbar-inverse">
        <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
          </button>
        </div>

        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav navbar-center" style="margin-right: 0;">
            <li><a style="cursor: pointer;" onclick="toggle('pinfo')">Personal Info</a></li>
            <li><a style="cursor: pointer;" onclick="toggle('edu')">Education</a></li>
            <li><a style="cursor: pointer;" onclick="toggle('skill')">Skills</a></li>
            <li><a style="cursor: pointer;" onclick="toggle('project')">projects</a></li>
            <li><a style="cursor: pointer;" onclick="toggle('intrest')">Interests</a></li>
          </ul>
        </div>
      </div>
</nav>

<div class="container" id="pinfo">
<table>
  <tr>
    <th class="text-center" colspan="3">Personal Info <a href="http://localhost:8080/SoftLAB2/addpinfo" class="button">ADD</a></th>
  </tr>
  
  
  <%
  	while(pinfo.next()) {
  %>
	  <tr>
	    <td><% out.println( pinfo.getString("tag")); %></td>
	    <td><% out.println( pinfo.getString("value")); %></td>
	    <td>
	    	<a href="http://localhost:8080/SoftLAB2/editpinfo?id=<% out.println( pinfo.getInt("id")); %>" class="button">Edit</a>
	    	<a href="http://localhost:8080/SoftLAB2/deletepinfo?id=<% out.println( pinfo.getInt("id")); %>" class="button">Delete</a>
	    </td>
	  </tr>
	  
	<% } %>
  
</table>
</div>

<div class="container" id="edu" style="display: none;">
<table>
  <tr>
    <th class="text-center" colspan="6">Education <a href="http://localhost:8080/SoftLAB2/addedu" class="button">ADD</a></th>
  </tr>
  
	  <tr>
	    <td class="text-center"> Course </td>
	    <td class="text-center"> Passing Year </td>
	    <td class="text-center"> Institute </td>
	    <td class="text-center"> Score</td>
	    <td class="text-center"> Total Score</td>
	    <td class="text-center"> Action</td>
	  </tr>
  
  <%
  	while(edu.next()) {
  %>
	  <tr>
	    <td><% out.println( edu.getString("name")); %></td>
	    <td><% out.println( edu.getString("passyear")); %></td>
	    <td><% out.println( edu.getString("institute")); %></td>
	    <td><% out.println( edu.getString("score")); %></td>
	    <td><% out.println( edu.getString("tscore")); %></td>
	    <td>
	    	<a href="http://localhost:8080/SoftLAB2/editedu?id=<% out.println( edu.getInt("id")); %>" class="button">Edit</a>
	    	<a href="http://localhost:8080/SoftLAB2/deleteedu?id=<% out.println( edu.getInt("id")); %>" class="button">Delete</a>
	    </td>
	  </tr>
	  
	<% } %>
  
</table>
</div>

<div class="container" id="skill" style="display: none;">
<table>
  <tr>
    <th class="text-center" colspan="3">Skills <a href="http://localhost:8080/SoftLAB2/addskill" class="button">ADD</a></th>
  </tr>
  
  	<tr>
	    <td class="text-center"> Name </td>
	    <td class="text-center"> Rating out of 10 </td>
	    <td class="text-center"> Action</td>
	  </tr>
  
  
  <%
  	while(skill.next()) {
  %>
	  <tr>
	    <td><% out.println( skill.getString("name")); %></td>
	    <td><% out.println( skill.getInt("rating")); %></td>
	    <td>
	    	<a href="http://localhost:8080/SoftLAB2/editskill?id=<% out.println( skill.getInt("id")); %>" class="button">Edit</a>
	    	<a href="http://localhost:8080/SoftLAB2/deleteskill?id=<% out.println( skill.getInt("id")); %>" class="button">Delete</a>
	    </td>
	  </tr>
	  
	<% } %>
  
</table>
</div>


<div class="container" id="project" style="display: none;">
<table>
  <tr>
    <th class="text-center" colspan="5">Projects <a href="http://localhost:8080/SoftLAB2/addproject" class="button">ADD</a></th>
  </tr>
  
	  <tr>
	    <td class="text-center"> From </td>
	    <td class="text-center"> To </td>
	    <td class="text-center"> Name </td>
	    <td class="text-center"> Description</td>
	    <td class="text-center"> Action</td>
	  </tr>
  
  <%
  	while(project.next()) {
  %>
	  <tr>
	    <td><% out.println( project.getString("start")); %></td>
	    <td><% out.println( project.getString("end")); %></td>
	    <td><% out.println( project.getString("name")); %></td>
	    <td><% out.println( project.getString("description")); %></td>
	    <td>
	    	<a href="http://localhost:8080/SoftLAB2/editproject?id=<% out.println( project.getInt("id")); %>" class="button">Edit</a>
	    	<a href="http://localhost:8080/SoftLAB2/deleteproject	?id=<% out.println( project.getInt("id")); %>" class="button">Delete</a>
	    </td>
	  </tr>
	  
	<% } %>
  
</table>
</div>

<div class="container" id="intrest" style="display: none;">
<table>
  <tr>
    <th class="text-center" colspan="2">Interest <a href="http://localhost:8080/SoftLAB2/addintrest" class="button">ADD</a></th>
  </tr>
  
  
  <%
  	while(intrest.next()) {
  %>
	  <tr>
	    <td><% out.println( intrest.getString("name")); %></td>
	    <td>
	    	<a href="http://localhost:8080/SoftLAB2/editintrest?id=<% out.println( intrest.getInt("id")); %>" class="button">Edit</a>
	    	<a href="http://localhost:8080/SoftLAB2/deleteintrest?id=<% out.println( intrest.getInt("id")); %>" class="button">Delete</a>
	    </td>
	  </tr>
	  
	<% } %>
  
</table>
</div>

<%
pinfo.close();
edu.close();
skill.close();
project.close();
intrest.close();
%>

<script type="text/javascript">
	function toggle(id){
		console.log(id);
		document.getElementById('pinfo').style.display = 'none';
		document.getElementById('edu').style.display = 'none';
		document.getElementById('skill').style.display = 'none';
		document.getElementById('project').style.display = 'none';
		document.getElementById('intrest').style.display = 'none';

		document.getElementById(id).style.display = 'block';
	}
</script>
</body>
</html>