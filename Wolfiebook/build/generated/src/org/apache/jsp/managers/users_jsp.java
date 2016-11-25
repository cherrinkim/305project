package org.apache.jsp.managers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class users_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link href=\"../resources/css/manager.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <title>Create, Edit, and View User Information</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 if (session.getAttribute("ismanager") != null) { 
      out.write("\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("        \n");
      out.write("        <h2>Users</h2>\n");
      out.write("        \n");
      out.write("        <table>\n");
      out.write("            <tr>\n");
      out.write("            <th>User ID</th>\n");
      out.write("            <th>First Name</th>\n");
      out.write("            <th>Last Name</th>\n");
      out.write("            <th>Address</th>\n");
      out.write("            <th>City</th>\n");
      out.write("            <th>State</th>\n");
      out.write("            <th>Zipcode</th>\n");
      out.write("            <th>Phone</th>\n");
      out.write("            <th>Email Address</th>\n");
      out.write("            <th>Date Created</th>\n");
      out.write("            <th>Bank Account Number</th>\n");
      out.write("            <th>Purchase Rating</th>\n");
      out.write("            <th>Tools</th>\n");
      out.write("            </tr>\n");
      out.write("        \n");
      out.write("        ");

            
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        rs = st.executeQuery("SELECT * FROM Users");
        
        while (rs.next()) { 
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
      out.print( rs.getString(1) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString(3) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString(4) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString(5) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString(6) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString(7) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString(8) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString(9) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString(10) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString(11) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString(12) );
      out.write("</td>\n");
      out.write("                <td>");
      out.print( rs.getString(13) );
      out.write("</td>\n");
      out.write("                <td><center><form method=\"post\" action=\"user_edit.jsp\"><button name=\"editid\" type=\"submit\" value=");
      out.print( rs.getString(1));
      out.write(">Edit</button></form><br /></form></center></td>\n");
      out.write("            </tr>\n");
      out.write("        ");
 }; 
      out.write("\n");
      out.write("        </table>\n");
      out.write("        \n");
      out.write("        </br><form method=\"post\" action=\"user_create.jsp\"><button a href=\"user_create.jsp\">Create New User</button></form>\n");
      out.write("        \n");
      out.write("        ");
 } else { 
      out.write("\n");
      out.write("            <div id=\"error\">Please <a href=\"representative_login.jsp\">login</a> to access this page.</div>\n");
      out.write("        ");
 }; 
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
