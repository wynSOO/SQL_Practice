/*===================================================
 * Q.
 * create table���� ����Ͽ� add_book(�ּҷ�) ���̺��� �ۼ��ϼ���.
 * ����̸�		no			������					not null		��Ű	
 * �̸�			name		����������(10)		not null
 * �ּ�			addr		����������(150)		not null
 * ����ó		tel			�������ڿ���(12)		not null
 * �̸���		email		�������ڿ���(50)	
 * 
 * addr_book ���̺� code(�����ȣ) Ŀ���� �߰��ϴ� ���� �ؾ���ȴ�. 
 * �� �÷��� �߰��϶�
 * code �������ڿ�(10) null�Ұ�
 * 
 * add_book ���̺��� �����ϰ� �ٽ� �����Ѵ�.
 * */

create table add_book(
no integer not null primary key,
name varchar(10) not null,
addr varchar(150) not null,
tel char(12) not null,
email char(50)
);

desc add_book;

alter table add_book
add column code char(10) not null;

drop table add_book;

show tables;

alter table add_book change no no integer(11) comment '��Ϲ�ȣ';
alter table add_book change name name varchar(10) comment '�̸�';
alter table add_book change addr addr varchar(150) comment '�ּ�';
alter table add_book change tel tel char(12) comment '����ó';
alter table add_book change email email char(50) comment '�̸���';
alter table add_book change code code char(10) comment '�����ȣ';

show full columns from add_book;

/*=========================================================*/









/*
�����ͺ��̽� ��������
�����ͺ��̽� ����(root):->
�����ͺ��̽��� ����� ������ ���(����):DCL(grant,revoke):root->
���̺� ����:DDL->
������ �Է�:INSERT:DML->
������ ��ȸ(select)/Ȱ��(update,delete):DML

create database <�����ͺ��̽���>;
show databases;

�����ͺ��̽��� �����Ѵ�.
use jspmysql;


���̺� ����
1.�÷�������
   ��� ��Ģ
1)�����ͺ��̽�, ���̺�, �÷�(�ʵ�)���� �̸��� ����� ���ڴ� 
    ������,����,�����(_)�� ��� �����ϴ�.
2)�̸� ù���ڴ� �����ڷ� �����Ѵ�.
3)���� ���̺� �ȿ��� �̸��� �ߺ��ؼ� ����ؼ��� �ȵȴ�.

2.�������� ����
1)��� �÷��� ���������� �ݵ�� �����ؾ� �Ѵ�.
2)������(INTEGER),  ���ڿ���(CHAR(���� ���ڿ���),VARCHAR(���� ���ڿ���)),  
    ��¥��(DATE,DATETIME) ���� �ִ�.

3.���� ����
1)�����̶� �����Ϳ� �����̳� ������ �߰��ϴ� ����̴�.
2)NULL �̶� ������ ���� ���¸� ���ϰ�, NOT NULL�̶� �ݵ�� �����Ͱ�
    �����ؾ����� ���Ѵ�.
3)�⺻ Ű(�����̸Ӹ� Ű)�� �ߺ��� ���� ������� �ʴ´�.    

Q.���̺� ����(tb_goods)
��ǰ���̵�			goods_id					char(8)						not null			�⺻Ű
��ǰ�� 				goods_name				varchar(80)				not null
��ǰ�з�			goods_type				varchar(20)				not null
�ǸŰ���			sell_price					int								null
���԰���			buy_price					int								null
�����				reg_date					��¥��						null
*/

/*���̺� ����:
 create table<���̺��>(
 	<����1><��������><��������><�⺻Ű>,
 	<����2><��������><��������>
 );
*/


/*���̺� ���� �÷��� �����ͺ��̽��� null �����*/
create table tb_goods(
	goods_id 			char(8)			not null  primary key,
	goods_name  	varchar(80) 	not null,
	goods_type		varchar(20) 	not null,
	sell_price			integer,
	buy_price 			integer,
	reg_date 			date
);
--char(8)�� ������ �÷��� abc�� ������ length(goods_id)�� ���� 8�� �ȴ�.
--varchar(20)�� ������ �÷��� office�� ������ length(goods_type)�� ���� 6�� �ȴ�.
	--�ý��� �ڿ��� �������� �ʴ´�.
--�������ڿ��� (�ֹι�ȣ, ��ǰ�� ���ڵ��ȣ,�����ȣ)�� char������ �Ѵ�.


/*���̺��� ���� Ȯ��*/
desc tb_goods;

 tb_goods;
/*���̺��� �÷��� �ڸ�Ʈ(�ּ�)�߰�*/
alter table tb_goods change goods_id goods_id char(8) comment '��ǰ���̵�';
alter table tb_goods change goods_name goods_name varchar(8) comment '��ǰ��';
alter table tb_goods change goods_type goods_type varchar(20) comment '��ǰ�з�';
alter table tb_goods change sell_price sell_price integer comment '�ǸŰ���';
alter table tb_goods change buy_price buy_price integer comment '���԰���';
alter table tb_goods change reg_date reg_date date comment '�����';
alter table tb_goods change goods_engname goods_engname varchar(100) comment '��ǰ������';

/*���̺��� �÷� �ڸ�Ʈ Ȯ��*/
show full columns from tb_goods;

--���̺��� ������ ������ �� ���:alter��(DDL:CREATE,Alter,drop)
/*�÷��� �߰��ϴ� alter��*/
alter table tb_goods
add column goods_engname varchar(100);

/*�÷��� �����ϴ� alter��*/
alter table tb_goods
drop column goods_engname;

