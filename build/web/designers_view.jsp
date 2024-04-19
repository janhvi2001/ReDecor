<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Designer's Database</title>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" href="css/styles.css">
        
        <style>
            
            body {
                background:url(feed-bg.jfif);
                background-size: 2000px 700px;
                opacity:20;
                filter:alpha(opacity=10);
            }
            
            h1 {
                left:400px;
                position:absolute;
            }
            
            tr,th,td {
                border: 2px solid black;
            }
            
            table {
                position:absolute;
                left: 200px;
                top:150px;
                border: 2px solid black;
                height: 70px;
                width:1000px;
            }
            
        </style>
        
    </head>
    
    <body class="top">
        
        <div id="preloader">
        <div id="loader">
        </div>
    </div>


    <!-- page wrap
    ================================================== -->
    <div id="page" class="s-pagewrap">


        <!-- # site header 
        ================================================== -->
        <header class="s-header">

            <div class="s-header__logo">
                <a class="logo" href="AdHome.html">
                    <img src="images/logo.svg" alt="Homepage">
                </a>
            </div>

            
            
            <a class="s-header__menu-toggle" href="#0">
                <span class="s-header__menu-text">Menu</span>
                <span class="s-header__menu-icon"></span>
            </a>

            <nav class="s-header__nav">

                <a href="#0" class="s-header__nav-close-btn" title="close"><span>Close</span></a>
                <h3>Redecor.</h3>

                <ul class="s-header__nav-list">
                    <li><a href="Usersdb.jsp">Users Database</a></li>
                    <li><a href="view_appointments.jsp">Appointment</a></li>
                    <li><a href="Product.html">Add Products</a></li>
                    <li><a href="adminproduct_view.jsp">View Products</a></li>
                    <li><a href="pending_orders.jsp">Order Dispatch</a></li>
                    <li><a href="designer_data.html">Designer's Form</a></li>
                    <li><a href="designers_view.jsp">Designer's Database</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
                </ul>

            </nav>

        </header>
        
        <h1>Designer's Information</h1>
        
        <%
        try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/designersdb?characterEncoding=UTF-8", "root", "");
         Statement st = c.createStatement();
         ResultSet rs=st.executeQuery("select*from designers");
         out.println("<table align='center' border='2' cellspacing='10' cellpadding='20'><tr><th>Sr No.</th><th>Designer's Name</th><th>Phone Number</th><th>Years Of Experience</th><th>Number Of Projects Undertaken</th></tr>");
         int i=1;
         while(rs.next())
         {
         out.println("<tr><td><b>"+i+"</b></td><td><b>"+rs.getString(1)+"</b></td><td><b>"+rs.getString(2)+"</b></td><td><b>"+rs.getString(3)+"</b></td><td><b>"+rs.getString(4)+"</b></td></tr>");
         i++;
         
         }
         out.println("</table>");
        
        }
        catch(Exception e){out.println(e);}
        %>
      
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
        
    </body>
</html>
