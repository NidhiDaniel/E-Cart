<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
</head>
<body>
	<div class="header">
	<% String email=session.getAttribute("email").toString(); %>
	   
	   <h3>Online Shopping</h3>
	   
		<ul>
		   <li><a href=""><% out.println(email);%><i class="fa fa-user"></i></a></li>
			<li><a href="home.jsp">Home<i class="fa fa-institution"></i></a></li>
			<li><a href="">My Cart<i class="fa fa-cart-arrow-down"></i></a></li>
			<li><a href="">My Orders<i class="fa fa-check-square"></i></a></li>
			<li><a href="">Change Details<i class="fa fa-edit"></i></a></li>
			<li><a href="">Message Us<i class="fa fa-envelope"></i></a></li>
			<li><a href="">About<i class="fa fa-address-book"></i></a></li>
			<li><a href="logout.jsp">Logout<i class="fa fa-sign-out"></i></a></li>
			 <div class="search-container">
			 <form action="search-home.jsp" method="post">
        	<input type="text" placeholder="Search.." name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        	</div>
		</ul>
       
	</div>
</body>
</html>