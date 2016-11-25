package org.apache.jsp.managers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class best_005frepresentative_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>View Which Representative Generated the Most Revenue</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 if (session.getAttribute("ismanager") != null) { 
      out.write("\n");
      out.write("        ");
 if ((Boolean) session.getAttribute("ismanager")) { 
      out.write("\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("            <h2>View Which Representative Generated the Most Revenue</h2>\n");
      out.write("            ");

            String id = "dummy";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Wolfiebook",
            "root", "");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT S.overseer_id, SUM(S.charge_amount) as 'revenue' "
                    + "FROM Sales S "
                    + "GROUP BY overseer_id "
                    + "ORDER BY revenue DESC LIMIT 1;");
            String revenue = "$";
            if (rs.next()) {
                id = rs.getString(1);
                revenue += rs.getString(2);
                rs = st.executeQuery("SELECT first_name, last_name "
                    + "FROM Employees "
                    + "WHERE employee_id = '" + id + "';");
                String final_name = "dummy";
                if (rs.next()) {
                    final_name = rs.getString(1) + " " + rs.getString(2);
                }
                session.setAttribute("queriedid", id);
                session.setAttribute("revenue", revenue);
                session.setAttribute("queriedname", final_name);
      out.write("\n");
      out.write("                </br><h2>Employee #");
      out.print(session.getAttribute("queriedid"));
      out.write(' ');
      out.write('(');
      out.print(session.getAttribute("queriedname"));
      out.write(") has generated the most revenue.</h2>\n");
      out.write("                <p>They have generated ");
      out.print(session.getAttribute("revenue"));
      out.write(" to date.</p></br>\n");
      out.write("                \n");
      out.write("                ");
  
                    rs = st.executeQuery("SELECT S.transaction_id, S.buyer_id, S.card_number, S.date_sold, "
                    + "S.advertisement_id, S.number_of_units, S.overseer_id, S.charge_amount "
                    + "FROM Sales S "
                    + "WHERE S.overseer_id = '" + id + "';");
                    
      out.write("\n");
      out.write("                <table>\n");
      out.write("                    <tr>\n");
      out.write("                    <th>Transaction ID</th>\n");
      out.write("                    <th>Buyer ID</th>\n");
      out.write("                    <th>Card Number</th>\n");
      out.write("                    <th>Date Sold</th>\n");
      out.write("                    <th>Ad ID</th>\n");
      out.write("                    <th>Units</th>\n");
      out.write("                    <th>Overseer ID</th>\n");
      out.write("                    <th>Revenue</th>\n");
      out.write("                    </tr>\n");
      out.write("                    ");
 while (rs.next()) { 
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                    <td>");
      out.print( rs.getString(1) );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString(2) );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString(3) );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString(4) );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString(5) );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString(6) );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString(7) );
      out.write("</td>\n");
      out.write("                    <td>$");
      out.print( rs.getString(8) );
      out.write("</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("                </table>\n");
      out.write("                \n");
      out.write("            ");
 } else {
                
      out.write(" <p> No users have made transactions yet.</p> ");

            } 
      out.write("\n");
      out.write("\n");
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