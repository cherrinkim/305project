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
        <title>Create, Edit, and View Advertisements</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <form method="post" action="advertisement_edit.jsp">
        <jsp:include page="header.jsp"/>
        
        <h2>Advertisements</h2>
        
        <table>
            <tr>
            <th>Ad ID</th>
            <th>Employee ID</th>
            <th>Ad Type</th>
            <th>Date Created</th>
            <th>Company</th>
            <th>Item Name</th>
            <th>Description</th>
            <th>Unit Price</th>
            <th>Available Units</th>
            <th></th>
            </tr>
        
        <%
            
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("SELECT * FROM Advertisements");
        
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
                <td><%= rs.getString(9) %></td>
                <td><center><button name="editid" type="submit" value=<%= rs.getString(1) %>>Edit</button><br /><form method="post" action="advertisement_delete.jsp"><button name="deleteid" type="submit" value=<%= rs.getString(1) %>>Delete</button></form></center></td>
            </tr>
        <% }; %>
        </table>
        
        </br><button a href="advertisement_create.jsp">Create New Advertisement</button>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
        </form>
    </body>
</html>
