<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        
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
                left:100px;
                position:absolute;
                width:1320px; 
                border: 2px solid black;
            }
            
            td,tr,th {
                border: 2px solid black;
            }
            
            h1 {
                position:absolute;
                left:500px;
                top:15px;
            }
            
        </style>
    </head>
    <body id="top">
        
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
                <a class="logo" href="index.jsp">
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
                    <li><h3>Welcome,<%=session.getAttribute("user_name")%></h3></li>
                    <li><a href="feedback.html" >Feedback</a></li>
                    <li><a href="appointment.html">Appointment</a></li>
                    <li><a href="product_view.jsp">Shop Here</a></li>
                    <li><a href="index.jsp#contact">Contact</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>

            </nav>

        </header>
        
        <h1> YOUR ORDER HISTORY ! </h1>
        
        <%
        Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/productsdb?characterEncoding=UTF-8", "root", "");


    
Statement st=conn.createStatement();
ResultSet rs=st.executeQuery("select rec_address,date,status,Model_name,Quantity,Total from orders where username='"+session.getAttribute("user_name")+"'");

out.println("<table border=1 bordercolor=black align='center' cellspacing=20 cellpadding=20 ><tr><td>Sr. No</td><td>Model_Name</td><td>Quantity</td><td>Total</td><td>Address</td><td>Date</td><td>Status</td></tr>");
 int i=1;       
while(rs.next())
{
int t=Integer.parseInt(rs.getString(6));
int quantity=Integer.parseInt(rs.getString(5));
String modname=rs.getString(4);
String stat=rs.getString(3);
//String recname=rs.getString(5);
String add=rs.getString(1);
//String mob=rs.getString(7);
String date=rs.getString(2);

out.println("<tr><td><b>"+i+"</b></td><td><b>"+modname+"</b></td><td><b>"+quantity+"</b></td><td><b>"+t+"</b></td><td><b>"+add+"</b></td><td><b>"+date+"</b></td><td><b>"+stat+"</b></td></tr>");
i++;
}
        %>
        
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
        
    </body>
</html>
