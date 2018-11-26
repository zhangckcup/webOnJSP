<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>delOrder</title>
</head>
<body>
<%
String oid = request.getParameter("oid");
try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection(
		"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");
	Statement st = conn.createStatement();
	st.executeUpdate("delete from order where orderid="+oid);
	conn.close();
}
catch(Exception e){
	e.getStackTrace();
}
%>
</body>
</html>