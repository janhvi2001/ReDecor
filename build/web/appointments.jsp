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
            String schedule=request.getParameter("schedule");
             String timeslot=request.getParameter("timeslot");
             String date=request.getParameter("Date");
             String contact=request.getParameter("phone");
             String description=request.getParameter("description");
             
            
            
            
          try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointmentsdb?characterEncoding=UTF-8", "root", "");
         Statement st = conn.createStatement();
         int i = st.executeUpdate("insert into appointment(name,email,schedule,timeslot,date,contact,description) values('"+ name + "','" +  email + "','" + schedule + "','" + timeslot + "','" + date + "','" + contact + "','" + description+ "')");
         
         out.println("<script>alert('Thank you, Appointment Booked.');window.location.assign('index.jsp');</script>"); 
            
          
          
          }
        catch(Exception e)
        {out.println(e);}
        
        %>
    </body>
</html>
