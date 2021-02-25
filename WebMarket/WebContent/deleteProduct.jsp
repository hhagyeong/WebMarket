<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String productId = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//product 모든 필드 값을 가져오도록 하는 select문
	String sql = "select * from product";
	//prepareStatement객체 생성
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery(); //select문 실행
	
	//select문으로 가져온 레코드가 있으면 실행
	if (rs.next()) {
		//product 테이블에서 p_id 필드 값과 일치하는 값이 있으면 해당 레코드를 delete
		sql = "delete from product where p_id = ?";
		//prepareStatement객체 생성
		pstmt = conn.prepareStatement(sql);
		//요청 파라미터 id의 값을 18행의 ?에 설정하도록 함
		pstmt.setString(1, productId);
		pstmt.executeUpdate(); //delete문 실행
	// 요청 파라미터가 없으면 메시지 출력	
	} else { 
		out.println("일치하는 상품이 없습니다.");
	}
	
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=delete");
%>