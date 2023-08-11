<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import = "java.sql.DriverManager" %>
 <%@ page import = "java.sql.ResultSet" %>
 <%@ page import = "java.sql.Statement" %>
 <%@ page import = "java.sql.Connection" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


  <br>
       <div class = "hole">
       <br><br>
	      <div class = "middle">
	         <br><br>
	                <hr>
	                <h2>Pruduct Details</h2>
	                <hr>
	                
	                <table>
			<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Category</th>
						<th>Price</th>
						<th>Image</th>
					
					</tr>
				</thead>
				<tbody>
						<%
						
						try
						{
							Class.forName("com.mysql.jdbc.Driver");
							String userName = "root";
							String password = "root";
							String url = "jdbc:mysql://localhost:3306/ecommerce_cart";
							Connection con = DriverManager.getConnection(url,userName,password);
						    Statement stat = con.createStatement();  
							String query = "";
							String sql;
							if(query!=null)
							{
								
								sql = "select * from ecommerce_cart.products";
								
							}
							else
							{
								sql = "select * from ecommerce_cart.products";
								
							}
							ResultSet rs = stat.executeQuery(sql);
							
							
							while(rs.next())
							{
								%>
							<tr>	
								<td><%=rs.getInt(1) %></td>
								<td><%=rs.getString(2) %></td>
								<td><%=rs.getString(3) %></td>
								<td><%=rs.getString(4) %></td>
								<td><%=rs.getString(5) %></td>
							
						
								
							</tr>
							<%
							}



							
						}
						catch(Exception e)
						{
							out.println("Exception :"+e.getMessage());
							System.out.println("Error");
							e.printStackTrace();
						}
						%>	
						
					<!-- } -->
				</tbody>
			</table>
	                <br>
	                
			     </div>
	         
	      </div>
    </div>


</body>
</html>