/*�÷����� �����ϴ� alter��*/
alter table tb_goods
change selling_price sell_price integer;

/*tb_goods ���̺� ������ ����:DML*/
--insert into <���̺��> (������Ʈ)VALUES(�� ����Ʈ);
--�Է��ϴ� �����Ϳ� �÷��� ������ ���������� ��ġ�� �� ������ �����ϴ�.
insert into tb_goods 
values('0001','Ƽ����','�Ƿ�','10000','6000',now(),'t-shirt');
insert into tb_goods 
values('0002','����','�繫��ǰ','1000','600',now(),'ball pen');
insert into tb_goods 
values('0003','���̼���','�Ƿ�','28000','16000',now(),'y-shirt');
insert into tb_goods 
values('0004','��Į','�ֹ��ǰ','15000','8000',now(),'kichen knife');
insert into tb_goods 
values('0005','�з¼�','�ֹ��ǰ','35000','26000',now(),'pressure cooker');
insert into tb_goods 
values('0006','��ũ','�ֹ��ǰ','500','300',now(),'pork');
insert into tb_goods 
values('0007','����','�ֹ��ǰ','10000','6000',now(),'thomas');

/*���̺��� �����͸� ���:SELECT��*/
--select <����1><����2> FROM<���̺��>;
--<����>�� *�� ����ϸ� ����÷��̶�� �ǹ��̴�.
select*from tb_goods;

/*���̺���� ����*/
rename table
tb_goods to goods;

/*���̺� ����*/
drop table goods;

/*�����ͺ��̽��� �����ϴ� ���̺� Ȯ��*/
show tables;

/*=======================2018-06-01=================================*/
/*��ǰ���̵�,��ǰ��,���԰��ݸ� ���*/
--SELECT���� �Ϻ� �÷��� �����ؼ� ����� �� �ִ�. �̶� �÷����� ��ǥ�� �����ؼ� ����ϸ� �ȴ�.
select goods_id, goods_name, buy_price from goods;

/*�÷��� ������ �ٿ� ��� : ū����ǥ�� ����ϸ� ������ ������ �ѱ۵� ��밡��*/
select goods_id as "��ǰ ���̵�", goods_name as "��ǰ��", buy_price as "���԰���"
from goods;

/*�÷��� �ߺ��� �����͸� �ϳ��� ��� : � ��ǰ�з��� ��ϵǾ� �ִ���
   �˰� �ʹٸ� �ߺ��� ������ �����͸� ���� ��
   distinct Ű����� �ߺ� �����͸� �����ϰ� �÷��� �ش��ϴ� �����͸� ����Ѵ�.*/
select distinct goods_type as "��ǰ�з�" from goods;
select distinct reg_date as "��ǰ�з�" from goods;
select distinct goods_type, reg_date from goods;

/*���ǿ� �´� �����͸� ����ϰ��� �� �� where���� ����Ѵ�.
 * SELECT <����1>,<����2> FROM <���̺��>
 * WHERE <���ǽ�>;
 *�ֹ��ǰ�� ���� ��ǰ��� �ǸŰ����� ��� */
select goods_name,goods_type,sell_price from goods
where goods_type = '�ֹ��ǰ';		


insert into goods 
values('0008','�ݹ���','�Ƿ�','25000','15000',now(),'short');
insert into goods 
values('0009','��Ʈ','�繫��ǰ','1500','850',now(),'note');
insert into goods 
values('0010','��Ʈ��','�����ǰ','680000','550000',now(),'notebook');
insert into goods 
values('0011','���ǽ�','�Ƿ�','450000','150000',now(),'onpeace');
insert into goods 
values('0012','���찳','�繫��ǰ','500','300',now(),'eraser');

select * from goods;

/*��� ������(+,-,*,/)
 * ������ �÷� ������ �Ǹ�, null�� ������ ����� ������ null�� �ȴ�.
 */
select goods_name,sell_price, sell_price*1.3 as "30%�λ�� �ǸŰ���" from goods

/*�񱳿�����(= : ����,   <> : �ٸ���,   >= : �̻�,   <= : ����,   > : ũ��,   < : �۴�)
 * �񱳿����ڴ� where���� ����Ѵ�.
 */
/*�ǸŰ����� 15000�� �̻��� ��ǰ�� ���*/
select goods_name,goods_type,sell_price from goods
where sell_price>=15000;

/*�ǸŰ����� 15000���� ��ǰ�� ���*/
select goods_name,goods_type,sell_price from goods
where sell_price=15000;

/*�ǸŰ����� 15000���� �ƴ� ��ǰ�� ���*/
select goods_name,goods_type,sell_price from goods
where sell_price <> 15000;

/*��ǰ������� 2018.5.31('2018-05-31') ������(<=) ��ǰ ���
 * yyyy-mm-dd*/
select goods_name,goods_type,sell_price from goods
where reg_date='2018-06-01';

/*�ǸŰ����� ���԰��ݺ��� 5000�� �̻� ���̳��� ��ǰ�� ���*/
select goods_name,goods_type,sell_price,buy_price from goods
where sell_price-buy_price>=5000;

/*��ǰ�з��� null�� ��ǰ��(is null/is not null) ���*/
select goods_name ,goods_type  from goods
where goods_type is not null;


/*=======================2018-06-04================================*/

/*�� ������(not(~�� �ƴϴ�:�������� ������ �� ���),
 * and(����),or(����),true,false)*/ 

/*�ǸŰ��ݰ� 5000�� ���� ū ��ǰ�� ���*/
select goods_name,goods_type,sell_price from goods
where not sell_price <=5000;

