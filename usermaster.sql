-- �̹� ������ ������ ó���ϸ鼭 ����ϰ� �ִ� 
-- ���Ը������ ���������� �ִµ�
-- �� ���Ͽ� �ִ� ���Ը������� ����Ŭ Database�� �ű��

-- �ǹ��󿡼� ����ϴ� DataBase�� Table �з�
-- 1. master table
--  ��. �⺻���� ������ ��� �ִ� table
--  ��. ���� data�� �Էµǰ�, ��ȸ�Ǵ� table�� ���� ������ �����ϴ� table
--  ��. �ŷ�ó������ ������ table, ��ǰ������ ������ table
 
-- 2. work table
--  ��. ���÷� �����Ͱ� insert, update, delete�� �Ǿ
--      � ���� �帧�� �ľ��� �� �ִ� table

CREATE TABLE tbl_inout (
    io_id	NUMBER	NOT NULL	PRIMARY KEY,
    io_date	CHAR(10)	NOT NULL		,
    io_dept	VARCHAR2(20)	NOT NULL	,	
    io_inout	char(1)	NOT NULL,	    --1:����,2:����
    io_pro_name	VARCHAR2(20)	NOT NULL		,
    io_pro_qty	VARCHAR2(10)			,
    io_vat_check	CHAR(1)		,       --1:����,2:�鼼
    io_su	NUMBER			,
    io_dan	NUMBER			,
    io_sub_total	NUMBER	,           --�ܰ�*����
    io_vat	NUMBER	,                   --�����̸� �ݾ�/10
    io_total	NUMBER	                --�ݾ�+����
);

DESC tbl_inout;

-- ��ü ������ Ȯ��
select * from tbl_inout;

-- ��ü ������ ���� Ȯ��
select count(*) from tbl_inout;

-- �����ڷ� ���� Ȯ��
select count(*)
from tbl_inout
Group by io_inout;
-- ������ �������� �Ϸ�


-- master ���̺�� worktable�� �и�
-- ����ȭ ����
-- ���Ը������̺�(tbl_inout)���� ���� �ŷ�ó������ ��ǰ���� �и�

-- 1. �ŷ�ó���� master table ����
-- ��. ���Ը������̺�� ���� �ŷ�ó ������ ����
select * from tbl_inout group by io_dept;
-- GROuP by�� �����Ҷ��� Select �� ������ Į��(PROJECT Į��)�� ��� 
-- GROUP BY �׸� ���� �Ǿ�� �Ѵ�.
-- ��, GROUP BY�� ������ ���� SELECT * �ϸ� �ȵȴ�.
select io_dept from tbl_inout group by io_dept ORDER BY io_dept;

CREATE TABLE tbl_dept(
    d_code	CHAR(4)	NOT NULL	PRIMARY KEY,
    d_name	VARCHAR2(20)	NOT NULL,	
    d_ceo	VARCHAR2(20)	,	
    d_tel	VARCHAR2(15)	,	
    d_sid	CHAR(13)	,	
    d_addr	VARCHAR2(50)	,	
    d_man	VARCHAR2(20)	,	
    d_man_tel	VARCHAR2(15)		
);
desc tbl_dept;
select * from tbl_dept;
-- ��. �ŷ�ó master table�� ���� �Ϸ�
-- ��. ���Ը������ �ŷ�ó master�� �����ϵ��� ����


-- ���� ������� ���Ը������ �ŷ�ó������ JOIN�� �ؼ�
-- ������ ����


-- ������(��������) Į���ϰ�� BETWEEN�� ����ؼ� ������ �˻��� ����
-- �׷���, �������� ���������� ���� ��¥�� ���ڷ� ��ȯ�� INSERT�� �θ� ���� DATE������ �������� �ʾƵ� �ȴ�.
-- DB���� Į���� Date, DateTime������ �����ϸ� �ٸ� ���α׷� ���� DB�� �����Ͽ� �����͸� Insert,Select �Ҷ�
-- Date Type������ �������� ������ �߻��Ѵ�.
select * from tbl_inout 
where io_date between'2011-01-01' and '2011-05-31';

-- ���Ը������ �ŷ�ó������ JOIN
SELECT io_date, io_inout, io_dept, d_code,d_name,d_ceo FROM tbl_inout
LEFT JOIN tbl_dept ON tbl_inout.io_dept = tbl_dept.d_name
WHERE io_inout = '1' AND io_date = '2011-01-24';

-- ���� ����� ���Ը������ �ŷ�ó������ ������ �� �� ���ִ��� Ȯ���ϴ� ����
-- ����ȯ�濡���� d_name���� �����ϴ� ������ ������� �ʴ´�.
-- ���Ը����忡 �ŷ�ó�ڵ� Į���� �����, �ŷ�ó���� �������� �ŷ�ó �ڵ带 update�� ����

-- ���Ը����忡 �ŷ�ó�ڵ� Į���� �߰�
AlTER TABLE tbl_inout ADD(io_dept_code CHAR(4));

-- ������ �ŷ�ó�ڵ� Į���� �ŷ�ó �ڵ带 update�Ѵ�.
-- �ŷ�ó���� �ŷ�ó�������� �˻��ϰ�, �˻����ڵ带 UPDATE �Ѵ�.
UPDATE tbl_inout
set io_dept_code = 
(
    SELECT d_code FROM tbl_dept
    WHERE io_dept = d_name
);

