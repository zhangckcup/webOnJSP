<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>uporder.jsp</title>
</head>
<body>
<%
String oid[] = request.getParameterValues("oid");
String num[] = request.getParameterValues("num");
String us = request.getParameter("us");
if(us==null || us.isEmpty()){
	us = "111";
}
%>
<%
int len = oid.length;
try{
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection(
		"jdbc:sqlserver://localhost:1433;DatabaseName=DB1","sa","123456");
	Statement st = conn.createStatement();
	int temp;

	for(int i=0; i<len; i++){
		if(num[i]==null || num[i].isEmpty()||Float.parseFloat(num[i])<0){
			num[i] = "0";
		}
		temp = (int)Float.parseFloat(num[i]);
		st.executeUpdate("update orders set book="+temp+" where orderid="+oid[i]);
	}
	conn.close();
	response.sendRedirect("GoodList.jsp?us="+us);
}
catch(Exception e){
	e.printStackTrace();
}
%>

</body>
</html>