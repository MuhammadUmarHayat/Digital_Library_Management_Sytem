<%@ page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<HTML>
<HEAD>
    <TITLE>Select element drop down box</TITLE>
</HEAD>

<BODY >

<%

if (request.getParameter("show") != null)
 {
	String id= request.getParameter("title");
	
	Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM books where bookid='"+id+"'";
                ResultSet rs = st.executeQuery(sql); 
				if (rs.next())
{
    String title = rs.getString("title");
	String bookid= rs.getString("bookid");
	String author= rs.getString("author");
	
	out.println(" Book ID "+bookid+"<br>");
	
out.println("Book Title: "+title+"<br>");
out.println("Book Author: "+author+"<br>");

}

	 
 }


    try
	{
  Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
                Statement st = con.createStatement();
                String sql = "SELECT * FROM books";
                ResultSet rs = st.executeQuery(sql);
				//request.getParameter("title");
               %>

<center>
    <h1> Drop down box or select element</h1>
	<form name="myForm" method="post" action="ddltest.jsp">
        <select name="title">
        <%  while(rs.next()){ %>
            <option value='<%= rs.getString(1)%>'><%= rs.getString(2)%></option>
        <% } %>
        </select>
</center>

<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
<input type="submit" value="show" name="show">
</form>
</BODY>
</HTML>
