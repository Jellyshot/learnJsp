
// 1.데이터 베이스 생성 
create database hrservice default character set utf8;

show databases;
use hrservice;

grant all privileges on hrservice.* to admin@localhost identified by 'admin';


// 2. 테이블 생성

create table belong (
	b_code int not null primary key auto_increment,
	b_place varchar(20) not null
);
insert into belong(b_place) values('본사');
insert into belong(b_place) values('서울영업소');
insert into belong(b_place) values('부산지점');


create table dep (
	d_code int not null primary key auto_increment,
	d_name varchar(30) not null
);
insert into dep (d_name) values('경영관리');
insert into dep (d_name) values('영업');
insert into dep (d_name) values('연구개발');
insert into dep (d_name) values('품질관리');
insert into dep (d_name) values('생산');
insert into dep (d_name) values('생산관리');
insert into dep (d_name) values('생산기술');


create table empposition (
	p_code int not null primary key auto_increment,
	p_name varchar(30) not null
);
insert into empposition (p_name) values('차장');
insert into empposition (p_name) values('부장');
insert into empposition (p_name) values('과장');
insert into empposition (p_name) values('대리');
insert into empposition (p_name) values('사원');
insert into empposition (p_name) values('인턴');
drop table position;

create table empltype (
	t_code int not null primary key auto_increment,
	t_name varchar(30) not null
);
insert into empltype (t_name) values('계약직');
insert into empltype (t_name) values('촉탁직');
insert into empltype (t_name) values('정규직');


create table workingstatus (
	s_code int not null primary key auto_increment,
	s_value varchar(30) not null
);
insert into workingstatus (s_value) values('재직');
insert into workingstatus (s_value) values('파견');
insert into workingstatus (s_value) values('퇴직');
insert into workingstatus (s_value) values('해고');


create table education(
	e_code int not null primary key auto_increment,
	e_value varchar(10)
);
insert into education (e_value) values('고졸');
insert into education (e_value) values('대졸(2,3년)');
insert into education (e_value) values('대졸(4년)');
insert into education (e_value) values('석사');
insert into education (e_value) values('박사');
insert into education (e_value) values('기타');



create table member(
	m_code int not null primary key auto_increment,
	m_pwd varchar(20) not null,
	t_code int not null,
	m_name varchar(10) not null,
	m_joindate date not null,
	b_code int not null,
	d_code int not null,
	p_code int not null,
	m_enumber varchar(13) null,
	s_code int not null,
	m_phone varchar(13) null,
	m_address varchar(200) null,
	m_email varchar(20) null,
	e_code int not null,
	foreign key (t_code) references empltype(t_code),
	foreign key (b_code) references belong(b_code),
	foreign key (d_code) references dep(d_code),
	foreign key (p_code) references empposition(p_code),
	foreign key (s_code) references workingstatus(s_code),
	foreign key (e_code) references education(e_code)
);
alter table member auto_increment=1001;
alter table member add column m_pwd varchar(20) not null after m_code;

create table qulificaion (
	q_code int not null primary key auto_increment,
	m_code int not null,
	q_name varchar(30) not null,
	foreign key (m_code) references member(m_code)
)


create table memberinfo (
	i_code int not null primary key auto_increment,
	m_code int not null,
	i_value varchar(200) not null,
	i_sdate date not null,
	i_edate date null,
	foreign key (m_code) references member(m_code)
)

create table a_category(
	c_code int not null primary key auto_increment,
	c_value varchar(8) not null
);

create table attendance(
	a_code int not null primary key auto_increment,
	m_code int not null,
	c_code int not null,
	a_sdate date not null,
	a_edate date null,
	foreign key (m_code) references member(m_code)
);

create table notice(
	n_code int not null primary key auto_increment,
	n_subject varchar(20) not null,
	m_code int not null,
	n_contents varchar(1000) not null,
	n_rdate datetime not null default sysdate(),
	n_udate datetime not null default sysdate(),
	foreign key (m_code) references member(m_code)
);
show tables

create table History(
	h_num int not null primary key auto_increment,
	m_code int not null,
	h_status varchar(20) not null,
	foreign key (m_code) references member(m_code)
);

-- 트리거 제작
DELIMITER $$
	CREATE TRIGGER memHistory
	AFTER UPDATE ON member
	FOR EACH ROW
	BEGIN
		DECLARE m_code int;
		DECLARE h_status VARCHAR(20);
		
		SET m_code = NEW.m_code;
		SET h_status = "이(가) 수정됨";
		
		INSERT INTO history (m_code, h_status) VALUE(m_code, h_status);
		
	END; $$
DELIMITER ;