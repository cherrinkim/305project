package org.apache.jsp.managers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class employee_005fcreate_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Create New Advertisement</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 if (session.getAttribute("ismanager") != null) { 
      out.write("\n");
      out.write("        ");
 if ((Boolean) session.getAttribute("ismanager")) { 
      out.write("\n");
      out.write("        <form method=\"post\" action=\"employee_create_result.jsp\">\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("        \n");
      out.write("        <h2>Create New Employee</h2>\n");
      out.write("        \n");
      out.write("        <p>Enter information below.</p>\n");
      out.write("        \n");
      out.write("        <p>First Name:</p>\n");
      out.write("        <input type=\"text\" name=\"first_name\" value=\"\" />\n");
      out.write("        <br />\n");
      out.write("        <p>Last Name: </p>\n");
      out.write("        <input type=\"text\" name=\"last_name\" value=\"\" />\n");
      out.write("        <br />\n");
      out.write("        <p>SSN: </p>\n");
      out.write("        <input type=\"text\" name=\"ssn\" value=\"\" />\n");
      out.write("        <br />\n");
      out.write("        <p>Address: </p>\n");
      out.write("        <input type=\"text\" name=\"address\" value=\"\" />\n");
      out.write("        <br />\n");
      out.write("        <p>City: </p>\n");
      out.write("        <input type=\"text\" name=\"city\" value=\"\" />\n");
      out.write("        <br />\n");
      out.write("        <p>State: </p>\n");
      out.write("        <input type=\"text\" name=\"state\" value=\"\" />\n");
      out.write("        <br />\n");
      out.write("        <p>Zip: </p>\n");
      out.write("        <input type=\"text\" name=\"zip\" value=\"\" />\n");
      out.write("        <br />\n");
      out.write("        <p>Phone: </p>\n");
      out.write("        <input type=\"text\" name=\"phone\" value=\"\" />\n");
      out.write("        <br />\n");
      out.write("        <p>Start Date: </p>\n");
      out.write("        <input type=\"date\" name=\"start_date\">\n");
      out.write("        <br />\n");
      out.write("        <p>Hourly Rate: </p>\n");
      out.write("        <input type=\"nu\" name=\"hourly_rate\" min=\"0\" step=\"any\" value=\"\" />\n");
      out.write("        <br />\n");
      out.write("        <p>Is Manager: </p>\n");
      out.write("        <input type=\"checkbox\" name=\"is_manager\" value=\"1\" />\n");
      out.write("        <br />\n");
      out.write("        <p> Password: </p>\n");
      out.write("        <input type=\"password\" name=\"password\" value=\"\" />\n");
      out.write("        <br /> <br />\n");
      out.write("        <input type=\"submit\" value=\"Submit\" />\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("        ");
 } else { 
      out.write("\n");
      out.write("            <div id=\"error\">You do not have permission to access this page.</div>\n");
      out.write("        ");
 }} else { 
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
