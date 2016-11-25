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
            <li> <h1>Wolfiebook Management</h1><p>Logged in as <%=session.getAttribute("employeename")%></p></li>
            <li><a href="representative_home.jsp">Home</a></li>
            <li class="dropdown">
                <div class="dropbtn">Customer Representative Actions</div>
                <div class="dropdown-content">
                <a href="advertisements.jsp">Create, Edit, and View Advertisements</a>
                <a href="transactions.jsp">Record and View Transactions</a>
                <a href="users.jsp">Create, Edit, and View User Information</a>
                <a href="mailing_list.jsp">Produce Customer Mailing List</a>
                <a href="item_suggestions.jsp">Get Personalized Item Suggestions for a User</a>
                <a href="user_groups.jsp">Get Current Groups for a User</a>
                <a href="account_history.jsp">Get Account History for an Account</a>
                <a href="best_sellers.jsp">Get Best-Seller Item List</a>
                </div>
            </li>
            <li class="dropdown">
                <div class="dropbtn">Manager Actions</div>
                <div class="dropdown-content">
                <a href="employees.jsp">Create, Edit, and View Employee Information</a>
                <a href="sales_report.jsp">Obtain a Sales Report for a Particular Month</a>
                <a href="advertisements.jsp">Create, Edit, and View Advertisements</a>
                <a href="trans_list_item.jsp">View All Transactions by Item Name</a>
                <a href="trans_list_user.jsp">View All Transactions by User Name</a>
                <a href="revenue_item.jsp">View All Revenue Generated by Item</a>
                <a href="revenue_type.jsp">View All Revenue Generated by Item Type</a>
                <a href="revenue_customer.jsp">View All Revenue Generated by Customer</a>
                <a href="best_representative.jsp">View Which Representative Generated the Most Revenue</a>
                <a href="best_customer.jsp">View Which Customer Generated the Most Revenue</a>
                <a href="active_items.jsp">View Most Active Items</a>
                <a href="buyer_list.jsp">View All Customers Who Have Purchased an Item</a>
                <a href="company_item_list.jsp">View All Items for a Company</a>
                </div>
            </li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul></div>
</html>