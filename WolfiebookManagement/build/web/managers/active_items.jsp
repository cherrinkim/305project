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
        <title>View Most Active Items</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
        <% if ((Boolean) session.getAttribute("ismanager")) { %>
            <jsp:include page="header.jsp"/>
            <h2>View Most Active Items</h2>
            <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            %>
                </br>
                <p>Ranking of most active items, by number of associated transactions:</p></br>
                
                <%  
                    rs = st.executeQuery("SELECT A.itemName, COUNT(A.itemName) as number_of_transactions "
                            + "FROM Sales S, Advertisements A "
                            + "WHERE A.advertisementId = S.advertisementId "
                            + "GROUP BY itemName "
                            + "ORDER BY number_of_transactions DESC, itemName DESC;");

                    %>
                <table>
                    <tr>
                    <th>Item Name</th>
                    <th>Number of Transactions</th>
                    </tr>
                    <% while (rs.next()) { %>
                    <tr>
                    <td><%= rs.getString(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    </tr>
                    
                <% } %>
                </table>

        <% } else { %>
            <div id="error">You do not have permission to access this page.</div>
        <% }} else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
