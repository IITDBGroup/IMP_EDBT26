--------------------------
-- for tpch 10g q1  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q01_upd_1; 
create table t10_q01_upd_1 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q01_upd_1 add column updident int;
update t10_q01_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q01_upd_2; 
create table t10_q01_upd_2 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q01_upd_2 add column updident int;
update t10_q01_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q01_upd_3; 
create table t10_q01_upd_3 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q01_upd_3 add column updident int;
update t10_q01_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q01_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q01_upd_3 limit 5) ;
update t10_q01_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q01_upd_4; 
create table t10_q01_upd_4 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q01_upd_4 add column updident int;
update t10_q01_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q01_upd_5; 
create table t10_q01_upd_5 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q01_upd_5 add column updident int;
update t10_q01_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q01_upd_6; 
create table t10_q01_upd_6 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q01_upd_6 add column updident int;
update t10_q01_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q01_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q01_upd_6 limit 25) ;
update t10_q01_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q01_upd_7; 
create table t10_q01_upd_7 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q01_upd_7 add column updident int;
update t10_q01_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q01_upd_8; 
create table t10_q01_upd_8 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q01_upd_8 add column updident int;
update t10_q01_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q01_upd_9; 
create table t10_q01_upd_9 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q01_upd_9 add column updident int;
update t10_q01_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q01_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q01_upd_9 limit 50) ;
update t10_q01_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q01_upd_10; 
create table t10_q01_upd_10 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q01_upd_10 add column updident int;
update t10_q01_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q01_upd_11; 
create table t10_q01_upd_11 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q01_upd_11 add column updident int;
update t10_q01_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q01_upd_12; 
create table t10_q01_upd_12 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q01_upd_12 add column updident int;
update t10_q01_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q01_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q01_upd_12 limit 250) ;
update t10_q01_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q01_upd_13; 
create table t10_q01_upd_13 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q01_upd_13 add column updident int;
update t10_q01_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q01_upd_14; 
create table t10_q01_upd_14 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q01_upd_14 add column updident int;
update t10_q01_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q01_upd_15; 
create table t10_q01_upd_15 as select * from lineitem_backup where l_shipdate < to_date('1998-12-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q01_upd_15 add column updident int;
update t10_q01_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q01_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q01_upd_15 limit 500) ;
update t10_q01_upd_15 set updident = -1 where updident is null;

--------------------------
-- for tpch 10g q03  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q03_upd_1; 
create table t10_q03_upd_1 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 10;
alter table t10_q03_upd_1 add column updident int;
update t10_q03_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q03_upd_2; 
create table t10_q03_upd_2 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 10;
alter table t10_q03_upd_2 add column updident int;
update t10_q03_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q03_upd_3; 
create table t10_q03_upd_3 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 10;
alter table t10_q03_upd_3 add column updident int;
update t10_q03_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q03_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q03_upd_3 limit 5) ;
update t10_q03_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q03_upd_4; 
create table t10_q03_upd_4 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 50;
alter table t10_q03_upd_4 add column updident int;
update t10_q03_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q03_upd_5; 
create table t10_q03_upd_5 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 50;
alter table t10_q03_upd_5 add column updident int;
update t10_q03_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q03_upd_6; 
create table t10_q03_upd_6 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 50;
alter table t10_q03_upd_6 add column updident int;
update t10_q03_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q03_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q03_upd_6 limit 25) ;
update t10_q03_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q03_upd_7; 
create table t10_q03_upd_7 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 100;
alter table t10_q03_upd_7 add column updident int;
update t10_q03_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q03_upd_8; 
create table t10_q03_upd_8 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 100;
alter table t10_q03_upd_8 add column updident int;
update t10_q03_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q03_upd_9; 
create table t10_q03_upd_9 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 100;
alter table t10_q03_upd_9 add column updident int;
update t10_q03_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q03_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q03_upd_9 limit 50) ;
update t10_q03_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q03_upd_10; 
create table t10_q03_upd_10 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 500;
alter table t10_q03_upd_10 add column updident int;
update t10_q03_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q03_upd_11; 
create table t10_q03_upd_11 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 500;
alter table t10_q03_upd_11 add column updident int;
update t10_q03_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q03_upd_12; 
create table t10_q03_upd_12 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 500;
alter table t10_q03_upd_12 add column updident int;
update t10_q03_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q03_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q03_upd_12 limit 250) ;
update t10_q03_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q03_upd_13; 
create table t10_q03_upd_13 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 1000;
alter table t10_q03_upd_13 add column updident int;
update t10_q03_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q03_upd_14; 
create table t10_q03_upd_14 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 1000;
alter table t10_q03_upd_14 add column updident int;
update t10_q03_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q03_upd_15; 
create table t10_q03_upd_15 as select * from lineitem_backup where l_shipdate > TO_DATE('1995-03-15','YYYY-MM-DD') order by random() limit 1000;
alter table t10_q03_upd_15 add column updident int;
update t10_q03_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q03_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q03_upd_15 limit 500) ;
update t10_q03_upd_15 set updident = -1 where updident is null;

