-- create and load r500
drop table if exists r500;
drop table if exists r500_backup;
create table r500 (a int,b int,c int,d int,e int,f int,g int,h int,i int,j int);
COPY r500 FROM '/home/perm/pengyuan/data/synthetics/genData/r500.csv' DELIMITER ',' CSV HEADER;
create table r500_backup as select * from r500;

-- create and load t1gb50g
drop table if exists t1gb50g;
drop table if exists t1gb50g_backup;
create table t1gb50g (id int,a int,b int,c int,d int,e int,f float,g float,h float,i float,j float,k float);
COPY t1gb50g FROM '/home/perm/pengyuan/data/synthetics/genData/t1gb50g.csv' DELIMITER ',' CSV HEADER;
ALTER TABLE t1gb50g ADD PRIMARY KEY(id);
create index t1gb50g_a on t1gb50g(a);
create table t1gb50g_backup as select * from t1gb50g;

-- create and load t1gb1000g
drop table if exists t1gb1000g;
drop table if exists t1gb1000g_backup;
create table t1gb1000g (id int,a int,b int,c int,d int,e int,f float,g float,h float,i float,j float,k float);
COPY t1gb1000g FROM '/home/perm/pengyuan/data/synthetics/genData/t1gb1000g.csv' DELIMITER ',' CSV HEADER;
ALTER TABLE t1gb1000g ADD PRIMARY KEY(id);
create index t1gb1000g_a on t1gb1000g(a);
create table t1gb1000g_backup as select * from t1gb1000g;

-- create and load t1gb5000g
drop table if exists t1gb5000g;
drop table if exists t1gb5000g_backup;
create table t1gb5000g (id int,a int,b int,c int,d int,e int,f float,g float,h float,i float,j float,k float);
COPY t1gb5000g FROM '/home/perm/pengyuan/data/synthetics/genData/t1gb5000g.csv' DELIMITER ',' CSV HEADER;
ALTER TABLE t1gb5000g ADD PRIMARY KEY(id);
create index t1gb5000g_a on t1gb5000g(a);
create table t1gb5000g_backup as select * from t1gb5000g;

-- create and load t1gb500000g
drop table if exists t1gb500000g;
drop table if exists t1gb500000g_backup;
create table t1gb500000g (id int,a int,b int,c int,d int,e int,f float,g float,h float,i float,j float,k float);
COPY t1gb500000g FROM '/home/perm/pengyuan/data/synthetics/genData/t1gb500000g.csv' DELIMITER ',' CSV HEADER;
ALTER TABLE t1gb500000g ADD PRIMARY KEY(id);
create index t1gb500000g_a on t1gb500000g(a);
create table t1gb500000g_backup as select * from t1gb500000g;

-- create and load tjoinhelp
drop table if exists tjoinhelp;
drop table if exists tjoinhelp_backup;
create table tjoinhelp (ttid int,aa int,bb int,cc int,dd int,ee int,ff float,gg float,hh float,ii float,jj float,kk float);
insert into tjoinhelp select * from t1gb5000g;
ALTER TABLE tjoinhelp ADD PRIMARY KEY(ttid);
create table tjoinhelp_backup as select * from tjoinhelp;

-- create and load t1gbjoin
drop table if exists t1gbjoin;
drop table if exists t1gbjoin_backup;
create table t1gbjoin as select * from t1gb5000g;
ALTER TABLE t1gbjoin ADD PRIMARY KEY(id);
create index t1gbjoin_a on t1gbjoin(a);
create table t1gbjoin_backup as select * from t1gbjoin;

-- create and load joinpercent1
drop table if exists tjoinhelppercent1;
drop table if exists tjoinhelppercent1_backup;
create table tjoinhelppercent1 as select * from tjoinhelp where mod(ttid, 100) = 0;
ALTER TABLE tjoinhelppercent1 ADD PRIMARY KEY(ttid);
create table tjoinhelppercent1_backup as select * from tjoinhelppercent1;


-- create and load joinpercent5
drop table if exists tjoinhelppercent5;
drop table if exists tjoinhelppercent5_backup;
create table tjoinhelppercent5 as select * from tjoinhelp where mod(ttid, 20) = 0;
ALTER TABLE tjoinhelppercent5 ADD PRIMARY KEY(ttid);
create table tjoinhelppercent5_backup as select * from tjoinhelppercent5;

-- create and load joinpercent10
drop table if exists tjoinhelppercent10;
drop table if exists tjoinhelppercent10_backup;
create table tjoinhelppercent10 as select * from tjoinhelp where mod(ttid, 10) = 0;
ALTER TABLE tjoinhelppercent10 ADD PRIMARY KEY(ttid);
create table tjoinhelppercent10_backup as select * from tjoinhelppercent10;
