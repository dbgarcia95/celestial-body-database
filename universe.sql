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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(255) NOT NULL,
    million_solar_masses integer NOT NULL,
    discovered_in integer NOT NULL
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    stars_in_billions integer NOT NULL,
    size_in_light_years numeric NOT NULL,
    description text,
    is_visible boolean NOT NULL
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
    diameter_km integer NOT NULL,
    is_tidal_locked boolean NOT NULL,
    surface_composition text,
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
    name character varying(255) NOT NULL,
    diameter_km integer NOT NULL,
    distance_from_star numeric NOT NULL,
    has_rings boolean NOT NULL,
    atmosphere_description text,
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
    name character varying(255) NOT NULL,
    age_in_million_years integer NOT NULL,
    mass numeric NOT NULL,
    star_type text,
    is_main_sequence boolean NOT NULL,
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 4, 1974);
INSERT INTO public.black_hole VALUES (2, 'M87*,', 5400, 2019);
INSERT INTO public.black_hole VALUES (3, 'TON 618', 66000, 1982);
INSERT INTO public.black_hole VALUES (4, 'M31*', 2, 1988);
INSERT INTO public.black_hole VALUES (5, 'NGC 1277*', 17000, 1875);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 250, 100000, 'Our home galaxy.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, 220000, 'Nearest large galaxy.', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40, 60000, 'Third-largest local group member.', true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 30, 14000, 'Satellite of Milky Way.', true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 7, 7000, 'Another Milky Way satellite.', true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 150, 60000, 'Famous for its spiral structure.', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, true, 'Silicate rock, dust', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, true, 'Regolith, rock', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, true, 'Regolith, rock', 4);
INSERT INTO public.moon VALUES (4, 'Io', 3643, true, 'Sulfur, volcanic surface', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3121, true, 'Ice, water vapor, rock core', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, true, 'Ice, silicate rock, metal core', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820, true, 'Ice, rock', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 5151, true, 'Nitrogen atmosphere, methane lakes', 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 1527, true, 'Ice, rock', 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 504, true, 'Ice, water vapor plumes', 6);
INSERT INTO public.moon VALUES (11, 'Mimas', 396, true, 'Ice, rock', 6);
INSERT INTO public.moon VALUES (12, 'Iapetus', 1471, true, 'Ice, rocky surface', 6);
INSERT INTO public.moon VALUES (13, 'Miranda', 471, true, 'Ice, rock', 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 1158, true, 'Ice, silicate rock', 7);
INSERT INTO public.moon VALUES (15, 'Umbriel', 1169, true, 'Ice, rock', 7);
INSERT INTO public.moon VALUES (16, 'Titania', 1578, true, 'Ice, rock', 7);
INSERT INTO public.moon VALUES (17, 'Oberon', 1523, true, 'Ice, rock', 7);
INSERT INTO public.moon VALUES (18, 'Triton', 2710, true, 'Nitrogen ice, rocky surface', 8);
INSERT INTO public.moon VALUES (19, 'Naiad', 66, false, 'Fragments of old satellites', 8);
INSERT INTO public.moon VALUES (20, 'Charon', 1212, true, 'Water ice, methane', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4880, 0.39, false, 'Thin, mostly O, Na, and H.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 0.72, false, 'Thick, mostly CO2 and sulfuric acid.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 1, false, 'N, O, and trace gases.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 1.52, false, 'Thin, CO2, N, and Ar.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, 5.2, true, 'Largely H and He.', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, 9.58, true, 'Largely H and He.', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 19.19, true, 'H, He, and methane.', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, 30.07, true, 'H, He, and methane, with ice clouds.', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 2377, 39.48, false, 'Thin, mostly N, CO, and methane.', 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 940, 2.77, false, 'None.', 1);
INSERT INTO public.planet VALUES (11, 'Eris', 2326, 67.67, false, 'Thin, mostly N.', 1);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 7500, 0.0485, false, 'Possibly Earth-like.', 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 1.0, 'G-type main-sequence', true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4900, 0.12, 'M-type main-sequence', true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 250, 2.1, 'A-type main-sequence', true, 1);
INSERT INTO public.star VALUES (4, 'Vega', 455, 2.135, 'A-type main-sequence', true, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 10000, 18.0, 'Red supergiant', false, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 800, 21.0, 'Blue supergiant', false, 1);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


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

