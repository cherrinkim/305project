<%-- 
    Document   : mailing_list_new
    Created on : Nov 19, 2016, 9:57:58 PM
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
        <form method="post" action="advertisement_edit_result.jsp">
        <jsp:include page="header.jsp"/>
        
        <h2>Edit Advertisement</h2>
        
        <% if (request.getParameter("editid") != null) { %>
        
        <% 
        String id = request.getParameter("editid");
        session.setAttribute("editid", id);
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
        "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("SELECT * FROM Advertisements WHERE advertisementId = '" + id + "';");
        if (rs.next()) {
            String employeeId = rs.getString(2);
            String type = rs.getString(3);
            String dateCreated = rs.getString(4);
            String company = rs.getString(5);
            String itemName = rs.getString(6);
            String content = rs.getString(7);
            String unitPrice = rs.getString(8);
            String availableUnits = rs.getString(9);
            
            %>
            <p><b>Advertisement #<%=rs.getString(1)%></b></p>
            <p>Created by Employee #<%=rs.getString(2)%> at <%=rs.getString(4)%></p>
            
            <p>Ad Type:</p>
        <input type="text" name="type" value="<%=rs.getString(3)%>" />
        <br />
        <p>Company Name: </p>
        <input type="text" name="company" value="<%=rs.getString(5)%>" />
        <br />
        <p>Item Name: </p>
        <input type="text" name="itemName" value="<%=rs.getString(6)%>" />
        <br />
        <p>Description: </p>
        <input type="text" name="content" value="<%=rs.getString(7)%>" />
        <br />
        <p>Unit Price: </p>
        <input type="number" name="unitPrice" min="0" step="any" value="<%=rs.getString(8)%>" />
        <br />
        <p>Number of Available Units: </p>
        <input type="number" name="num_units" min="0" value="<%=rs.getString(9)%>" />
        <br /> <br />
        <input type="submit" value="Update" />
        </form>
            
        <% 
        } else {
            %><p>An error has occurred.</p><%
        }
        %>
        
        <%} else { %>
        <p>An error has occurred.</p>
        <% } %>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
