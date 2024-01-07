<%@page import="com.db.connection.DAOConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="adminheader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
<link rel="stylesheet" type="text/css" href="../css/admin-product.css">
</head>
<body>
	<div class="product-container">
		<%
		String msg = request.getParameter("msg");
		if ("success".equals(msg)) {
		%>
		<p class='success-msg'>Product Updated Successfully</p>
		<%
		}
		if ("invalid".equals(msg)) {
		%>
		<p class='failure-msg'>Error Occured Check Again..!</p>
		<%
		}
		%>


		<div class="product-form">
			<%
			String id = request.getParameter("id");
			%>
			<h3>
				Product ID:<%
			out.print(id);
			%>
			</h3>
			<form action="update-product-action.jsp" method="post">
				
				<pre>
				<%
				id = request.getParameter("id");
				try {
					Connection con = DAOConnection.getConnection();
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("select * from product where id=" + id);
					while (rs.next()) {%>
					    <input type="hidden" name="id" value="<%= rs.getString(1)%>">
   						<label>Enter Name</label><br>
						<input type="text" name="name" placeholder="<%= rs.getString(2)%>"> 
						<label>Enter Category</label><br>
						<input type="text" name="category" placeholder="<%= rs.getString(3)%>"> 
						<label>Enter Price</label><br>
						<input type="text" name="price" placeholder="<%= rs.getString(4)%>">
						<label>Active</label><br>
						<select name="active">
								<option selected><%= rs.getString(5)%></option>
								<option>No</option>
								<option>Yes</option>
							    </select><br>

					<%}
				} catch (Exception e) {
                   e.printStackTrace();
				}
				%>
			
			                        <button value="Update">Update &nbsp;&nbsp;<i class="fa fa-arrow-circle-o-right"></i></button>
			</pre>
			</form>
		</div>
	</div>
</body>
</html>
<%@include file="../footer.jsp"%>