-- Select all data from school_admin
 SELECT * FROM school_admin;

 --Filter out stem schools from the table school_admin
 SELECT * FROM school_admin WHERE alp_domain LIKE 'STEM';

 -- Creating another table named school from the original table school_admin that it needs to keep unaltered
 CREATE TABLE stem_school AS SELECT * FROM school_admin 
 WHERE alp_domain LIKE 'STEM';

 --View newly created table
 SELECT * FROM stem_school;

 --Clean table by droping null columns lip_domain2, lip_title2 and index column which isn't sequential.
 ALTER TABLE stem_school 
 DROP COLUMN IF EXISTS llp_domain2, 
 DROP COLUMN IF EXISTS llp_title2,
 DROP COLUMN IF EXISTS alp_domain,
 DROP COLUMN IF EXISTS index;

 --View table
 SELECT * FROM stem_school;

 --Add a primary key column to the table
 ALTER TABLE stem_school ADD COLUMN IF NOT EXISTS id serial primary key; 
 -- View table again 
 SELECT * FROM stem_school;

 --Create table program_title from table stem_school and add primary key
 CREATE TABLE program_title 
 AS SELECT alp_title FROM stem_school;
 ALTER TABLE program_title ADD COLUMN IF NOT EXISTS id serial primary key;
 SELECT * FROM program_title;
 
 --Create table life_program from table stem_school and add primary key
 CREATE TABLE life_program
 AS SELECT llp_domain1, llp_title1 FROM stem_school;
 ALTER TABLE life_program ADD COLUMN IF NOT EXISTS id serial primary key;
 SELECT * FROM life_program;

--Drop columns alp_title, llp_domain1, llp_title1 from table stem_school
 ALTER TABLE stem_school 
 DROP COLUMN IF EXISTS alp_title,
 DROP COLUMN IF EXISTS llp_domain1,
 DROP COLUMN IF EXISTS llp_title1;
 SELECT * FROM stem_school;
 
 -- Query 
 SELECT s.id, s.school_name, pt.alp_title, lp.llp_title1
 FROM program_title AS pt
 JOIN stem_school AS s
 ON pt.id=s.id
 JOIN life_program AS lp
 ON s.id=lp.id
 WHERE pt.id = 4;
 