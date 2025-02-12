--------------------------
-- For q50  
--------------------------
-- --delete only for tuples: 10000
drop table if exists qlarge_50_upd_1; 
create table qlarge_50_upd_1 as select * from t1gb500000g_backup order by random() limit 10000;
alter table qlarge_50_upd_1 add column updident int;
update qlarge_50_upd_1 set updident = -1;

-- --delete only for tuples: 20000
drop table if exists qlarge_50_upd_2; 
create table qlarge_50_upd_2 as select * from t1gb500000g_backup order by random() limit 20000;
alter table qlarge_50_upd_2 add column updident int;
update qlarge_50_upd_2 set updident = -1;

-- --delete only for tuples: 30000
drop table if exists qlarge_50_upd_3; 
create table qlarge_50_upd_3 as select * from t1gb500000g_backup order by random() limit 30000;
alter table qlarge_50_upd_3 add column updident int;
update qlarge_50_upd_3 set updident = -1;

-- --delete only for tuples: 40000
drop table if exists qlarge_50_upd_4; 
create table qlarge_50_upd_4 as select * from t1gb500000g_backup order by random() limit 40000;
alter table qlarge_50_upd_4 add column updident int;
update qlarge_50_upd_4 set updident = -1;

-- --delete only for tuples: 50000
drop table if exists qlarge_50_upd_5; 
create table qlarge_50_upd_5 as select * from t1gb500000g_backup order by random() limit 50000;
alter table qlarge_50_upd_5 add column updident int;
update qlarge_50_upd_5 set updident = -1;

-- --delete only for tuples: 60000
drop table if exists qlarge_50_upd_6; 
create table qlarge_50_upd_6 as select * from t1gb500000g_backup order by random() limit 60000;
alter table qlarge_50_upd_6 add column updident int;
update qlarge_50_upd_6 set updident = -1;

-- --delete only for tuples: 70000
drop table if exists qlarge_50_upd_7; 
create table qlarge_50_upd_7 as select * from t1gb500000g_backup order by random() limit 70000;
alter table qlarge_50_upd_7 add column updident int;
update qlarge_50_upd_7 set updident = -1;

-- --delete only for tuples: 80000
drop table if exists qlarge_50_upd_8; 
create table qlarge_50_upd_8 as select * from t1gb500000g_backup order by random() limit 80000;
alter table qlarge_50_upd_8 add column updident int;
update qlarge_50_upd_8 set updident = -1;

-- --delete only for tuples: 90000
drop table if exists qlarge_50_upd_9; 
create table qlarge_50_upd_9 as select * from t1gb500000g_backup order by random() limit 90000;
alter table qlarge_50_upd_9 add column updident int;
update qlarge_50_upd_9 set updident = -1;

-- --delete only for tuples: 100000
drop table if exists qlarge_50_upd_10; 
create table qlarge_50_upd_10 as select * from t1gb500000g_backup order by random() limit 100000;
alter table qlarge_50_upd_10 add column updident int;
update qlarge_50_upd_10 set updident = -1;

-- --delete only for tuples: 110000
drop table if exists qlarge_50_upd_11; 
create table qlarge_50_upd_11 as select * from t1gb500000g_backup order by random() limit 110000;
alter table qlarge_50_upd_11 add column updident int;
update qlarge_50_upd_11 set updident = -1;

-- --delete only for tuples: 120000
drop table if exists qlarge_50_upd_12; 
create table qlarge_50_upd_12 as select * from t1gb500000g_backup order by random() limit 120000;
alter table qlarge_50_upd_12 add column updident int;
update qlarge_50_upd_12 set updident = -1;

-- --delete only for tuples: 130000
drop table if exists qlarge_50_upd_13; 
create table qlarge_50_upd_13 as select * from t1gb500000g_backup order by random() limit 130000;
alter table qlarge_50_upd_13 add column updident int;
update qlarge_50_upd_13 set updident = -1;

-- --delete only for tuples: 140000
drop table if exists qlarge_50_upd_14; 
create table qlarge_50_upd_14 as select * from t1gb500000g_backup order by random() limit 140000;
alter table qlarge_50_upd_14 add column updident int;
update qlarge_50_upd_14 set updident = -1;

