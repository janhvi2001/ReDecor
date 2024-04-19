
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
         try{
            String id=request.getParameter("cid");
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/productsdb?characterEncoding=UTF-8","root","");
            Statement st=c.createStatement();
            int r=st.executeUpdate("delete from cart where cart_id="+id);
            if(r>0)
            {
                out.println("<script>alert('Item removed from cart!');window.location.assign('view_cart.jsp');</script>");
            }
         }catch(Exception e)
         {
             out.println(e); 
         }
        %>
    </body>
</html>