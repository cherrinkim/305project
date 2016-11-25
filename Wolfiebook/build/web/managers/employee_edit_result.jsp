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
            String first_name = request.getParameter("first_name");  
            String last_name = request.getParameter("last_name");
            String ssn = request.getParameter("ssn");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            String phone = request.getParameter("phone");
            String start_date = request.getParameter("start_date");
            String hourly_rate = request.getParameter("hourly_rate");
            String is_manager = request.getParameter("is_manager");
            if (is_manager != null) {
                if (!is_manager.equals("1"))
                    is_manager = "0";
            } else {
                is_manager = "0";
            }
            String password = request.getParameter("password");
            
            if (hourly_rate.equals("") ||Double.parseDouble(hourly_rate) < 0) { %>
            <p>Employee not updated. Invalid hourly rate.</p>
            <% } else if (first_name.equals("") || last_name.equals("") || ssn.equals("") || address.equals("")
                          || city.equals("") || state.equals("") || zip.equals("") || phone.equals("") || start_date.equals("")
                          || hourly_rate.equals("") || is_manager.equals("")) { %>
            <p>Employee not updated. Values cannot be empty.</p>
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
                        st.executeUpdate("UPDATE Employees SET "
                        + "first_name = '" + first_name + "', "
                        + "last_name = '" + last_name + "', "
                        + "ssn = '" + ssn + "', "
                        + "address = '" + address + "', "
                        + "city = '" + city + "', "
                        + "state = '" + state + "', "
                        + "zipcode = '" + zip + "', "
                        + "telephone = '" + phone + "', "
                        + "date_started = '" + start_date + "', "
                        + "hourly_rate = '" + hourly_rate + "', "
                        + "employee_password = '" + password + "', "
                        + "is_manager = '" + is_manager + "'"
                        + " WHERE employee_id = '" + session.getAttribute("editid") + "';");
                    } else {
                        st.executeUpdate("UPDATE Employees SET "
                        + "first_name = '" + first_name + "', "
                        + "last_name = '" + last_name + "', "
                        + "ssn = '" + ssn + "', "
                        + "address = '" + address + "', "
                        + "city = '" + city + "', "
                        + "state = '" + state + "', "
                        + "zipcode = '" + zip + "', "
                        + "telephone = '" + phone + "', "
                        + "date_started = '" + start_date + "', "
                        + "hourly_rate = '" + hourly_rate + "', "
                        + "is_manager = '" + is_manager + "'"
                        + " WHERE employee_id = '" + session.getAttribute("editid") + "';");
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
