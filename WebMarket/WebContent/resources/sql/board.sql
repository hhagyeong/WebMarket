CREATE TABLE board (
   num int not null auto_increment, --게시글 순번
   id varchar(10) not null, --회원 아이디
   name varchar(10) not null, --회원 이름
   subject varchar(100) not null, --게시글 제목
   content text not null, --게시글 내용
   regist_day varchar(30), --게시글 등록 일자
   hit int, --게시글 조회 수
   ip varchar(20), --게시글 등록 시 IP
   PRIMARY KEY (num) --게시글 순번을 고유 키로 설정
)default CHARSET=utf8;
