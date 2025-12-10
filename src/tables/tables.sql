create table student (id number primary key not null, name varchar(50), email varchar(50), age number(2));

-- add some test records (5 records)
insert into student (id, name, email, age) values (1, 'Alice', 'alice@gmail.com', 20);
insert into student (id, name, email, age) values (2, 'Bob', 'bob@gmail.com', 22);
insert into student (id, name, email, age) values (3, 'Charlie', 'charlie@gmail.com', 23);
insert into student (id, name, email, age) values (4, 'David', 'david@gmail.com', 21);
commit;

select *
from student;


alter table student add phone varchar(15);
