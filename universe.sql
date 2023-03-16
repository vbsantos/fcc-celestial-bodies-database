CREATE DATABASE universe;

\c universe;

-- #region galaxy

DROP TABLE IF EXISTS galaxy CASCADE;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  description TEXT,
  age INT NOT NULL,
  is_active BOOLEAN NOT NULL,
  distance NUMERIC NOT NULL
);

INSERT INTO
  galaxy (name, description, age, is_active, distance)
VALUES
  ('Milky Way', 'A barred spiral galaxy', 132, TRUE, 25),
  ('Andromeda', 'A spiral galaxy', 101, TRUE, 2),
  ('M87', 'An elliptical galaxy', 100, FALSE, 53),
  ('Sombrero', 'A spiral galaxy', 90, TRUE, 29),
  ('Pinwheel', 'A spiral galaxy', 55, TRUE, 21),
  ('Whirlpool', 'A spiral galaxy', 62, TRUE, 23);

-- #endregion

-- #region star

DROP TABLE IF EXISTS star CASCADE;

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  type VARCHAR NOT NULL,
  mass NUMERIC NOT NULL,
  temperature INT NOT NULL,
  is_visible BOOLEAN NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)
);

INSERT INTO
  star (
    name,
    type,
    mass,
    temperature,
    is_visible,
    galaxy_id
  )
VALUES
  ('Sun', 'G', 1989.0, 5778, TRUE, 1),
  ('Betelgeuse', 'M', 77.0, 3600, TRUE, 1),
  ('Sirius', 'A', 202.0, 9940, TRUE, 1),
  ('Alpha Centauri', 'G', 22.0, 5790, TRUE, 1),
  ('Vega', 'A', 215.0, 9602, TRUE, 1),
  ('Polaris', 'F', 54.0, 6000, TRUE, 1),
  ('Proxima Centauri', 'M', 120.0, 3042, TRUE, 1),
  ('Antares', 'M', 176.0, 3500, TRUE, 1),
  ('Rigel', 'B', 236.0, 12100, TRUE, 1),
  ('Deneb', 'A', 205.0, 8525, TRUE, 1),
  ('Canopus', 'F', 85.0, 7400, TRUE, 1);

-- #endregion

-- #region planet

DROP TABLE IF EXISTS planet CASCADE;

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  type VARCHAR NOT NULL,
  radius NUMERIC NOT NULL,
  temperature INT NOT NULL,
  has_atmosphere BOOLEAN NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id)
);

INSERT INTO
  planet (
    name,
    type,
    radius,
    temperature,
    has_atmosphere,
    star_id
  )
VALUES
  ('Mercury', 'Terrestrial', 2440, 167, TRUE, 1),
  ('Venus', 'Terrestrial', 6052, 464, TRUE, 1),
  ('Earth', 'Terrestrial', 6371, 15, TRUE, 1),
  ('Mars', 'Terrestrial', 3389, -63, TRUE, 1),
  ('Jupiter', 'Gas Giant', 69911, -145, TRUE, 1),
  ('Saturn', 'Gas Giant', 58232, -178, TRUE, 1),
  ('Neptune', 'Ice Giant', 24622, -214, TRUE, 1),
  ('Uranus', 'Ice Giant', 25362, -216, TRUE, 1),
  ('Pluto', 'Dwarf', 1188.3, -229, TRUE, 1),
  ('Kepler-186f', 'Terrestrial', 6359, -64, TRUE, 2),
  ('Kepler-62f', 'Terrestrial', 7550, -68, TRUE, 3),
  ('Mário', 'Fake', 0, 0, TRUE, 4);

-- #endregion

-- #region moon

DROP TABLE IF EXISTS moon CASCADE;

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  type VARCHAR NOT NULL,
  distance_from_planet NUMERIC NOT NULL,
  is_synchronous BOOLEAN NOT NULL,
  has_liquid_water BOOLEAN NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id)
);

