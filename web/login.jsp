<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.security.*"%>
<%@page import="javax.crypto.*"%>

<%
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");

    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/usersdb?characterEncoding=UTF-8", "root", "");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select userid,password from userinfo where userid='" + userid + "'");

    boolean found = false;

    try {
        while (rs.next()) {
            String storedPassword = rs.getString("password");
            if (storedPassword.equals(password)) {
                // Successful login
                found = true;
                session.setAttribute("user_name", userid);
                response.sendRedirect("index.jsp");
                break;
            }
        }

        if (!found) {
            // Incorrect username or password
            out.println("<script>alert('Incorrect username or password'); window.location.assign('login1.html');</script>");
        }

    } catch (Exception e) {
        out.println(e);
    }
%>
