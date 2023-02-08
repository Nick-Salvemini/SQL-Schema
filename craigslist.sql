-- from the terminal run:
-- psql < craigslist.sql
DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\ c craigslist CREATE TABLE region (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY NOT NULL,
    username TEXT NOT NULL,
    PASSWORD TEXT NOT NULL,
    region_pref TEXT REFERENCES region (id),
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY NOT NULL,
    cat_name TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INT NOT NULL REFERENCES users (id),
    region_id INT NOT NULL REFERENCES region (id),
    cat_id INT NOT NULL REFERENCES category (id)
);

INSERT INTO
    region (name)
VALUES
    ('New York City'),
    ('Chicago'),
    ('Los Angeles');

INSERT INTO
    users (username, PASSWORD, region_pref)
VALUES
    ('catluvr456', 'password123', 'New York City'),
    ('chickenluvr789', '987password', 'Chicago'),
    ('donkeyluvr321', '123456789', 'Los Angeles');

INSERT INTO
    category (name)
VALUES
    ('Free Stuff'),
    ('Tools'),
    ('Toys and Games'),
    ('Exercise');

INSERT INTO
    posts (title, body, user_id, region_id, cat_id)
VALUES
    (
        'Free Couch!',
        'I have a lightly used couch.  I need to get rid of it ASAP.  A few minor stains, but you can just flip the cussion!',
        3,
        3,
        1
    ),
    (
        'Working SNES for sale w/ games',
        'Im trying to sell my old SNES.  It comes with Super Marios World 3, Legend of Zelda: Link to the Past, and Mario is Missing! $999 OBO',
        2,
        2,
        3
    ),
    (
        'Rigid Table Saw',
        'Trying to sell my husbands table saw.  He got one during covid and never used it.  Great condition!',
        1,
        1,
        2
    );