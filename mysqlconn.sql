/*===================================================
 * Q.
 * create table문을 사용하여 add_book(주소록) 테이블을 작성하세요.
 * 등록이름		no			정수형					not null		주키	
 * 이름			name		가변문자형(10)		not null
 * 주소			addr		가변문자형(150)		not null
 * 연락처		tel			고정문자열형(12)		not null
 * 이메일		email		고정문자열형(50)	
 * 
 * addr_book 테이블에 code(우편번호) 커럼을 추가하는 것을 잊어버렸다. 
 * 이 컬럼을 추가하라
 * code 고정문자열(10) null불가
 * 
 * add_book 테이블을 삭제하고 다시 생성한다.
 * */

create table add_book(
no integer not null primary key,
name varchar(10) not null,
addr varchar(150) not null,
tel char(12) not null,
email char(50)
);

desc add_book;

alter table add_book
add column code char(10) not null;

drop table add_book;

show tables;

alter table add_book change no no integer(11) comment '등록번호';
alter table add_book change name name varchar(10) comment '이름';
alter table add_book change addr addr varchar(150) comment '주소';
alter table add_book change tel tel char(12) comment '연락처';
alter table add_book change email email char(50) comment '이메일';
alter table add_book change code code char(10) comment '우편번호';

show full columns from add_book;

/*=========================================================*/









/*
데이터베이스 구축절차
데이터베이스 생성(root):->
데이터베이스에 사용자 계정을 등록(권한):DCL(grant,revoke):root->
테이블 생성:DDL->
데이터 입력:INSERT:DML->
데이터 조회(select)/활용(update,delete):DML

create database <데이터베이스명>;
show databases;

데이터베이스를 선택한다.
use jspmysql;


테이블 생성
1.컬럼명지정
   명명 규칙
1)데이터베이스, 테이블, 컬럼(필드)등의 이름에 사용할 문자는 
    영문자,숫자,언더바(_)만 사용 가능하다.
2)이름 첫글자는 영문자로 시작한다.
3)같은 테이블 안에서 이름을 중복해서 사용해서는 안된다.

2.데이터형 지정
1)모든 컬럼은 데이터형을 반드시 지정해야 한다.
2)숫자형(INTEGER),  문자열형(CHAR(고정 문자열형),VARCHAR(가변 문자열형)),  
    날짜형(DATE,DATETIME) 등이 있다.

3.제약 성정
1)제약이란 데이터에 제약이나 조건을 추가하는 기능이다.
2)NULL 이란 데이터 없음 상태를 말하고, NOT NULL이란 반드시 데이터가
    존재해야함을 말한다.
3)기본 키(프라이머리 키)는 중복된 값을 허용하지 않는다.    

Q.테이블 생성(tb_goods)
상품아이디			goods_id					char(8)						not null			기본키
상품명 				goods_name				varchar(80)				not null
상품분류			goods_type				varchar(20)				not null
판매가격			sell_price					int								null
매입가격			buy_price					int								null
등록일				reg_date					날짜형						null
*/

/*테이블 생성:
 create table<테이블명>(
 	<열명1><데이터형><제약조건><기본키>,
 	<열명2><데이터형><제약조건>
 );
*/


/*테이블 생성 컬럼명 데이터베이스형 null 사용어부*/
create table tb_goods(
	goods_id 			char(8)			not null  primary key,
	goods_name  	varchar(80) 	not null,
	goods_type		varchar(20) 	not null,
	sell_price			integer,
	buy_price 			integer,
	reg_date 			date
);
--char(8)로 설정한 컬럼에 abc를 넣으면 length(goods_id)의 값이 8이 된다.
--varchar(20)로 설정한 컬럼에 office를 넣으면 length(goods_type)의 값이 6이 된다.
	--시스템 자원을 낭비하지 않는다.
--고정문자열은 (주민번호, 제품의 바코드번호,우편번호)은 char형으로 한다.


/*테이블의 구조 확인*/
desc tb_goods;

 tb_goods;
/*테이블의 컬럼에 코멘트(주석)추가*/
alter table tb_goods change goods_id goods_id char(8) comment '상품아이디';
alter table tb_goods change goods_name goods_name varchar(8) comment '상품명';
alter table tb_goods change goods_type goods_type varchar(20) comment '상품분류';
alter table tb_goods change sell_price sell_price integer comment '판매가격';
alter table tb_goods change buy_price buy_price integer comment '매입가격';
alter table tb_goods change reg_date reg_date date comment '등록일';
alter table tb_goods change goods_engname goods_engname varchar(100) comment '상품영문명';

/*테이블의 컬럼 코멘트 확인*/
show full columns from tb_goods;

--테이블의 구조를 변경할 때 사용:alter문(DDL:CREATE,Alter,drop)
/*컬럼을 추가하는 alter문*/
alter table tb_goods
add column goods_engname varchar(100);

/*컬럼을 변경하는 alter문*/
alter table tb_goods
drop column goods_engname;

/*컬럼명을 변경하는 alter문*/
alter table tb_goods
change selling_price sell_price integer;

