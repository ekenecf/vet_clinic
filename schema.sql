/* Database schema to keep the structure of entire database. */

-- CREATE TABLE animals (
--     name varchar(100)
-- );

 CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOL,
    weight_kg FLOAT 
);

/* Create a table named owners with the following columns */

CREATE TABLE owners (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    full_name VARCHAR(50),
    age INT 
);

/* Create a table named species with the following columns */

CREATE TABLE species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR(50),
);

/* Modify animals table */

/* Remove column species */

ALTER TABLE animals
DROP COLUMN species;

/* Add column species_id which is a foreign key referencing species table */ 
ALTER TABLE animals
ADD species_id INT, ADD FOREIGN KEY(species_id) REFERENCES species(id);

/* Add column owner_id which is a foreign key referencing the owners table */

ADD owner_id INT, ADD FOREIGN KEY(owner_id) REFERENCES owners(id);

-- Create a table named vets with the following columns: 
CREATE TABLE vets (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR(50),
    age INT,
    date_of_graduation DATE
);

-- Create a "join table" called specializations
CREATE TABLE specializations (
   vet_id INT,
   species_id INT ,
   FOREIGN KEY (vet_id) REFERENCES vets(id),
   FOREIGN KEY (species_id) REFERENCES species(id)
);

-- Create a "join table" called visits 
CREATE TABLE visits (
   animal_id INT,
   vet_id INT ,
   date_of_visit DATE, 
   FOREIGN KEY (animal_id) REFERENCES animals(id),
   FOREIGN KEY (vet_id) REFERENCES vetS(id)
);

--  It is important to keep only the queries that change the database structure in the schema.sql file.

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
CREATE INDEX animal_id_desc
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;

explain analyze SELECT * FROM visits where vet_id = 2;
CREATE INDEX vet_index
explain analyze SELECT * FROM visits where vet_id = 2;

SELECT * FROM owners where email = 'owner_18327@mail.com';
CREATE INDEX email_desc ON owners(email DESC);
SELECT * FROM owners where email = 'owner_18327@mail.com';
