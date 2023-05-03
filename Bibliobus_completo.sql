--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-03 17:30:45

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
-- TOC entry 216 (class 1259 OID 16467)
-- Name: libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro (
    "ISBN" integer NOT NULL,
    titulo character(25) NOT NULL,
    autor character(25) NOT NULL,
    n_ejemplares integer NOT NULL,
    id_tema integer NOT NULL
);


ALTER TABLE public.libro OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16480)
-- Name: libros_socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros_socios (
    id_prestamo integer NOT NULL,
    fecha_prestamo date NOT NULL,
    fecha_devolucion date NOT NULL,
    id_socio integer NOT NULL,
    "ISBN" integer NOT NULL
);


ALTER TABLE public.libros_socios OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16479)
-- Name: libros_socios_id_prestamo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_socios_id_prestamo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libros_socios_id_prestamo_seq OWNER TO postgres;

--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 219
-- Name: libros_socios_id_prestamo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_socios_id_prestamo_seq OWNED BY public.libros_socios.id_prestamo;


--
-- TOC entry 215 (class 1259 OID 16461)
-- Name: socio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socio (
    id_socio integer NOT NULL,
    nombre character(25) NOT NULL,
    edad integer
);


ALTER TABLE public.socio OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16460)
-- Name: socio_id_socio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.socio_id_socio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socio_id_socio_seq OWNER TO postgres;

--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 214
-- Name: socio_id_socio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.socio_id_socio_seq OWNED BY public.socio.id_socio;


--
-- TOC entry 218 (class 1259 OID 16473)
-- Name: tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tema (
    id_tema integer NOT NULL,
    nombre character(15) NOT NULL
);


ALTER TABLE public.tema OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16472)
-- Name: tema_id_tema_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tema_id_tema_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tema_id_tema_seq OWNER TO postgres;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 217
-- Name: tema_id_tema_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tema_id_tema_seq OWNED BY public.tema.id_tema;


--
-- TOC entry 3189 (class 2604 OID 16483)
-- Name: libros_socios id_prestamo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_socios ALTER COLUMN id_prestamo SET DEFAULT nextval('public.libros_socios_id_prestamo_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 16464)
-- Name: socio id_socio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio ALTER COLUMN id_socio SET DEFAULT nextval('public.socio_id_socio_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 16476)
-- Name: tema id_tema; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tema ALTER COLUMN id_tema SET DEFAULT nextval('public.tema_id_tema_seq'::regclass);


--
-- TOC entry 3345 (class 0 OID 16467)
-- Dependencies: 216
-- Data for Name: libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.libro ("ISBN", titulo, autor, n_ejemplares, id_tema) VALUES (435364, 'Dracula                  ', 'Bram Stocker             ', 125, 3);
INSERT INTO public.libro ("ISBN", titulo, autor, n_ejemplares, id_tema) VALUES (546585, 'Elfos                    ', 'Brandon Sanderson        ', 350, 2);
INSERT INTO public.libro ("ISBN", titulo, autor, n_ejemplares, id_tema) VALUES (765476, 'Submarino                ', 'Lando Calrisian          ', 30, 1);


--
-- TOC entry 3349 (class 0 OID 16480)
-- Dependencies: 220
-- Data for Name: libros_socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.libros_socios (id_prestamo, fecha_prestamo, fecha_devolucion, id_socio, "ISBN") VALUES (1, '2023-02-02', '2023-02-10', 1, 765476);
INSERT INTO public.libros_socios (id_prestamo, fecha_prestamo, fecha_devolucion, id_socio, "ISBN") VALUES (2, '2023-02-11', '2023-02-28', 3, 765476);
INSERT INTO public.libros_socios (id_prestamo, fecha_prestamo, fecha_devolucion, id_socio, "ISBN") VALUES (3, '2023-04-24', '2023-05-03', 2, 546585);
INSERT INTO public.libros_socios (id_prestamo, fecha_prestamo, fecha_devolucion, id_socio, "ISBN") VALUES (4, '2023-03-30', '2023-04-21', 2, 435364);


--
-- TOC entry 3344 (class 0 OID 16461)
-- Dependencies: 215
-- Data for Name: socio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.socio (id_socio, nombre, edad) VALUES (1, 'Pedro Sanchez            ', 40);
INSERT INTO public.socio (id_socio, nombre, edad) VALUES (2, 'Pablo Iglesias           ', 35);
INSERT INTO public.socio (id_socio, nombre, edad) VALUES (3, 'Felipe Gonzalez          ', 70);


--
-- TOC entry 3347 (class 0 OID 16473)
-- Dependencies: 218
-- Data for Name: tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tema (id_tema, nombre) VALUES (1, 'Drama          ');
INSERT INTO public.tema (id_tema, nombre) VALUES (2, 'Fantasia       ');
INSERT INTO public.tema (id_tema, nombre) VALUES (3, 'Terror         ');


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 219
-- Name: libros_socios_id_prestamo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_socios_id_prestamo_seq', 4, true);


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 214
-- Name: socio_id_socio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.socio_id_socio_seq', 3, true);


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 217
-- Name: tema_id_tema_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tema_id_tema_seq', 3, true);


--
-- TOC entry 3193 (class 2606 OID 16471)
-- Name: libro libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY ("ISBN");


--
-- TOC entry 3197 (class 2606 OID 16485)
-- Name: libros_socios libros_socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_socios
    ADD CONSTRAINT libros_socios_pkey PRIMARY KEY (id_prestamo);


--
-- TOC entry 3191 (class 2606 OID 16466)
-- Name: socio socio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socio
    ADD CONSTRAINT socio_pkey PRIMARY KEY (id_socio);


--
-- TOC entry 3195 (class 2606 OID 16478)
-- Name: tema tema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tema
    ADD CONSTRAINT tema_pkey PRIMARY KEY (id_tema);


--
-- TOC entry 3198 (class 2606 OID 16486)
-- Name: libro fk_id_tema_libro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT fk_id_tema_libro FOREIGN KEY (id_tema) REFERENCES public.tema(id_tema) NOT VALID;


--
-- TOC entry 3199 (class 2606 OID 16496)
-- Name: libros_socios fk_libro_prestamo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_socios
    ADD CONSTRAINT fk_libro_prestamo FOREIGN KEY ("ISBN") REFERENCES public.libro("ISBN") NOT VALID;


--
-- TOC entry 3200 (class 2606 OID 16491)
-- Name: libros_socios fk_socio_prestamo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_socios
    ADD CONSTRAINT fk_socio_prestamo FOREIGN KEY (id_socio) REFERENCES public.socio(id_socio) NOT VALID;


-- Completed on 2023-05-03 17:30:45

--
-- PostgreSQL database dump complete
--