/*and �����ڿ� or ������
 * Ư�� ���ǿ� �´� ��ǰ�� ����ϰ��� �� �� �񱳿����ڿ� �������ڸ� ���� ����.*/
select goods_name,goods_type,sell_price from goods
where goods_type='�ֹ��ǰ' and sell_price>=5000;

select goods_name,goods_type,sell_price from goods
where goods_type='�ֹ��ǰ' or sell_price>=5000;

/*�ڹٿ����� �񱳿����ڿ� �������ڸ� ������� �ݵ�� ���*/
/*if(goods_type.equals("�ֹ��ǰ") && sell_price>=5000){
	
	}
*/

insert into goods 
values('0013','�ϵ��ũ','�����ǰ','55000','35000',now(),'hdd');
insert into goods 
values('0014','����ũ','�����ǰ','25000','18000',now(),'dvd-rom');
insert into goods 
values('0015','�׷���ī��','�����ǰ','230000','180000',now(),'gpu');

select * from goods;

/*��ǰ�з��� �����ǰ�̰� ������� 2018-06-01 �Ǵ� 5�� 31���� ��ǰ�� �˻��϶�
 * and �����ڰ� or �����ں��� �켱������ ����.
 * ��ȣ�� ����ϸ� �켱������ �����Ҽ� �ִ�. ��ȣ�� �켱������ ���� ����.*/
select goods_name,goods_type,reg_date from goods
where goods_type='�����ǰ' and not reg_date='2018-06-04';

select goods_name,goods_type,reg_date from goods
where goods_type='�����ǰ' and ( reg_date='2018-05-31' or reg_date='2018-06-01');


/*
 * 1. goods ���̺��� ������� 2018�� 5�� 30�� ������ ��ǰ�� ����Ѵ�.
 * ��¿��� goods_name,reg_date�� �Ѵ�.
 */
select goods_name,reg_date from goods
where reg_date>='2018-05-30';

select goods_name,reg_date from goods
where goods_type='�����ǰ' and reg_date>='2018-6-4';

/*===================================2018.06.05====================*/


/*�ǸŰ����� ���԰��ݺ��� 5000�� �̻� ���̰� ���� ��ǰ ���*/
select goods_name,sell_price-buy_price as "����" from goods
where sell_price-buy_price>=5000;

select * from goods;
desc goods;

/*���̺��� ������ ������ ���� alter���� ���*/
/*���������� not null�� �߰�*/
alter table goods
modify goods_name varchar(80) not null;

alter table goods
modify goods_name varchar(80);


/*goods ���̺��� �ǸŰ����� 10%���� ������ 500������ ����
 * �ֹ��ǰ�� �繫��ǰ�� �����Ѵ�.*/
select goods_name,goods_type,sell_price*0.9 as "���ϰ���" from goods
where sell_price*0.9-buy_price>=500 and (goods_type = "�ֹ��ǰ" or goods_type = "�繫��ǰ");

/*����� ����*/

/*SQL������ �����Ϳ� ��� ó���� ����� �Ϸ��� �Լ��� ����Ѵ�.
 * ������� "���̺� ��ü�� ����� ����Ѵ�"�� ó���� �ϰ� ������
 * count�Լ��� ����Ѵ�. �̿ܿ��� SQL������ �پ��� �����Լ��� �����Ѵ�.
 * �����̶� ������ ���� �ϳ��� ������ �����ٶ�� �ǹ̴�.
 * 
 * count:���̺��� ���ڵ� ���� ����Ѵ�.
 * sum: �������� �Լ��� ���Ѵ�.
 * avg: ���ڿ� �������� ����� ���Ѵ�.
 * max: �������� �ִ밪�� ���Ѵ�.
 * min: �������� �ּҰ��� ���Ѵ�.
 */

/*���̺��� ��ü �� ���� ����Ѵ�.*/
/*count(*)���� *�� ��� ���� �ǹ��Ѵ�. *�� �μ� �Ǵ� �Ķ����,�Ű�������� �θ���.
 *count()�Լ��� �μ��� ���� ������� �޶�����.
 * null�� ������ ����� ���Ѵ�. count(�÷� ��)
 */
select count(*) from goods;
select count(buy_price) from goods;

/*�հ踦 ���Ѵ�. sum() �Լ��� ����ؼ� �ǸŰ����� �հ踦 ������. int���� ����*/
select sum(sell_price) from goods;

select sum(sell_price) as "�ǸŰ�", sum(buy_price) as "���԰�"from goods;
select sum(sell_price) - sum(buy_price) as "����"from goods;

/*��հ��� ���Ѵ�. avg() �Լ��� ����ؼ� �ǸŰ����� ��հ��� ������.*/
select avg(sell_price) from goods;

select sum(sell_price) as "�ǸŰ�", count(sell_price) as "�� ��", avg(sell_price) as "���"from goods;

/*�ִ񰪰� �ּҰ� ���ϱ�. �ǸŰ����� �ִ񰪰� ���� ������ �ּڰ��� ������*/
select max(sell_price), min(buy_price ) from goods;

select count(distinct goods_type) as "��ǰ�з�" from goods;

select distinct goods_type from goods;

select sum(sell_price) as "�Ǹ� ����",sum(distinct sell_price) as "�ߺ��� �ǸŰ�������" from goods;


/*======================================20180608==================================================*/

/*���̺��� �׷����� ������.*/
/*group by�� ���̺��� ��� �׷����� ����� ������ �� ����Ѵ�.
 * group by�� ������ ���� ���� Ű �Ǵ� �׷�ȭ ���̶�� �θ���.
 * select�� ���������� group by���� ������ ���� ��ǥ�� �����Ͽ� ������ �� �ִ�. 
 * ~��:group by ~*/

