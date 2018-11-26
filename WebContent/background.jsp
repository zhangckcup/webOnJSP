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
	<%
	try{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection conn = DriverManager.getConnection(
			"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");
		Statement st = conn.createStatement();
		ResultSet rsGoods = st.executeQuery("select * from goods");
	%>
		<h1>商品管理</h1><br>
		<form action="upGood.jsp" method="post">
			<table>
				<tr><th>商品编号</th><th>商品名</th><th>价格</th><th>进货</th></tr>
				<%
				String temp;
				while(rsGoods.next()){
					temp = "<tr><td>"+rsGoods.getInt(1)+"<input type=\"hidden\" name=\"gid\" value=\""+rsGoods.getInt(1)+"/></td>"+
						"<td>"+rsGoods.getString(2)+"</td>"+
						"<td><input type=\"text\" name=\"gprc\" value=\""+rsGoods.getFloat(3)+"/></td>"+
						"<td><input type=\"text\" name=\"gadd\" value=\"0\"/></td>";
					out.print(temp);
				}
				%>
			<input type="submit" value="确认更改"/>
		</form>
		
		
	<%
	}
	catch(Exception e){
		e.getStackTrace();
	}
	%>
</body>
</html>
