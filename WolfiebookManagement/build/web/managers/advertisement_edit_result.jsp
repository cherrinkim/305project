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
        <title>Edit Advertisement</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
            <jsp:include page="header.jsp"/>
            <h2>Edit Advertisement</h2>
            <% if (session.getAttribute("editid") != null) { %>
            <%
            String type = request.getParameter("type");  
            String company = request.getParameter("company");
            String itemName = request.getParameter("itemName");
            String content = request.getParameter("content");
            String unitPrice = request.getParameter("unitPrice");
            String num_units = request.getParameter("num_units");
            
            if (Double.parseDouble(unitPrice) < 0 || Integer.parseInt(num_units) < 0) { %>
            <p>Advertisement not updated. Invalid unit price or quantity.</p>
            <% } else if (type.equals("") || company.equals("") || itemName.equals("") || content.equals("")
                          || unitPrice.equals("") || num_units.equals("")) { %>
            <p>Advertisement not updated. Values cannot be empty.</p>
            <% } else {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
                "root", "!Q@W3e4r");
                Statement st = con.createStatement();
                try {
                    String overseer = (String) session.getAttribute("employeeid");
                    st.executeUpdate("UPDATE Advertisements SET "
                        + "type = '" + type + "', "
                        + "company = '" + company + "', "
                        + "itemName = '" + itemName + "', "
                        + "content = '" + content + "', "
                        + "unitPrice = '" + unitPrice + "', "
                        + "availableUnits = '" + num_units + "'"
                        + " WHERE advertisementId = '" + session.getAttribute("editid") + "';");
                    session.removeAttribute("editid");
                    %> Advertisement successfully updated! <%
                } catch (Exception e) {
                    %> <p> An error occurred updating the Advertisement. Make sure all entered values are valid.</p> <%
                }
                
            } 
                    
            } else {
                %><p>An error has occurred.</p><%
            }%>
            
            
            <br />
            <br />
            <br /><a href="advertisements.jsp">View All Advertisements</a>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
