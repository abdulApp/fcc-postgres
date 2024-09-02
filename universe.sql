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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_type character varying(255) NOT NULL,
    is_spiral boolean DEFAULT false NOT NULL
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
    distance_from_planet_km numeric NOT NULL,
    orbital_period_days integer NOT NULL,
    has_atmosphere boolean DEFAULT false NOT NULL,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_star_au numeric NOT NULL,
    orbital_period_days integer NOT NULL,
    planet_type character varying(255) NOT NULL,
    description text,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass_solar_masses numeric NOT NULL,
    temperature_kelvin integer NOT NULL,
    star_type character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL
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
-- Name: station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.station (
    station_id integer NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(100) NOT NULL,
    purpose text,
    is_operational boolean
);


ALTER TABLE public.station OWNER TO freecodecamp;

--
-- Name: station_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.station_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.station_station_id_seq OWNER TO freecodecamp;

--
-- Name: station_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.station_station_id_seq OWNED BY public.station.station_id;


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
-- Name: station station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station ALTER COLUMN station_id SET DEFAULT nextval('public.station_station_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 14, 'Barred Spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 10, 'Spiral', true);
INSERT INTO public.galaxy VALUES (3, 'Magellanic Clouds', 100, 'Irregular', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 30, 'Spiral', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 100, 'Lenticular', false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 100, 'Elliptical', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, 27, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 9376, 0, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 1, false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 421700, 2, false, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 670900, 4, false, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070000, 7, false, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 1883000, 17, false, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 1221830, 16, true, 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 238020, 1, false, 4);
INSERT INTO public.moon VALUES (10, 'Rhea', 527040, 5, false, 4);
INSERT INTO public.moon VALUES (11, 'Dione', 377400, 3, false, 4);
INSERT INTO public.moon VALUES (12, 'Tethys', 295000, 2, false, 4);
INSERT INTO public.moon VALUES (13, 'Iapetus', 4546000, 79, false, 4);
INSERT INTO public.moon VALUES (14, 'Miranda', 129000, 3, false, 5);
INSERT INTO public.moon VALUES (15, 'Ariel', 191000, 3, false, 5);
INSERT INTO public.moon VALUES (16, 'Umbriel', 266000, 4, false, 5);
INSERT INTO public.moon VALUES (17, 'Titania', 412000, 9, false, 5);
INSERT INTO public.moon VALUES (18, 'Oberon', 582000, 13, false, 5);
INSERT INTO public.moon VALUES (19, 'Triton', 354775, 6, true, 6);
INSERT INTO public.moon VALUES (20, 'Proteus', 117640, 1, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 365, 'Terrestrial', 'The third planet from the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1.524, 687, 'Terrestrial', 'The fourth planet from the Sun.', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 5.204, 4333, 'Gas Giant', 'The fifth planet from the Sun.', 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 9.583, 10759, 'Gas Giant', 'The sixth planet from the Sun.', 1);
INSERT INTO public.planet VALUES (5, 'Uranus', 19.191, 30687, 'Ice Giant', 'The seventh planet from the Sun.', 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 30.07, 60190, 'Ice Giant', 'The eighth planet from the Sun.', 1);
INSERT INTO public.planet VALUES (7, 'Mercury', 0.387, 88, 'Terrestrial', 'The closest planet to the Sun.', 1);
INSERT INTO public.planet VALUES (8, 'Venus', 0.723, 225, 'Terrestrial', 'The second planet from the Sun.', 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 0.05, 11, 'Terrestrial', 'A planet orbiting Proxima Centauri.', 2);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1b', 0.012, 2, 'Terrestrial', 'A planet orbiting TRAPPIST-1.', 3);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1c', 0.016, 2, 'Terrestrial', 'A planet orbiting TRAPPIST-1.', 3);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 0.021, 4, 'Terrestrial', 'A planet orbiting TRAPPIST-1.', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5778, 'G2V', 1, true);
INSERT INTO public.star VALUES (2, 'Sirius', 2.02, 9940, 'A1Vm', 1, false);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 15, 3500, 'M1-IIab', 1, false);
INSERT INTO public.star VALUES (4, 'Rigel', 17, 11000, 'B8Ia', 1, false);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 0.12, 2887, 'M5.5Ve', 1, false);
INSERT INTO public.star VALUES (6, 'Vega', 2.13, 9600, 'A0V', 1, false);


--
-- Data for Name: station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.station VALUES (1, 'International Space Station', 'Low Earth Orbit', 'Research', true);
INSERT INTO public.station VALUES (2, 'Tiangong', 'Low Earth Orbit', 'Research', true);
INSERT INTO public.station VALUES (3, 'Mir', 'Low Earth Orbit', 'Research', false);


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
-- Name: station_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.station_station_id_seq', 3, true);


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
-- Name: station station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_name_key UNIQUE (name);


--
-- Name: station station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (station_id);


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