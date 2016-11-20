<%-- 
    Document   : header
    Created on : Nov 19, 2016, 9:50:49 PM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- navbar -->
        <ul>
            <li>Logged in as <%=session.getAttribute("employeename")%></li>
            <li><a href="representative_home.jsp">Action Menu</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
</html>
