CREATE TABLE board (
   num int not null auto_increment, --�Խñ� ����
   id varchar(10) not null, --ȸ�� ���̵�
   name varchar(10) not null, --ȸ�� �̸�
   subject varchar(100) not null, --�Խñ� ����
   content text not null, --�Խñ� ����
   regist_day varchar(30), --�Խñ� ��� ����
   hit int, --�Խñ� ��ȸ ��
   ip varchar(20), --�Խñ� ��� �� IP
   PRIMARY KEY (num) --�Խñ� ������ ���� Ű�� ����
)default CHARSET=utf8;