/*��ǰ�з��� ��ǰ ������ ���*/
select goods_type,count(*) from goods
group by goods_type;

/*���԰��ݺ��� �� ���� ���*/
select buy_price,count(*) from goods
group by buy_price;

/*where���� ����� ��� group by ����: 
 * where������ ������ �������� ���ڵ带 ���� ������ �� ������ �̷������.
 * ��ǰ�з����� �ǸŰ����� 5000�� ���� ū ��ǰ�� ��հ���*/
select goods_type as "��ǰ�з�" ,avg(sell_price) as "��հ���" from goods
where sell_price>=5000
group by goods_type;

select goods_type,sell_price,buy_price , count(*) from goods
where sell_price>=5000
group by goods_type;

select goods_type,sell_price from goods;


/*���԰��ݺ� �Ƿ� ��ǰ�� ����*/
select buy_price , count(*) from goods
where goods_type="�Ƿ�"
group by buy_price;

/*�׷�ȭ�� ����� ������ �����Ѵ�.*/
/*group by�� �׷��� ������ ����� ���� �� �־���. �׷쿡 ���� ������ �����Ͽ�
 * �����ϱ� ���� having�� ����Ѵ�. 
 * having�� group by�ڿ� ����Ѵ�. 
 * where�� �ڿ� ���� ������ �����ϰ� having�� �׷쿡 ���� ������ �����Ѵ�.*/

/*��ǰ�з��� ������ �׷쿡�� ���ԵǴ� �� ���� 3���ΰ��� ����*/
select goods_type , count(*) from goods
group by goods_type
having count(*)=3;

/*��ǰ�з��� ����ǸŰ����� 2500�� �̻��� ��ǰ�з�*/
select goods_type, avg(sell_price) from goods
group by goods_type
having avg(sell_price)>=2500;

select goods_type ,sell_price  from goods
where goods_type="�Ƿ�" and avg(sell_price)>=2500 ;

/*�˻������ �����Ѵ�.
 * �˻������ �����Ϸ��� order by�� ����Ѵ�.
 * order by �ڿ��� asc,desc�� ���̸� �������� �Ǵ� ������������ �����Ѵ�.
 * �⺻���� asc�̴�.*/

/*�ǸŰ����� ���� ��(��������)���� �����Ѵ�.*/
select goods_name, sell_price from goods
order by sell_price asc;

/*�ǸŰ���(1����)�� ���� ������ ��ǰ���̵�(�ߺ��� ���ð��)�� ���������� �����϶�*/
select goods_id, sell_price from goods
order by sell_price desc, goods_id asc;


/*��ǰ�з�����  ����ϰ� ��ǰ�з��� ��ǰ ���� ���� ������ ����*/
select goods_type , count(*) from goods
group by goods_type
order by count(*);

select goods_id, goods_name,sell_price from goods
order by 3 desc , 1 asc;

/*��������*/
/*�ǸŰ��� �հ谡 ���԰��� �հ躸�� 1.5�� �̻� ū ��ǰ�з��� ���ϴ�
 * select���� �ۼ��ϼ���. */
select goods_type, sum(sell_price), sum(buy_price) from goods
group by goods_type
having sum(sell_price)>=sum(buy_price)*1.5;

select goods_type, sum(sell_price), sum(buy_price) from goods
group by goods_type
having sum(sell_price)/sum(buy_price)>=1.5;


/*������ ���*/
/*
 * insert��:�����̳� ���� ��ȣ�� ���Ѵ�.
 * null���� �Է��Ϸ��� null�� �����Ѵ�.
 * �ٸ� ���̺��� ������ ������ �ͼ� �Է��� �� �ִ�.
 * ���̺� ���� default��� ���� ���� �⺻���� ������ �� �ִ�.
 * 
 * insert���� �⺻����
 * insert into <���̺��>(��1, ��2, ��3...) values (��1, ��2....);
 * �� ����Ʈ�� �� ����Ʈ�� ������ ��ġ�ؾ��Ѵ�.*/

create table js_goods(
	goods_id 			char(8)				not null  primary key,
	goods_name   varchar(100)		 	not null,
	goods_type		varchar(20) 		not null,
	sell_price			 integer default 0, /*���̺� ���� �� default ����*/
	buy_price 			integer default 0,
	reg_date 			date
);
 /*���� insert : Oracle���� ����*/
insert into tb_goods values
('0001', '��Ʈ', '�Ƿ�', '25000','15000',now()),
('0002', '������', '�Ƿ�', '65000','35000',now()),
('0003', '��Ƽ', '�Ƿ�', '18000','10000',now()),
('0004', '�е�', '�Ƿ�', '230000','160000',now());

insert into tb_goods values
('0005', '������', '�ֹ��ǰ', '500',null,now()),
('0006', '������', '�ֹ��ǰ', '400',null,now());

select * from tb_goods;
desc tb_goods;

/*���̺� ���� �⺻��(�ʱⰪ)�� ������ �� �ִ�. 
 *�⺻���� �����Ǿ� ���� ������ null���� ����.*/

insert into tb_goods values
('0007', '�׸�', '�ֹ��ǰ', default,'800',now());

desc js_goods;
select * from js_goods order by goods_id;

insert into js_goods values
('0001', '��Ʈ', '�Ƿ�', '25000','15000',now()),
('0002', '������', '�Ƿ�', '65000','35000',now()),
('0003', '��Ƽ', '�Ƿ�', '18000','10000',now()),
('0004', '�е�', '�Ƿ�', '230000','160000',now()),
('0005', '������', '�ֹ��ǰ', '500',null,now()),
('0006', '������', '�ֹ��ǰ', '400',null,now()),
('0007', '�׸�', '�ֹ��ǰ', default,'800',now());


