<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
 <title>Digital Library Management System</title>
    <link rel="stylesheet" href="myStyles.css" />
<body>

<header id="main-header">
      <div class="container">
        <h1>Digital Library Management System Test Phase 
		</h1>
      </div>
    </header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary"  >
      <div class="collapse navbar-collapse">
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from `users` where userid='"+id+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	
	//name,generation,price,author,copyright,publisher,pages,ISBN
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="update-processLibrarian.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("userid") %>">
<input type="text" name="id" value="<%=resultSet.getString("userid") %>">
<br>
Name:<br>
<input type="text" name="name" value="<%=resultSet.getString("name") %>">
<br>
Address:<br>
<input type="text" name="address" value="<%=resultSet.getString("address") %>">
<br>
Email:<br>
<input type="text" name="Email" value="<%=resultSet.getString("Email") %>">
<br>



<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>


</section>
</div>

</body>
</html>