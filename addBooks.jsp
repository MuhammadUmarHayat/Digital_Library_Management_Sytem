<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Books</title>
		<link rel="stylesheet" href="myStyles.css" />
    </head>
    <body>

	 
	 <nav class="navbar navbar-expand-lg navbar-dark bg-primary"  >
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav me-auto">
         
		 <li class="nav-item"><a class="nav-link active" href="librarianPannel.jsp"> Librarian Pannel</a></li>
          
          
        </ul>
		
		
		
      </div>
    </nav>

	 
        <form action="FileUploadServlet" method="post" enctype="multipart/form-data">
            <table width="400px" align="center" border=2>
                <tr>
				
				
				
				
                    <td align="center" colspan="2">Add book Details</td>
                </tr>
                <tr>
                    <td>Title </td>
                    <td><input type="text" name="title" /></td>
                </tr>
                <tr>
                    <td>author </td>
                    <td>
                        <input type="text" name="author">
                    </td>
                </tr>
                <tr>
                    <td>Generation </td>
                    <td>
                        <input type="text" name="generation">
                    </td>
                </tr>

				<tr>
                    <td>pages </td>
                    <td><input type="number" name="pages" /></td>
                </tr>
                <tr>
                    <td>Edition </td>
                    <td>
                        <input type="text" name="edition">
                    </td>
                </tr>
                <tr>
                    <td>Copyrights </td>
                    <td>
                        <input type="text" name="copyrights">
                    </td>
                </tr>
				
				<tr>
                    <td>Publishers</td>
                    <td>
                        <input type="text" name="publishers">
                    </td>
                </tr>
				
				
				
				
				
                <tr>
                    <td>Image Link: </td>
                    <td>
                        <input type="file" name="file">
                    </td>
                </tr>
                <tr>
				<tr>
                    <td>category </td>
                    <td>
                        <input type="text" name="category">
                    </td>
                </tr>
				
                    <td></td>
                    <td><input type="submit" value="Submit"></td>
                </tr>
            </table>

        </form><br>

</body>
</html>