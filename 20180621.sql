-- 특정한 조건의 데이터만 조회하는 where절

/*
SELECT 컬럼명
FROM 테이블명
WHERE 조건식(비교연산자와 논리연산자,술어,서브쿼리)
*/

-- 김경호의 출생지를 조회(출력)하라 =>비교연산자
SELECT name, addr From usertbl;
WHERE name = '김경호';

-- 1970년 이후에 출생하고 신장이 178이상인 사람의 아이디와 이름을 조회하라 =>논리연산자
SELECT userID, name ,birth, height FROM usertbl
WHERE birth >=1970 and height >=178;

-- 1970년 이후에 출생하거나 신장이 182이상인 사람의 아이디와 이름을 조회하라
SELECT userID, name ,birth, height FROM usertbl
WHERE birth >=1970 or height >=182;

-- '...했거나', '...또는' ==> OR연산자
-- '...하고','...하면서','...그리고' ==> AND 연산자
-- 비교연산자와 논리연산자의 조합이 WHERE 절에 가장 많이 사용된다.


-- 이번에는 키가 180~183인 사람을 조회하라
SELECT userID, name ,birth, height FROM usertbl
WHERE height>=180 and height <=183;

SELECT userID, name ,birth, height FROM usertbl
WHERE height BETWEEN 180 AND 183; -- BETWEEN 술어를 사용

-- 출생지가 '경남'이거나 '전남'이거나 '경북'인 사람을 조회하라
SELECT userID, name, addr  FROM usertbl
WHERE addr = '경남' OR addr = '전남' OR addr = '경북';

SELECT userID, name, addr  FROM usertbl
WHERE addr IN( '경남', '전남', '경북'); -- IN 술어를 사용

-- 문자열을 검색할  때 사용하는 술어 : LIKE %(여러문자열) , _(문자하나)
-- 성이 김씨인 회원을 조회하세요.
SELECT * FROM usertbl
WHERE name LIKE '김%';

SELECT * FROM usertbl
WHERE name LIKE '_종신';

SELECT * FROM usertbl
WHERE name LIKE '_용%';

/* 서브쿼리란
    간단히 애기하면 쿼리문 안에 또 쿼리문이들어 잇는 것을 말한다.(WHERE절에 SELECT문을 사용)
    예) 김경호보다 키가 크거나 같은 사람의 이름과 키를 출력하려면
        WEHRE 절의 조건에 김경호의 키를 직접 써주어야 한다.*/

SELECT name, height, addr FROM usertbl
WHERE height >=(select height from usertbl where name = '김경호');

-- 지역이 '서울'인 사람의 키보다 크거나 같은 사람을 추출하라
-- 비교연산자는 하나의 값과 비교를 하는것으로 다수의 값을 비교할 수 없다.
SELECT name, addr, height FROM usertbl
WHERE HEIGHT >= (SELECT HEIGHT FROM usertbl WHERE ADDR='서울');

-- ANY(:서브쿼리의 결과값 중 모든 결과값을 포함한 하나의 결과값을 가지고 온다.), 
-- ALL(:서브쿼리의 결과값 중 최댓값을 하나를 가지고 온다.)
SELECT name, addr, height FROM usertbl
WHERE HEIGHT >= ANY (SELECT HEIGHT FROM usertbl WHERE ADDR='서울');
SELECT name, addr, height FROM usertbl
WHERE HEIGHT IN (SELECT HEIGHT FROM usertbl WHERE ADDR='서울');

SELECT name, addr, height FROM usertbl
WHERE HEIGHT >= ALL (SELECT HEIGHT FROM usertbl WHERE ADDR='서울');

-- 원한는 순서대로 정렬하여 출력 : ORDER BY
-- ORDER BY절은 SQL문의 성능을 떨어지게 하므로 필요한 경우가 아니면 되도록 사용하지 않는다.
-- 기술위치 : 쿼리문 제일 뒤에 작성한다.
/* SELECT * FROM usertbl 
   WHERE 조건식
   GROUP BY  컬럼명
   HAVING 조건식
   ORDER BY 컬럼명 DESC;*/

-- 회원의 등록일을 내림차순으로 추출하세요.
SELECT name, mDate FROM usertbl 
ORDER BY mdate DESC;

-- 키가 큰 순서대로 정렬하되 만약 키가 같은 경우 이름 순으로 정렬하라.
select name , height from usertbl
order by height desc , name asc;

-- 중복된 것을 하나만 남기는 DISTINCT 
-- 회원 테이블에서 회원들의 거주지역이 몇 군데인지 출력해보자.
SELECT addr FROM usertbl;
SELECT addr FROM usertbl ORDER BY addr;

SELECT DISTINCT addr FROM usertbl;
SELECT addr FROM usertbl GROUP BY addr ;

-- 출력하는 개수를 제한하는 LIMIT
SELECT name, mDate FROM usertbl
ORDER BY mDate DESC
LIMIT 5;

-- 테이블을 복사하는 CREATE TABLE ... SELECT 문
CREATE TABLE buyTBl2 (SELECT * FROM buytbl);

DESC BUYTBL2; -- PK, FK는 복사가 안된다.

SELECT * FROM buytbl2;
SELECT COUNT(*) FROM buytbl;
SELECT COUNT(*) FROM buytbl2;

SELECT * FROM usertbl; 