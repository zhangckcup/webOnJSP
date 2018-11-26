<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>BACKGROUND PAGE</title>
	<link href="good.css" rel="stylesheet">
	<style type="text/css">
		body{
			margin: 0 auto;
			width: 940px;
		}
		table{
			margin: 50px auto;
			width: 800px;
		}
		.right{
			float: right;
			margin: 0 200px;
		}
	</style>
</head>
<body>
	<!-- 完成进货与发货 -->
	<h1><a href="background.jsp">商品管理界面</a></h1> 
	<h1><a href="background2.jsp">订单管理界面</a></h1>
	<h1>订单管理</h1><br>
	<table>
		<tr><th>订单编号</th><th>用户名</th><th>商品编号</th><th>订购数量</th><th>确认交货</th></tr>
	<%
	try{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection conn = DriverManager.getConnection(
			"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from orders");
		String temp;
		while(rs.next()){
			temp = "<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getInt(3)+"</td>"+
				"<td>"+rs.getInt(4)+"</td><td><a href=\"delOrder.jsp?oid="+rs.getInt(1)+"\">交货</a></td></tr>";
			out.print(temp);
		}
	}
	catch(Exception e){
		e.getStackTrace();
	}
	%>
	</table>
</body>
</html>
