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
        <title>Edit Employee</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
            <jsp:include page="header.jsp"/>
            <h2>Edit Employee</h2>
            <% if (session.getAttribute("editid") != null) { %>
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
            
            if (hourlyRate.equals("") ||Double.parseDouble(hourlyRate) < 0) { %>
            <p>Employee not updated. Invalid hourly rate.</p>
            <% } else if (firstName.equals("") || lastName.equals("") || ssn.equals("") || address.equals("")
                          || city.equals("") || state.equals("") || zip.equals("") || phone.equals("") || start_date.equals("")
                          || hourlyRate.equals("") || isManager.equals("")) { %>
            <p>Employee not updated. Values cannot be empty.</p>
            <% } else {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
                "root", "!Q@W3e4r");
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
                        st.executeUpdate("UPDATE Employees SET "
                        + "firstName = '" + firstName + "', "
                        + "lastName = '" + lastName + "', "
                        + "ssn = '" + ssn + "', "
                        + "address = '" + address + "', "
                        + "city = '" + city + "', "
                        + "state = '" + state + "', "
                        + "zipcode = '" + zip + "', "
                        + "telephone = '" + phone + "', "
                        + "dateStarted = '" + start_date + "', "
                        + "hourlyRate = '" + hourlyRate + "', "
                        + "employeePassword = '" + password + "', "
                        + "isManager = '" + isManager + "'"
                        + " WHERE employeeId = '" + session.getAttribute("editid") + "';");
                    } else {
                        st.executeUpdate("UPDATE Employees SET "
                        + "firstName = '" + firstName + "', "
                        + "lastName = '" + lastName + "', "
                        + "ssn = '" + ssn + "', "
                        + "address = '" + address + "', "
                        + "city = '" + city + "', "
                        + "state = '" + state + "', "
                        + "zipcode = '" + zip + "', "
                        + "telephone = '" + phone + "', "
                        + "dateStarted = '" + start_date + "', "
                        + "hourlyRate = '" + hourlyRate + "', "
                        + "isManager = '" + isManager + "'"
                        + " WHERE employeeId = '" + session.getAttribute("editid") + "';");
                    }
                    
                    session.removeAttribute("editid");
                    %> Employee successfully updated! <%
                } catch (Exception e) {
                    %> <p> An error occurred updating the Employee. Make sure all entered values are valid.</p> <%
                }
                
            } 
                    
            } else {
                %><p>An error has occurred.</p><%
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
