    
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3


--
-- TOC entry 201 (class 1259 OID 16921)
-- Name: area; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.area (
    id_area integer NOT NULL,
    id_area_padre integer,
    nombre character varying(155),
    descripcion text
);


--
-- TOC entry 200 (class 1259 OID 16919)
-- Name: area_id_area_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.area_id_area_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3080 (class 0 OID 0)
-- Dependencies: 200
-- Name: area_id_area_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.area_id_area_seq OWNED BY public.area.id_area;


--
-- TOC entry 204 (class 1259 OID 16946)
-- Name: espacio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.espacio (
    id_espacio bigint NOT NULL,
    id_area integer,
    nombre character varying(155),
    observaciones text,
    activo boolean DEFAULT true
);


--
-- TOC entry 206 (class 1259 OID 16963)
-- Name: espacio_caracteristica; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.espacio_caracteristica (
    id_espacio_caracteristica bigint NOT NULL,
    id_espacio bigint,
    id_tipo_espacio integer,
    descripcion text,
    valor text
);


--
-- TOC entry 205 (class 1259 OID 16961)
-- Name: espacio_caracteristica_id_espacio_caracteristica_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.espacio_caracteristica_id_espacio_caracteristica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3081 (class 0 OID 0)
-- Dependencies: 205
-- Name: espacio_caracteristica_id_espacio_caracteristica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.espacio_caracteristica_id_espacio_caracteristica_seq OWNED BY public.espacio_caracteristica.id_espacio_caracteristica;


--
-- TOC entry 203 (class 1259 OID 16944)
-- Name: espacio_id_espacio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.espacio_id_espacio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3082 (class 0 OID 0)
-- Dependencies: 203
-- Name: espacio_id_espacio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.espacio_id_espacio_seq OWNED BY public.espacio.id_espacio;


--
-- TOC entry 208 (class 1259 OID 16984)
-- Name: reserva; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reserva (
    id_reserva bigint NOT NULL,
    id_espacio bigint,
    desde timestamp with time zone DEFAULT now(),
    hasta timestamp with time zone,
    observaciones text,
    id_tipo_reserva integer
);


--
-- TOC entry 213 (class 1259 OID 17035)
-- Name: reserva_historial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reserva_historial (
    id_reserva_historial bigint NOT NULL,
    id_reserva bigint,
    id_tipo_reserva_secuencia bigint,
    fecha_alcanzado timestamp with time zone,
    activo boolean
);


--
-- TOC entry 207 (class 1259 OID 16982)
-- Name: reserva_id_reserva_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reserva_id_reserva_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3083 (class 0 OID 0)
-- Dependencies: 207
-- Name: reserva_id_reserva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reserva_id_reserva_seq OWNED BY public.reserva.id_reserva;


--
-- TOC entry 202 (class 1259 OID 16936)
-- Name: tipo_espacio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_espacio (
    id_tipo_espacio integer NOT NULL,
    nombre character varying(155)
);


--
-- TOC entry 210 (class 1259 OID 17001)
-- Name: tipo_reserva; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_reserva (
    id_tipo_reserva integer NOT NULL,
    nombre character varying(155),
    publico boolean,
    descripcion text
);


--
-- TOC entry 209 (class 1259 OID 16999)
-- Name: tipo_reserva_id_tipo_reserva_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipo_reserva_id_tipo_reserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3084 (class 0 OID 0)
-- Dependencies: 209
-- Name: tipo_reserva_id_tipo_reserva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipo_reserva_id_tipo_reserva_seq OWNED BY public.tipo_reserva.id_tipo_reserva;


--
-- TOC entry 212 (class 1259 OID 17018)
-- Name: tipo_reserva_secuencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipo_reserva_secuencia (
    id_tipo_reserva_secuencia bigint NOT NULL,
    id_tipo_reserva_secuencia_padre bigint,
    indica_fin boolean,
    nombre character varying(155),
    id_tipo_reserva integer
);


--
-- TOC entry 211 (class 1259 OID 17016)
-- Name: tipo_reserva_secuencia_id_tipo_reserva_secuencia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tipo_reserva_secuencia_id_tipo_reserva_secuencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3085 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipo_reserva_secuencia_id_tipo_reserva_secuencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipo_reserva_secuencia_id_tipo_reserva_secuencia_seq OWNED BY public.tipo_reserva_secuencia.id_tipo_reserva_secuencia;


--
-- TOC entry 2894 (class 2604 OID 16924)
-- Name: area id_area; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area ALTER COLUMN id_area SET DEFAULT nextval('public.area_id_area_seq'::regclass);


