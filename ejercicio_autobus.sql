-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.autobus
(
    id_autobus serial,
    matricula character(6) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT autobus_pkey PRIMARY KEY (id_autobus)
);

CREATE TABLE IF NOT EXISTS public.autobus_conductor
(
    id_autobus integer NOT NULL,
    id_conductor integer NOT NULL,
    CONSTRAINT autobus_conductor_pkey PRIMARY KEY (id_autobus)
);

CREATE TABLE IF NOT EXISTS public.conductor
(
    id_conductor serial,
    nombre character(25) COLLATE pg_catalog."default" NOT NULL,
    edad integer,
    CONSTRAINT conductor_pkey PRIMARY KEY (id_conductor)
);

CREATE TABLE IF NOT EXISTS public.lugar
(
    id_lugar serial,
    nombre character(25) COLLATE pg_catalog."default" NOT NULL,
    id_autobus integer NOT NULL,
    CONSTRAINT lugar_pkey PRIMARY KEY (id_lugar)
);

CREATE TABLE IF NOT EXISTS public.recorren_fecha
(
    fecha date NOT NULL,
    id_autobus integer NOT NULL,
    id_lugar integer NOT NULL,
    id_visitas serial,
    CONSTRAINT recorren_fecha_pkey PRIMARY KEY (id_visitas)
);

ALTER TABLE IF EXISTS public.autobus_conductor
    ADD CONSTRAINT fk_autobus_conductor FOREIGN KEY (id_conductor)
    REFERENCES public.conductor (id_conductor) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.autobus_conductor
    ADD CONSTRAINT fk_confuctor_autobus FOREIGN KEY (id_autobus)
    REFERENCES public.autobus (id_autobus) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
CREATE INDEX IF NOT EXISTS autobus_conductor_pkey
    ON public.autobus_conductor(id_autobus);


ALTER TABLE IF EXISTS public.lugar
    ADD CONSTRAINT fk_autobus_lugar FOREIGN KEY (id_autobus)
    REFERENCES public.autobus (id_autobus) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.recorren_fecha
    ADD CONSTRAINT fk_id_autobus FOREIGN KEY (id_autobus)
    REFERENCES public.autobus (id_autobus) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.recorren_fecha
    ADD CONSTRAINT fk_id_lugar FOREIGN KEY (id_lugar)
    REFERENCES public.lugar (id_lugar) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;