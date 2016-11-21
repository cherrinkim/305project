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
        <title>Record and View Transactions</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <jsp:include page="header.jsp"/>
        
        <h2>Transactions</h2>
        
        <table>
            <tr>
            <th>Transaction ID</th>
            <th>Buyer ID</th>
            <th>Account Number</th>
            <th>Date Sold</th>
            <th>Advertisement ID</th>
            <th>Number of Units</th>
            <th>Overseer ID</th>
            <th>Charge Amount</th>
            </tr>
        
        <%
            
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("SELECT * FROM Sales");
        
        while (rs.next()) { %>
            <tr>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(7) %></td>
                <td>$<%= rs.getString(8) %></td>
            </tr>
        <% }; %>
        </table>
        
        </br><form method="post" action="transaction_create.jsp"><button a href="transaction_create.jsp">Record New Transaction</button></form>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
