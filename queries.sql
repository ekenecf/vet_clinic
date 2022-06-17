/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN DATE '01-01-2016' AND '01-01-2019';
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT date_of_birth, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/* How many animals are there? */

SELECT COUNT(*) FROM animals;

/* How many animals have never tried to escape? */

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

/* What is the average weight of animals? */

SELECT AVG (weight_kg) FROM animals;

/* Who escapes the most, neutered or not neutered animals? */

SELECT MAX (escape_attempts) FROM animals WHERE  neutered=true;
SELECT MAX (escape_attempts) FROM animals WHERE  neutered=false;

/* What is the minimum and maximum weight of each type of animal? */

SELECT MAX (weight_kg) ,  Min (weight_kg)  FROM animals;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */

SELECT AVG(escape_attempts) FROM animals WHERE  date_of_birth BETWEEN '01-01-1990' AND '01-01-2000';

/* Write queries (using JOIN) to answer the following questions */

/* What animals belong to Melody Pond? */
SELECT * FROM owners
vet_clinic-# JOIN animals ON animals.owner_id = owners.id
vet_clinic-# WHERE owners.full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon) */ 
SELECT * FROM species
vet_clinic-# JOIN animals ON animals.species_id = species.id
vet_clinic-# WHERE species.name = 'Pokemon';

/* List all owners and their animals, remember to include those that don't own any animal */
SELECT * FROM animals
vet_clinic-# RIGHT JOIN owners ON owners.id = animals.owner_id;

/* How many animals are there per species? */
SELECT COUNT(*) FROM species
JOIN animals ON animals.species_id = species.id WHERE species.name='Digimon';

SELECT COUNT(*) FROM species
JOIN animals ON animals.species_id = species.id WHERE species.name='Pokemon';

/* List all Digimon owned by Jennifer Orwell. */
SELECT * FROM owners
vet_clinic-# JOIN animals ON animals.owner_id = owners.id
vet_clinic-# JOIN species ON species.id = animals.species_id
vet_clinic-# WHERE species.name ='Digimon' AND owners.full_name='Jennifer Orwell';

/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT * FROM owners
vet_clinic-# JOIN animals ON animals.owner_id = owners.id
vet_clinic-# JOIN species ON species.id = animals.species_id
vet_clinic-# WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

/* Who owns the most animals? */
SELECT owners.id, full_name FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.id, owners.full_name
ORDER BY count(*) DESC LIMIT 1;
