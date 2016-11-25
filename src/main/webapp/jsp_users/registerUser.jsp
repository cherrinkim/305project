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
        <link href="../resources/css/user.css" rel="stylesheet" type="text/css">
        <title>Create New User</title>
    </head>
    <body>
            <jsp:include page="header.jsp"/>
            <h2>Create New User</h2>
            <%
            String first_name = request.getParameter("first_name");  
            String last_name = request.getParameter("last_name");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            String phone = request.getParameter("phone");
            String account_number = request.getParameter("account_number");
            String password = request.getParameter("password");
            
            if (first_name.equals("") || last_name.equals("") || email.equals("") || address.equals("")
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
                        + "(user_password, first_name, last_name, address, city, state, zipcode, "
                        + " telephone, email, account_created, credit_card, purchase_rating)"
                        + " VALUES ('" + password + "', "
                        + "'" + first_name + "', "
                        + "'" + last_name + "', "
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
        
    </body>
</html>