/*tb_goods 테이블에 데이터 삽입:DML*/
--insert into <테이블명> (열리스트)VALUES(값 리스트);
--입력하는 데이터와 컬럼의 개수와 데이터형이 일치할 때 생략이 가능하다.
insert into tb_goods 
values('0001','티셔츠','의류','10000','6000',now(),'t-shirt');
insert into tb_goods 
values('0002','볼펜','사무용품','1000','600',now(),'ball pen');
insert into tb_goods 
values('0003','와이셔츠','의류','28000','16000',now(),'y-shirt');
insert into tb_goods 
values('0004','식칼','주방용품','15000','8000',now(),'kichen knife');
insert into tb_goods 
values('0005','압력솥','주방용품','35000','26000',now(),'pressure cooker');
insert into tb_goods 
values('0006','포크','주방용품','500','300',now(),'pork');
insert into tb_goods 
values('0007','도마','주방용품','10000','6000',now(),'thomas');

/*테이블의 데이터를 출력:SELECT문*/
--select <열명1><열명2> FROM<테이블명>;
--<열명>에 *를 사용하면 모든컬럼이라는 의미이다.
select*from tb_goods;

/*테이블명을 변경*/
rename table
tb_goods to goods;

/*테이블 삭제*/
drop table goods;

/*데이터베이스에 존재하는 테이블 확인*/
show tables;

/*=======================2018-06-01=================================*/
/*상품아이디,상품명,매입가격만 출력*/
--SELECT문이 일부 컬럼을 선택해서 출력할 수 있다. 이때 컬럼명을 쉼표로 구분해서 기술하면 된다.
select goods_id, goods_name, buy_price from goods;

/*컬럼에 별명을 붙여 출력 : 큰따음표를 사용하면 공백을 포함한 한글도 사용가능*/
select goods_id as "상품 아이디", goods_name as "상품명", buy_price as "매입가격"
from goods;

/*컬럼에 중복된 데이터를 하나로 출력 : 어떤 상품분류가 등록되어 있는지
   알고 싶다면 중복을 제외한 데이터를 얻어야 함
   distinct 키워드로 중복 데이터를 제거하고 컬럼명에 해당하는 데이터를 출력한다.*/
select distinct goods_type as "상품분류" from goods;
select distinct reg_date as "상품분류" from goods;
select distinct goods_type, reg_date from goods;

/*조건에 맞는 데이터를 출력하고자 할 때 where절을 사용한다.
 * SELECT <열명1>,<열명2> FROM <테이블명>
 * WHERE <조건식>;
 *주방용품에 대한 상품명과 판매가격을 출력 */
select goods_name,goods_type,sell_price from goods
where goods_type = '주방용품';		


insert into goods 
values('0008','반바지','의류','25000','15000',now(),'short');
insert into goods 
values('0009','노트','사무용품','1500','850',now(),'note');
insert into goods 
values('0010','노트북','전산용품','680000','550000',now(),'notebook');
insert into goods 
values('0011','원피스','의류','450000','150000',now(),'onpeace');
insert into goods 
values('0012','지우개','사무용품','500','300',now(),'eraser');

select * from goods;

/*산술 연산자(+,-,*,/)
 * 연산은 컬럼 단위로 되며, null을 포함한 계산은 무조건 null이 된다.
 */
select goods_name,sell_price, sell_price*1.3 as "30%인산된 판매가격" from goods

/*비교연산자(= : 같다,   <> : 다르다,   >= : 이상,   <= : 이하,   > : 크다,   < : 작다)
 * 비교연산자는 where절에 사용한다.
 */
/*판매가격이 15000원 이상인 상품을 출력*/
select goods_name,goods_type,sell_price from goods
where sell_price>=15000;

/*판매가격이 15000원인 상품을 출력*/
select goods_name,goods_type,sell_price from goods
where sell_price=15000;

/*판매가격이 15000원이 아닌 상품을 출력*/
select goods_name,goods_type,sell_price from goods
where sell_price <> 15000;

/*상품등록일이 2018.5.31('2018-05-31') 이전인(<=) 상품 출력
 * yyyy-mm-dd*/
select goods_name,goods_type,sell_price from goods
where reg_date='2018-06-01';

/*판매가격이 매입가격보다 5000원 이상 차이나는 상품을 출력*/
select goods_name,goods_type,sell_price,buy_price from goods
where sell_price-buy_price>=5000;

/*상품분류가 null인 상품인(is null/is not null) 출력*/
select goods_name ,goods_type  from goods
where goods_type is not null;


/*=======================2018-06-04================================*/

/*논리 연산자(not(~가 아니다:부정조건 지정할 때 사용),
 * and(논리곱),or(논리합),true,false)*/ 

/*판매가격가 5000원 보다 큰 상품을 출력*/
select goods_name,goods_type,sell_price from goods
where not sell_price <=5000;

/*and 연산자와 or 연산자
 * 특정 조건에 맞는 상품을 출력하고자 할 때 비교연산자와 논리연산자를 같이 쓴다.*/
