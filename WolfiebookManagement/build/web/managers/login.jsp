<%@page import="java.security.MessageDigest"%>
<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("id");    
    String pwd = request.getParameter("pass");
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    md.update(pwd.getBytes("UTF-8"));
    byte [] digest = md.digest();
    pwd = String.format("%064x", new java.math.BigInteger(1, digest));
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "!Q@W3e4r");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT firstName, lastName FROM Employees where employeeId ='" + userid + "' AND employeePassword ='" + pwd + "'");
    if (rs.next()) {
        String name = rs.getString("firstName") + " " + rs.getString("lastName");
        session.setAttribute("employeename", name);
        session.setAttribute("employeeid", userid);
        session.removeAttribute("invalidlogin");
        Statement checkStatus = con.createStatement();
        ResultSet status;
        status = checkStatus.executeQuery("SELECT * FROM Employees where employeeId = '" + userid + "' AND isManager = 1");
        if (status.next())
            session.setAttribute("ismanager", true);
        else
            session.setAttribute("ismanager", false);
        
        response.sendRedirect("representative_home.jsp");
    } else {
        session.setAttribute("invalidlogin", true);
        response.sendRedirect("representative_login.jsp");
    }
%>
