-- 테이블 삭제
-- Drop table 테이블명;
-- Drop table usertable; 실행 오류가 발생한다.
-- 왜냐하면 외래키가 지정되어 있기 때문이다. buytable이 존재하기 때문에 테이블 삭제가 안된다.
-- buytable에서 usertable을 외래키로 지정하고 있기 때문이다. buytable을 삭제한 후 usertable을 삭제해야한다.

-- 테이블 수정
-- Alter table문을 사용한다.
-- 컬럼의 추가, 변경, 수정, 삭제에 사용한다.

Alter table usertable
  ADD hompage VarcHAR(30) DEFAULT 'http://www.naver.com' null;

-- 컬럼을 추가하면 마지막 컬럼 뒤에 추가된다.
-- 내가 원하는 위치에 컬럼을 추가할려면?
-- FIRST, AFTER 컬럼명

Alter table usertable
  ADD hompage2 VarcHAR(30) 
  AFTER mobile2;
  
-- 컬럼의 삭제 : 컬럼에 제약조건이 걸려있을 경우 먼저 제약조건을 삭제하고 컬럼을 삭제한다.
ALTER TABLE usertable
  drop column hompage2;
  
-- 컬럼명 변경
ALTER TABLE usertable
  CHANGE COLUMN uname name Varchar(20);
  
-- 기본키 제거
ALTER table usertable
 drop primary key;
 
ALTER table buytable
 drop primary key;
 
-- 외래키 제거
ALTER TABLE buytable
  drop FOREign key `FK_usertable_buytable`;

ALTER TABLE buytable
  drop key `FK_usertable_buytable`;

-- 먼저 외래키를 제거하고 기본키를 제거해야한다.
-- 컬럼에 AUTO_INCREMENT를 기술하면 PRIMARY KEY로 설정해야한다.

-- 기본키 설정
ALTER table usertable
  ADD constraint PK_usertable_userID
  primary key (userID);

ALTER table buytable
  ADD constraint PK_buytable_num
  primary key (num);
  
ALTER table buytable
  ADD constraint FK_usertable_buytable
  foreign key (userID)
  references usertable (userID);
  
-- usertable의 출생년도를 1990 ~ 현재까지만 설정하도록 CHECK에 제약조건을 설정하자.

ALTER table usertable
add constraint CK_birthYear 
CHECK (birth >= 1990 and birth<= year(curdate()));

-- 바비킴 회원이 자신의 ID를 변경해 달라고 한다. BBK에서 VVK로 변경하라
UPDATE usertable set userID = 'VVK'
WHERE userID = 'BBK';

-- 구매테이블의 사용자에게 물품 배송을 위해서 회원 테이블과 조인 시켜 보자. 즉, 구매한 회원아이디, 회원이름, 구매한 제품, 주소, 연락처가 출력되게 한다.
select m.userID as '회원아이디' , m.name '회원명' , b.pname 구매제품, m.addr 주소, concat(m.mobile1,m.mobile2) as ' 연락처'
from usertable as m join buytable as b
on m.userID = b.userID;