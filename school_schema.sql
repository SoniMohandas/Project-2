-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/RxVg6p

-- Schools - kaggle.com/subhamjain/schools-information-directory-singapore?select=school-distinctive-programmes.csv
-- Create a PostgreSQL DB.
-- Clean up the data
-- Follow 3rd normal form to create the schema.
-- The final db should only include schools with a focus in STEM

CREATE TABLE "stem_school" (
    "id" SERIAL   NOT NULL,
    "school_name" VARCHAR(40)   NOT NULL,
    CONSTRAINT "pk_stem_school" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "program_title" (
    "id" SERIAL   NOT NULL,
    "alp_title" VARCHAR(100),
    CONSTRAINT "pk_program_title" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "life_program" (
    "id" SERIAL   NOT NULL,
    "lip_domain1" VARCHAR(40),
    "lip_title1" VARCHAR(100),
    CONSTRAINT "pk_life_program" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "stem_school" ADD CONSTRAINT "fk_stem_school_id" FOREIGN KEY("id")
REFERENCES "life_program" ("id");

ALTER TABLE "program_title" ADD CONSTRAINT "fk_program_title_id" FOREIGN KEY("id")
REFERENCES "stem_school" ("id");

