<%-- 
    Document   : representative_home
    Created on : Nov 19, 2016, 7:33:31 PM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/manager.css" rel="stylesheet" type="text/css">
        <title>Customer Representative & Manager Menu</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        
        <jsp:include page="header.jsp"/>
        
            <h2>Welcome, <%=session.getAttribute("employeename")%></h2>
            Use the navigation bar above to access database management tools.
        

        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
