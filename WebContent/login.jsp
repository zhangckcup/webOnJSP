<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="utf-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="5;url=index.html"> 
<title>TEST.JSP</title>
</head>
<body>
<%
	try{
		String suser = request.getParameter("j_username");
		String spswd = request.getParameter("j_password");
		String checkUser = "select count(userId) from usersTable where userId='"+suser+"';";
		String checkPasswd = "select userPs from usersTable where userId='"+suser+"';";
		
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection conn = DriverManager.getConnection(
			"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");

		if(suser.equals("root") && spswd.equals("123456")){
			// 如果为root 则进入后台
			response.sendRedirect("background.jsp");
		}
			
		Statement st = conn.createStatement();
		// 检查用户名
		ResultSet rs = st.executeQuery(checkUser);
		rs.next();
		if(rs.getInt(1) <= 0){
			out.print("<h1>没有找到该用户名</h1>"+rs.getInt(1));
			out.print("5秒后跳回登陆页面</h1>");
		}
		else{
			rs = st.executeQuery(checkPasswd);
			rs.next();
			// 检查密码
			if(rs.getString(1).equals(spswd)){
				response.sendRedirect("GoodList.jsp?us="+suser);
			}
			else{
				out.print("<h1>登陆失败</h1>");
				out.print("5秒后跳回登陆页面</h1>");
			}
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