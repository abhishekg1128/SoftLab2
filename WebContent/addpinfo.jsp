<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>

<!DOCTYPE html>
<html>
<head>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}	

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>

<%
	String msg = (String) request.getAttribute("msg");
	if(msg != null)
		out.println(msg);
%>
	<form method="post">
		Tag Nmae : <input name="tag" /><br>
		Value : <input name="value" /><br>
		<button type="submit">Submit</button>
	</form>

</body>
</html>
