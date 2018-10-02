-- 1. �ڽ��� ����� TABLESPACE�� ���� ����
CREATE tablespace userTS
DATAFILE 'D:\oData\userts.dbf'
size 100m AUTOEXTEND on next 100;

-- 2. DEFALT�� ����
ALTER USER user1 DEFAULT TABLESPACE userTS;

-- 3. TABLE ����
CREATE TABLE test(
    ID NUMBER, -- �ִ� 40�ڸ����� ���� ����
    NAME VARCHAR2(20),
    POSTCODE CHAR(5),
    ADDR VARCHAR2(50),
    TEL VARCHAR2(15),
    GRADE NUMBER(5,2) -- ��ü�ڸ��� 5�ڸ�, �Ҽ������� 2�ڸ�
);

-- ���̺� ���� Ȯ��
DESC test;

-- ���̺� ����
DROP TABLE test ;

-- ������ �߰� 
INSERT INTO test (name,addr,tel) VALUES('ȫ�浿','�����','02');
-- �ʿ��� �÷��� �����ؼ� �߰�

INSERT INTO test VALUES(1,'�̸���','61182','����','042',90);
-- ��ü �÷��� �߰�

-- ������ Ȯ��
select * from test;

-- DCL(Data controll lang)
commit;
   
-- ������ ����
DELETE from test;

ROLLBACK;

SELECT * from test;

INSERT INTO test VALUES(2,'�̸���','61182','����','042',90);
INSERT INTO test VALUES(3,'������','61182','����','042',90);

commit; -- Insert, UPDATE, DELETE �� ������ ����� ���� DB�� �ݿ�
select * from test;

rollback; -- commit ���Ŀ� ����� INSERT, UPDATE, DELETE�� ���
-- ROLLBACK�� �������� �Ǽ��� UPDATE, DELETE�� ����������
-- ���� ���·� �ǵ����� ���
-- ROLLBACK�� �ʵǴ� ���
-- COMMIT �� �������� ��, DDL ����� �������� ��
-- TRUNCATE ��� = DELETE ��ɰ� ����
-- TRUNCATE ����� ������ �Ŀ��� ROLLBACK���� �ǵ����� ����.

-- TABLE �����ؼ� ��ü �����͸� �����ϴ� ��� 3����
-- 1. DELETE FORM [table]�� WHERE ���� ������ ���
-- 2. DROP TABLE >> �ƿ� TABLE ��ü�� ����
-- 3. TRUNCATE TABLE >> TABLE�� �����ߴٰ� �ٽ� CREATE TABLE
--      DROP TABLE + CREATE TABLE

DELETE FROM TEST;
commit;
SELECT * FROM TEST_bak;

create table test_bak as
SELECT * FROM test AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL '15'MINUTE);