--------------------------
-- for tpch 10g q4  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q04_upd_1; 
create table t10_q04_upd_1 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q04_upd_1 add column updident int;
update t10_q04_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q04_upd_2; 
create table t10_q04_upd_2 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q04_upd_2 add column updident int;
update t10_q04_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q04_upd_3; 
create table t10_q04_upd_3 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q04_upd_3 add column updident int;
update t10_q04_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q04_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q04_upd_3 limit 5) ;
update t10_q04_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q04_upd_4; 
create table t10_q04_upd_4 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q04_upd_4 add column updident int;
update t10_q04_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q04_upd_5; 
create table t10_q04_upd_5 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q04_upd_5 add column updident int;
update t10_q04_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q04_upd_6; 
create table t10_q04_upd_6 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q04_upd_6 add column updident int;
update t10_q04_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q04_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q04_upd_6 limit 25) ;
update t10_q04_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q04_upd_7; 
create table t10_q04_upd_7 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q04_upd_7 add column updident int;
update t10_q04_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q04_upd_8; 
create table t10_q04_upd_8 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q04_upd_8 add column updident int;
update t10_q04_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q04_upd_9; 
create table t10_q04_upd_9 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q04_upd_9 add column updident int;
update t10_q04_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q04_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q04_upd_9 limit 50) ;
update t10_q04_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q04_upd_10; 
create table t10_q04_upd_10 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q04_upd_10 add column updident int;
update t10_q04_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q04_upd_11; 
create table t10_q04_upd_11 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q04_upd_11 add column updident int;
update t10_q04_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q04_upd_12; 
create table t10_q04_upd_12 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q04_upd_12 add column updident int;
update t10_q04_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q04_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q04_upd_12 limit 250) ;
update t10_q04_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q04_upd_13; 
create table t10_q04_upd_13 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q04_upd_13 add column updident int;
update t10_q04_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q04_upd_14; 
create table t10_q04_upd_14 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q04_upd_14 add column updident int;
update t10_q04_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q04_upd_15; 
create table t10_q04_upd_15 as select * from lineitem_backup where l_shipdate >= to_date('1996-07-01', 'YYYY-MM-DD') and l_shipdate < to_date('1996-10-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q04_upd_15 add column updident int;
update t10_q04_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q04_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q04_upd_15 limit 500) ;
update t10_q04_upd_15 set updident = -1 where updident is null;

