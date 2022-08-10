/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempt INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg FLOAT NOT NULL
);
