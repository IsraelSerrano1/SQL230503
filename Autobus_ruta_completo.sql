--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-03 17:31:45

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
-- TOC entry 215 (class 1259 OID 16509)
-- Name: autobus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autobus (
    id_autobus integer NOT NULL,
    matricula character(6) NOT NULL
);


ALTER TABLE public.autobus OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16515)
-- Name: autobus_conductor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autobus_conductor (
    id_autobus integer NOT NULL,
    id_conductor integer NOT NULL
);


ALTER TABLE public.autobus_conductor OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16508)
-- Name: autobus_id_autobus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autobus_id_autobus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autobus_id_autobus_seq OWNER TO postgres;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 214
-- Name: autobus_id_autobus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autobus_id_autobus_seq OWNED BY public.autobus.id_autobus;


--
-- TOC entry 218 (class 1259 OID 16521)
-- Name: conductor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conductor (
    id_conductor integer NOT NULL,
    nombre character(25) NOT NULL,
    edad integer
);


ALTER TABLE public.conductor OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16520)
-- Name: conductor_id_conductor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conductor_id_conductor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conductor_id_conductor_seq OWNER TO postgres;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 217
-- Name: conductor_id_conductor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conductor_id_conductor_seq OWNED BY public.conductor.id_conductor;


--
-- TOC entry 220 (class 1259 OID 16528)
-- Name: lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lugar (
    id_lugar integer NOT NULL,
    nombre character(25) NOT NULL,
    id_autobus integer NOT NULL
);


ALTER TABLE public.lugar OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16527)
-- Name: lugar_id_lugar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lugar_id_lugar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lugar_id_lugar_seq OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 219
-- Name: lugar_id_lugar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lugar_id_lugar_seq OWNED BY public.lugar.id_lugar;


--
-- TOC entry 222 (class 1259 OID 16535)
-- Name: recorren_fecha; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recorren_fecha (
    fecha date NOT NULL,
    id_autobus integer NOT NULL,
    id_lugar integer NOT NULL,
    id_visitas integer NOT NULL
);


ALTER TABLE public.recorren_fecha OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16534)
-- Name: recorren_fecha_id_visitas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recorren_fecha_id_visitas_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recorren_fecha_id_visitas_seq OWNER TO postgres;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 221
-- Name: recorren_fecha_id_visitas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recorren_fecha_id_visitas_seq OWNED BY public.recorren_fecha.id_visitas;


