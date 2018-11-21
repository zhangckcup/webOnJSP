<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="5;url=index.html"> 
<title>TEST.JSP</title>
<style type="text/css">
	h1{
		margin: 0 auto;
	}
</style>
</head>
<body>
<%
	String suser = request.getParameter("j_username");
	String spswd = request.getParameter("j_password");
	String checkUser = "select COUNT(userId) from usersTable where userId='"+suser+"';";
	try{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		//out.println("finish 001");
		Connection conn = DriverManager.getConnection(
			"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");
		//out.println("finish 002");
		
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(checkUser);
		rs.next();
		if(rs.getInt(1)<=0){
			String creatUser = "insert into usersTable(userId, userPs) values ('"+suser+"', '"+spswd+"');";
			st.executeUpdate(creatUser);
			out.print("<h1> 用户名创建成功："+suser+" <br>");
			out.print("5秒后跳回登陆页面</h1>");
		}
		else{
			out.print("<h1> 用户名已存在:"+suser+"<br>");	
			out.print("5秒后跳回登陆页面</h1>");
		}
		rs.close();
		conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
%>
</body>
</html>