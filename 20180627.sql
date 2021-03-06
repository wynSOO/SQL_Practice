-- 제어흐름함수
SELECT IF(100>200, '참이다', '거짓이다');
SELECT IFNULL(NULL,'널이다'),IFNULL(6549,'널이군요');

-- 문자열 함수
-- 숫자를 문자로, 문자를 숫자로 변경하는 함수
SELECT ASCII('A'),CHAR(65);

-- 문자열의 개수를 반환하는 함수
SELECT LENGTH('ABC');

-- 문자열 구분자를 이용하여 연결하는 함수
SELECT CONCAT_WS('/', '2020', '08', '24');

-- 문자열 연결하는 함수
SELECT CONCAT('/', '2020', '08', '24');

-- 숫자를 소수점 아래 자릿수까지 표현
-- FORMAT(숫자,소수점 자릿수)
SELECT FORMAT(12345.1284,2);

-- INSERT(기존문자열, 위치, 길이, 삽입할 문자열)
SELECT INSERT('ASDFGQWER', 3, 4, 'SGEDDDDD')

-- 문자열 반복 repeat(문자열, 횟수)
SELECT REPEAT('장민수 천재',3);

-- 모든문자를 대문자로 변경 UPPER()
-- 모든문자를 소문자로 변경 LOWER()
-- 문자열의 공백을 없앤다. TRIM(), LTRIM(), RTRIM()
SELECT TRIM('      이      것     이         ');

-- REPLACE(문자열, 원래 문자열, 바꿀 문자열)
SELECT REPLACE('이것이 MYSQL','이것이','THIS IS');

-- SUBSTRING(문자열, 시작위치, 길이)
SELECT SUBSTRING('가나다라마바사',2,5);

-- 수학함수
SELECT ABS(-100);

-- FLOOR(숫자):내림, ROUND(숫자): 반올림
SELECT FLOOR(235.64), ROUND(235.64), ROUND(235.6498,2);






