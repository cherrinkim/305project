<%-- 
    Document   : sales_report
    Created on : Nov 20, 2016, 11:05:28 AM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/manager.css" rel="stylesheet" type="text/css">
        <title>View Transactions by Item Name</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
        
        <form method="post" action="trans_list_item_result.jsp">
        
        <jsp:include page="header.jsp"/>
        
        <h2>View Transactions by Item Name</h2>
        <p>Enter an item name: </p>
        
        <input type="text" name="id" value="" />
        <br /><br />
        <input type="submit" value="Submit" />
        
        </form>
        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>