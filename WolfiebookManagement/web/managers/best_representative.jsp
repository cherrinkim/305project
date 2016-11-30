<%-- 
    Document   : item_suggestions_result
    Created on : Nov 20, 2016, 9:13:32 AM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/manager.css" rel="stylesheet" type="text/css">
        <title>View Which Representative Generated the Most Revenue</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
            <jsp:include page="header.jsp"/>
            <h2>View Which Representative Generated the Most Revenue</h2>
            <%
            String id = "dummy";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "!Q@W3e4r");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT S.overseerId, SUM(S.chargeAmount) as 'revenue' "
                    + "FROM Sales S "
                    + "GROUP BY overseerId "
                    + "ORDER BY revenue DESC LIMIT 1;");
            String revenue = "$";
            if (rs.next()) {
                id = rs.getString(1);
                revenue += rs.getString(2);
                rs = st.executeQuery("SELECT firstName, lastName "
                    + "FROM Employees "
                    + "WHERE employeeId = '" + id + "';");
                String final_name = "dummy";
                if (rs.next()) {
                    final_name = rs.getString(1) + " " + rs.getString(2);
                }
                session.setAttribute("queriedid", id);
                session.setAttribute("revenue", revenue);
                session.setAttribute("queriedname", final_name);%>
                </br><h2>Employee #<%=session.getAttribute("queriedid")%> (<%=session.getAttribute("queriedname")%>) has generated the most revenue.</h2>
                <p>They have generated <%=session.getAttribute("revenue")%> to date.</p></br>
                
                <%  
                    rs = st.executeQuery("SELECT S.transactionId, S.buyerId, S.cardNumber, S.dateSold, "
                    + "S.advertisementId, S.numberOfUnits, S.overseerId, S.chargeAmount "
                    + "FROM Sales S "
                    + "WHERE S.overseerId = '" + id + "';");
                    %>
                <table>
                    <tr>
                    <th>Transaction ID</th>
                    <th>Buyer ID</th>
                    <th>Card Number</th>
                    <th>Date Sold</th>
                    <th>Ad ID</th>
                    <th>Units</th>
                    <th>Overseer ID</th>
                    <th>Revenue</th>
                    </tr>
                    <% while (rs.next()) { %>
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
                    
                <% } %>
                </table>
                
            <% } else {
                %> <p> No users have made transactions yet.</p> <%
            } %>

        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