select goods_name,goods_type,sell_price from goods
where goods_type='주방용품' and sell_price>=5000;

select goods_name,goods_type,sell_price from goods
where goods_type='주방용품' or sell_price>=5000;

/*자바에서는 비교연산자와 논리연산자를 제어문에서 반드시 사용*/
/*if(goods_type.equals("주방용품") && sell_price>=5000){
	
	}
*/

insert into goods 
values('0013','하드디스크','전산용품','55000','35000',now(),'hdd');
insert into goods 
values('0014','광디스크','전산용품','25000','18000',now(),'dvd-rom');
insert into goods 
values('0015','그래픽카드','전산용품','230000','180000',now(),'gpu');

select * from goods;

/*상품분류가 전산용품이고 등록일이 2018-06-01 또는 5월 31일인 상품을 검색하라
 * and 연산자가 or 연산자보다 우선순위가 높다.
 * 괄호를 사용하면 우선순위를 변경할수 있다. 괄호의 우선순위가 가장 높다.*/
select goods_name,goods_type,reg_date from goods
where goods_type='전산용품' and not reg_date='2018-06-04';

select goods_name,goods_type,reg_date from goods
where goods_type='전산용품' and ( reg_date='2018-05-31' or reg_date='2018-06-01');


/*
 * 1. goods 테이블에서 등록일이 2018년 5월 30일 이후인 상품을 출력한다.
 * 출력열은 goods_name,reg_date로 한다.
 */
select goods_name,reg_date from goods
where reg_date>='2018-05-30';

select goods_name,reg_date from goods
where goods_type='전산용품' and reg_date>='2018-6-4';

/*===================================2018.06.05====================*/


/*판매가격이 매입가격보다 5000원 이상 차이가 나는 상품 출력*/
select goods_name,sell_price-buy_price as "마진" from goods
where sell_price-buy_price>=5000;

select * from goods;
desc goods;

/*테이블의 구조를 수정할 때는 alter문을 사용*/
/*제약조건인 not null을 추가*/
alter table goods
modify goods_name varchar(80) not null;

alter table goods
modify goods_name varchar(80);


/*goods 테이블에서 판매가격을 10%빼도 이익이 500원보다 높은
 * 주방용품과 사무용품을 선택한다.*/
select goods_name,goods_type,sell_price*0.9 as "세일가격" from goods
where sell_price*0.9-buy_price>=500 and (goods_type = "주방용품" or goods_type = "사무용품");

/*집약과 정렬*/

/*SQL에서는 데이터에 어떠한 처리나 계산을 하려면 함수를 사용한다.
 * 예를들어 "테이블 전체의 행수를 계산한다"는 처리를 하고 싶으면
 * count함수를 사용한다. 이외에도 SQL에서는 다양한 집약함수를 제공한다.
 * 집약이란 복수의 행을 하나의 행으로 모은다라는 의미다.
 * 
 * count:테이블의 레코드 수를 계산한다.
 * sum: 데이터의 함수를 구한다.
 * avg: 숫자열 데이터의 평균을 구한다.
 * max: 데이터의 최대값을 구한다.
 * min: 데이터의 최소값을 구한다.
 */

/*테이블의 전체 행 수를 계산한다.*/
/*count(*)에서 *는 모든 열을 의미한다. *는 인수 또는 파라미터,매개변수라고 부른다.
 *count()함수는 인수에 따라 결과값이 달라진다.
 * null을 제외한 행수를 구한다. count(컬럼 명)
 */
select count(*) from goods;
select count(buy_price) from goods;

/*합계를 구한다. sum() 함수를 사용해서 판매가격의 합계를 구하자. int형만 가능*/
select sum(sell_price) from goods;

select sum(sell_price) as "판매가", sum(buy_price) as "매입가"from goods;
select sum(sell_price) - sum(buy_price) as "이윤"from goods;

/*평균값을 구한다. avg() 함수를 사용해서 판매가격의 평균값을 구하자.*/
select avg(sell_price) from goods;

select sum(sell_price) as "판매가", count(sell_price) as "총 수", avg(sell_price) as "평균"from goods;

/*최댓값과 최소값 구하기. 판매가격의 최댓값과 매입 가격의 최솟값을 구하자*/
select max(sell_price), min(buy_price ) from goods;

select count(distinct goods_type) as "상품분류" from goods;

select distinct goods_type from goods;

select sum(sell_price) as "판매 가격",sum(distinct sell_price) as "중복된 판매가격제외" from goods;


/*======================================20180608==================================================*/

/*테이블을 그룹으로 나눈다.*/
/*group by는 테이블을 몇개의 그룹으로 나누어서 집약할 때 사용한다.
 * group by에 저장한 열을 집약 키 또는 그룹화 열이라고 부른다.
 * select와 마찬가지로 group by에도 복수의 열을 쉼표로 구분하여 지정할 수 있다. 
 * ~별:group by ~*/

/*상품분류별 상품 개수를 출력*/
select goods_type,count(*) from goods
group by goods_type;

/*매입가격별로 행 수를 계산*/
select buy_price,count(*) from goods
group by buy_price;