-- --delete only for tuples: 150000
drop table if exists qlarge_50_upd_15; 
create table qlarge_50_upd_15 as select * from t1gb500000g_backup order by random() limit 150000;
alter table qlarge_50_upd_15 add column updident int;
update qlarge_50_upd_15 set updident = -1;

-- --delete only for tuples: 160000
drop table if exists qlarge_50_upd_16; 
create table qlarge_50_upd_16 as select * from t1gb500000g_backup order by random() limit 160000;
alter table qlarge_50_upd_16 add column updident int;
update qlarge_50_upd_16 set updident = -1;

-- --delete only for tuples: 170000
drop table if exists qlarge_50_upd_17; 
create table qlarge_50_upd_17 as select * from t1gb500000g_backup order by random() limit 170000;
alter table qlarge_50_upd_17 add column updident int;
update qlarge_50_upd_17 set updident = -1;

-- --delete only for tuples: 180000
drop table if exists qlarge_50_upd_18; 
create table qlarge_50_upd_18 as select * from t1gb500000g_backup order by random() limit 180000;
alter table qlarge_50_upd_18 add column updident int;
update qlarge_50_upd_18 set updident = -1;

-- --delete only for tuples: 190000
drop table if exists qlarge_50_upd_19; 
create table qlarge_50_upd_19 as select * from t1gb500000g_backup order by random() limit 190000;
alter table qlarge_50_upd_19 add column updident int;
update qlarge_50_upd_19 set updident = -1;

-- --delete only for tuples: 200000
drop table if exists qlarge_50_upd_20; 
create table qlarge_50_upd_20 as select * from t1gb500000g_backup order by random() limit 200000;
alter table qlarge_50_upd_20 add column updident int;
update qlarge_50_upd_20 set updident = -1;

-- --delete only for tuples: 210000
drop table if exists qlarge_50_upd_21; 
create table qlarge_50_upd_21 as select * from t1gb500000g_backup order by random() limit 210000;
alter table qlarge_50_upd_21 add column updident int;
update qlarge_50_upd_21 set updident = -1;

-- --delete only for tuples: 220000
drop table if exists qlarge_50_upd_22; 
create table qlarge_50_upd_22 as select * from t1gb500000g_backup order by random() limit 220000;
alter table qlarge_50_upd_22 add column updident int;
update qlarge_50_upd_22 set updident = -1;

-- --delete only for tuples: 230000
drop table if exists qlarge_50_upd_23; 
create table qlarge_50_upd_23 as select * from t1gb500000g_backup order by random() limit 230000;
alter table qlarge_50_upd_23 add column updident int;
update qlarge_50_upd_23 set updident = -1;

-- --delete only for tuples: 240000
drop table if exists qlarge_50_upd_24; 
create table qlarge_50_upd_24 as select * from t1gb500000g_backup order by random() limit 240000;
alter table qlarge_50_upd_24 add column updident int;
update qlarge_50_upd_24 set updident = -1;

-- --delete only for tuples: 250000
drop table if exists qlarge_50_upd_25; 
create table qlarge_50_upd_25 as select * from t1gb500000g_backup order by random() limit 250000;
alter table qlarge_50_upd_25 add column updident int;
update qlarge_50_upd_25 set updident = -1;

-- --delete only for tuples: 260000
drop table if exists qlarge_50_upd_26; 
create table qlarge_50_upd_26 as select * from t1gb500000g_backup order by random() limit 260000;
alter table qlarge_50_upd_26 add column updident int;
update qlarge_50_upd_26 set updident = -1;

-- --delete only for tuples: 270000
drop table if exists qlarge_50_upd_27; 
create table qlarge_50_upd_27 as select * from t1gb500000g_backup order by random() limit 270000;
alter table qlarge_50_upd_27 add column updident int;
update qlarge_50_upd_27 set updident = -1;

-- --delete only for tuples: 280000
drop table if exists qlarge_50_upd_28; 
create table qlarge_50_upd_28 as select * from t1gb500000g_backup order by random() limit 280000;
alter table qlarge_50_upd_28 add column updident int;
update qlarge_50_upd_28 set updident = -1;

