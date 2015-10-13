package com.wipe.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.sql.DataSource;

public  class JdbcConnect {
	Connection conn;

	public Connection getConnect() {
		//Statement stmt;
		//ResultSet rs;
		String STR = "com.mysql.jdbc.Driver";
		String URL = "jdbc:mysql://localhost:3306/outdoors?useUnicode=true&characterEncoding=UTF-8";
		String USER = "root";
		String PSD="123456";
		
		try {
			Class.forName(STR);
			return conn = DriverManager.getConnection(URL, USER, PSD);
			//System.out.println(conn.toString());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}


}
