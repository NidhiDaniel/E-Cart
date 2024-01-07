<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forget Password</title>
<link rel="stylesheet" type="text/css" href="./css/sign-up.css">
</head>
<body>
	<div class="container">
		<div class="left-div">
			<form action="forgetPwdAction.jsp" method="post">
				<input type="email"name="email" placeholder="Enter Email">
				<input type="number" name="mobile" placeholder="Enter your Mobile Number">
				<select name="security_question">
					<option>What was your first car?</option>
					<option>What is your first school?</option>
					<option>What is your pet name?</option>
					<option>Who was your best friend?</option>
				</select> 
				<input type="text" name="answer" placeholder="Enter Your Answer">
				<input type="password"
					name="new-password" placeholder="Enter Your New Password">  
				<input type="submit" value="Save">
			</form><br>
			<a href="login.jsp">Login</a>
		</div>
		<div class="right-div">
		   <%
            String msgParam = request.getParameter("msg");
            if (msgParam != null && msgParam.equals("done")) {
            %>
                <p class='success-msg'>"Password Updated Successfully..."</p>
            <%
            } else if (msgParam != null && msgParam.equals("error")) {
            %>
                <p class='failure-msg'>Sorry..! Error occurred. Try Again</p>
            <%
            }
            %>
		 <h3>Online Shopping</h3>
		 <p>Online shopping system is the application that allows users to shop online without going to the shops
		 to buy them</p>
		</div>
	</div>
</body>
</html>