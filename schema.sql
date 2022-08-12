/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT  NOT NULL,
    nutered BOOLEAN NOT NULL,
    weight_kg FLOAT NOT NULL);
ALTER TABLE animals ADD species VARCHAR(100);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY, 
    full_name VARCHAR(255) NOT NULL, 
    age INT NOT NULL,

    PRIMARY KEY (id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(255) NOT NULL, 

    PRIMARY KEY (id)
);

ALTER TABLE animals DROP COLUMN species; 

ALTER TABLE animals ADD COLUMN species_id INT; 
ALTER TABLE animals ADD CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species(id)
ON DELETE CASCADE;

ALTER TABLE animals ADD COLUMN owner_id INT; 
ALTER TABLE animals ADD CONSTRAINT owner_fk FOREIGN KEY (owner_id) REFERENCES owners(id)
ON DELETE CASCADE;
