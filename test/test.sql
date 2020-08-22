select * from CUSTOMER;
alter table customer add cpostcode number(5);
select * from cart;

drop table order1;
select * from customer where cno='10';
select* from customer;
select * from product;
select * from notice;
select * from review;
select * from order1;
select * from order_list;

alter table notice modify(nwriter varchar2(10) default '관리자');
alter table notice modify(nview number(5) default 0);
alter table notice modify(num number(5) default 0);
alter table notice modify(ncode number(5));
alter table order1 modify(ocount varchar2(5));
update category_b set b_name='스커트' where b_code='B1400';
alter table notice add nview number(5);
alter table order1 add ocode number(100);
alter table customer add cdetailaddr varchar2(100);
alter table product add pdel varchar(1) default'n';
alter table review add rimg varchar(100);
alter table product modify(poption varchar2(200));
alter table review modify(rimg varchar2(500));
alter table order_list modify(oinfo varchar2(100));
alter table review rename column cno to cid;
insert into notice values(ncode_seq.nextval,'안녕',sysdate,'관리자','안녕하세요',0);
create sequence lcode_seq
start with 1
increment by 1
maxvalue 1000
insert into notice(ncode) values(ncode_seq);
alter table review drop column cid;
select * from (select rowNum rn, a.* from(select * from notice order by ncode desc)a) where rn between 1 and 10;
select * from notice order by ncode;

select * from category_a;
select * from category_b;
update review set rimg='wm_goddl2.PNG';
update product set pimage='mk' where pcode='103';
insert into product values('','',19900,20,'images//_',
'',
'A1300','A1000','');
delete from review where rcode='1';
delete from order_list;
delete from order1;
insert into order1 values(ocode_seq.nextval,'member','1,2,3','n',114900,
		sysdate,'119,126,139','김회원','4322 서울 용산구 백범로 381 104호','010-7777-8888',
		'트임양기모후드,스프링반팔BL,썸머핀턱와이드P');
ALTER TABLE order1 DROP COLUMN pname;
create table order_list (lcode varchar2(10),ocode varchar2(10), cid varchar2(20),
odate varchar2(20), odel varchar2(1), ocount number(10),oprice number(10), oname varchar2(10),
oaddr varchar2(500),otel varchar2(15),omemo varchar2(500));
create table order1 (ocode varchar2(10),cid varchar2(20),pcode varchar2(20),pname varchar2(100),pcount number(10),pprice number(10),poption varchar2(50),pimage varchar2(100));
delete from cart where pcode='168' and cid='member2';
delete from CUSTOMER where cid='member2';


