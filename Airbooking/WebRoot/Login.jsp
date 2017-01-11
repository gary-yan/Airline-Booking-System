<%@page import="com.mysql.fabric.Server"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<script src="jquery/jquery-3.1.1.min.js"></script>
<title>Airline Booking System</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
</head>
<style type="text/css">
.header {
	background: #242424;
	width: 100%;
	height: 80px;
	opacity: 0.9;
	position: absolute;
	color: orange;
	font-size: 30px;
	font-family: "Arial";
}

.header img {
	position: relative;
	top: 15px;
	left: 10%;
}

.header span {
	position: relative;
	left: 15%;
	top: 15px
}

.header span:hover {
	cursor: pointer;
}

.container {
	width: 100%;
	height: 780px;
	position: absolute;
}

.content {
	width: 100%;
	height: 750px;
}

.nav {
	width: 350px;
	background: #242424;
	height: 500px;
	margin: 0 auto;
	position: relative;
	top: 150px;
	opacity: 0.8;
	color: white;
}

.bottom {
	width: 100%;
	height: 50px;position: relative;top: 40px;
	}

.bottom p {
	color: white;
	margin: 0 auto;
}

.bh {
	float: right;
	margin-right: 10%;
	color: orange;
	font-family: "Arial";
	margin-top: 25px;
}

.bh:hover {
	color: white;
}

.h1 {
	text-align: center;
	color: white;
	top: 70px;
	position: relative;
}
.h2{color: orange;margin: 0 auto;font-size: 24px;position: relative;top:100px;}

.bh1 {

	margin-top: 200px;
}
</style>
<script language="javascript" type="text/javascript">  
 
 </script>
</head>


<body
	style="background-image: url(img/header-bg.jpg);
  background-repeat: repeat-x;
  background-attachment: scroll;
  background-position: center center;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  background-size: cover;
  -o-background-size: cover;height: 810px;width: 100%;">


	<%
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		session.setAttribute("E-Mail",email);  
		
	%>
	<%--
  	  String g1=request.getParameter("g1");
  	  String g2=request.getParameter("g2");
  	  String g3=request.getParameter("g3");
  	  String email=request.getParameter("email");
  	  String birthday=request.getParameter("birthday");
  	  String tel=request.getParameter("tele");
  	  String p1=request.getParameter("p1");
  	  String p2=request.getParameter("p2");
  	  
  	  String gender="Male";
  	 
  	--%>
	<%
		Class.forName("org.gjt.mm.mysql.Driver").newInstance();
		String url = "jdbc:mysql://localhost/airbooking?user=root&password=root&useUnicode=true&characterEncoding=utf-8";

		Connection conn = DriverManager.getConnection(url);
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

		String sql = "select user.firstname,user.lastname,user.password from user where user.email='" + email + "'";
		
		ResultSet rs = stmt.executeQuery(sql);
	%>


	<div class="container">
		<div class="header">
			 <a href="index.html" style="color:orange;text-decoration:none;"> <img src="img/ab.png"><span>Airline Booking</span></a><a
				href="index.html"><h3 class="bh">Home</h3></a>
		</div>
		<div class="content"">


			<div class="nav">
				
 

					<%


                  
					       boolean isFlag = false;
                           String passwd ="" ;
                           String f1="";
                           String f2="";
							while (rs.next()) {
								 f1 = rs.getString(1);
								 f2 = rs.getString(2);
								 passwd = rs.getString(3);
								isFlag = true;
								
								}
					if(!isFlag)	{	
					%>
                       <center> <h3 class="h1" >The user does not exist！</h3></center>
                <center>    <a href="index.html">    <button class="btn btn-primary bh1">Go Back</button></a></center>
								
					<% 	} else if(!passwd.equals(password)) {%>	
									
					 <h3 class="h1">Wrong password! </h3>
					 <center>  <a href="index.html">    <button class="btn btn-primary bh1">Go Back</button></a>	</center>		
						<%} else{      
						String name = f2 + " " + f1;
						session.setAttribute("logName",name);                                            %>			
									
								<center> <h3 class="h1" >Success！</h3></center>	
							<center> <h3 class="h2"><%=f1 +" " + f2 %></h3>	</center>	
							<center>   <a href="MyHome.jsp">    <button class="btn btn-primary bh1">Visit Home</button></a>		</center>		
									<%} %>		
						 
					 
							
	
	
		</div>
</div>

		<center>
			<div class="bottom">
				<p>Copyright © 2016 BTH.&nbsp;PA2515&nbsp;Team 8. &nbsp;All
					rights reserved.</p>
				<ul class="ulb">
					<a href="">Privacy Policy</a>
					<span> &nbsp;|&nbsp;</span>
					<a href="">Terms of Use</a>
					<span>&nbsp;|&nbsp;</span>
					<a href="">Need Help?</a>
				</ul>
			</div>
		</center>


	</div>
</body>
</html>
