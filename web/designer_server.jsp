<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Designer's Server</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
            String cn=request.getParameter("dn");
            String mn=request.getParameter("pn");
            String ct=request.getParameter("ye");
            String cp=request.getParameter("np");
          
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/designersdb?characterEncoding=UTF-8","root","");
            PreparedStatement ps=c.prepareStatement("insert into designers(name,p_number,y_experience,n_projects) values(?,?,?,?)");
            ps.setString(1, cn);
            ps.setString(2, mn);
            ps.setString(3, ct);
            ps.setString(4, cp);
            ps.executeUpdate();
            out.println("<script>alert('Data Saved.');window.location.assign('designer_data.html');</script>");
            }catch(Exception e){out.println(e);}

        %>
    </body>
</html>