--------------------------
-- for tpch 10g q5  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q05_upd_1; 
create table t10_q05_upd_1 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 10;
alter table t10_q05_upd_1 add column updident int;
update t10_q05_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q05_upd_2; 
create table t10_q05_upd_2 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 10;
alter table t10_q05_upd_2 add column updident int;
update t10_q05_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q05_upd_3; 
create table t10_q05_upd_3 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 10;
alter table t10_q05_upd_3 add column updident int;
update t10_q05_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q05_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q05_upd_3 limit 5) ;
update t10_q05_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q05_upd_4; 
create table t10_q05_upd_4 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 50;
alter table t10_q05_upd_4 add column updident int;
update t10_q05_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q05_upd_5; 
create table t10_q05_upd_5 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 50;
alter table t10_q05_upd_5 add column updident int;
update t10_q05_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q05_upd_6; 
create table t10_q05_upd_6 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 50;
alter table t10_q05_upd_6 add column updident int;
update t10_q05_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q05_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q05_upd_6 limit 25) ;
update t10_q05_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q05_upd_7; 
create table t10_q05_upd_7 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 100;
alter table t10_q05_upd_7 add column updident int;
update t10_q05_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q05_upd_8; 
create table t10_q05_upd_8 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 100;
alter table t10_q05_upd_8 add column updident int;
update t10_q05_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q05_upd_9; 
create table t10_q05_upd_9 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 100;
alter table t10_q05_upd_9 add column updident int;
update t10_q05_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q05_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q05_upd_9 limit 50) ;
update t10_q05_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q05_upd_10; 
create table t10_q05_upd_10 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 500;
alter table t10_q05_upd_10 add column updident int;
update t10_q05_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q05_upd_11; 
create table t10_q05_upd_11 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 500;
alter table t10_q05_upd_11 add column updident int;
update t10_q05_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q05_upd_12; 
create table t10_q05_upd_12 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 500;
alter table t10_q05_upd_12 add column updident int;
update t10_q05_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q05_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q05_upd_12 limit 250) ;
update t10_q05_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q05_upd_13; 
create table t10_q05_upd_13 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 1000;
alter table t10_q05_upd_13 add column updident int;
update t10_q05_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q05_upd_14; 
create table t10_q05_upd_14 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 1000;
alter table t10_q05_upd_14 add column updident int;
update t10_q05_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q05_upd_15; 
create table t10_q05_upd_15 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01','YYYY-MM-DD') order by random() limit 1000;
alter table t10_q05_upd_15 add column updident int;
update t10_q05_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q05_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q05_upd_15 limit 500) ;
update t10_q05_upd_15 set updident = -1 where updident is null;

--------------------------
-- for tpch 10g q6  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q06_upd_1; 
create table t10_q06_upd_1 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 10;
alter table t10_q06_upd_1 add column updident int;
update t10_q06_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q06_upd_2; 
create table t10_q06_upd_2 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 10;
alter table t10_q06_upd_2 add column updident int;
update t10_q06_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q06_upd_3; 
create table t10_q06_upd_3 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 10;
alter table t10_q06_upd_3 add column updident int;
update t10_q06_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q06_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q06_upd_3 limit 5) ;
update t10_q06_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q06_upd_4; 
create table t10_q06_upd_4 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 50;
alter table t10_q06_upd_4 add column updident int;
update t10_q06_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q06_upd_5; 
create table t10_q06_upd_5 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 50;
alter table t10_q06_upd_5 add column updident int;
update t10_q06_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q06_upd_6; 
create table t10_q06_upd_6 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 50;
alter table t10_q06_upd_6 add column updident int;
update t10_q06_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q06_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q06_upd_6 limit 25) ;
update t10_q06_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q06_upd_7; 
create table t10_q06_upd_7 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 100;
alter table t10_q06_upd_7 add column updident int;
update t10_q06_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q06_upd_8; 
create table t10_q06_upd_8 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 100;
alter table t10_q06_upd_8 add column updident int;
update t10_q06_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q06_upd_9; 
create table t10_q06_upd_9 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 100;
alter table t10_q06_upd_9 add column updident int;
update t10_q06_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q06_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q06_upd_9 limit 50) ;
update t10_q06_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q06_upd_10; 
create table t10_q06_upd_10 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 500;
alter table t10_q06_upd_10 add column updident int;
update t10_q06_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q06_upd_11; 
create table t10_q06_upd_11 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 500;
alter table t10_q06_upd_11 add column updident int;
update t10_q06_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q06_upd_12; 
create table t10_q06_upd_12 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 500;
alter table t10_q06_upd_12 add column updident int;
update t10_q06_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q06_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q06_upd_12 limit 250) ;
update t10_q06_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q06_upd_13; 
create table t10_q06_upd_13 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 1000;
alter table t10_q06_upd_13 add column updident int;
update t10_q06_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q06_upd_14; 
create table t10_q06_upd_14 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 1000;
alter table t10_q06_upd_14 add column updident int;
update t10_q06_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q06_upd_15; 
create table t10_q06_upd_15 as select * from lineitem_backup where l_shipdate >= TO_DATE('1994-01-01', 'YYYY-MM-DD') AND l_shipdate < TO_DATE('1995-01-01', 'YYYY-MM-DD') AND l_discount > 0.05 AND l_discount < 0.07 AND l_quantity < 24 order by random() limit 1000;
alter table t10_q06_upd_15 add column updident int;
update t10_q06_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q06_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q06_upd_15 limit 500) ;
update t10_q06_upd_15 set updident = -1 where updident is null;