-- --delete only for tuples: 290000
drop table if exists qlarge_50_upd_29; 
create table qlarge_50_upd_29 as select * from t1gb500000g_backup order by random() limit 290000;
alter table qlarge_50_upd_29 add column updident int;
update qlarge_50_upd_29 set updident = -1;

-- --delete only for tuples: 300000
drop table if exists qlarge_50_upd_30; 
create table qlarge_50_upd_30 as select * from t1gb500000g_backup order by random() limit 300000;
alter table qlarge_50_upd_30 add column updident int;
update qlarge_50_upd_30 set updident = -1;

-- --delete only for tuples: 310000
drop table if exists qlarge_50_upd_31; 
create table qlarge_50_upd_31 as select * from t1gb500000g_backup order by random() limit 310000;
alter table qlarge_50_upd_31 add column updident int;
update qlarge_50_upd_31 set updident = -1;

-- --delete only for tuples: 320000
drop table if exists qlarge_50_upd_32; 
create table qlarge_50_upd_32 as select * from t1gb500000g_backup order by random() limit 320000;
alter table qlarge_50_upd_32 add column updident int;
update qlarge_50_upd_32 set updident = -1;

-- --delete only for tuples: 330000
drop table if exists qlarge_50_upd_33; 
create table qlarge_50_upd_33 as select * from t1gb500000g_backup order by random() limit 330000;
alter table qlarge_50_upd_33 add column updident int;
update qlarge_50_upd_33 set updident = -1;

-- --delete only for tuples: 340000
drop table if exists qlarge_50_upd_34; 
create table qlarge_50_upd_34 as select * from t1gb500000g_backup order by random() limit 340000;
alter table qlarge_50_upd_34 add column updident int;
update qlarge_50_upd_34 set updident = -1;

-- --delete only for tuples: 350000
drop table if exists qlarge_50_upd_35; 
create table qlarge_50_upd_35 as select * from t1gb500000g_backup order by random() limit 350000;
alter table qlarge_50_upd_35 add column updident int;
update qlarge_50_upd_35 set updident = -1;

-- --delete only for tuples: 360000
drop table if exists qlarge_50_upd_36; 
create table qlarge_50_upd_36 as select * from t1gb500000g_backup order by random() limit 360000;
alter table qlarge_50_upd_36 add column updident int;
update qlarge_50_upd_36 set updident = -1;

-- --delete only for tuples: 370000
drop table if exists qlarge_50_upd_37; 
create table qlarge_50_upd_37 as select * from t1gb500000g_backup order by random() limit 370000;
alter table qlarge_50_upd_37 add column updident int;
update qlarge_50_upd_37 set updident = -1;

-- --delete only for tuples: 380000
drop table if exists qlarge_50_upd_38; 
create table qlarge_50_upd_38 as select * from t1gb500000g_backup order by random() limit 380000;
alter table qlarge_50_upd_38 add column updident int;
update qlarge_50_upd_38 set updident = -1;

-- --delete only for tuples: 390000
drop table if exists qlarge_50_upd_39; 
create table qlarge_50_upd_39 as select * from t1gb500000g_backup order by random() limit 390000;
alter table qlarge_50_upd_39 add column updident int;
update qlarge_50_upd_39 set updident = -1;

-- --delete only for tuples: 400000
drop table if exists qlarge_50_upd_40; 
create table qlarge_50_upd_40 as select * from t1gb500000g_backup order by random() limit 400000;
alter table qlarge_50_upd_40 add column updident int;
update qlarge_50_upd_40 set updident = -1;

-- --delete only for tuples: 410000
drop table if exists qlarge_50_upd_41; 
create table qlarge_50_upd_41 as select * from t1gb500000g_backup order by random() limit 410000;
alter table qlarge_50_upd_41 add column updident int;
update qlarge_50_upd_41 set updident = -1;

-- --delete only for tuples: 420000
drop table if exists qlarge_50_upd_42; 
create table qlarge_50_upd_42 as select * from t1gb500000g_backup order by random() limit 420000;
alter table qlarge_50_upd_42 add column updident int;
update qlarge_50_upd_42 set updident = -1;

-- --delete only for tuples: 430000
drop table if exists qlarge_50_upd_43; 
create table qlarge_50_upd_43 as select * from t1gb500000g_backup order by random() limit 430000;
alter table qlarge_50_upd_43 add column updident int;
update qlarge_50_upd_43 set updident = -1;

