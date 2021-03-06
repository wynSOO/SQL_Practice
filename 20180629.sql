-- INNER JOIN
-- usertbl과 buytbl 테이블을 조인하여 회원아이디와 회원 이름, 구매한 제품명과 제품가격을 출력하는 SQL문을 작성하세요.

SELECT usertbl.userID, usertbl.name, buytbl.pname, buytbl.price
FroM USERTBL JOIN buytbl
ON usertbl.userID = buytbl.userID
WHERE usertbl.userID = "KKH";

SELECT *
FroM USERTBL JOIN buytbl
ON usertbl.userID = buytbl.userID

-- 세 개 테이블 조인
-- 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생을 기준으로 학생 이름/ 지역/ 동아리/ 장소를 출력하자.

create TABLE stu(
stuname varchar(10) not null primary key,
addr char(6) not null
);

CREATE TABLE club (
clubname varchar(10) not null primary key,
room varchar(16) not null
);

CREATE TABLE stuclub (
num int not null auto_increment primary key,
stuname varchar(10) not null ,
clubname varchar(10) not null,
foreign key(stuname) references stu(stuname),
foreign key(clubname) references club(clubname)
);

INSERT INTO STU VALUES
('김범수','경남'),
('조용필','부산'),
('장인석','광주'),
('김영환','목포'),
('바비킴','서울'),
('은지원','경북');

INSERT INTO CLUB VALUES
('수영','501호'),
('바둑','102호'),
('축구','103호'),
('봉사','203호');

INSERT INTO STUCLUB VALUES
(NULL,'김범수','수영'),
(NULL,'김범수','바둑'),
(NULL,'조용필','봉사'),
(NULL,'김영환','수영'),
(NULL,'바비킴','수영'),
(NULL,'바비킴','봉사');




select sc.num, s.stuname, s.addr, c.clubname, c.room
from stu s join stuclub sc
  on s.stuname = sc.stuname
    join club c
      on c.clubname = sc.clubname
ORDER BY  S.STUNAME DESC;


/*
-- 테이블과 뷰

-- 테이블은 물리적으로 데이터를 저장하는 저장소의 역할을 한다.
-- 행과 열로 이루어져 있다.
-- 행은 레코드, 로우라고 하고 열은 컬럼,필드라고도 한다.

-- 뷰는 테이블 두개 혹은 세개를 묶어놓은 논리적인 테이블을 뷰라고 한다.
-- 어렵고 복잡한 SQL문을 매번 작성해서 실행하기가 불편하기 때문에 SQL문을 뷰로 생성해서 관리한다
-- 서브쿼리가 있는 SQL문, JOIN을 한 SQL문 
*/

-- 테이블을 복사하는 CREATE TABLE ... SELECT문
create table usertable (select * from usertbl);
create table buytable (select * from buytbl);
-- 문제점 : PK,FK가 복사되지 않는다.

alter table usertable 
add constraint pk_usertable_userid
primary key (userid);

alter table buytable 
add constraint pk_buytable_num
primary key (num);

alter table buytable 
add constraint FK_usertable_buytable
foreign key (userid)
references usertable(userid);

create view tab as
select u.userID, u.name,b.pname
from usertable u join buytable b
on b.userID = u.userID

select * from tab
