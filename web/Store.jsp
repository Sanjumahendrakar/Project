<%-- 
    Document   : loginaction
    Created on : Feb 23, 2016, 3:43:53 PM
    Author     : java4
--%>

<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>



<%@page import="java.io.BufferedReader" %>
<%@page import="java.util.Random"%>
<%
    String name=request.getParameter("v1");
    String pass=request.getParameter("v2");
    
   try
   {
   if (name.equalsIgnoreCase("windows") && pass.equalsIgnoreCase("12345")) {
 response.sendRedirect("Windowsuser.html?msg=success");
                    } 
   else  if(name.equalsIgnoreCase("ios") && pass.equalsIgnoreCase("12345"))
      {
 response.sendRedirect("Iosuser.html?msg=success");
                    } 
   else if(name.equalsIgnoreCase("andriod") && pass.equalsIgnoreCase("12345"))
               {
 response.sendRedirect("Andrioduser.html?msg=success");
                    } 
       
       else
       response.sendRedirect("Login_Page.jsp?msgg=failed");
   }
   catch(Exception e)
   {}
%>