-- --delete only for tuples: 440000
drop table if exists qlarge_50_upd_44; 
create table qlarge_50_upd_44 as select * from t1gb500000g_backup order by random() limit 440000;
alter table qlarge_50_upd_44 add column updident int;
update qlarge_50_upd_44 set updident = -1;

-- --delete only for tuples: 450000
drop table if exists qlarge_50_upd_45; 
create table qlarge_50_upd_45 as select * from t1gb500000g_backup order by random() limit 450000;
alter table qlarge_50_upd_45 add column updident int;
update qlarge_50_upd_45 set updident = -1;

-- --delete only for tuples: 460000
drop table if exists qlarge_50_upd_46; 
create table qlarge_50_upd_46 as select * from t1gb500000g_backup order by random() limit 460000;
alter table qlarge_50_upd_46 add column updident int;
update qlarge_50_upd_46 set updident = -1;

-- --delete only for tuples: 470000
drop table if exists qlarge_50_upd_47; 
create table qlarge_50_upd_47 as select * from t1gb500000g_backup order by random() limit 470000;
alter table qlarge_50_upd_47 add column updident int;
update qlarge_50_upd_47 set updident = -1;

-- --delete only for tuples: 480000
drop table if exists qlarge_50_upd_48; 
create table qlarge_50_upd_48 as select * from t1gb500000g_backup order by random() limit 480000;
alter table qlarge_50_upd_48 add column updident int;
update qlarge_50_upd_48 set updident = -1;

-- --delete only for tuples: 490000
drop table if exists qlarge_50_upd_49; 
create table qlarge_50_upd_49 as select * from t1gb500000g_backup order by random() limit 490000;
alter table qlarge_50_upd_49 add column updident int;
update qlarge_50_upd_49 set updident = -1;

-- --delete only for tuples: 500000
drop table if exists qlarge_50_upd_50; 
create table qlarge_50_upd_50 as select * from t1gb500000g_backup order by random() limit 500000;
alter table qlarge_50_upd_50 add column updident int;
update qlarge_50_upd_50 set updident = -1;

-- --delete only for tuples: 510000
drop table if exists qlarge_50_upd_51; 
create table qlarge_50_upd_51 as select * from t1gb500000g_backup order by random() limit 510000;
alter table qlarge_50_upd_51 add column updident int;
update qlarge_50_upd_51 set updident = -1;

-- --delete only for tuples: 520000
drop table if exists qlarge_50_upd_52; 
create table qlarge_50_upd_52 as select * from t1gb500000g_backup order by random() limit 520000;
alter table qlarge_50_upd_52 add column updident int;
update qlarge_50_upd_52 set updident = -1;

-- --delete only for tuples: 530000
drop table if exists qlarge_50_upd_53; 
create table qlarge_50_upd_53 as select * from t1gb500000g_backup order by random() limit 530000;
alter table qlarge_50_upd_53 add column updident int;
update qlarge_50_upd_53 set updident = -1;

-- --delete only for tuples: 540000
drop table if exists qlarge_50_upd_54; 
create table qlarge_50_upd_54 as select * from t1gb500000g_backup order by random() limit 540000;
alter table qlarge_50_upd_54 add column updident int;
update qlarge_50_upd_54 set updident = -1;

-- --delete only for tuples: 550000
drop table if exists qlarge_50_upd_55; 
create table qlarge_50_upd_55 as select * from t1gb500000g_backup order by random() limit 550000;
alter table qlarge_50_upd_55 add column updident int;
update qlarge_50_upd_55 set updident = -1;

-- --delete only for tuples: 560000
drop table if exists qlarge_50_upd_56; 
create table qlarge_50_upd_56 as select * from t1gb500000g_backup order by random() limit 560000;
alter table qlarge_50_upd_56 add column updident int;
update qlarge_50_upd_56 set updident = -1;

-- --delete only for tuples: 570000
drop table if exists qlarge_50_upd_57; 
create table qlarge_50_upd_57 as select * from t1gb500000g_backup order by random() limit 570000;
alter table qlarge_50_upd_57 add column updident int;
update qlarge_50_upd_57 set updident = -1;

