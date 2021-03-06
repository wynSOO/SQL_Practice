-- 데이터의 변경을 위한 SQL
-- INSERT, UPDATE , DELETE
-- 테이블에 데이터를 삽입할 때 INSERT문을 사용한다.
-- INSERT INTO 테이블명 (열 리스트) VALUES (값 리스트);
-- 주의 사항: 1.열리스트는 생략이 가능하다.
--            2.열리스트를 생략할 경우 값리스트의 순서 및 개수가 테이블이 정의된 열 순서 및 개수와 동일해야한다.
SELECT * FROM usertbl;

INSERT INTO usertbl VALUES ('LSY','이수영',1975,'경남','010','12418579',165,'2014-03-25');

-- 자동으로 증가하는 AUTO_INCREMENT
-- 테이블에 속성이 AUTO_INCREMENT로 지정되어 있다면 INSERT에서는 해당 열이 없다고 생각하고 NULL을 입력하면 된다.
-- AUTO_INCREMENT는 자동으로 1부터 증가하는 값을 입력해 준다. AUTO_INCREMENT로 지정할 때는 꼭 PRIMARY KEY또는 UNIQUE로 지정해야 하며
-- 데이터형은 숫자형식만 사용할 수 있다. AUTO_INCREMENT로 지정된 열은 INSERT문에서 NULL값을 지정하면 자동으로 값이 입력된다.

CREATE TABLE testTbl (
  id int not null auto_increment primary key comment '번호',
  username varchar(10) not null comment '이름',
  age int comment '나이'
);

desc testtbl

insert into testtbl values (null,'지민',22);
insert into testtbl values (null, '유나',21);

select * from testtbl;

-- 번호가 100부터 입력되도록 변경;
alter table testtbl auto_increment=100;
insert into testtbl values (null, '지민',25);
insert into testtbl values (null, '지승',22);

-- 데이터 수정 : update 
-- where절을 사용하지 않으면 모든 테이블의 컬럼값을 변경하기 때문에 where절을 반드시 사용해한다.
-- update 테이블명 set 열1=값1,열2=값2,...where 조건;
update testtbl set id=130 where id=100;

-- 데이터의 삭제 : delete , 행단위로 삭제
-- delete from 테이블명 where 조건;
delete from testtbl limit 2;

CREATE TABLE testTbl2 (
  id int not null auto_increment primary key comment '번호',
  username varchar(10) not null comment '이름',
  age int comment '나이'
);

CREATE TABLE testTbl3 (
  id int not null auto_increment primary key comment '번호',
  username varchar(10) not null comment '이름',
  age int comment '나이'
);

delete from testtbl;
truncate table testtbl3;
-- 트랜잭션 로그를 기록하지 않아서 속도가 무척 빠르다.
-- 대용량의 테이블 전체 내용을 삭제할 때 테이블 자체가 필요없을 경우에는 drop으로 삭제하고,
-- 테이블의 구조는 남겨놓고 싶을때 truncate로 삭제하는것이 좋다.

drop table testtbl;

show tables;
-- 테이블을 생성하면서 다른 테이블의 구조와 내용을 삽입
create table membertbl(select userID, name, addr FROM usertbl limit 3);
-- 테이블의 내용과 구조를 확인
select * from membertbl;
desc membertbl
-- 테이블에 기본키 추가
alter table membertbl add primary key(userid);

-- INSERT IGNORE : PK 중복이라도 오류를 발생시키지 않고 무시하고 넘어간다.
-- PK 제약조건에 해당되는 데이터는 삽입이 안되고 나머지 데이터는 삽입된다.
insert IGNORE into membertbl values ('BBK','바비코','미국');
insert IGNORE into membertbl values ('SJH','서장훈','서울');
insert IGNORE into membertbl values ('HJY','현주엽','경기');
insert IGNORE into membertbl values ('KJG','김종규','경북');

SELECT COUNT(*) FROM membertbl;
 
 -- 데이터형: 숫자형, 문자형, 날자형
 
 -- 숫자형 : INT, DOUBLE, DECIMAL(m,d) / m(전체 자릿수), d(소수점 이하 자릿수)
 -- 정수형 : INT  , 실수형 : DECIMAL(m,d) 권장
 -- DECIAML(5,2) : 356.12
 
 -- 문자형 : CHAR(2), VARCHAR(8)
 -- CHAR는 고정길이 문자형 :자릿수가 고정
 --   예) CHAR(10)에 'ABC'를 넣어도 10자리 확보후 3자리만 사용하고 7자리는 낭비
 --   INSERT,UPDATE 시에 일반적으로 더 좋은 성능을 발휘한다.
 --   주민등록번호, 아이디, 우편번호, 나이, 성별
 -- VARCHAR는 가변길이 문자형 : 3글자를 저장할 경우 3자리만 사용
 
 -- 날짜형 : DATE(YYYY-MM-DD), DATETIME(YYYY-MM-DD HH:MM:SS)