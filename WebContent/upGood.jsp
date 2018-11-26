<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>upGood.jsp</title>
</head>
<body>
<%
String gid[] = request.getParameterValues("gid");
String gprc[] = request.getParameterValues("gprc");
String gadd[] = request.getParameterValues("gid");
try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection(
		"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");
	Statement st = conn.createStatement();
	for(int i=0; i<gid.length; i++){
		if(Float.parseFloat(gprc[i])<=0){
			gprc[i]="-1";
		}
		st.executeUpdate("update goods set price="+gprc[i]+",stock=stock+"+gadd[i]+" where gid="+gid[i]);
	}
	
	conn.close();
	response.sendRedirect("background.jsp");
}
catch(Exception e){
	e.getStackTrace();
}

%>
</body>
</html>