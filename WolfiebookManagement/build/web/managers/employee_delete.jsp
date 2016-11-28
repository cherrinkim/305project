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
        <title>Delete Employee</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
            <jsp:include page="header.jsp"/>
            <h2>Delete Employee</h2>
        <% if (request.getParameter("deleteid") != null) { %>
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
                "root", "");
                Statement st = con.createStatement();
                ResultSet rs;
                String id = request.getParameter("deleteid");
                rs = st.executeQuery("SELECT * FROM Sales WHERE overseerId = '" + id + "';");
                Statement st2 = con.createStatement();
                ResultSet rs2;
                rs2 = st2.executeQuery("SELECT * FROM Advertisements WHERE employeeId = '" + id + "';");
                if (request.getParameter("deleteid").equals(session.getAttribute("employeeid"))) {
                %> <p>Cannot delete yourself.</p> <%
                } else if (rs.next() || rs2.next()) {
                   %><p>Employee could not be deleted.</p>
                   <p>To maintain database integrity, employees associated with a transaction or advertisement cannot be deleted.</p><%
                } else {
                    try {
                    st.executeUpdate("DELETE FROM Employees"
                        + " WHERE employeeId = '" + id + "';");
                    %> <p>Employee successfully deleted!</p> <%
                    } catch (Exception e) {
                        %> <p> An error occurred when deleting the Employee.</p> <%
                    }
                }
            } else {
                %> An error has occurred. <%
            }%>
            
            
            <br />
            <br />
            <br /><a href="employees.jsp">View All Employees</a>
        
        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
