<%@page import="com.sun.tools.internal.ws.wsdl.document.jaxws.Exception"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>addOrder</title>
</head>
<body>
<%
	String us = request.getParameter("us");
	String gid = request.getParameter("gid");
%>
<%
if(us==null || us.isEmpty()|| us.equals("null")){
	response.sendRedirect("GoodList.jsp");
}
try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection(
		"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");
	Statement st = conn.createStatement();
	String cmd;
	cmd = "";
	
	ResultSet rs = st.executeQuery(cmd);
	rs.close();
	conn.close();
}
catch(Exception e){
	e.printStackTrace();
}
%>

<h1>这是订单++界面，但是还并没有什么东西</h1>
</body>
</html>