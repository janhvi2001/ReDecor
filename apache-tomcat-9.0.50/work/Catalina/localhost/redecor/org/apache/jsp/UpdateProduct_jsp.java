/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.50
 * Generated at: 2022-02-14 11:43:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class UpdateProduct_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Update Products</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/vendor.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/styles.css\">\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("            <style>\n");
      out.write("body {\n");
      out.write("    height: 1350px;\n");
      out.write("    background:url(feed-bg.jfif) no-repeat;\n");
      out.write("    background-size: 2000px 1350px;\n");
      out.write("    opacity:20;\n");
      out.write("    filter:alpha(opacity=10);\n");
      out.write("     }\n");
      out.write("     \n");
      out.write("table {\n");
      out.write("    top: 150px;\n");
      out.write("    left:50px;\n");
      out.write("    position:absolute;\n");
      out.write("    width:50px; \n");
      out.write("    border:2px solid black;\n");
      out.write("      }\n");
      out.write("      \n");
      out.write("td,tr,th {\n");
      out.write("    border: 2px solid black;    \n");
      out.write("      }\n");
      out.write("      \n");
      out.write("      .img {\n");
      out.write("          border: 2px solid black;\n");
      out.write("      }\n");
      out.write("\n");
      out.write("\n");
      out.write("</style>\n");
      out.write("  \n");
      out.write("            <script>\n");
      out.write("            var openFile=function openFile(file)\n");
      out.write("            {\n");
      out.write("                var input=file.target;\n");
      out.write("                var reader=new FileReader();\n");
      out.write("                reader.onload=function(){\n");
      out.write("                    var dataURL=reader.result;\n");
      out.write("                    var output=document.getElementById('si1');\n");
      out.write("                    output.src=dataURL;\n");
      out.write("                    document.getElementById(\"bd1\").value=dataURL;\n");
      out.write("                };\n");
      out.write("                reader.readAsDataURL(input.files[0]);\n");
      out.write("            };\n");
      out.write("        </script>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body class=\"top\">\n");
      out.write("        \n");
      out.write("        <div id=\"preloader\">\n");
      out.write("        <div id=\"loader\">\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- page wrap\n");
      out.write("    ================================================== -->\n");
      out.write("    <div id=\"page\" class=\"s-pagewrap\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- # site header \n");
      out.write("        ================================================== -->\n");
      out.write("        <header class=\"s-header\">\n");
      out.write("\n");
      out.write("            <div class=\"s-header__logo\">\n");
      out.write("                <a class=\"logo\" href=\"AdHome.html\">\n");
      out.write("                    <img src=\"images/logo.svg\" alt=\"Homepage\">\n");
      out.write("                </a>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <a class=\"s-header__menu-toggle\" href=\"#0\">\n");
      out.write("                <span class=\"s-header__menu-text\">Menu</span>\n");
      out.write("                <span class=\"s-header__menu-icon\"></span>\n");
      out.write("            </a>\n");
      out.write("\n");
      out.write("            <nav class=\"s-header__nav\">\n");
      out.write("\n");
      out.write("                <a href=\"#0\" class=\"s-header__nav-close-btn\" title=\"close\"><span>Close</span></a>\n");
      out.write("                <h3>Redecor.</h3>\n");
      out.write("\n");
      out.write("                <ul class=\"s-header__nav-list\">\n");
      out.write("                    <li><a href=\"Usersdb.jsp\">Users Database</a></li>\n");
      out.write("                    <li><a href=\"admin_feedback.jsp\" >Feedback</a></li>\n");
      out.write("                    <li><a href=\"view_appointments.jsp\">Appointment</a></li>\n");
      out.write("                    <li><a href=\"Product.html\">Add Products</a></li>\n");
      out.write("                    <li><a href=\"adminproduct_view.jsp\">View Products</a></li>\n");
      out.write("                    <li><a href=\"designer_data.html\">Designer's Form</a></li>\n");
      out.write("                    <li><a href=\"designers_view.jsp\">Designer's Database</a></li>\n");
      out.write("                    <li><a href=\"logout.jsp\">Logout</a></li>\n");
      out.write("                </ul>\n");
      out.write("                </ul>\n");
      out.write("\n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("        </header>\n");
      out.write("   \n");
      out.write("        <form action=\"Update.jsp\" method=\"POST\">\n");
      out.write("            <table border=1  cellspacing=20 cellpadding=20>\n");
      out.write("                <tr>\n");
      out.write("            <td>Company Name:</td><td><input type=\"text\" name=\"cn\"></td></tr><br>\n");
      out.write("            <tr><td>Model Name:</td><td><input type=\"text\" name=\"mn\"></td></tr><br>\n");
      out.write("            <tr><td>Category:</td><td><input type=\"text\" name=\"ct\"></td></tr><br>\n");
      out.write("           <tr><td>Cost Price</td><td><input type=\"number\" name=\"cp\"></td></tr><br>\n");
      out.write("           <tr><td>Selling Price</td><td><input type=\"number\" name=\"sp\"></td></tr><br>\n");
      out.write("           <tr> <td>Image:</td><td> <input type=\"file\" name=\"mi\" id=\"mi1\" onchange=\"openFile(event)\"></td></tr><br>\n");
      out.write("            <img name=\"si\" id=\"si1\" width=\"400\" height=\"400\" style=\"position: absolute; right: 10px;top:170px\"><br>\n");
      out.write("           <tr><td> Description:</td><td> <textarea rows=\"10\" cols=\"20\" name=\"ds\"></textarea></td><br>\n");
      out.write("            <input type=\"hidden\"  name=\"bd\" id=\"bd1\"><br>\n");
      out.write("<!--            //<input type=\"hidden\" name=\"prodid\" value=+p>-->\n");
      out.write("          ");
  String pid=request.getParameter("pid");
                 session.setAttribute("pid",pid); 
      out.write("\n");
      out.write("            <tr><td colspan='2' align='center'><input type=\"submit\" name=\"UPDATE\" ></td></tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("            <script src=\"js/plugins.js\"></script>\n");
      out.write("            <script src=\"js/main.js\"></script>\n");
      out.write("            \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
