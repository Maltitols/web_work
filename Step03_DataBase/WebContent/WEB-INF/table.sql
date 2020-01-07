
--할일 목록을 저장할 테이블
create table todo(
num number primary key,
content varchar2(50) not null,
regdate date);

create sequence todo_seq;