
<%--<%@page import="java.sql.*"%>--%>
<%--<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Products</title>
    </head>
    <body>
        <%
            String p=(String)session.getAttribute("pid");
            //int p=Integer.parseInt(request.getParameter("pid"));
            int pid=Integer.parseInt(p);
            
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
            PreparedStatement ps=c.prepareStatement("update stocks set Company_Name=?,Model_Name=?,Category=?,Cost_Price=?,Selling_Price=?,Product_img=?,Description=? where prod_id=?");

            ps.setString(1, cn);
            ps.setString(2, mn); 
            ps.setString(3, ct);
            ps.setString(4, cp);
            ps.setString(5, sp);
            ps.setString(6, mi);
            ps.setString(7, ds);
            ps.setInt(8, pid);
            
            int i=ps.executeUpdate();
            if(i > 0)
{
out.print("<script>alert('Data Updated.');window.location.assign('UpdateProduct.jsp');</script>");
}
else
{
out.print("<script>alert('There is something wrong.');window.location.assign('UpdateProduct.jsp');</script>");
}
            //out.println("<script>alert('Data Updated.');window.location.assign('UpdateProduct.html');</script>");
            }catch(Exception e){out.println(e);}

        %>
    </body>
</html>
