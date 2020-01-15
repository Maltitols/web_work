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
