create database project01_pension;
use project01_pension;



####################################
############ 회원가입 테이블 #############
####################################
drop table member;

create table member (
num int unique auto_increment,		#번호
uid char(30) primary key,				#아이디
upw char(30) not null,					#비밀번호
uName char(30) not null,				#이름
uEmail char(100) not null,				#이메일
gender char(2),								#성별
uBirth char(10),								#생일
uZipcode char(8),							#우편번호
uAddr char(100),							#주소
joinTM timestamp not null			#가입시간
);
desc member;

insert into member 
(uid, upw, uName, uEmail, joinTM)
values
('admin', '1234', '관리자', 'admin@google.com', now());
insert into member 
(uid, upw, uName, uEmail, gender, uBirth, uZipcode, uAddr, joinTM)
values
('test', '1234', '테스트', 'test@naver.com', '1', '000114', '12345', '서울 동대문구 천호대로 00-0길 00-00 101호', now());


select * from member order by num desc;

######### 세션 : uidKey


######### 회원가입용 우편번호 테이블 시작 #########
create table tblZipcode(
zipcode 				char(7),
area1 				char(10),
area2 				char(20),
area3 				char(40),
area4 				char(20)
);

desc tblZipcode;
select * from tblZipcode limit 0, 10;
######### 회원가입용 우편번호 테이블 끝 #########



####################################
############ 리뷰 테이블 #############
####################################

create table BBS_reviews(
num				int				primary key		auto_increment 			,#번호
uid 				char(30)		not null												,#아이디
uName			char(30)		not null												,#이름
title				char(50)		not null												,#제목
content			text				not null												,#내용
originalFN		char(200)		null														,#원본파일이름
systemFN		char(200)		null														,#시스템파일이름
fileSize			long				null														,#파일크기
reportingDate	datetime		not null												,#작성일,작성시간
views			int				null														 #조회수
);

desc BBS_reviews;
drop table BBS_reviews;

insert into BBS_reviews(title, content, originalFN, systemFN, fileSize, reportingDate, writer) values('제목','테스트용','파일이름','서버에저장된파일이름',1,now(),'이용자');
select * from BBS_reviews;


