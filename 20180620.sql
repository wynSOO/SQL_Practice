-- SQL 이란?
-- 데이터베이스에서 사용되는 공통 질의어이다.
-- DBMS에게는 SQL문으로 질문하고 명령을 지시해야만 
-- DBMS가 알아듣고 작업을 수행한 후 그 결과값을 우리에게 준다.

-- SELECT문 : 원하는 데이터를 가져와 주는 질의어
-- 테이블에서 원하는 정보를 추출하는 명령이다.
/*
SELECT 열이름
FROM 테이블명
WHERE 조건
*/

-- 데이터베이스를 선택하는 쿼리문 : USE 데이터베이스명;
SELECT *
FROM goods; -- * : '모든것'
-- 상품 테이블에 있는 모든 컬럼의 데이터를 출력하세요.

SELECT goods_id, goods_name
FROM goods;

-- 데이터베이스를 보여주는 질의문
SHOW databases;

-- 데이터베이스에 존재하는 테이블을 보여주는 질의문
SHOW tables;
SHOW table status;

-- 테이블의 구조를 확인하는 질의문
DESC goods;

-- 테이블의 구조를 조회하는 질의문
SELECT goods_name 상품명, sell_price 판매가격
FROM goods; 
-- 열이름은 별도의 별칭을 사용하여 지정할 수 있다.
-- 열 이름 뒤에 AS 별칭 형식으로 붙이면 된다.
-- 하지만 별칭의 중간에 공백이 있다면 ''으로 별칭을 감싸줘야 한다.
-- 또한 AS를 붙여도 되고 생략해도 된다.
-- 권장은 ' '로 감싸는 형식을 권장한다.

/*
구매자가 물건을 사기 위해서 회원 가입을 하면 가입한 회원 정보는 회원
테이블에 입력된다. 물론, 더 많은 정보를 입력해야 하지만 그냥 간단한 아이디
이름/출생년도/거주지역/휴대폰 번호/키/가입일 등만 입력하는 것으로하자
회원 가입을 한 후에 인터넷 쇼핑몰에서 물건을 구입하면 회원이 구매한 정보는
구매 테이블에 기록된다. 그러면 이 쇼핑몰의 배송 담당자는 구매 테이블을
통해서 회원이 주문한 물건을 준비하고, 구매 테이블의 아이디와 일치하는 회원
테이블의 아이디를 찾아서 그 행의 주소로 회원에게 물품을 배송한다.
*/

CREATE DATABASE sqldb;

show databases;

USE SQLDB;

SHOW TABLES;

CREATE TABLE userTBl (
  userID CHAR(8) NOT NULL PRIMARY KEY COMMENT '사용자 아이디', -- PK
  name VARCHAR(10) NOT NULL COMMENT '이름',
  birth INT NOT NULL COMMENT '생일',
  addr CHAR(2) NOT NULL COMMENT '지역',
  mobile1 CHAR(3) NOT NULL COMMENT '휴대폰 국번',
  mobile2 CHAR(8) NOT NULL COMMENT '휴대폰 번호',
  height INT COMMENT '키',
  mDate DATE COMMENT '회원가입일'
);

CREATE TABLE buyTBl (
  num INT NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '번호', 
  userID CHAR(8) NOT NULL COMMENT '사용자아이디', -- PK
  pname VARCHAR(10) NOT NULL COMMENT '상품명',
  gname VARCHAR(10) NOT NULL COMMENT '상품분류',
  price INT NOT NULL COMMENT '판매가격',
  amount INT NOT NULL COMMENT '키',
  mDate DATE COMMENT '회원가입일',
  FOREIGN KEY (userID) references userTbl(userID)
);

SHOW TABLES;

DESC USERTBL;
DEsc buytbl;

insert into usertbl  VALUES 
('LSG','이승기',1987,'서울','010','23451245',182,'2008-8-8');
insert into usertbl  VALUES 
('KBS','김범수',1979,'경남','010','33331245',173,'2012-4-8');
insert into usertbl  VALUES 
('KKH','김경호',1971,'전남','010','42429945',178,'2007-7-7');
insert into usertbl  VALUES 
('JYP','조용필',1950,'부산','010','23231885',166,'2009-2-8');
insert into usertbl  VALUES 
('SSK','성시경',1979,'서울','010','26631855',186,'2013-5-8');
insert into usertbl  VALUES 
('LJB','임재범',1963,'경기','010','25531485',182,'2009-9-9');
insert into usertbl  VALUES 
('JKW','조관우',1965,'경기','010','25531445',165,'2010-10-9');
insert into usertbl  VALUES 
('BBK','바비킴',1973,'광주','010','28531845',176,'2013-5-5');
insert into usertbl  VALUES 
('YJS','윤종신',1969,'광주','010','27536365',170,'2015-2-24');

insert into buytbl VALUES 
(null,'KBS','운동화','신발',98000,2);
insert into buytbl  VALUES 
(null,'JKW','노트북','전자',1580000,1);
insert into buytbl  VALUES 
(null,'LJB','데스크탑','전자',880000,1);
insert into buytbl  VALUES 
(null,'JYP','모니터','전자',280000,2);
insert into buytbl  VALUES 
(null,'KKH','모니터','신발',380000,3);
insert into buytbl  VALUES 
(null,'SSK','청바지','의류',65000,1);
insert into buytbl  VALUES 
(null,'YJS','책','서적',35000,10);
insert into buytbl  VALUES 
(null,'LSG','책','서적',25000,5);
insert into buytbl  VALUES 
(null,'LSG','청바지','의류',85000,2);