--------------------------
-- for tpch 10g q7  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q07_upd_1; 
create table t10_q07_upd_1 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 10;
alter table t10_q07_upd_1 add column updident int;
update t10_q07_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q07_upd_2; 
create table t10_q07_upd_2 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 10;
alter table t10_q07_upd_2 add column updident int;
update t10_q07_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q07_upd_3; 
create table t10_q07_upd_3 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 10;
alter table t10_q07_upd_3 add column updident int;
update t10_q07_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q07_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q07_upd_3 limit 5) ;
update t10_q07_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q07_upd_4; 
create table t10_q07_upd_4 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 50;
alter table t10_q07_upd_4 add column updident int;
update t10_q07_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q07_upd_5; 
create table t10_q07_upd_5 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 50;
alter table t10_q07_upd_5 add column updident int;
update t10_q07_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q07_upd_6; 
create table t10_q07_upd_6 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 50;
alter table t10_q07_upd_6 add column updident int;
update t10_q07_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q07_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q07_upd_6 limit 25) ;
update t10_q07_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q07_upd_7; 
create table t10_q07_upd_7 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 100;
alter table t10_q07_upd_7 add column updident int;
update t10_q07_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q07_upd_8; 
create table t10_q07_upd_8 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 100;
alter table t10_q07_upd_8 add column updident int;
update t10_q07_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q07_upd_9; 
create table t10_q07_upd_9 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 100;
alter table t10_q07_upd_9 add column updident int;
update t10_q07_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q07_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q07_upd_9 limit 50) ;
update t10_q07_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q07_upd_10; 
create table t10_q07_upd_10 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 500;
alter table t10_q07_upd_10 add column updident int;
update t10_q07_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q07_upd_11; 
create table t10_q07_upd_11 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 500;
alter table t10_q07_upd_11 add column updident int;
update t10_q07_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q07_upd_12; 
create table t10_q07_upd_12 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 500;
alter table t10_q07_upd_12 add column updident int;
update t10_q07_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q07_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q07_upd_12 limit 250) ;
update t10_q07_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q07_upd_13; 
create table t10_q07_upd_13 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 1000;
alter table t10_q07_upd_13 add column updident int;
update t10_q07_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q07_upd_14; 
create table t10_q07_upd_14 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 1000;
alter table t10_q07_upd_14 add column updident int;
update t10_q07_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q07_upd_15; 
create table t10_q07_upd_15 as select * from lineitem_backup where l_shipdate > '1995-01-01' and l_shipdate < '1996-12-31' order by random() limit 1000;
alter table t10_q07_upd_15 add column updident int;
update t10_q07_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q07_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q07_upd_15 limit 500) ;
update t10_q07_upd_15 set updident = -1 where updident is null;

