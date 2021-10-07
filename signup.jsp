

<!DOCTYPE html>
<html>
 <title>Digital Library Management System</title>
    <link rel="stylesheet" href="myStyles.css" />
<body>

<header id="main-header">
      <div >
        <h1>Digital Library Management System  
		</h1>
      </div>
    </header>
   <nav class="navbar navbar-expand-lg navbar-dark bg-primary"  >
      <div class="collapse navbar-collapse">
        <ul class="navbar-nav me-auto">
           <li class="nav-item"><a class="nav-link active" href="signup.jsp">Signup</a></li>
          <li class="nav-item"><a class="nav-link active" href="index.jsp">Login</a></li>
          
        </ul>
		
		
		
      </div>
    </nav>
<br>
<form name="myForm" method="post" action="signup-process.jsp">


<table>
<tr><td></td><td></td></tr>
<tr><td>Enter Full user name</td><td> <input type="text" name="name"></td></tr>
<tr><td>Enter user ID</td><td> <input type="text" name="userid"></td></tr>
<tr><td>Enter password</td><td> <input type="password" name="pw"></td></tr>
<tr><td>Enter address</td><td> <input type="text" name="address"></td></tr>
<tr><td>Enter discipline</td><td> <input type="text" name="discipline"></td></tr>
<tr><td>Enter email</td><td> <input type="text" name="email"></td></tr>
<tr><td>Enter usertype</td>
<td><input type="radio" name="usertype" value="Admin">Admin
<br><input type="radio" name="usertype" value="Librarian">Librarian
<br><input type="radio" name="usertype" value="Student">Student<br></td></tr>







<tr><td> </td><td> <input type="submit" value="login now!" name="login"></td></tr>

</table>
</form>
</div>

</body>
</html>