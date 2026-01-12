-- 회원 테이블
DROP TABLE IF EXISTS `user` CASCADE;
create table `user` (
	id varchar(10) not null COMMENT '회원 아이디',		-- 회원 아이디
	password varchar(10) not null COMMENT '비밀번호',	-- 비밀번호
	name varchar(10) not null COMMENT '이름',		-- 이름
	gender varchar(5) COMMENT '성별',				-- 성별
	birth varchar(10) COMMENT '생일',				-- 생일
	mail varchar(30) COMMENT '메일',				-- 메일
	phone varchar(20) COMMENT '전화번호',				-- 전화번호
	address varchar(90) COMMENT '주소',			-- 주소
	regist_day timestamp default now() COMMENT '가입일자',		-- 가입일자
	primary key(id)
) COMMENT '회원';

INSERT INTO `user` (id, password, name) VALUES ('joeun', '123456', '김조은');