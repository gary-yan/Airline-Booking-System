<%@page import="javax.websocket.Session"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">


 <LINK href="img/ab.png" type=image/x-icon rel="shortcut icon" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Airline Booking System</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.min.js"></script>
  <script src="jquery/jquery-3.1.1.min.js"></script>
 </head> 
   <body >
  
   <% 
   String flight =request.getParameter("flight");
   String date =request.getParameter("flightDate");
   String ftime =request.getParameter("ftime");
   String price =request.getParameter("price");
   String ttime =request.getParameter("ttime");
   String f3 =request.getParameter("f3");
   String t3 =request.getParameter("t3");
   String from =request.getParameter("from");
   String to =request.getParameter("to");
   String company =request.getParameter("company");
   String rate =request.getParameter("rate");
   String time =request.getParameter("time");
   String email = (String)session.getAttribute("E-Mail");
   
   System.out.println(email);
   %>
   
    <% Date d = new Date();
	   SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
	   String dt1 = sdf1.format(d);
		
	   SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd");
	   String dt2 = sdf2.format(d);
	   
	   String order = dt2 + (int)( Math.random() * 1000);
	   System.out.println(order);
	   %> 
   
  
   
   <% 
        Class.forName("org.gjt.mm.mysql.Driver").newInstance();
		String url = "jdbc:mysql://localhost:3306/airbooking?user=root&password=root&useUnicode=true&characterEncoding=utf-8&useSSL=false";

		Connection conn = DriverManager.getConnection(url);
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		%>
      <%--  String flag = "SELECT *FROM flight WHERE flight.num = '" + flight + "' AND flight.to = '" + toCity + "'"; 
           ResultSet rs = stmt.executeQuery(flag);--%>
   <%  
       String sql ="INSERT INTO `airbooking`.`user_flight` (`company`, `num`, `from`, `f_three`, `from_time`, `to`, `t_three`, `to_time`, `time`, `price`, `rate`, `email`, `date`, `order`) VALUES ('" + company +"','"+flight+"','"+from+"','"+f3+"','"+ftime+ "','" + to+ "','"+ t3+ "','"+ ttime +"','" + time + "','" + price +"','"+rate +"','" + email+ "','"+date+"','" + order+ "')";
     System.out.println(sql);   
   stmt.executeUpdate(sql);
  conn.close();
  stmt.close();

 String fileName = order + ".txt";
 
  String path1=request.getRealPath("/tickets/");


  File fp=new File(path1,fileName);
  FileWriter fwriter=new FileWriter(fp);
  request.setCharacterEncoding("utf-8");
  String str_file = company + "\n" +"Flight Number:"  + flight   + "\n" + "Date:" + date  + "\n"    + "From:" + from + "|" + f3 + "\n" + "To:"+ to+"|"+t3+ "\n" +"Time:"+ftime  + "\n"  +"Price:" + price ;
  fwriter.write(str_file);
  fwriter.close();
  System.out.println(str_file);
%>


<div style="width:800px;height: 420px;padding-left:20px;margin: 0 auto;margin-top: 100px;">
<div class="panel panel-default">
<div class="panel-heading">
					<h3 class="panel-title">
						Success!
					</h3>
				</div>

<form action="" method="post">
<center><h4>Your Order Number Is:<%=order %></h4>

<center><a href="personal.jsp">Back</a></center>


</form>
</div>
</div>



 


 </body>
</html>
