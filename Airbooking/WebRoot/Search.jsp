<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<LINK href="img/ab.png" type=image/x-icon rel="shortcut icon" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Airline Booking System</title>

<!-- 必备-->
<link href="css/auto.css" rel="stylesheet" />
<link rel="stylesheet" href="css/bootstrap.min.css">


<link href="css/bootstrap.css" rel="stylesheet">
<script src="jquery/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<script type="text/javascript" src="jquery/jquery.mockjax.js"></script>
<script type="text/javascript" src="jquery/jquery.autocomplete.js"></script>
<script type="text/javascript" src="js/countries.js"></script>
<script type="text/javascript" src="js/demo.js"></script>
<!-- 必备-->

<link href="css/search.css" rel="stylesheet">
</head>

<body>

	<%
        String fromCity =request.getParameter("from");
  	    String toCity =request.getParameter("to");
  	    String dateGo =request.getParameter("date1");
       
		Class.forName("org.gjt.mm.mysql.Driver").newInstance();
		String url = "jdbc:mysql://localhost:3306/airbooking?user=root&password=root&useUnicode=true&characterEncoding=utf-8&useSSL=false";

		Connection conn = DriverManager.getConnection(url);
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

		
		
	%>


	<div class="container ">




		<div class="header">
			<a href="index.html" style="color: orange; text-decoration: none;">
				<img src="img/ab.png"><span>Airline Booking</span>
			</a>
			<% if((String) session.getAttribute("logName") ==null){ %>
			<button class="btn btn-primary  bh" data-toggle="modal"
				data-target="#myModal">LOGIN</button>


			<a class="help"><span>Help</span></a>

			<% }else{
    	  
    	  String username = (String) session.getAttribute("logName");
    	  
    	  %>
			<a href="index.html">
				<button class="btn btn-primary  bh">Log Out</button>
			</a> <a class="help" style="text-decoration: underline;"><span><%=username%></span></a>


			<%-- 
      session.setAttribute("logName", null);--%>
			<%  } 
      %>
      
        <% Date d = new Date();
						   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						   String dt = sdf.format(d);
						  %> 
						   
      
		</div>
		<div class="nav11">
			<div class="nav1">

				<form class="form1" action="Search.jsp">
					<input class="inp " type="text" id="from" name="from"
						onclick="this.select();" value="<%=fromCity%>" required>
					<a class="ex" onclick="change();"><img
						style="color: white; width: 30px; heihgt: 30px; margin-top: 12px;"
						" src="img/a.svg"></a> <input class="inp"
						onclick="this.select();" name="to" type="text" id="to"
						value="<%=toCity%>" required> <input class="inp date"
						type="date" name="date1" value="<%=dateGo%>" min="<%=dt %>"
						max="2017-9-06" required> <input
						class="inp btn btn-default ser" type="submit" name=""
						value="Search">
				</form>

			</div>

		</div>

		<script type="text/javascript">
  function change(){
	  var ex = document.getElementById("to").value;
		 document.getElementById("to").value=document.getElementById("from").value; 
		 document.getElementById("from").value = ex;
		
  }