/*insert...select���� ����Ͽ� �ٸ� ���̺��� ������ �����Ѵ�.*/
create table copy_goods(
	goods_id 			char(8)				not null  primary key,
	goods_name   varchar(100)		 	not null,
	goods_type		varchar(20) 		not null,
	sell_price			 integer default 0, /*���̺� ���� �� default ����*/
	buy_price 			integer default 0,
	reg_date 			date
);

show tables;

insert into copy_goods select * from js_goods;
select * from copy_goods;

create table tp_goods(
	goods_type		varchar(20) 		not null primary key,
	sell_price			 integer default 0, /*���̺� ���� �� default ����*/
	buy_price 			integer default 0
);

/*tb_goods ���̺��� �ǸŰ����� �հ� ���԰����� ���� ��ǰ�з����� 
 *�����ؼ� tp_goods ���̺��� ��ǰ�з�, �ǸŰ���, ���԰��� ���� �����Ѵ�. */

insert into tp_goods select goods_type, sum(sell_price), sum(buy_price) from tb_goods 
group by goods_type;

select * from tp_goods;


/*������ ����:delete*/
/*���̺� ���� : drop table <���̺��>,
 * ���̺� ���� �����͸� �����ϴ� SQL���� delete���̴�.
 * delete���� ���� ����� ���� �ƴ϶� ���̴�.
 * �⺻����
 * delete from <���̺��> where <����>*/

delete from copy_goods;
select * from tb_goods;

delete from js_goods 
where sell_price>=40000;


/*�������� ���� update*/
/*�����͸� �߸� ����� ��쿡 update���� 
 *����ؼ� ���̺� �����͸� ������ �� �ִ�. 
 *update<���̺��>set<����>=<��>*/
/*��� ���� �����ϴ� update��*/
update js_goods set reg_date='2018-06-10';

/*������ �����ϴ� update��*/
update tb_goods set sell_price = sell_price*0.9
where goods_type = '�ֹ��ǰ';

/*null������ ������ �� ������?*/
update tb_goods set reg_date = null
where goods_id='0007';


/*���� �� ����:������ ���� ���� ������� ����� �� �ִ�.*/
update tb_goods set sell_price = sell_price*2
where goods_type='�ֹ��ǰ';
update tb_goods set buy_price = buy_price/2
where goods_type='�ֹ��ǰ';

update tb_goods set sell_price = sell_price*2, buy_price = buy_price/2
where goods_type='�ֹ��ǰ';

update tb_goods set sell_price, buy_price = sell_price*2, buy_price/2
where goods_type='�ֹ��ǰ';






 
/*Ʈ�����(Transaction)*/
/*
 * Ʈ������� �����ͺ��̽����� �̷������ �ϳ� �̻��� ���� ó���� ���Ѵ�.
   ��, ������ ó���� ���������� �����ϴ� ���̴�.
 * �Ǹźο��� "������ ȸ�ǿ��� ���̼����� �ǸŰ����� 1000�� ������
   Ƽ������ �ǸŰ����� 1000�� �ø���� �����ؼ� �� ���� ������ �����ͺ��̽���
   �ݿ��� �ּ���."��� ���Ѵٸ� "�� ��ô ������ ���Դϴ�."��� ����� ���̴�.
   �� �� Ʈ������� �ΰ��� �������� �����ȴ�.
 * ��� ��ǰ ���� Ʈ�����
 * 1.���̼��� �ǸŰ����� 1000�� ������.
 * update goods set sell_price = sell_price-1000
 * where goods_name='���̼���';
 * 2.Ƽ���� �ǸŰ����� 1000�� �ø���.
 * update goods set sell_price = sell_price+1000
 * where goods_name='Ƽ����';
 * 
 * 1�� 2ó���� �ݵ�� ��Ʈ�� ����Ǿ� �Ѵ�. �̿� ���� "�ϳ��� ��Ʈ�� ����Ǿ� �� 
 * ���� ������ Ʈ��������� ��Ƽ� ����Ѵ�."
 * 
 * Ʈ������� �������
 * 
 * Ʈ����� ���ù�;(SQL:begin transaction;, MySQL : start transaction;)
 * DML��;
 * DML��;
 * DML��;
 * ...
 * Ʈ����� ����;(commit, rollback)
 */
start transaction;
	update goods set sell_price = sell_price-1000
    where goods_name='���̼���';
	update goods set sell_price = sell_price+1000
 	where goods_name='Ƽ����';
commit;

/*ó��Ȯ��-commit
 * commit�̶� Ʈ����ǿ� ���� ���� ������ ��� �ݿ��� �� Ʈ������� �����ϴ� ����̴�. 
 * ���� �߸��� ������ Ʈ��������� ó���ϸ� �ٽ� ���̺��� ���� �����͸� �����ؾ��Ѵ�.
 * �ſ� ������ ������ ��ƾ� �Ѵ�.
 * commit�� ������ ���ǰ� ĥ���Ѵ�.
 * ó�����-rollback
 * rollback�� Ʈ����ǿ� ���� ó���� ���� ������ ����ϰ� Ʈ������� �����ϴ� ����̴�.
 * �ѹ��ϸ� �����ͺ��̽� ���°� Ʈ����� ���� ������ ���ư���.
 */

