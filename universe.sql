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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    diameter integer NOT NULL,
    distance_from_sun numeric(10,2) NOT NULL,
    is_potentially_hazardous boolean DEFAULT false,
    description text
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
    name character varying(255) NOT NULL,
    number_of_stars bigint NOT NULL,
    age numeric(10,2),
    has_planets boolean DEFAULT false,
    CONSTRAINT galaxy_name_not_null CHECK ((name IS NOT NULL))
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
    name character varying(255) NOT NULL,
    planet_id integer,
    diameter integer NOT NULL,
    distance_from_planet numeric(10,2) NOT NULL,
    is_ice boolean DEFAULT true,
    CONSTRAINT moon_name_not_null CHECK ((name IS NOT NULL))
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
    name character varying(255) NOT NULL,
    star_id integer,
    diameter integer NOT NULL,
    distance_from_star numeric(10,2) NOT NULL,
    has_life boolean DEFAULT false,
    CONSTRAINT planet_name_not_null CHECK ((name IS NOT NULL))
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    mass numeric(10,2) NOT NULL,
    temperature integer NOT NULL,
    is_habitable boolean DEFAULT false,
    CONSTRAINT star_name_not_null CHECK ((name IS NOT NULL))
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 2.77, false, NULL);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 2.36, false, NULL);
INSERT INTO public.asteroid VALUES (3, 'Eros', 17, 1.46, true, NULL);
INSERT INTO public.asteroid VALUES (4, 'Itokawa', 0, 1.32, true, NULL);
INSERT INTO public.asteroid VALUES (5, 'Bennu', 0, 1.96, true, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000000000, 13.80, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000000, 10.00, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000000000, 3.00, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 300000000000, 9.20, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 800000000000, 8.00, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 1000000000, 5.50, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (43, 'Moon', 25, 3475, 0.38, true);
INSERT INTO public.moon VALUES (44, 'Phobos', 26, 22, 0.01, true);
INSERT INTO public.moon VALUES (45, 'Deimos', 26, 12, 0.02, true);
INSERT INTO public.moon VALUES (46, 'Io', 28, 3642, 0.42, false);
INSERT INTO public.moon VALUES (47, 'Europa', 28, 3122, 0.67, true);
INSERT INTO public.moon VALUES (48, 'Ganymede', 28, 5262, 1.07, true);
INSERT INTO public.moon VALUES (49, 'Callisto', 28, 4821, 1.88, true);
INSERT INTO public.moon VALUES (50, 'Titan', 29, 5150, 1.22, false);
INSERT INTO public.moon VALUES (51, 'Rhea', 29, 1527, 0.53, true);
INSERT INTO public.moon VALUES (52, 'Iapetus', 29, 1469, 3.56, false);
INSERT INTO public.moon VALUES (53, 'Mimas', 29, 396, 0.19, true);
INSERT INTO public.moon VALUES (54, 'Enceladus', 29, 504, 0.24, true);
INSERT INTO public.moon VALUES (55, 'Triton', 30, 2706, 0.36, true);
INSERT INTO public.moon VALUES (56, 'Charon', 25, 1212, 0.20, true);
INSERT INTO public.moon VALUES (57, 'Oberon', 30, 1523, 0.58, true);
INSERT INTO public.moon VALUES (58, 'Titania', 30, 1577, 0.53, true);
INSERT INTO public.moon VALUES (59, 'Miranda', 30, 472, 0.13, true);
INSERT INTO public.moon VALUES (60, 'Ariel', 30, 1158, 0.24, true);
INSERT INTO public.moon VALUES (61, 'Umbriel', 30, 1169, 0.27, true);
INSERT INTO public.moon VALUES (62, 'Cressida', 30, 79, 0.08, true);
INSERT INTO public.moon VALUES (63, 'Puck', 30, 162, 0.06, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (25, 'Earth', 7, 12742, 1.00, true);
INSERT INTO public.planet VALUES (26, 'Mars', 7, 6779, 1.50, false);
INSERT INTO public.planet VALUES (27, 'Venus', 7, 12104, 0.72, false);
INSERT INTO public.planet VALUES (28, 'Jupiter', 8, 139822, 5.20, false);
INSERT INTO public.planet VALUES (29, 'Saturn', 8, 116460, 9.58, false);
INSERT INTO public.planet VALUES (30, 'Uranus', 9, 50724, 19.22, false);
INSERT INTO public.planet VALUES (31, 'Neptune', 9, 49244, 30.07, false);
INSERT INTO public.planet VALUES (32, 'Mercury', 7, 4879, 0.39, false);
INSERT INTO public.planet VALUES (33, 'Pluto', 7, 2370, 39.50, false);
INSERT INTO public.planet VALUES (34, 'Europa', 8, 3122, 4.20, true);
INSERT INTO public.planet VALUES (35, 'Titan', 9, 5150, 10.70, false);
INSERT INTO public.planet VALUES (36, 'Ganymede', 8, 5262, 4.50, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sirius', 1, 2.10, 9940, false);
INSERT INTO public.star VALUES (8, 'Alpha Centauri', 1, 1.10, 5790, true);
INSERT INTO public.star VALUES (9, 'Betelgeuse', 1, 18.50, 3500, false);
INSERT INTO public.star VALUES (10, 'Proxima Centauri', 2, 0.12, 3000, true);
INSERT INTO public.star VALUES (11, 'Canopus', 3, 14.20, 7350, false);
INSERT INTO public.star VALUES (12, 'Rigel', 3, 76.00, 12000, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 63, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


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

