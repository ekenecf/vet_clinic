/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
  VALUES ('Agumon', DATE '2020-02-03', 10.23, TRUE, 0), ('Gabumon', DATE '2018-11-15', 8, TRUE, 2),
 ('Pikachu', DATE '2021-01-07', 15.04, FALSE, 1), ('Devimon', DATE '2017-05-12', 11, TRUE, 5);
 
/* Inserting more values */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
  VALUES ('Charmander', DATE '2020-02-08', 11, FALSE, 0), ('Plantmon', DATE '2021-11-15', 5.7, TRUE, 2),
  ('Squirtle', DATE '1993-04-02', 12.13, FALSE, 3), ('Angemon', DATE '2005-06-12', 45, TRUE, 1),
  ('Boarmon', DATE '2005-06-07', 20.4, TRUE, 7), ('Blossom', DATE '1998-10-13', 17, TRUE, 3),
  ('Ditto', DATE '2022-05-14', 22, TRUE, 4);

/* Animmals update in transaction */

 BEGIN;
  ALTER TABLE animals
  RENAME COLUMN species TO unspecified;
  SELECT * FROM animals;
  ROLLBACK;
  SELECT * FROM animals;

/*Update the animals table by setting the species column to digimon for all animals that have a name ending in mon */

BEGIN;
  UPDATE animals
  SET species = 'digimon'
  WHERE name LIKE '%mon';
  SELECT * FROM animals;

  /* Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
 */

BEGIN;
  UPDATE animals
  SET species = 'pokemon'
  WHERE species IS NULL;
  SELECT * FROM animals;

  /* Commit the transaction */

COMMIT;

/* Verify that change was made and persists after commit. */

  SELECT * FROM animals;

/* delete all records in the animals table  */

  BEGIN;
  DELETE FROM animals;

  /* Roll back */
ROLLBACK;

/* verify if all records in the animals table still exist */
SELECT * FROM animals;

 /* Delete all animals born after Jan 1st, 2022. */

DELETE FROM animals WHERE date_of_birth > DATE '2022-01-01';

/* Create a savepoint for the transaction. */
SAVEPOINT SP1;

/* Update all animals' weight to be their weight multiplied by - */
UPDATE animals SET weight_kg = weight_kg * -1;

/* Rollback to the savepoint */
ROLLBACK TO SP1;

/* Update all animals' weights that are negative to be their weight multiplied by -1. */
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

/* Commit transaction */
COMMIT;

/* Insert the following data into the owners table */
INSERT INTO owners (full_name, age)
  VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19),
  ('Bob', 45), ('Melody Pond', 77),
  ('Dean Winchester', 14), ('Jodie Whittaker', 38);

  INSERT INTO species (name)
  VALUES ('Pokemon') ('Digimon');

/* Modify your inserted animals so it includes the species_id value */ 
/* If the name ends in "mon" it will be Digimon */ 
 UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';

/* All other animals are Pokemon */
UPDATE animals SET species_id = 1 WHERE species_id = NULL;

/* Modify your inserted animals to include owner information (owner_id) */ 

/* Sam Smith owns Agumon */ 
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

/* Jennifer Orwell owns Gabumon and Pikachu. */
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' AND name = 'Pikachu';

/* Bob owns Devimon and Plantmon */
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';

/* Melody Pond owns Charmander, Squirtle, and Blossom */
 UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

/* Dean Winchester owns Angemon and Boarmon */
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';
