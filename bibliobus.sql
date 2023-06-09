-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.libro
(
    "ISBN" integer NOT NULL,
    titulo character(25) COLLATE pg_catalog."default" NOT NULL,
    autor character(25) COLLATE pg_catalog."default" NOT NULL,
    n_ejemplares integer NOT NULL,
    id_tema integer NOT NULL,
    CONSTRAINT libro_pkey PRIMARY KEY ("ISBN")
);

CREATE TABLE IF NOT EXISTS public.libros_socios
(
    id_prestamo integer NOT NULL DEFAULT nextval('libros_socios_id_prestamo_seq'::regclass),
    fecha_prestamo date NOT NULL,
    fecha_devolucion date NOT NULL,
    id_socio integer NOT NULL,
    "ISBN" integer NOT NULL,
    CONSTRAINT libros_socios_pkey PRIMARY KEY (id_prestamo)
);

CREATE TABLE IF NOT EXISTS public.socio
(
    id_socio integer NOT NULL DEFAULT nextval('socio_id_socio_seq'::regclass),
    nombre character(25) COLLATE pg_catalog."default" NOT NULL,
    edad integer,
    CONSTRAINT socio_pkey PRIMARY KEY (id_socio)
);

CREATE TABLE IF NOT EXISTS public.tema
(
    id_tema integer NOT NULL DEFAULT nextval('tema_id_tema_seq'::regclass),
    nombre character(15) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tema_pkey PRIMARY KEY (id_tema)
);

ALTER TABLE IF EXISTS public.libro
    ADD CONSTRAINT fk_id_tema_libro FOREIGN KEY (id_tema)
    REFERENCES public.tema (id_tema) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.libros_socios
    ADD CONSTRAINT fk_libro_prestamo FOREIGN KEY ("ISBN")
    REFERENCES public.libro ("ISBN") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.libros_socios
    ADD CONSTRAINT fk_socio_prestamo FOREIGN KEY (id_socio)
    REFERENCES public.socio (id_socio) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;