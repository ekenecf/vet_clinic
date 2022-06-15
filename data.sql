/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
  VALUES ('Agumon', DATE '2020-02-03', 10.23, TRUE, 0), ('Gabumon', DATE '2018-11-15', 8, TRUE, 2),
 ('Pikachu', DATE '2021-01-07', 15.04, FALSE, 1), ('Devimon', DATE '2017-05-12', 11, TRUE, 5);
 