--------------------------
-- for tpch 10g q8  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q08_upd_1; 
create table t10_q08_upd_1 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q08_upd_1 add column updident int;
update t10_q08_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q08_upd_2; 
create table t10_q08_upd_2 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q08_upd_2 add column updident int;
update t10_q08_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q08_upd_3; 
create table t10_q08_upd_3 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q08_upd_3 add column updident int;
update t10_q08_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q08_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q08_upd_3 limit 5) ;
update t10_q08_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q08_upd_4; 
create table t10_q08_upd_4 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q08_upd_4 add column updident int;
update t10_q08_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q08_upd_5; 
create table t10_q08_upd_5 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q08_upd_5 add column updident int;
update t10_q08_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q08_upd_6; 
create table t10_q08_upd_6 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q08_upd_6 add column updident int;
update t10_q08_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q08_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q08_upd_6 limit 25) ;
update t10_q08_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q08_upd_7; 
create table t10_q08_upd_7 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q08_upd_7 add column updident int;
update t10_q08_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q08_upd_8; 
create table t10_q08_upd_8 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q08_upd_8 add column updident int;
update t10_q08_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q08_upd_9; 
create table t10_q08_upd_9 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q08_upd_9 add column updident int;
update t10_q08_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q08_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q08_upd_9 limit 50) ;
update t10_q08_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q08_upd_10; 
create table t10_q08_upd_10 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q08_upd_10 add column updident int;
update t10_q08_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q08_upd_11; 
create table t10_q08_upd_11 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q08_upd_11 add column updident int;
update t10_q08_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q08_upd_12; 
create table t10_q08_upd_12 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q08_upd_12 add column updident int;
update t10_q08_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q08_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q08_upd_12 limit 250) ;
update t10_q08_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q08_upd_13; 
create table t10_q08_upd_13 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q08_upd_13 add column updident int;
update t10_q08_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q08_upd_14; 
create table t10_q08_upd_14 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q08_upd_14 add column updident int;
update t10_q08_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q08_upd_15; 
create table t10_q08_upd_15 as select * from lineitem_backup where l_shipdate >= to_date('1995-01-01', 'YYYY-MM-DD') and l_shipdate <= to_date('1996-12-31', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q08_upd_15 add column updident int;
update t10_q08_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q08_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q08_upd_15 limit 500) ;
update t10_q08_upd_15 set updident = -1 where updident is null;

--------------------------
-- for tpch 10g q9  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q09_upd_1; 
create table t10_q09_upd_1 as select * from lineitem_backup  order by random() limit 10;
alter table t10_q09_upd_1 add column updident int;
update t10_q09_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q09_upd_2; 
create table t10_q09_upd_2 as select * from lineitem_backup  order by random() limit 10;
alter table t10_q09_upd_2 add column updident int;
update t10_q09_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q09_upd_3; 
create table t10_q09_upd_3 as select * from lineitem_backup  order by random() limit 10;
alter table t10_q09_upd_3 add column updident int;
update t10_q09_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q09_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q09_upd_3 limit 5) ;
update t10_q09_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q09_upd_4; 
create table t10_q09_upd_4 as select * from lineitem_backup  order by random() limit 50;
alter table t10_q09_upd_4 add column updident int;
update t10_q09_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q09_upd_5; 
create table t10_q09_upd_5 as select * from lineitem_backup  order by random() limit 50;
alter table t10_q09_upd_5 add column updident int;
update t10_q09_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q09_upd_6; 
create table t10_q09_upd_6 as select * from lineitem_backup  order by random() limit 50;
alter table t10_q09_upd_6 add column updident int;
update t10_q09_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q09_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q09_upd_6 limit 25) ;
update t10_q09_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q09_upd_7; 
create table t10_q09_upd_7 as select * from lineitem_backup  order by random() limit 100;
alter table t10_q09_upd_7 add column updident int;
update t10_q09_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q09_upd_8; 
create table t10_q09_upd_8 as select * from lineitem_backup  order by random() limit 100;
alter table t10_q09_upd_8 add column updident int;
update t10_q09_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q09_upd_9; 
create table t10_q09_upd_9 as select * from lineitem_backup  order by random() limit 100;
alter table t10_q09_upd_9 add column updident int;
update t10_q09_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q09_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q09_upd_9 limit 50) ;
update t10_q09_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q09_upd_10; 
create table t10_q09_upd_10 as select * from lineitem_backup  order by random() limit 500;
alter table t10_q09_upd_10 add column updident int;
update t10_q09_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q09_upd_11; 
create table t10_q09_upd_11 as select * from lineitem_backup  order by random() limit 500;
alter table t10_q09_upd_11 add column updident int;
update t10_q09_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q09_upd_12; 
create table t10_q09_upd_12 as select * from lineitem_backup  order by random() limit 500;
alter table t10_q09_upd_12 add column updident int;
update t10_q09_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q09_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q09_upd_12 limit 250) ;
update t10_q09_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q09_upd_13; 
create table t10_q09_upd_13 as select * from lineitem_backup  order by random() limit 1000;
alter table t10_q09_upd_13 add column updident int;
update t10_q09_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q09_upd_14; 
create table t10_q09_upd_14 as select * from lineitem_backup  order by random() limit 1000;
alter table t10_q09_upd_14 add column updident int;
update t10_q09_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q09_upd_15; 
create table t10_q09_upd_15 as select * from lineitem_backup  order by random() limit 1000;
alter table t10_q09_upd_15 add column updident int;
update t10_q09_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q09_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q09_upd_15 limit 500) ;
update t10_q09_upd_15 set updident = -1 where updident is null;

