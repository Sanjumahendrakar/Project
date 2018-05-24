.<%-- 
    Document   : loginaction
    Created on : Feb 23, 2016, 3:43:53 PM
    Author     : java4
--%>

<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Dbcon.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    String uid = request.getParameter("uid");
    String oid = request.getParameter("oid");
    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    System.out.println("Owner Login :" + uid + oid + name + pass);
    String Email = request.getParameter("email");
    String dob = request.getParameter("dob");
    String Gender = request.getParameter("gen");
    String Role = request.getParameter("role");
    String State = request.getParameter("state");
    String Country = request.getParameter("country");
    String secret = request.getParameter("secret");
    System.out.println("User Details" + Role + Gender + dob + State + Email + name + pass + Country);
    // Atributes
    String pkey = request.getParameter("pkey");
    String gpkey = request.getParameter("gpkey");
    String skey = request.getParameter("skey");
    session.setAttribute("skeyss", skey);
    System.out.println("Print All Key :" + pkey + gpkey + skey);

    int status = Integer.parseInt(request.getParameter("status"));
    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        switch (status) {
            case 1:
                try {
                    rs = st.executeQuery("select * from reg where name='" + name + "' AND pass='" + pass + "' AND role='Owner'");
                    if (rs.next()) {
                        response.sendRedirect("Windowsuser.html?msg=success");
                    } else {
                        response.sendRedirect("user.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:
                try {

                    rs = st.executeQuery("select * from reg where name='" + name + "' AND pass='" + pass + "' AND role='User' AND status='No' ");
                    if (rs.next()) {
                    
                        response.sendRedirect("Iosuser.html?msg=success");
                    } else {
                        response.sendRedirect("user.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            case 3:

                try {
                    con = DbConnection.getConnection();
                    st = con.createStatement();
                    int i = st.executeUpdate("insert into reg(name, pass, email, dob, gen, role, state, country, status, pkey, gpkey) values ('" + name + "','" + pass + "','" + Email + "','" + dob + "','" + Gender + "','" + Role + "','" + State + "','" + Country + "','No','Waiting','Waiting')");
                    if (i != 0) {

                        response.sendRedirect("reg.jsp?msg=success");
                    } else {
                        response.sendRedirect("reg.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            case 4:
                try {
                    if (name.equalsIgnoreCase("windows") && pass.equalsIgnoreCase("12345")) {
                         response.sendRedirect("Windowsuser.html?msg=success");
                    } else {
                        response.sendRedirect("user.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 5:
                try {
                    if (name.equalsIgnoreCase("ios") && pass.equalsIgnoreCase("ios")) {
                       response.sendRedirect("Iosuser.html?msg=success");
                    } else {
                        response.sendRedirect("user.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 6:
                try {
                    if (name.equalsIgnoreCase("andriod") && pass.equalsIgnoreCase("andriod")) {
                        response.sendRedirect("aud_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("auditor.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 7:
                try {
                    if (name.equalsIgnoreCase("css") && pass.equalsIgnoreCase("css")) {
                        response.sendRedirect("css_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("css.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 8:
                try {
                    rs = st.executeQuery("select * from reg where pkey='" + pkey + "' AND gpkey='" + gpkey + "'");
                    if (rs.next()) {

                        response.sendRedirect("verify.jsp?msg=success");
                    } else {
                        response.sendRedirect("down.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>