</script>


		<div class="content">


			<div class="row clearfix"
				style="width: 750px; margin: 0 auto; color: black; margin-top: 10px; height: 100%;">
				<div class="col-md-12 column">
					<div class="tabbable" id="tabs-905252">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#panel-267945" data-toggle="tab">Cheapest</a>
							</li>
							<li><a href="#panel-558579" data-toggle="tab">Quichest</a></li>
							<li><a href="#panel-55857" data-toggle="tab">Best</a></li>
						</ul>

						<% String flag = "SELECT *FROM flight WHERE flight.from = '" + fromCity + "' AND flight.to = '" + toCity + "'"; 
           ResultSet rs = stmt.executeQuery(flag);
           if(!rs.next()){%>
						<br> <br>
						<center>
							<h1>No Results!</h1>
						</center>
						<% } else{ %>
						<div class="tab-content">

							<div class="tab-pane active" id="panel-267945">



								<% 
                         String priceSql = "SELECT flight.company,flight.num,flight.`from`,flight.f_three,flight.from_time,flight.`to`,flight.t_three,flight.to_time,flight.time,flight.price,flight.rate FROM flight WHERE flight.from = '" + fromCity + "' AND flight.to = '" + toCity + "' ORDER BY flight.price ASC";
	                     ResultSet rs1 = stmt.executeQuery(priceSql);
	                    
	              
	                     
	                     while (rs1.next()){
	                     
	                     String company = rs1.getString(1);
	                     String num = rs1.getString(2);
	                     String from = rs1.getString(3);
	                     String f3 = rs1.getString(4);
	                     String ftime = rs1.getString(5);
	                     String to = rs1.getString(6);
	                     String t3 = rs1.getString(7);
	                     String ttime = rs1.getString(8);
	                     String time = rs1.getString(9);
	                     String price = rs1.getString(10);
	                     String rate = rs1.getString(11);
	                     String hh = time.substring(0, 2);
		                 String mm = time.substring(3, 5);
		                 int h = Integer.parseInt(hh);
		                 int m = Integer.parseInt(mm)*60/100;
	                     %>


								<div class="panel panel-default tic">
									<div class="panel-body">
										<div class="th">
											<h6 class="comp">
												<% out.println(company + " " + num);%>
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
											<h3 class="rating">
												Rating:&nbsp;<%=rate %></h3>
											<input type="button" class="btn btn-default book"
												data-toggle="modal" data-target="#<%=num %>" value="Book">
										</div>


									</div>
								</div>

								<div class="modal fade bookComfirm" style="margin: 0 auto;"
									id="<%=num %>" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" style="margin: 0 auto;">
										<div class="modal-content"
											style="width: 760px; height: 340px; margin-top: 200px;">
											<form action="Book.jsp">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel">Booking</h4>
												</div>
												<div class="modal-body">
													<div class="panel panel-default tic">
														<div class="panel-body">
															<div class="th">
																<h6 class="comp">
																	<% out.println(company + " " + num);%>
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
																<h3 class="rating" >
																	Rating:&nbsp;<%=rate %></h3>
																<input type="hidden" name="flight" value="<%=num%>">
																<input type="hidden" name="flightDate"
																	value="<%=dateGo%>">
																	<input type="hidden" name="ftime"
																	value="<%=ftime%>">
																	<input type="hidden" name="price"
																	value="<%=price%>">
																    <input type="hidden" name="from"
																	value="<%=from%>">
																	<input type="hidden" name="to"
																	value="<%=to%>">
																	<input type="hidden" name="t3"
																	value="<%=t3%>">
																	<input type="hidden" name="f3"
																	value="<%=f3%>">
																	<input type="hidden" name="ttime"
																	value="<%=t3%>">
																	<input type="hidden" name="company"
																	value="<%=company%>">
																	<input type="hidden" name="rate"
																	value="<%=rate%>">
																	<input type="hidden" name="time"
																	value="<%=time%>">
															</div>


														</div>
													</div>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
													<% if((String) session.getAttribute("logName") ==null ){%>
													<script type="text/javascript">
				function check() {
					alert("Please Log In!");
				}
				</script>
													<input type="button" onclick="check()"
														class="btn btn-primary" value="Comfirm">


													<% }else{%>
													<button type="submit" class="btn btn-primary">
														Comfirm</button>
													<% }%>
												</div>
											</form>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal -->
								</div>
								<%   }
	                  rs1.close() ;%>

							</div>









							<div class="tab-pane" id="panel-558579">
								<% 
                         String timeSql = "SELECT flight.company,flight.num,flight.`from`,flight.f_three,flight.from_time,flight.`to`,flight.t_three,flight.to_time,flight.time,flight.price,flight.rate FROM flight WHERE flight.from = '" + fromCity + "' AND flight.to = '" + toCity +"' ORDER BY flight.time ASC";
	                     ResultSet rs2 = stmt.executeQuery(timeSql);
	                     while (rs2.next()){
	                     
	                     String company = rs2.getString(1);
	                     String num = rs2.getString(2);
	                     String from = rs2.getString(3);
	                     String f3 = rs2.getString(4);
	                     String ftime = rs2.getString(5);
	                     String to = rs2.getString(6);
	                     String t3 = rs2.getString(7);
	                     String ttime = rs2.getString(8);
	                     String time = rs2.getString(9);
	                     String price = rs2.getString(10);
	                     String rate = rs2.getString(11);
	                     String hh = time.substring(0, 2);
		                 String mm = time.substring(3, 5);
		                 int h = Integer.parseInt(hh);
		                 int m = Integer.parseInt(mm)*60/100;
	                     %>

								<div class="panel panel-default tic">
									<div class="panel-body">
										<div class="th">
											<h6 class="comp">
												<% out.println(company + " " + num);%>
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
											<h3 class="rating">
												Rating:&nbsp;<%=rate %></h3>
											<input type="button" class="btn btn-default book"
												data-toggle="modal" data-target="#<%=num+from %>" value="Book">
										</div>
                                        
                                        
                                        

									</div>
								</div>

								<div class="modal fade bookComfirm" style="margin: 0 auto;"
									id="<%=num+from %>" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" style="margin: 0 auto;">
										<div class="modal-content"
											style="width: 760px; height: 340px; margin-top: 200px;">
											<form action="Book.jsp">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel">Booking</h4>
												</div>
												<div class="modal-body">
													<div class="panel panel-default tic">
														<div class="panel-body">
															<div class="th">
																<h6 class="comp">
																	<% out.println(company + " " + num);%>
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
																	<h3 class="rating" >
																	Rating:&nbsp;<%=rate %></h3>
																<input type="hidden" name="flight" value="<%=num%>">
																<input type="hidden" name="flightDate"
																	value="<%=dateGo%>">
																	<input type="hidden" name="ftime"
																	value="<%=ftime%>">
																	<input type="hidden" name="price"
																	value="<%=price%>">
																    <input type="hidden" name="from"
																	value="<%=from%>">
																	<input type="hidden" name="to"
																	value="<%=to%>">
																	<input type="hidden" name="t3"
																	value="<%=t3%>">
																	<input type="hidden" name="f3"
																	value="<%=f3%>">
																	<input type="hidden" name="ttime"
																	value="<%=t3%>">
																	<input type="hidden" name="company"
																	value="<%=company%>">
																	<input type="hidden" name="rate"
																	value="<%=rate%>">
																	<input type="hidden" name="time"
																	value="<%=time%>">
															</div>


														</div>
													</div>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
													<% if((String) session.getAttribute("logName") ==null ){%>
													<script type="text/javascript">
				function check() {
					alert("Please Log In!");
				}
				</script>
													<input type="button" onclick="check()"
														class="btn btn-primary" value="Comfirm">


													<% }else{%>
													<button type="submit" class="btn btn-primary">
														Comfirm</button>
													<% }%>
												</div>
											</form>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal -->
								</div>

								<%   }  rs2.close() ;%>
							</div>
							<div class="tab-pane" id="panel-55857">
								<% 
                         String rateSql = "SELECT flight.company,flight.num,flight.`from`,flight.f_three,flight.from_time,flight.`to`,flight.t_three,flight.to_time,flight.time,flight.price,flight.rate FROM flight WHERE flight.from = '" + fromCity + "' AND flight.to = '" + toCity + "' ORDER BY flight.rate DESC";
	                     ResultSet rs3 = stmt.executeQuery(rateSql);
	                     while (rs3.next()){
	                     
	                     String company = rs3.getString(1);
	                     String num = rs3.getString(2);
	                     String from = rs3.getString(3);
	                     String f3 = rs3.getString(4);
	                     String ftime = rs3.getString(5);
	                     String to = rs3.getString(6);
	                     String t3 = rs3.getString(7);
	                     String ttime = rs3.getString(8);
	                     String time = rs3.getString(9);
	                     String price = rs3.getString(10);
	                     String rate = rs3.getString(11);
	                     String hh = time.substring(0, 2);
		                 String mm = time.substring(3, 5);
		                 int h = Integer.parseInt(hh);
		                 int m = Integer.parseInt(mm)*60/100;
	                     %>

								<div class="panel panel-default tic">
									<div class="panel-body">
										<div class="th">
											<h6 class="comp">
												<% out.println(company + " " + num);%>
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
											<h3 class="rating">
												Rating:&nbsp;<%=rate %></h3>
											<input type="button" class="btn btn-default book"
												data-toggle="modal" data-target="#<%=num+to %>" value="Book">
										</div>


									</div>
								</div>


								<div class="modal fade" id="<%=num+to %>" tabindex="-1" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content"
											style="width: 760px; height: 340px; margin-top: 200px;">
											<form action="Book.jsp">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel">Booking</h4>
												</div>
												<div class="modal-body">
													<div class="panel panel-default tic">
														<div class="panel-body">
															<div class="th">
																<h6 class="comp">
																	<% out.println(company + " " + num);%>
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
																	<h3 class="rating" >
																	Rating:&nbsp;<%=rate %></h3>
																<input type="hidden" name="flight" value="<%=num%>">
																<input type="hidden" name="flightDate"
																	value="<%=dateGo%>">
																	<input type="hidden" name="ftime"
																	value="<%=ftime%>">
																	<input type="hidden" name="price"
																	value="<%=price%>">
																    <input type="hidden" name="from"
																	value="<%=from%>">
																	<input type="hidden" name="to"
																	value="<%=to%>">
																	<input type="hidden" name="t3"
																	value="<%=t3%>">
																	<input type="hidden" name="f3"
																	value="<%=f3%>">
																	<input type="hidden" name="ttime"
																	value="<%=t3%>">
																	<input type="hidden" name="company"
																	value="<%=company%>">
																	<input type="hidden" name="rate"
																	value="<%=rate%>">
																	<input type="hidden" name="time"
																	value="<%=time%>">
															</div>


														</div>
													</div>

												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
													<% if((String) session.getAttribute("logName") ==null ){%>
													<script type="text/javascript">
				function check() {
					alert("Please Log In!");
				}
				</script>
													<input type="button" onclick="check()"
														class="btn btn-primary" value="Comfirm">


													<% }else{%>
													<button type="submit" class="btn btn-primary">
														Comfirm</button>
													<% }%>
												</div>
											</form>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal -->
								</div>

								<%  }  rs3.close() ;%>
							</div>
						</div>
					</div>
					<%} %>
				</div>
			</div>

		</div>

		<!--
    <center>
      <div class="bot">
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

