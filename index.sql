-- Active: 1747687353552@@127.0.0.1@5432@conservation_db
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY, 
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
    );

CREATE Table species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) CHECK (conservation_status IN ('Endangered', 'Vulnerable', 'Near Threatened', 'Least Concern','Historic'))
)


CREATE Table sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT,
    FOREIGN KEY(ranger_id) REFERENCES rangers(ranger_id),
    species_id INT,
    FOREIGN KEY(species_id) REFERENCES species(species_id),
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(150) NOT NULL,
    notes TEXT

);

DROP Table species;

INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES
(1, 1, '2024-05-10 07:45:00', 'Peak Ridge', 'Camera trap image captured'),
(2, 2, '2024-05-12 16:20:00', 'Bankwood Area', 'Juvenile seen'),
(3, 3, '2024-05-15 09:10:00', 'Bamboo Grove East', 'Feeding observed'),
(1, 2, '2024-05-18 18:30:00', 'Snowfall Pass',NULL);


 
SELECT * FROM rangers; 
SELECT * FROM species; 
SELECT * FROM sightings; 

--------------------Problem-1 Register a new ranger ------------
INSERT INTO rangers(name,region) VALUES('Derek Fox','Coastal Plains');


---------------------Problem-2 Count unique species-----------
SELECT count(*) FROM sightings WHERE species_id = sighting_id;


-------------Problem 3 Find 'Pass'---------------
SELECT * FROM sightings WHERE location LIKE('%Pass%');


------------------Problem 4--------------
SELECT r.name,count(s.ranger_id) FROM rangers r JOIN sightings s on r.ranger_id = s.ranger_id GROUP BY r.name;


----------------Problem 5--------
SELECT * FROM rangers WHERE ranger_id NOT IN (SELECT species_id FROM sightings); 

----------------Problem 6----------
-- filtering by time 
SELECT spc.common_name,s.sighting_time, name
FROM sightings s JOIN species spc ON s.sighting_id = spc.species_id
JOIN rangers r ON r.ranger_id = s.species_id
ORDER BY sighting_time DESC LIMIT 2;

-----------------Problem 7.
UPDATE species
 set conservation_status='Historic'
 WHERE discovery_date < '1800-01-01';

------------------Problem 8 ----------
SELECT 
  sighting_id,
  sighting_time,
  sighting_time::time AS only_time,
  CASE 
    WHEN sighting_time::time < TIME '12:00' THEN 'Morning'
    WHEN sighting_time::time >= TIME '12:00' AND sighting_time::time <= TIME '17:00' THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;


-------------------problem 9
DELETE FROM rangers WHERE ranger_id NOT IN (SELECT species_id FROM sightings)


