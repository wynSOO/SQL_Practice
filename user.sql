-- 1. 자신이 사용할 TABLESPACE를 먼저 생성
CREATE tablespace userTS
DATAFILE 'D:\oData\userts.dbf'
size 100m AUTOEXTEND on next 100;

-- 2. DEFALT로 지정
ALTER USER user1 DEFAULT TABLESPACE userTS;

-- 3. TABLE 생성
CREATE TABLE test(
    ID NUMBER, -- 최대 40자리까지 숫자 저장
    NAME VARCHAR2(20),
    POSTCODE CHAR(5),
    ADDR VARCHAR2(50),
    TEL VARCHAR2(15),
    GRADE NUMBER(5,2) -- 전체자릿수 5자리, 소수점이하 2자리
);

-- 테이블 구조 확인
DESC test;

-- 테이블 삭제
DROP TABLE test ;

-- 데이터 추가 
INSERT INTO test (name,addr,tel) VALUES('홍길동','서울시','02');
-- 필요한 컬럼만 지정해서 추가

INSERT INTO test VALUES(1,'이몽룡','61182','남원','042',90);
-- 전체 컬럼에 추가

-- 데이터 확인
select * from test;

-- DCL(Data controll lang)
commit;
   
-- 데이터 삭제
DELETE from test;

ROLLBACK;

SELECT * from test;

INSERT INTO test VALUES(2,'이몽룡','61182','남원','042',90);
INSERT INTO test VALUES(3,'성춘향','61182','남원','042',90);

commit; -- Insert, UPDATE, DELETE 를 수행한 결과를 실제 DB에 반영
select * from test;

rollback; -- commit 이후에 실행된 INSERT, UPDATE, DELETE를 취소
-- ROLLBACK은 순간적인 실수로 UPDATE, DELETE를 수행했을때
-- 이전 상태로 되돌리는 명령
-- ROLLBACK이 않되는 경우
-- COMMIT 을 수행했을 때, DDL 명령을 수행했을 때
-- TRUNCATE 명령 = DELETE 명령과 유사
-- TRUNCATE 명령을 수행한 후에는 ROLLBACK으로 되돌릴수 없다.

-- TABLE 관련해서 전체 데이터를 삭제하는 명령 3가지
-- 1. DELETE FORM [table]을 WHERE 없이 실행한 경우
-- 2. DROP TABLE >> 아예 TABLE 자체를 삭제
-- 3. TRUNCATE TABLE >> TABLE을 삭제했다가 다시 CREATE TABLE
--      DROP TABLE + CREATE TABLE

DELETE FROM TEST;
commit;
SELECT * FROM TEST_bak;

create table test_bak as
SELECT * FROM test AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL '15'MINUTE);