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
        <title>View All Customers Who Have Purchased an Item</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
            <jsp:include page="header.jsp"/>
            <h2>View All Customers Who Have Purchased an Item</h2>
            <%
            String id = request.getParameter("id");    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT DISTINCT U.userId, U.firstName, U.lastName"
                    + " FROM Sales S, Users U "
                    + "WHERE S.buyerId = U.userId AND S.advertisementId = '" + id + "';");

            if (rs.next()) {
                session.setAttribute("queriedid", id);
                rs = st.executeQuery("SELECT itemName "
                    + "FROM Advertisements "
                    + "WHERE advertisementId = '" + id + "';");
                if (rs.next()) {
                    session.setAttribute("querieditemname", rs.getString(1));
                };%>
                <p>The following users have purchased item #<%=session.getAttribute("queriedid")%> (<%=session.getAttribute("querieditemname")%>):</p></br>
                
                <%  
                    rs = st.executeQuery("SELECT DISTINCT U.userId, U.firstName, U.lastName"
                    + " FROM Sales S, Users U "
                    + "WHERE S.buyerId = U.userId AND S.advertisementId = '" + id + "';");
                    %>
                <table>
                    <tr>
                    <th>User ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    </tr>
                    <% while (rs.next()) { %>
                    <tr>
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    </tr>
                    
                <% } %>
                </table>
                
            <% } else {
                %> <p> No transactions found with that item ID.</p> <%
            } %>

            
            <br />
            <br />
            <a href="buyer_list.jsp">Start a new query</a>
        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
