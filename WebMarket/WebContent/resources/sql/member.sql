CREATE TABLE member(
	id 			varchar(10) not null, --ȸ�����̵�
	password 	varchar(10) not null, --��й�ȣ
	name 		varchar(10) not null, --�̸�
	gender 		varchar(4),	 --����
	birth 		varchar(10), --����
	mail 		varchar(30), --����
	phone 		varchar(20), --��ȭ��ȣ
	address 	varchar(90), --�ּ�
	regist_day 	varchar(50), --��������
	PRIMARY KEY(id) 		 --������ Ű �ε���: ȸ�� ���̵�
) 	default CHARSET=utf8;