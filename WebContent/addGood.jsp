<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="refresh" content="2;url=addGood.html">
<title>addGood Page</title>
</head>
<body>
<h1><a href="background.jsp">回到后台页面</a></h1>
<%
String gname = request.getParameter("gname");
String gprc = request.getParameter("gprc");
String gsto = request.getParameter("gsto");
try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection(
		"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");
	Statement st = conn.createStatement();
	
	String cmd = "select MAX(goodsId) from goods";
	ResultSet rs = st.executeQuery(cmd);
	rs.next();
	int gid = rs.getInt(1)+1;
	if(gname.isEmpty()||gprc.isEmpty()||gsto.isEmpty()){
		out.print("<h1>参数输入不全，稍后返回原界面</h1>");
	}
	else if(Float.parseFloat(gprc)<=0||Float.parseFloat(gsto)<=0){
		out.print("<h1>不合法参数，稍后返回原界面</h1>");
	}
	else{
		cmd = "insert goods value ("+gid+","+gname+","+gprc+","+gsto+")";
		st.executeUpdate(cmd);
		out.print("<h1>添加成功，稍后返回原界面</h1>");
	}
	rs.close();
	st.close();
	conn.close();
}
catch(Exception e){
	e.getStackTrace();
}
%>

</body>
</html>