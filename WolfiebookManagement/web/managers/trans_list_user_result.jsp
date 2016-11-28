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
        <title>View Transactions by User Name</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
            <jsp:include page="header.jsp"/>
            <h2>View Transactions by User Name</h2>
            <%
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT S.transactionId, S.buyerId, S.cardNumber, S.dateSold, "
                    + "S.advertisementId, S.numberOfUnits, S.overseerId, S.chargeAmount "
                    + "FROM Sales S, Users U "
                    + "WHERE S.buyerId = U.userId AND U.firstName = '" + firstName
                    + "' AND U.lastName = '" + lastName + "';");
            if (rs.next()) {
                session.setAttribute("queriedfirstname", firstName);
                session.setAttribute("queriedlastname", lastName);%>
                </br><p>Transactions by user(s) named <%=session.getAttribute("queriedfirstname")%> <%=session.getAttribute("queriedlastname")%>:</p></br>
                
                <%  
                    rs = st.executeQuery("SELECT S.transactionId, S.buyerId, S.cardNumber, S.dateSold, "
                    + "S.advertisementId, S.numberOfUnits, S.overseerId, S.chargeAmount "
                    + "FROM Sales S, Users U "
                    + "WHERE S.buyerId = U.userId AND U.firstName = '" + firstName
                    + "' AND U.lastName = '" + lastName + "';");
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
                    <th>Charge Amount</th>
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
                %> <p> No transactions found by users with that name.</p> <%
            } %>

            
            <br />
            <br />
            <a href="trans_list_user.jsp">Start a new query</a>
        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
