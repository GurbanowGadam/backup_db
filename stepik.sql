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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(150) NOT NULL,
    login character varying(150) NOT NULL,
    password character varying(150) NOT NULL
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.categories (
    uuid integer NOT NULL,
    name character varying(150) NOT NULL,
    about text,
    image_path character varying(150),
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.categories OWNER TO stepik_user;

--
-- Name: categories_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.categories_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_uuid_seq OWNER TO stepik_user;

--
-- Name: categories_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.categories_uuid_seq OWNED BY public.categories.uuid;


--
-- Name: course_categories; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.course_categories (
    uuid integer NOT NULL,
    category_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.course_categories OWNER TO stepik_user;

--
-- Name: course_categories_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.course_categories_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_categories_uuid_seq OWNER TO stepik_user;

--
-- Name: course_categories_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.course_categories_uuid_seq OWNED BY public.course_categories.uuid;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.courses (
    uuid integer NOT NULL,
    name character varying(255) NOT NULL,
    descr text,
    about text,
    image_path character varying(255),
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    view_count integer DEFAULT 0
);


ALTER TABLE public.courses OWNER TO stepik_user;

--
-- Name: courses_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.courses_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_uuid_seq OWNER TO stepik_user;

--
-- Name: courses_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.courses_uuid_seq OWNED BY public.courses.uuid;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.jobs (
    uuid integer NOT NULL,
    name character varying(150) NOT NULL,
    slug character varying(150) NOT NULL
);


ALTER TABLE public.jobs OWNER TO stepik_user;

--
-- Name: jobs_trans; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.jobs_trans (
    uuid integer NOT NULL,
    name character varying(150) NOT NULL,
    job_id integer NOT NULL,
    lang_id integer NOT NULL
);


ALTER TABLE public.jobs_trans OWNER TO stepik_user;

--
-- Name: jobs_trans_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.jobs_trans_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_trans_uuid_seq OWNER TO stepik_user;

--
-- Name: jobs_trans_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.jobs_trans_uuid_seq OWNED BY public.jobs_trans.uuid;


--
-- Name: jobs_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.jobs_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_uuid_seq OWNER TO stepik_user;

--
-- Name: jobs_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.jobs_uuid_seq OWNED BY public.jobs.uuid;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.languages (
    uuid integer NOT NULL,
    name character varying(150) NOT NULL,
    short_name character varying(25) NOT NULL
);


ALTER TABLE public.languages OWNER TO stepik_user;

--
-- Name: languages_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.languages_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_uuid_seq OWNER TO stepik_user;

--
-- Name: languages_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.languages_uuid_seq OWNED BY public.languages.uuid;


--
-- Name: step_align; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.step_align (
    uuid integer NOT NULL,
    step_id integer NOT NULL,
    key text,
    val text,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.step_align OWNER TO stepik_user;

--
-- Name: step_align_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.step_align_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.step_align_uuid_seq OWNER TO stepik_user;

--
-- Name: step_align_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.step_align_uuid_seq OWNED BY public.step_align.uuid;


--
-- Name: step_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.step_answers (
    uuid integer NOT NULL,
    step_id integer NOT NULL,
    text text,
    type character varying(150),
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.step_answers OWNER TO postgres;

--
-- Name: step_answers_uuid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.step_answers_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.step_answers_uuid_seq OWNER TO postgres;

--
-- Name: step_answers_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.step_answers_uuid_seq OWNED BY public.step_answers.uuid;


--
-- Name: steps; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.steps (
    uuid integer NOT NULL,
    sub_theme_id integer NOT NULL,
    type integer NOT NULL,
    text text,
    image_path character varying(150),
    video_path character varying(150),
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    secret_word character varying(250)
);


ALTER TABLE public.steps OWNER TO stepik_user;

--
-- Name: steps_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.steps_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.steps_uuid_seq OWNER TO stepik_user;

--
-- Name: steps_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.steps_uuid_seq OWNED BY public.steps.uuid;


--
-- Name: sub_themes; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.sub_themes (
    uuid integer NOT NULL,
    theme_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.sub_themes OWNER TO stepik_user;

--
-- Name: sub_themes_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.sub_themes_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_themes_uuid_seq OWNER TO stepik_user;

--
-- Name: sub_themes_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.sub_themes_uuid_seq OWNED BY public.sub_themes.uuid;


--
-- Name: themes; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.themes (
    uuid integer NOT NULL,
    course_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.themes OWNER TO stepik_user;

--
-- Name: themes_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.themes_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.themes_uuid_seq OWNER TO stepik_user;

--
-- Name: themes_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.themes_uuid_seq OWNED BY public.themes.uuid;


--
-- Name: user_courses; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.user_courses (
    uuid integer NOT NULL,
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL,
    score integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_courses OWNER TO stepik_user;

--
-- Name: user_courses_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.user_courses_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_courses_uuid_seq OWNER TO stepik_user;

--
-- Name: user_courses_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.user_courses_uuid_seq OWNED BY public.user_courses.uuid;


--
-- Name: user_like_courses; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.user_like_courses (
    uuid integer NOT NULL,
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT clock_timestamp() NOT NULL
);


ALTER TABLE public.user_like_courses OWNER TO stepik_user;

--
-- Name: user_like_courses_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.user_like_courses_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_like_courses_uuid_seq OWNER TO stepik_user;

--
-- Name: user_like_courses_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.user_like_courses_uuid_seq OWNED BY public.user_like_courses.uuid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: stepik_user
--

CREATE TABLE public.users (
    uuid integer NOT NULL,
    name character varying(150),
    email character varying(150) NOT NULL,
    password character varying(150) NOT NULL,
    about text
);


ALTER TABLE public.users OWNER TO stepik_user;

--
-- Name: users_uuid_seq; Type: SEQUENCE; Schema: public; Owner: stepik_user
--

CREATE SEQUENCE public.users_uuid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_uuid_seq OWNER TO stepik_user;

--
-- Name: users_uuid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stepik_user
--

ALTER SEQUENCE public.users_uuid_seq OWNED BY public.users.uuid;


--
-- Name: categories uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.categories ALTER COLUMN uuid SET DEFAULT nextval('public.categories_uuid_seq'::regclass);


--
-- Name: course_categories uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.course_categories ALTER COLUMN uuid SET DEFAULT nextval('public.course_categories_uuid_seq'::regclass);


--
-- Name: courses uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.courses ALTER COLUMN uuid SET DEFAULT nextval('public.courses_uuid_seq'::regclass);


--
-- Name: jobs uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.jobs ALTER COLUMN uuid SET DEFAULT nextval('public.jobs_uuid_seq'::regclass);


--
-- Name: jobs_trans uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.jobs_trans ALTER COLUMN uuid SET DEFAULT nextval('public.jobs_trans_uuid_seq'::regclass);


--
-- Name: languages uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.languages ALTER COLUMN uuid SET DEFAULT nextval('public.languages_uuid_seq'::regclass);


--
-- Name: step_align uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.step_align ALTER COLUMN uuid SET DEFAULT nextval('public.step_align_uuid_seq'::regclass);


--
-- Name: step_answers uuid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.step_answers ALTER COLUMN uuid SET DEFAULT nextval('public.step_answers_uuid_seq'::regclass);


--
-- Name: steps uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.steps ALTER COLUMN uuid SET DEFAULT nextval('public.steps_uuid_seq'::regclass);


--
-- Name: sub_themes uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.sub_themes ALTER COLUMN uuid SET DEFAULT nextval('public.sub_themes_uuid_seq'::regclass);


--
-- Name: themes uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.themes ALTER COLUMN uuid SET DEFAULT nextval('public.themes_uuid_seq'::regclass);


--
-- Name: user_courses uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.user_courses ALTER COLUMN uuid SET DEFAULT nextval('public.user_courses_uuid_seq'::regclass);


--
-- Name: user_like_courses uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.user_like_courses ALTER COLUMN uuid SET DEFAULT nextval('public.user_like_courses_uuid_seq'::regclass);


--
-- Name: users uuid; Type: DEFAULT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.users ALTER COLUMN uuid SET DEFAULT nextval('public.users_uuid_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (uuid, name, login, password) FROM stdin;
fe1e78b3-168e-46bf-8dc6-bc6514f4299b	YDI	narhoz	$2a$10$L3quji2b7dELOe62HUfhHeG2Tf/raw10/QAXdjh6fBdTJx5musbEK
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.categories (uuid, name, about, image_path, created_at) FROM stdin;
17	Category 1	Test category 1	uploads/categories/1676052150315.webp	2023-01-24 13:53:16.73142+05
18	Category 2	test category 2	uploads/categories/1676052135918.webp	2023-01-26 11:40:26.066663+05
19	Category 3	Test category 3	uploads/categories/1676052187423.webp	2023-02-10 23:03:07.506575+05
\.


--
-- Data for Name: course_categories; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.course_categories (uuid, category_id, course_id) FROM stdin;
42	17	21
43	17	22
44	17	23
45	18	23
46	19	23
47	17	24
48	18	24
49	19	24
51	18	21
52	19	21
53	17	25
54	19	25
55	18	26
56	19	26
57	17	26
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.courses (uuid, name, descr, about, image_path, created_at, view_count) FROM stdin;
21	Test 5	desc 5	About 5	uploads/courses/1676200438460.webp	2023-02-10 23:26:32.762325+05	13
25	Course test name 1	Course test desc 1	Course test about 1	uploads/courses/1676200509663.webp	2023-02-12 16:15:09.718919+05	2
24	Test 5	desc 5	About 5	uploads/courses/1676201394216.webp	2023-02-10 23:30:50.213731+05	0
23	Test 4	desc 4	About 4	uploads/courses/1676201409237.webp	2023-02-10 23:30:37.312654+05	0
22	Test 4	desc 4	About 4	uploads/courses/1676201423993.webp	2023-02-10 23:27:00.84429+05	0
26	Test	jskjj j asljlkdjaklsj lkjs djkljslj lkasjdkl 	asndkj kakjshdjjkd jhjasjdh jkhjk kjhaksjhdkj hk	uploads/courses/1677054377546.webp	2023-02-22 13:26:17.605605+05	0
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.jobs (uuid, name, slug) FROM stdin;
1	Talyp	student
2	Mugallym	teacher
3	Magister	magister
\.


--
-- Data for Name: jobs_trans; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.jobs_trans (uuid, name, job_id, lang_id) FROM stdin;
1	Talyp	1	1
2	Mugallym	2	1
3	Magister	3	1
4	Ученик	1	2
5	Учитель	2	2
6	Магистр	3	2
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.languages (uuid, name, short_name) FROM stdin;
1	Türkmen	tm
2	Русский	ru
\.


--
-- Data for Name: step_align; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.step_align (uuid, step_id, key, val, created_at) FROM stdin;
\.


--
-- Data for Name: step_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.step_answers (uuid, step_id, text, type, created_at) FROM stdin;
29	22	Name ucin aytyan 2	false	2023-02-22 13:12:16.90469+05
30	22	Kim ucin aytyan 2	false	2023-02-22 13:12:16.915352+05
31	22	Mana name 2	true	2023-02-22 13:12:16.927961+05
32	22	Aytma 2	false	2023-02-22 13:12:16.939237+05
33	22	Taze jogap	false	2023-02-22 13:12:16.952134+05
34	22	test test test	false	2023-02-22 13:13:14.431271+05
\.


--
-- Data for Name: steps; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.steps (uuid, sub_theme_id, type, text, image_path, video_path, created_at, secret_word) FROM stdin;
12	15	1	<p>skdkkmdks</p><p></p>	\N	\N	2023-02-12 16:54:03.42029+05	\N
14	15	2	\N	uploads/step_image/1676233650977.webp	uploads/step_video/1676233650978.mp4	2023-02-13 01:27:30.996749+05	\N
15	15	2	\N	uploads/step_image/1676233658571.webp	uploads/step_video/1676233658572.mp4	2023-02-13 01:27:38.590441+05	\N
16	15	2	\N	uploads/step_image/1676233667163.webp	uploads/step_video/1676233667164.mp4	2023-02-13 01:27:47.179259+05	\N
17	15	2	\N	uploads/step_image/1676233671611.webp	uploads/step_video/1676233671611.mp4	2023-02-13 01:27:51.627039+05	\N
18	15	2	\N	uploads/step_image/1676233687630.webp	uploads/step_video/1676233687633.mp4	2023-02-13 01:28:07.674541+05	\N
19	15	2	\N	uploads/step_image/1676233698671.webp	uploads/step_video/1676233698675.mp4	2023-02-13 01:28:18.822491+05	\N
21	15	2	\N	uploads/step_image/1676545929924.webp	uploads/step_video/1676545929926.mp4	2023-02-16 16:03:22.878609+05	\N
22	15	3	Men aydym aytyan senucin aytyan seni goremde men ozum yitiryan	\N	\N	2023-02-22 13:12:16.856694+05	\N
\.


--
-- Data for Name: sub_themes; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.sub_themes (uuid, theme_id, name) FROM stdin;
15	5	sub theme 1
16	5	sub theme 2
17	5	sub theme 3
18	6	sub theme 12
19	6	sub theme 22
20	6	sub theme 32
21	7	sub theme 31
22	7	sub theme 21
23	7	sub theme 31
\.


--
-- Data for Name: themes; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.themes (uuid, course_id, name) FROM stdin;
5	25	theme 1
6	25	theme 2
7	25	theme 3
8	25	theme 4
\.


--
-- Data for Name: user_courses; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.user_courses (uuid, user_id, course_id, created_at, score) FROM stdin;
13	1	21	2023-02-22 16:13:50.745251+05	0
14	1	23	2023-02-22 17:33:21.733368+05	0
15	1	24	2023-02-22 17:33:26.250578+05	0
\.


--
-- Data for Name: user_like_courses; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.user_like_courses (uuid, user_id, course_id, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: stepik_user
--

COPY public.users (uuid, name, email, password, about) FROM stdin;
1	Gadam	gadamgurbanaga@gmail.com	$2a$10$UyAt/20TPjdLpQz7qWZa3OGrQp1DHa2h5kojU7T6zPeq6s4v60CRW	\N
2	Gadam	merdanov@hasminerals.com	$2a$10$EpfftHaViudCsN4rAYd3hOOnBvOI/OqrOikwbNjLyr46OP.v.adzu	\N
\.


--
-- Name: categories_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.categories_uuid_seq', 19, true);


--
-- Name: course_categories_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.course_categories_uuid_seq', 57, true);


--
-- Name: courses_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.courses_uuid_seq', 26, true);


--
-- Name: jobs_trans_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.jobs_trans_uuid_seq', 6, true);


--
-- Name: jobs_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.jobs_uuid_seq', 3, true);


--
-- Name: languages_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.languages_uuid_seq', 2, true);


--
-- Name: step_align_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.step_align_uuid_seq', 7, true);


--
-- Name: step_answers_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.step_answers_uuid_seq', 34, true);


--
-- Name: steps_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.steps_uuid_seq', 22, true);


--
-- Name: sub_themes_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.sub_themes_uuid_seq', 23, true);


--
-- Name: themes_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.themes_uuid_seq', 8, true);


--
-- Name: user_courses_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.user_courses_uuid_seq', 23, true);


--
-- Name: user_like_courses_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.user_like_courses_uuid_seq', 14, true);


--
-- Name: users_uuid_seq; Type: SEQUENCE SET; Schema: public; Owner: stepik_user
--

SELECT pg_catalog.setval('public.users_uuid_seq', 2, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (uuid);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (uuid);


--
-- Name: course_categories course_categories_category_id_course_id_key; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.course_categories
    ADD CONSTRAINT course_categories_category_id_course_id_key UNIQUE (category_id, course_id);


--
-- Name: course_categories course_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.course_categories
    ADD CONSTRAINT course_categories_pkey PRIMARY KEY (uuid);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (uuid);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (uuid);


--
-- Name: jobs_trans jobs_trans_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.jobs_trans
    ADD CONSTRAINT jobs_trans_pkey PRIMARY KEY (uuid);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (uuid);


--
-- Name: languages languages_short_name_key; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_short_name_key UNIQUE (short_name);


--
-- Name: step_align step_align_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.step_align
    ADD CONSTRAINT step_align_pkey PRIMARY KEY (uuid);


--
-- Name: step_answers step_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.step_answers
    ADD CONSTRAINT step_answers_pkey PRIMARY KEY (uuid);


--
-- Name: steps steps_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_pkey PRIMARY KEY (uuid);


--
-- Name: sub_themes sub_themes_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.sub_themes
    ADD CONSTRAINT sub_themes_pkey PRIMARY KEY (uuid);


--
-- Name: themes themes_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (uuid);


--
-- Name: user_courses user_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.user_courses
    ADD CONSTRAINT user_courses_pkey PRIMARY KEY (uuid);


--
-- Name: user_courses user_courses_user_id_course_id_key; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.user_courses
    ADD CONSTRAINT user_courses_user_id_course_id_key UNIQUE (user_id, course_id);


--
-- Name: user_like_courses user_like_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.user_like_courses
    ADD CONSTRAINT user_like_courses_pkey PRIMARY KEY (uuid);


--
-- Name: user_like_courses user_like_courses_user_id_course_id_key; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.user_like_courses
    ADD CONSTRAINT user_like_courses_user_id_course_id_key UNIQUE (user_id, course_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (uuid);


--
-- Name: course_categories course_categories_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.course_categories
    ADD CONSTRAINT course_categories_category_id_fk FOREIGN KEY (category_id) REFERENCES public.categories(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: course_categories course_categories_course_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.course_categories
    ADD CONSTRAINT course_categories_course_id_fk FOREIGN KEY (course_id) REFERENCES public.courses(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: jobs_trans jobs_trans_job_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.jobs_trans
    ADD CONSTRAINT jobs_trans_job_id_fk FOREIGN KEY (job_id) REFERENCES public.jobs(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: jobs_trans jobs_trans_lang_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.jobs_trans
    ADD CONSTRAINT jobs_trans_lang_id_fk FOREIGN KEY (lang_id) REFERENCES public.languages(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: step_align step_align_step_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.step_align
    ADD CONSTRAINT step_align_step_id_fk FOREIGN KEY (step_id) REFERENCES public.steps(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: step_answers step_answers_step_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.step_answers
    ADD CONSTRAINT step_answers_step_id_fk FOREIGN KEY (step_id) REFERENCES public.steps(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: steps steps_sub_theme_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.steps
    ADD CONSTRAINT steps_sub_theme_id_fk FOREIGN KEY (sub_theme_id) REFERENCES public.sub_themes(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sub_themes sub_themes_theme_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.sub_themes
    ADD CONSTRAINT sub_themes_theme_id_fk FOREIGN KEY (theme_id) REFERENCES public.themes(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: themes themes_course_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.themes
    ADD CONSTRAINT themes_course_id_fk FOREIGN KEY (course_id) REFERENCES public.courses(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_courses user_courses_course_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.user_courses
    ADD CONSTRAINT user_courses_course_id_fk FOREIGN KEY (course_id) REFERENCES public.courses(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_courses user_courses_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.user_courses
    ADD CONSTRAINT user_courses_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_like_courses user_like_courses_course_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.user_like_courses
    ADD CONSTRAINT user_like_courses_course_id_fk FOREIGN KEY (course_id) REFERENCES public.courses(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_like_courses user_like_courses_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: stepik_user
--

ALTER TABLE ONLY public.user_like_courses
    ADD CONSTRAINT user_like_courses_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