--------------------------
-- for tpch 10g q10  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q10_upd_1; 
create table t10_q10_upd_1 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 10;
alter table t10_q10_upd_1 add column updident int;
update t10_q10_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q10_upd_2; 
create table t10_q10_upd_2 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 10;
alter table t10_q10_upd_2 add column updident int;
update t10_q10_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q10_upd_3; 
create table t10_q10_upd_3 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 10;
alter table t10_q10_upd_3 add column updident int;
update t10_q10_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q10_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q10_upd_3 limit 5) ;
update t10_q10_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q10_upd_4; 
create table t10_q10_upd_4 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 50;
alter table t10_q10_upd_4 add column updident int;
update t10_q10_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q10_upd_5; 
create table t10_q10_upd_5 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 50;
alter table t10_q10_upd_5 add column updident int;
update t10_q10_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q10_upd_6; 
create table t10_q10_upd_6 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 50;
alter table t10_q10_upd_6 add column updident int;
update t10_q10_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q10_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q10_upd_6 limit 25) ;
update t10_q10_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q10_upd_7; 
create table t10_q10_upd_7 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 100;
alter table t10_q10_upd_7 add column updident int;
update t10_q10_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q10_upd_8; 
create table t10_q10_upd_8 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 100;
alter table t10_q10_upd_8 add column updident int;
update t10_q10_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q10_upd_9; 
create table t10_q10_upd_9 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 100;
alter table t10_q10_upd_9 add column updident int;
update t10_q10_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q10_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q10_upd_9 limit 50) ;
update t10_q10_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q10_upd_10; 
create table t10_q10_upd_10 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 500;
alter table t10_q10_upd_10 add column updident int;
update t10_q10_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q10_upd_11; 
create table t10_q10_upd_11 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 500;
alter table t10_q10_upd_11 add column updident int;
update t10_q10_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q10_upd_12; 
create table t10_q10_upd_12 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 500;
alter table t10_q10_upd_12 add column updident int;
update t10_q10_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q10_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q10_upd_12 limit 250) ;
update t10_q10_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q10_upd_13; 
create table t10_q10_upd_13 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 1000;
alter table t10_q10_upd_13 add column updident int;
update t10_q10_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q10_upd_14; 
create table t10_q10_upd_14 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 1000;
alter table t10_q10_upd_14 add column updident int;
update t10_q10_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q10_upd_15; 
create table t10_q10_upd_15 as select * from lineitem_backup where l_returnflag = 'R' order by random() limit 1000;
alter table t10_q10_upd_15 add column updident int;
update t10_q10_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q10_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q10_upd_15 limit 500) ;
update t10_q10_upd_15 set updident = -1 where updident is null;

