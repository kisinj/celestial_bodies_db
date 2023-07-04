--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    comet_type character varying(50),
    period_in_years numeric(10,2) NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    planet_types character varying(120),
    galaxy_types character varying(50)
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
    name character varying(50) NOT NULL,
    has_life boolean,
    planet_id integer,
    year_discovered integer,
    diameter_in_km integer
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    has_life boolean NOT NULL,
    distance_from_earth numeric(6,2),
    star_id integer,
    rotation_period_in_days numeric(6,2) NOT NULL,
    revolution_period_in_days numeric(10,2) NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    distance_from_earth_light_years numeric(6,2),
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comets_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 'Short Period', 76.00);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Long Period', 2533.00);
INSERT INTO public.comet VALUES (3, 'Encke', 'Short Period', 3.30);
INSERT INTO public.comet VALUES (4, 'Wild 2', 'Jupiter Family', 6.40);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy in which our solar system is located. It is a barred spiral galaxy with a prominent central bar.', 'Terrestrial, Gas Giants, Ice Giants, Dwarf Planets', 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Also known as Messier 31, it is the closest spiral galaxy to the Milky Way. It is significantly larger than our galaxy.', 'Terrestrial, Gas Giants, Ice Giants, Dwarf Planets', 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy, also known as Messier 33. It is a satellite galaxy of the Andromeda galaxy.', 'Terrestrial, Gas Giants, Ice Giants, Dwarf Planets', 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy with a distinctive appearance due to its prominent dust lane that gives it the appearance of a wide-brimmed hat.', 'Terrestrial, Gas Giants, Ice Giants', 'Lenticular');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Also known as Messier 51, it is a grand-design spiral galaxy. It is interacting with a smaller galaxy, creating beautiful spiral arms.', 'Terrestrial, Gas Giants, Ice Giants', 'Spiral');
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 'A peculiar galaxy with a prominent dust lane and an active galactic nucleus. It is the fifth brightest galaxy in the sky.', 'Terrestrial, Gas Giants, Ice Giants', 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 3, NULL, 3476);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 4, 1677, 23);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 4, 1877, 23);
INSERT INTO public.moon VALUES (4, 'Lo', false, 5, 1610, 3630);
INSERT INTO public.moon VALUES (5, 'Europa', false, 5, 1610, 3138);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, 5, 1610, 5652);
INSERT INTO public.moon VALUES (7, 'Callisto', false, 5, 1610, 4800);
INSERT INTO public.moon VALUES (8, 'Amalthea', false, 5, 1892, 200);
INSERT INTO public.moon VALUES (9, 'Himalia', false, 5, 1904, 170);
INSERT INTO public.moon VALUES (10, 'Thebe', false, 5, 1979, 90);
INSERT INTO public.moon VALUES (11, 'Aegir', false, 6, 2005, 6);
INSERT INTO public.moon VALUES (12, 'Albiorix', false, 6, 2000, 30);
INSERT INTO public.moon VALUES (13, 'Anthe', false, 6, 2004, 1);
INSERT INTO public.moon VALUES (14, 'Farbauti', false, 6, 2005, 4);
INSERT INTO public.moon VALUES (15, 'Fenrir', false, 6, 2005, 5);
INSERT INTO public.moon VALUES (16, 'Fornjot', false, 6, 2005, 6);
INSERT INTO public.moon VALUES (17, 'Ariel', false, 7, 2003, 11);
INSERT INTO public.moon VALUES (18, 'Mab', false, 7, 2003, 16);
INSERT INTO public.moon VALUES (19, 'Perdita', false, 7, 1986, 20);
INSERT INTO public.moon VALUES (20, 'Thalassa', false, 8, 1989, 90);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 82.50, NULL, 58.60, 87.97);
INSERT INTO public.planet VALUES (2, 'Venus', false, 39.78, NULL, 243.00, 224.70);
INSERT INTO public.planet VALUES (3, 'Earth', true, 0.00, NULL, 0.99, 365.26);
INSERT INTO public.planet VALUES (4, 'Mars', false, 55.65, NULL, 1.03, 686.20);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 591.97, NULL, 0.41, 4328.90);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 1204.28, NULL, 0.45, 10752.90);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 2586.88, NULL, 0.72, 30663.65);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 4311.02, NULL, 0.67, 60148.35);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 4293.37, NULL, 6.39, 90735.35);
INSERT INTO public.planet VALUES (10, 'Ceres', false, 384.07, NULL, 0.38, 1682.00);
INSERT INTO public.planet VALUES (11, 'Orcus', false, 4.43, NULL, 0.69, 89522.00);
INSERT INTO public.planet VALUES (12, 'Haumea', false, 7446.50, NULL, 0.17, 104025.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Sun', 8.00, 4600, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4.24, 4859, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 642.50, 8000, 1);
INSERT INTO public.star VALUES (6, 'Polaris', 434.80, 50, 1);
INSERT INTO public.star VALUES (7, 'Andromeda Star 1', 2.54, 4500, 2);
INSERT INTO public.star VALUES (8, 'Triangulum Star 1', 2.73, 2000, 3);
INSERT INTO public.star VALUES (9, 'Sombrero Star 1', 29.20, 10000, 5);
INSERT INTO public.star VALUES (10, 'Whirlpool Star 1', 23.40, 12000, 6);
INSERT INTO public.star VALUES (11, 'Centaurus A Star 1', 10.70, 15000, 7);


--
-- Name: comets_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: comet comets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_name_key UNIQUE (name);


--
-- Name: comet comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


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
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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

