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
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    responsible_id uuid,
    employee_id uuid,
    country_id uuid,
    region_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    type integer,
    contract_id uuid,
    country_id uuid,
    region_id uuid,
    city_id uuid,
    locality_id uuid,
    address character varying(100),
    phone_number character varying(100),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: consumptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumptions (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    currency_id uuid,
    department_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.consumptions OWNER TO postgres;

--
-- Name: contracts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contracts (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    client_name character varying(255) NOT NULL,
    price double precision,
    order_count integer,
    rate_id uuid,
    since_date character varying(100),
    until_date character varying(100),
    completed_order_count integer,
    active_order_count integer,
    payment_status integer,
    description character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.contracts OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    responsible_id uuid,
    employee_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: currency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.currency (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(100),
    course character varying(100),
    country_id uuid,
    status boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.currency OWNER TO postgres;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    responsible_id uuid,
    employee_id uuid,
    country_id uuid,
    region_id uuid,
    city_id uuid,
    locality_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    phone_number character varying(50),
    country_id uuid,
    region_id uuid,
    city_id uuid,
    department_id uuid,
    locality_id uuid,
    role_id uuid,
    password character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: localities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.localities (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    responsible_id uuid,
    employee_id uuid,
    country_id uuid,
    region_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.localities OWNER TO postgres;

--
-- Name: order_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_rates (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255),
    price double precision,
    rate_id uuid,
    order_id uuid,
    height double precision,
    width double precision,
    length double precision,
    status integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.order_rates OWNER TO postgres;

--
-- Name: order_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_services (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255),
    price double precision,
    service_id uuid,
    order_id uuid,
    height double precision,
    width double precision,
    length double precision,
    "time" double precision,
    status integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.order_services OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    client_name_from character varying(255),
    client_name_to character varying(255),
    country_from uuid,
    country_to uuid,
    region_from uuid,
    region_to uuid,
    city_from uuid,
    city_to uuid,
    door_from boolean,
    door_to boolean,
    weight double precision,
    height double precision,
    width double precision,
    length double precision,
    parcel_count integer,
    rate_status boolean,
    normal_rate_status boolean,
    service_status boolean,
    express_service_status boolean,
    payment_status integer,
    payment_method integer,
    contract_id uuid,
    description character varying(255),
    rate_price double precision,
    normal_rate_price double precision,
    door_price double precision,
    express_service_price double precision,
    service_price double precision,
    total_price double precision,
    phone_number_from character varying(100),
    phone_number_to character varying(100),
    address_from character varying(100),
    address_to character varying(100),
    client_id_from uuid,
    client_id_to uuid,
    locality_from uuid,
    locality_to uuid,
    code character varying(10),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    door_from_price double precision DEFAULT 0,
    door_to_price double precision DEFAULT 0,
    service_time double precision,
    rate_time double precision
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rates (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    status numeric(2,0) NOT NULL,
    currency_id uuid,
    price double precision,
    price_width double precision,
    price_height double precision,
    price_length double precision,
    country_from uuid,
    country_to uuid,
    region_from uuid,
    region_to uuid,
    city_from uuid,
    city_to uuid,
    locality_from uuid,
    locality_to uuid,
    weight_since double precision,
    weight_until double precision,
    width_since double precision,
    width_until double precision,
    height_until double precision,
    height_since double precision,
    length_until double precision,
    length_since double precision,
    image_path character varying(255),
    "time" character varying(100),
    description character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    price_weight double precision,
    door_from boolean DEFAULT false NOT NULL,
    door_to boolean DEFAULT false NOT NULL,
    price_door_from double precision,
    price_door_to double precision
);


ALTER TABLE public.rates OWNER TO postgres;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    responsible_id uuid,
    employee_id uuid,
    country_id uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255) NOT NULL,
    status numeric(2,0) NOT NULL,
    currency_id uuid,
    price double precision,
    country_from uuid,
    country_to uuid,
    region_from uuid,
    region_to uuid,
    city_from uuid,
    city_to uuid,
    locality_from uuid,
    locality_to uuid,
    weight_since double precision,
    weight_until double precision,
    width_since double precision,
    width_until double precision,
    height_until double precision,
    height_since double precision,
    length_until double precision,
    length_since double precision,
    image_path character varying(255),
    "time" character varying(100),
    description character varying(255),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: tax; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax (
    uuid uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    rate character varying(100),
    country_id uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tax OWNER TO postgres;

--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (uuid, name, responsible_id, employee_id, country_id, region_id, created_at, updated_at) FROM stdin;
4a32d38f-781b-425b-9381-eb0f4c6b9629	Ashgabt	\N	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	2023-02-27 11:55:04.829184+05	2023-02-27 11:55:04.829184+05
1a95f2c1-266a-4248-8e61-7552f521897b	Bagtyyarlyk	7e8bd844-fcc7-4469-b535-a70051a41575	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	2023-03-01 18:15:13.815516+05	2023-03-01 18:15:13.815516+05
db5e0b00-5478-48b4-be42-8934394b8367	Buzmeyin	7e8bd844-fcc7-4469-b535-a70051a41575	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	5ea1993f-db83-4c74-92a3-700395566ce8	2023-03-01 18:15:39.784858+05	2023-03-01 18:15:39.784858+05
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (uuid, name, type, contract_id, country_id, region_id, city_id, locality_id, address, phone_number, created_at, updated_at) FROM stdin;
fcdd7cdd-be71-4af8-a766-0159a6b1cd07	name	0	c06e8ae3-acf2-4aa9-8513-77ae486e9251	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	4a32d38f-781b-425b-9381-eb0f4c6b9629	\N	adress	+9123123	2023-02-16 15:57:08.395436+05	2023-02-16 15:57:08.395436+05
\.


--
-- Data for Name: consumptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumptions (uuid, name, currency_id, department_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contracts (uuid, client_name, price, order_count, rate_id, since_date, until_date, completed_order_count, active_order_count, payment_status, description, created_at, updated_at) FROM stdin;
c06e8ae3-acf2-4aa9-8513-77ae486e9251	name	10	2020	\N	01.01.2020	01.01.2023	12	132	0	12312	2023-02-16 18:03:20.296176+05	2023-02-16 18:03:20.296176+05
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (uuid, name, responsible_id, employee_id, created_at, updated_at) FROM stdin;
ba7593ca-2c18-4459-8737-92261d51ee9f	Turkmenistan	\N	\N	2023-02-27 11:54:06.877334+05	2023-02-27 11:54:06.877334+05
\.


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.currency (uuid, name, code, course, country_id, status, created_at, updated_at) FROM stdin;
f8c0bc24-be81-46bd-8124-65cd5db78f38	Manat	TMT	1	ba7593ca-2c18-4459-8737-92261d51ee9f	f	2023-02-27 11:57:07.488898+05	2023-02-27 11:57:07.488898+05
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (uuid, name, responsible_id, employee_id, country_id, region_id, city_id, locality_id, created_at, updated_at) FROM stdin;
131947d9-bac2-40b9-8092-0877f58c31fb	Ashgabat	\N	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	4a32d38f-781b-425b-9381-eb0f4c6b9629	\N	2023-02-27 11:55:48.293335+05	2023-02-27 11:55:48.293335+05
24433de7-e838-4226-966c-a055bbdc1b88	Bayramaly	7e8bd844-fcc7-4469-b535-a70051a41575	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	5ea1993f-db83-4c74-92a3-700395566ce8	\N	0bcb29f3-a5de-4d45-9173-fa32ac586571	2023-03-01 17:34:28.975835+05	2023-03-01 17:34:28.975835+05
ad8ca08c-c2e8-4888-b6e6-bbc7570b5c8c	Bayramaly	7e8bd844-fcc7-4469-b535-a70051a41575	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	4a32d38f-781b-425b-9381-eb0f4c6b9629	\N	2023-03-01 17:37:57.234641+05	2023-03-01 17:37:57.234641+05
70975d65-587d-4857-a7a2-e15115e68a76	Tejen	7e8bd844-fcc7-4469-b535-a70051a41575	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	4a32d38f-781b-425b-9381-eb0f4c6b9629	\N	2023-03-01 17:38:33.715145+05	2023-03-01 17:38:33.715145+05
8896647a-3e0c-44b9-8102-4e31f45ad2db	Bagtyyarlyk	\N	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	4a32d38f-781b-425b-9381-eb0f4c6b9629	\N	2023-03-01 17:43:41.934197+05	2023-03-01 17:43:41.934197+05
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (uuid, name, phone_number, country_id, region_id, city_id, department_id, locality_id, role_id, password, created_at, updated_at) FROM stdin;
7e8bd844-fcc7-4469-b535-a70051a41575	test		\N	\N	\N	\N	\N	\N	null	2023-02-24 16:37:39.317035+05	2023-02-24 16:37:39.317035+05
\.


--
-- Data for Name: localities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.localities (uuid, name, responsible_id, employee_id, country_id, region_id, created_at, updated_at) FROM stdin;
0bcb29f3-a5de-4d45-9173-fa32ac586571	Sakarcage	\N	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	5ea1993f-db83-4c74-92a3-700395566ce8	2023-02-27 11:55:27.77731+05	2023-02-27 11:55:27.77731+05
03e3afce-3667-4574-bdb8-35727353d0c2	Bedirkent	7e8bd844-fcc7-4469-b535-a70051a41575	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	2023-03-01 18:14:05.881189+05	2023-03-01 18:14:05.881189+05
\.


--
-- Data for Name: order_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_rates (uuid, name, price, rate_id, order_id, height, width, length, status, created_at, updated_at) FROM stdin;
6c577d5e-ad12-433e-b772-67fe4469f0f5	Ashgabat = Türkmenabat (extra)	1	\N	1d49e22c-cc55-41ce-94ab-23ddd281658d	200	200	200	1	2023-02-27 10:57:48.607674+05	2023-02-27 10:57:48.607674+05
90ddf8a3-1cd2-4f8c-9ad6-d2baad7068fe	Ashgabat - Türkmenabat (normal)	50	\N	1d49e22c-cc55-41ce-94ab-23ddd281658d	20	20	20	0	2023-02-27 10:57:48.601967+05	2023-02-27 10:57:48.601967+05
767783ab-28ba-48b7-ac9c-7388d13a1bdd	Ashgabat-Sakarcage	40	bc946d3e-36e7-4c47-854a-3e37d4fbb07f	002379c6-b865-4eb4-939f-a74bb1f046d2	20	20	20	0	2023-02-27 12:08:41.164953+05	2023-02-27 12:08:41.164953+05
8fcff3ae-d3f7-4ae1-92c0-c51ea63fe945	Ashgabat-Sakarcage	550	a147247f-8960-445d-a6df-8abeb97d4dcb	002379c6-b865-4eb4-939f-a74bb1f046d2	100	100	100	1	2023-02-27 12:08:41.193422+05	2023-02-27 12:08:41.193422+05
\.


--
-- Data for Name: order_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_services (uuid, name, price, service_id, order_id, height, width, length, "time", status, created_at, updated_at) FROM stdin;
a07b2d87-8379-46be-b885-60199d6aaee1	Express	30	1cb1cd91-9950-498b-b231-54fb265aa56b	002379c6-b865-4eb4-939f-a74bb1f046d2	40	40	40	-6	0	2023-02-27 12:08:41.236928+05	2023-02-27 12:08:41.236928+05
6a1c74e2-80e0-44d9-aa84-4451489ffd0c	Antiudar	20	f458476f-b70f-4e78-93cc-985b1e5ae6eb	002379c6-b865-4eb4-939f-a74bb1f046d2	40	40	40	0	1	2023-02-27 12:08:41.262754+05	2023-02-27 12:08:41.262754+05
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (uuid, client_name_from, client_name_to, country_from, country_to, region_from, region_to, city_from, city_to, door_from, door_to, weight, height, width, length, parcel_count, rate_status, normal_rate_status, service_status, express_service_status, payment_status, payment_method, contract_id, description, rate_price, normal_rate_price, door_price, express_service_price, service_price, total_price, phone_number_from, phone_number_to, address_from, address_to, client_id_from, client_id_to, locality_from, locality_to, code, created_at, updated_at, status, door_from_price, door_to_price, service_time, rate_time) FROM stdin;
1d4d3864-3007-4a4f-aa10-7057b5c1268f	Sender 1	Receiver 1 	\N	\N	\N	\N	\N	\N	t	t	201	25	20	20	1	f	f	f	f	1	1	\N		0	50	0	0	135	135	+99365000000	+99365111111	st. shasdjah 12	asdasd 12	\N	\N	\N	\N	\N	2023-02-27 10:53:01.494836+05	2023-02-27 10:53:01.494836+05	0	50	50	-144	36
1d49e22c-cc55-41ce-94ab-23ddd281658d	Sender 2	Receiver 2	\N	\N	\N	\N	\N	\N	t	t	200	20	21	20	1	f	f	f	f	1	0	\N		0	50	0	0	0	0	+99365000000	+99365000000	st. shasdjah 12	asdasd 12	\N	\N	\N	\N	\N	2023-02-27 10:57:09.476437+05	2023-02-27 10:57:09.476437+05	0	50	50	0	36
dd608206-1578-4536-92f1-1fa5835844db	client 1	client 2	\N	\N	\N	\N	\N	\N	f	f	2000	20	21	20	1	f	f	f	f	0	0	\N		0	50	0	0	0	0	+993123123123	+993123123123	adress 1		\N	\N	\N	\N	\N	2023-02-27 10:39:29.309673+05	2023-02-27 10:39:29.309673+05	0	0	0	0	36
c974e068-377c-47e5-9da8-ef27b1b22c53	client 1	client 2	\N	\N	\N	\N	\N	\N	f	f	2000	20	20	20	1	f	f	f	f	0	0	\N	Примечание	0	40	0	0	100	100	+993123455	+99312343423	adress	adress 2	\N	\N	\N	\N	\N	2023-02-25 20:16:15.69688+05	2023-02-25 20:16:15.69688+05	0	0	0	18	24
48dd574e-d626-4021-8530-1c24846efa2f	client 1	client 2	\N	\N	\N	\N	\N	\N	f	f	2000	20	20	20	1	f	f	f	f	0	0	\N		1	40	0	0	30	31	+993123123123	+993123124	adresss	adress 2	\N	\N	\N	\N	\N	2023-02-25 20:21:59.466622+05	2023-02-25 20:21:59.466622+05	0	0	0	0	24
b27532f4-f035-4bd9-a206-14a8258fc504	client name		\N	\N	\N	\N	\N	\N	f	f	2000	20	20	20	1	f	f	f	f	0	0	\N	text	1	40	0	0	30	31	+123131		asdasd		\N	\N	\N	\N	\N	2023-02-25 21:42:45.134527+05	2023-02-25 21:42:45.134527+05	1	0	0	0	24
c3a59349-a6f5-4669-84bc-44977f136fb7	Client name 1	Client name 2	\N	\N	\N	\N	\N	\N	t	f	1	1	21	1	1	f	f	f	f	0	0	\N		1	40	0	0	30	31	+9936161616	+9936161616	adress1	adress 2	\N	\N	\N	\N	\N	2023-02-25 12:33:11.689177+05	2023-02-25 12:33:11.689177+05	0	10	0	0	48
1b753ada-1f4f-4fca-88dd-d480f0c0d10f	Client name 1	Client name2	\N	\N	\N	\N	\N	\N	t	f	1	1	1	1	1	f	f	f	f	0	0	\N	dfgfh	0	40	0	0	0	0	+123123123	+123123123	adress 1	adress 2	\N	\N	\N	\N	\N	2023-02-25 12:34:17.923803+05	2023-02-25 12:34:17.923803+05	0	0	0	0	24
002379c6-b865-4eb4-939f-a74bb1f046d2	client name	client name 2	ba7593ca-2c18-4459-8737-92261d51ee9f	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	5ea1993f-db83-4c74-92a3-700395566ce8	4a32d38f-781b-425b-9381-eb0f4c6b9629	\N	t	t	2500	40	30	40	1	f	f	f	f	0	1	\N		0	40	0	0	50	50	+9931213213	+9932123123	ashgabat	adress 2	\N	\N	\N	0bcb29f3-a5de-4d45-9173-fa32ac586571	\N	2023-02-27 12:08:41.114097+05	2023-02-27 12:08:41.114097+05	0	100	100	-6	48
\.


--
-- Data for Name: rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rates (uuid, name, status, currency_id, price, price_width, price_height, price_length, country_from, country_to, region_from, region_to, city_from, city_to, locality_from, locality_to, weight_since, weight_until, width_since, width_until, height_until, height_since, length_until, length_since, image_path, "time", description, created_at, updated_at, price_weight, door_from, door_to, price_door_from, price_door_to) FROM stdin;
bc946d3e-36e7-4c47-854a-3e37d4fbb07f	Ashgabat-Sakarcage	0	f8c0bc24-be81-46bd-8124-65cd5db78f38	40	0	0	0	ba7593ca-2c18-4459-8737-92261d51ee9f	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	5ea1993f-db83-4c74-92a3-700395566ce8	4a32d38f-781b-425b-9381-eb0f4c6b9629	\N	\N	0bcb29f3-a5de-4d45-9173-fa32ac586571	1	2000	1	20	20	1	20	1	/public/images/1677481132339374147.jpg	24		2023-02-27 11:58:52.411282+05	2023-02-27 11:58:52.411282+05	0	t	t	20	50
a147247f-8960-445d-a6df-8abeb97d4dcb	Ashgabat-Sakarcage	1	f8c0bc24-be81-46bd-8124-65cd5db78f38	0	1	1	1	ba7593ca-2c18-4459-8737-92261d51ee9f	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	5ea1993f-db83-4c74-92a3-700395566ce8	4a32d38f-781b-425b-9381-eb0f4c6b9629	\N	\N	0bcb29f3-a5de-4d45-9173-fa32ac586571	2001	20000	21	100	100	21	100	21	/public/images/1677481225670335717.jpg	48		2023-02-27 12:00:25.746966+05	2023-02-27 12:00:25.746966+05	1	t	t	100	100
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (uuid, name, responsible_id, employee_id, country_id, created_at, updated_at) FROM stdin;
19941924-60ce-402d-baa2-0278b4d21d11	Ashgabat	\N	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	2023-02-27 11:54:26.044507+05	2023-02-27 11:54:26.044507+05
5ea1993f-db83-4c74-92a3-700395566ce8	w. Mary	\N	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	2023-02-27 11:54:38.645346+05	2023-02-27 11:54:38.645346+05
3d78ae24-27df-4b72-b927-02f2e95c6136	Ahal	7e8bd844-fcc7-4469-b535-a70051a41575	\N	ba7593ca-2c18-4459-8737-92261d51ee9f	2023-03-01 18:26:25.56512+05	2023-03-01 18:26:25.56512+05
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (uuid, name, created_at, updated_at) FROM stdin;
19d56c9b-51c2-4a1c-8ebf-30ee73e12a6a	Dispetcher	2023-02-20 10:15:49.837436+05	2023-02-20 10:15:49.837436+05
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (uuid, name, status, currency_id, price, country_from, country_to, region_from, region_to, city_from, city_to, locality_from, locality_to, weight_since, weight_until, width_since, width_until, height_until, height_since, length_until, length_since, image_path, "time", description, created_at, updated_at) FROM stdin;
1cb1cd91-9950-498b-b231-54fb265aa56b	Express	0	f8c0bc24-be81-46bd-8124-65cd5db78f38	30	ba7593ca-2c18-4459-8737-92261d51ee9f	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	5ea1993f-db83-4c74-92a3-700395566ce8	4a32d38f-781b-425b-9381-eb0f4c6b9629	\N	\N	0bcb29f3-a5de-4d45-9173-fa32ac586571	1	5000	1	40	40	1	40	1	/public/images/1677481302160902593.jpg	-6		2023-02-27 12:01:42.244402+05	2023-02-27 12:01:42.244402+05
f458476f-b70f-4e78-93cc-985b1e5ae6eb	Antiudar	1	f8c0bc24-be81-46bd-8124-65cd5db78f38	20	ba7593ca-2c18-4459-8737-92261d51ee9f	ba7593ca-2c18-4459-8737-92261d51ee9f	19941924-60ce-402d-baa2-0278b4d21d11	5ea1993f-db83-4c74-92a3-700395566ce8	4a32d38f-781b-425b-9381-eb0f4c6b9629	\N	\N	0bcb29f3-a5de-4d45-9173-fa32ac586571	1	5000	1	40	40	1	40	1	/public/images/1677481349357265529.jpg			2023-02-27 12:02:29.495385+05	2023-02-27 12:02:29.495385+05
\.


--
-- Data for Name: tax; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax (uuid, name, rate, country_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (uuid);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (uuid);


--
-- Name: consumptions consumptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumptions
    ADD CONSTRAINT consumptions_pkey PRIMARY KEY (uuid);


--
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (uuid);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (uuid);


--
-- Name: currency currency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (uuid);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (uuid);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (uuid);


--
-- Name: localities localities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localities
    ADD CONSTRAINT localities_pkey PRIMARY KEY (uuid);


--
-- Name: order_rates order_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_rates
    ADD CONSTRAINT order_rates_pkey PRIMARY KEY (uuid);


--
-- Name: order_services order_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_services
    ADD CONSTRAINT order_services_pkey PRIMARY KEY (uuid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (uuid);


--
-- Name: rates rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (uuid);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (uuid);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (uuid);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (uuid);


--
-- Name: tax tax_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax
    ADD CONSTRAINT tax_pkey PRIMARY KEY (uuid);


--
-- Name: orders unique_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT unique_code UNIQUE (code);


--
-- Name: cities city_to_region_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT city_to_region_fk FOREIGN KEY (country_id) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: localities city_to_region_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localities
    ADD CONSTRAINT city_to_region_fk FOREIGN KEY (country_id) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: departments city_to_region_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT city_to_region_fk FOREIGN KEY (country_id) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders client_from_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT client_from_id_fk FOREIGN KEY (client_id_from) REFERENCES public.clients(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: clients client_to_city_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT client_to_city_id_fk FOREIGN KEY (city_id) REFERENCES public.cities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: clients client_to_contract_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT client_to_contract_id_fk FOREIGN KEY (contract_id) REFERENCES public.contracts(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: clients client_to_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT client_to_country_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders client_to_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT client_to_id_fk FOREIGN KEY (client_id_to) REFERENCES public.cities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: clients client_to_locality_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT client_to_locality_id_fk FOREIGN KEY (locality_id) REFERENCES public.localities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: clients client_to_region_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT client_to_region_id_fk FOREIGN KEY (region_id) REFERENCES public.regions(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: consumptions consumption_to_currency_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumptions
    ADD CONSTRAINT consumption_to_currency_id_fk FOREIGN KEY (currency_id) REFERENCES public.currency(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: consumptions consumption_to_department_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumptions
    ADD CONSTRAINT consumption_to_department_id_fk FOREIGN KEY (department_id) REFERENCES public.departments(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contracts contract_to_rate_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contract_to_rate_fk FOREIGN KEY (rate_id) REFERENCES public.rates(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: currency currency_to_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.currency
    ADD CONSTRAINT currency_to_country_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: employees employee_to_city_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_to_city_id_fk FOREIGN KEY (city_id) REFERENCES public.cities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: employees employee_to_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_to_country_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: employees employee_to_department_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_to_department_id_fk FOREIGN KEY (department_id) REFERENCES public.departments(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: employees employee_to_locality_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_to_locality_id_fk FOREIGN KEY (locality_id) REFERENCES public.localities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: employees employee_to_region_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_to_region_id_fk FOREIGN KEY (region_id) REFERENCES public.regions(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: employees employee_to_role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employee_to_role_id_fk FOREIGN KEY (role_id) REFERENCES public.roles(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders locality_from_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT locality_from_id_fk FOREIGN KEY (locality_from) REFERENCES public.localities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders locality_to_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT locality_to_id_fk FOREIGN KEY (locality_to) REFERENCES public.localities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders order_from_city_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_from_city_id_fk FOREIGN KEY (city_from) REFERENCES public.cities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders order_from_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_from_country_id_fk FOREIGN KEY (country_from) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders order_from_region_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_from_region_id_fk FOREIGN KEY (region_from) REFERENCES public.regions(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_rates order_rate_to_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_rates
    ADD CONSTRAINT order_rate_to_id_fk FOREIGN KEY (rate_id) REFERENCES public.rates(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_services order_service_to_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_services
    ADD CONSTRAINT order_service_to_id_fk FOREIGN KEY (service_id) REFERENCES public.services(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders order_to_city_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_to_city_id_fk FOREIGN KEY (city_to) REFERENCES public.cities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders order_to_contract_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_to_contract_id_fk FOREIGN KEY (contract_id) REFERENCES public.contracts(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders order_to_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_to_country_id_fk FOREIGN KEY (country_to) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: orders order_to_region_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_to_region_id_fk FOREIGN KEY (region_to) REFERENCES public.regions(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_rates rate_order_to_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_rates
    ADD CONSTRAINT rate_order_to_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rates rate_to_city_f_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rate_to_city_f_id_fk FOREIGN KEY (city_from) REFERENCES public.cities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: services rate_to_city_f_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT rate_to_city_f_id_fk FOREIGN KEY (city_from) REFERENCES public.cities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: rates rate_to_city_t_id_t_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rate_to_city_t_id_t_fk FOREIGN KEY (city_to) REFERENCES public.cities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: services rate_to_city_t_id_t_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT rate_to_city_t_id_t_fk FOREIGN KEY (city_to) REFERENCES public.cities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: rates rate_to_country_f_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rate_to_country_f_id_fk FOREIGN KEY (country_from) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: services rate_to_country_f_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT rate_to_country_f_id_fk FOREIGN KEY (country_from) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: rates rate_to_country_id_t_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rate_to_country_id_t_fk FOREIGN KEY (country_to) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: services rate_to_country_id_t_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT rate_to_country_id_t_fk FOREIGN KEY (country_to) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: rates rate_to_locality_f_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rate_to_locality_f_id_fk FOREIGN KEY (locality_from) REFERENCES public.localities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: services rate_to_locality_f_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT rate_to_locality_f_id_fk FOREIGN KEY (locality_from) REFERENCES public.localities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: rates rate_to_locality_t_id_t_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rate_to_locality_t_id_t_fk FOREIGN KEY (locality_to) REFERENCES public.localities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: services rate_to_locality_t_id_t_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT rate_to_locality_t_id_t_fk FOREIGN KEY (locality_to) REFERENCES public.localities(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: rates rate_to_region_f_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rate_to_region_f_id_fk FOREIGN KEY (region_from) REFERENCES public.regions(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: services rate_to_region_f_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT rate_to_region_f_id_fk FOREIGN KEY (region_from) REFERENCES public.regions(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: rates rate_to_region_id_t_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rates
    ADD CONSTRAINT rate_to_region_id_t_fk FOREIGN KEY (region_to) REFERENCES public.regions(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: services rate_to_region_id_t_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT rate_to_region_id_t_fk FOREIGN KEY (region_to) REFERENCES public.regions(uuid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: regions region_to_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT region_to_country_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cities region_to_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT region_to_country_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: localities region_to_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localities
    ADD CONSTRAINT region_to_country_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: departments region_to_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT region_to_country_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_services service_order_to_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_services
    ADD CONSTRAINT service_order_to_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tax tax_to_country_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax
    ADD CONSTRAINT tax_to_country_id_fk FOREIGN KEY (country_id) REFERENCES public.countries(uuid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

