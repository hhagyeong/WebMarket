<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	//요청 파라미터 아이디를 전송받도록 하고, 없으면 'products.jsp'로 이동
	String id = request.getParameter("cartId");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("cart.jsp");
		return;
	}

	//장바구니에 등록된 모든 상품 삭제
	session.invalidate();
	
	response.sendRedirect("cart.jsp");
%>
