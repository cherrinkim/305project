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
        <title>Record a Transaction</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <form method="post" action="transaction_create_result.jsp">
        <jsp:include page="header.jsp"/>
        
        <h2>Record a Transaction</h2>
        
        <p>Enter information below.</p>
        
        <p>Buyer ID:</p>
        <input type="number" name="buyer_id" min="0" step="1" value="" />
        <br />
        <p>Bank Account Number (if blank, defaults to User's current account number): </p>
        <input type="text" name="account_number" value="" />
        <br />
        <p>Advertisement ID:</p>
        <input type="number" name="advertisement_id" min="0" step="1" value="" />
        <br />
        <p>Number of Units:</p>
        <input type="number" name="number_of_units" min="0" step="1" value="" />
        <br /> <br />
        <input type="submit" value="Submit" />
        </form>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
