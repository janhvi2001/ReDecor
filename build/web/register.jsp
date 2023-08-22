<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid = request.getParameter("userid");
String email = request.getParameter("e1");
String password = request.getParameter("password");
String confpass=request.getParameter("p2");
try {
    if(password!=null && confpass!=null )
    {
        if(!password.equals(confpass))
        {
          out.println("<script>alert('Please confirm your password again.');window.location.assign('login.html');</script>");  
        }
        else
        {
            out.println("<script>alert('Thank you for registering.'); window.location.assign('login.html');</script>");
        }
    }
    
    
    
 Class.forName("org.mariadb.jdbc.Driver");
 Connection c = DriverManager.getConnection("jdbc:mariadb://localhost:3306/userinfo", "root", "");
 Statement st = c.createStatement();
 int i = st.executeUpdate("insert into users(userid,email,password)values('"+ userid + "','" +  email + "','" + password + "')");
  
 
out.println("Thank you for register ! Please <a href='login.html'>Login</a> to continue.");
} catch (Exception e) {
 out.print(e);
 //e.printStackTrace();
}
%>