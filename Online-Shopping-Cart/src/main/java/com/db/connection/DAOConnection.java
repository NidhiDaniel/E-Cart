package com.db.connection;

import java.sql.Connection;
import java.sql.DriverManager;

import com.mysql.cj.jdbc.Driver;

public class DAOConnection {
   

public static Connection getConnection() {
	 Connection con=null;
	   try {
		DriverManager.registerDriver(new Driver());
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_cart","root","admin");
	} catch (Exception e) {
		e.printStackTrace();
	}
	return con;
   }
}