-- --delete only for tuples: 580000
drop table if exists qlarge_50_upd_58; 
create table qlarge_50_upd_58 as select * from t1gb500000g_backup order by random() limit 580000;
alter table qlarge_50_upd_58 add column updident int;
update qlarge_50_upd_58 set updident = -1;

-- --delete only for tuples: 590000
drop table if exists qlarge_50_upd_59; 
create table qlarge_50_upd_59 as select * from t1gb500000g_backup order by random() limit 590000;
alter table qlarge_50_upd_59 add column updident int;
update qlarge_50_upd_59 set updident = -1;

-- --delete only for tuples: 600000
drop table if exists qlarge_50_upd_60; 
create table qlarge_50_upd_60 as select * from t1gb500000g_backup order by random() limit 600000;
alter table qlarge_50_upd_60 add column updident int;
update qlarge_50_upd_60 set updident = -1;

-- --delete only for tuples: 610000
drop table if exists qlarge_50_upd_61; 
create table qlarge_50_upd_61 as select * from t1gb500000g_backup order by random() limit 610000;
alter table qlarge_50_upd_61 add column updident int;
update qlarge_50_upd_61 set updident = -1;

-- --delete only for tuples: 620000
drop table if exists qlarge_50_upd_62; 
create table qlarge_50_upd_62 as select * from t1gb500000g_backup order by random() limit 620000;
alter table qlarge_50_upd_62 add column updident int;
update qlarge_50_upd_62 set updident = -1;

-- --delete only for tuples: 630000
drop table if exists qlarge_50_upd_63; 
create table qlarge_50_upd_63 as select * from t1gb500000g_backup order by random() limit 630000;
alter table qlarge_50_upd_63 add column updident int;
update qlarge_50_upd_63 set updident = -1;

-- --delete only for tuples: 640000
drop table if exists qlarge_50_upd_64; 
create table qlarge_50_upd_64 as select * from t1gb500000g_backup order by random() limit 640000;
alter table qlarge_50_upd_64 add column updident int;
update qlarge_50_upd_64 set updident = -1;

-- --delete only for tuples: 650000
drop table if exists qlarge_50_upd_65; 
create table qlarge_50_upd_65 as select * from t1gb500000g_backup order by random() limit 650000;
alter table qlarge_50_upd_65 add column updident int;
update qlarge_50_upd_65 set updident = -1;

-- --delete only for tuples: 660000
drop table if exists qlarge_50_upd_66; 
create table qlarge_50_upd_66 as select * from t1gb500000g_backup order by random() limit 660000;
alter table qlarge_50_upd_66 add column updident int;
update qlarge_50_upd_66 set updident = -1;

-- --delete only for tuples: 670000
drop table if exists qlarge_50_upd_67; 
create table qlarge_50_upd_67 as select * from t1gb500000g_backup order by random() limit 670000;
alter table qlarge_50_upd_67 add column updident int;
update qlarge_50_upd_67 set updident = -1;

-- --delete only for tuples: 680000
drop table if exists qlarge_50_upd_68; 
create table qlarge_50_upd_68 as select * from t1gb500000g_backup order by random() limit 680000;
alter table qlarge_50_upd_68 add column updident int;
update qlarge_50_upd_68 set updident = -1;

-- --delete only for tuples: 690000
drop table if exists qlarge_50_upd_69; 
create table qlarge_50_upd_69 as select * from t1gb500000g_backup order by random() limit 690000;
alter table qlarge_50_upd_69 add column updident int;
update qlarge_50_upd_69 set updident = -1;

-- --delete only for tuples: 700000
drop table if exists qlarge_50_upd_70; 
create table qlarge_50_upd_70 as select * from t1gb500000g_backup order by random() limit 700000;
alter table qlarge_50_upd_70 add column updident int;
update qlarge_50_upd_70 set updident = -1;

-- --delete only for tuples: 710000
drop table if exists qlarge_50_upd_71; 
create table qlarge_50_upd_71 as select * from t1gb500000g_backup order by random() limit 710000;
alter table qlarge_50_upd_71 add column updident int;
update qlarge_50_upd_71 set updident = -1;

