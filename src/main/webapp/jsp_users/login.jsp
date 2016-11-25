<%@page import="java.security.MessageDigest"%>
<%@ page import ="java.sql.*" %>
<%
    String email = request.getParameter("user-email");    
    String pwd = request.getParameter("user-psw");
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    md.update(pwd.getBytes("UTF-8"));
    byte [] digest = md.digest();
    pwd = String.format("%064x", new java.math.BigInteger(1, digest));
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT first_name, last_name FROM Users where email ='" + email + "' AND user_password ='" + pwd + "'");
    if (rs.next()) {
        String name = rs.getString("first_name") + " " + rs.getString("last_name");
        session.setAttribute("userName", name);
        session.removeAttribute("invalidlogin");
        Statement checkStatus = con.createStatement();
        response.sendRedirect("../index.xhtml");
    } else {
        session.setAttribute("invalidlogin", true);
        response.sendRedirect("../index.html");
    }
%>
