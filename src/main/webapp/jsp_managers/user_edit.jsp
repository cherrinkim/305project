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
        <title>Edit User</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <form method="post" action="user_edit_result.jsp">
        <jsp:include page="header.jsp"/>
        
        <h2>Edit User</h2>
        
        <% if (request.getParameter("editid") != null) { %>
        
        <% 
        String id = request.getParameter("editid");
        session.setAttribute("editid", id);
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
        "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("SELECT * FROM Users WHERE user_id = '" + id + "';");
        if (rs.next()) {
            String user_id = rs.getString(1);
            String first_name = rs.getString(3);  
            String last_name = rs.getString(4);
            String address = rs.getString(5);
            String city = rs.getString(6);
            String state = rs.getString(7);
            String zip = rs.getString(8);
            String phone = rs.getString(9);
            String email = rs.getString(10);
            String created = rs.getString(11);
            String account_number = rs.getString(12);
            String purchase_rating = rs.getString(13);
            
            %>
            <p><b>User #<%=rs.getString(1)%> (<%=rs.getString(3)%> <%=rs.getString(4)%>)</b></p>
            <p>Account created at <%=rs.getString(11)%></p>
            
            <p>First Name:</p>
        <input type="text" name="first_name" value="<%=rs.getString(3)%>" />
        <br />
        <p>Last Name: </p>
        <input type="text" name="last_name" value="<%=rs.getString(4)%>" />
        <br />
        <p>Email Address: </p>
        <input type="text" name="email" value="<%=rs.getString(10)%>" />
        <br />
        <p>Address: </p>
        <input type="text" name="address" value="<%=rs.getString(5)%>" />
        <br />
        <p>City: </p>
        <input type="text" name="city" value="<%=rs.getString(6)%>" />
        <br />
        <p>State: </p>
        <input type="text" name="state" value="<%=rs.getString(7)%>" />
        <br />
        <p>Zip: </p>
        <input type="text" name="zip" value="<%=rs.getString(8)%>" />
        <br />
        <p>Phone: </p>
        <input type="text" name="phone" value="<%=rs.getString(9)%>" />
        <br />
        <p>Bank Account Number (optional): </p>
        <input type="number" name="account_number" min="0" value="<%=rs.getString(12)%>">
        <br />
        <p>Purchase Rating: </p>
        <input type="number" name="purchase_rating" min="0" step="1" value="<%=rs.getString(13)%>" />
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
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
