<%@page import="com.db.connection.DAOConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="adminheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin-product.css">
</head>
<body>
<h3 style="color: white; text-align: center;">View All Products & Edit
		Products &nbsp;<i class="fa fa-outdent"></i></h3>
	<div class="product-view-container">
	<%
	String mes=request.getParameter("msg");
	if(mes != null && mes.equals("updated")){
		%>
		<h3 class="success-msg">Product Updated Successfully</h3>
		
		<%
	}if(mes != null && mes.equals("error")){
		%>
		
		<h3 class="failure-msg">Failure Occured in Updating..!Try Again</h3>
		<%
	}
	%>
	<table>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>CATEGORY</th>
			<th><i class="fa fa-inr"></i>PRICE</th>
			<th>ACTIVE</th>
			<th>EDIT<i class="fa fa-edit"></i></th>
		</tr>
		<%
	try {
		Connection con = DAOConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from product");
		while(rs.next())
		{%>
		<tr>
			<td><%= rs.getString(1)%></td>
			<td><%= rs.getString(2)%></td>
			<td><%= rs.getString(3)%></td>
			<td><i class="fa fa-inr"></i><%= rs.getString(4)%></td>
			<td><%= rs.getString(5)%></td>
			<td><a href="edit-product.jsp?id=<%= rs.getString(1)%>">Edit<i class="fa fa-edit"></i></a></td>
		</tr>
		<%}
	} catch (Exception e) {
      e.printStackTrace();
	}
	%>
	</table>
</div>
</body>
<%@include file="../footer.jsp"%>
</html>