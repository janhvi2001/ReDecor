<%-- 
    Document   : UpdateProduct
    Created on : Feb 5, 2022, 3:45:39 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Products</title>
        <link rel="stylesheet" href="css/vendor.css">
        <link rel="stylesheet" href="css/styles.css">
        
        
        
            <style>
body {
    height: 1350px;
    background:url(feed-bg.jfif) no-repeat;
    background-size: 2000px 1350px;
    opacity:20;
    filter:alpha(opacity=10);
     }
     
table {
    top: 150px;
    left:50px;
    position:absolute;
    width:50px; 
    border:2px solid black;
      }
      
td,tr,th {
    border: 2px solid black;    
      }
      
      .img {
          border: 2px solid black;
      }


</style>
  
            <script>
            var openFile=function openFile(file)
            {
                var input=file.target;
                var reader=new FileReader();
                reader.onload=function(){
                    var dataURL=reader.result;
                    var output=document.getElementById('si1');
                    output.src=dataURL;
                    document.getElementById("bd1").value=dataURL;
                };
                reader.readAsDataURL(input.files[0]);
            };
        </script>
        
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
                    <li><a href="admin_feedback.jsp" >Feedback</a></li>
                    <li><a href="view_appointments.jsp">Appointment</a></li>
                    <li><a href="Product.html">Add Products</a></li>
                    <li><a href="adminproduct_view.jsp">View Products</a></li>
                    <li><a href="designer_data.html">Designer's Form</a></li>
                    <li><a href="designers_view.jsp">Designer's Database</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                </ul>
                </ul>

            </nav>

        </header>
   
        <form action="Update.jsp" method="POST">
            <table border=1  cellspacing=20 cellpadding=20>
                <tr>
            <td>Company Name:</td><td><input type="text" name="cn"></td></tr><br>
            <tr><td>Model Name:</td><td><input type="text" name="mn"></td></tr><br>
            <tr><td>Category:</td><td><input type="text" name="ct"></td></tr><br>
           <tr><td>Cost Price</td><td><input type="number" name="cp"></td></tr><br>
           <tr><td>Selling Price</td><td><input type="number" name="sp"></td></tr><br>
           <tr> <td>Image:</td><td> <input type="file" name="mi" id="mi1" onchange="openFile(event)"></td></tr><br>
            <img name="si" id="si1" width="400" height="400" style="position: absolute; right: 10px;top:170px"><br>
           <tr><td> Description:</td><td> <textarea rows="10" cols="20" name="ds"></textarea></td><br>
            <input type="hidden"  name="bd" id="bd1"><br>
<!--            //<input type="hidden" name="prodid" value=+p>-->
          <%  String pid=request.getParameter("pid");
                 session.setAttribute("pid",pid); %>
            <tr><td colspan='2' align='center'><input type="submit" name="UPDATE" ></td></tr>
            </table>
        </form>

            <script src="js/plugins.js"></script>
            <script src="js/main.js"></script>
            
    </body>
</html>
