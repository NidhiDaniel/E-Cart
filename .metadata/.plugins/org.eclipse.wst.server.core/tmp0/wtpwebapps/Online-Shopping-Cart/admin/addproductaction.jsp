<%@page import="java.sql.*"%>
<%@page import="com.db.connection.DAOConnection"%>
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
String name=request.getParameter("name");
String category=request.getParameter("category");
double price=Double.parseDouble(request.getParameter("price"));
String active=request.getParameter("active");
int check=0;
try{
	Connection con=DAOConnection.getConnection();
	PreparedStatement ps=con.prepareStatement("insert into product(name,category,price,active) values(?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, category);
	ps.setDouble(3, price);
	ps.setString(4, active);
	check=ps.executeUpdate();
	if(check>0){
		response.sendRedirect("addproduct.jsp?msg=success");
	}
	else{
		response.sendRedirect("addproduct.jsp?msg=failure");
	}
}
catch(Exception e){
	response.sendRedirect("addproduct.jsp?msg=failure");
}
%>

</body>
</html>