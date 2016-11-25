

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/user.css" rel="stylesheet" type="text/css">
        <title>Register</title>
    </head>
    <body>

        <form id="registerForm" method="post" action="registerUser.jsp">
        <jsp:include page="header.jsp"/>
        <h2 id="register">Register</h2>
        
        <div id="registerBox1">
        <p>Email Address: </p>
        <input type="email" name="email" value="" />
        <p>Password: </p>
        <input type="password" name="password" value="" />
            
        <p>First Name:</p>
        <input type="text" name="first_name" value="" />
        <br />
        <p>Last Name: </p>
        <input type="text" name="last_name" value="" />
        <br />
        </div>
        
        <div id="registerBox2">
        
        <p>Address: </p>
        <input type="text" name="address" value="" />
        <br />
        <p>City: </p>
        <input type="text" name="city" value="" />
        <br />
        <p>State: </p>
        <input type="text" name="state" value="" />
        <br />
        <p>Zip: </p>
        <input type="text" name="zip" value="" />
        <br />
        <p>Phone: </p>
        <input type="text" name="phone" value="" />
        <br />
        <p>Bank Account Number (optional): </p>
        <input type="number" name="account_number" min="0" value="" />
        </div>

        <br /> <br />
        <input id="submitButton" type="submit" value="Submit" action="registerUser.jsp"/>
        </form>
    </body>
</html>
