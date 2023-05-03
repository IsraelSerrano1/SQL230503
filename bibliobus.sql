-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.socio
(
    id_socio serial NOT NULL,
    nombre character(25) NOT NULL,
    edad integer,
    PRIMARY KEY (id_socio)
);

CREATE TABLE IF NOT EXISTS public.libro
(
    "ISBN" integer NOT NULL,
    titulo character NOT NULL,
    autor character NOT NULL,
    n_ejemplares integer NOT NULL,
    id_tema integer NOT NULL,
    PRIMARY KEY ("ISBN")
);

CREATE TABLE IF NOT EXISTS public.tema
(
    id_tema serial NOT NULL,
    nombre character NOT NULL,
    PRIMARY KEY (id_tema)
);

CREATE TABLE IF NOT EXISTS public.libros_socios
(
    id_prestamo serial NOT NULL,
    fecha_prestamo date NOT NULL,
    fecha_devolucion date NOT NULL,
    id_socio integer NOT NULL,
    "ISBN" integer NOT NULL,
    PRIMARY KEY (id_prestamo)
);

ALTER TABLE IF EXISTS public.libro
    ADD CONSTRAINT fk_id_tema_libro FOREIGN KEY (id_tema)
    REFERENCES public.tema (id_tema) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.libros_socios
    ADD CONSTRAINT fk_socio_prestamo FOREIGN KEY (id_socio)
    REFERENCES public.socio (id_socio) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.libros_socios
    ADD CONSTRAINT fk_libro_prestamo FOREIGN KEY ("ISBN")
    REFERENCES public.libro ("ISBN") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;