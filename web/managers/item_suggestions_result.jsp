<%-- 
    Document   : item_suggestions_result
    Created on : Nov 20, 2016, 9:13:32 AM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../resources/css/manager.css" rel="stylesheet" type="text/css">
        <title>Find User Item Suggestions</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
            <jsp:include page="header.jsp"/>
            <h2>Personalized Item Suggestions</h2>
            <%
            String userid = request.getParameter("id");    
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT first_name, last_name FROM Users where user_id = '" + userid + "'");
            if (rs.next()) {
                String name = rs.getString("first_name") + " " + rs.getString("last_name");
                session.setAttribute("queriedname", name);%>
                </br><p>Personalized item suggestions for <%=session.getAttribute("queriedname")%>:</p></br>
                
                <%  ResultSet rs2;
                    rs2 = st.executeQuery("SELECT I.item_name, I.content FROM Advertisements I,"
                        + " (SELECT A.type FROM Advertisements A, Sales S WHERE S.buyer_id = '" + userid
                        + "' AND S.advertisement_id = A.advertisement_id) F WHERE I.type = F.type;");
                int counter = 0; %>
                <table>
                    <tr>
                    <th>Item Name</th>
                    <th>Description</th>
                    </tr>
                <% while (rs2.next()) { %>
                    <tr>
                    <td><%= rs2.getString(1) %></td>
                    <td><%= rs2.getString(2) %></td>
                    </tr>
                    
                    <% counter++;
                } %>
                </table>
                <% if (counter == 0) {
                    %> </br><p>No results found. User has not selected any preferences that have a corresponding advertisement.</p></br>
                <% }
                
            } else {
                %> <p> No results found. Please enter a valid user ID.</p> <%
            } %>

            
            <br />
            <br />
            <a href="item_suggestions.jsp">Start a new query</a>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
