<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>HOME PAGE</title>
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
<h1>商品列表</h1>
<%
String us = request.getParameter("us");
if(us==null || us.isEmpty()|| us.equals("null")){
	us = "111";
}
%>
<ul class="nav">
		<li><a href="GoodList.jsp?us=<%=us %>">欢迎！ </a></li> <li><a href="home.jsp?us=<%=us %>"><%=us %></a></li>
</ul>
<%
try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection(
		"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");
	Statement st = conn.createStatement();
	String cmd, output;
	ResultSet rs;
	
	cmd = "select count(userId) from orders where userId='"+us+"'";
	rs = st.executeQuery(cmd);
	rs.next();
	if(rs.getInt(1)==0){
		out.print("<h2>您当前没有订单！</h2>");
	}
	else{
		out.print("<form action=\"uporder.jsp\"><table><tr><th>商品名</th><th>价格</th><th>已订购数量</th><th>确认订购数量</th></tr>");
		cmd = "select goodsName, price, book, orderid from orders, goods where userId='"+us+"' and goods.goodsId=orders.goodsId";
		for(rs = st.executeQuery(cmd);rs.next();){
			output = "<tr><td>"+rs.getString(1)+"</td><td>"+rs.getFloat(2)+"</td><td>"+rs.getInt(3)+
				"</td><td>"+"<input type=\"text\" name=\"num\" value=\""+rs.getInt(3)+"\" />"+
				"<input type=\"hidden\" name=\"oid\" value=\""+rs.getInt(4)+"\" />"+
				"<a href=\"delOrder2.jsp?oid="+rs.getInt(4)+"\">删除</a>"+
				"</td></tr>";
			out.print(output);
		}
		out.print("</table><input type=\"hidden\" name=\"us\" value=\""+us+"\"><input class=\"right\" type=\"submit\" value=\"提交\" /></form>");
	}
	rs.close();
	conn.close();
}
catch(Exception e){
	e.printStackTrace();
	System.out.print(us);
}
%>
</body>
</html>