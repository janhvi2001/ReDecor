<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta  name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Order Dispatch</title>
        
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" href="css/styles.css">
        
        <style>
            body {
                background:url(feed-bg.jfif);
                background-size: 2000px 700px;
                opacity:20;
                filter:alpha(opacity=10);
                height:2000px;
                width:2000px;
            }
            
            table {
                top: 150px;
                left:5px;
                position:absolute;
                width:5px; 
                border: 2px solid black;
            }
            
            td,tr,th {
                border: 2px solid black;
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
        
        
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/productsdb?characterEncoding=UTF-8", "root", "");
        Statement st=conn.createStatement();
        ResultSet rs=st.executeQuery("select order_id,rec_name,rec_address,username,date,Model_name,Quantity,Total,status from orders");

out.println("<table border=1 bodercoler=black align='center' cellspacing=20 cellpadding=20><tr><td><b>Order ID</b></td><td><b>Username</b></td><td><b>Model_Name</b></td><td><b>Quantity</b></td><td><b>Total</b></td><td><b>Receiver</b></td><td><b>Address</b></td><td><b>Date</b></td><td>Status</td><td>Dispatch</td></tr>");
     
 while(rs.next())
{
    
    String recname=rs.getString(2);
    String add=rs.getString(3);
    String usr=rs.getString(4);
    String date=rs.getString(5);
    String modname=rs.getString(6);
    String qty=rs.getString(7);
    String tot=rs.getString(8);
    String stat=rs.getString(9);
    int orderid=Integer.parseInt(rs.getString(1));
    //session.setAttribute("oid",orderid);
    
   //out.println("");
    
    out.println("<tr><td>"+orderid+"</td><td><b>"+usr+"<b></td><td><b>"+modname+"</b></td><td><b>"+qty+"</b></td><td><b>"+tot+"</b></td><td><b>"+recname+"</b></td><td><b>"+add+"</b></td><td><b>"+date+"</b></td><td><b>"+stat+"</b></td><td><form action='dispatch.jsp' method='post'><input type='hidden' name='oid' value='"+orderid+"'><input type='submit' name='dispatch' value='Dispatch'></form></td></tr>");
    
   

}
  out.println("</table>");

        %>
        
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
        
    </body>
</html>
