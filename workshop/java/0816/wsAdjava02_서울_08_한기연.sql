use tommy;

drop table book;

-- S전자회사는 사회환원을 목적으로 누구나 활용할 수 있는 오픈 도서관을 운영하고자 한다.
-- 이 도서관의 도서들을 관리하기 위한 프로그램을 구현하고자한다.

-- 1. 도서정보를 저장하기 위한 테이블을 설계해보자.
create table book(
isbn char(8) primary key,
title varchar(50) not null,
author varchar(10) not null,
publisher varchar(15) not null,
price int not null,
description varchar(200));

-- 2. 도서 데이터를 5개 이상 insert 쿼리를 이용하여 저장하여 보자.
insert into book values(
'123-1-14','Java와 coffee','diana','자바닷컴',8000,'삶의즐거움');
insert into book values(
'555-23-2','AI와 미래','김현주','미래닷컴',20000,null);
insert into book values(
'123-2-15','Java와 놀기','김태희','자바닷컴',22000,'Java 정복');
insert into book values(
'123-6-24','Java와 알고리즘','서민규','자바닷컴',20000,'성능업!!');
insert into book values(
'423-5-36','IoT세상','이세준','미래닷컴',25000,null);

select *
from book;


-- 3. 모든 도서의 가격을 10% 인하하도록 수정하고, 결과를 검색하여 보자.
update book 
set price = price*0.9;

select * 
from book;

-- 4. 제목에 JAVA가 포함된 도서들은 20% 가격을 인하하도록 수정하고, 
--    결과를 검색하여 보자.
update book 
set price = price * 0.8
where title like '%Java%';

select * 
from book;

-- 5. 제목에 JAVA가 포함된도서에서 가격이 10,000 미만인도서는 삭제하고, 
--    결과를 검색하여 보자.
delete from book 
where title like '%Java%' and 
      price <10000; 
      
select * 
from book;

-- 6. 출판사별 도서의 개수와 가격의합계, 가격의 평균을 검색하여 보자.
select publisher, sum(price), avg(price)
from book
group by publisher;

-- 7. isbn 번호가 ‘555-23-2’인 도서의 descriptio을 
--    ‘AI 입문’으로 수정하여 수정된 결과를 검색하여 보자.
update book 
set description = 'AI 입문' 
where isbn = '555-23-2'; 

select * 
from book;

-- 8. isbn 번호가 123으로 시작하는 도서의 정보를 검색하여 보자.
select * 
from book
where isbn like '123%';