/*������ ���� �Ǹ����� ���� ���� goodsprofit(��ǰ����) ���̺��� ���� �� goods ���̺�κ��� 
 * ������ ����ؼ� ��ǰ �Ǹ� ���� �����͸� ����ϴ� sql���� �ۼ��ϼ���.
 * ����=�ǸŰ���-���԰���
 */

create table goodsprofit(
goods_id char(4) not null primary key,
goods_name varchar(100) not null,
sell_price integer,
buy_price integer,
profit integer 
);

insert into goodsprofit( goods_id, goods_name, sell_price,buy_price,sell_price-buy_price) 
select goods_id, goods_name, sell_price,buy_price,sell_price-buy_price from goods;

 select * from goodsprofit;

--�����͸� ����� goodsprofit ���̺� ���� ������ ���� ������ �����Ϸ��� �Ѵ�.
/*1. �ݹ��� �ǸŰ����� 25000������ 20000������ ������.
 * 2.1�� ����� �ݿ��ؼ� �ݹ��� ������ �����Ѵ�.
 */

update goodsprofit set sell_price = 20000
where goods_id='0008';

update goodsprofit set profit = sell_price - buy_price
where goods_id='0008';



/*��(view) : ���� ����ϴ� select���� ��� ����� �ݺ��ؼ� ���
   1.SQL �������� ���� ��� ���̺�� ����.
   2.��� SELECT���� �����ϰ� ���̺��� �����͸� �����Ѵ�.
   3.���� ����ϴ� SELECT���� ��� ���� �ݺ������� ����Ѵ�.
   4.�並 ������� CREATE VIEW���� ����Ѵ�.
   5.�並 �����Ϸ��� DROP VIEW���� ����Ѵ�.
   6.�信 ���� ����(INSERT, UPDATE, DELETE)ó���� �Ұ����ϴ�.
   7.�信�� ORDER BY�� ����� �� ����.*/

/*�䰡 ������ ����
  1.�����͸� �������� �ʱ� ������ ��� ��ġ �뷮�� ������ �� �ִ�.
  2.���� ����ϴ� SELECT���� ��� ���� �ݺ������� ���������
     SELECT���� ����� ���� ���� �� �ִ�.
  3.�信 ���Ե� �����ʹ� �� ���̺�� �����ؼ� �ڵ����� �ֽŻ��¸� �����Ѵ�.*/
  
/*�� �ۼ� ���
   create view���� ����Ѵ�.
   create view ���(���� ����1,���� ����2....) as <select��> */
   

--��ǰ������ �հ�(goods_sum)�̶�� ��Ī���� �����ͺ��̽��� �並 ��������.
--��ǰ�з����� ��ǰ������ �����Ѵ�.
create view goods_sum(goods_type,goods_count) as 
select goods_type,count(*) from goods group by goods_type;

drop view goods_sum;

--������ ���� ������
show grants for jspid;


	--DCL : MySQL 5.5 Command Line Client���� Loot �������� ����
	--jspid���� ��� �����ͺ��̽� ������ �����Ѵ�.
	grant all privileges on *.* to jspid@localhost identified by 'jsppwd' with grant option;
	--jspid���� jspmysql �����ͺ��̽��� ���� ��� ������ �����Ѵ�.
	grant all privileges on jspmysql.* to jspid@localhost identified by 'jsppwd';
	
--1.�� �˻�
--1.�信 ����� select�� ����
--2.�� ����� ���� �並 from���� ������ select���� ����ȴ�.
--3.where,group by, having�� ����� �� �ִ�.

select goods_type, goods_count from goods_sum;

select goods_type, goods_count from goods_sum
where goods_type = '�����ǰ';


/*��������
 * ���깹���� �並 ������� �ϴ� �����, ���������� Ư¡�� �Ѹ����
 * �����ϸ� '��ȸ�� ��'�̴�. ��� ������ ��ü�� �����ϴ� ���� �ƴ϶�
 * �����͸� �����ϴ� select���� �����ϴ� �������, ����� ���Ǽ��� 
 * ����Ű�� ������. �ݸ�, ���깹���� �� ���� select���� �״�� from��   
 * �����ϴ� ���̴�.
 * 
 * �������� ��������� 
 * from�� ���� select���� ���� ����ǰ� �� �ڿ� �ٱ��� select���� ����ȴ�.
 */

select goods_type, goods_count as "����" from(
	select goods_type,count(*) as goods_count from goods
	group by goods_type) as goods_sum;

select goods_name, sell_price from goods
where sell_price > (select avg(sell_price) from goods);
--��Į�� ��������(Scalar subquery):���ǽ�(where��)�� �ַ� ���Ǵ� select�� 

select goods_name,sell_price,(select avg(sell_price) from goods) as "��հ���" from goods;

select goods_name,sell_price,avg(sell_price) from goods
group by goods_type
having avg(sell_price)>(select avg(sell_price) from goods);

select goods_type,avg(sell_price) ,(select avg(sell_price) from goods) from goods
group by goods_type
having avg(sell_price)>(select avg(sell_price) from goods);


/*�Լ�(function):������ ����� {}(�ڵ���)���� ��� �и��� ��.
   �� �ڵ������� �и��ϳ���? "����"�ϱ� ���ؼ� �и��Ѵ�.
   �Լ��� SQL�� ������ �ִ� ���� �����̴�.
   �Լ��� � ���� �Է��ϸ� �׿� �����ϴ� ���� ����ϴ� ����̴�.
   �̶� �Է��� �μ�(�Ķ����)��� �ϸ�, ����� ��ȯ���̶�� �Ѵ�.*/
    