select io_date, io_dept, io_dept_code from tbl_inout
WHERE io_date = '2011-01-24';

select io_dept_code, io_dept, d_name,d_ceo,d_tel
from tbl_inout 
    Left Join tbl_dept
        on io_dept_code = d_code
where IO_DEPT_CODE = 'D002';

-- �ŷ�ó �������� �ڵ尡 D002�� ȸ���� ��ȭ��ȣ�� 
-- 010-111-2222���� �ٲٰ� �ʹ�.
UPDATE tbl_dept
SET d_tel = '010-111-2222'
where d_code = 'D002';
 
-- 2. ��ǰ���� master ����
-- ��. ���Ը������̺��� ��ǰ�� ����
SELECT io_pro_name
from tbl_inout
group by io_pro_name
order by io_pro_name;

CREATE tablE tbl_product(
    p_code	CHAR(6)	NOT NULL	PRIMARY KEY,
    p_name	VARCHAR2(20)	NOT NULL	,
    p_item	VARCHAR2(20)		,
    p_qty	VARCHAR2(20)		,
    p_vat_check	CHAR(1)		,
    p_iprice	NUMBER		,
    p_oprice	NUMBER		,
    p_margin	NUMBER		
);

SELECT * FROM tbl_product;

-- ���Ը������ ��ǰ������ join �ؼ� ȭ��
SELECT io_pro_name , p_name
FROM tbl_inout
    LEFT JOIN tbl_product
        on io_pro_name = p_name
        WHERE p_code = 'P00004';

-- ���Ը����忡 ��ǰ�ڵ� Į���� �����
ALTER TABLE tbl_inout ADD(io_p_code CHAR(6));

-- ���Ը������� ��ǰ�ڵ� UPDATE
UPdATE tbl_inout
set io_p_code = 
(
    SELECT p_code
    FROM tbl_product
        WHERE p_name = io_pro_name
);

-- JOIN �� Ȯ��
select io_p_code, p_code, io_pro_name, p_name
FROM tbl_inout
    LEFT JOIN tbl_product
        ON io_p_code = p_code;

-- ���Ը������ ��ǰ������ JoIN ���Ը��� �ݾ� ���
select io_date, 
    DECODE(io_inout,'1','����','����') AS ����,
io_p_code, p_name, p_iprice, p_oprice,
    DECODE(io_inout,'1',io_su*p_iprice,0) as ���Աݾ�,
    DECODE(io_inout,'2',io_su*p_iprice,0) as ����ݾ�
from tbl_inout
    LEFT JOIN tbl_product
    ON io_p_code = p_code;

-- ���� ��ϵ� ���Ը������� �� ���Աݾװ�, �� ����ݾ� �׸��� ���� ���
-- ����Լ� �̿�
SELECT
    sum(DECODE(IO_inout,'1',io_su*p_iprice,0)) AS ���Աݾ�,
    sum(DECODE(IO_inout,'2',io_su*p_oprice,0)) AS ����ݾ�,
    
    sum(DECODE(IO_inout,'2',io_su*p_oprice,0)) -
    sum(DECODE(IO_inout,'1',io_su*p_iprice,0)) AS �����ͱ�
FROM tbl_inout
    LEFT JOIN tbl_product
        on io_p_code = p_code;
-- ��¥�� ���Ը��� �հ�
SELECT io_date,
    DECODE(io_INOut,'1','����','����') AS ����,
    sum(DECODE(io_inout,'1',io_su*p_iprice,0)) AS ���Աݾ�,
    sum(DECODE(io_inout,'2',io_su*p_iprice,0)) AS ����ݾ�
FROM tbl_inout
LEFT JOIN tbl_product on io_p_code = p_code
GROUP BY io_date, DECODE(io_INOut,'1','����','����')

UNION
SELECT '======','=',0,0 FROM DUAL -- DUMMY ���̺�
UNION

SELECT ' ��ü�հ�','',
    sum(DECODE(IO_inout,'1',io_su*p_iprice,0)) AS ���Աݾ�,
    sum(DECODE(IO_inout,'2',io_su*p_oprice,0)) AS ����ݾ�
FROM tbl_inout
    LEFT JOIN tbl_product
        on io_p_code = p_code;
        
-- ������(��)
-- ����Ŭ���� PK Į���� �����ϴ� AUTO INCREMENT �ɼ�(���)�� ����.
-- �׷��� �� ������� �������� �����ؼ� AUTO INCREMENT ó�� �����ϵ��� �� �� �ִ�.

-- ������ ����
CREATE SEQUENCE myAuto
START WITH 300 -- ���۰�
INCREMENT BY 1; -- ������

SELECT myAuto.NEXTVAL FROM dual;

ALTER TABLE tbl_inout DROP COLUMN io_dept ;
ALTER TABLE tbl_inout DROP COLUMN io_pro_name;

INSERT INTO tbl_inout
(io_id, io_date,io_inout, io_dept_code, io_p_code, io_su)
VALUES
(myAuto.NEXTVAL,'2018-08-30','1','D003','p00007',100);

INSERT INTO tbl_inout
(io_id, io_date,io_inout, io_dept_code, io_p_code, io_su)
VALUES
(myAuto.NEXTVAL,'2018-08-30','2','D003','p00007',100);

select * from tbl_inout
where io_date>'2018-08-01'
        
        
        
        
        
        
        