/*where절에 사용한 경우 group by 동작: 
 * where절에서 지정한 조건으로 레코드를 먼저 선택한 후 집약이 이루어진다.
 * 상품분류별로 판매가격이 5000원 보다 큰 상품의 평균가격*/
select goods_type as "상품분류" ,avg(sell_price) as "평균가격" from goods
where sell_price>=5000
group by goods_type;

select goods_type,sell_price,buy_price , count(*) from goods
where sell_price>=5000
group by goods_type;

select goods_type,sell_price from goods;


/*매입가격별 의류 상품의 개수*/
select buy_price , count(*) from goods
where goods_type="의류"
group by buy_price;

/*그룹화한 결과에 조건을 지정한다.*/
/*group by로 그룹을 나누어 결과를 얻을 수 있었다. 그룹에 대해 조건을 지정하여
 * 선택하기 위해 having을 사용한다. 
 * having은 group by뒤에 기술한다. 
 * where은 핸에 대한 조건을 지정하고 having은 그룹에 대한 조건을 지정한다.*/

/*상품분류로 집약한 그룹에서 포함되는 행 수가 3행인것을 선택*/
select goods_type , count(*) from goods
group by goods_type
having count(*)=3;

/*상품분류별 평균판매가격이 2500원 이상인 상품분류*/
select goods_type, avg(sell_price) from goods
group by goods_type
having avg(sell_price)>=2500;

select goods_type ,sell_price  from goods
where goods_type="의류" and avg(sell_price)>=2500 ;

/*검색결과를 정렬한다.
 * 검색결과를 정렬하려면 order by를 사용한다.
 * order by 뒤에는 asc,desc를 붙이면 오름차순 또는 내림차순으로 정렬한다.
 * 기본값은 asc이다.*/

/*판매가격이 낮은 순(오름차순)으로 나열한다.*/
select goods_name, sell_price from goods
order by sell_price asc;

/*판매가격(1순위)이 높은 순으로 상품아이디(중복이 나올경우)는 낮은순으로 나열하라*/
select goods_id, sell_price from goods
order by sell_price desc, goods_id asc;


/*상품분류별로  출력하고 상품분류별 상품 수를 낮은 순으로 정렬*/
select goods_type , count(*) from goods
group by goods_type
order by count(*);

select goods_id, goods_name,sell_price from goods
order by 3 desc , 1 asc;

/*연습문제*/
/*판매가격 합계가 매입가격 합계보다 1.5배 이상 큰 상품분류를 구하는
 * select문을 작성하세요. */
select goods_type, sum(sell_price), sum(buy_price) from goods
group by goods_type
having sum(sell_price)>=sum(buy_price)*1.5;

select goods_type, sum(sell_price), sum(buy_price) from goods
group by goods_type
having sum(sell_price)/sum(buy_price)>=1.5;


/*데이터 등록*/
/*
 * insert문:열명이나 값을 괄호로 감싼다.
 * null값을 입력하려면 null을 기입한다.
 * 다른 테이블의 내용을 가지고 와서 입력할 수 있다.
 * 테이블 열에 default라는 예약어를 쓰면 기본값을 설정할 수 있다.
 * 
 * insert문의 기본문법
 * insert into <테이블명>(열1, 열2, 열3...) values (값1, 값2....);
 * 열 리스트와 값 리스트의 개수가 일치해야한다.*/

create table js_goods(
	goods_id 			char(8)				not null  primary key,
	goods_name   varchar(100)		 	not null,
	goods_type		varchar(20) 		not null,
	sell_price			 integer default 0, /*테이블 만들 때 default 설정*/
	buy_price 			integer default 0,
	reg_date 			date
);
 /*복수 insert : Oracle에서 제외*/
insert into tb_goods values
('0001', '니트', '의류', '25000','15000',now()),
('0002', '수영복', '의류', '65000','35000',now()),
('0003', '면티', '의류', '18000','10000',now()),
('0004', '패딩', '의류', '230000','160000',now());

insert into tb_goods values
('0005', '숫가락', '주방용품', '500',null,now()),
('0006', '젓가락', '주방용품', '400',null,now());

select * from tb_goods;
desc tb_goods;

/*테이블 열에 기본값(초기값)을 설정할 수 있다. 
 *기본값이 설정되어 있지 않으면 null값이 들어간다.*/

insert into tb_goods values
('0007', '그릇', '주방용품', default,'800',now());

desc js_goods;
select * from js_goods order by goods_id;

insert into js_goods values
('0001', '니트', '의류', '25000','15000',now()),
('0002', '수영복', '의류', '65000','35000',now()),
('0003', '면티', '의류', '18000','10000',now()),
('0004', '패딩', '의류', '230000','160000',now()),
('0005', '숫가락', '주방용품', '500',null,now()),
('0006', '젓가락', '주방용품', '400',null,now()),
('0007', '그릇', '주방용품', default,'800',now());


