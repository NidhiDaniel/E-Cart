
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
String email = request.getParameter("email");
String newPassword = request.getParameter("new-password");
String question = request.getParameter("security_question");
String answer = request.getParameter("answer");
int status = 0;

try {
    Connection con = DAOConnection.getConnection();
    
    // Use prepared statement to prevent SQL injection
    String query = "SELECT * FROM signup_table WHERE email=? AND security_question=? AND answer=?";
    
    try (PreparedStatement pstmt = con.prepareStatement(query)) {
        pstmt.setString(1, email);
        pstmt.setString(2, question);
        pstmt.setString(3, answer);
        
        try (ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                PreparedStatement updateStmt = con.prepareStatement("UPDATE signup_table SET password=? WHERE email=?");
                updateStmt.setString(1, newPassword);
                updateStmt.setString(2, email);
                status = updateStmt.executeUpdate();
                out.print(status);
                if (status > 0) {
                    response.sendRedirect("forgetpassword.jsp?msg=done");
                } else {
                    response.sendRedirect("forgetpassword.jsp?msg=error");
                }
            } else {
                response.sendRedirect("forgetpassword.jsp?msg=error");
            }
        }
    }
} catch (Exception e) {
    e.printStackTrace();
    // Redirect to an error page or provide a more user-friendly error message
    response.sendRedirect("forgetpassword.jsp?msg=error");
}
%>
</body>
</html>