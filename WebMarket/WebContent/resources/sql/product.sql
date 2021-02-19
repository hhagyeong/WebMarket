CREATE TABLE IF NOT EXISTS product(
	p_id VARCHAR(10) NOT NULL, --��ǰ ���̵�
	p_name VARCHAR(30), --��ǰ��
	p_unitPrice INTEGER, --��ǰ ����
	p_description TEXT, --��ǰ �� ����
	p_category VARCHAR(20), --��ǰ ī�װ�
	p_manufacturer VARCHAR(20), --��ǰ ������
	p_unitsInStock LONG, --��ǰ ��� ��
	p_condition VARCHAR(20),  --��ǰ ����
	p_filName VARCHAR(20), --��ǰ �̹��� ���ϸ�
	PRIMARY KEY (p_id) --������ Ű �ε���: ��ǰ ���̵�
)default CHARSET=utf8;

drop table product;