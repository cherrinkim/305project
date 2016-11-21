<%-- 
    Document   : item_suggestions_result
    Created on : Nov 20, 2016, 9:13:32 AM
    Author     : bryan
--%>

<%@page import="java.security.MessageDigest"%>
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
            <jsp:include page="header.jsp"/>
            <h2>Edit User</h2>
            <% if (session.getAttribute("editid") != null) { %>
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
            String purchase_rating = request.getParameter("purchase_rating");
            
            if (purchase_rating.equals("") || Integer.parseInt(purchase_rating) < 0) { %>
            <p>User not updated. Invalid purchase rating.</p>
            <% } else if (first_name.equals("") || last_name.equals("") || email.equals("") || address.equals("")
                          || city.equals("") || state.equals("") || zip.equals("") || phone.equals("") || purchase_rating.equals("")) { %>
            <p>User not updated. Values cannot be empty.</p>
            <% } else {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
                "root", "");
                Statement st = con.createStatement();
                if (!password.equals("")) {
                    // encrypt password
                    MessageDigest md = MessageDigest.getInstance("SHA-256");
                    md.update(password.getBytes("UTF-8"));
                    byte [] digest = md.digest();
                    password = String.format("%064x", new java.math.BigInteger(1, digest));
                }
                try {
                    if (!password.equals("")) {
                        st.executeUpdate("UPDATE Users SET "
                        + "first_name = '" + first_name + "', "
                        + "last_name = '" + last_name + "', "
                        + "email = '" + email + "', "
                        + "address = '" + address + "', "
                        + "city = '" + city + "', "
                        + "state = '" + state + "', "
                        + "zipcode = '" + zip + "', "
                        + "telephone = '" + phone + "', "
                        + "credit_card = '" + account_number + "', "
                        + "purchase_rating = '" + purchase_rating + "', "
                        + "user_password = '" + password + "'"
                        + " WHERE user_id = '" + session.getAttribute("editid") + "';");
                    } else {
                        st.executeUpdate("UPDATE Users SET "
                        + "first_name = '" + first_name + "', "
                        + "last_name = '" + last_name + "', "
                        + "email = '" + email + "', "
                        + "address = '" + address + "', "
                        + "city = '" + city + "', "
                        + "state = '" + state + "', "
                        + "zipcode = '" + zip + "', "
                        + "telephone = '" + phone + "', "
                        + "credit_card = '" + account_number + "', "
                        + "purchase_rating = '" + purchase_rating + "'"
                        + " WHERE user_id = '" + session.getAttribute("editid") + "';");
                    }
                    if (account_number.equals(""))
                        st.executeUpdate("UPDATE Users SET credit_card = null WHERE user_id = '" + session.getAttribute("editid") + "';");

                    session.removeAttribute("editid");
                    %> User successfully updated! <%
                } catch (Exception e) {
                    %> <p> An error occurred updating the User. Make sure all entered values are valid.</p> <%
                }
                
            } 
                    
            } else {
                %><p>An error has occurred.</p><%
            }%>
            
            
            <br />
            <br />
            <br /><a href="users.jsp">View All Users</a>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
