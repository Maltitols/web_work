--테스트 회원 목록을 저장할 member 테이블
create table member(
num number primary key,
name varchar2(30),
addr varchar2(30)
);
--member 테이블에 번호를 생성할 시퀀스
create sequence member_seq;

--할일 목록을 저장할 테이블
create table todo(
num number primary key,
content varchar2(50) not null,
regdate date);

create sequence todo_seq;

--자유 게시판 테이블
create table board_free(
num	number primary key,
writer varchar2(50) not null,
title varchar2(100),
content clob,
pwd varchar2(50) not null,
regdate date
);

--자유 게시판 글번호 생성 시퀀스
create sequence board_free_seq;