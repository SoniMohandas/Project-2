-- Insert school_name data from school_admin table
INSERT INTO stem_school(school_name)
SELECT school_name
FROM school_admin;

-- Add columns program_title_id and life_program_id
ALTER TABLE stem_school
ADD COLUMN program_title_id SERIAL,
ADD COLUMN life_program_id SERIAL;

-- Query 10 records from stem_school
SELECT * FROM stem_school WHERE id<=10;

-- Insert alp_title data school_admin table into column alp_title of table program_title
INSERT INTO program_title(alp_title)
SELECT alp_title
FROM school_admin;

-- Query 10 records from program_title
SELECT * FROM program_title WHERE id<=10;

-- Insert llp_domain1, llp_title1 from table school_admin into table life_program
INSERT INTO life_program(llp_domain1, llp_title1)
SELECT llp_domain1, llp_title1
FROM school_admin;

-- Query 10 records from table life_program
SELECT * FROM life_program;


