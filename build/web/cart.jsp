

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <%
            int qty=Integer.parseInt(request.getParameter("qt1"));
            String model=request.getParameter("model");
            int price=Integer.parseInt(request.getParameter("price"));
            int total=qty*price;
           
             try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/productsdb?characterEncoding=UTF-8","root","");
            
          
            PreparedStatement ps=c.prepareStatement("insert into cart(Model_Name,Quantity,selling_price,total,status,username) values(?,?,?,?,?,?)");
            
            ps.setString(1,model);
            ps.setString(2,""+qty);
            ps.setString(3, ""+price);
            ps.setString(4,""+ total);
            ps.setString(5,"NO");
            ps.setString(6,session.getAttribute("user_name").toString());
            int i=ps.executeUpdate();
            if(i>0){
                out.println("<script>alert('Product Added into Cart Successfully');window.location.assign('product_view.jsp');</script>");
            }
            else
            {
                out.println("<script>alert('Sorry, something happened wrong');window.location.assign('product_view.jsp');</script>");
        
            }
            
//            Statement s=c.createStatement();
//            ResultSet rs1=s.executeQuery("select cart_id from cart");
//            String cartid=rs1.getString(1);
//            session.setAttribute("cid",cartid);
            
             }catch(Exception e){out.println(e);}
        %>
    </body>
</html>
