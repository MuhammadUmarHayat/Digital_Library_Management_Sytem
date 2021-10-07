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
    	<li class="nav-item"><a class="nav-link active" href="librarianPannel.jsp"> Librarian Pannel</a>
		</li>
          <li class="nav-item"><a class="nav-link active" href="logout.jsp">Logout</a></li>
         
        </ul>
		<hr>
		
		
		
      </div>
    </nav>
<br>
<div class="container">
      <section id="main">
	 

<%
//bookid,title,author
String bookid = request.getParameter("id");
String title=request.getParameter("title");
String author=request.getParameter("author");





if(bookid != null)
{
Connection con = null;
PreparedStatement ps = null;
//int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);

String sql="Update `books` set bookid=?,title=?,author=? where bookid='"+bookid+"'";
ps = con.prepareStatement(sql);
ps.setString(1,bookid);
ps.setString(2, title);
ps.setString(3, author);

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