--------------------------
-- for tpch 10g q12  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q12_upd_1; 
create table t10_q12_upd_1 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q12_upd_1 add column updident int;
update t10_q12_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q12_upd_2; 
create table t10_q12_upd_2 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q12_upd_2 add column updident int;
update t10_q12_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q12_upd_3; 
create table t10_q12_upd_3 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q12_upd_3 add column updident int;
update t10_q12_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q12_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q12_upd_3 limit 5) ;
update t10_q12_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q12_upd_4; 
create table t10_q12_upd_4 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q12_upd_4 add column updident int;
update t10_q12_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q12_upd_5; 
create table t10_q12_upd_5 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q12_upd_5 add column updident int;
update t10_q12_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q12_upd_6; 
create table t10_q12_upd_6 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q12_upd_6 add column updident int;
update t10_q12_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q12_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q12_upd_6 limit 25) ;
update t10_q12_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q12_upd_7; 
create table t10_q12_upd_7 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q12_upd_7 add column updident int;
update t10_q12_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q12_upd_8; 
create table t10_q12_upd_8 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q12_upd_8 add column updident int;
update t10_q12_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q12_upd_9; 
create table t10_q12_upd_9 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q12_upd_9 add column updident int;
update t10_q12_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q12_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q12_upd_9 limit 50) ;
update t10_q12_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q12_upd_10; 
create table t10_q12_upd_10 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q12_upd_10 add column updident int;
update t10_q12_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q12_upd_11; 
create table t10_q12_upd_11 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q12_upd_11 add column updident int;
update t10_q12_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q12_upd_12; 
create table t10_q12_upd_12 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q12_upd_12 add column updident int;
update t10_q12_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q12_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q12_upd_12 limit 250) ;
update t10_q12_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q12_upd_13; 
create table t10_q12_upd_13 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q12_upd_13 add column updident int;
update t10_q12_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q12_upd_14; 
create table t10_q12_upd_14 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q12_upd_14 add column updident int;
update t10_q12_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q12_upd_15; 
create table t10_q12_upd_15 as select * from lineitem_backup where (l_shipmode = 'MAIL' or l_shipmode = 'SHIP') and l_commitdate < l_receiptdate and l_shipdate < l_commitdate and l_receiptdate > to_date('1994-01-01', 'YYYY-MM-DD') and l_receiptdate < to_date('1995-01-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q12_upd_15 add column updident int;
update t10_q12_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q12_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q12_upd_15 limit 500) ;
update t10_q12_upd_15 set updident = -1 where updident is null;

--------------------------
-- for tpch 10g q14  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q14_upd_1; 
create table t10_q14_upd_1 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q14_upd_1 add column updident int;
update t10_q14_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q14_upd_2; 
create table t10_q14_upd_2 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q14_upd_2 add column updident int;
update t10_q14_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q14_upd_3; 
create table t10_q14_upd_3 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 10;
alter table t10_q14_upd_3 add column updident int;
update t10_q14_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q14_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q14_upd_3 limit 5) ;
update t10_q14_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q14_upd_4; 
create table t10_q14_upd_4 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q14_upd_4 add column updident int;
update t10_q14_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q14_upd_5; 
create table t10_q14_upd_5 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q14_upd_5 add column updident int;
update t10_q14_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q14_upd_6; 
create table t10_q14_upd_6 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 50;
alter table t10_q14_upd_6 add column updident int;
update t10_q14_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q14_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q14_upd_6 limit 25) ;
update t10_q14_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q14_upd_7; 
create table t10_q14_upd_7 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q14_upd_7 add column updident int;
update t10_q14_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q14_upd_8; 
create table t10_q14_upd_8 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q14_upd_8 add column updident int;
update t10_q14_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q14_upd_9; 
create table t10_q14_upd_9 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 100;
alter table t10_q14_upd_9 add column updident int;
update t10_q14_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q14_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q14_upd_9 limit 50) ;
update t10_q14_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q14_upd_10; 
create table t10_q14_upd_10 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q14_upd_10 add column updident int;
update t10_q14_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q14_upd_11; 
create table t10_q14_upd_11 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q14_upd_11 add column updident int;
update t10_q14_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q14_upd_12; 
create table t10_q14_upd_12 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 500;
alter table t10_q14_upd_12 add column updident int;
update t10_q14_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q14_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q14_upd_12 limit 250) ;
update t10_q14_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q14_upd_13; 
create table t10_q14_upd_13 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q14_upd_13 add column updident int;
update t10_q14_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q14_upd_14; 
create table t10_q14_upd_14 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q14_upd_14 add column updident int;
update t10_q14_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q14_upd_15; 
create table t10_q14_upd_15 as select * from lineitem_backup where l_shipdate >= to_date('1995-09-01', 'YYYY-MM-DD') and l_shipdate < to_date('1995-10-01', 'YYYY-MM-DD') order by random() limit 1000;
alter table t10_q14_upd_15 add column updident int;
update t10_q14_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q14_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q14_upd_15 limit 500) ;
update t10_q14_upd_15 set updident = -1 where updident is null;

