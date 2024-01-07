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
	String idStr = request.getParameter("id");
	String name = request.getParameter("name");
	String category = request.getParameter("category");
	String price = request.getParameter("price");
	String active = request.getParameter("active");
	int id = 0; // Default value or any appropriate default for your case
	if (idStr != null && !idStr.isEmpty()) {
		try {
			id = Integer.parseInt(idStr);
		} catch (NumberFormatException e) {
			// Handle the exception or log it
			e.printStackTrace();
		}
	}
	int status = 0;
	Connection con = DAOConnection.getConnection();
	PreparedStatement ps = con.prepareStatement("update product set name=?,category=?,price=? where id=?");
	ps.setString(1, name);
	ps.setString(2, category);
	ps.setString(3, price);
	ps.setInt(4, id);
	status = ps.executeUpdate();
	if (status > 0) {
		response.sendRedirect("product-view.jsp?msg=updated");
	} else {
		response.sendRedirect("product-view.jsp?msg=error");
	}
	%>
</body>
</html>