<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
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
<body>
	<%  String flight =request.getParameter("flight");
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
    %>

	<% 
        Class.forName("org.gjt.mm.mysql.Driver").newInstance();
		String url = "jdbc:mysql://localhost:3306/airbooking?user=root&password=root&useUnicode=true&characterEncoding=utf-8&useSSL=false";

		Connection conn = DriverManager.getConnection(url);
		Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		%>
	<%--  String flag = "SELECT *FROM flight WHERE flight.num = '" + flight + "' AND flight.to = '" + toCity + "'"; 
           ResultSet rs = stmt.executeQuery(flag);--%>


	<div
		style="width: 800px; height: 420px; padding-left: 20px; margin: 0 auto; margin-top: 100px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Please check the information:</h3>
			</div>

			<form action="Check.jsp" method="post">
				<center>
					<h4>
						Flight Number:<%=flight %>&nbsp;&nbsp;&nbsp;Date:<%=date %>&nbsp;&nbsp;&nbsp;Time:<%=ftime %></h4>

					<h3>
						Price:<%=price %></h3>
				</center>
				<div
					style="width: 90%; height: 260px; margin: 0 auto; border: solid; border-color: #EAEAEA;">
					<h4 style="text-indent: 1em">Card Type:</h4>
					<select class="form-control" name="month"
						style="width: 23%; margin-left: 16px;">
						<option>Please select</option>
						<option>Visa</option>
						<option>Mastercard</option>

					</select> <br>
					<div style="boder: solid; padding-left: 15px; font-size: 18px;">
						<style>
.inp {
	height: 35px;
}

.i1 {
	width: 310px;
}

.i2 {
	margin-left: 10px;
	width: 150px;
}

.i3 {
	margin-left: 10px;
	width: 150px;
}

.i4 {
	width: 310px;
}

.i5 {
	margin-left: 10px;
	width: 310px;
}

.b {
	width: 100px;
	margin-top: 20px;
}
</style>
						<input class="inp i1" name="cardNumber" placeholder="Card number"><input
							class="inp i2" name="expirationDate"
							placeholder="Expiration date"><input class="inp i3"
							name="cvv" placeholder="CVV/CVC"> <br> <br> <input
							class="inp i4" name="firstname"
							placeholder="Card owner first name"><input class="inp i5"
							name="lastname" placeholder="Card owner last name"> <br>
						<center>
							<button type="submit" class="btn btn-primary b">Confirm</button>
						</center>
					</div>
				</div>

				<input type="hidden" name="flight" value="<%=flight%>"> <input
					type="hidden" name="flightDate" value="<%=date%>"> <input
					type="hidden" name="ftime" value="<%=ftime%>"> <input
					type="hidden" name="price" value="<%=price%>"> <input
					type="hidden" name="from" value="<%=from%>"> <input
					type="hidden" name="to" value="<%=to%>"> <input
					type="hidden" name="t3" value="<%=t3%>"> <input
					type="hidden" name="f3" value="<%=f3%>"> <input
					type="hidden" name="ttime" value="<%=ttime%>"> <input
					type="hidden" name="company" value="<%=company%>"> <input
					type="hidden" name="rate" value="<%=rate%>">
					<input
					type="hidden" name="time" value="<%=time%>">

			</form>
		</div>
	</div>






</body>
</html>
