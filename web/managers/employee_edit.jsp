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
        <title>Edit Employee</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
        <form method="post" action="employee_edit_result.jsp">
        <jsp:include page="header.jsp"/>
        
        <h2>Edit Employee</h2>
        
        <% if (request.getParameter("editid") != null) { %>
        
        <% 
        String id = request.getParameter("editid");
        session.setAttribute("editid", id);
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
        "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("SELECT * FROM Employees WHERE employee_id = '" + id + "';");
        if (rs.next()) {
            String employee_id = rs.getString(1);
            String first_name = rs.getString(4);  
            String last_name = rs.getString(5);
            String ssn = rs.getString(3);
            String address = rs.getString(6);
            String city = rs.getString(7);
            String state = rs.getString(8);
            String zip = rs.getString(9);
            String phone = rs.getString(10);
            String start_date = rs.getString(11);
            String hourly_rate = rs.getString(12);
            String is_manager = rs.getString(13);
            
            %>
            <p><b>Employee #<%=rs.getString(1)%></b></p>
            <p><%=rs.getString(4)%> <%=rs.getString(5)%></p>
            
            <p>First Name:</p>
        <input type="text" name="first_name" value="<%=rs.getString(4)%>" />
        <br />
        <p>Last Name: </p>
        <input type="text" name="last_name" value="<%=rs.getString(5)%>" />
        <br />
        <p>SSN: </p>
        <input type="text" name="ssn" value="<%=rs.getString(3)%>" />
        <br />
        <p>Address: </p>
        <input type="text" name="address" value="<%=rs.getString(6)%>" />
        <br />
        <p>City: </p>
        <input type="text" name="city" value="<%=rs.getString(7)%>" />
        <br />
        <p>State: </p>
        <input type="text" name="state" value="<%=rs.getString(8)%>" />
        <br />
        <p>Zip: </p>
        <input type="text" name="zip" value="<%=rs.getString(9)%>" />
        <br />
        <p>Phone: </p>
        <input type="text" name="phone" value="<%=rs.getString(10)%>" />
        <br />
        <p>Start Date: </p>
        <input type="date" name="start_date" value="<%=rs.getString(11)%>">
        <br />
        <p>Hourly Rate: </p>
        <input type="nu" name="hourly_rate" min="0" step="any" value="<%=rs.getString(12)%>" />
        <br />
        <p>Is Manager: </p>
        <% if (rs.getString(13).equals("1")) {
            %> <input type="checkbox" name="is_manager" value="1" checked/> <%
        } else {
            %> <input type="checkbox" name="is_manager" value="1" /><%
        } %>
        <br />
        <p>New Password (leave blank for unchanged): </p>
        <input type="password" name="password" value="" />
        <br /> <br />
        <input type="submit" value="Update" />
            
        <% 
        } else {
            %><p>An error has occurred.</p><%
        }
        %>
        
        <%} else { %>
        <p>An error has occurred.</p>
        <% } %>
        
        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
