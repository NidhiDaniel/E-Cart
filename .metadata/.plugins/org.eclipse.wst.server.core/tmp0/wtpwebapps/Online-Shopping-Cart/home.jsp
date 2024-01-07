<%@page import="com.db.connection.DAOConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="./css/home-style.css">
</head>
<body>
<div class="product-view">
<h3 style="color: white; text-align: center;">Home &nbsp;<i class="fa fa-institution"></i></h3>
<%
String msg=request.getParameter("msg");
if(msg!=null &&  msg.equals("added")){
%>
<h3 class="success-msg">Product Added Successfully...</h3>
<%
}
%>
<%if(msg!=null && msg.equals("exist")){
%>
<h3 class="failure-msg">Product already exist in your cart!Quantity Increased!</h3>
<%} %>
<table>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>CATEGORY</th>
			<th><i class="fa fa-inr"></i>PRICE</th>
			<th>ADD TO CART<i class="fa fa-cart-arrow-down"></i></th>
		</tr>
		<%
	try {
		Connection con = DAOConnection.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from product where active='yes'");
		while(rs.next())
		{%>
		<tr>
			<td><%= rs.getString(1)%></td>
			<td><%= rs.getString(2)%></td>
			<td><%= rs.getString(3)%></td>
			<td><i class="fa fa-inr"></i><%= rs.getString(4)%></td>
			<td><a href="addToCartAction.jsp?id=<%= rs.getString(1)%>">Add to cart<i class="fa fa-cart-arrow-down"></i></a></td>
		</tr>
		<%}
	} catch (Exception e) {
      e.printStackTrace();
	}
	%>
	</table>
	</div>
</body>
<%@ include file="footer.jsp" %>
</html>