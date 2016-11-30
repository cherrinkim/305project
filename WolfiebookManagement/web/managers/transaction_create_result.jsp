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
        <title>Record a Transaction</title>
    </head>
    <body>
        <% if (session.getAttribute("ismanager") != null) { %>
            <jsp:include page="header.jsp"/>
            <h2>Record a Transaction</h2>
            <%
            String buyerId = request.getParameter("buyerId");  
            String cardNumber = request.getParameter("account_number");
            String advertisementId = request.getParameter("advertisementId");
            String numberOfUnits = request.getParameter("numberOfUnits");
            String overseerId = (String) session.getAttribute("employeeid");
            boolean valid_card = true;
            boolean valid_buyerId = true;
            boolean valid_advertisementId = true;
            boolean valid_quantity = true;
            int new_quantity = 0;
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
                "root", "!Q@W3e4r");
            Statement st = con.createStatement();
            ResultSet rs;
            
            // get card number, if not provided
            if (cardNumber.equals("")) {
                rs = st.executeQuery("SELECT creditCard FROM Users WHERE userId = '" + buyerId + "';");
                if (rs.next())
                    if (rs.getString(1) != null)
                        cardNumber = rs.getString(1);
                    else
                        valid_card = false;
                else
                    valid_card = false;
            }
            
            // check valid IDs
            ResultSet rs2;
            rs2 = st.executeQuery("SELECT * FROM Users WHERE userId = '" + buyerId + "';");
            if (!rs2.next())
                valid_buyerId = false;
            
            ResultSet rs3;
            rs3 = st.executeQuery("SELECT * FROM Advertisements WHERE advertisementId = '" + advertisementId + "';");
            if (!rs3.next())
                valid_advertisementId = false;
            
            // check valid quantity
            if (valid_advertisementId) {
                ResultSet rs4;
                rs4 = st.executeQuery("SELECT availableUnits FROM Advertisements WHERE advertisementId = '" + advertisementId + "';");
                if (rs4.next()) {
                    int quantity = Integer.parseInt(rs4.getString(1));
                    if (Integer.parseInt(numberOfUnits) > quantity || Integer.parseInt(numberOfUnits) < 0)
                        valid_quantity = false;
                    else
                        new_quantity = quantity - Integer.parseInt(numberOfUnits);
                } else {
                    valid_quantity = false;
                }
            }
            
            if (!valid_buyerId) { %>
                <p>Transaction not recorded. A customer with the given ID does not exist.</p>
            <% } else if (!valid_advertisementId) {
                 %><p>Transaction not recorded. An advertisement with the given ID does not exist.</p><%
                } else if (!valid_card) {
                 %><p>Transaction not recorded. The user does not have an associated bank account number, and none was provided.</p><%
                } else if (!valid_quantity) {
                 %><p>Transaction not recorded. The number of units provided exceeds the total quantity currently available.</p><%
                } else {
                try {
                    
                    st.executeUpdate("INSERT INTO Sales "
                        + "(buyerId, cardNumber, dateSold, advertisementId, numberOfUnits, "
                        + " overseerId, chargeAmount)"
                        + " VALUES ('" + buyerId + "', "
                        + "'" + cardNumber + "', NOW(), "
                        + "'" + advertisementId + "', "
                        + "'" + numberOfUnits + "', "
                        + "'" + overseerId + "', "
                        + "(SELECT " + numberOfUnits + " * unitPrice FROM Advertisements A WHERE advertisementId = '" + advertisementId + "'));");

                    st.executeUpdate("UPDATE Users SET purchaseRating = purchaseRating + " + numberOfUnits + " WHERE userId = @buyerId;");
                    st.executeUpdate("UPDATE Advertisements SET availableUnits = availableUnits - " + numberOfUnits + " WHERE advertisementId = " + advertisementId + ";");
                    %> Transaction successfully recorded! <%
                } catch (Exception e) {
                    %> <p> An error occurred recording the transaction. Make sure all entered values are valid.</p> <%
                }
                
            } %>
            
            
            <br />
            <br />
            <a href="transaction_create.jsp">Start a new query</a>
            <br /><a href="transactions.jsp">View All Transactions</a>
        
        <% } else { %>
            <div id="error">Please <a href="representative_login.jsp">login</a> to access this page.</div>
        <% }; %>
    </body>
</html>