--����Լ�:abs(m), mod(m,n)=m/n�� ������,round(��� ��,�ݿø� �ڸ���) = �ݿø�
--���ڿ��Լ�:���ڿ� ó���� ���� �Լ�
--��¥�Լ�:��¥ ó���� ���� �Լ�
--��ȯ�Լ�:���������̳� ���� ��ȯ�ϱ� ���� �Լ�
--�����Լ�:count(),sum(),avg(),max(),min()


/*����Լ�
 * �������� numeric�� numeric(��ü�ڸ���,�Ҽ� �ڸ���)�������� ��ġ�� ũ�⸦ �����Ѵ�.
 */

--DDL:���̺� ����
create table samplemath(
	m numeric(10,3),
	n integer,
	p integer
);

show tables;
 
--DCL:���� �ο�(grant,revoke)
--DML

start transaction;

insert into samplemath values(500,0,null),(-180,0,null),(null,null,null),
(null,7,3),(null,5,2),(null,4,null),(8,null,3),(2.27,1,null),
(5.555,2,null),(null,1,null),(8.76,null,null); 

commit;

select * from samplemath;

--����Լ� abs(m)�� ����(absolute value)�� ���ϴ� �Լ��̴�.
select m,abs(m) as "����" from samplemath;

--mod(m,n)�� �������� ������ ���� ���ϴ� �Լ��̴�.
select n,p,n%p as "������" from samplemath;
select n,p,mod(n,p) as "������" from samplemath;

--****round(����, �ݿø� �ڸ���)****---
select m,n,round(m,n) as "�ݿø���" from samplemath;

/*���ڿ� �Լ�
   ���ڿ� ġȯ,�߶󳻱�,���� ���� ���ڿ� ó���� ���� ���ȴ�.
   ddl:���̺� ����*/
create table samplestr(
	str1 varchar(40),
	str2 varchar(40),
	str3 varchar(40)
);

desc samplestr;

start transaction;
	insert into samplestr values
	('������','��',null),('abc','def',null),('��','ö��','�Դϴ�.'),
	('aaa',null,null),(null,'������',null),('ABC',null,null),
	('aBC',null,null),('abcdefabc','abc','ABC'),('���̿�','��','��');
commit;

select * from samplestr;

--concat(str1,str2) �Լ� : ���ڿ��� �����ϴ� �Լ�(+:���ڿ� ���� ������)
select str1,str2,concat(str1,str2) as '���ڿ� ����' from samplestr;
select str1,str2,str3,concat(str1,str2,str3) as '���ڿ� ����' from samplestr;

--length(���ڿ�):���ڿ� ���̸� ��ȯ�Ѵ�.�����ڴ� 1byte,�ѱ�,�Ϻ���,�߱���� ��Ƽ����Ʈ(2byte �̻�)�̴�.
select str1,length(str1) as '���ڿ� ����'from samplestr;

--lower(���ڿ�):���ĺ����� ����Ǵ� �Լ��� �μ��� ���ڿ��� ��� �ҹ��ڷ� ��ȯ�Ѵ�.
--upper(���ڿ�):���ĺ����� ����Ǵ� �Լ��� �μ��� ���ڿ��� ��� �빮�ڷ� ��ȯ�Ѵ�.
select str1,lower(str1) as '�ҹ���'from samplestr;
select str1,upper(str1) as '�빮��'from samplestr;

--substring(��� ���ڿ� from �߶󳻱� ���� for �߶� ���ڼ�)�� ���ڿ����� �Ϻ� ���ڸ� �����Ѵ�.
select str1,substring(str1 from 3 for 2) as '���ڿ� �߶󳻱�'from samplestr;
 
--����:��ȯ ���� ������(true,false,unknown)�� �Լ��� ����Ų��.
--like, exists, between, in, is null, is not null

create table samplelike(
	strcol varchar(6) not null primary key
);

desc samplelike;

insert into samplelike values 
('abcddd'),('dddabc'),('acdddb'),('abcdd'),('ddabc'),('abddc');

select * from samplelike;

--like����(�߿�):�˻� ������ ������ �� ���� ����Ѵ�.
--������ġ,�߰���ġ(��),�Ĺ���ġ
	
--������ġ �˻� ����
select * from samplelike
where strcol like 'dd%';
   	
--�߰���ġ �˻� ����
select * from samplelike
where strcol like '%dd%';
   	
--�Ĺ���ġ �˻� ����
select * from samplelike
where strcol like '%dd';
   
--%��ſ�'_'(�����)�� ����� �� ������ %�ʹ� �ٸ��� ������ 1���ڸ� �ǹ��Ѵ�.
--%�� �˻��ؼ� ������� �ʹ� ���� ���ö� '_'�� ����ؼ� �˻��Ѵ�.
select * from samplelike
where strcol like '__dd__';
    
--between����:���� �˻�
--between�� Ư¡�� ��ش��� ��(100~1000�϶�, 100�� 1000)�� ���Եȴٴ� ���̴�.
--������� goods ���̺��� �ǸŰ����� 100�� ���� 1000�������� ��ǰ�� ��ǰ��� �ǸŰ����� ����϶�.
select goods_name,sell_price from goods
where sell_price>=100 and sell_price<= 1000;

select goods_name,sell_price from goods
where sell_price between 100 and 1000;

--in����:or�� ��������
--���԰����� 300��,600��,6000���� ��ǰ�� ����϶�.
select goods_name,buy_price from goods
where buy_price =300 or buy_price =600 or buy_price =6000;

select goods_name,buy_price from goods
where buy_price in (300,600,6000);

--exists ����:exists ����� � ���ǿ� ��ġ�ϴ� ���ڵ尡 �����ϴ��� ���θ� �����ϴ� ���̴�.
										


