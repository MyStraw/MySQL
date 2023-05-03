-- trigger가 취해졌다. 뭐가 들어가거나. 어떤 일이 벌어졌는지 기록하는것.

create table `depttrigger` (
`id` int NOT NULL AUTO_INCREMENT,
`dno` varchar(4)default null,
`dname` varchar(20) default null,
`budget` int default null,
`event` enum('insert','delete','update') default null,
`eventdate` date default null,
primary key(`id`)
);

-- dept -> alter table -> trigger 에서 before insert로 이거 입력
CREATE DEFINER = CURRENT_USER TRIGGER `warehouse`.`dept_BEFORE_INSERT` BEFORE INSERT ON `dept` FOR EACH ROW
BEGIN
insert into depttrigger ( dno, dname, budget, event, eventdate)
			values(new.dno, new.dname, new.budget, 'insert', curdate()); -- 새로 들어오는 dno, 인서트가 발생, 맨뒤는 현재날짜.
END;



insert warehouse.`dept`(dno, dname, budget) values ('D5', '냐하하', 100);

-- dept 테이블에서 아무 데이터 (윗줄) 입력하면 dept에는 당연히 생기고
-- depttrigger 테이블에도 자동으로 추가한게 생긴다. 일종의 commit log 같은거라고 보는게 좋을거 같은데?

-- 그럼 이제 지우는 트리거도 만들어 보자
-- 이렇게 dept -> alter table -> trigger -> before delete를 만들어서 지우는거도 만들어보쟈

CREATE DEFINER=`scott`@`%` TRIGGER `dept_BEFORE_DELETE` BEFORE DELETE ON `dept` FOR EACH ROW BEGIN
insert into depttrigger ( dno, dname, budget, event, eventdate)
			values(old.dno, old.dname, old.budget, 'delete', curdate());

END;

-- insert는 new만
-- update는 new, old.
-- delete는 old만.; 상식적으로 생각해보셈

-- 이렇게 해놓고 deptdept
DELETE FROM `warehouse`.`dept` WHERE (`dno` = 'D4');
-- 이렇게 지우면 이번에 depttrigger에 delete 기록이 남는다.





