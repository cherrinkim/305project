<%-- 
    Document   : sales_report
    Created on : Nov 20, 2016, 11:05:28 AM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/manager.css" rel="stylesheet" type="text/css">
        <title>Find Monthly Sales Report</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
        
        <jsp:include page="header.jsp"/>
        
        <h2>Find Monthly Sales Report</h2>
        
        <%
            String month = request.getParameter("month");
            String year = request.getParameter("year");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "!Q@W3e4r");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT * FROM Sales"
                    + " WHERE YEAR(dateSold) = '" + year + "' AND MONTH(dateSold) = '" + month + "';");
            if (rs.next()) {
                session.setAttribute("month", month);
                session.setAttribute("year", year);%>
                </br><p>Sales report for <%=session.getAttribute("month")%>/<%=session.getAttribute("year")%>:</p></br>
                
                <table>
                    <tr>
                    <th>Transaction ID</th>
                    <th>Buyer ID</th>
                    <th>Card Number</th>
                    <th>Date Sold</th>
                    <th>Ad ID</th>
                    <th>Units</th>
                    <th>Overseer ID</th>
                    <th>Charge Amount</th>
                    </tr>
                
                <% rs = st.executeQuery("SELECT * FROM Sales"
                    + " WHERE YEAR(dateSold) = '" + year + "' AND MONTH(dateSold) = '" + month + "';");
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
                <% };%>
                </table>
                
            <% } else { %>
                </br><p>No sales reported for the selected month.</p></br>
            <% }; %>

        
        
        
        <br />
        <br />
        <a href="sales_report.jsp">Start a new query</a>
        
        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>