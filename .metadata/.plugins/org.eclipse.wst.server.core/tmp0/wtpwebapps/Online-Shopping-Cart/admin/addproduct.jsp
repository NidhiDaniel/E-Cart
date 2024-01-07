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
	<div class="product-container">
		<%
		String msg = request.getParameter("msg");
		if ("success".equals(msg)) {
		%>
		<p class='success-msg'>Product Added Successfully</p>
		<%
		}
		if ("invalid".equals(msg)) {
		%>
		<p class='failure-msg'>Error Occured Check Again..!</p>
		<%
		}
		%>
		<%
		int id = 1;
		try {
			Connection con = DAOConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select max(id) from product");
			while (rs.next()) {
				id = rs.getInt(1);
				id = id + 1;
			}
		} catch (Exception e) {

		}
		%>

		<div class="product-form">
		     <h3>Product ID:<%out.print(id);%></h3>
			<form action="addproductaction.jsp" method="post">
			<input type="hidden" name="id" value=<%out.print(id);%>>
				<pre>
			<label>Enter Name</label><br>
			<input type="text" name="name"> 
			<label>Enter Category</label><br>
			<input type="text" name="category"> 
			<label>Enter Price</label><br>
			<input type="text" name="price">
			<label>Active</label><br>
			<select name="active">
				<option>Yes</option>
				<option>No</option>
			</select><br>
			<input type="submit" value="Add New Product">
			</pre>
			</form>
		</div>
	</div>
</body>
</html>
<%@include file="../footer.jsp"%>