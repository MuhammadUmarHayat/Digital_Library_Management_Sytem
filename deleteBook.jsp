<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
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
         
		 <li class="nav-item"><a class="nav-link active" href="librarianPannel.jsp"> Librarian Pannel</a></li>
		 <li class="nav-item"><a class="nav-link active" href="logout.jsp">Logout</a></li>
         
        </ul>
		<hr>
		
		
		
      </div>
    </nav>
<br>
<div class="container">
      <section id="main">
	  
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM `books` WHERE bookid='"+id+"'");
out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

</section>
</div>

</body>
</html>