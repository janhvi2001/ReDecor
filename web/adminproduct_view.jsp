

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Products</title>
        <!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


                <style>
            body {
                margin: 0;
                background: #71797E ;
            }

ul.sidenav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 25%;
  background-color:#404541;
  position: fixed;
  height: 100%;
  overflow: auto;
}

ul.sidenav li a {
  display: block;
  color: #ccc;
  padding: 8px 16px;
  text-decoration: none;
}
 
ul.sidenav li a.active {
  background-color: #ACCFBF;
  color: white;
}

ul.sidenav li a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 25%;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 900px) {
  ul.sidenav {
    width: 100%;
    height: auto;
    position: relative;
  }
  
  ul.sidenav li a {
    float: left;
    padding: 15px;
  }
  
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  ul.sidenav li a {
    text-align: center;
    float: none;
  }
}
            .button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #abb0ac;
}

.button2:hover {
  background-color: #abb0ac;
  color: white;
}

            body {
  font-family: Arial, Helvetica, sans-serif;
}

.flip-box {
  background-color: transparent;
  width: 300px;
  height: 200px;
  border: 1px solid #f1f1f1;
  perspective: 1000px;
}

.flip-box-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

.flip-box:hover .flip-box-inner {
  transform: rotateY(180deg);
}

.flip-box-front, .flip-box-back {
  position: absolute;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

.flip-box-front {
  background-color: #bbb;
  color: black;
}

.flip-box-back {
  background-color: #404541;
  color: white;
  transform: rotateY(180deg);
}
        </style>
    </head>
    <body>
        <ul class="sidenav">
  <li><a href="Usersdb.jsp">Users Database</a></li>
                    <li><a href="AdHome.html">Homepage</a></li>
                    <li><a href="admin_feedback.jsp" >Feedback</a></li>
                    <li><a href="view_appointments.jsp">Appointment</a></li>
                    <li><a href="Product.html">Add Products</a></li>
                    <li><a href="pending_orders.jsp">Order Dispatch</a></li>
                    <li><a href="designer_data.html">Designer's Form</a></li>
                    <li><a href="designers_view.jsp">Designer's Database</a></li>
                    <li><a href="logout.jsp">Logout</a></li>
</ul>
     
        <div class="content">
            <h1>PRODUCT LIST</h1>
        <%
        try{
            String s1=request.getParameter("s1");
                    
            Class.forName("com.mysql.jdbc.Driver");
            Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/productsdb?characterEncoding=UTF-8","root","");
            Statement st=c.createStatement();
            
            ResultSet rs=st.executeQuery("select * from stocks");
            out.println("<table border=0 align='center' cellspacing=40 cellpadding=40><tr>");
            int i=0;
           
            while(rs.next())
            {
                int prodid=rs.getInt(7);
                String mn=rs.getString(2);
                //String ct=rs.getString(3);
                String cp=rs.getString(4);
              out.println("<td>"+ "<div class='flip-box'><div class='flip-box-inner'><div class='flip-box-front'><img src='"+rs.getString(5)+"' width=298 height=198></div>"
                        + " <div class='flip-box-back'>Company :"+ rs.getString(1)+"<hr><br>Model Name:"+mn+"<input type='hidden' value='"+mn+"' name='model'><br>Price :"+cp+"<input type='hidden' name='price' value='"+cp+"'><hr>Description :"+rs.getString(6)+"<hr>"+ "Enter Quantity :<input type='number' value='1' id='qt' name='qt1'><hr><br><form action='Delete_prod.jsp' method='post'><input type='hidden' value='"+prodid+"' name='pid' id='pid"+i+"'><button class='button button2'>Remove <i class='fa fa-trash-o'></i></button> </form><form action='UpdateProduct.jsp' method='post'><input type='hidden' value='"+prodid+"' name='pid' id='pid"+i+"'><button class='button button2'>Update </button></form></div></div></div></td>");
                
               

                i++;
                if(i%2==0)
                {
                    out.println("</tr><tr>");
                    out.println("</tr><tr>");
                }

            }
             
            out.println("</table>");
            
                    
            
        }catch(Exception e){out.println(e);}
        %>
        </div>
    </body>
</html>
