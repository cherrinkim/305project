package org.apache.jsp.managers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.security.MessageDigest;
import java.sql.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");

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
    rs = st.executeQuery("SELECT first_name, last_name FROM Employees where employee_id ='" + userid + "' AND employee_password ='" + pwd + "'");
    if (rs.next()) {
        String name = rs.getString("first_name") + " " + rs.getString("last_name");
        session.setAttribute("employeename", name);
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

      out.write('\r');
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
