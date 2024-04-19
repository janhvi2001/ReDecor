

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
                
             int oid=Integer.parseInt(request.getParameter("oid"));   
        //String oid = session.getAttribute("oid").toString();
        //int o=Integer.parseInt(oid);
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/productsdb?characterEncoding=UTF-8", "root", "");
         //Statement st=conn.createStatement();
         //ResultSet r=st.executeQuery("select order_id from orders where status='NOT DISPATCHED YET'");
         
         //if(r.next());
        // {
          
          //int orderid=r.getInt(1);
            PreparedStatement ps1=conn.prepareStatement("update orders set status=? where status=? and order_id=?");
            ps1.setString(1,"DISPATCHED");
            ps1.setString(2,"NOT DISPATCHED YET");
            ps1.setInt(3,oid);
            ps1.executeUpdate();
            //out.println(orderid);
           out.println("<script>alert('Order Dispatched Successfully.');window.location.assign('pending_orders.jsp');</script>");
            }
            catch(Exception e){out.println(e);}
        %>
    </body>
</html>