--------------------------
-- for tpch 10g q19  
--------------------------
-- --insert only for tuples: 10
drop table if exists t10_q19_upd_1; 
create table t10_q19_upd_1 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 10;
alter table t10_q19_upd_1 add column updident int;
update t10_q19_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists t10_q19_upd_2; 
create table t10_q19_upd_2 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 10;
alter table t10_q19_upd_2 add column updident int;
update t10_q19_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists t10_q19_upd_3; 
create table t10_q19_upd_3 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 10;
alter table t10_q19_upd_3 add column updident int;
update t10_q19_upd_3 set updident = 1 where l_orderkey in (select l_orderkey from t10_q19_upd_3 limit 5)  and l_linenumber in (select l_linenumber from t10_q19_upd_3 limit 5) ;
update t10_q19_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists t10_q19_upd_4; 
create table t10_q19_upd_4 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 50;
alter table t10_q19_upd_4 add column updident int;
update t10_q19_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists t10_q19_upd_5; 
create table t10_q19_upd_5 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 50;
alter table t10_q19_upd_5 add column updident int;
update t10_q19_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists t10_q19_upd_6; 
create table t10_q19_upd_6 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 50;
alter table t10_q19_upd_6 add column updident int;
update t10_q19_upd_6 set updident = 1 where l_orderkey in (select l_orderkey from t10_q19_upd_6 limit 25)  and l_linenumber in (select l_linenumber from t10_q19_upd_6 limit 25) ;
update t10_q19_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists t10_q19_upd_7; 
create table t10_q19_upd_7 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 100;
alter table t10_q19_upd_7 add column updident int;
update t10_q19_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists t10_q19_upd_8; 
create table t10_q19_upd_8 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 100;
alter table t10_q19_upd_8 add column updident int;
update t10_q19_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists t10_q19_upd_9; 
create table t10_q19_upd_9 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 100;
alter table t10_q19_upd_9 add column updident int;
update t10_q19_upd_9 set updident = 1 where l_orderkey in (select l_orderkey from t10_q19_upd_9 limit 50)  and l_linenumber in (select l_linenumber from t10_q19_upd_9 limit 50) ;
update t10_q19_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists t10_q19_upd_10; 
create table t10_q19_upd_10 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 500;
alter table t10_q19_upd_10 add column updident int;
update t10_q19_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists t10_q19_upd_11; 
create table t10_q19_upd_11 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 500;
alter table t10_q19_upd_11 add column updident int;
update t10_q19_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists t10_q19_upd_12; 
create table t10_q19_upd_12 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 500;
alter table t10_q19_upd_12 add column updident int;
update t10_q19_upd_12 set updident = 1 where l_orderkey in (select l_orderkey from t10_q19_upd_12 limit 250)  and l_linenumber in (select l_linenumber from t10_q19_upd_12 limit 250) ;
update t10_q19_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists t10_q19_upd_13; 
create table t10_q19_upd_13 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 1000;
alter table t10_q19_upd_13 add column updident int;
update t10_q19_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists t10_q19_upd_14; 
create table t10_q19_upd_14 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 1000;
alter table t10_q19_upd_14 add column updident int;
update t10_q19_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists t10_q19_upd_15; 
create table t10_q19_upd_15 as select * from lineitem_backup where (l_shipmode = 'AIR' or l_shipmode = 'AIR REG') and l_shipinstruct = 'DELIVER IN PERSON' order by random() limit 1000;
alter table t10_q19_upd_15 add column updident int;
update t10_q19_upd_15 set updident = 1 where l_orderkey in (select l_orderkey from t10_q19_upd_15 limit 500)  and l_linenumber in (select l_linenumber from t10_q19_upd_15 limit 500) ;
update t10_q19_upd_15 set updident = -1 where updident is null;

