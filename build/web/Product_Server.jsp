
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String cn=request.getParameter("cn");
            String mn=request.getParameter("mn");
            String ct=request.getParameter("ct");
            String cp=request.getParameter("cp");
            String sp=request.getParameter("sp");
            String mi=request.getParameter("bd");
            String ds=request.getParameter("ds");
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/productsdb?characterEncoding=UTF-8","root","");
            PreparedStatement ps=c.prepareStatement("insert into stocks(Company_Name,Model_Name,Category,Cost_Price,Product_img,Description) values(?,?,?,?,?,?)");
            ps.setString(1, cn);
            ps.setString(2, mn);
            ps.setString(3, ct);
            ps.setString(4, cp);
         
            ps.setString(5, mi);
            ps.setString(6, ds);
            ps.executeUpdate();
            out.println("<script>alert('Data Saved.');window.location.assign('Product.html');</script>");
            }catch(Exception e){out.println(e);}

        %>
    </body>
</html>
