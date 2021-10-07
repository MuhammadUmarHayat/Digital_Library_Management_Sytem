<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
	 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book List</title>
		<link rel="stylesheet" href="myStyles.css" />
    </head>
	
	
    <body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary" >
      <div class="collapse navbar-collapse">
 <ul class="navbar-nav me-auto">

	
	<li class="nav-item"><a class="nav-link active" href="librarianPannel.jsp"> Librarian Pannel</a></li>
	</div>
	</nav>
	<h1>Book List</h1>
	<hr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM books";
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
					//bookid,title,author
                    int bookid = rs.getInt("bookid");
					
                    String title = rs.getString("title");
                    String author = rs.getString("author");
                    String filename = rs.getString("filename");
                    String path = rs.getString("path");
				
        %>
		
		<div style="float: left; padding: 10px;">
		<div>
		<h3>ID: <%=bookid%></h3>
		<h3>Title: <%=title%></h3>
		
		<h3>ID: <%=author%></h3>
		<h3><image src="<%=filename%>" width="150" height="200"/></h3>
		<a href="updateBook.jsp?id=<%=rs.getInt("bookid")%>">Update</a>
<a href="deleteBook.jsp?id=<%=rs.getInt("bookid")%>">Delete</a>
		
		</div>
		</div>
		
		
		
		
        <%
               }
            } 
			catch (Exception e) 
			{
                out.println(e);
            }
        %>
    </body>
</html>