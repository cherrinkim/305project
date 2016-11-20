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
            "root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("SELECT * FROM Employees where employee_id ='" + userid + "' AND employee_password ='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("employeeid", userid);
        session.removeAttribute("invalidlogin");
        Statement checkStatus = con.createStatement();
        ResultSet status;
        status = checkStatus.executeQuery("SELECT * FROM Employees where employee_id = '" + userid + "' AND is_manager = 1");
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
