<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String userid = request.getParameter("userid");
    //session.putValue("email", email);
    String password = request.getParameter("pw");
    String usertype = request.getParameter("usertype");
    
  try 
{
    
Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dlms", "root", "");
    Statement st = con.createStatement();
   
    ResultSet rs = st.executeQuery("select * from users where userid='"+userid+"' and password='"+password+"' and usertype='"+usertype+"' ");
  
if (rs.next())
{
	if(usertype.equals("Admin"))
	{
		  out.println("Admin is corract");
		  session.setAttribute("userid",userid);
      response.sendRedirect("adminPannel.jsp");
	}
	else if (usertype.equals("Librarian"))
	{
		 out.println("Librarian is corract");
		 session.setAttribute("userid",userid);
		 response.sendRedirect("librarianPannel.jsp");
		
	}
	else if (usertype.equals("Student"))
	{
		 out.println("Student is corract");
		 session.setAttribute("userid",userid);
		 		 response.sendRedirect("studentPannel.jsp");
		
	}
	
	
}
else
{
 out.println("Please enter corract userid and password");	
	
}

    
  
    } catch (Exception e) {
        out.println(e);
        e.printStackTrace();
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
      
          <li class="nav-item"><a class="nav-link active" href="index.jsp">Back</a></li>
          
         </ul>
		
		
		
      </div>
    </nav>

</body>
</html>