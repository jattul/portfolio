create table member(
 mid varchar2(20)
 ,pwd varchar2(20) not null
 ,primary key(mid)
)

insert into member values('abc','123');

select * from member

commit
