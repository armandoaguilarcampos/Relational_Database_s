--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    volume_in_suns numeric(3,1),
    description text,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    volume_in_suns numeric(3,1),
    description text,
    has_life boolean,
    is_spherical boolean
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    volume_in_suns numeric(3,1),
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    volume_in_suns numeric(3,1),
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    volume_in_suns numeric(3,1),
    description text,
    has_life boolean,
    is_spherical boolean,
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'a1', 100, 10, 0.1, 'first asteroid', false, false);
INSERT INTO public.asteroid VALUES (2, 'a2', 110, 11, 0.2, 'second asteroid', false, true);
INSERT INTO public.asteroid VALUES (3, 'a3', 120, 12, 0.3, 'third asteroid', true, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'g1', 1100000, 110000, 10.1, 'galaxy num 1', false, false);
INSERT INTO public.galaxy VALUES (2, 'g2', 1200000, 120000, 20.1, 'galaxy num 2', true, false);
INSERT INTO public.galaxy VALUES (3, 'g3', 1300000, 130000, 30.1, 'galaxy num 3', false, false);
INSERT INTO public.galaxy VALUES (4, 'g4', 1400000, 140000, 40.1, 'galaxy num 4', true, false);
INSERT INTO public.galaxy VALUES (5, 'g5', 1500000, 150000, 50.1, 'galaxy num 5', false, false);
INSERT INTO public.galaxy VALUES (6, 'g6', 1600000, 160000, 60.1, 'galaxy num 6', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'm1', 1100, 110, 0.2, 'moon num 1', false, true, 1);
INSERT INTO public.moon VALUES (2, 'm2', 1200, 120, 0.3, 'moon num 2', false, true, 1);
INSERT INTO public.moon VALUES (3, 'm3', 1300, 130, 0.4, 'moon num 3', false, true, 1);
INSERT INTO public.moon VALUES (4, 'm4', 1400, 140, 0.5, 'moon num 4', false, true, 2);
INSERT INTO public.moon VALUES (5, 'm5', 1500, 150, 0.6, 'moon num 5', false, true, 2);
INSERT INTO public.moon VALUES (6, 'm6', 1600, 160, 0.7, 'moon num 6', false, true, 2);
INSERT INTO public.moon VALUES (7, 'm7', 1700, 170, 0.8, 'moon num 7', false, true, 3);
INSERT INTO public.moon VALUES (8, 'm8', 1800, 180, 0.9, 'moon num 8', false, true, 3);
INSERT INTO public.moon VALUES (9, 'm9', 1900, 190, 1.0, 'moon num 9', false, true, 3);
INSERT INTO public.moon VALUES (10, 'm10', 2000, 200, 1.1, 'moon num 10', false, true, 4);
INSERT INTO public.moon VALUES (11, 'm11', 2100, 210, 1.2, 'moon num 11', false, true, 4);
INSERT INTO public.moon VALUES (12, 'm12', 2200, 220, 1.3, 'moon num 12', false, true, 4);
INSERT INTO public.moon VALUES (13, 'm13', 2300, 230, 1.4, 'moon num 13', false, true, 5);
INSERT INTO public.moon VALUES (14, 'm14', 2400, 240, 1.5, 'moon num 14', false, true, 5);
INSERT INTO public.moon VALUES (15, 'm15', 2500, 250, 1.6, 'moon num 15', false, true, 5);
INSERT INTO public.moon VALUES (16, 'm16', 2600, 260, 1.7, 'moon num 16', false, true, 6);
INSERT INTO public.moon VALUES (17, 'm17', 2700, 270, 1.8, 'moon num 17', false, true, 6);
INSERT INTO public.moon VALUES (18, 'm18', 2800, 280, 1.9, 'moon num 18', false, true, 6);
INSERT INTO public.moon VALUES (19, 'm19', 2900, 290, 2.0, 'moon num 19', false, true, 7);
INSERT INTO public.moon VALUES (20, 'm20', 3000, 300, 2.1, 'moon num 20', false, true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'p1', 11000, 1100, 1.1, 'planet num 1', false, true, 1);
INSERT INTO public.planet VALUES (2, 'p2', 12000, 1200, 2.1, 'planet num 2', true, true, 1);
INSERT INTO public.planet VALUES (3, 'p3', 13000, 1300, 3.1, 'planet num 3', false, true, 2);
INSERT INTO public.planet VALUES (4, 'p4', 14000, 1400, 4.1, 'planet num 4', true, true, 2);
INSERT INTO public.planet VALUES (5, 'p5', 15000, 1500, 5.1, 'planet num 5', false, true, 3);
INSERT INTO public.planet VALUES (6, 'p6', 16000, 1600, 6.1, 'planet num 6', true, true, 3);
INSERT INTO public.planet VALUES (7, 'p7', 17000, 1700, 7.1, 'planet num 7', false, true, 4);
INSERT INTO public.planet VALUES (8, 'p8', 18000, 1800, 8.1, 'planet num 8', true, true, 4);
INSERT INTO public.planet VALUES (9, 'p9', 19000, 1900, 9.1, 'planet num 9', false, true, 5);
INSERT INTO public.planet VALUES (10, 'p10', 20000, 2000, 10.1, 'planet num 10', true, true, 5);
INSERT INTO public.planet VALUES (11, 'p11', 21000, 2100, 11.1, 'planet num 11', false, true, 6);
INSERT INTO public.planet VALUES (12, 'p12', 22000, 2200, 12.1, 'planet num 12', true, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 's1', 110000, 11000, 10.1, 'galaxy num 1', false, true, 6);
INSERT INTO public.star VALUES (2, 's2', 120000, 12000, 20.1, 'galaxy num 2', true, true, 5);
INSERT INTO public.star VALUES (3, 's3', 130000, 13000, 30.1, 'galaxy num 3', false, true, 4);
INSERT INTO public.star VALUES (4, 's4', 140000, 14000, 40.1, 'galaxy num 4', true, true, 3);
INSERT INTO public.star VALUES (5, 's5', 150000, 15000, 50.1, 'galaxy num 5', false, true, 2);
INSERT INTO public.star VALUES (6, 's6', 160000, 16000, 60.1, 'galaxy num 6', true, true, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

