CREATE TABLE IF NOT EXISTS product(
	p_id VARCHAR(10) NOT NULL, --상품 아이디
	p_name VARCHAR(30), --상품명
	p_unitPrice INTEGER, --상품 가격
	p_description TEXT, --상품 상세 설명
	p_category VARCHAR(20), --상품 카테고리
	p_manufacturer VARCHAR(20), --상품 제조사
	p_unitsInStock LONG, --상품 재고 수
	p_condition VARCHAR(20),  --상품 상태
	p_filName VARCHAR(20), --상품 이미지 파일명
	PRIMARY KEY (p_id) --고유한 키 인덱스: 상품 아이디
)default CHARSET=utf8;

drop table product;