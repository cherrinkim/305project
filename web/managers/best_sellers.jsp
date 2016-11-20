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
        <title>Best-Selling Items List</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        
        <jsp:include page="header.jsp"/>
        
        <h2>Best-Selling Items List:</h2>
        
        <table>
            <tr>
            <th>Item Name</th>
            <th>Total Units Sold</th>
            </tr>
        
        <%
            
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("SELECT A.item_name, SUM(S.number_of_units) as units_sold"
                + " FROM Sales S, Advertisements A"
                + " WHERE A.advertisement_id = S.advertisement_id"
                + " GROUP BY item_name"
                + " ORDER BY units_sold DESC, item_name DESC;");
        
        while (rs.next()) { %>
            <tr>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
            </tr>
        <% }; %>
        </table>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
