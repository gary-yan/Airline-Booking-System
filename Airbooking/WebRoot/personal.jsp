<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.mysql.fabric.Server"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<LINK href="img/logo.ico" type=image/x-icon rel="shortcut icon" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Airline Booking System</title>
<link rel="stylesheet" href="css/bootstrap.min.css">


<link href="css/bootstrap.css" rel="stylesheet">
<script src="jquery/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/search.css" rel="stylesheet">
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
}

.content {
	width: 800px;
	height: 620px;
	margin:0 auto;
	margin-top: 120px;
	background:white;
	border: solid;
		overflow:auto;
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

.clear {
	clear: both
}

.bottom {
	width: 100%;
	height: 30px;
}

.bottom p {
	color: white;
	margin: 0 auto;
	margin-top: 20px;
}

.ul1 a {
	color: orange
}

</style>
<body
	style="background-image: url(img/header-bg.jpg); background-repeat: repeat-x; background-attachment: scroll; background-position: center center; -webkit-background-size: cover; -moz-background-size: cover; background-size: cover; -o-background-size: cover; height: 810px; width: 100%;">
	<%
		String user_email = (String) session.getAttribute("E-Mail");
	
	Class.forName("org.gjt.mm.mysql.Driver").newInstance();
	String url = "jdbc:mysql://localhost:3306/airbooking?user=root&password=root&useUnicode=true&characterEncoding=utf-8&useSSL=false";

	Connection conn = DriverManager.getConnection(url);
	Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	String sql = "SELECT * FROM user_flight WHERE user_flight.email = 'howers@qq.com'  ORDER BY user_flight.date DESC "; 
	

	 %>

	<%--String sql = "SELECT * FROM user_flight WHERE user_flight.email = '" + user_email + "' "; --%>

	<div class="container">
		<div class="header">
			<img src="img/logo.ico"><span>Airline Booking</span> <a
				href="MyHome.jsp"><h3 class="bh">Home</h3></a>
			<h3 class="bh"><%=user_email%></h3>
		</div>
		
		<div class="content" >
		<div class="tabbable" id="tabs-90943">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-901248" data-toggle="tab">My Flights</a>
					</li>
					<li>
						 <a href="#panel-353014" data-toggle="tab">Alter Tickets</a>
					</li>
					<li>
						 <a href="#panel-353015" data-toggle="tab">My Profile</a>
					</li>
				</ul>
				<div class="tab-content" >
					<div class="tab-pane active" id="panel-901248">
										<% String flag = "SELECT *FROM user_flight WHERE user_flight.email = '" + user_email + "'"; 
           ResultSet rs = stmt.executeQuery(flag);
           if(!rs.next()){%>
           
									<div class="panel panel-default tic" style="margin:0 auto;">
									<div class="panel-body">
						<br> <br>
						<center>
							<h1>No Results!</h1>
						</center>
						</div>
				</div>
						<% } else{ResultSet rs1 = stmt.executeQuery(sql); %>
						<% 
	  while (rs1.next()){

	String company = rs1.getString(2);
	
     String num = rs1.getString(3);
     String from = rs1.getString(4);
     String f3 = rs1.getString(5);
     String ftime = rs1.getString(6);
     String to = rs1.getString(7);
     String t3 = rs1.getString(8);
     String ttime = rs1.getString(9);
     String time = rs1.getString(10);

     String price = rs1.getString(11);
     String rate = rs1.getString(12);
     String date = rs1.getString(14);
     String order = rs1.getString(15);
     String hh = time.substring(0, 2);
     String mm = time.substring(3, 5);
     int h = Integer.parseInt(hh);
     int m = Integer.parseInt(mm)*60/100;
    
	%>
					
					
									<div class="panel panel-default tic" style="margin:0 auto;">
									<div class="panel-body">
										<div class="th">
											<h6 class="comp">
											
												<%=order %><% out.println( " | "+company+" | "+num); %>
											</h6>
                                           
										</div>
										<div class="tc">
											<ul>
												<li class="three "><%=f3 %></li>
												<li class="time"><%=ftime %></li>
												<li class="total"><%=(h+"h"+m+"m") %></li>
												<li class="time"><%=ttime %></li>
												<li class="three"><%=t3 %></li>
												<li class="price"><%=price %></li>
												<span class="currency">SEK</span>
												<br>
											</ul>
										</div>
										<div class="tb">
											<ul class="tc">
												<li class="from"><%=from %></li>
												<hr class="arrow">
												<li class="to"><%=to %></li>
											</ul>
										</div>
										<div>
											<h6 class="rating">
												<%=date %></h6>
											<a href="tickets/<%=order %>.txt" download="<%=order%>.txt"><input type="button" class="btn btn-default book"
												data-toggle="modal" data-target="#" value="Download"></a>
										</div>


									</div>
								</div>
								
							<%}} %>	
								
			
								
								
								
					</div>
					<div class="tab-pane" id="panel-353014">
						   
						  <% Date d = new Date();
						   SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
						   String dt = sdf.format(d);
						   System.out.println(dt);
						  %> 
						   
						   
						 <% 
						 String sql1 = "SELECT * FROM user_flight WHERE user_flight.email = 'howers@qq.com' and user_flight.date BETWEEN '" +dt + "' AND '20171231'"; 
						 String flag2 = "SELECT *FROM user_flight WHERE user_flight.email = '" + user_email + "' ORDER BY user_flight.date DESC"; 
           ResultSet rs2 = stmt.executeQuery(flag);
           if(!rs2.next()){%>
           
									<div class="panel panel-default tic" style="margin:0 auto;">
									<div class="panel-body">
						<br> <br>
						<center>
							<h1>No Results!</h1>
						</center>
						</div>
				</div>
						<% } else{ResultSet rs3 = stmt.executeQuery(sql1); %>
						<% 
	  while (rs3.next()){

	String company = rs3.getString(2);
	
     String num = rs3.getString(3);
     String from = rs3.getString(4);
     String f3 = rs3.getString(5);
     String ftime = rs3.getString(6);
     String to = rs3.getString(7);
     String t3 = rs3.getString(8);
     String ttime = rs3.getString(9);
     String time = rs3.getString(10);
   
     String price = rs3.getString(11);
     String rate = rs3.getString(12);
     String date = rs3.getString(14);
     String order = rs3.getString(15);
     String hh = time.substring(0, 2);
     String mm = time.substring(3, 5);
     int h = Integer.parseInt(hh);
     int m = Integer.parseInt(mm)*60/100;
    
	%>
					
					
									<div class="panel panel-default tic" style="margin:0 auto;">
									<div class="panel-body">
										<div class="th">
											<h6 class="comp">
											
												<%=order %><% out.println( " | "+company+" | "+num); %>
											</h6>
                                           
										</div>
										<div class="tc">
											<ul>
												<li class="three "><%=f3 %></li>
												<li class="time"><%=ftime %></li>
												<li class="total"><%=(h+"h"+m+"m") %></li>
												<li class="time"><%=ttime %></li>
												<li class="three"><%=t3 %></li>
												<li class="price"><%=price %></li>
												<span class="currency">SEK</span>
												<br>
											</ul>
										</div>
										<div class="tb">
											<ul class="tc">
												<li class="from"><%=from %></li>
												<hr class="arrow">
												<li class="to"><%=to %></li>
											</ul>
										</div>
										<div>
											<h6 class="rating">
												<%=date %></h6>
											<input type="button" class="btn btn-default book"
												data-toggle="modal" data-target="#myModal" value="Change/Cancel">
										</div>


									</div>
								</div>
								
							<%}} %>	
								
					</div>
					<div class="tab-pane" id="panel-353015">
					<div class="panel panel-default " style="margin:0 auto;background: #242424;opacity: 0.9;width:400px;height: 566px;color: white;">
									<div class="panel-body">
								
									
								<table style="width:250px;" align=center border=1 bordercolor="black" >

<tr height=40px>
           <td align=center>
		<font color=white>
		 Name:
		</font>
		</td>
		
            <td align=center>
		<font color=white>
	      Hauk Chen
		</font>
		</td>

</tr>

<tr height=40px>	
           <td align=center> 
		<font color=white>
		E-Mail: 
		</font>
		</td>
            <td  align=center>
		<font color=white>
		howers@qq.com
		</font>
		</td>
</tr>

<tr height=40px>
		<td align=center>
		<font color=white>
		Telephone: 
		</font>
		</td>
           <td  align=center> 
		<font color=white>
		+5656337
		</font>
		</td>
</tr>	
           
</table>
									</div></div>
					</div>
					
				</div>
			</div>
		
		
		</div>
          
		<center>
			<div class="bottom">
				<p>Copyright © 2016 BTH.&nbsp;PA2515&nbsp;Team 8. &nbsp;All
					rights reserved.</p>
				<ul class="ul1">
					<a href="">Privacy Policy</a>
					<span> &nbsp;|&nbsp;</span>
					<a href="">Terms of Use</a>
					<span>&nbsp;|&nbsp;</span>
					<a href="">Need Help?</a>
				</ul>
			</div>
		</center>
	</div>
	
	<div class="modal fade" style="margin: 0 auto;" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 560px; height: auto; margin-top: 200px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Change/Cancel</h4>
            </div>
            <div class="modal-body">Do you want to change or cancel the ticket?</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Cancel</button>
                <button type="button" class="btn btn-primary">Change</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
	
</body>
</html>