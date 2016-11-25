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
        <title>Find Account History</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
            <jsp:include page="header.jsp"/>
            <h2>Find Account History</h2>
            <%
            String userid = request.getParameter("id");    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT S.transaction_id, S.date_sold, A.item_name, S.charge_amount, S.overseer_id"
                    + " FROM Sales S, Advertisements A"
                    + " WHERE S.card_number = '" + userid + "' AND S.advertisement_id = A.advertisement_id;");
            if (rs.next()) {
                session.setAttribute("queriedname", userid);%>
                <p>Account history for <%=session.getAttribute("queriedname")%>:</p></br>
                
                <%  ResultSet rs2;
                    rs2 = st.executeQuery("SELECT S.transaction_id, S.date_sold, A.item_name, S.charge_amount, S.overseer_id"
                    + " FROM Sales S, Advertisements A"
                    + " WHERE S.card_number = '" + userid + "' AND S.advertisement_id = A.advertisement_id;"); %>
                <table>
                    <tr>
                    <th>Transaction ID</th>
                    <th>Date</th>
                    <th>Item Name</th>
                    <th>Charge Amount</th>
                    <th>Overseer ID</th>
                    </tr>
                    <% while (rs2.next()) { %>
                    <tr>
                    <td><%= rs2.getString(1) %></td>
                    <td><%= rs2.getString(2) %></td>
                    <td><%= rs2.getString(3) %></td>
                    <td>$<%= rs2.getString(4) %></td>
                    <td><%= rs2.getString(5) %></td>
                    </tr>
                    
                <% } %>
                </table>
                <%
            } else {
                %> <p> No transactions with this account have been recorded..</p> <%
            } %>

            <br />
            <br />
            <a href="account_history.jsp">Start a new query</a>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
