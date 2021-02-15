<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%
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

//요청 파라미터 아이디의 상품이 존재하는지 검사
ArrayList<Product> goodsList = dao.getAllProducts();
Product goods = new Product();
for (int i = 0; i < goodsList.size(); i++) {
	goods = goodsList.get(i);
	if (goods.getProductId().equals(id)) {
		break;
	}
}

//요청 파라미터 아이디의 상품을 담은 장바구니를 초기화
//만약 ArrayList 객체에 저장된 세션정보가 없으면 객체 생성 후 세션 속성 이름을 cartList로 함
ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
if (list == null) {
	list = new ArrayList<Product>();
	session.setAttribute("cartlist", list);
}

int cnt = 0;
Product goodsQnt = new Product();

//요청 파라미터 아이디 상품이 장바구니에 담긴 목록이면 수량을 더함
for (int i = 0; i < list.size(); i++) {
	goodsQnt = list.get(i);
	if (goodsQnt.getProductId().equals(id)) {
		cnt++;
		int orderQuantity = goodsQnt.getQuantity() + 1;
		goodsQnt.setQuantity(orderQuantity);
	}
}

//해당 상품의 수량을 1로하고 장바구니 목록에 추가
if (cnt == 0) {
	goods.setQuantity(1);
	list.add(goods);
}

response.sendRedirect("product.jsp?id=" + id);
%>