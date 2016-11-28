<%-- 
    Document   : item_suggestions_result
    Created on : Nov 20, 2016, 9:13:32 AM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@page import="java.security.MessageDigest"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/manager.css" rel="stylesheet" type="text/css">
        <title>Create New User</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
            <jsp:include page="header.jsp"/>
            <h2>Create New User</h2>
            <%
            String firstName = request.getParameter("firstName");  
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            String phone = request.getParameter("phone");
            String account_number = request.getParameter("account_number");
            String password = request.getParameter("password");
            
            if (firstName.equals("") || lastName.equals("") || email.equals("") || address.equals("")
                          || city.equals("") || state.equals("") || zip.equals("") || phone.equals("") || password.equals("")) { %>
            <p>User not created. Values cannot be empty.</p>
            <% } else {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
                "root", "");
                Statement st = con.createStatement();
                // encrypt password
                MessageDigest md = MessageDigest.getInstance("SHA-256");
                md.update(password.getBytes("UTF-8"));
                byte [] digest = md.digest();
                password = String.format("%064x", new java.math.BigInteger(1, digest));
                try {
                    String overseer = (String) session.getAttribute("employeeid");
                    st.executeUpdate("INSERT INTO Users "
                        + "(userPassword, firstName, lastName, address, city, state, zipcode, "
                        + " telephone, email, accountCreated, creditCard, purchaseRating)"
                        + " VALUES ('" + password + "', "
                        + "'" + firstName + "', "
                        + "'" + lastName + "', "
                        + "'" + address + "', "
                        + "'" + city + "', "
                        + "'" + state + "', "
                        + "'" + zip + "', "
                        + "'" + phone + "', "
                        + "'" + email + "', "
                        + "NOW(), "
                        + "'" + account_number + "', "
                        + "'0');");
                    %> User successfully created! <%
                } catch (Exception e) {
                    %> <p> An error occurred creating the User. Make sure all entered values are valid.</p> <%
                }
                
            } %>
            
            
            <br />
            <br />
            <a href="user_create.jsp">Start a new query</a>
            <br /><a href="users.jsp">View All Users</a>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
