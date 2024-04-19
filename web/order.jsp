<%-- 
    Document   : order
    Created on : Feb 7, 2022, 2:35:13 PM
    Author     : admin
--%>
<%@page import="javax.mail.Transport"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        
        <%

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/productsdb?characterEncoding=UTF-8", "root", "");
Statement st=conn.createStatement();
String oid = session.getAttribute("oid").toString();
int o=Integer.parseInt(oid);
//ResultSet rs=st.executeQuery("select cart.Model_Name,cart.Quantity,cart.Total,orders.email,orders.rec_name,orders.rec_address,orders.rec_mob,orders.date from cart,orders where cart.username=orders.username and orders.order_id="+o+"");
ResultSet rs=st.executeQuery("select email,rec_name,rec_address,date,Model_name,Quantity,Total from orders where order_id="+o+"");
while(rs.next())
{
//int t=Integer.parseInt(rs.getString(3));
//int quantity=Integer.parseInt(rs.getString(2));
//String modname=rs.getString(1);
//String email=rs.getString(4);
//String recname=rs.getString(5);
//String add=rs.getString(6);
//String mob=rs.getString(7);
//String date=rs.getString(8);

String email=rs.getString(1);
String rec_name=rs.getString(2);
String rec_add=rs.getString(3);
String date=rs.getString(4);
String modname=rs.getString(5);
int qty=rs.getInt(6);
int tot=rs.getInt(7);

final String username="redecordesigners53@gmail.com";
 final String password="JanhviDurva@123456789";
 String smtphost="smtp.gmail.com";
 String compression="Redecor Order Confirmation";
 String from=username;
 String to=email;
 //String body="hello!! your Order is placed successfully for  Receiver: "+recname+" <br>Mobile no. "+recmob+"<br><br> You will recieve this on the address:"+recadd+"";
 //String body="hello!! your Order is placed successfully for  Receiver: "+recname+" Mobile no. "+mob+" Model Name:"+modname+" Quantity:"+quantity+" Total:"+t+" Date:"+date+" You will recieve this on the address:"+add+" Your oder will be delivered in 2-3 weeks ";
 
 String body="hello!! your Order is placed successfully for  Receiver: "+rec_name+"  Model Name:"+modname+" Quantity:"+qty+" Total:"+tot+" Date:"+date+" You will recieve this on the address:"+rec_add+" Your oder will be delivered in 2-3 weeks ";
 
 Transport myTransport=null;
 
 try{
 Properties props=System.getProperties();
 props.put("mail.smtp.user", username);
 props.put("mail.smtp.host","smtp.gmail.com");
 props.put("mail.smtp.port","465");//465
 props.put("mail.smtp.starttls.enable","true");
 props.put("mail.smtp.debug", "true");
 props.put("mail.smtp.auth", "true");
 props.put("mail.smtp.socketFactory.port","465");
 props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
 props.put("mail.smtp.socketFactory.fallback", "false");
 
 // Session mailSession =Session.getDefaultInstance(props,null);
 Session mailSession = Session.getInstance(props,new javax.mail.Authenticator() {
 protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
 return new javax.mail.PasswordAuthentication(username, username);
 }
 });
 Message msg= new MimeMessage(mailSession);
 msg.setFrom(new InternetAddress(from));
InternetAddress[] address={new InternetAddress(to)};
 msg.setRecipients(Message.RecipientType.TO,address);
 msg.setSubject(compression);
 msg.setText(body);
 msg.setSentDate(new java.util.Date());
 
 
 myTransport=mailSession.getTransport("smtp");
 myTransport.connect(smtphost,username,password);
 msg.saveChanges();
 myTransport.sendMessage(msg,msg.getAllRecipients());
 myTransport.close();
 
 }
 catch(Exception e){
 e.printStackTrace();
 out.println(e);
 } }
 out.println("<script>alert('Confirmation mail sent.');window.location.assign('product_view.jsp');</script>"); 
    
%> 
 


<!--        %>-->
    </body>
</html>
