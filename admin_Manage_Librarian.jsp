<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "dlms";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

%>

<html>
 <title>Digital Library Management System</title>
    <link rel="stylesheet" href="myStyles.css" />
<body>

<header id="main-header">
      <div class="container">
        <h1>Digital Library Management System  
		</h1>
      </div>
    </header>
    <nav id="navbar" class="navbar navbar-expand-lg navbar-dark bg-primary"  >
      <div class="collapse navbar-collapse" >
        <ul class="navbar-nav me-auto">
		<li class="nav-item"><a class="nav-link active" href="adminPannel.jsp">Admin Pannel </a></li>
          <li class="nav-item"><a class="nav-link active" href="admin_Add_Librarian.jsp">add Librarian</a></li>
		  <li class="nav-item"><a class="nav-link active" href="admin_Manage_Librarian.jsp">Manage Librarian</a></li>	  
          <li class="nav-item"><a class="nav-link active" href="logout.jsp">Logout</a></li>
         
        </ul>
		<hr>
		
		
		
		
      </div>
    </nav>
<br>
<div class="container">
      <section id="main">
	  




<h1>Manage Librarians </h1>
<table border="1">
<tr>
<td>Userid</td>
<td>Name</td>
<td>address</td>
<td>Email</td>
<td>Update</td>
<td>Delete</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users where usertype='Librarian'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	//name,generation,price,author,cp,publisher,page,isbn
	//author,copyright,publisher,pages,ISBN
%>
<tr>
<td><%=resultSet.getString("userid") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("Email") %></td>
<td><a href="updateLibrarian.jsp?id=<%=resultSet.getString("userid")%>">Update</a></td>
<td><a href="deleteLibrarian.jsp?id=<%=resultSet.getString("userid")%>">Delete</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<br>
<br>
<br>
<br>
</section>
</div>

</body>
</html>