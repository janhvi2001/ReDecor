

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String qty=request.getParameter("q");
            String total=request.getParameter("t");
            String cart=request.getParameter("cart");
            //out.println("quantity :"+qty+" and total="+total+" cartid="+cart+"");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection c=DriverManager.getConnection("jdbc:mysql://localhost/productsdb?characterEncoding=UTF-8","root","");
                PreparedStatement ps=c.prepareStatement("Update cart set Quantity=?, total=? where cart_id=?");
                ps.setString(1,qty);
                ps.setString(2, total);
                ps.setString(3,cart);
                ps.executeUpdate();
            }catch(Exception e){out.println(e);}
        %>
    </body>
</html>
