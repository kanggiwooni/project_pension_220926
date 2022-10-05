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

update member set
upw='1234', uEmail='test11@naver.com', gender='2', uBirth='900101', uZipcode='123-123', uAddr='바꾼 주소'
where uid='test';

select * from member order by num desc;
select count(*) from member where uid = 'sample';

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



####################################
############ 객실 정보 테이블 #############
####################################
drop table roomInfo;
create table roomInfo (
num				int				auto_increment	,	#번호
rName			char(30)		not null				,	#객실 이름
rLimit			int				not null				,	#최대인원
rPrice			int				not null				,	#객실가격
constraint primary key (num)
);
desc roomInfo;

insert into roomInfo (rName, rLimit, rPrice) 
values ('바다 객실 A호', 8,120000);
insert into roomInfo (rName, rLimit, rPrice) 
values ('바다 객실 B호', 4, 80000);
insert into roomInfo (rName, rLimit, rPrice) 
values ('산 객실 C호', 4, 100000);

select * from roomInfo order by num desc;




####################################
############ 예약 정보 테이블 #############
####################################
drop table roomBooking;
create table roomBooking (
bNum		int				auto_increment	,	#예약번호
bDate		timestamp	not null				,	#예약 날짜
rNum			int				not null				,	#예약 객실번호
rName		char(30)		not null				,	#예약 객실 이름
uid			char(30)		not null				,	#예약자 아이디
uName		char(30)		not null				,	#예약자 이름
uPhone		char(30)		not null				,	#예약자 연락처
payPrice		int				not null				,	#결제 금액
constraint primary key (bNum)
);
desc roomBooking;









