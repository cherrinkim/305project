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
        <title>Create, Edit, and View Employees</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
        <jsp:include page="header.jsp"/>
        
        <h2>Employees</h2>
        
        <table>
            <tr>
            <th>Employee ID</th>
            <th>SSN</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Zip</th>
            <th>Phone</th>
            <th>Start Date</th>
            <th>Hourly Rate</th>
            <th>Is Manager</th>
            <th>Tools</th>
            </tr>
        
        <%
            
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("SELECT * FROM Employees");
        
        while (rs.next()) { %>
            <tr>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(7) %></td>
                <td><%= rs.getString(8) %></td>
                <td><%= rs.getString(9) %></td>
                <td><%= rs.getString(10) %></td>
                <td><%= rs.getString(11) %></td>
                <td>$<%= rs.getString(12) %></td>
                <td><%= rs.getString(13) %></td>
                <td><center><form method="post" action="employee_edit.jsp"><button name="editid" type="submit" value=<%= rs.getString(1)%>>Edit</button></form><br /><form method="post" action="employee_delete.jsp"><button name="deleteid" type="submit" value=<%= rs.getString(1) %>>Delete</button></form></center></td>
            </tr>
        <% }; %>
        </table>
        
        </br><form method="post" action="employee_create.jsp"><button a href="employee_create.jsp">Create New Employee</button></form>
        
        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
