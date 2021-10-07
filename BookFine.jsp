<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>

<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>

<HTML>
<HEAD>
    <TITLE>Book Fine Interface</TITLE>
</HEAD>
<link rel="stylesheet" href="myStyles.css" />
<BODY >
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" >
      <div class="collapse navbar-collapse">
 <ul class="navbar-nav me-auto">
		 <li class="nav-item"><a class="nav-link active" href="librarianPannel.jsp"> Librarian Pannel</a></li>
		 <li class="nav-item"><a class="nav-link active" href="logout.jsp">Logout</a></li>
         
        </ul>
		</div>
		</nav
		
		
		<hr>
		
<%

if (request.getParameter("save") != null)
 {
	LocalDate currentdDate1 =  LocalDate.now();
        LocalDate currentDatePlus1 = currentdDate1.plusDays(30);
		out.println("current Date : "+currentdDate1);
		

	String id= request.getParameter("title");
	String StudentID=request.getParameter("StudentID");
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
	
	out.println("<br> Book ID "+bookid+"<br>");
	
out.println("Book Title: "+title+"<br>");
out.println("Book Author: "+author+"<br>");

String amount=request.getParameter("amount");


out.println("Amount Per day in PKR: "+amount+"<br>");



String status="ok";
Class.forName("com.mysql.jdbc.Driver");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
    
Statement st1=con1.createStatement();
                                                                                                                                
int i=st1.executeUpdate("INSERT INTO `booksfine`(`BookID`, `BookTitle`, `amount`, `date`, `status`,`StudentID`) VALUES ('"+bookid+"','"+title+"','"+amount+"','"+currentdDate1+"','"+status+"','"+StudentID+"')");
out.println("Fine is added successfully!");








}

	 
 }//end save fine



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
    <h1> Book Fine Interface</h1>
	<form name="myForm" method="post" action="BookFine.jsp">
       
 <table width="400px" align="center" border=2>
                <tr>
				
				
				
				
                    <td align="center" colspan="2">Define book Fine amount</td>
                </tr>
                <tr>
                    <td> Book Title </td>
                    <td>  <select name="title">
        <%  while(rs.next()){ %>
            <option value='<%= rs.getString(2)%>'><%= rs.getString(2)%></option>
        <% } %>
        </select>
		

</tr>
<tr><td> </td>

<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%></td>
                </tr>
                <tr>
                    <td>Amount </td>
                    <td>
                        <input type="text" name="amount">
                    </td>
                </tr>
				
				 
				 <tr>
				
                    <td> </td>
                    <td>
                        <input type="submit" value="save" name="save">
                    </td>
                </tr>
				
				
				
  </table>
				

<p>

</form>
</center>
</BODY>
</HTML>
