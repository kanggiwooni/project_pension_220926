drop database project01_pension;
create database project01_pension;
use project01_pension;



####################################
############ 회원가입 테이블 #############
####################################

create table member (
num int unique auto_increment,	#번호
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
(uid, upw, uName, uEmail, joinTM)
values
('test', '1234', '테스트', 'test@naver.com', now());
insert into member 
(uid, upw, uName, uEmail, joinTM)
values
('guest', '1234', '게스트', 'admin@daum.net', now());

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
############ 공지사항 테이블 #############
####################################

create table BBS_notice(
num				int				primary key		auto_increment 	,#번호
uid 				char(30)		not null										,#아이디
uName			char(30)		not null										,#이름
title				char(50)		not null										,#제목
content			text				not null										,#내용
originalFN		char(200)		null												,#원본파일이름
systemFN		char(200)		null												,#시스템파일이름
fileSize			long				null												,#파일크기
reportingDate	datetime		not null										,#작성일,작성시간
views			int				null												 #조회수
);
desc BBS_notice;

select * from BBS_notice;



####################################
############ 리뷰 테이블 #################
####################################

create table BBS_reviews(
num				int				primary key		auto_increment 		,#번호
uid 				char(30)		not null												,#아이디
uName			char(30)		not null												,#이름
title				char(50)		not null												,#제목
content			text				not null												,#내용
originalFN		char(200)		null													,#원본파일이름
systemFN		char(200)		null													,#시스템파일이름
fileSize			long				null													,#파일크기
reportingDate	datetime		not null												,#작성일,작성시간
views			int				null													 #조회수
);
desc BBS_reviews;

select * from BBS_reviews order by num desc;



####################################
############ 리뷰 댓글 테이블 ###############
####################################

create table BBS_reviewsComment(
num				int				primary key		auto_increment 		,#번호
parentNum		int				not null												,#댓글이 작성된 글 번호
uid 				char(30)		not null												,#아이디
uName			char(30)		not null												,#이름
comment		text				not null												,#댓글내용
reportingDate	datetime		not null												#작성일,작성시간
);
desc BBS_reviews;
select * from BBS_reviewsComment order by num desc;
select * from BBS_reviewsComment where parentNum = '1' order by num desc;




####################################
############ 객실 정보 테이블 #############
####################################

create table roomInfo (
num				int				auto_increment	,	#번호
rName			char(30)		not null				,	#객실 이름
rLimit			int				not null				,	#최대인원
rPrice			int				not null				,	#객실가격
rPictures		int				not null				,	#객실정보 사진 갯수
constraint primary key (num),
constraint unique (rName)
);
desc roomInfo;

insert into roomInfo (rName, rLimit, rPrice, rPictures) 
values ('바다 객실 A호', 8, 120000, 6);
insert into roomInfo (rName, rLimit, rPrice, rPictures) 
values ('바다 객실 B호', 4, 80000, 7);

select * from roomInfo order by num desc;



####################################
############ 예약 정보 테이블 #############
####################################

create table roomBooking (
bNum		int				auto_increment	,	#예약번호
bDate		date				not null				,	#예약 날짜
bPeople		int				not null				,	#예약 인원 수
rNum			int				not null				,	#예약 객실번호
rName		char(30)		not null				,	#예약 객실 이름
uid			char(30)		not null				,	#예약자 아이디
uName		char(30)		not null				,	#예약자 이름
uPhone		char(30)		not null				,	#예약자 연락처
payPrice		int				not null				,	#결제 금액
constraint primary key (bNum)
);
desc roomBooking;

insert into roomBooking (bDate, bPeople, rNum, rName, uid, uName, uPhone, payPrice)
values ('2022-10-24', 3, 1, '바다 객실 A호', 'sample', '샘플', '010-1234-5678', 120000);
insert into roomBooking (bDate, bPeople, rNum, rName, uid, uName, uPhone, payPrice)
values ('2022-10-14', 4, 2, '바다 객실 B호', 'test', '테스트', '010-1234-5678', 80000);
insert into roomBooking (bDate, bPeople, rNum, rName, uid, uName, uPhone, payPrice)
values ('2022-10-08', 4, 1, '바다 객실 A호', 'admin', '관리자', '010-1234-5678', 120000);
insert into roomBooking (bDate, bPeople, rNum, rName, uid, uName, uPhone, payPrice)
values ('2022-10-08', 4, 2, '바다 객실 B호', 'test', '테스트', '010-1234-5678', 80000);

select * from roomBooking order by bNum desc;
select count(*) from roomBooking 
where rNum = 1 and bDate like '2022-10-24%';









