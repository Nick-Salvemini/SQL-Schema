-- from the terminal run:
-- psql < med_center.sql
DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\ c med_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    specialty TEXT NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    ins_id INT,
    address TEXT NOT NULL
);

CREATE TABLE illnesses (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE insurance (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    phone_num TEXT NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY,
    dr_id INT NOT NULL,
    patient_id INT NOT NULL,
    illness_id INT NOT NULL,
    date_of_diag DATE NOT NULL,
);

INSERT INTO
    doctors (first_name, last_name, specialty)
VALUES
    ('John', 'Smith', 'Pediatry'),
    ('Forrest', 'Gump', 'Cardiology'),
    ('Algernop', 'Kreiger', 'Phrenology');

INSERT INTO
    patients (
        first_name,
        last_name,
        gender,
        date_of_birth,
        ins_id,
        address
    )
VALUES
    (
        'Some',
        'Dude',
        'M',
        '03-06-1987',
        'Horizon BC/BS',
        '12345',
        '123 Main Street, Town, ST 12345'
    ),
    (
        'Random',
        'Lady',
        'F',
        '05-03-1988',
        'Bad Insurance',
        '000001',
        '789 Accorn Ave, City, ND, 98765'
    ),
    (
        'Tiny',
        'Baby',
        'F',
        '11-07-2020',
        'Horizon BC/BS',
        '12346',
        '123 Main Street, Town, ST 12345'
    )
INSERT INTO
    ilnesses (name)
VALUES
    ('The Plague'),
    ('Gerd'),
    ('Polio'),
    ('Upset Stomach'),
    ('Tired')
INSERT INTO
    insurance (name, phone_num, address)
VALUES
    (
        'Horizon BC/BS',
        '555-555-5555',
        '555 5th Ave, Fif, FL, 55555'
    ),
    ('Bad Insurance', '911', 'Alley Behind Wendys')
INSERT INTO
    diagnosis (dr_id, patient_id, illness_id, date_of_diag)
VALUES
    (2, 1, 5, '04-20-2020 '),
    (3, 2, 1, '06-09-2021'),
    (1, 3, 4, '09-09-2022')