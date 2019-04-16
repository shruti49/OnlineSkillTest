<%-- 
    Document   : supertestincharge
    Created on : 19 Mar, 2019, 3:11:26 PM
    Author     : shruti
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //HERE WE GETTING THE ATTRIBUTE DECLARED IN LOGINACTION.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
            String uid = (String) session.getAttribute("superIncharge");
            if (uid == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <h1>super!</h1>
    </body>
</html>
