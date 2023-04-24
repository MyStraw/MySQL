/*
int id
varchar(20) name
varchar(20) content
*/

create table tt(
id int auto_increment primary key,
name varchar(20) not null default '',
content varchar(20) default 'content'
);

-- tt-- 에 값넣기

-- insert into tt(id, name, content) values(1,'이름', 'content'); 이런식으로 값넣기.
insert into tt(id, name, content) values(1,'이름', 'content');
insert into tt(name, content) values('이름', 'content');
-- 이렇게 입력하면 자동으로 2가 붙는다. PK가 id에 있기때문.
insert into tt(id, name, content) values(10, '이름10', 'content10');
insert into tt(name, content) values('이름99', 'content99');
-- 이렇게입력하면 101로 들어간다. 11로 안들어가. ID 없이 했을때

delete from tt; -- 세이프모드 발동된다. Edit -> preference 0 -> SQL editor -> 맨아래 safe~ 해제하고 아이디 나갔다 다시들어와

insert into tt(name, content) values('이름99', 'content99');
-- 이러면 102번에 들어간다. 테이블을 지운게 아니라 내용지움.

delete from tt where id=102; -- 조건 적어주면 세이프 모드라도 괜찮다

insert into tt(name, content) values('a', 'b');
insert into tt(name, content) values('c', 'd');
insert into tt(name, content) values('e', 'f');

update tt set content = 'z'; -- 이것도 세이프모드 뜬다. 업데이트, 딜리트 걍 실행하면 세이프모드 됨.
update tt set content = 'z' where id=104; -- 조건이 달렸으니 작동된다. d가 z로 바뀜