-- --delete only for tuples: 720000
drop table if exists qlarge_50_upd_72; 
create table qlarge_50_upd_72 as select * from t1gb500000g_backup order by random() limit 720000;
alter table qlarge_50_upd_72 add column updident int;
update qlarge_50_upd_72 set updident = -1;

-- --delete only for tuples: 730000
drop table if exists qlarge_50_upd_73; 
create table qlarge_50_upd_73 as select * from t1gb500000g_backup order by random() limit 730000;
alter table qlarge_50_upd_73 add column updident int;
update qlarge_50_upd_73 set updident = -1;

-- --delete only for tuples: 740000
drop table if exists qlarge_50_upd_74; 
create table qlarge_50_upd_74 as select * from t1gb500000g_backup order by random() limit 740000;
alter table qlarge_50_upd_74 add column updident int;
update qlarge_50_upd_74 set updident = -1;

-- --delete only for tuples: 750000
drop table if exists qlarge_50_upd_75; 
create table qlarge_50_upd_75 as select * from t1gb500000g_backup order by random() limit 750000;
alter table qlarge_50_upd_75 add column updident int;
update qlarge_50_upd_75 set updident = -1;

-- --delete only for tuples: 760000
drop table if exists qlarge_50_upd_76; 
create table qlarge_50_upd_76 as select * from t1gb500000g_backup order by random() limit 760000;
alter table qlarge_50_upd_76 add column updident int;
update qlarge_50_upd_76 set updident = -1;

-- --delete only for tuples: 770000
drop table if exists qlarge_50_upd_77; 
create table qlarge_50_upd_77 as select * from t1gb500000g_backup order by random() limit 770000;
alter table qlarge_50_upd_77 add column updident int;
update qlarge_50_upd_77 set updident = -1;

-- --delete only for tuples: 780000
drop table if exists qlarge_50_upd_78; 
create table qlarge_50_upd_78 as select * from t1gb500000g_backup order by random() limit 780000;
alter table qlarge_50_upd_78 add column updident int;
update qlarge_50_upd_78 set updident = -1;

-- --delete only for tuples: 790000
drop table if exists qlarge_50_upd_79; 
create table qlarge_50_upd_79 as select * from t1gb500000g_backup order by random() limit 790000;
alter table qlarge_50_upd_79 add column updident int;
update qlarge_50_upd_79 set updident = -1;

-- --delete only for tuples: 800000
drop table if exists qlarge_50_upd_80; 
create table qlarge_50_upd_80 as select * from t1gb500000g_backup order by random() limit 800000;
alter table qlarge_50_upd_80 add column updident int;
update qlarge_50_upd_80 set updident = -1;

-- --delete only for tuples: 810000
drop table if exists qlarge_50_upd_81; 
create table qlarge_50_upd_81 as select * from t1gb500000g_backup order by random() limit 810000;
alter table qlarge_50_upd_81 add column updident int;
update qlarge_50_upd_81 set updident = -1;

-- --delete only for tuples: 820000
drop table if exists qlarge_50_upd_82; 
create table qlarge_50_upd_82 as select * from t1gb500000g_backup order by random() limit 820000;
alter table qlarge_50_upd_82 add column updident int;
update qlarge_50_upd_82 set updident = -1;

-- --delete only for tuples: 830000
drop table if exists qlarge_50_upd_83; 
create table qlarge_50_upd_83 as select * from t1gb500000g_backup order by random() limit 830000;
alter table qlarge_50_upd_83 add column updident int;
update qlarge_50_upd_83 set updident = -1;

-- --delete only for tuples: 840000
drop table if exists qlarge_50_upd_84; 
create table qlarge_50_upd_84 as select * from t1gb500000g_backup order by random() limit 840000;
alter table qlarge_50_upd_84 add column updident int;
update qlarge_50_upd_84 set updident = -1;

-- --delete only for tuples: 850000
drop table if exists qlarge_50_upd_85; 
create table qlarge_50_upd_85 as select * from t1gb500000g_backup order by random() limit 850000;
alter table qlarge_50_upd_85 add column updident int;
update qlarge_50_upd_85 set updident = -1;

-- --delete only for tuples: 860000
drop table if exists qlarge_50_upd_86; 
create table qlarge_50_upd_86 as select * from t1gb500000g_backup order by random() limit 860000;
alter table qlarge_50_upd_86 add column updident int;
update qlarge_50_upd_86 set updident = -1;

