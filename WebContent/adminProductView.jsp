<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.Connection" %>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="cn.techtutorial.dao.ProductDao"%>
<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="/includes/head.jsp"%>

<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">E-Commerce Cart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
				
				<%
				if (auth != null) {
				%>				
				<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="adminProductView.jsp">view</a></li>
				<li class="nav-item"><a class="nav-link" href="adminOrderView.jsp">Order View</a></li>
				<li class="nav-item"><a class="nav-link" href="adminUsersView.jsp">user view</a></li>
				<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</nav>


  <br>
       <div class = "hole">
       <br><br>
	      <div class = "middle">
	         <br><br>
	                <hr>
	                <h2 class="text-center">Product Details</h2>
	                <hr>
	                
	                <div class="container">
	                
	                <table class="table table-hover table-bordered">
			<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Category</th>
						<th>Price</th>
						<th>Image</th>
						<th>Actions</th>
					
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
								<td><button class="btn btn-primary">Update</button> <button class="btn btn-info">Delete</button></td>
							
						
								
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
    </div>


</body>
</html>