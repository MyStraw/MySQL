-- 이번엔 업데이트
CREATE DEFINER=`scott`@`%` TRIGGER `dept_BEFORE_UPDATE` BEFORE UPDATE ON `dept` FOR EACH ROW BEGIN
insert into depttrigger ( dno, dname, budget, event, eventdate)
			values(old.dno, old.dname, old.budget, 'update', curdate());
insert into depttrigger ( dno, dname, budget, event, eventdate)
			values(new.dno, new.dname, new.budget, 'update', curdate());
END;



insert warehouse.`dept`(dno, dname, budget) values ('D5', '냐하하', 100);
UPDATE warehouse.`dept` SET `budget` = '20000000' WHERE (`dno` = 'D5');

-- 업데이트 되는지 확인.
-- old new 둘다했으니. depttrigger 확인해보셈. 업데이트 입력 전후로 나뉘는게 확인된다.
-- 냐하하 100이랑 냐하하20000000이 순서대로 들어가있다.