-- �١ڡ١ڡ١�  ����(JOIN) �١ڡ١ڡ١�
-- �ٸ� ���̺��� �÷��� ������ �ͼ� "�÷��� �ø��� ���� ����"�̴�.
-- ���ΰ���, �ܺ� ����, ũ�ν� ������ �ִ�. ������ ���� ���ո� ���� ����Ѵ�.
-- ������ �÷� ����(�� ����, ���� ����)���� �����Ѵ�.

-- ���� ��ǰ ��� ���̺�
create table st_goods(
	store_id char(4) not null,
	goods_id char(4) not null,
	store_name varchar(200) not null,
	num integer not null,
	primary key(store_id,goods_id)
); 

insert into st_goods values 
('000a','0001','����',30),
('000a','0002','����',50),
('000a','0005','����',15),
('000b','0002','����',20),
('000b','0005','����',25),
('000b','0012','����',85),
('000b','0008','����',10),
('000c','0002','����',25),
('000c','0005','����',55),
('000c','0007','����',35),
('000d','0002','�λ�',15),
('000d','0009','�λ�',65);
   
select * from st_goods;

select goods_id,num,store_name 
from st_goods 
where store_name='����';

-- ���ΰ���(inner join)
-- ���� ���� ����Ѵ�. goods ���̺�� st_goods ���̺� ���� �����ϴ� ���� ��ǰ ���̵��̴�.
-- �����̶�� ������ �Ѹ���� ���ϸ� ���̺�鿡 ���� �����ϴ� ���� 
-- �ٸ��� ����ؼ� �ٸ� ���̺��� ������ �ϳ��� ����� ���Խ�Ű�� ���̴�.

-- st_goods ���̺��� ������ ���̵�, ��ǰ ���̵�, ������ �̷� �����ʹ� ������
-- ��ü���� ��ǰ��, �ǸŰ��ݵ��� �� �� ����. ��ü���� ��ǰ��, �ǸŰ��ݵ��� goods ���̺� �ִ�.
-- ���� st_goods ���̺�� goods ���̺��� ���� �����Ͽ� ��ǰ��� �ǸŰ��� �÷��� st_goods�� �����´�.

-- inner join : ���� ���� �� ����ϴ� Ű����
-- goods inner join st_goods
-- ���ΰ������� ������ �ۼ��� �� <���̺��>.<�÷���>

select g.goods_id, st.goods_id, st.store_id, st.store_name, g.goods_name, g.sell_price, st.num
-- 3. SELECT ���� ����ϴ� ���̴�.
from st_goods as st INNER JOIN goods as g
-- 1. FROM ���� ���� ����Ѵ�.
-- �ϳ��� ���̺� ����ߴµ�, �� ���� ���̺��� ����ߴ�.
-- �̰��� �����ϰ� ����� ���� INNER JOIN �̴�.
-- �Ϲ������� ���̺��� ��Ī�� ����Ѵ�.
on st.goods_id = g.goods_id;
-- 2. ON�ڿ� ����ϰ� �ִ� ���� ���������̴�.
-- ���⼭ �� ���� ���̺��� ������ ��(���� Ű)�� �����Ѵ�.
-- ON�� ���� ���� ���� WHERE���̶�� �� �� �ִ�.
-- ON���� ������ ������ ����.
-- ��� ��ġ�� FROM�� WHERE�� ���̿� ����Ѵ�.
-- ON�� �������� �� ���̺� ���̿� �ٸ� ������ �Ѵ�.

select st.store_id, st.store_name, st.goods_id, g.goods_name, g.sell_price, st.num
from st_goods as st INNER JOIN goods as g
on st.goods_id = g.goods_id
where st.store_id = '000c';


-- ���� ����ϴ� ������ �������� ��� ����켭 �並 ��ȸ�ϴ� ����� ����Ѵ�.
create view store(store_id,store_name,goods_id,goods_name,sell_price,num)
as
select st.store_id, st.store_name, st.goods_id, g.goods_name, g.sell_price, st.num
from st_goods as st INNER JOIN goods as g
on st.goods_id = g.goods_id;


select store_name,goods_name,num from store;

-- �׷����(���ڰ����ý���), ERP-SOLUTION, 


-- ���� �̻��� ���̺��� ����� ����
-- ������ �⺻������ �� ���� ���̺��� �����ϴ� ��������,
-- �� �� �̻��� ���̺��� ������ �� �ִ�.
-- ������ �� �ִ� ���̺� ���� ��Ģ������ ������ ����.
-- ���翡 ��ǰ ��� �����ϴ� ���̺��� �ִ�. s001�� s002��� �� â�� ��ǰ�� �����Ѵ�.

create table storage(
	storage_id char(4) not null,
	goods_id char(4) not null,
	stock_num integer not null,
	primary key(storage_id, goods_id)
);

show tables;

insert into storage values 
('s001','0001',0),
('s001','0002',100),
('s001','0003',45),
('s001','0007',35),
('s001','0009',25),
('s002','0001',50),
('s002','0002',75),
('s002','0005',25),
('s002','0008',124),
('s002','0011',68);

select * from storage;

select sum(stock_num) as '1��â�� ���' from storage
where storage_id = 's001';


select st.store_id, st.goods_id, st.store_name, g.goods_name, g.sell_price, g.buy_price, sg.storage_id, sg.stock_num
from st_goods as st inner join goods as g
on st.goods_id = g.goods_id
	inner join storage as sg
	on sg.goods_id = st.goods_id
where sg.storage_id = 's002';

