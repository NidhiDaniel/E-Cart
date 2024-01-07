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
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String mobileStr = request.getParameter("mobile");
	String question = request.getParameter("security_question");
	String answer = request.getParameter("answer");
	String password = request.getParameter("password");
	String address = "";
	String city = "";
	String state = "";
	String country = "";
	try {
		if (mobileStr != null && !mobileStr.isEmpty()) {
			long mobile = Long.parseLong(request.getParameter("mobile"));
			Connection con = DAOConnection.getConnection();
			PreparedStatement stmt = con.prepareStatement(
			"insert into signup_table(name,email,mobile_number,security_question,answer,password,address,city,state,country) values (?,?,?,?,?,?,?,?,?,?)");
			stmt.setString(1, name);
			stmt.setString(2, email);
			stmt.setLong(3, mobile);
			stmt.setString(4, question);
			stmt.setString(5, answer);
			stmt.setString(6, password);
			stmt.setString(7, address);
			stmt.setString(8, city);
			stmt.setString(9, state);
			stmt.setString(10, country);
			stmt.executeUpdate();
			response.sendRedirect("signupform.jsp?msg=valid");
		}
	}
	catch (NumberFormatException e) {
	    e.printStackTrace();
	    // Handle the case where "mobile" parameter is not a valid integer
	    response.sendRedirect("signupform.jsp?msg=invalid");
	} 
	catch (SQLException e) {
		e.printStackTrace();
		response.sendRedirect("signupform.jsp?msg=invalid");
	}
	%>
</body>
</html>