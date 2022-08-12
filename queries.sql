/*Queries that provide answers to the questions from all projects.*/

/* Find all animals whose name ends in "mon". */
SELECT * FROM animals WHERE name LIKE '%mon%';
/* List the name of all animals born between 2016 and 2019. */
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
/* List the name of all animals that are neutered and have less than 3 escape attempts.*/
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempt < 3;
/* List the date of birth of all animals named either "Agumon" or "Pikachu" */
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT name, escape_attempt FROM animals WHERE weight_kg >10.5;
/* Find all animals that are neutered. */
SELECT * FROM animals WHERE neutered = TRUE;
/* Find all animals not named Gabumon. */
 SELECT * FROM animals WHERE name <> 'Gabumons';
/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */
 SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


 -- TRANSACTION FOR UPDATING SPECIES COLUMN WITH UNSPECIFIED and ROLLBACK

BEGIN;

UPDATE animals SET species = 'unspecified';

SELECT * FROM animals; 

ROLLBACK; 

SELECT * FROM animals;

--  TRANSACTION FOR UPDATING TO DIGIMON AND POKEMON WITH COMMIT

BEGIN; 

UPDATE animals SET species = 'digimon' WHERE NAME LIKE '%mon';
UPDATE ANIMALS SET SPECIES = 'pokemon' WHERE species IS NULL;

COMMIT; 

SELECT * FROM animals;

-- TRANSACTION FOR DELETE ALL RECORDS

BEGIN; 

TRUNCATE TABLE animals; 

SELECT * FROM animals; 

ROLLBACK; 

SELECT * FROM animals;

-- SAVEPOINT TRANSACTIONS FOR UPDATE 

BEGIN; 

DELETE FROM animals WHERE date_of_birth > '2022-01-01'; 

SAVEPOINT delete_after_jan; 

UPDATE animals SET weight_kg = weight_kg *-1; 

ROLLBACK TO delete_after_jan; 

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 

COMMIT; 

SELECT * FROM animals;

-- QUERIES

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT name, escape_attempts FROM animals 
    WHERE escape_attempts = (
    SELECT MAX(escape_attempts) FROM animals
    );

SELECT species, MIN(weight_kg) , MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- multi tables query

SELECT animals.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond ';

SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id;

SELECT species.name, COUNT(species_id) AS animals_count FROM animals INNER JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT ANIMALS.NAME FROM ANIMALS INNER JOIN SPECIES ON ANIMALS.SPECIES_ID = SPECIES.ID INNER JOIN OWNERS ON ANIMALS.OWNER_ID = OWNERS.ID WHERE SPECIES.NAME = 'Digimon' AND OWNERS.FULL_NAME = 'Jennifer Orwell';

SELECT ANIMALS.NAME FROM ANIMALS INNER JOIN OWNERS ON ANIMALS.OWNER_ID = OWNERS.ID WHERE OWNERS.FULL_NAME = 'Dean Winchester' AND ANIMALS.ESCAPE_ATTEMPTS = 0;

SELECT OWNERS.FULL_NAME, COUNT(ANIMALS.*) FROM ANIMALS INNER JOIN OWNERS ON ANIMALS.OWNER_ID = OWNERS.ID GROUP BY OWNERS.FULL_NAME ORDER BY COUNT DESC LIMIT 1;
