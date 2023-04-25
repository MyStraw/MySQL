drop table if exists emp;
drop table if exists dept;
create table dept (dno varchar(4) primary key, dname varchar(10), budget int);
create table emp (
eno varchar(4) primary key, 
ename varchar(10), 
dno varchar(4), 
salary int,
foreign key(dno) references dept(dno) on delete restrict on update restrict
#foreign key(dno) references dept(dno) on delete set null on update set null
#foreign key(dno) references dept(dno) on delete cascade on update cascade
);
insert into dept (dno, dname, budget) values ('d1', 'dname', 100);
insert into emp (eno, ename, dno, salary) values ('e1', 'ename', 'd1', 100);

delete from dept where dno = 'd1';