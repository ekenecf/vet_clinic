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
    weight_kg FLOAT );


/* Create a table named owners with the following columns */

CREATE TABLE owners (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    full_name VARCHAR(50),
    age INT );

/* Create a table named species with the following columns */

CREATE TABLE species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR(50),
    );

/* Modify animals table */

/* Remove column species */

ALTER TABLE animals
vet_clinic-# DROP COLUMN species;

/* Add column species_id which is a foreign key referencing species table */ 

ADD species_id INT, ADD FOREIGN KEY(species_id) REFERENCES species(id);

/* Add column owner_id which is a foreign key referencing the owners table */ 

ADD owner_id INT, ADD FOREIGN KEY(owner_id) REFERENCES owners(id);

