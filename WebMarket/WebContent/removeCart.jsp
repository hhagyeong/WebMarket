<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
	//요청 파라미터 아이디를 전송받도록 하고, 없으면 'products.jsp'로 이동
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}

	//ProductRepository의 기본 생성자에 대한 객체 변수 instance를 얻어오도록 함
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if (product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	// cartlist에 등록된 모든 상품을 가져오도록 함
	ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
	// Product 객체 생성
	Product goodsQnt = new Product();
	// cartlist에 등록된 모든 상품을 하나씩 출력
	for (int i = 0; i < cartList.size(); i++) { 
		goodsQnt = cartList.get(i);
		// 요청 파라미터 아이디와 같으면 cartlist에서 삭제
		if (goodsQnt.getProductId().equals(id)) {
			cartList.remove(goodsQnt);
		}
	}

	response.sendRedirect("cart.jsp");
%>
