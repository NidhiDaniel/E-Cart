
<%@page import="com.db.connection.DAOConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
if("admin@ecart.com".equals(email) && "admin".equals(password))
{
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminhome.jsp");
}
else{
int status=0;
try{
Connection con=DAOConnection.getConnection();
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from signup_table where email='"+email+"' && password='"+password+"'");
while(rs.next()){
	status=1;
	session.setAttribute("email", email);
	response.sendRedirect("home.jsp");
}
if(status==0){
	response.sendRedirect("login.jsp?msg=notexist");

}
}

catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("login.jsp?msg=invalid");

}
}
%>
</body>
</html>