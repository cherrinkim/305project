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
        <title>View All Items for a Company</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
            <jsp:include page="header.jsp"/>
            <h2>View All Items for a Company</h2>
            <%
            String id = request.getParameter("id");    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "!Q@W3e4r");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT DISTINCT itemName FROM Advertisements WHERE company = '" + id + "';");
            if (rs.next()) {
                session.setAttribute("queriedid", id); %>
                <p><%=session.getAttribute("queriedid")%> sells the following items:</p></br>
                
                <%  
                    rs = st.executeQuery("SELECT DISTINCT itemName FROM Advertisements WHERE company = '" + id + "';");
                    %>
                <table>
                    <tr>
                    <th>Item Name</th>
                    </tr>
                    <% while (rs.next()) { %>
                    <tr>
                    <td><%= rs.getString(1) %></td>
                    </tr>
                    
                <% } %>
                </table>
                
            <% } else {
                %> <p>No items by that company found.</p> <%
            } %>

            
            <br />
            <br />
            <a href="company_item_list.jsp">Start a new query</a>
        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
