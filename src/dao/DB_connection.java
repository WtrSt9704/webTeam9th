package dao;

import java.sql.*;

public class DB_connection {

	public static Connection getConnection() {
	
		Connection conn=null;
	 
	  try{
	     
	        String jdbcUrl= "jdbc:mysql://localhost:3306/JSPBookDB?serverTimezone=UTC" ;
	        String dbId="root";
	        String dbPass= "1234";
	 
	        Class.forName("com.mysql.jdbc.Driver");
	        conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	        
	  }catch(Exception e){
	           e.printStackTrace();
	    
	  }
	 
	  return conn;

	}
	
	

}
