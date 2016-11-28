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
        <title>Create New User</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <form method="post" action="advertisement_create_result.jsp">
        <jsp:include page="header.jsp"/>
        
        <h2>Create New User</h2>
        
        <p>Enter information below.</p>
        
        <p>First Name:</p>
        <input type="text" name="firstName" value="" />
        <br />
        <p>Last Name: </p>
        <input type="text" name="lastName" value="" />
        <br />
        <p>Email Address: </p>
        <input type="text" name="email" value="" />
        <br />
        <p>Address: </p>
        <input type="text" name="address" value="" />
        <br />
        <p>City: </p>
        <input type="text" name="city" value="" />
        <br />
        <p>State: </p>
        <input type="text" name="state" value="" />
        <br />
        <p>Zip: </p>
        <input type="text" name="zip" value="" />
        <br />
        <p>Phone: </p>
        <input type="text" name="phone" value="" />
        <br />
        <p>Bank Account Number (optional): </p>
        <input type="number" name="account_number" min="0" value="" />
        <br />
        <p> Password: </p>
        <input type="password" name="password" value="" />
        <br /> <br />
        <input type="submit" value="Submit" />
        </form>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
