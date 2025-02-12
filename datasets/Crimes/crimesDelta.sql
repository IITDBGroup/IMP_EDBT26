--------------------------
-- For all crimes  
--------------------------
-- --insert only for tuples: 10
drop table if exists crimes_delta_upd_1; 
create table crimes_delta_upd_1 as select * from crimes_backup order by random() limit 10;
alter table crimes_delta_upd_1 add column updident int;
update crimes_delta_upd_1 set updident = 1;

-- -- delete only for tuples: 10
drop table if exists crimes_delta_upd_2; 
create table crimes_delta_upd_2 as select * from crimes_backup order by random() limit 10;
alter table crimes_delta_upd_2 add column updident int;
update crimes_delta_upd_2 set updident = -1;

-- -- mix for tuples: 10
drop table if exists crimes_delta_upd_3; 
create table crimes_delta_upd_3 as select * from crimes_backup order by random() limit 5;
alter table crimes_delta_upd_3 add column updident int;
update crimes_delta_upd_3 set updident = 1;
insert into crimes_delta_upd_3 select * from crimes_backup order by random() limit 5; 
update crimes_delta_upd_3 set updident = -1 where updident is null;

-- --insert only for tuples: 50
drop table if exists crimes_delta_upd_4; 
create table crimes_delta_upd_4 as select * from crimes_backup order by random() limit 50;
alter table crimes_delta_upd_4 add column updident int;
update crimes_delta_upd_4 set updident = 1;

-- -- delete only for tuples: 50
drop table if exists crimes_delta_upd_5; 
create table crimes_delta_upd_5 as select * from crimes_backup order by random() limit 50;
alter table crimes_delta_upd_5 add column updident int;
update crimes_delta_upd_5 set updident = -1;

-- -- mix for tuples: 50
drop table if exists crimes_delta_upd_6; 
create table crimes_delta_upd_6 as select * from crimes_backup order by random() limit 25;
alter table crimes_delta_upd_6 add column updident int;
update crimes_delta_upd_6 set updident = 1;
insert into crimes_delta_upd_6 select * from crimes_backup order by random() limit 25; 
update crimes_delta_upd_6 set updident = -1 where updident is null;

-- --insert only for tuples: 100
drop table if exists crimes_delta_upd_7; 
create table crimes_delta_upd_7 as select * from crimes_backup order by random() limit 100;
alter table crimes_delta_upd_7 add column updident int;
update crimes_delta_upd_7 set updident = 1;

-- -- delete only for tuples: 100
drop table if exists crimes_delta_upd_8; 
create table crimes_delta_upd_8 as select * from crimes_backup order by random() limit 100;
alter table crimes_delta_upd_8 add column updident int;
update crimes_delta_upd_8 set updident = -1;

-- -- mix for tuples: 100
drop table if exists crimes_delta_upd_9; 
create table crimes_delta_upd_9 as select * from crimes_backup order by random() limit 50;
alter table crimes_delta_upd_9 add column updident int;
update crimes_delta_upd_9 set updident = 1;
insert into crimes_delta_upd_9 select * from crimes_backup order by random() limit 50; 
update crimes_delta_upd_9 set updident = -1 where updident is null;

-- --insert only for tuples: 500
drop table if exists crimes_delta_upd_10; 
create table crimes_delta_upd_10 as select * from crimes_backup order by random() limit 500;
alter table crimes_delta_upd_10 add column updident int;
update crimes_delta_upd_10 set updident = 1;

-- -- delete only for tuples: 500
drop table if exists crimes_delta_upd_11; 
create table crimes_delta_upd_11 as select * from crimes_backup order by random() limit 500;
alter table crimes_delta_upd_11 add column updident int;
update crimes_delta_upd_11 set updident = -1;

-- -- mix for tuples: 500
drop table if exists crimes_delta_upd_12; 
create table crimes_delta_upd_12 as select * from crimes_backup order by random() limit 250;
alter table crimes_delta_upd_12 add column updident int;
update crimes_delta_upd_12 set updident = 1;
insert into crimes_delta_upd_12 select * from crimes_backup order by random() limit 250; 
update crimes_delta_upd_12 set updident = -1 where updident is null;

-- --insert only for tuples: 1000
drop table if exists crimes_delta_upd_13; 
create table crimes_delta_upd_13 as select * from crimes_backup order by random() limit 1000;
alter table crimes_delta_upd_13 add column updident int;
update crimes_delta_upd_13 set updident = 1;

-- -- delete only for tuples: 1000
drop table if exists crimes_delta_upd_14; 
create table crimes_delta_upd_14 as select * from crimes_backup order by random() limit 1000;
alter table crimes_delta_upd_14 add column updident int;
update crimes_delta_upd_14 set updident = -1;

-- -- mix for tuples: 1000
drop table if exists crimes_delta_upd_15; 
create table crimes_delta_upd_15 as select * from crimes_backup order by random() limit 500;
alter table crimes_delta_upd_15 add column updident int;
update crimes_delta_upd_15 set updident = 1;
insert into crimes_delta_upd_15 select * from crimes_backup order by random() limit 500; 
update crimes_delta_upd_15 set updident = -1 where updident is null;