--
-- TOC entry 3192 (class 2604 OID 16512)
-- Name: autobus id_autobus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autobus ALTER COLUMN id_autobus SET DEFAULT nextval('public.autobus_id_autobus_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 16524)
-- Name: conductor id_conductor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conductor ALTER COLUMN id_conductor SET DEFAULT nextval('public.conductor_id_conductor_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 16531)
-- Name: lugar id_lugar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar ALTER COLUMN id_lugar SET DEFAULT nextval('public.lugar_id_lugar_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 16538)
-- Name: recorren_fecha id_visitas; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recorren_fecha ALTER COLUMN id_visitas SET DEFAULT nextval('public.recorren_fecha_id_visitas_seq'::regclass);


--
-- TOC entry 3354 (class 0 OID 16509)
-- Dependencies: 215
-- Data for Name: autobus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autobus (id_autobus, matricula) VALUES (1, '1234GD');
INSERT INTO public.autobus (id_autobus, matricula) VALUES (2, '6543YT');
INSERT INTO public.autobus (id_autobus, matricula) VALUES (3, '6351BI');


--
-- TOC entry 3355 (class 0 OID 16515)
-- Dependencies: 216
-- Data for Name: autobus_conductor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autobus_conductor (id_autobus, id_conductor) VALUES (1, 3);
INSERT INTO public.autobus_conductor (id_autobus, id_conductor) VALUES (2, 1);
INSERT INTO public.autobus_conductor (id_autobus, id_conductor) VALUES (3, 2);


--
-- TOC entry 3357 (class 0 OID 16521)
-- Dependencies: 218
-- Data for Name: conductor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.conductor (id_conductor, nombre, edad) VALUES (1, 'Paco Martinez            ', 26);
INSERT INTO public.conductor (id_conductor, nombre, edad) VALUES (2, 'Juan Sanchez             ', 35);
INSERT INTO public.conductor (id_conductor, nombre, edad) VALUES (3, 'Luis Perez               ', 62);


--
-- TOC entry 3359 (class 0 OID 16528)
-- Dependencies: 220
-- Data for Name: lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lugar (id_lugar, nombre, id_autobus) VALUES (1, 'Guadalix                 ', 1);
INSERT INTO public.lugar (id_lugar, nombre, id_autobus) VALUES (2, 'Mirasierra               ', 2);
INSERT INTO public.lugar (id_lugar, nombre, id_autobus) VALUES (3, 'Aranjuez                 ', 3);
INSERT INTO public.lugar (id_lugar, nombre, id_autobus) VALUES (4, 'Navalafuente             ', 1);


--
-- TOC entry 3361 (class 0 OID 16535)
-- Dependencies: 222
-- Data for Name: recorren_fecha; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.recorren_fecha (fecha, id_autobus, id_lugar, id_visitas) VALUES ('2023-06-23', 1, 1, 1);
INSERT INTO public.recorren_fecha (fecha, id_autobus, id_lugar, id_visitas) VALUES ('2023-05-24', 2, 2, 2);
INSERT INTO public.recorren_fecha (fecha, id_autobus, id_lugar, id_visitas) VALUES ('2023-05-02', 3, 3, 3);
INSERT INTO public.recorren_fecha (fecha, id_autobus, id_lugar, id_visitas) VALUES ('2023-06-23', 1, 4, 4);


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 214
-- Name: autobus_id_autobus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autobus_id_autobus_seq', 3, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 217
-- Name: conductor_id_conductor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conductor_id_conductor_seq', 3, true);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 219
-- Name: lugar_id_lugar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lugar_id_lugar_seq', 4, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 221
-- Name: recorren_fecha_id_visitas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recorren_fecha_id_visitas_seq', 4, true);


--
-- TOC entry 3199 (class 2606 OID 16519)
-- Name: autobus_conductor autobus_conductor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autobus_conductor
    ADD CONSTRAINT autobus_conductor_pkey PRIMARY KEY (id_autobus);


--
-- TOC entry 3197 (class 2606 OID 16514)
-- Name: autobus autobus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autobus
    ADD CONSTRAINT autobus_pkey PRIMARY KEY (id_autobus);


--
-- TOC entry 3201 (class 2606 OID 16526)
-- Name: conductor conductor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conductor
    ADD CONSTRAINT conductor_pkey PRIMARY KEY (id_conductor);


--
-- TOC entry 3203 (class 2606 OID 16533)
-- Name: lugar lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar
    ADD CONSTRAINT lugar_pkey PRIMARY KEY (id_lugar);


--
-- TOC entry 3205 (class 2606 OID 16540)
-- Name: recorren_fecha recorren_fecha_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recorren_fecha
    ADD CONSTRAINT recorren_fecha_pkey PRIMARY KEY (id_visitas);


--
-- TOC entry 3206 (class 2606 OID 16541)
-- Name: autobus_conductor fk_autobus_conductor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autobus_conductor
    ADD CONSTRAINT fk_autobus_conductor FOREIGN KEY (id_conductor) REFERENCES public.conductor(id_conductor) NOT VALID;


--
-- TOC entry 3208 (class 2606 OID 16551)
-- Name: lugar fk_autobus_lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugar
    ADD CONSTRAINT fk_autobus_lugar FOREIGN KEY (id_autobus) REFERENCES public.autobus(id_autobus) NOT VALID;


--
-- TOC entry 3207 (class 2606 OID 16546)
-- Name: autobus_conductor fk_confuctor_autobus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autobus_conductor
    ADD CONSTRAINT fk_confuctor_autobus FOREIGN KEY (id_autobus) REFERENCES public.autobus(id_autobus) NOT VALID;


--
-- TOC entry 3209 (class 2606 OID 16556)
-- Name: recorren_fecha fk_id_autobus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recorren_fecha
    ADD CONSTRAINT fk_id_autobus FOREIGN KEY (id_autobus) REFERENCES public.autobus(id_autobus) NOT VALID;


--
-- TOC entry 3210 (class 2606 OID 16561)
-- Name: recorren_fecha fk_id_lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recorren_fecha
    ADD CONSTRAINT fk_id_lugar FOREIGN KEY (id_lugar) REFERENCES public.lugar(id_lugar) NOT VALID;


-- Completed on 2023-05-03 17:31:46

--
-- PostgreSQL database dump complete
--

