CREATE TABLE member(
	id 			varchar(10) not null, --회원아이디
	password 	varchar(10) not null, --비밀번호
	name 		varchar(10) not null, --이름
	gender 		varchar(4),	 --성별
	birth 		varchar(10), --생일
	mail 		varchar(30), --메일
	phone 		varchar(20), --전화번호
	address 	varchar(90), --주소
	regist_day 	varchar(50), --가입일자
	PRIMARY KEY(id) 		 --고유한 키 인덱스: 회원 아이디
) 	default CHARSET=utf8;