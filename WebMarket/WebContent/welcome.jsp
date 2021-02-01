<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<%@ include file="menu.jsp"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>welcome</title>
</head>
<body>

	<%!String greeting = "웹 쇼핑몰에 오신 것을 환영합니다";
	String tagline = "Welcome to Web Market";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>

	<div class="contrainer">
		<div class="text-center">
			<h3><%=tagline%></h3>
			<%//현재 시간을 출력하는 스크립틀릿 태그
			response.setIntHeader("Refresh", 5);
			Date day = new java.util.Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();
			//현재 시각이 12이하면 'AM'출력 / 초과면 'PM'출력
			if (hour / 12 == 0) {
				am_pm = "AM";
			} else {
				am_pm = "PM";
				hour = hour - 12;
			}
			//현재 시각을 '시:분:초 AM/PM'형식으로 출력
			String CT = hour + ":" + minute + ":" + second + " " + am_pm;
			out.println("현재 접속 시간 : " + CT + "\n");
			%>
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>