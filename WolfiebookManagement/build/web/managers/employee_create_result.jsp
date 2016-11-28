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
        <title>Create New Employee</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
            <jsp:include page="header.jsp"/>
            <h2>Create New Employee</h2>
            <%
            String firstName = request.getParameter("firstName");  
            String lastName = request.getParameter("lastName");
            String ssn = request.getParameter("ssn");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            String phone = request.getParameter("phone");
            String start_date = request.getParameter("start_date");
            String hourlyRate = request.getParameter("hourlyRate");
            String isManager = request.getParameter("isManager");
            if (isManager != null) {
                if (!isManager.equals("1"))
                    isManager = "0";
            } else {
                isManager = "0";
            }
            String password = request.getParameter("password");
            
            if (Double.parseDouble(hourlyRate) < 0) { %>
            <p>Employee not created. Invalid hourly rate.</p>
            <% } else if (firstName.equals("") || lastName.equals("") || ssn.equals("") || address.equals("")
                          || city.equals("") || state.equals("") || zip.equals("") || phone.equals("") || start_date.equals("")
                          || hourlyRate.equals("") || isManager.equals("") || password.equals("")) { %>
            <p>Employee not created. Values cannot be empty.</p>
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
                    st.executeUpdate("INSERT INTO Employees (employeePassword, ssn, "
                                    + "firstName, lastName, address, city, state, zipcode, telephone, "
                                    + "dateStarted, hourlyRate, isManager) VALUES ('" + password + "', "
                        + "'" + ssn + "', "
                        + "'" + firstName + "', "
                        + "'" + lastName + "', "
                        + "'" + address + "', "
                        + "'" + city + "', "
                        + "'" + state + "', "
                        + "'" + zip + "', "
                        + "'" + phone + "', "
                        + "'" + start_date + "', "
                        + "'" + hourlyRate + "', "
                        + "'" + isManager + "');");
                    %> Employee successfully created! <%
                } catch (Exception e) {
                    %> <p> An error occurred creating the Employee. Make sure all entered values are valid.</p> <%
                }
                
            } %>
            
            
            <br />
            <br />
            <a href="employee_create.jsp">Start a new query</a>
            <br /><a href="employees.jsp">View All Employees</a>
        
        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
