<%-- 
    Document   : representative_login
    Created on : Nov 19, 2016, 6:31:34 PM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/manager.css" rel="stylesheet" type="text/css">
        <title>Customer Representative & Manager Login</title>
    </head>
    <body>
        <form method="post" action="login.jsp">
        <div id="login">
            <table>
                <thead>
                    <tr>
                        <h1>Customer Representative & Manager Login</h1>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Employee ID:</td>
                        <td><input type="text" name="id" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                    </tr>
                </tbody>
            </table>
            
            <center><input type="submit" value="Login" /></center>
            <br>
            <% if (session.getAttribute("invalidlogin") != null) { %>
                <div id="error">Invalid ID or password.</div>
            <% };%>
            
        </div>
        </form>
    </body>
</html>