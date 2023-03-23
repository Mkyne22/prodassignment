--DDL: Data Description Language - being used to create the DB design, used to create DB design or Schema

--delete tables so we can start fresh
DROP TABLE IF EXISTS degree_info;
DROP TYPE IF EXISTS department_choices;
--DROP TYPE IF EXISTS department;
DROP TABLE IF EXISTS contact_info;
DROP TYPE IF EXISTS contact_enum;
DROP TABLE IF EXISTS person;
DROP TYPE IF EXISTS gender_id;


--create ENUM for gender identity
CREATE TYPE gender_id as ENUM ('N', 'F', 'NB', 'I', 'T', 'A', '0');

--defining the schema
CREATE TABLE person(
	person_id CHAR(7) PRIMARY KEY,
	person_name VARCHAR(125),
	person_dob DATE,
	person_uname VARCHAR(10),
	person_gender_id gender_id,
	SSN CHAR(9)
);

CREATE TYPE contact_enum as ENUM ('Address', 'Phone', 'Email');

CREATE TABLE contact_info(
	contact_id INT PRIMARY KEY,
	person_id CHAR(7) REFERENCES person(person_id),
	contact_type contact_enum,
	contact_info VARCHAR(250)
);

--CREATE TYPE department as ENUM('Department'); not needed
CREATE TYPE department_choices as ENUM ('Liberal Arts','Teaching','Science','Performing Arts');


-- finding out what kind of department they're getting a degree in
CREATE TABLE degree_info(
	person_id CHAR(7) REFERENCES person(person_id),
	department_type department_choices
);

-- think about bridge table: mult row for degree info, express fact that there are mary kynes in this world
-- create new degree info