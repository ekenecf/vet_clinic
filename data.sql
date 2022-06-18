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



-- Insert the following data for vets 

INSERT INTO vets (name, age, date_of_graduation)
VALUES('William Tatcher', 45,'2000-04-23'), ('Maisy Smith', 26,'2019-01-17'),
('Stephanie Mendez', 45,'2000-04-23'), ('Jack Harkness', 38,'2008-06-08');

-- Insert the following data for specialties 
INSERT INTO specializations (vet_id, species_id)
VALUES(1,1), (3,1), (3,2), (4,2);

/* Insert the following data for visits */

-- Agumon visited William Tatcher on May 24th, 2020 
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(1, 1, '2020-05-24');

-- Agumon visited Stephanie Mendez on Jul 22th, 2020
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(1, 3, '2020-07-22');

-- Gabumon visited Jack Harkness on Feb 2nd, 2021 
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(2, 4, '2021-02-02');

-- Pikachu visited Maisy Smith on Jan 5th, 2020 
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(7, 2, '2020-01-5');

-- Pikachu visited Maisy Smith on Mar 8th, 2020. 
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(7, 2, '2020-03-08');

-- Pikachu visited Maisy Smith on May 14th, 2020. 
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(7, 2, '2020-05-14');

-- Devimon visited Stephanie Mendez on May 4th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(3, 3, '2020-05-04');

-- Charmander visited Jack Harkness on Feb 24th, 2021. 
INSERT INTO visits (animal_id, vet_id,date_of_visit)
VALUES(8, 4, '2021-02-24');

-- Plantmon visited Maisy Smith on Dec 21st, 2019. 
INSERT INTO visits (animal_id, vet_id,date_of_visit)
VALUES(4, 2, '2019-12-21');

-- Plantmon visited William Tatcher on Aug 10th, 2020.
INSERT INTO visits (animal_id, vet_id,date_of_visit)
VALUES(4, 1, '2020-08-10'); 

-- Plantmon visited Maisy Smith on Apr 7th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(4, 2, '2021-04-07');

-- Squirtle visited Stephanie Mendez on Sep 29th, 2019. 
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(9, 3, '2019-09-29');

-- Angemon visited Jack Harkness on Oct 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(5, 4, '2020-10-03');

-- Angemon visited Jack Harkness on Nov 4th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(5, 4, '2020-11-04');

-- Boarmon visited Maisy Smith on Jan 24th, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(6, 2, '2019-01-24');

-- Boarmon visited Maisy Smith on May 15th, 2019.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(6, 2, '2019-05-15');

-- Boarmon visited Maisy Smith on Feb 27th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(5, 2, '2020-02-27');

-- Boarmon visited Maisy Smith on Aug 3rd, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(5, 2, '2020-08-03');

-- Blossom visited Stephanie Mendez on May 24th, 2020.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(10, 3, '2020-05-24');

-- Blossom visited William Tatcher on Jan 11th, 2021.
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(10, 1, '2021-01-11');
