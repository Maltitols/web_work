create table users
(id varchar2(30) primary key,
pwd varchar2(30) not null,
email varchar2(30),
regdate date);

CREATE TABLE board_cafe(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100) NOT NULL,
	title VARCHAR2(100) NOT NULL,
	content CLOB,
	viewCount NUMBER,
	regdate DATE
);

CREATE SEQUENCE board_cafe_seq;


create table board_file(
num number primary key,
writer varchar2(100),
title varchar2(100) not null,
orgFileName varchar2(100) not null,
saveFileName varchar2(100) not null,
fileSize number,
downCount number default 0,
regdate date
);

create sequence board_file_seq;
