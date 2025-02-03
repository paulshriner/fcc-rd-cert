--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    asteroids_id integer NOT NULL,
    name character varying,
    description text NOT NULL,
    distance_from_earth integer NOT NULL
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroids_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroids_id_seq OWNED BY public.asteroids.asteroids_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    description text,
    has_stars boolean NOT NULL,
    has_planets boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying,
    description text,
    distance_from_earth integer NOT NULL,
    is_spherical boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying,
    description text,
    has_life boolean NOT NULL,
    distance_from_earth integer NOT NULL,
    gravity numeric,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    description text,
    length numeric NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroids asteroids_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids ALTER COLUMN asteroids_id SET DEFAULT nextval('public.asteroids_asteroids_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES (1, 'Ceres', 'Ceres is the largest object in the asteroid belt between Mars and Jupiter', 413000000);
INSERT INTO public.asteroids VALUES (2, 'Vesta', 'Vesta is the brightest asteroid in the asteroid belt and is thought to be the source of many meteorites', 353000000);
INSERT INTO public.asteroids VALUES (3, 'Pallas', 'Pallas is a large asteroid in the asteroid belt and is thought to be a remnant protoplanet', 378000000);
INSERT INTO public.asteroids VALUES (4, 'Hygiea', 'Hygiea is a large asteroid in the asteroid belt and is thought to be a remnant protoplanet', 392000000);
INSERT INTO public.asteroids VALUES (5, 'Interamnia', 'Interamnia is a large asteroid in the asteroid belt and is thought to be a remnant protoplanet', 403000000);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'The Andromeda Galaxy, also known as Messier 31 (M31) or NGC 224, is a spiral galaxy approximately 2.5 million light-years away.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The Milky Way is the galaxy that contains our solar system, with hundreds of billions of stars and at least as many planets.', true, true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'The Sombrero Galaxy, also known as Messier 104 (M104) or NGC 4594, is an unbarred spiral galaxy in the constellation Virgo.', true, true);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy', 'The Pinwheel Galaxy, also known as Messier 101 (M101) or NGC 5457, is a face-on spiral galaxy in the constellation Ursa Major.', true, true);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 'The Black Eye Galaxy, also known as Messier 64 (M64) or NGC 4826, is a spiral galaxy in the constellation Coma Berenices.', true, true);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 'The Cigar Galaxy, also known as Messier 82 (M82) or NGC 3034, is an irregular galaxy in the constellation Ursa Major.', true, true);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy', 'The Whirlpool Galaxy, also known as Messier 51 (M51) or NGC 5194, is a grand-design spiral galaxy in the constellation Canes Venatici.', true, true);
INSERT INTO public.galaxy VALUES (8, 'Hoag''s Object', 'Hoag''s Object is a rare ring galaxy in the constellation Serpens.', true, true);
INSERT INTO public.galaxy VALUES (9, 'Cartwheel Galaxy', 'The Cartwheel Galaxy is a lenticular galaxy and ring galaxy in the constellation Sculptor.', true, true);
INSERT INTO public.galaxy VALUES (10, 'Centaurus A', 'Centaurus A, also known as NGC 5128, is a peculiar galaxy in the constellation Centaurus.', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The natural satellite of Earth, the fifth-largest moon in the solar system.', 384, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'A small, irregular moon of Mars, with a highly elliptical orbit.', 225, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'A small, irregular moon of Mars, with a highly elliptical orbit.', 225, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'The largest moon of Jupiter, with a highly volcanic surface.', 778, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'A moon of Jupiter, with a thick icy crust and a possible liquid water ocean.', 778, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the solar system, orbiting Jupiter.', 778, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A moon of Jupiter, with a cratered surface and a possible subsurface ocean.', 778, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'The largest moon of Saturn, with a thick atmosphere and lakes of liquid methane.', 1427, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'A moon of Saturn, with a subsurface ocean and geysers of water vapor.', 1427, true, 6);
INSERT INTO public.moon VALUES (10, 'Triton', 'A moon of Neptune, with a retrograde orbit and geysers of nitrogen.', 4497, true, 8);
INSERT INTO public.moon VALUES (11, 'Proxima b I', 'A hypothetical moon of Proxima b, with a highly uncertain composition.', 4020000, false, 9);
INSERT INTO public.moon VALUES (12, 'Rhea', 'A moon of Saturn, with a heavily cratered surface.', 1427, true, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 'A moon of Saturn, with a surface composed of water ice.', 1427, true, 6);
INSERT INTO public.moon VALUES (14, 'Tethys', 'A moon of Saturn, with a surface composed of water ice.', 1427, true, 6);
INSERT INTO public.moon VALUES (15, 'Mimas', 'A moon of Saturn, with a large crater that gives it a distinctive appearance.', 1427, true, 6);
INSERT INTO public.moon VALUES (16, 'Hyperion', 'A moon of Saturn, with a highly irregular shape.', 1427, false, 6);
INSERT INTO public.moon VALUES (17, 'Iapetus', 'A moon of Saturn, with a surface composed of water ice.', 1427, true, 6);
INSERT INTO public.moon VALUES (18, 'Phoebe', 'A moon of Saturn, with a highly eccentric orbit.', 1427, true, 6);
INSERT INTO public.moon VALUES (19, 'Janus', 'A moon of Saturn, with a highly irregular shape.', 1427, false, 6);
INSERT INTO public.moon VALUES (20, 'Epimetheus', 'A moon of Saturn, with a highly irregular shape.', 1427, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in our solar system, closest to the Sun.', false, 58, 3.71, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun, known for its thick atmosphere.', false, 108, 8.87, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The third planet from the Sun, home to a diverse range of life.', true, 0, 9.8, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet from the Sun, a rocky world with a thin atmosphere.', false, 225, 3.71, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in our solar system, a gas giant with numerous moons.', false, 778, 24.79, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'A gas giant planet with a prominent ring system.', false, 1427, 10.44, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An icy planet with a tilted axis, resulting in extreme seasons.', false, 2871, 8.87, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The farthest planet from the Sun, a cold and icy world.', false, 4497, 11.15, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'A potentially habitable exoplanet orbiting Proxima Centauri.', true, 4020000, 1.1, 8);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 'A hot Jupiter exoplanet orbiting Alpha Centauri B.', false, 4020000, 1.1, 7);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 'A potentially habitable exoplanet orbiting a G-type star.', true, 1400, 1.63, 1);
INSERT INTO public.planet VALUES (12, '55 Cancri e', 'A super-Earth exoplanet orbiting a star in the constellation of Cancer.', false, 41, 2.57, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system.', 696340, true, 2);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky, located in the constellation Canis Major.', 1750, true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant star in the constellation Orion.', 1400, true, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 'A blue-white supergiant star in the constellation Orion.', 1200, true, 2);
INSERT INTO public.star VALUES (5, 'Deneb', 'A blue-white supergiant star in the constellation Cygnus.', 2000, true, 2);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 'The brightest star in the Alpha Centauri star system, located in the constellation Centaurus.', 1100, true, 10);
INSERT INTO public.star VALUES (7, 'Alpha Centauri B', 'A smaller star in the Alpha Centauri star system, located in the constellation Centaurus.', 800, true, 10);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 'The closest star to the Sun, located in the constellation Centaurus.', 140, true, 10);
INSERT INTO public.star VALUES (9, 'VY Canis Majoris', 'A red hypergiant star in the constellation Canis Major.', 2000, true, 2);
INSERT INTO public.star VALUES (10, 'UY Scuti', 'A yellow supergiant star in the constellation Scutum.', 1700, true, 2);


--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroids_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroids_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

