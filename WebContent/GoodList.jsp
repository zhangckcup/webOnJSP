<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>商品列表</title>
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
		</style>
	</head>
	<% String us = request.getParameter("us"); %>
	<body>
		<h1>商品列表</h1>
		<ul class="nav">
				<li><a href="GoodList.jsp">欢迎！ </a></li> <li><a href="home.jsp?us=<%=us %>"><%=us %></a></li>
		</ul>
		<form action="GoodList.jsp" method="post" style="margin: 8px auto;">
			<input type="text" name="gname" />
			<input type="submit" class="" value="搜索"/>
		</form>
			
		<table>
			<tr><th>商品名</th><th>价格</th><th>库存</th><th>购买</th></tr>
			<%
			String strTemp = request.getParameter("pg");
			if(strTemp==null || strTemp.isEmpty()){
				strTemp = "1";
			}
			int pg = Integer.parseInt(strTemp);
			%>
			<% 
				try{
					String gname = request.getParameter("gname");
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					Connection conn = DriverManager.getConnection(
						"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");
					Statement st = conn.createStatement();
					String cmd, output;
					
					if(gname==null || gname.isEmpty()){
						cmd = "select * from goods where goodsId between "+(1+10*(pg-1))+" and "+ 10*pg;	
					}
					else{
						cmd = "select * from goods where goodsName like '%"+gname+"%' and goodsId between "+(1+10*(pg-1))+" and "+ 10*pg;
					}
					
					ResultSet rs = st.executeQuery(cmd);
					for(int i=1+10*(pg-1);(i < 10*pg) && rs.next(); i++){
						output = "<tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+
								"</td><td><a href=\"addOrder.jsp?gid="+i+"&us="+us+"\">订购</a></td></tr>";
						out.print(output);
					}
					rs.close();
					conn.close();
				}	
				catch(Exception e){
					e.printStackTrace();
				}
			%>
		</table>
		<form action="GoodList.jsp" method="post" style="float: left; width: 300px">
			<input type="text" name="pg" value="<%=pg%>" />
			<input type="submit" value="Go" />
		</form>
		<div>
		<a href="GoodList.jsp?pg=1&us=<%=us %>">1</a><a href="GoodList.jsp?pg=2&us=<%=us %>">2</a>
		</div>
	</body>
</html>
