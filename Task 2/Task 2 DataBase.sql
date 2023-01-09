
CREATE TABLE contact_person (
 id SERIAL NOT NULL,
 name VARCHAR(100) NOT NULL,
 phone_number VARCHAR(12) NOT NULL,
 contact_person_email VARCHAR(100) NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (id);


CREATE TABLE ensembles (
 id SERIAL NOT NULL,
 genre VARCHAR(1000) NOT NULL,
 skill_level VARCHAR(100) NOT NULL,
 min_place_nr INT NOT NULL,
 max_place_nr INT NOT NULL,
 time_slot DATETIME NOT NULL
);

ALTER TABLE ensembles ADD CONSTRAINT PK_ensembles PRIMARY KEY (id);


CREATE TABLE group_lessons (
 id SERIAL NOT NULL,
 instrument VARCHAR(1000) NOT NULL,
 skill_level VARCHAR(100) NOT NULL,
 min_place_nr INT NOT NULL,
 max_place_nr INT NOT NULL,
 time_slot DATETIME NOT NULL
);

ALTER TABLE group_lessons ADD CONSTRAINT PK_group_lessons PRIMARY KEY (id);


CREATE TABLE individual_lessons (
 id SERIAL NOT NULL,
 instrument VARCHAR(100) NOT NULL,
 skill_level VARCHAR(100) NOT NULL,
 time_slot DATETIME NOT NULL
);

ALTER TABLE individual_lessons ADD CONSTRAINT PK_individual_lessons PRIMARY KEY (id);


CREATE TABLE instructors (
 id SERIAL NOT NULL,
 person_number VARCHAR(100) NOT NULL,
 name VARCHAR(100) NOT NULL,
 address VARCHAR(100) NOT NULL,
 email VARCHAR(100) DEFAULT NULL,
 phone_number VARCHAR(100) NOT NULL,
 instruments VARCHAR(100) NOT NULL
);

ALTER TABLE instructors ADD CONSTRAINT PK_instructors PRIMARY KEY (id);


CREATE TABLE instruments (
 id SERIAL NOT NULL,
 type VARCHAR(100) NOT NULL,
 brand VARCHAR(100),
 detail VARCHAR(100),
 instructor_id INT
);

ALTER TABLE instruments ADD CONSTRAINT PK_instruments PRIMARY KEY (id);


CREATE TABLE students (
 id SERIAL NOT NULL,
 person_number VARCHAR(100) NOT NULL,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(100) NOT NULL,
 address VARCHAR(100) NOT NULL,
 phone_number VARCHAR(100) NOT NULL,
 sibling_id CHAR(100),
 contact_person_id INT
);

ALTER TABLE students ADD CONSTRAINT PK_students PRIMARY KEY (id);


CREATE TABLE instrument_rent (
 id SERIAL NOT NULL,
 year VARCHAR(100),
 month VARCHAR(100),
 rent_date DATE NOT NULL,
 returen_date DATE NOT NULL,
 student_id INT,
 instrument_id INT
);

ALTER TABLE instrument_rent ADD CONSTRAINT PK_instrument_rent PRIMARY KEY (id);


CREATE TABLE lessons (
 id SERIAL NOT NULL,
 student_id INT,
 place VARCHAR(100) NOT NULL,
 booked_seats INT NOT NULL,
 instructor_id INT NOT NULL,
 instrument_id INT NOT NULL,
 note VARCHAR(100)
);

ALTER TABLE lessons ADD CONSTRAINT PK_lessons PRIMARY KEY (id);


CREATE TABLE payment (
 payments_id SERIAL NOT NULL,
 lesson_id INT,
 student_id INT,
 pay_status VARCHAR(100) NOT NULL,
 date DATETIME NOT NULL
);

ALTER TABLE payment ADD CONSTRAINT PK_payment PRIMARY KEY (payments_id);


CREATE TABLE instructor_salary (
 instructor_salary_id SERIAL NOT NULL,
 instructor_id INT,
 lesson_id INT,
 pay_status VARCHAR(100)
);

ALTER TABLE instructor_salary ADD CONSTRAINT PK_instructor_salary PRIMARY KEY (instructor_salary_id);


/*ALTER TABLE instruments ADD CONSTRAINT FK_instruments_0 FOREIGN KEY (instructor_id) REFERENCES instructors (id);*/


/*ALTER TABLE students ADD CONSTRAINT FK_students_0 FOREIGN KEY (contact_person_id) REFERENCES contact_person (id);*/


/*ALTER TABLE instrument_rent ADD CONSTRAINT FK_instrument_rent_0 FOREIGN KEY (student_id) REFERENCES students (id);
ALTER TABLE instrument_rent ADD CONSTRAINT FK_instrument_rent_1 FOREIGN KEY (instrument_id) REFERENCES instruments (id);


ALTER TABLE lessons ADD CONSTRAINT FK_lessons_0 FOREIGN KEY (student_id) REFERENCES students (id);


ALTER TABLE payment ADD CONSTRAINT FK_payment_0 FOREIGN KEY (lesson_id) REFERENCES lessons (id);
ALTER TABLE payment ADD CONSTRAINT FK_payment_1 FOREIGN KEY (student_id) REFERENCES students (id);


ALTER TABLE instructor_salary ADD CONSTRAINT FK_instructor_salary_0 FOREIGN KEY (instructor_id) REFERENCES instructors (id);
ALTER TABLE instructor_salary ADD CONSTRAINT FK_instructor_salary_1 FOREIGN KEY (lesson_id) REFERENCES lessons (id);


