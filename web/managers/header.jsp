<%-- 
    Document   : header
    Created on : Nov 19, 2016, 9:50:49 PM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- navbar -->
        <div id="header_ul"><ul>
            <div id="header_li"><li>Logged in as <%=session.getAttribute("employeename")%></li></div>
            <div id="header_li"><li><div id="header_li_a"><a href="representative_home.jsp">Action Menu</a></div></li></div>
            <div id="header_li"><li><div id="header_li_a"><a href="logout.jsp">Logout</a></div></li></div>
        </ul></div>
</html>
