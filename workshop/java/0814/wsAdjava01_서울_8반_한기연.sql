use tommy;

drop table emp;

CREATE TABLE EMP
(EMPNO int(4) PRIMARY KEY,
ENAME VARCHAR(10),
JOB VARCHAR(9),
MGR int(4),
HIREDATE DATE,
SAL decimal(7,2),
COMM decimal(7,2),
DEPTNO int(2));
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,cast('2010-10-19' as date),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,cast('2000-10-19' as date),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,cast('2013-05-19' as date),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,cast('2018-10-19' as date),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,cast('2008-04-19' as date),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,cast('2016-11-19' as date),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,cast('2017-10-19' as date),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,cast('2013-10-11' as date),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,cast('2014-08-19' as date),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,cast('2010-10-19' as date),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,cast('2000-09-19' as date),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,cast('2018-10-19' as date),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,cast('2003-10-19' as date),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,cast('2002-10-19' as date),1300,NULL,10);

select *
from emp;



-- 01) emp 테이블정보의 구조를 확인하는 sql을 작성하세요.
desc emp;

-- 02) 이름이 K로 시작하는 사원의 사원번호, 이름, 입사일, 급여를 검색하세요.
select empno 사원번호, ename 이름, hiredate 입사일, sal 급여
from emp
where ename like "K%";

-- 03) 입사일이 2000년도인 사람의 모든정보를 검색하세요.
select *
from emp
where hiredate between '2000-01-01' and '2000-12-31';

-- 04) 커미션이 NULL이 아닌사람의 모든정보를 검색하세요.
select *
from emp
where comm is not null;

-- 05) 부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이름, 부서, 월급을 검색하세요.
select ename 이름, deptno 부서, sal 월급
from emp
where sal>=1500 and deptno=30;

-- 06) 부서번호가 30인 사람 중 사원번호 SORT하여 출력되도록 검색하세요.
select *
from emp
where deptno =30
order by empno;

-- 07) 급여가 많은순으로 SORT하여 출력되도록 검색하세요.
select *
from emp
order by sal desc;

-- 08) 부서번호로 ASCENDING SORT한 후 급여가 많은 사람순으로 검색하세요.
select *
from emp
order by deptno, sal desc;

-- 09) 부서번호로 DESCENDING SORT하고, 이름순으로 ASCENDING SORT,급여순으로 DESCENDING SORT 하여 출력되도록 검색하세요.
select *
from emp
order by deptno desc, ename, sal desc;

-- 10) emp Table에서이름, 급여, 커미션금액, 총액(급여+커미션금액)을구하여총액이많은순서로검색하세요. 단, 커미션이NULL인사람은제외한다.(커미션금액: sal*comm/100)
select ename, sal, comm, sal+sal*comm/100 tot
from emp
where comm is not null
order by 4 desc;

-- 11) 10번부서의 모든사람들에게 급여의13%를 보너스로 지불하기로하였다. 이름, 급여, 보너스금액, 부서번호를 검색하세요.
select ename, sal, sal*1.13 bonus, deptno
from emp
where deptno =10;

-- 12) 부서번호가 20인사원의 시간당임금을 계산하여 검색하세요.단, 1달의 근무일수는 12일이고, 1일근무시간은5시간이다. 
--     출력양식은 이름, 급여, 시간당임금(소수이하첫번째자리에서반올림)을검색하세요.
select ename, sal, round(sal/12/5,1) 시급
from emp
where deptno =20;

-- 13) 급여가 $1,500부터$3,000 사이의 사람은 급여의15%를 회비로 지불하기로하였다. 이를이름, 급여, 회비(소수점두자리아래에서반올림)를 검색하세요.
select ename, sal, round(sal*0.15,2) 회비
from emp
where sal between 1500 and 3000;

-- 14) 모든 사원의 실수령액을 계산하여 검색하세요.. 단, 급여가많은순으로이름, 급여, 실수령액을검색하세요..(실수령액은급여에대해10%의세금을뺀금액)
select ename, sal, sal*0.9 실수령액
from emp
order by 2;

-- 15) 이름의 글자수가 6자이상인 사람의 이름을 앞에서 3자만구하여 소문자로 이름만을 검색하세요.
select LOWER(SUBSTRING(ename,1,3))
from emp
where LENGTH(ename)>=6;

-- 16) 10번부서 월급의평균, 최고, 최저, 인원수를 구하여 검색하세요.
select avg(sal)"월급의 평균", max(sal)최고, min(sal)최저, count(*)"인원 수"
from emp
where deptno=10
group by deptno;

-- 17) 각 부서별 같은 업무를하는 사람의 인원수를구하여 부서번호,업무명, 인원수를검색하세요.
select deptno, job, count(*)
from emp
group by deptno, job;

-- 18) 같은 업무를하는 사람의 수가 4명이상인 업무와 인원수를 검색하세요.
select  job, count(*)
from emp
group by job
having count(*)>=4;

-- 19) 입사일로부터 오늘까지의 일수를 구하여 이름, 입사일, 근무일수를 검색하세요.
select ename, datediff(curdate(),hiredate) 근무일수
from emp;

-- 20) 직원의 이름, 근속년수를 구하여 검색하세요.
select ename, YEAR(now())-YEAR(hiredate) 근속년수
from emp;
