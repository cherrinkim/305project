<%-- 
    Document   : mailinglist
    Created on : Nov 19, 2016, 11:34:11 AM
    Author     : bryan
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://xmlns.jcp.org/jsf/html">
<h:head>
        <title>Mailing List</title>
        <h:outputStylesheet name="css/jsfcrud.css"/>
</h:head>
<h:body>
    
    <b>Customer Mailing List:</b>
    <br />
    <br />
 
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/wolfiebook?zeroDateTimeBehavior=convertToNull"
     user="root"  password=""/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT first_name, last_name, email FROM Users;
</sql:query>
 
<table border="1" width="100%">
<tr>
   <th>First Name</th>
   <th>Last Name</th>
   <th>Email Address</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.first_name}"/></td>
   <td><c:out value="${row.last_name}"/></td>
   <td><c:out value="${row.email}"/></td>
</tr>
</c:forEach>
</table>

<br />
<a href="representative_index.xhtml">Return to Customer Representative Menu</a>
<br />
 
</h:body>
</html>
