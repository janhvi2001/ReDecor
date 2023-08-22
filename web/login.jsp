<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid = request.getParameter("userid");
String password = request.getParameter("password");

if(userid.equals("ADMIN123") && password.equals("ADMIN123"))
    {
    response.sendRedirect("AdHome.html");
    }

//Class.forName("org.mariadb.jdbc.Driver");
//java.sql.Connection con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/userinfo", "root", "");
//Statement st = con.createStatement();
//ResultSet rs = st.executeQuery("select userid,password from users");
//try {
//while(rs.next())
//{
// if (rs.getString("password").equals(password) && rs.getString("userid").equals(userid)) {
////ut.println("Welcome ");
//session.setAttribute("user_name",userid);
// response.sendRedirect("index.jsp");
// } else {
//  out.println("Invalid password or username.");
// }}
//}catch (Exception e) {
 //e.printStackTrace();
}
%>
