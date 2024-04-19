<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String contact=request.getParameter("contact");
            String feedback=request.getParameter("feedback");
            
            
            try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbacksdb?characterEncoding=UTF-8", "root", "");
         Statement st = conn.createStatement();
         int i = st.executeUpdate("insert into feedback(name,email,contact,feedback)values('"+ name + "','" +  email + "','" + contact + "','" + feedback + "')");
         out.println("<script>alert('Thank you.');window.location.assign('index.jsp');</script>"); 
            }
        catch(Exception e)
        {out.println(e);}
        
        %>
    </body>
</html>
