<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/sign-up.css">
</head>
<body>
	<div class="container">
		<div class="left-div">
			<form action="loginaction.jsp" method="post">
				<input type="email" name="email" placeholder="Enter Email">
				<input type="password" name="password" placeholder="Enter Password">
				<input type="submit" value="Login">
			</form>
			<br> New User?<a href="signupform.jsp">SignUp</a><br>
			<a href="forgetpassword.jsp">Forget Password</a>
		</div>
		<div class="right-div">
		<%
            String msg = request.getParameter("msg");
            if ("notexist".equals(msg)) {
            %>
                <p class='failure-msg'>Incorrect Username or Password! Try again</p>
            <%
            } else if ("invalid".equals(msg)) {
            %>
                <p class='failure-msg'>Invalid User</p>
            <%
            }
            %>
			<h3>Online Shopping</h3>
			<p>Online shopping system is the application that allows users to
				shop online without going to the shops to buy them</p>
		</div>
	</div>
</body>
</html>