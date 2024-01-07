<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.db.connection.DAOConnection"%>
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
<table>
<thead>
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>CATEGORY</th>
			<th><i class="fa fa-inr"></i>PRICE</th>
			<th>ADD TO CART<i class="fa fa-cart-arrow-down"></i></th>
		</tr>

</thead>
<tbody>
<%
int status=0;
try{
	String searchItem=request.getParameter("search");
    Connection con=DAOConnection.getConnection();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select * from product where name like '%"+searchItem+"%' or category like '"+searchItem+"' and active='yes'");
   while(rs.next()){
   status=1;
   %>
   <td><%=rs.getInt(1) %></td>
   <td><%=rs.getString(2) %></td>
   <td><%=rs.getString(3) %></td>
   <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
   <td><a href="addToCartAction.jsp?id=<%= rs.getString(1)%>">Add to cart<i class="fa fa-cart-arrow-down"></i></a></td>
   <%
	   
   }
   if(status==0){
	   out.print("<tr><td colspan='4'><p class='failure-msg' >Sorry..!No Search Item Found</p></td></tr>");
   }
}
catch(Exception e){
	e.printStackTrace();
}
%>


</tbody>

</table>
</body>
<%@ include file="footer.jsp" %>
</html>