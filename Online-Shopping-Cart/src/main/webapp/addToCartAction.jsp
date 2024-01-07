<%@page import="java.sql.*"%>
<%@page import="com.db.connection.DAOConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String product_id=request.getParameter("id");
String email_id=session.getAttribute("email").toString();
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
int status=0;
try{
	Connection con=DAOConnection.getConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product where id='"+product_id+"'");
	while(rs.next()){
		product_price=(int)rs.getDouble(4);
		product_total=product_price;
	}
	System.out.println(product_price);
	ResultSet rs1=stmt.executeQuery("select * from cart where product_id='"+product_id+"' and email='"+email_id+"'");
    while(rs1.next()){
    	cart_total=rs1.getInt(5);
    	cart_total=cart_total+product_total;
    	quantity=rs1.getInt(3);
    	quantity=quantity+1;
    	status=1;
    }
    if(status==1){
    	stmt.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+product_id+"' and email='"+email_id+"' and address is NULL");
        response.sendRedirect("home.jsp?msg=exist");
    }

	if(status==0){
	PreparedStatement ps=con.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?)");
	
	ps.setString(1,email_id);
	ps.setString(2,product_id);
	ps.setInt(3,quantity);
	ps.setDouble(4,product_price);
	ps.setDouble(5,product_total);
	ps.executeUpdate();
	response.sendRedirect("home.jsp?msg=added");
	}
	
}
catch(Exception e){
	e.printStackTrace();
}

%>
</body>
<%@ include file="footer.jsp" %>
</html>