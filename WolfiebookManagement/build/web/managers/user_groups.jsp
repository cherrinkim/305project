<%-- 
    Document   : item_suggestions
    Created on : Nov 20, 2016, 9:08:24 AM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/manager.css" rel="stylesheet" type="text/css">
        <title>Find User Groups</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        
        <form method="post" action="user_groups_result.jsp">
        
        <jsp:include page="header.jsp"/>
        
        <h2>Find User Groups</h2>
        <p>Enter a valid user ID:</p>
        <input type="text" name="id" value="" />
        <br /><br />
        <input type="submit" value="Submit" />
        
        </form>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
