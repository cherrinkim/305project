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
        <title>View Transactions by Item Name</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
            <jsp:include page="header.jsp"/>
            <h2>View Transactions by Item Name</h2>
            <%
            String item = request.getParameter("id");    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT S.transaction_id, S.buyer_id, S.card_number, S.date_sold, "
                    + "S.advertisement_id, S.number_of_units, S.overseer_id, S.charge_amount "
                    + "FROM Sales S, Advertisements A "
                    + "WHERE A.item_name = '" + item + "' AND A.advertisement_id = S.advertisement_id;");
            if (rs.next()) {
                session.setAttribute("querieditem", item);%>
                </br><p>Transactions involving item <%=session.getAttribute("querieditem")%>:</p></br>
                
                <%  
                    rs = st.executeQuery("SELECT S.transaction_id, S.buyer_id, S.card_number, S.date_sold, "
                    + "S.advertisement_id, S.number_of_units, S.overseer_id, S.charge_amount "
                    + "FROM Sales S, Advertisements A "
                    + "WHERE A.item_name = '" + item + "' AND A.advertisement_id = S.advertisement_id;");
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
                %> <p> No transactions found with that item name.</p> <%
            } %>

            
            <br />
            <br />
            <a href="trans_list_item.jsp">Start a new query</a>
        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
