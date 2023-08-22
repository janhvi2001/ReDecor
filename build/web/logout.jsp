<%-- 
    Document   : logout
    Created on : Feb 5, 2022, 10:43:47 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            if(!!window.performance && window.performance.navigation.type == 2)
            {
                window.location.reload(true);
            }
        </script>
        
      <%
      session.invalidate();
      response.sendRedirect("login.html");
      %>  
    </body>
</html>
