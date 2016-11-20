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
        
        <table>
            <thead>
                <h2>Customer Representative Actions:</h2>
            </thead>
            <tbody>
                <tr>
                    <a href="advertisement.jsp">Create or Edit an Advertisement *TODO*</a>
                    <br /> <a href="transaction.jsp">Record a Transaction *TODO*</a>
                    <br /> <a href="users.jsp">Create or Edit User Information *TODO*</a>
                    <br /> <a href="mailing_list.jsp">Produce Customer Mailing List</a>
                    <br /> <a href="item_suggestions.jsp">Get Personalized Item Suggestions for a User</a>
                    <br /> <a href="user_groups.jsp">Get Current Groups for a User</a>
                    <br /> <a href="account_history.jsp">Get Account History for an Account</a>
                    <br /> <a href="best_sellers.jsp">Get Best-Seller Item List *TODO*</a>
                </tr>
            </tbody>
        </table>
            <% if (session.getAttribute("ismanager") != null) {
                        if ((Boolean) session.getAttribute("ismanager")) { %>
                        <br />
                        <table>
                            <thead>
                            <h2>Manager Actions:</h2>
                            </thead>
                            <tbody>
                                <tr>
                                    TODO
                                </tr>
                            </body>
                        </table>
                    <% }}; %>
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
