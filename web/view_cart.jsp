<%@ page contentType="text/html; charset=UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
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
body {margin: 0;}

ul.topnav {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

ul.topnav li {float: left;}

ul.topnav li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

ul.topnav li a:hover:not(.active) {background-color: #111;}

ul.topnav li a.active {background-color: #04AA6D;}

ul.topnav li.right {float: right;}

@media screen and (max-width: 600px) {
  ul.topnav li.right, 
  ul.topnav li {float: none;}
}
        </style>
        <script>
            function incr(i,price)
            {
                
                var qty=document.getElementById("qt"+i).innerHTML; var cid=document.getElementById("cid"+i).value;
                var cid1=document.getElementById("cid"+i).value;
               
                //if(Number(qty)>1)
                {    
                    qty=Number(qty)+1;
                    var p=Number(qty)*Number(price);
                    document.getElementById("total"+i).innerHTML=p;
                    document.getElementById("qt"+i).innerHTML=qty;
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() 
                    {
                        if (this.readyState == 4 && this.status == 200) 
                        {
                            document.getElementById("output").innerHTML = this.responseText;
                        }
                    };
                    xhttp.open("GET", "modify_qty_total.jsp?q="+qty+"&t="+p+"&cart="+cid1, true);
                    xhttp.send();
                }
                
                var tot=document.getElementById("tt").value;
                var gt=0;
                for(var x=1; x<=tot;x++ )
                {
                    gt+=Number(document.getElementById("total"+x).innerHTML);
                }
                document.getElementById("grand_total").innerHTML=gt;
                
            }
            function decr(i,price)
            {
                var qty=document.getElementById("qt"+i).innerHTML;
                var cid=document.getElementById("cid"+i).value;
                //alert(cid);
                if(Number(qty)>1)
                {
                    qty=Number(qty)-1;
                    var p=Number(qty)*Number(price);
                    document.getElementById("total"+i).innerHTML=p;
                    document.getElementById("qt"+i).innerHTML=qty;     
                    var xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function() 
                    {
                        if (this.readyState == 4 && this.status == 200) 
                        {
                            document.getElementById("output").innerHTML = this.responseText;
                         }
                    };
                    xhttp.open("GET", "modify_qty_total.jsp?q="+qty+"&t="+p+"&cart="+cid, true);
                    xhttp.send();
                    
                    
                    var tot=document.getElementById("tt").value;
                var gt=0;
                for(var x=1; x<=tot;x++ )
                {
                    gt+=Number(document.getElementById("total"+x).innerHTML);
                }
                document.getElementById("grand_total").innerHTML=gt;
            
                }
            }
        </script>
        
    </head>
</head>
<body>
<%
if (session.getAttribute("user_name") == null) {
    // Redirect to login page if user is not logged in
    response.sendRedirect("login1.html");
} else {
%>
<ul class="topnav">
    <li><a href="home.jsp">Home</a></li>
    <li><a href="product_view.jsp">Product</a></li>
    <li><a class="active" href="view_cart.jsp">View Cart</a></li>
    <li class="right" style="color: white">Welcome <%= session.getAttribute("user_name") %></li>
    <li class="right"><a href="logout.jsp">Logout</a></li>
</ul>
<div style="padding:0 16px;"><br><br>
    <h2 align="center">Cart Details</h2>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/productsdb?characterEncoding=UTF-8", "root", "");
        Statement st = c.createStatement();
        ResultSet rs = st.executeQuery("select cart.cart_id,cart.Model_Name,cart.Quantity,cart.Selling_Price,cart.Total,stocks.Company_Name,stocks.Product_img from cart,stocks where cart.Model_Name=stocks.Model_Name and cart.status='NO' and cart.username='" + session.getAttribute("user_name") + "'");

        out.println("<table border=1 align='center' cellspacing=20 cellpadding=20><tr><td>Sr. No</td><td>Product Image</td><td>Company Name</td><td>Model Name</td><td>Quantity</td><td>Price</td><td>Total Price</td><td>Action</td></tr>");
        int i = 1;
        int gt = 0;
        while (rs.next()) {
            int cartid = rs.getInt(1);
            int t = Integer.parseInt(rs.getString(5));
            int quantity = Integer.parseInt(rs.getString(3));
            int price = rs.getInt(4);
            gt = gt + t;
            out.println("<tr><td>" + i + "</td><td><img src='" + rs.getString(7) + "' width=100 height=100></td><td>" + rs.getString(6) + "</td><td>" + rs.getString(2) + "</td><td><div id='qt" + i + "'>" + quantity + "</div><hr><div><input type='button' value='-' id='dec' onclick='decr(" + i + "," + price + ")'>&nbsp;&nbsp;&nbsp;<input type='button' value='+' id='inc' onclick='incr(" + i + "," + price + ")'></div</td><td>" + price + "</td><td><div id='total" + i + "'>" + t + "</div></td><td><form action='removecart.jsp' method='POST'><input type='hidden' value='" + cartid + "' name='cid' id='cid" + i + "'><button class='button button2'>Remove <i class='fa fa-trash-o'></i></button></form></td></tr>");
            i++;
        }
        out.println("<input type='hidden' id='tt' value=" + (i - 1) + ">");
        out.println("<tr><td colspan=6>Grand Total</td><td><div id='grand_total'>" + gt + "</div></td><td><a href='product_view.jsp'><input type='submit' class='button button2' name='add_more' value='Add More Items'></a></td></tr><table>");
    } catch (Exception e) {
        // Log the exception for debugging
        e.printStackTrace();
        // Provide a user-friendly error message
        out.println("<p>Error fetching cart details. Please try again later.</p>");
    }
%>
<br><hr><br>
<div id="output">
    <h2 align="center">Delivery Details</h2>
    <form action="place_order.jsp" method="POST">
        <table border="1" align="center">
            <tr><td>Enter Email :</td><td><input type=email name="email"></td></tr>
            <tr><td>Enter Receiver Name :</td><td><input type=text name="rec_name"></td></tr>
            <tr><td>Enter Receiver Address :</td><td> <textarea rows="3" cols="30" name="rec_add"> </textarea>  </td></tr>
            <tr><td>Enter Mobile No :</td><td> <input type='text' name='mob_no'></td></tr>
            <tr><td>Payment Mode:</td><td><label>COD(only)</label></td>
            <tr><td colspan="2" align='center'><input type='submit' class='button button2' name='save1' value="Place Order"></td></tr>
        </table>
    </form>
</div>
<br><br>
</div>
<%
}
%>
</body>
</html>
