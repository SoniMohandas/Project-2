-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/RxVg6p
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "stem_school" (
    "id" SERIAL   NOT NULL,
    "school_name" VARCHAR(60)   NOT NULL,
    "program_title_id" INT   NOT NULL,
    "life_program_id" INT   NOT NULL,
    CONSTRAINT "pk_stem_school" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "program_title" (
    "id" SERIAL   NOT NULL,
    "alp_title" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_program_title" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "life_program" (
    "id" SERIAL   NOT NULL,
    "llp_domain1" VARCHAR(200)   NOT NULL,
    "llp_title1" VARCHAR(200)   NOT NULL,
    CONSTRAINT "pk_life_program" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "stem_school" ADD CONSTRAINT "fk_stem_school_program_title_id" FOREIGN KEY("program_title_id")
REFERENCES "program_title" ("id");

ALTER TABLE "stem_school" ADD CONSTRAINT "fk_stem_school_life_program_id" FOREIGN KEY("life_program_id")
REFERENCES "life_program" ("id");