-- --delete only for tuples: 870000
drop table if exists qlarge_50_upd_87; 
create table qlarge_50_upd_87 as select * from t1gb500000g_backup order by random() limit 870000;
alter table qlarge_50_upd_87 add column updident int;
update qlarge_50_upd_87 set updident = -1;

-- --delete only for tuples: 880000
drop table if exists qlarge_50_upd_88; 
create table qlarge_50_upd_88 as select * from t1gb500000g_backup order by random() limit 880000;
alter table qlarge_50_upd_88 add column updident int;
update qlarge_50_upd_88 set updident = -1;

-- --delete only for tuples: 890000
drop table if exists qlarge_50_upd_89; 
create table qlarge_50_upd_89 as select * from t1gb500000g_backup order by random() limit 890000;
alter table qlarge_50_upd_89 add column updident int;
update qlarge_50_upd_89 set updident = -1;

-- --delete only for tuples: 900000
drop table if exists qlarge_50_upd_90; 
create table qlarge_50_upd_90 as select * from t1gb500000g_backup order by random() limit 900000;
alter table qlarge_50_upd_90 add column updident int;
update qlarge_50_upd_90 set updident = -1;

-- --delete only for tuples: 910000
drop table if exists qlarge_50_upd_91; 
create table qlarge_50_upd_91 as select * from t1gb500000g_backup order by random() limit 910000;
alter table qlarge_50_upd_91 add column updident int;
update qlarge_50_upd_91 set updident = -1;

-- --delete only for tuples: 920000
drop table if exists qlarge_50_upd_92; 
create table qlarge_50_upd_92 as select * from t1gb500000g_backup order by random() limit 920000;
alter table qlarge_50_upd_92 add column updident int;
update qlarge_50_upd_92 set updident = -1;

-- --delete only for tuples: 930000
drop table if exists qlarge_50_upd_93; 
create table qlarge_50_upd_93 as select * from t1gb500000g_backup order by random() limit 930000;
alter table qlarge_50_upd_93 add column updident int;
update qlarge_50_upd_93 set updident = -1;

-- --delete only for tuples: 940000
drop table if exists qlarge_50_upd_94; 
create table qlarge_50_upd_94 as select * from t1gb500000g_backup order by random() limit 940000;
alter table qlarge_50_upd_94 add column updident int;
update qlarge_50_upd_94 set updident = -1;

-- --delete only for tuples: 950000
drop table if exists qlarge_50_upd_95; 
create table qlarge_50_upd_95 as select * from t1gb500000g_backup order by random() limit 950000;
alter table qlarge_50_upd_95 add column updident int;
update qlarge_50_upd_95 set updident = -1;

-- --delete only for tuples: 960000
drop table if exists qlarge_50_upd_96; 
create table qlarge_50_upd_96 as select * from t1gb500000g_backup order by random() limit 960000;
alter table qlarge_50_upd_96 add column updident int;
update qlarge_50_upd_96 set updident = -1;

-- --delete only for tuples: 970000
drop table if exists qlarge_50_upd_97; 
create table qlarge_50_upd_97 as select * from t1gb500000g_backup order by random() limit 970000;
alter table qlarge_50_upd_97 add column updident int;
update qlarge_50_upd_97 set updident = -1;

-- --delete only for tuples: 980000
drop table if exists qlarge_50_upd_98; 
create table qlarge_50_upd_98 as select * from t1gb500000g_backup order by random() limit 980000;
alter table qlarge_50_upd_98 add column updident int;
update qlarge_50_upd_98 set updident = -1;

-- --delete only for tuples: 990000
drop table if exists qlarge_50_upd_99; 
create table qlarge_50_upd_99 as select * from t1gb500000g_backup order by random() limit 990000;
alter table qlarge_50_upd_99 add column updident int;
update qlarge_50_upd_99 set updident = -1;

-- --delete only for tuples: 1000000
drop table if exists qlarge_50_upd_100; 
create table qlarge_50_upd_100 as select * from t1gb500000g_backup order by random() limit 1000000;
alter table qlarge_50_upd_100 add column updident int;
update qlarge_50_upd_100 set updident = -1;
