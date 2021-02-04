<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="java.util.*"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>

<%
request.setCharacterEncoding("UTF-8");

String filename = " ";
String realFolder = "C:\\upload"; //웹 애플리케이션상의 절대 경로
int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기 5MB
String encType = "utf-8"; //인코딩 유형

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

String productId = multi.getParameter("productId");
String name = multi.getParameter("name");
String unitPrice = multi.getParameter("unitPrice");
String description = multi.getParameter("description");
String manufacturer = multi.getParameter("manufacturer");
String category = multi.getParameter("category");
String unitsInStock = multi.getParameter("unitsInStock");
String condition = multi.getParameter("condition");

//폼 페이지에서 상품 가격이 입력되지 않은 경우 0, 입력 된 경우 정수형으로 변경
Integer price;

if (unitPrice.isEmpty())
	price = 0;
else
	price = Integer.valueOf(unitPrice);

//폼 페이지에서 상품 재고 수가 입력되지 않은 경우 0, 입력된 경우 정수형으로 변경
long stock;

if (unitsInStock.isEmpty())
	stock = 0;
else
	stock = Long.valueOf(unitsInStock);

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

//폼 페이지에서 입력된 데이터를 저장하도록 ProductRepository 클래스의 addProduct()메소드 호출
ProductRepository dao = ProductRepository.getInstance();

Product newProduct = new Product();
newProduct.setProductId(productId);
newProduct.setPname(name);
newProduct.setUnitPrice(price);
newProduct.setDescription(description);
newProduct.setManufacturer(manufacturer);
newProduct.setCategory(category);
newProduct.setUnitsInstock(stock);
newProduct.setCondition(condition);
newProduct.setFilename(fileName);

dao.addProduct(newProduct);

//products.jsp 페이지로 강제 이동시키는 response 내장 객체의 sendRedirect()메소드 
response.sendRedirect("products.jsp");
%>