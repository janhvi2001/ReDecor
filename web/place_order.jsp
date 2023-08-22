

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Place Order</title>
    </head>
    <body>
        <%
            
            
//            out.println("<script>alert('OK');</script>");
            String username=session.getAttribute("user_name").toString();
            String email=request.getParameter("email");
            String name=request.getParameter("rec_name");
            String address=request.getParameter("rec_add");
            String mob=request.getParameter("mob_no");
            String modname=session.getAttribute("mdname").toString();
            String t=session.getAttribute("tot").toString();
            int tot=Integer.parseInt(t);
            String qt=session.getAttribute("qty").toString();
            int qty=Integer.parseInt(qt);
            int orderid=1;
            try{
            
             
                
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost/products","root","");
            Statement st=c.createStatement();
            ResultSet rs=st.executeQuery("select order_id from orders order by order_id");
            if(rs.last())
            {
                orderid=Integer.parseInt(rs.getString(1))+1;
                
            }
            
            PreparedStatement ps=c.prepareStatement("insert into orders values(?,?,?,?,?,?,?,?,?,?,?)");
            ps.setInt(1, orderid);
            ps.setString(2,email);
            ps.setString(3, name);
            ps.setString(4, address);
            ps.setString(5, mob);
            ps.setString(6, username);
            ps.setString(7,""+new java.util.Date());
            ps.setString(8,"NOT DISPATCHED YET");
            ps.setString(9,modname);
            ps.setInt(10,qty);
            ps.setInt(11,tot);
            ps.executeUpdate();
            
            PreparedStatement ps1=c.prepareStatement("update cart set status=? where status=? and username=?");
            ps1.setString(1,""+ orderid);
            session.setAttribute("oid",orderid);
            ps1.setString(2, "NO");
            ps1.setString(3, username);
            ps1.executeUpdate();
            
           out.println("<script>alert('Order Placed Successfully !!.');window.location.assign('order.jsp');</script>");
         //out.println("<script>alert('Order Placed Successfully.');</script>");
            }catch(Exception e){out.println("<br><br><br><br>"+e);}
            
            
           
        %>
       
    </body>
</html>

