CREATE DEFINER = CURRENT_USER TRIGGER `warehouse`.`dept_BEFORE_INSERT` BEFORE INSERT ON `dept` FOR EACH ROW
BEGIN
insert into depttrigger ( dno, dname, budget, event, eventdate)
			values(new.dno, new.dname, new.budget, 'insert', curdate()); -- 새로 들어오는 dno, 인서트가 발생, 맨뒤는 현재날짜.
END
