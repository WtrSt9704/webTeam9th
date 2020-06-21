package dao;

import java.util.ArrayList;

import dto.Product;
import java.sql.*;

public class SignupDAO {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static SignupDAO instance = new SignupDAO();
	Connection conn = null;
	public static SignupDAO getInstance(){
		return instance;
	}
	public boolean f() throws SQLException, ClassNotFoundException {
		String url = "jdbc:mysql://localhost:3306/JSPBookDB?serverTimezone=UTC";
		String user = "root";
		String password = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		ResultSet rs = null;
		Statement stmt = null;
		boolean result = false;
		try {
			String sql = "select id from member where id=='";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				result = true;
			}
		} catch (SQLException ex) {
			System.out.println("Member 테이블 호출이 실패했습니다.<br>");
			System.out.println("SQLException: " + ex.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
		
	}
}
