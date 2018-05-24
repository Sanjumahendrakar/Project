

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    
        <title>Login</title>
       
    </head>
        <%
            if (request.getParameter("msgg") != null) {
        %>
        <script>alert('Please Enter Correct username and Password');</script>
        <%            }
        %>
    <body>
       
           
            <!-- 
            Body Section 
            -->
           
    <center>
                    <br><br><h1> Login page</h1>	
                    
                        
                       
                                <form action="Store.jsp" method="get">
                                    
                                        <label>User Name</label>
                                      
                                            <input  name="name"  type="text" required="" placeholder="user Name">
                                       
                                     
                                        <label >Password</label>
                                       
                                            <input type="password" name="pass" required=""  placeholder="Password">
                                       
                                                                  <input type="hidden" name="status" value="1"/>
                                    
                                        
                                    <input type="submit" value="login">
                                       	

                        <br><br><br><br><br><br>
           
                                </form>
    </center>
    </body>
</html>

