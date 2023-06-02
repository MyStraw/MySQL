create table board (
    num int not null auto_increment,
    title varchar(200) not null,
    content varchar(2000) not null,
    id varchar(10) not null, 
    postdate timestamp default current_timestamp not null,
    visitcount decimal(6) default 0,
    primary key (num)
);
