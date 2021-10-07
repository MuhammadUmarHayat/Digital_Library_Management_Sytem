<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/dlms";%>
<%!String user = "root";%>
<%!String psw = "";%>

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
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary"  >
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav me-auto">
    	<li class="nav-item"><a class="nav-link active" href="adminPannel.jsp">Admin Pannel </a></li>
          <li class="nav-item"><a class="nav-link active" href="admin_Add_Librarian.jsp">add Librarian</a></li>
		  <li class="nav-item"><a class="nav-link active" href="admin_Manage_Librarian.jsp">Manage Librarian</a></li>	  
          <li class="nav-item"><a class="nav-link active" href="logout.jsp">Logout</a></li>
         
        </ul>
		
		
		
		
      </div>
    </nav>
	<hr>
<br>
<div class="container">
      <section id="main">
	 

<%
//name,generation,price,author,copyright,publisher,pages,ISBN
String userid = request.getParameter("id");
String name=request.getParameter("name");
String address=request.getParameter("address");
String Email=request.getParameter("Email");




if(userid != null)
{
Connection con = null;
PreparedStatement ps = null;
//int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
////name,generation,price,author,copyright,publisher,pages,ISBN
String sql="Update `users` set userid=?,name=?,address=?,Email=? where userid='"+userid+"'";
ps = con.prepareStatement(sql);
ps.setString(1,userid);
ps.setString(2, name);
ps.setString(3, address);
ps.setString(4, Email);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>


</section>
</div>

</body>
</html>