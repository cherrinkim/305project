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
        <title>Delete Advertisement</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
            <jsp:include page="header.jsp"/>
            <h2>Delete Advertisement</h2>
        <% if (request.getParameter("deleteid") != null) { %>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
                "root", "");
                Statement st = con.createStatement();
                ResultSet rs;
                String id = request.getParameter("deleteid");
                rs = st.executeQuery("SELECT * FROM Sales WHERE advertisementId = '" + id + "';");
                if (rs.next()) {
                %> <p>Advertisement could not be deleted.</p>
                   <p>To maintain database integrity, advertisements associated with a transaction cannot be deleted.</p> <%
                } else {
                    try {
                    st.executeUpdate("DELETE FROM Advertisements"
                        + " WHERE advertisementId = '" + id + "';");
                    %> <p>Advertisement successfully deleted!</p> <%
                    } catch (Exception e) {
                        %> <p> An error occurred when deleting the Advertisement.</p> <%
                    }
                }
            } else {
                
            }%>
            
            
            <br />
            <br />
            <br /><a href="advertisements.jsp">View All Advertisements</a>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
