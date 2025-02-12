drop table if exists crimes;
CREATE TABLE crimes
(
  id int,
  case_number VARCHAR(20),
  date DATE,
  block VARCHAR(50),
  iucr VARCHAR(10),
  primary_type VARCHAR(50),
  description VARCHAR(255),
  location_description VARCHAR(255),
  arrest VARCHAR(10),
  domestic VARCHAR(10),
  beat int,
  district int,
  ward int,
  community_area int,
  fbi_code VARCHAR(10),
  x_coordinate bigint,
  y_coordinate bigint,
  year int,
  updated_on date,
  latitude FLOAT(53),
  longitude FLOAT(53),
  location VARCHAR(50),
  PRIMARY KEY (id)
);

COPY crimes FROM '/home/perm/pengyuan/data/crimes/crimes_chi.csv' DELIMITER ',' CSV HEADER;

--clean
delete from crimes where community_area is null or ward is null or case_number is null or district is null;

-- create backup;
create table crimes_backup as select * from crimes;
