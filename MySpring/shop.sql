use webjava;

/*
-- mysql(오류)에서 데이터 독립시키기(데이터 이동)
-- 1. webjava 데이터 베이스 생성
create database webjava default character set utf8;

-- 2.데이터 베이스 오픈(현재까지는 mysql에 저장)
	show databases;  
	use webjava; -- 데이터베이스를 webjava로 이동
	
-- 3. 유저 생성 및 암호 지정
	grant all privileges on webjava.* to javauser@localhost identified by 'webjava';
	/* 잠시 new MySQL disconnect 시키고 창닫음*/
*/

-- mysql에 있던 db 새로 만들기
-- tblboard 테이블
create table tblboard (
 b_num int not null primary key AUTO_INCREMENT,
 b_subject varchar(100) not null,
 b_contents varchar(2000) not null,
 b_name varchar(50) not null,
 b_date datetime not null default sysdate()
);

select * from tblboard;
INSERT INTO tblboard (b_subject, b_name, b_contents) VALUES ('제목이다','홍길동','jsp프로그래밍');

-- tblnotice 테이블
create table tblnotice (
 n_num int not null primary key AUTO_INCREMENT,
 n_subject varchar(100) not null,
 n_contents varchar(2000) not null,
 n_name varchar(50) not null,
 n_date datetime not null default sysdate()
);

select * from tblnotice;
INSERT INTO tblnotice (n_subject, n_name, n_contents) VALUES ('제목이다','홍길동','jsp프로그래밍');


/* 쇼핑몰 구현 시작!*/

-- 고객 테이블
create table tblmember(	
	m_id varchar(50) not null primary key, -- 아이디
	m_passwd varchar(50) not null, -- 비밀번호
	m_name varchar(50) not null, -- 성명
	m_rdate datetime not null default sysdate(),
	m_udate datetime not null default sysdate()
);
select * from tblmember;


-- 상품 테이블
create table tblproduct(
	p_code int not null primary key auto_increment,
	p_name varchar(100) not null,
	p_price int not null,
	p_rdate datetime not null default sysdate(),
	p_udate datetime not null default sysdate()
);

alter table tblproduct auto_increment=1001;
select * from tblproduct;



-- 장바구니 main 테이블 (장바구니 번호와 구매자를 관리하는 테이블)
create table tblcartmain(
	cm_code int not null primary key auto_increment,
	m_id varchar(50) not null,
	cm_rdate datetime not null default sysdate(),
	cm_udate datetime not null default sysdate(),
	foreign key (m_id) references tblmember(m_id)	
);

alter table tblcartmain auto_increment=1001;
select * from tblcartmain;


-- 장바구니 sub 테이블
create table tblcartsub(
	cs_code int not null primary key auto_increment,
	cm_code int not null,
	p_code int not null,
	cs_cnt int not null,
	cs_rdate datetime not null default sysdate(),
	cs_udate datetime not null default sysdate(),
	foreign key (cm_code) references tblcartmain(cm_code),
	foreign key (p_code) references tblproduct(p_code)
);
alter table tblcartsub auto_increment=1001;
select * from tblcartsub;


-- 주문 main table (장바구니의 상품이 주문될때 주문번호를 따서 저장되는 테이블)
/* 구매가 완료되고 나면 더이상 장바구니 main 정보를 유지시킬 필요가 없음. 주문이 완료되면 삭제시킴 
 * 따라서 carmain에 있는 정보를 끌어다가 쓰면 안됨. */
create table tblordermain(
	om_code int not null primary key auto_increment,
	m_id varchar(50) not null,
	om_rdate datetime not null default sysdate(),
	om_udate datetime not null default sysdate(),
	foreign key (m_id) references tblmember(m_id) 
);
alter table tblordermain auto_increment=1001;
select * from tblordermain;


-- 주문 sub table (주문 상세 정보. 내역들을 불러올 테이블)
create table tblordersub(
	os_code int not null primary key auto_increment,
	om_code int not null, 
	p_code int not null,
	os_cnt int not null, 
	os_rdate datetime not null default sysdate(),
	os_udate datetime not null default sysdate(),
	foreign key (om_code) references tblordermain(om_code),
	foreign key (p_code) references tblproduct(p_code)
);
	
alter table tblordersub auto_increment=1001;


-- 전체 테이블 삭제(문제 발생시)
drop table tblordersub;
drop table tblordermain;
drop table tblcartsub;
drop table tblcartmain;
drop table tblproduct;
drop table tblmember;

show tables;


-- 회원등록
insert into tblmember (m_id, m_name, m_passwd) values('tiger', '호랑이', '1234');
insert into tblmember (m_id, m_name, m_passwd) values('lion', '김삿갓', '1234');
insert into tblmember (m_id, m_name, m_passwd) values('rabbit', '정토끼', '1234');
select * from tblmember;

-- 제품등록
insert into tblproduct (p_name, p_price) values('삼성 냉장고 200l', '1000000');
insert into tblproduct (p_name, p_price) values('엘지세탁기 10리터', '800000');
insert into tblproduct (p_name, p_price) values('흥국F&B 자몽농축액', '50000');
insert into tblproduct (p_name, p_price) values('가라디안초코소스', '38000');
select * from tblproduct;

-- 장바구니 main 등록
insert into tblcartmain (m_id) values ('tiger');
insert into tblcartmain (m_id) values ('lion');
insert into tblcartmain (m_id) values ('rabbit');
select * from tblcartmain;

