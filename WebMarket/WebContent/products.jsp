<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%> 

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<!-- 데이터베이스 연결 파일 포함 -->
			<%@ include file="dbconn.jsp"%>
			
			<%
			//product 테이블의 모든 필드 값을 가져오도록 select문 작성
			String sql = "select * from product";
			//prepareStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(); //select문 실행
			//select문으로 가져온 레코드가 있을 때까지 모든 필드 값을 가져와 출력하도록 반복 실행
			while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="c:/upload/<%=rs.getString("p_fileName")%>"
					style="width: 100%">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getString("p_UnitPrice")%>원
				<p>
					<a href="./product.jsp?id=<%=rs.getString("p_id")%>"
						class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
			</div>
			<%
			}
			%>
			<%
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
