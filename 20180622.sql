-- GROUP BY, HAVING, 집계함수
-- 기본키가 설정된 컬럼을 join할수 있다.
-- 사용자가 구매한 물품의 개수를 추출하라.
SELECT B.userId, u.name , b.amount 
FROM buytbl AS B INNER JOIN usertbl as u
ON u.userID = B.userID
GROUP BY userID 
having B.userID = 'kkh';

-- 합계를 낼때 손이나 전자계산기를 사용해서 계산한다면 MySQL을 사용할 이유가 없다.
-- sum(), avg(), count(), count(distinct), max(), min(), stdev() : 표준편차를 구한다. , var_samp() : 분산을 구한다.
SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수' FROM buytbl group by userid;

-- 사용자별 구매액의 총합
SELECT userID AS '사용자', sum(price*amount) FROM buytbl group by userID;

-- 전체 구매자가 구매한 물품의 개수의 평균을 구하라.
select AVG(amount) FROM buytbl;

-- 사용자별로 물건을 구매시 평균 몇개 구매했는지 평균을 내보자.
SELECT userID,AVG(amount) FROM buytbl GROUP BY userID;

-- 가장 키가 큰 회원과 가장 키가 작은 회월을 출력하라.
-- 서브쿼리는 결과 값이 여러 개가 필요할 때 WHERE절에 사용한다.
SELECT name, height FROM usertbl 
WHERE height = (SELECT MAX(height) FROM usertbl) OR height = (SELECT MIN(height) FROM usertbl) ORDER BY height DESC;

-- 총 구매액이 10000원 이상인 사용자에게만 사은품을 증정하고 싶다.
-- 1.where절에는 집계함수를 쓸 수 없다(비교,관계연산자).
-- 2.group by절을 사용할 때 조건을 where절에 쓸수없고 having에 써야한다.
SELECT userID, sum(price*amount) FROM buytbl
group by userID
having sum(price* amount) >=50000;

-- SQL문은 크게 DML,DDL,DCL로 분류된다.
-- DML(데이터 조작언어) : SELECT,INSERT,UPDATE,DELETE
-- 트랜잭션은 데이터의 입력, 수정, 삭제를 할 때 테이블에 완전히 적용하지 않고, 
-- 임시로 적용시키는 것을 말한다. 그래서 만약 실수가 있었을 경우 임시로 적용시킨 것을 최소화한다.
/*-----------------------------ㅇ----------~---------ㅇ---------------------------------------*/