-- 장바구니 sub 등록
insert into tblcartsub (cm_code, p_code, cs_cnt) values (1001, 1001, 1);
insert into tblcartsub (cm_code, p_code, cs_cnt) values (1001, 1003, 5);
insert into tblcartsub (cm_code, p_code, cs_cnt) values (1002, 1001, 1);
insert into tblcartsub (cm_code, p_code, cs_cnt) values (1002, 1004, 10);
insert into tblcartsub (cm_code, p_code, cs_cnt) values (1003, 1003, 4);
insert into tblcartsub (cm_code, p_code, cs_cnt) values (1003, 1002, 1);
select * from tblcartsub;


-- ------------------------------------------------------------------------


/* tiger(1)의 장바구니에 담겨있는 상품 내역 조회  -- 테이블 외에도 이렇게 화면으로 보여줘야 하는것마다 다 VO를 만들어 주어야 함. 
 * 보통 왼쪽이 primary key, 오른쪽이 foreign key를 쓴다.*/
select cm.cm_code, cm.m_id, m.m_name, cs.p_code, p.p_name, p.p_price, cs.cs_cnt, p.p_price * cs.cs_cnt 
	from tblcartmain cm, tblmember m, tblcartsub cs, tblproduct p  
	where cm.cm_code = cs.cm_code
		and p.p_code = cs.p_code 
		and m.m_id = cm.m_id
		and cm.m_id = 'tiger';

		
/* tiger(1)의 장바구니에 담겨있는 상품의 총 결재금액 구하기 */
select sum(p_price * cs.cs_cnt) as totalprice
	from tblcartmain cm, tblcartsub cs, tblproduct p
	where cm.cm_code = cs.cm_code
		and p.p_code = cs.p_code
		and cm.m_id = 'tiger';


-- ------------------------------------------------------------------------------
/* 장바구니의 모든 내용물 구매 
 * cart의 정보를 읽어서 있는 내용을 order로 옮김*/
		
		
insert into tblordermain (m_id) value ('tiger'); -- tiger om_code 생성
insert into tblordermain (m_id) value ('lion'); -- lion om_code 생성
insert into tblordermain (m_id) value ('rabbit');

select * from tblordermain;



-- tiger의 장바구니 물품을 주문내역에 집어넣기-----------------------------------------
/* insert value 구문에서 value에 값을 불러와서 입력해야 하므로, value 대신 select 구문으로 값을 불러와 insert에 넣어준다 : 일괄 입력
 * 다만 insert into의 열 순서와 select의 열 순서가 동일해야 한다. */
insert into tblordersub (om_code, p_code, os_cnt)
	select 1001, p_code, cs_cnt from tblcartsub
/*	subquery (부 질의)
 * join의 경우 쿼리 전체를 불러와서 동일부분을 검색하지만, 서브쿼리를 사용하면 필요한 부분만을 가지고 조건을 찾으므로 부하가 적어진다.*/
	where cm_code = (select cm_code from tblcartmain where m_id = 'tiger');
	
	
-- lion의 장바구니 물품을 주문내역에 집어넣기
insert into tblordersub (om_code, p_code, os_cnt)
	select 1002, p_code, cs_cnt from tblcartsub
	where cm_code = (select cm_code from tblcartmain where m_id = 'lion');
-- insert 내역 확인
select * from tblordersub;

-- rabbit의 장바구니 물품을 주문내역에 집어넣기
insert into tblordersub (om_code, p_code, os_cnt)
	select 1004, p_code, cs_cnt from tblcartsub
	where cm_code = (select cm_code from tblcartmain where m_id = 'rabbit');


	
	
	
-- tiger가 가장 최근에 구매한 내역 확인하기-------------------------------------------------
select om.om_code, om.m_id, p.p_name, os.os_cnt, p.p_price * os.os_cnt
	from tblordermain om, tblordersub os, tblproduct p 
	where om.om_code = os.om_code
		and om.om_code = (select om_code from tblordermain 
								where m_id = 'tiger' order by om_code desc limit 1)
	/* 여기까지 상품번호를 통해 p_code와 개수를 가지고옴. 
	 * 이제 상품의 정보를 가져오기 위해 p_code의 조건을 줌 */
		and p.p_code = os.p_code;

		
-- tiger가 가장 최근에 구매한 총 합계금액 출력
select sum(p.p_price * os.os_cnt) as totalprice
	from tblproduct p, tblordersub os, tblordermain om
	where om.om_code = os.om_code 
		and om.om_code = 
		(select om_code from tblordermain where m_id = 'tiger' order by om_code desc limit 1)
		and p.p_code = os.p_code
   

		
-- lion가 가장 최근에 구매한 내역 확인하기		
select om.om_code, om.m_id, os.p_code, os.os_cnt
	from tblordermain om, tblordersub os 
	where om.om_code = os.om_code
		and om.om_code = (select om_code from tblordermain where m_id = 'lion' order by om_code desc limit 1);

		
-- -------------------- 조인 이해하기 ------------------------

select * from tblproduct;
select * from tblcartsub;
select * from tblproduct p, tblcartsub;

select * from tblodermain;
select * from tblodersub;
select * from tblordersub os, tblordermain om 
where om.om_code = (select om_code from tblordermain where m_id = 'tiger' order by om_code desc limit 1)


------------------------------------------------------------
use webjava;

select * from tblmember;