/*insert...select문을 사용하여 다른 테이블의 내용을 복사한다.*/
create table copy_goods(
	goods_id 			char(8)				not null  primary key,
	goods_name   varchar(100)		 	not null,
	goods_type		varchar(20) 		not null,
	sell_price			 integer default 0, /*테이블 만들 때 default 설정*/
	buy_price 			integer default 0,
	reg_date 			date
);

show tables;

insert into copy_goods select * from js_goods;
select * from copy_goods;

create table tp_goods(
	goods_type		varchar(20) 		not null primary key,
	sell_price			 integer default 0, /*테이블 만들 때 default 설정*/
	buy_price 			integer default 0
);

/*tb_goods 테이블에서 판매가격의 합과 매입가격의 합을 상품분류별로 
 *복사해서 tp_goods 테이블의 상품분류, 판매가격, 매입가격 열에 삽입한다. */

insert into tp_goods select goods_type, sum(sell_price), sum(buy_price) from tb_goods 
group by goods_type;

select * from tp_goods;


/*데이터 삭제:delete*/
/*테이블 삭제 : drop table <테이블명>,
 * 테이블 안의 데이터를 삭제하는 SQL문은 delete문이다.
 * delete문의 삭제 대상은 열이 아니라 행이다.
 * 기본문법
 * delete from <테이블명> where <조건>*/

delete from copy_goods;
select * from tb_goods;

delete from js_goods 
where sell_price>=40000;


/*데이터의 갱신 update*/
/*데이터를 잘못 등록할 경우에 update문을 
 *사용해서 테이블 데이터를 변경할 수 있다. 
 *update<테이블명>set<열명>=<값>*/
/*모든 행을 변경하는 update문*/
update js_goods set reg_date='2018-06-10';

/*조건을 지정하는 update문*/
update tb_goods set sell_price = sell_price*0.9
where goods_type = '주방용품';

/*null값으로 갱신할 수 있을까?*/
update tb_goods set reg_date = null
where goods_id='0007';


/*복수 열 갱신:복수의 열을 변경 대상으로 기술할 수 있다.*/
update tb_goods set sell_price = sell_price*2
where goods_type='주방용품';
update tb_goods set buy_price = buy_price/2
where goods_type='주방용품';

update tb_goods set sell_price = sell_price*2, buy_price = buy_price/2
where goods_type='주방용품';

update tb_goods set sell_price, buy_price = sell_price*2, buy_price/2
where goods_type='주방용품';






 
/*트랜잭션(Transaction)*/
/*
 * 트랜잭션은 데이터베이스에서 이루어지는 하나 이상의 갱신 처리를 말한다.
   즉, 복수의 처리를 연속적으로 실행하는 것이다.
 * 판매부에서 "지난번 회의에서 와이셔츠는 판매가격을 1000원 내리고
   티셔츠는 판매가격은 1000원 올리기로 결정해서 이 변경 내용을 데이터베이스에
   반영해 주세요."라고 말한다면 "예 무척 간단한 일입니다."라고 대답할 것이다.
   이 때 트랜잭션은 두가지 갱신으로 구성된다.
 * 취급 상품 갱신 트랜잭션
 * 1.와이셔츠 판매가격을 1000원 내린다.
 * update goods set sell_price = sell_price-1000
 * where goods_name='와이셔츠';
 * 2.티셔츠 판매가격을 1000원 올린다.
 * update goods set sell_price = sell_price+1000
 * where goods_name='티셔츠';
 * 
 * 1과 2처리는 반드시 세트로 실행되야 한다. 이와 같이 "하나의 세트로 실행되야 할 
 * 갱신 집합은 트랜잭션으로 모아서 취급한다."
 * 
 * 트랜잭션을 만들려면
 * 
 * 트랜잭션 개시문;(SQL:begin transaction;, MySQL : start transaction;)
 * DML문;
 * DML문;
 * DML문;
 * ...
 * 트랜잭션 종료;(commit, rollback)
 */
start transaction;
	update goods set sell_price = sell_price-1000
    where goods_name='와이셔츠';
	update goods set sell_price = sell_price+1000
 	where goods_name='티셔츠';
commit;

/*처리확정-commit
 * commit이란 트랜잭션에 의한 변경 내용을 모두 반영한 후 트랜잭션을 종료하는 명령이다. 
 * 만일 잘못된 병경을 트랜잭션으로 처리하면 다시 테이블을 만들어서 데이터를 재등록해야한다.
 * 매우 복잡한 절차를 밟아야 한다.
 * commit은 세심한 주의가 칠요한다.
 * 처리취소-rollback
 * rollback은 트랜잭션에 의해 처리된 변경 내용을 취소하고 트랜잭션을 종료하는 명령이다.
 * 롤백하면 데이터베이스 상태가 트랜잭션 개시 전으로 돌아간다.
 */

/*다음과 같이 판매차익 열을 가진 goodsprofit(상품차익) 테이블을 만든 후 goods 테이블로부터 
 * 차익을 계산해서 상품 판매 차익 데이터를 등록하는 sql문을 작성하세요.
 * 차익=판매가격-매입가격
 */