-->


	</div>


	<style>
.login {
	margin: 0 auto;
	height: 210px;
}

.cbox {
	float: left;
	margin-left: 10px;
}

.lg {
	width: 370px;
}
</style>


	<!-- 模态框（Modal） -->
	<div class="modal fade pos" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 400px;">
			<div class="modal-content" style="margin-top: 120px;">
				<div class="modal-header" style="background: #6B8E23; opacity: 0.9">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel" style="color: white;">
						Welcome!</h4>
				</div>
				<form action="Login.jsp" method="post" onsubmit="return validate()">
					<div class="modal-body login">

						<span><h4>E-Mail:</h4></span> <input class="lg" type=""
							name="email" placeholder="xyz@domain.com"
							pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required>
						<span><h4>Password:</h4></span> <input class="lg" type="password"
							name="password" required>
						<div>
							<input class="cbox" style="width: 15px; height: 15px;"
								name="remember" type="checkbox" value="Remember me" /><span
								class="cbox">Remember me</span> <a href=""><span
								style="margin-left: 20px; text-decoration: underline;"
								class="cbox">Forget passward?</span> </a>
						</div>
					</div>


					<div class="modal-footer" style="background: #6B8E23; opacity: 0.9">

						<button type="button" class="btn btn-default" data-dismiss="modal">Exit
						</button>
						<a href="si.html">
							<button type="button" class="btn btn-default" href="sign up.html">Sign
								up</button>
						</a>
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>






</body>

</html>
