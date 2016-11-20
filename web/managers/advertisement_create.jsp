<%-- 
    Document   : mailing_list_new
    Created on : Nov 19, 2016, 9:57:58 PM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/manager.css" rel="stylesheet" type="text/css">
        <title>Create New Advertisement</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <form method="post" action="advertisement_create_result.jsp">
        <jsp:include page="header.jsp"/>
        
        <h2>Create New Advertisement</h2>
        
        <p>Enter information below.</p>
        
        <p>Ad Type:</p>
        <input type="text" name="type" value="" />
        <br />
        <p>Company Name: </p>
        <input type="text" name="company" value="" />
        <br />
        <p>Item Name: </p>
        <input type="text" name="item_name" value="" />
        <br />
        <p>Description: </p>
        <input type="text" name="content" value="" />
        <br />
        <p>Unit Price: </p>
        <input type="nu" name="unit_price" min="0" step="any" value="" />
        <br />
        <p>Number of Available Units: </p>
        <input type="number" name="num_units" min="0" value="" />
        <br /> <br />
        <input type="submit" value="Submit" />
        </form>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