create table goodsprofit(
goods_id char(4) not null primary key,
goods_name varchar(100) not null,
sell_price integer,
buy_price integer,
profit integer 
);

insert into goodsprofit( goods_id, goods_name, sell_price,buy_price,sell_price-buy_price) 
select goods_id, goods_name, sell_price,buy_price,sell_price-buy_price from goods;

 select * from goodsprofit;

--데이터를 등록한 goodsprofit 테이블에 대해 다음과 같은 변경을 적용하려고 한다.
/*1. 반바지 판매가격을 25000원에서 20000원으로 내리다.
 * 2.1의 결과를 반영해서 반바지 차익을 재계산한다.
 */

update goodsprofit set sell_price = 20000
where goods_id='0008';

update goodsprofit set profit = sell_price - buy_price
where goods_id='0008';



/*뷰(view) : 자주 사용하는 select문은 뷰로 만들어 반복해서 사용
   1.SQL 관점에서 보면 뷰는 테이블과 같다.
   2.뷰는 SELECT문을 저장하고 테이블은 데이터를 저장한다.
   3.자주 사용하는 SELECT문을 뷰로 만들어서 반복적으로 사용한다.
   4.뷰를 만들려면 CREATE VIEW문을 사용한다.
   5.뷰를 삭제하려면 DROP VIEW문을 사용한다.
   6.뷰에 대한 갱신(INSERT, UPDATE, DELETE)처리는 불가능하다.
   7.뷰에는 ORDER BY를 사용할 수 없다.*/

/*뷰가 가지는 이점
  1.데이터를 저장하지 않기 때문에 기억 장치 용량을 절약할 수 있다.
  2.자주 사용하는 SELECT문을 뷰로 만들어서 반복적으로 사용함으로
     SELECT문의 결과를 쉽게 얻을 수 있다.
  3.뷰에 포함된 데이터는 원 테이블과 연동해서 자동으로 최신상태를 유지한다.*/
  
/*뷰 작성 방법
   create view문을 사용한다.
   create view 뷰명(뷰의 열명1,뷰의 열명2....) as <select문> */
   

--상품개수의 합계(goods_sum)이라는 명칭으로 데이터베이스에 뷰를 생성하자.
--상품분류별로 상품개수를 저장한다.
create view goods_sum(goods_type,goods_count) as 
select goods_type,count(*) from goods group by goods_type;

drop view goods_sum;

--지정한 권한 보여줌
show grants for jspid;


	--DCL : MySQL 5.5 Command Line Client에서 Loot 계정으로 실행
	--jspid에게 모든 데이터베이스 권한을 설정한다.
	grant all privileges on *.* to jspid@localhost identified by 'jsppwd' with grant option;
	--jspid에게 jspmysql 데이터베이스에 대한 모든 권한을 설정한다.
	grant all privileges on jspmysql.* to jspid@localhost identified by 'jsppwd';
	
--1.뷰 검색
--1.뷰에 저장된 select문 실행
--2.그 결과에 대해 뷰를 from구에 지정한 select문이 실행된다.
--3.where,group by, having도 사용할 수 있다.

select goods_type, goods_count from goods_sum;

select goods_type, goods_count from goods_sum
where goods_type = '전산용품';


/*서브쿼리
 * 서브뭐리는 뷰를 기반으로 하는 기술로, 서브쿼리의 특징을 한마디로
 * 정리하면 '일회용 뷰'이다. 뷰란 데이터 자체를 저장하는 것이 아니라
 * 데이터를 추출하는 select문을 저장하는 방법으로, 사용자 편의성을 
 * 향상시키는 도구다. 반면, 서브뭐리는 뷰 정의 select문을 그대로 from에   
 * 삽입하는 것이다.
 * 
 * 서브쿼리 실행순서는 
 * from구 안의 select문이 먼저 실행되고 그 뒤에 바깥쪽 select문이 실행된다.
 */

select goods_type, goods_count as "개수" from(
	select goods_type,count(*) as goods_count from goods
	group by goods_type) as goods_sum;

select goods_name, sell_price from goods
where sell_price > (select avg(sell_price) from goods);
--스칼라 서브쿼리(Scalar subquery):조건식(where절)에 주로 사용되는 select문 

select goods_name,sell_price,(select avg(sell_price) from goods) as "평균가격" from goods;

select goods_name,sell_price,avg(sell_price) from goods
group by goods_type
having avg(sell_price)>(select avg(sell_price) from goods);

select goods_type,avg(sell_price) ,(select avg(sell_price) from goods) from goods
group by goods_type
having avg(sell_price)>(select avg(sell_price) from goods);


/*함수(function):로직과 기능을 {}(코드블록)으로 묶어서 분리한 것.
   왜 코드블록으로 분리하나요? "재사용"하기 위해서 분리한다.
   함수는 SQL이 가지고 있는 편리한 도구이다.
   함수란 어떤 값을 입력하면 그에 대응하는 값을 출력하는 기능이다.
   이때 입력을 인수(파라미터)라고 하며, 출력을 반환값이라고 한다.*/
    
