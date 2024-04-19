<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<body>
        <%
             try{
            String p=request.getParameter("pid");
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/productsdb?characterEncoding=UTF-8", "root", "");
            Statement st=c.createStatement();
             st.executeUpdate("delete from stocks where prod_id="+p);   
              out.println("<script>alert('Item removed');window.location.assign('adminproduct_view.jsp');</script>");
                             
             }
             catch(Exception e){
             out.println(e);
             }
        %>
    </body></html>
