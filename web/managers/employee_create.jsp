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
        <title>Create New Employee</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
        <form method="post" action="employee_create_result.jsp">
        <jsp:include page="header.jsp"/>
        
        <h2>Create New Employee</h2>
        
        <p>Enter information below.</p>
        
        <p>First Name:</p>
        <input type="text" name="first_name" value="" />
        <br />
        <p>Last Name: </p>
        <input type="text" name="last_name" value="" />
        <br />
        <p>SSN: </p>
        <input type="text" name="ssn" value="" />
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
        <p>Start Date: </p>
        <input type="date" name="start_date">
        <br />
        <p>Hourly Rate: </p>
        <input type="number" name="hourly_rate" min="0" step="any" value="" />
        <br />
        <p>Is Manager: </p>
        <input type="checkbox" name="is_manager" value="1" />
        <br />
        <p> Password: </p>
        <input type="password" name="password" value="" />
        <br /> <br />
        <input type="submit" value="Submit" />
        </form>
        
        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