--산술함수:abs(m), mod(m,n)=m/n의 나머지,round(대상 수,반올림 자릿수) = 반올림
--문자열함수:문자열 처리를 위한 함수
--날짜함수:날짜 처리를 위한 함수
--변환함수:데이터형이나 값을 변환하기 위한 함수
--집약함수:count(),sum(),avg(),max(),min()


/*산술함수
 * 데이터형 numeric은 numeric(전체자릿수,소수 자릿수)형식으로 수치의 크기를 지정한다.
 */

--DDL:테이블 생성
create table samplemath(
	m numeric(10,3),
	n integer,
	p integer
);

show tables;
 
--DCL:권한 부여(grant,revoke)
--DML

start transaction;

insert into samplemath values(500,0,null),(-180,0,null),(null,null,null),
(null,7,3),(null,5,2),(null,4,null),(8,null,3),(2.27,1,null),
(5.555,2,null),(null,1,null),(8.76,null,null); 

commit;

select * from samplemath;

--산술함수 abs(m)는 절댓값(absolute value)을 구하는 함수이다.
select m,abs(m) as "절댓값" from samplemath;

--mod(m,n)는 나눗셈의 나머지 값을 구하는 함수이다.
select n,p,n%p as "나머지" from samplemath;
select n,p,mod(n,p) as "나머지" from samplemath;

--****round(대상수, 반올림 자릿수)****---
select m,n,round(m,n) as "반올림수" from samplemath;

/*문자열 함수
   문자열 치환,잘라내기,단축 등의 문자열 처리를 위해 사용된다.
   ddl:테이블 생성*/
create table samplestr(
	str1 varchar(40),
	str2 varchar(40),
	str3 varchar(40)
);

desc samplestr;

start transaction;
	insert into samplestr values
	('가나다','라마',null),('abc','def',null),('김','철수','입니다.'),
	('aaa',null,null),(null,'가가가',null),('ABC',null,null),
	('aBC',null,null),('abcdefabc','abc','ABC'),('아이우','이','우');
commit;

select * from samplestr;

--concat(str1,str2) 함수 : 문자열을 연결하는 함수(+:문자열 연결 연산자)
select str1,str2,concat(str1,str2) as '문자열 연결' from samplestr;
select str1,str2,str3,concat(str1,str2,str3) as '문자열 연결' from samplestr;

--length(문자열):문자열 길이를 반환한다.영문자는 1byte,한글,일본어,중국어는 멀티바이트(2byte 이상)이다.
select str1,length(str1) as '문자열 길이'from samplestr;

--lower(문자열):알파벳에만 적용되는 함수로 인수의 문자열을 모두 소문자로 변환한다.
--upper(문자열):알파벳에만 적용되는 함수로 인수의 문자열을 모두 대문자로 변환한다.
select str1,lower(str1) as '소문자'from samplestr;
select str1,upper(str1) as '대문자'from samplestr;

--substring(대상 문자열 from 잘라내기 시작 for 잘라낼 문자수)은 문자열에서 일부 문자를 선택한다.
select str1,substring(str1 from 3 for 2) as '문자열 잘라내기'from samplestr;
 
--술어:반환 값이 진릿값(true,false,unknown)인 함수를 가리킨다.
--like, exists, between, in, is null, is not null

create table samplelike(
	strcol varchar(6) not null primary key
);

desc samplelike;

insert into samplelike values 
('abcddd'),('dddabc'),('acdddb'),('abcdd'),('ddabc'),('abddc');

select * from samplelike;

--like술어(중요):검색 엔진을 구현할 때 많이 사용한다.
--전방일치,중간일치(★),후방일치
	
--전방일치 검색 실행
select * from samplelike
where strcol like 'dd%';
   	
--중간일치 검색 실행
select * from samplelike
where strcol like '%dd%';
   	
--후방일치 검색 실행
select * from samplelike
where strcol like '%dd';
   
--%대신에'_'(언더바)를 사용할 수 있지만 %와는 다르게 임의의 1문자를 의미한다.
--%로 검색해서 결과값이 너무 많이 나올때 '_'를 사용해서 검색한다.
select * from samplelike
where strcol like '__dd__';
    
--between술어:범위 검색
--between의 특징은 양극단의 값(100~1000일때, 100과 1000)도 포함된다는 것이다.
--예를들어 goods 테이블에서 판매가격이 100원 부터 1000원까지인 상품의 상품명과 판매가격을 출력하라.
select goods_name,sell_price from goods
where sell_price>=100 and sell_price<= 1000;

select goods_name,sell_price from goods
where sell_price between 100 and 1000;

--in술어:or의 간략버전
--매입가격이 300원,600원,6000원인 상품을 출력하라.
select goods_name,buy_price from goods
where buy_price =300 or buy_price =600 or buy_price =6000;

select goods_name,buy_price from goods
where buy_price in (300,600,6000);

--exists 술어:exists 술어는 어떤 조건에 일치하는 레코드가 존재하는지 여부를 조사하는 것이다.
										


