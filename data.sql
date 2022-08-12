/* Populate database with sample data. */

 INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
 INSERT INTO animals VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
 INSERT INTO animals VALUES (3, 'Pikachu', '2021-01-7', 1, false, 15.04);
 INSERT INTO animals VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);
 INSERT INTO animals VALUES (5, 'Charmander', '2020-02-08', 0, false, -11);
 INSERT INTO animals VALUES (6, 'Plantmon', '2021-11-15', 2, true, -5.7);
 INSERT INTO animals VALUES (7, 'Squirtle', '1993-04-02', 3, false, -12.13);
 INSERT INTO animals VALUES (8, 'Angemon', '2005-06-12', 1, true, -45);
 INSERT INTO animals VALUES (9, 'Boarmon', '2005-06-07', 7, true, 20.4);
 INSERT INTO animals VALUES (10, 'Blossom', '1998-10-13', 3, true, 17);
 INSERT INTO animals VALUES (11, 'Ditto', '2022-05-14', 4, true, 22);

 --Owners table

INSERT INTO owners (full_name, age) VALUES ('Sam Smith' , 34); 
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell' , 19); 
INSERT INTO owners (full_name, age) VALUES ('Bob' , 45); 
INSERT INTO owners (full_name, age) VALUES ('Melody Pond ' , 77); 
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester' , 14); 
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker' , 38);  

/*
** species table
*/

INSERT INTO species (name) VALUES ('Pokemon'); 
INSERT INTO species (name) VALUES ('Digimon'); 

-- modify animals table with species_id

UPDATE animals SET species_id = (SELECT id FROM species WHERE NAME = 'Digimon') WHERE NAME LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE NAME = 'Pokemon') WHERE NAME NOT LIKE '%mon';

-- owner_id

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name  = 'Sam Smith') WHERE name IN('Agumon'); 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name  = 'Jennifer Orwell') WHERE name IN('Gabumon' , 'Pikachu'); 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name  = 'Bob') WHERE name IN('Devimon', 'Plantmon'); 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name  = 'Melody Pond ') WHERE name IN('Charmander', 'Squirtle', 'Blossom'); 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name  = 'Dean Winchester') WHERE name IN('Angemon' , 'Boarmon'); 
