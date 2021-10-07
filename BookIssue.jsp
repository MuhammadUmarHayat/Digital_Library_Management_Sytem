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
    <TITLE>Book Issue Interface</TITLE>
	<link rel="stylesheet" href="myStyles.css" />
</HEAD>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" >
      <div class="collapse navbar-collapse">
 <ul class="navbar-nav me-auto">



<li class="nav-item"><a class="nav-link active" href="librarianPannel.jsp">Home Page</a> </li>
</div>
</nav>
<BODY >

<%

if (request.getParameter("issued") != null)
 {
	// DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

//Date today = new Date();

//Date currentDate = formatter.parse(formatter.format(today));
	 
	// out.println("<br> currentDate : "+currentDate);
	
	
	LocalDate currentdDate1 =  LocalDate.now();
        LocalDate currentDatePlus1 = currentdDate1.plusDays(30);
		out.println("Issue Date : "+currentdDate1);
		out.println("Return date : "+currentDatePlus1);

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
	
	out.println("<br> Book ID "+bookid+"<br>");
	
out.println("Book Title: "+title+"<br>");
out.println("Book Author: "+author+"<br>");

String studentID=request.getParameter("studentID");
String remarks=request.getParameter("remarks");

out.println("studentID: "+studentID+"<br>");
out.println("remarks: "+remarks+"<br>");


String status="issued";
Class.forName("com.mysql.jdbc.Driver");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
    
Statement st1=con1.createStatement();
                                                                                                                                
int i=st1.executeUpdate("INSERT INTO `issue_books`(`BookID`, `BookTitle`, `StudentID`, `Date_of_Issue`, `Date_of_Ret`, `Status`, `Remarks`) VALUES ('"+bookid+"','"+title+"','"+studentID+"','"+currentdDate1+"','"+currentDatePlus1+"','"+status+"','"+remarks+"')");
out.println("Book is issued successfully!");








}

	 
 }//end issued button

		
		
if (request.getParameter("show") != null)
 {
	// DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

//Date today = new Date();

//Date currentDate = formatter.parse(formatter.format(today));
	 
	// out.println("<br> currentDate : "+currentDate);
	
	
	LocalDate currentdDate1 =  LocalDate.now();
        LocalDate currentDatePlus1 = currentdDate1.plusDays(30);
		out.println("Issue Date : "+currentdDate1);
		out.println("Return date : "+currentDatePlus1);

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
	
	out.println("<br> Book ID "+bookid+"<br>");
	
out.println("Book Title: "+title+"<br>");
out.println("Book Author: "+author+"<br>");

}

	 
 }//end show button


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
    <h1> Book Issue Interface</h1>
	<form name="myForm" method="post" action="BookIssue.jsp">
       
 <table width="400px" align="center" border=2>
                <tr>
				
				
				
				
                    <td align="center" colspan="2">Add book Issue Details</td>
                </tr>
                <tr>
                    <td>Title </td>
                    <td>  <select name="title">
        <%  while(rs.next()){ %>
            <option value='<%= rs.getString(1)%>'><%= rs.getString(2)%></option>
        <% } %>
        </select>
<input type="submit" value="show" name="show">


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
                    <td>Student ID </td>
                    <td>
                        <input type="text" name="studentID">
                    </td>
                </tr>
				
				 <tr>
                    <td>Remarks </td>
                    <td>
                        <input type="text" name="remarks">
                    </td>
                </tr>
				 <tr>
				
                    <td> </td>
                    <td>
                        <input type="submit" value="Issue" name="issued">
                    </td>
                </tr>
				
				
				
  </table>
				

<p><h2>Note: </h2> Each book is issued for 30 days.</p>

</form>
</center>
</BODY>
</HTML>
