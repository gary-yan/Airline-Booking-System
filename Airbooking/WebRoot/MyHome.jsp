<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <link href="img/ab.png" type=image/x-icon rel="shortcut icon" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Airline Booking System</title>

    <!-- 必备-->
        <link href="css/auto.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/bootstrap.min.css">
       
        <link href="css/home.css" rel="stylesheet">
        <script src="jquery/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>


    <script type="text/javascript" src="jquery/jquery.mockjax.js"></script>
    <script type="text/javascript" src="jquery/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="js/countries.js"></script>
    <script type="text/javascript" src="js/demo.js"></script>
    <!-- 必备-->
    
 


 
</head>

<body style="background-image: url(img/header-bg.jpg);
  background-repeat: repeat-x;
  background-attachment: scroll;
  background-position: center center;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  background-size: cover;
  -o-background-size: cover;height:870px;width: 100%;">

  
    <div class="container ">
      
         <%   String username = (String) session.getAttribute("logName");%> 
       
      
 <div class="header">
 <a href="index.html" style="color:orange;text-decoration:none;"> <img src="img/ab.png"><span>Airline Booking</span></a>
 <button type="button" href="index.html" class="btn btn-primary  bh" onclick="window.location='index.html'"/>Logout</button>
<a href="personal.jsp" class="help" style="text-decoration: underline;" ><span><%=username %></span></a>
                 
   

   </div>

   
        <div class="content" >
           
         
          <div class="d1">
          <div class="d2" style="height: 50px;width: 100%"><p style="margin-left: 25px;">From:</p><p style="margin-left: 240px;">To:</p><p style="margin-left: 265px;">When:</p></div>
            <form action="Search.jsp" method="post">
                  <input id="autocomplete-ajax-1" class="inp i1" type="" name="from" value="From City" onclick="this.select();" required>
                   <input class="inp i1" type="text" id="autocomplete-ajax" name="to" onclick="this.select();" value="To City"  required/>
                  <input class="inp date" type="date" name="date1" value="Select Date" min="2016-12-06" max="2017-9-06"  required>
                  <input class="inp search btn" type="submit" name="" value="Search">
            </form>
       
          </div>      
        </div>

     
       <center>
    <div class="bot"><p>Copyright © 2016 BTH.&nbsp;PA2515&nbsp;Team 8.   &nbsp;All rights reserved.</p>
          <ul class="ulb">
           <a href="">Privacy Policy</a><span> &nbsp;|&nbsp;</span>
           <a href="">Terms of Use</a><span>&nbsp;|&nbsp;</span>
           <a href="">Need Help?</a>
          </ul>
      </div>
      </center>
    

    
     </div>






</body>

</html>
