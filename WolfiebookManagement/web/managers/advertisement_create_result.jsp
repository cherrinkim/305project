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
        <title>Create New Advertisement</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
            <jsp:include page="header.jsp"/>
            <h2>Create New Advertisement</h2>
            <%
            String type = request.getParameter("type");  
            String company = request.getParameter("company");
            String itemName = request.getParameter("itemName");
            String content = request.getParameter("content");
            String unitPrice = request.getParameter("unitPrice");
            String num_units = request.getParameter("num_units");
            
            if (Double.parseDouble(unitPrice) < 0 || Integer.parseInt(num_units) < 0) { %>
            <p>Advertisement not created. Invalid unit price or quantity.</p>
            <% } else if (type.equals("") || company.equals("") || itemName.equals("") || content.equals("")
                          || unitPrice.equals("") || num_units.equals("")) { %>
            <p>Advertisement not created. Values cannot be empty.</p>
            <% } else {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
                "root", "");
                Statement st = con.createStatement();
                try {
                    String overseer = (String) session.getAttribute("employeeid");
                    st.executeUpdate("INSERT INTO Advertisements "
                        + "(employeeId, type, dateCreated, company, itemName, content, unitPrice, availableUnits)"
                        + " VALUES ('" + overseer + "', "
                        + "'" + type + "', NOW(), "
                        + "'" + company + "', "
                        + "'" + itemName + "', "
                        + "'" + content + "', "
                        + "'" + unitPrice + "', "
                        + "'" + num_units + "');");
                    %> Advertisement successfully created! <%
                } catch (Exception e) {
                    %> <p> An error occurred creating the Advertisement. Make sure all entered values are valid.</p> <%
                }
                
            } %>
            
            
            <br />
            <br />
            <a href="advertisement_create.jsp">Start a new query</a>
            <br /><a href="advertisements.jsp">View All Advertisements</a>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
