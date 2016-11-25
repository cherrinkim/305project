<%-- 
    Document   : logout
    Created on : Nov 19, 2016, 9:44:53 PM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
        session.setAttribute("employeename", null);
        session.setAttribute("employeeid", null);
        session.setAttribute("invalidlogin", null);
        session.setAttribute("ismanager", null);
        session.invalidate();
        response.sendRedirect("representative_login.jsp");
        %>
    </body>
</html>
