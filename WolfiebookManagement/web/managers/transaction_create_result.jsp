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
            String buyer_id = request.getParameter("buyer_id");  
            String card_number = request.getParameter("account_number");
            String advertisement_id = request.getParameter("advertisement_id");
            String number_of_units = request.getParameter("number_of_units");
            String overseer_id = (String) session.getAttribute("employeeid");
            boolean valid_card = true;
            boolean valid_buyer_id = true;
            boolean valid_advertisement_id = true;
            boolean valid_quantity = true;
            int new_quantity = 0;
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
                "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            
            // get card number, if not provided
            if (card_number.equals("")) {
                rs = st.executeQuery("SELECT credit_card FROM Users WHERE user_id = '" + buyer_id + "';");
                if (rs.next())
                    if (rs.getString(1) != null)
                        card_number = rs.getString(1);
                    else
                        valid_card = false;
                else
                    valid_card = false;
            }
            
            // check valid IDs
            ResultSet rs2;
            rs2 = st.executeQuery("SELECT * FROM Users WHERE user_id = '" + buyer_id + "';");
            if (!rs2.next())
                valid_buyer_id = false;
            
            ResultSet rs3;
            rs3 = st.executeQuery("SELECT * FROM Advertisements WHERE advertisement_id = '" + advertisement_id + "';");
            if (!rs3.next())
                valid_advertisement_id = false;
            
            // check valid quantity
            if (valid_advertisement_id) {
                ResultSet rs4;
                rs4 = st.executeQuery("SELECT available_units FROM Advertisements WHERE advertisement_id = '" + advertisement_id + "';");
                if (rs4.next()) {
                    int quantity = Integer.parseInt(rs4.getString(1));
                    if (Integer.parseInt(number_of_units) > quantity || Integer.parseInt(number_of_units) < 0)
                        valid_quantity = false;
                    else
                        new_quantity = quantity - Integer.parseInt(number_of_units);
                } else {
                    valid_quantity = false;
                }
            }
            
            if (!valid_buyer_id) { %>
                <p>Transaction not recorded. A customer with the given ID does not exist.</p>
            <% } else if (!valid_advertisement_id) {
                 %><p>Transaction not recorded. An advertisement with the given ID does not exist.</p><%
                } else if (!valid_card) {
                 %><p>Transaction not recorded. The user does not have an associated bank account number, and none was provided.</p><%
                } else if (!valid_quantity) {
                 %><p>Transaction not recorded. The number of units provided exceeds the total quantity currently available.</p><%
                } else {
                try {
                    
                    st.executeUpdate("INSERT INTO Sales "
                        + "(buyer_id, card_number, date_sold, advertisement_id, number_of_units, "
                        + " overseer_id, charge_amount)"
                        + " VALUES ('" + buyer_id + "', "
                        + "'" + card_number + "', NOW(), "
                        + "'" + advertisement_id + "', "
                        + "'" + number_of_units + "', "
                        + "'" + overseer_id + "', "
                        + "(SELECT " + number_of_units + " * unit_price FROM Advertisements A WHERE advertisement_id = '" + advertisement_id + "'));");

                    st.executeUpdate("UPDATE Users SET purchase_rating = purchase_rating + " + number_of_units + " WHERE user_id = @buyer_id;");
                    st.executeUpdate("UPDATE Advertisements SET available_units = available_units - " + number_of_units + " WHERE advertisement_id = " + advertisement_id + ";");
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