INSERT INTO
  moon (
    name,
    type,
    distance_from_planet,
    is_synchronous,
    has_liquid_water,
    planet_id
  )
VALUES
  ('Luna', 'Terrestrial', 384400, TRUE, FALSE, 1),
  ('Europa', 'Ice', 671100, TRUE, TRUE, 1),
  ('Ganymede', 'Ice', 1070000, TRUE, TRUE, 1),
  ('Io', 'Rocky', 421700, TRUE, FALSE, 1),
  ('Mimas', 'Rocky', 185404, TRUE, FALSE, 1),
  ('Enceladus', 'Ice', 238037, TRUE, TRUE, 1),
  ('Titan', 'Terrestrial', 1221870, TRUE, TRUE, 1),
  ('Triton', 'Ice', 354759, TRUE, FALSE, 1),
  ('Callisto', 'Ice', 1882700, TRUE, FALSE, 1),
  ('Hyperion', 'Rocky', 1481011, TRUE, FALSE, 2),
  ('Phoebe', 'Rocky', 1294769, TRUE, FALSE, 2),
  ('Dione', 'Ice', 377400, TRUE, FALSE, 2),
  ('Rhea', 'Ice', 527108, TRUE, FALSE, 2),
  ('Iapetus', 'Rocky', 3561300, TRUE, FALSE, 2),
  ('Oberon', 'Ice', 582600, TRUE, FALSE, 4),
  ('Titania', 'Ice', 435840, TRUE, FALSE, 4),
  ('Miranda', 'Terrestrial', 129390, TRUE, FALSE, 4),
  ('Nereid', 'Ice', 5513813, TRUE, FALSE, 5),
  ('Roberto', 'Fake', 0, TRUE, FALSE, 6),
  ('Jeferson', 'Fake', 0, TRUE, FALSE, 6);

-- #endregion

-- #region constellation

DROP TABLE IF EXISTS constellation CASCADE;

CREATE TABLE constellation (
  constellation_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  abbreviation VARCHAR NOT NULL,
  meaning TEXT NOT NULL
);

INSERT INTO
  constellation (name, abbreviation, meaning)
VALUES
  ('Orion', 'Ori', 'Named after the mythical hunter Orion'),
  ('Ursa Major', 'UMa', 'Means Great Bear in Latin'),
  ('Leo', 'Leo', 'Means Lion in Latin'),
  ('Aquarius', 'Aqr', 'Means Water-bearer in Latin'),
  ('Cassiopeia', 'Cas', 'Named after the queen Cassiopeia in Greek mythology'),
  ('Scorpius', 'Sco', 'Means Scorpion in Latin'),
  ('Cygnus', 'Cyg', 'Means Swan in Latin'),
  ('Gemini', 'Gem', 'Means Twins in Latin'),
  ('Pisces', 'Psc', 'Means Fish in Latin'),
  ('Virgo', 'Vir', 'Means Maiden in Latin');

-- #endregion

-- #region nebula

DROP TABLE IF EXISTS nebula CASCADE;

CREATE TABLE nebula (
  nebula_id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL UNIQUE,
  type VARCHAR NOT NULL,
  distance NUMERIC NOT NULL,
  is_active BOOLEAN NOT NULL,
  constellation_id INT NOT NULL REFERENCES constellation(constellation_id)
);

INSERT INTO
  nebula (
    name,
    type,
    distance,
    is_active,
    constellation_id
  )
VALUES
  ('Crab Nebula', 'Supernova Remnant', 6500, TRUE, 1),
  ('Orion Nebula', 'Emission', 1344, TRUE, 1),
  ('Eagle Nebula', 'Emission', 7000, TRUE, 6),
  ('Helix Nebula', 'Planetary', 215, TRUE, 3),
  ('Carina Nebula', 'Emission', 7500, TRUE, 1),
  ('Lagoon Nebula', 'Emission', 5200, TRUE, 8),
  ('Trifid Nebula', 'Emission', 5200, TRUE, 8);

-- #endregion
