package cn.techtutorial.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Products {

	public static int insertProduct(String name, String category, String price, String image) {
	    int isSuccess = 0;
	    // Connect to the database
	    String url = "jdbc:mysql://localhost:3306/ecommerce_cart";
	    String user = "root";
	    String pwd = "root";

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection con = DriverManager.getConnection(url, user, pwd);

	        String sql = "INSERT INTO products (name, category, price, image) VALUES (?, ?, ?, ?)";
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, name);
	        pstmt.setString(2, category);
	        pstmt.setDouble(3, Double.parseDouble(price)); // Set as double
	        pstmt.setString(4, image);

	        int rowsInserted = pstmt.executeUpdate();

	        if (rowsInserted > 0) {
	            isSuccess = 1;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	}

}