--
-- TOC entry 2895 (class 2604 OID 16949)
-- Name: espacio id_espacio; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.espacio ALTER COLUMN id_espacio SET DEFAULT nextval('public.espacio_id_espacio_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 16966)
-- Name: espacio_caracteristica id_espacio_caracteristica; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.espacio_caracteristica ALTER COLUMN id_espacio_caracteristica SET DEFAULT nextval('public.espacio_caracteristica_id_espacio_caracteristica_seq'::regclass);


--
-- TOC entry 2898 (class 2604 OID 16987)
-- Name: reserva id_reserva; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reserva ALTER COLUMN id_reserva SET DEFAULT nextval('public.reserva_id_reserva_seq'::regclass);


--
-- TOC entry 2900 (class 2604 OID 17004)
-- Name: tipo_reserva id_tipo_reserva; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_reserva ALTER COLUMN id_tipo_reserva SET DEFAULT nextval('public.tipo_reserva_id_tipo_reserva_seq'::regclass);


--
-- TOC entry 2901 (class 2604 OID 17021)
-- Name: tipo_reserva_secuencia id_tipo_reserva_secuencia; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_reserva_secuencia ALTER COLUMN id_tipo_reserva_secuencia SET DEFAULT nextval('public.tipo_reserva_secuencia_id_tipo_reserva_secuencia_seq'::regclass);


--
-- TOC entry 3062 (class 0 OID 16921)
-- Dependencies: 201
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3065 (class 0 OID 16946)
-- Dependencies: 204
-- Data for Name: espacio; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3067 (class 0 OID 16963)
-- Dependencies: 206
-- Data for Name: espacio_caracteristica; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3069 (class 0 OID 16984)
-- Dependencies: 208
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3074 (class 0 OID 17035)
-- Dependencies: 213
-- Data for Name: reserva_historial; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3063 (class 0 OID 16936)
-- Dependencies: 202
-- Data for Name: tipo_espacio; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3071 (class 0 OID 17001)
-- Dependencies: 210
-- Data for Name: tipo_reserva; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tipo_reserva (id_tipo_reserva, nombre, publico, descripcion) VALUES (1, 'Privada UES', false, '');
INSERT INTO public.tipo_reserva (id_tipo_reserva, nombre, publico, descripcion) VALUES (2, 'Corta Duración', true, 'Parqueo público de corta duración (menos de 3 horas)');


--
-- TOC entry 3073 (class 0 OID 17018)
-- Dependencies: 212
-- Data for Name: tipo_reserva_secuencia; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3086 (class 0 OID 0)
-- Dependencies: 200
-- Name: area_id_area_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.area_id_area_seq', 1, false);


--
-- TOC entry 3087 (class 0 OID 0)
-- Dependencies: 205
-- Name: espacio_caracteristica_id_espacio_caracteristica_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.espacio_caracteristica_id_espacio_caracteristica_seq', 1, false);


--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 203
-- Name: espacio_id_espacio_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.espacio_id_espacio_seq', 1, false);


--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 207
-- Name: reserva_id_reserva_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reserva_id_reserva_seq', 1, false);


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 209
-- Name: tipo_reserva_id_tipo_reserva_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_reserva_id_tipo_reserva_seq', 2, true);


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipo_reserva_secuencia_id_tipo_reserva_secuencia_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tipo_reserva_secuencia_id_tipo_reserva_secuencia_seq', 1, false);


--
-- TOC entry 2904 (class 2606 OID 16929)
-- Name: area pk_area; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT pk_area PRIMARY KEY (id_area);


--
-- TOC entry 2908 (class 2606 OID 16955)
-- Name: espacio pk_espacio; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT pk_espacio PRIMARY KEY (id_espacio);


--
-- TOC entry 2910 (class 2606 OID 16971)
-- Name: espacio_caracteristica pk_espacio_caracteristica; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.espacio_caracteristica
    ADD CONSTRAINT pk_espacio_caracteristica PRIMARY KEY (id_espacio_caracteristica);


--
-- TOC entry 2913 (class 2606 OID 16993)
-- Name: reserva pk_reserva; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT pk_reserva PRIMARY KEY (id_reserva);


--
-- TOC entry 2920 (class 2606 OID 17039)
-- Name: reserva_historial pk_reserva_historial; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reserva_historial
    ADD CONSTRAINT pk_reserva_historial PRIMARY KEY (id_reserva_historial);


--
-- TOC entry 2906 (class 2606 OID 16943)
-- Name: tipo_espacio pk_tipo_espacio; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_espacio
    ADD CONSTRAINT pk_tipo_espacio PRIMARY KEY (id_tipo_espacio);


--
-- TOC entry 2915 (class 2606 OID 17009)
-- Name: tipo_reserva pk_tipo_reserva; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_reserva
    ADD CONSTRAINT pk_tipo_reserva PRIMARY KEY (id_tipo_reserva);


--
-- TOC entry 2918 (class 2606 OID 17023)
-- Name: tipo_reserva_secuencia pk_tipo_reserva_secuencia; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_reserva_secuencia
    ADD CONSTRAINT pk_tipo_reserva_secuencia PRIMARY KEY (id_tipo_reserva_secuencia);


--
-- TOC entry 2902 (class 1259 OID 16935)
-- Name: fki_fk_area_area; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_fk_area_area ON public.area USING btree (id_area_padre);


--
-- TOC entry 2911 (class 1259 OID 17015)
-- Name: fki_fk_reserva_tipo_reserva; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_fk_reserva_tipo_reserva ON public.reserva USING btree (id_tipo_reserva);


--
-- TOC entry 2916 (class 1259 OID 17034)
-- Name: fki_fk_tipo_reserva_secuencia_tipo_reserva_secuencia; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fki_fk_tipo_reserva_secuencia_tipo_reserva_secuencia ON public.tipo_reserva_secuencia USING btree (id_tipo_reserva_secuencia_padre);


--
-- TOC entry 2921 (class 2606 OID 16930)
-- Name: area fk_area_area; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT fk_area_area FOREIGN KEY (id_area_padre) REFERENCES public.area(id_area) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2922 (class 2606 OID 16956)
-- Name: espacio fk_espacio_area; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT fk_espacio_area FOREIGN KEY (id_area) REFERENCES public.area(id_area) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2923 (class 2606 OID 16972)
-- Name: espacio_caracteristica fk_espacio_caracteristica_espacio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.espacio_caracteristica
    ADD CONSTRAINT fk_espacio_caracteristica_espacio FOREIGN KEY (id_espacio) REFERENCES public.espacio(id_espacio) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2924 (class 2606 OID 16977)
-- Name: espacio_caracteristica fk_espacio_caracteristica_tipo_espacio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.espacio_caracteristica
    ADD CONSTRAINT fk_espacio_caracteristica_tipo_espacio FOREIGN KEY (id_tipo_espacio) REFERENCES public.tipo_espacio(id_tipo_espacio) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2925 (class 2606 OID 16994)
-- Name: reserva fk_reserva_espacio; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT fk_reserva_espacio FOREIGN KEY (id_espacio) REFERENCES public.espacio(id_espacio) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2929 (class 2606 OID 17040)
-- Name: reserva_historial fk_reserva_historial_reserva; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reserva_historial
    ADD CONSTRAINT fk_reserva_historial_reserva FOREIGN KEY (id_reserva) REFERENCES public.reserva(id_reserva) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2930 (class 2606 OID 17045)
-- Name: reserva_historial fk_reserva_historial_tipo_reserva_secuencia; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reserva_historial
    ADD CONSTRAINT fk_reserva_historial_tipo_reserva_secuencia FOREIGN KEY (id_tipo_reserva_secuencia) REFERENCES public.tipo_reserva_secuencia(id_tipo_reserva_secuencia) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2926 (class 2606 OID 17010)
-- Name: reserva fk_reserva_tipo_reserva; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT fk_reserva_tipo_reserva FOREIGN KEY (id_tipo_reserva) REFERENCES public.tipo_reserva(id_tipo_reserva) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2927 (class 2606 OID 17024)
-- Name: tipo_reserva_secuencia fk_tipo_reserva_secuencia_tipo_reserva; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_reserva_secuencia
    ADD CONSTRAINT fk_tipo_reserva_secuencia_tipo_reserva FOREIGN KEY (id_tipo_reserva) REFERENCES public.tipo_reserva(id_tipo_reserva) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2928 (class 2606 OID 17029)
-- Name: tipo_reserva_secuencia fk_tipo_reserva_secuencia_tipo_reserva_secuencia; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipo_reserva_secuencia
    ADD CONSTRAINT fk_tipo_reserva_secuencia_tipo_reserva_secuencia FOREIGN KEY (id_tipo_reserva_secuencia_padre) REFERENCES public.tipo_reserva_secuencia(id_tipo_reserva_secuencia) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2023-08-07 17:51:58 UTC

--
-- PostgreSQL database dump complete
--

