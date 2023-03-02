--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)

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
-- Name: audio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audio (
    uuid integer NOT NULL,
    audio_id character varying(100) NOT NULL,
    send_audio_path character varying(100),
    second numeric(10,0),
    bitrate character varying(100),
    cp character varying(100),
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.audio OWNER TO postgres;

--
-- Name: audio_cuting_check; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audio_cuting_check (
    uuid integer NOT NULL,
    audio_id character varying(100),
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.audio_cuting_check OWNER TO postgres;

--
-- Name: audio_cuting_check_uuid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audio_cuting_check_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audio_cuting_check_uuid_seq OWNER TO postgres;

--
-- Name: audio_cuting_check_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audio_cuting_check_uuid_seq OWNED BY public.audio_cuting_check.uuid;


--
-- Name: audio_not_cuting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audio_not_cuting (
    uuid integer NOT NULL,
    audio_id character varying(100) NOT NULL,
    send_audio_path character varying(100),
    second numeric(10,0),
    bitrate character varying(100),
    cp character varying(100),
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.audio_not_cuting OWNER TO postgres;

--
-- Name: audio_not_cuting_uuid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audio_not_cuting_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audio_not_cuting_uuid_seq OWNER TO postgres;

--
-- Name: audio_not_cuting_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audio_not_cuting_uuid_seq OWNED BY public.audio_not_cuting.uuid;


--
-- Name: audio_uuid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audio_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audio_uuid_seq OWNER TO postgres;

--
-- Name: audio_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audio_uuid_seq OWNED BY public.audio.uuid;


--
-- Name: cuting_check; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuting_check (
    uuid integer NOT NULL,
    video_id character varying(100),
    pixel character varying(100),
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.cuting_check OWNER TO postgres;

--
-- Name: cuting_check_uuid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cuting_check_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cuting_check_uuid_seq OWNER TO postgres;

--
-- Name: cuting_check_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cuting_check_uuid_seq OWNED BY public.cuting_check.uuid;


--
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    uuid integer NOT NULL,
    video_id character varying(100) NOT NULL,
    pixel character varying(50) NOT NULL,
    status boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    extension character varying(100),
    s3_url character varying(100),
    send_video_path character varying(100),
    cp character varying(100),
    minut real,
    req_body_media_type character varying(100)
);


ALTER TABLE public.film OWNER TO postgres;

--
-- Name: film_uuid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.film_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_uuid_seq OWNER TO postgres;

--
-- Name: film_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.film_uuid_seq OWNED BY public.film.uuid;


--
-- Name: parts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parts (
    uuid integer NOT NULL,
    video_id character varying(100),
    path character varying(100),
    "order" character varying(100),
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.parts OWNER TO postgres;

--
-- Name: parts_uuid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.parts_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parts_uuid_seq OWNER TO postgres;

--
-- Name: parts_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.parts_uuid_seq OWNED BY public.parts.uuid;


--
-- Name: audio uuid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audio ALTER COLUMN uuid SET DEFAULT nextval('public.audio_uuid_seq'::regclass);


--
-- Name: audio_cuting_check uuid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audio_cuting_check ALTER COLUMN uuid SET DEFAULT nextval('public.audio_cuting_check_uuid_seq'::regclass);


--
-- Name: audio_not_cuting uuid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audio_not_cuting ALTER COLUMN uuid SET DEFAULT nextval('public.audio_not_cuting_uuid_seq'::regclass);


--
-- Name: cuting_check uuid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuting_check ALTER COLUMN uuid SET DEFAULT nextval('public.cuting_check_uuid_seq'::regclass);


--
-- Name: film uuid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film ALTER COLUMN uuid SET DEFAULT nextval('public.film_uuid_seq'::regclass);


--
-- Name: parts uuid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parts ALTER COLUMN uuid SET DEFAULT nextval('public.parts_uuid_seq'::regclass);


--
-- Data for Name: audio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audio (uuid, audio_id, send_audio_path, second, bitrate, cp, created_at) FROM stdin;
\.


--
-- Data for Name: audio_cuting_check; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audio_cuting_check (uuid, audio_id, created_at) FROM stdin;
\.


--
-- Data for Name: audio_not_cuting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audio_not_cuting (uuid, audio_id, send_audio_path, second, bitrate, cp, created_at) FROM stdin;
7	1ec59466-d500-4a99-8a92-4bfc7781b167	/uploads/audio/1ec59466-d500-4a99-8a92-4bfc7781b167/1ec59466-d500-4a99-8a92-4bfc7781b167	70	320	0x0    0k     320k	2023-01-19 19:59:58.893203+05
8	1ec59466-d500-4a99-8a92-4bfc7781b167	/uploads/audio/1ec59466-d500-4a99-8a92-4bfc7781b167/1ec59466-d500-4a99-8a92-4bfc7781b167	70	320	0x0    0k     320k	2023-01-19 19:59:59.09418+05
9	1ec59466-d500-4a99-8a92-4bfc7781b167	/uploads/audio/1ec59466-d500-4a99-8a92-4bfc7781b167/1ec59466-d500-4a99-8a92-4bfc7781b167	70	130	0x0    0k     130k	2023-01-30 16:18:46.097758+05
10	1ec59466-d500-4a99-8a92-4bfc7781b167	/uploads/audio/1ec59466-d500-4a99-8a92-4bfc7781b167/1ec59466-d500-4a99-8a92-4bfc7781b167	70	130	0x0    0k     130k	2023-01-30 16:18:46.245602+05
11	1ec59466-d500-4a99-8a92-4bfc7781b167	/uploads/audio/1ec59466-d500-4a99-8a92-4bfc7781b167/1ec59466-d500-4a99-8a92-4bfc7781b167	70	130	0x0    0k     130k	2023-01-30 16:20:52.992366+05
12	1ec59466-d500-4a99-8a92-4bfc7781b167	/uploads/audio/1ec59466-d500-4a99-8a92-4bfc7781b167/1ec59466-d500-4a99-8a92-4bfc7781b167	70	130	0x0    0k     130k	2023-01-30 16:20:53.028608+05
13	1ec59466-d500-4a99-8a92-4bfc7781b167	/uploads/audio/1ec59466-d500-4a99-8a92-4bfc7781b167/1ec59466-d500-4a99-8a92-4bfc7781b167	70	130	0x0    0k     130k	2023-01-30 16:29:48.255654+05
14	1ec59466-d500-4a99-8a92-4bfc7781b167	/uploads/audio/1ec59466-d500-4a99-8a92-4bfc7781b167/1ec59466-d500-4a99-8a92-4bfc7781b167	70	130	0x0    0k     130k	2023-01-30 16:29:48.402418+05
15	1ec59466-d500-4a99-8a92-4bfc7781b167	/uploads/audio/1ec59466-d500-4a99-8a92-4bfc7781b167/1ec59466-d500-4a99-8a92-4bfc7781b167	70	320	0x0    0k     320k	2023-02-24 12:28:57.219833+05
16	1ec59466-d500-4a99-8a92-4bfc7781b167	/uploads/audio/1ec59466-d500-4a99-8a92-4bfc7781b167/1ec59466-d500-4a99-8a92-4bfc7781b167	70	320	0x0    0k     320k	2023-02-24 12:28:57.482775+05
17	eb0b515b-9b65-434f-9fe1-453c53cb6d5b	/uploads/audio/eb0b515b-9b65-434f-9fe1-453c53cb6d5b/eb0b515b-9b65-434f-9fe1-453c53cb6d5b	359	192	0x0    0k     192k	2023-02-24 12:28:57.595664+05
18	eb0b515b-9b65-434f-9fe1-453c53cb6d5b	/uploads/audio/eb0b515b-9b65-434f-9fe1-453c53cb6d5b/eb0b515b-9b65-434f-9fe1-453c53cb6d5b	359	192	0x0    0k     192k	2023-02-24 12:28:57.69942+05
19	31c3e192-b790-4562-8efd-606063ef0064	/uploads/audio/31c3e192-b790-4562-8efd-606063ef0064/31c3e192-b790-4562-8efd-606063ef0064	359	192	0x0    0k     192k	2023-02-24 12:47:46.581984+05
20	31c3e192-b790-4562-8efd-606063ef0064	/uploads/audio/31c3e192-b790-4562-8efd-606063ef0064/31c3e192-b790-4562-8efd-606063ef0064	359	192	0x0    0k     192k	2023-02-24 12:47:46.671573+05
21	693732b9-5efd-4402-835f-0d6ad88d7243	/uploads/audio/693732b9-5efd-4402-835f-0d6ad88d7243/693732b9-5efd-4402-835f-0d6ad88d7243	359	192	0x0    0k     192k	2023-02-24 13:11:03.039671+05
22	693732b9-5efd-4402-835f-0d6ad88d7243	/uploads/audio/693732b9-5efd-4402-835f-0d6ad88d7243/693732b9-5efd-4402-835f-0d6ad88d7243	359	192	0x0    0k     192k	2023-02-24 13:11:03.137826+05
23	6c6a34f3-8900-4a9f-a911-2a0c7ee45d0e	/uploads/audio/6c6a34f3-8900-4a9f-a911-2a0c7ee45d0e/6c6a34f3-8900-4a9f-a911-2a0c7ee45d0e	359	192	0x0    0k     192k	2023-02-24 15:47:27.417277+05
24	6c6a34f3-8900-4a9f-a911-2a0c7ee45d0e	/uploads/audio/6c6a34f3-8900-4a9f-a911-2a0c7ee45d0e/6c6a34f3-8900-4a9f-a911-2a0c7ee45d0e	359	192	0x0    0k     192k	2023-02-24 15:47:27.502739+05
25	a57bc643-ad63-40c8-915c-16afc44c6927	/uploads/audio/a57bc643-ad63-40c8-915c-16afc44c6927/a57bc643-ad63-40c8-915c-16afc44c6927	359	192	0x0    0k     192k	2023-02-24 16:00:59.266452+05
26	a57bc643-ad63-40c8-915c-16afc44c6927	/uploads/audio/a57bc643-ad63-40c8-915c-16afc44c6927/a57bc643-ad63-40c8-915c-16afc44c6927	359	192	0x0    0k     192k	2023-02-24 16:00:59.471246+05
27	8360a3c8-dd2a-4653-9c8f-56657c860a40	/uploads/audio/8360a3c8-dd2a-4653-9c8f-56657c860a40/8360a3c8-dd2a-4653-9c8f-56657c860a40	359	192	0x0    0k     192k	2023-02-24 16:02:27.554027+05
28	8360a3c8-dd2a-4653-9c8f-56657c860a40	/uploads/audio/8360a3c8-dd2a-4653-9c8f-56657c860a40/8360a3c8-dd2a-4653-9c8f-56657c860a40	359	192	0x0    0k     192k	2023-02-24 16:02:27.658612+05
29	713b5d25-c2da-4cf1-ba89-839618a36e95	/uploads/audio/713b5d25-c2da-4cf1-ba89-839618a36e95/713b5d25-c2da-4cf1-ba89-839618a36e95	359	192	0x0    0k     192k	2023-02-24 16:10:15.039095+05
30	713b5d25-c2da-4cf1-ba89-839618a36e95	/uploads/audio/713b5d25-c2da-4cf1-ba89-839618a36e95/713b5d25-c2da-4cf1-ba89-839618a36e95	359	192	0x0    0k     192k	2023-02-24 16:10:15.152611+05
31	a70b0c69-0ba0-4b27-9c4a-a52c8a6ac04f	/uploads/audio/a70b0c69-0ba0-4b27-9c4a-a52c8a6ac04f/a70b0c69-0ba0-4b27-9c4a-a52c8a6ac04f	359	192	0x0    0k     192k	2023-02-24 16:22:44.378861+05
32	a70b0c69-0ba0-4b27-9c4a-a52c8a6ac04f	/uploads/audio/a70b0c69-0ba0-4b27-9c4a-a52c8a6ac04f/a70b0c69-0ba0-4b27-9c4a-a52c8a6ac04f	359	192	0x0    0k     192k	2023-02-24 16:22:44.489608+05
33	24455508-37ee-429c-b42c-5f2717b35374	/uploads/audio/24455508-37ee-429c-b42c-5f2717b35374/24455508-37ee-429c-b42c-5f2717b35374	359	192	0x0    0k     192k	2023-02-24 16:24:49.95366+05
34	24455508-37ee-429c-b42c-5f2717b35374	/uploads/audio/24455508-37ee-429c-b42c-5f2717b35374/24455508-37ee-429c-b42c-5f2717b35374	359	192	0x0    0k     192k	2023-02-24 16:24:50.064485+05
\.


--
-- Data for Name: cuting_check; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuting_check (uuid, video_id, pixel, created_at) FROM stdin;
\.


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film (uuid, video_id, pixel, status, created_at, extension, s3_url, send_video_path, cp, minut, req_body_media_type) FROM stdin;
\.


--
-- Data for Name: parts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.parts (uuid, video_id, path, "order", created_at) FROM stdin;
\.


--
-- Name: audio_cuting_check_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audio_cuting_check_uuid_seq', 107, true);


--
-- Name: audio_not_cuting_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audio_not_cuting_uuid_seq', 34, true);


--
-- Name: audio_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audio_uuid_seq', 79, true);


--
-- Name: cuting_check_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cuting_check_uuid_seq', 92, true);


--
-- Name: film_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_uuid_seq', 215, true);


--
-- Name: parts_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.parts_uuid_seq', 71, true);


--
-- Name: audio_cuting_check audio_cuting_check_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audio_cuting_check
    ADD CONSTRAINT audio_cuting_check_pkey PRIMARY KEY (uuid);


--
-- Name: audio_not_cuting audio_not_cuting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audio_not_cuting
    ADD CONSTRAINT audio_not_cuting_pkey PRIMARY KEY (uuid);


--
-- Name: audio audio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audio
    ADD CONSTRAINT audio_pkey PRIMARY KEY (uuid);


--
-- Name: cuting_check cuting_check_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuting_check
    ADD CONSTRAINT cuting_check_pkey PRIMARY KEY (uuid);


--
-- Name: cuting_check cuting_check_video_id_pixel_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuting_check
    ADD CONSTRAINT cuting_check_video_id_pixel_key UNIQUE (video_id, pixel);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (uuid);


--
-- Name: parts parts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parts
    ADD CONSTRAINT parts_pkey PRIMARY KEY (uuid);


--
-- PostgreSQL database dump complete
--

