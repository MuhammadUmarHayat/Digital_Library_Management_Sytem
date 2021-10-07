
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>



<%

////name,userid,pw,address,discipline,email,usertype
String name="";
String userid="";
String pw="";
String address="";
String discipline="";
String email="";

String usertype="Librarian";
String status="ok";
try
{
	//name,generation,price,author,cp,publisher,page,isbn
 name=request.getParameter("name");
userid=request.getParameter("userid");
pw=request.getParameter("pw");
 address=request.getParameter("address");
discipline=request.getParameter("discipline");
 email=request.getParameter("email");

 //usertype=request.getParameter("usertype");
 
//out.println("name: "+name+" generation: "+generation+" price: "+price+" author: "+author+" cp :"+cp+" publisher: "+publisher+" page1: "+page1+" isbn :"+isbn);

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
Statement st=conn.createStatement();
                                                                                                                                 // `userid`, `password`, `name`, `address`, `Email`, `usertype`, `status`, `Descipline`)
int i=st.executeUpdate("INSERT INTO `users`(`userid`, `password`, `name`, `address`, `Email`, `usertype`, `status`, `Descipline`) values('"+userid+"','"+pw+"','"+name+"','"+address+"','"+email+"','"+usertype+"','"+status+"','"+discipline+"')");
out.println("Librarian is  registered successfully!");
}
catch(Exception e)
{
//System.out.print(e);
//e.printStackTrace();
out.println(e);
//out.println("name: "+name+" generation: "+generation+" price: "+price+" author: "+author+" cp :"+cp+" publisher: "+publisher+" page1: "+page1+" isbn :"+isbn);
//out.println("name"+name+"generation"+generation+"price"+price+"author"+author+cp+"cp"+"publisher"+publisher+"page1"+page1+"isbn"+isbn);
}
		

%>
<!DOCTYPE html>
<html>
 <title>Digital Library Management System</title>
    <link rel="stylesheet" href="myStyles.css" />
<body>


      <nav class="navbar navbar-expand-lg navbar-dark bg-primary"  >
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav me-auto">
      
          <li class="nav-item"><a class="nav-link active" href="adminPannel.jsp">Back</a></li>
          
         </ul>
		
		
		
      </div>
    </nav>

</body>
</html>