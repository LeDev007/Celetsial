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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id SERIAL PRIMARY KEY NOT NULL,
    name character varying(30) NOT NULL ,
    moons int NULL,
    stars int,
    description text UNIQUE
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--


--
-- Name: black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--



--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id SERIAL PRIMARY KEY NOT NULL,
    name character varying(30)  UNIQUE,
    age_in_millions_years numeric NOT NULL, 
    moons int NULL,
    stars int,
    has_life boolean 
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--



--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--



--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id SERIAL PRIMARY KEY NOT NULL,
    name character varying(30) UNIQUE,
    has_life boolean NULL,
    distance_from_earth numeric NOT NULL,
    has_water boolean,
    moons int,
    stars int,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--





--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--



--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id SERIAL PRIMARY KEY NOT NULL,
    name character varying(30) UNIQUE,
    moons int NOT NULL,
    stars int NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--




--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--



--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id SERIAL PRIMARY KEY NOT NULL,
    name character varying(30) UNIQUE,
    moons int NOT NULL,
    stars int NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--



--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--



--
-- Name: black_hole id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_id_seq'::regclass);
--
-- Name: galaxy id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);
 

--
-- Name: planet id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole( name , moons , stars, description) VALUES('A', 3 ,3 ,'description 1');
INSERT INTO public.black_hole( name , moons , stars, description) VALUES('B', 3 ,3 ,'desc 2');
INSERT INTO public.black_hole( name , moons , stars, description) VALUES('C',  3 ,3,'desc 3');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy(name , age_in_millions_years , moons, stars,has_life) VALUES('A', 200, 3 ,3 ,true);
INSERT INTO public.galaxy( name , age_in_millions_years , moons, stars,has_life) VALUES( 'B', 378, 3 ,3 ,false);
INSERT INTO public.galaxy( name , age_in_millions_years , moons, stars,has_life) VALUES( 'C', 100, 3 ,3 ,false);
INSERT INTO public.galaxy( name , age_in_millions_years , moons, stars,has_life) VALUES( 'D', 190, 3 ,3 ,true);
INSERT INTO public.galaxy( name , age_in_millions_years , moons, stars,has_life) VALUES( 'E', 354, 3 ,3 ,false);
INSERT INTO public.galaxy( name , age_in_millions_years , moons, stars,has_life) VALUES( 'F', 456, 3 ,3 ,false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('A', false, 130, true, 3 ,3 , 1);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('B', true, 235, false,3 ,3 , 2);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('TY2', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('TY3', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('TY4', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('TY5', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('T1', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('T2', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('T3', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('T4', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('T4k', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('T5', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('T6', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('T7', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('T8', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('T9', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('T98', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('fd', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('er', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('hg', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('iu', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('oi', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('mn', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('fd7', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('hg9', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('nb', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('m0n', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('xc', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('tr', true, 220, true,3 ,3 , 3);
INSERT INTO public.moon(name, has_life , distance_from_earth, has_water, moons, stars, planet_id) VALUES('Thg', true, 220, true,3 ,3 , 3);
--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet(name, moons, stars, star_id) VALUES( 'A', 3 ,3 ,1);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES( 'B', 3 ,3 ,1);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES( 'C', 3 ,3 ,2);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES( 'An', 3 ,3 ,1);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES('Be', 3 ,3 ,1);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES('C4', 3 ,3 ,2);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES('B5', 3 ,3 ,1);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES('Cg', 3 ,3 ,2);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES('B3', 3 ,3 ,1);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES('Cc', 3 ,3 ,2);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES('B7', 3 ,3 ,1);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES('Cbv', 3 ,3 ,2);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES('Bs', 3 ,3 ,1);
INSERT INTO public.planet(name, moons, stars, star_id) VALUES( 'Ct', 3 ,3 ,2);
--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star( name, moons, stars, galaxy_id) VALUES('A', 3 ,3 ,1);
INSERT INTO public.star( name, moons, stars, galaxy_id) VALUES('B',3 ,3 , 1);
INSERT INTO public.star( name, moons, stars, galaxy_id) VALUES('C', 3 ,3 ,2);
INSERT INTO public.star( name, moons, stars, galaxy_id) VALUES( 'D',3 ,3 , 2);
INSERT INTO public.star( name, moons, stars, galaxy_id) VALUES('E',3 ,3 , 2);
INSERT INTO public.star( name, moons, stars, galaxy_id) VALUES( 'F',3 ,3 , 1);


--
-- Name: black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fkey_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;

-- Name: planet fkey_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fkey_star FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star fkey_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fkey_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

