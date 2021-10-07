<%@ page import="java.sql.*" %>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>

<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>

<%

if (request.getParameter("Receive") != null)
 {
	 
	LocalDate currentdDate1 =  LocalDate.now();
        
		out.println("current Date : "+currentdDate1);
		
String studentID	=request.getParameter("studentID");
String title	=request.getParameter("title");






String remarks="paid";
String status="returned";

Class.forName("com.mysql.jdbc.Driver");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
    
Statement st1=con1.createStatement();
                                                                                                                                
int i=st1.executeUpdate("UPDATE `issue_books` SET `Remarks`='"+remarks+"',`Status`='"+status+"',`Date_of_Ret`='"+currentdDate1+"' where `BookTitle`='"+title+"' and `StudentID`='"+studentID+"'");

out.println(i);
out.println("Book is returned successfully!");










	 
 }//end save fine

%>





<!DOCTYPE html>
<html>
 <title>Digital Library Management System|Librarian Pannel</title>
    <link rel="stylesheet" href="myStyles.css" />
<body>

<header id="main-header">
      <div >
        <h1>Digital Library Management System | Librarian Pannel
		</h1>
      </div>
    </header>
    
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" >
      <div class="collapse navbar-collapse">
 <ul class="navbar-nav me-auto">
          <li class="nav-item"><a class="nav-link active" href="librarianPannel.jsp"> Librarian Pannel</a></li>
		  <li class="nav-item"><a class="nav-link active" href="addBooks.jsp">Add Books</a></li>
		  <li class="nav-item"><a class="nav-link active" href="BooksList.jsp">View Books</a></li>
		  <li class="nav-item"><a class="nav-link active" href="BookIssue.jsp"> Issue Books</a></li>
		  <li class="nav-item"><a class="nav-link active" href="BookFine.jsp">Book Fine</a></li>
		  <li class="nav-item"><a class="nav-link active" href="BookReceived.jsp">Received Book</a></li>
		  
		  <li class="nav-item"><a class="nav-link active" href="logout.jsp">Logout</a></li>
          
        </ul>
		
		
		
      </div>
    </nav>
<br>

<div >
<form name="myForm" method="post" action="BookReceived.jsp">
<table>
<tr>
<td>Student ID </td>
<td> <input type="text" name="studentID"></td>
</tr>
<tr>
<td>Book Title </td>
<td> <input type="text" name="title"></td>
</tr>

<tr>
<td></td>
<td> <input type="submit" value="Receive" name="Receive"></td>
</tr>

</table>
</form>
</div>
</div>
</body>
</html>