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
	us = "111";
}
try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection(
		"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");
	Statement st = conn.createStatement();
	String cmd;
	int oid;
	ResultSet rs;
	
	cmd = "select count(userId) from orders where userId='"+us+"' and goodsid='"+gid+"'";
	rs = st.executeQuery(cmd);
	rs.next();
	if(rs.getInt(1)>0){
		response.sendRedirect("GoodList.jsp?us="+us);
	}
	else{
		cmd = "select MAX(orderid) from orders";
		rs = st.executeQuery(cmd);
		rs.next();
		oid = rs.getInt(1);
		cmd = "insert orders values ("+(oid+1)+","+us+","+gid+",0)";
		st.executeUpdate(cmd);
		rs.close();
		conn.close();
		response.sendRedirect("GoodList.jsp?us="+us);

	}
}
catch(Exception e){
	e.printStackTrace();
	System.out.print(us);
}
%>

</body>
</html>