-- ☆★☆★☆★  결합(JOIN) ☆★☆★☆★
-- 다른 테이블의 컬럼을 가지고 와서 "컬럼을 늘리는 집합 연산"이다.
-- 내부결합, 외부 결합, 크로스 결합이 있다. 하지만 내부 결합만 자주 사용한다.
-- 결합은 컬럼 지향(열 지향, 세로 지향)으로 연결한다.

-- 매장 상품 재고 테이블
create table st_goods(
	store_id char(4) not null,
	goods_id char(4) not null,
	store_name varchar(200) not null,
	num integer not null,
	primary key(store_id,goods_id)
); 

insert into st_goods values 
('000a','0001','서울',30),
('000a','0002','서울',50),
('000a','0005','서울',15),
('000b','0002','대전',20),
('000b','0005','대전',25),
('000b','0012','대전',85),
('000b','0008','대전',10),
('000c','0002','광주',25),
('000c','0005','광주',55),
('000c','0007','광주',35),
('000d','0002','부산',15),
('000d','0009','부산',65);
   
select * from st_goods;

select goods_id,num,store_name 
from st_goods 
where store_name='서울';

-- 내부결합(inner join)
-- 가장 자주 사용한다. goods 테이블과 st_goods 테이블에 같이 존재하는 열은 상품 아이디이다.
-- 결합이라는 연산을 한마디로 말하면 테이블들에 같이 존재하는 열을 
-- 다리를 사용해서 다른 테이블의 열들을 하나의 결과에 포함시키는 것이다.

-- st_goods 테이블에는 매장의 아이디, 상품 아이디, 재고수량 이런 데이터는 있지만
-- 구체적인 상품명, 판매가격등은 알 수 없다. 구체적인 상품명, 판매가격등은 goods 테이블에 있다.
-- 따라서 st_goods 테이블과 goods 테이블을 내부 결합하여 상품명과 판매가격 컬럼을 st_goods로 가져온다.

-- inner join : 내부 결합 시 사용하는 키워드
-- goods inner join st_goods
-- 내부결합이후 열명을 작성할 때 <테이블명>.<컬럼명>

select g.goods_id, st.goods_id, st.store_id, st.store_name, g.goods_name, g.sell_price, st.num
-- 3. SELECT 절에 기술하는 열이다.
from st_goods as st INNER JOIN goods as g
-- 1. FROM 절을 먼저 기술한다.
-- 하나의 테이블만 기술했는데, 두 개의 테이블을 기술했다.
-- 이것을 가능하게 만드는 것이 INNER JOIN 이다.
-- 일반적으로 테이블에는 별칭을 사용한다.
on st.goods_id = g.goods_id;
-- 2. ON뒤에 기술하고 있는 것은 결합조건이다.
-- 여기서 두 개의 테이블을 연결할 열(결합 키)을 지정한다.
-- ON은 결합 조건 전용 WHERE절이라고 할 수 있다.
-- ON절이 없으면 오류가 난다.
-- 기술 위치는 FROM과 WHERE절 사이에 기술한다.
-- ON은 나누어진 두 테이블 사이에 다리 역할을 한다.

select st.store_id, st.store_name, st.goods_id, g.goods_name, g.sell_price, st.num
from st_goods as st INNER JOIN goods as g
on st.goods_id = g.goods_id
where st.store_id = '000c';


-- 자주 사용하는 복잡한 쿼리문은 뷰로 등록헤서 뷰를 조회하는 방법을 사용한다.
create view store(store_id,store_name,goods_id,goods_name,sell_price,num)
as
select st.store_id, st.store_name, st.goods_id, g.goods_name, g.sell_price, st.num
from st_goods as st INNER JOIN goods as g
on st.goods_id = g.goods_id;


select store_name,goods_name,num from store;

-- 그룹웨어(전자결제시스템), ERP-SOLUTION, 


-- 세개 이상의 테이블을 사용한 결합
-- 결합은 기본적으로 두 개의 테이블을 결합하는 것이지만,
-- 세 개 이상의 테이블을 결합할 수 있다.
-- 결합할 수 있는 테이블 수에 원칙적으로 제한은 없다.
-- 본사에 상품 재고를 관리하는 테이블이 있다. s001과 s002라는 두 창고에 상품을 보관한다.

create table storage(
	storage_id char(4) not null,
	goods_id char(4) not null,
	stock_num integer not null,
	primary key(storage_id, goods_id)
);

show tables;

insert into storage values 
('s001','0001',0),
('s001','0002',100),
('s001','0003',45),
('s001','0007',35),
('s001','0009',25),
('s002','0001',50),
('s002','0002',75),
('s002','0005',25),
('s002','0008',124),
('s002','0011',68);

select * from storage;

select sum(stock_num) as '1번창고 재고량' from storage
where storage_id = 's001';


select st.store_id, st.goods_id, st.store_name, g.goods_name, g.sell_price, g.buy_price, sg.storage_id, sg.stock_num
from st_goods as st inner join goods as g
on st.goods_id = g.goods_id
	inner join storage as sg
	on sg.goods_id = st.goods_id
where sg.storage_id = 's002';

