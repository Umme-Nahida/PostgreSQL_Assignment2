-- Active: 1747687353552@@127.0.0.1@5432@conservation_db
CREATE TABLE rangers(
    ranger_id INT PRIMARY KEY, 
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
    );

CREATE Table species(
    species_id INT PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) CHECK (conservation_status IN ('Endangered', 'Vulnerable', 'Near Threatened', 'Least Concern'))
)


CREATE Table sightings(
    sighting_id INT PRIMARY KEY,
    ranger_id INT,
    FOREIGN KEY(ranger_id) REFERENCES rangers(ranger_id),
    species_id INT,
    FOREIGN KEY(species_id) REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(150) NOT NULL,
    notes TEXT

);

INSERT INTO rangers (ranger_id, name, region) VALUES
(3, 'Nusrat Jahan', 'Sylhet Forest Range');


INSERT INTO species (species_id, common_name, scientific_name, discovery_date, conservation_status) VALUES
(104, 'Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
(105, 'Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
(106, 'Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
(107, 'Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


INSERT INTO sightings (sighting_id, ranger_id, species_id, sighting_time, location, notes) VALUES
(1004, 1, 104, '2024-05-10 07:45:00', 'Peak Ridge', 'Camera trap image captured'),
(1005, 2, 105, '2024-05-12 16:20:00', 'Bankwood Area', 'Juvenile seen'),
(1006, 3, 106, '2024-05-15 09:10:00', 'Bamboo Grove East', 'Feeding observed'),
(1007, 1, 104, '2024-05-18 18:30:00', 'Snowfall Pass','');



UPDATE sightings set notes=NULL WHERE sighting_id=1007;

 
SELECT * FROM rangers; 
SELECT * FROM species; 
SELECT * FROM sightings; 

--------------------Problem-1 Register a new ranger ------------
INSERT INTO rangers(ranger_id,name,region) VALUES(4,'Derek Fox','Coastal Plains');







