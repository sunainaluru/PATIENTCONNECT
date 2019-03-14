--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.sitexref DROP CONSTRAINT sitexref_site_id_fkey;
ALTER TABLE ONLY public.sitexref DROP CONSTRAINT sitexref_nct_number_fkey;
ALTER TABLE ONLY public.phasexref DROP CONSTRAINT phasexref_phase_id_fkey;
ALTER TABLE ONLY public.phasexref DROP CONSTRAINT phasexref_nct_number_fkey;
ALTER TABLE ONLY public.interxref DROP CONSTRAINT interxref_nct_number_fkey;
ALTER TABLE ONLY public.interxref DROP CONSTRAINT interxref_inter_id_fkey;
ALTER TABLE ONLY public.condxref DROP CONSTRAINT condxref_nct_number_fkey;
ALTER TABLE ONLY public.condxref DROP CONSTRAINT condxref_cond_id_fkey;
ALTER TABLE ONLY public.age DROP CONSTRAINT age_nct_number_fkey;
ALTER TABLE ONLY public.study DROP CONSTRAINT study_pkey;
ALTER TABLE ONLY public.sitexref DROP CONSTRAINT sitexref_pkey;
ALTER TABLE ONLY public.site DROP CONSTRAINT site_pkey;
ALTER TABLE ONLY public.phasexref DROP CONSTRAINT phasexref_pkey;
ALTER TABLE ONLY public.phase DROP CONSTRAINT phase_pkey;
ALTER TABLE ONLY public.phase DROP CONSTRAINT phase_phase_detail_key;
ALTER TABLE ONLY public.interxref DROP CONSTRAINT interxref_pkey;
ALTER TABLE ONLY public.inter DROP CONSTRAINT inter_pkey;
ALTER TABLE ONLY public.inter DROP CONSTRAINT inter_inter_detail_key;
ALTER TABLE ONLY public.condxref DROP CONSTRAINT condxref_pkey;
ALTER TABLE ONLY public.condition DROP CONSTRAINT condition_pkey;
ALTER TABLE ONLY public.condition DROP CONSTRAINT condition_cond_detail_key;
ALTER TABLE ONLY public.age DROP CONSTRAINT age_pkey;
ALTER TABLE public.sitexref ALTER COLUMN nct_site_id DROP DEFAULT;
ALTER TABLE public.site ALTER COLUMN site_id DROP DEFAULT;
ALTER TABLE public.phasexref ALTER COLUMN nct_phase_id DROP DEFAULT;
ALTER TABLE public.phase ALTER COLUMN phase_id DROP DEFAULT;
ALTER TABLE public.interxref ALTER COLUMN nct_inter_id DROP DEFAULT;
ALTER TABLE public.inter ALTER COLUMN inter_id DROP DEFAULT;
ALTER TABLE public.condxref ALTER COLUMN nct_cond_id DROP DEFAULT;
ALTER TABLE public.condition ALTER COLUMN cond_id DROP DEFAULT;
ALTER TABLE public.age ALTER COLUMN age_id DROP DEFAULT;
DROP TABLE public.study;
DROP SEQUENCE public.sitexref_nct_site_id_seq;
DROP TABLE public.sitexref;
DROP SEQUENCE public.site_site_id_seq;
DROP TABLE public.site;
DROP SEQUENCE public.phasexref_nct_phase_id_seq;
DROP TABLE public.phasexref;
DROP SEQUENCE public.phase_phase_id_seq;
DROP TABLE public.phase;
DROP SEQUENCE public.interxref_nct_inter_id_seq;
DROP TABLE public.interxref;
DROP SEQUENCE public.inter_inter_id_seq;
DROP TABLE public.inter;
DROP SEQUENCE public.condxref_nct_cond_id_seq;
DROP TABLE public.condxref;
DROP SEQUENCE public.condition_cond_id_seq;
DROP TABLE public.condition;
DROP SEQUENCE public.age_age_id_seq;
DROP TABLE public.age;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: age; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.age (
    age_id integer NOT NULL,
    nct_number character varying(64),
    age_range character varying(64),
    age_detail_child character varying(64),
    age_detail_adult character varying(64),
    age_detail_older character varying(64)
);


--
-- Name: age_age_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.age_age_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: age_age_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.age_age_id_seq OWNED BY public.age.age_id;


--
-- Name: condition; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.condition (
    cond_id integer NOT NULL,
    cond_detail character varying(100)
);


--
-- Name: condition_cond_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.condition_cond_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: condition_cond_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.condition_cond_id_seq OWNED BY public.condition.cond_id;


--
-- Name: condxref; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.condxref (
    nct_cond_id integer NOT NULL,
    nct_number character varying(64),
    cond_id integer
);


--
-- Name: condxref_nct_cond_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.condxref_nct_cond_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: condxref_nct_cond_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.condxref_nct_cond_id_seq OWNED BY public.condxref.nct_cond_id;


--
-- Name: inter; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inter (
    inter_id integer NOT NULL,
    inter_detail character varying(500)
);


--
-- Name: inter_inter_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inter_inter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inter_inter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.inter_inter_id_seq OWNED BY public.inter.inter_id;


--
-- Name: interxref; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interxref (
    nct_inter_id integer NOT NULL,
    nct_number character varying(64),
    inter_id integer
);


--
-- Name: interxref_nct_inter_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interxref_nct_inter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interxref_nct_inter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.interxref_nct_inter_id_seq OWNED BY public.interxref.nct_inter_id;


--
-- Name: phase; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.phase (
    phase_id integer NOT NULL,
    phase_detail character varying(64)
);


--
-- Name: phase_phase_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.phase_phase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phase_phase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.phase_phase_id_seq OWNED BY public.phase.phase_id;


--
-- Name: phasexref; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.phasexref (
    nct_phase_id integer NOT NULL,
    nct_number character varying(64),
    phase_id integer
);


--
-- Name: phasexref_nct_phase_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.phasexref_nct_phase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phasexref_nct_phase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.phasexref_nct_phase_id_seq OWNED BY public.phasexref.nct_phase_id;


--
-- Name: site; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.site (
    site_id integer NOT NULL,
    site_name character varying(500),
    site_city character varying(500),
    site_state character varying(500),
    site_country character varying(500),
    site_address character varying(500),
    site_lat double precision,
    site_lng double precision,
    site_zipcode character varying(500)
);


--
-- Name: site_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.site_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: site_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.site_site_id_seq OWNED BY public.site.site_id;


--
-- Name: sitexref; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sitexref (
    nct_site_id integer NOT NULL,
    nct_number character varying(64),
    site_id integer
);


--
-- Name: sitexref_nct_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sitexref_nct_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sitexref_nct_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sitexref_nct_site_id_seq OWNED BY public.sitexref.nct_site_id;


--
-- Name: study; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.study (
    index integer,
    nct_number character varying(64) NOT NULL,
    status character varying(64),
    study_type character varying(64),
    title character varying(1000),
    start_date character varying(64),
    gender character varying(64),
    enrollment integer
);


--
-- Name: age age_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.age ALTER COLUMN age_id SET DEFAULT nextval('public.age_age_id_seq'::regclass);


--
-- Name: condition cond_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.condition ALTER COLUMN cond_id SET DEFAULT nextval('public.condition_cond_id_seq'::regclass);


--
-- Name: condxref nct_cond_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.condxref ALTER COLUMN nct_cond_id SET DEFAULT nextval('public.condxref_nct_cond_id_seq'::regclass);


--
-- Name: inter inter_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inter ALTER COLUMN inter_id SET DEFAULT nextval('public.inter_inter_id_seq'::regclass);


--
-- Name: interxref nct_inter_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interxref ALTER COLUMN nct_inter_id SET DEFAULT nextval('public.interxref_nct_inter_id_seq'::regclass);


--
-- Name: phase phase_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phase ALTER COLUMN phase_id SET DEFAULT nextval('public.phase_phase_id_seq'::regclass);


--
-- Name: phasexref nct_phase_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phasexref ALTER COLUMN nct_phase_id SET DEFAULT nextval('public.phasexref_nct_phase_id_seq'::regclass);


--
-- Name: site site_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site ALTER COLUMN site_id SET DEFAULT nextval('public.site_site_id_seq'::regclass);


--
-- Name: sitexref nct_site_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sitexref ALTER COLUMN nct_site_id SET DEFAULT nextval('public.sitexref_nct_site_id_seq'::regclass);


--
-- Data for Name: age; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.age (age_id, nct_number, age_range, age_detail_child, age_detail_adult, age_detail_older) FROM stdin;
1	NCT03769298	18 Years to 70 Years   	\N	Adult	\N
2	NCT03653546	18 Years and older   	\N	Adult	\N
3	NCT03641209	up to 96 Hours   	Child	\N	\N
4	NCT03601000	60 Years to 85 Years   	\N	Adult	\N
5	NCT03498196	18 Years and older   	\N	Adult	\N
6	NCT03453255	14 Years to 65 Years   	Child	\N	\N
7	NCT03420976	19 Years to 84 Years   	\N	Adult	\N
8	NCT03395288	20 Years and older   	\N	Adult	\N
9	NCT03361345	18 Years to 65 Years   	\N	Adult	\N
10	NCT03354611	35 Years and older   	\N	Adult	\N
11	NCT03334175	18 Years to 65 Years   	\N	Adult	\N
12	NCT03317327	18 Years and older   	\N	Adult	\N
13	NCT03262961	18 Years to 35 Years   	\N	Adult	\N
14	NCT03227731	18 Years to 50 Years   	\N	Adult	\N
15	NCT02786836	18 Years to 80 Years   	\N	Adult	\N
16	NCT01203722	6 Months to 75 Years   	Child	\N	\N
17	NCT03837717	up to 2 Days   	Child	\N	\N
18	NCT03836508	18 Years to 65 Years   	\N	Adult	\N
19	NCT03833596	18 Years to 75 Years   	\N	Adult	\N
20	NCT03833531	18 Years to 65 Years   	\N	Adult	\N
21	NCT03833453	18 Years to 65 Years   	\N	Adult	\N
22	NCT03832712	18 Years to 75 Years   	\N	Adult	\N
23	NCT03832530	18 Years to 35 Years   	\N	Adult	\N
24	NCT03830190	18 Years and older   	\N	Adult	\N
25	NCT03830008	18 Years and older   	\N	Adult	\N
26	NCT03829748	18 Years and older   	\N	Adult	\N
27	NCT03828721	6 Months to 21 Months   	Child	\N	\N
28	NCT03827915		Child	\N	\N
29	NCT03825146	20 Years to 60 Years   	\N	Adult	\N
30	NCT03823456	20 Years to 84 Years   	\N	Adult	\N
31	NCT03818867	18 Years and older   	\N	Adult	\N
32	NCT03817489	18 Years and older   	\N	Adult	\N
33	NCT03814577	18 Years to 65 Years   	\N	Adult	\N
34	NCT03814330	18 Years to 55 Years   	\N	Adult	\N
35	NCT03813992	18 Years to 70 Years   	\N	Adult	\N
36	NCT03813381	18 Years and older   	\N	Adult	\N
37	NCT03813069	3 Years to 65 Years   	Child	\N	\N
38	NCT03809286	22 Years to 50 Years   	\N	Adult	\N
39	NCT03807986	18 Years to 35 Years   	\N	Adult	\N
40	NCT03801772	18 Years and older   	\N	Adult	\N
41	NCT03799328	6 Months to 15 Years   	Child	\N	\N
42	NCT03798483	16 Years and older   	Child	\N	\N
43	NCT03796923	75 Years and older   	\N	\N	Older Adult
44	NCT03796793	18 Years and older   	\N	Adult	\N
45	NCT03795675	18 Years to 70 Years   	\N	Adult	\N
46	NCT03791697	18 Years and older   	\N	Adult	\N
47	NCT03790449		Child	\N	\N
48	NCT03786432	18 Years and older   	\N	Adult	\N
49	NCT03783767	8 Years to 14 Years   	Child	\N	\N
50	NCT03783312	18 Years to 65 Years   	\N	Adult	\N
51	NCT03783299	18 Months and older   	Child	\N	\N
52	NCT03782974	18 Years to 65 Years   	\N	Adult	\N
53	NCT03781050		Child	\N	\N
54	NCT03778580	65 Years and older   	\N	\N	Older Adult
55	NCT03773575	18 Years and older   	\N	Adult	\N
56	NCT03771495	18 Years to 60 Years   	\N	Adult	\N
57	NCT03771430	18 Years and older   	\N	Adult	\N
58	NCT03770962	18 Years to 47 Years   	\N	Adult	\N
59	NCT03770507	7 Years to 35 Years   	Child	\N	\N
60	NCT03767660		Child	\N	\N
61	NCT03761732	18 Years to 65 Years   	\N	Adult	\N
62	NCT03753932		Child	\N	\N
63	NCT03753243	18 Years and older   	\N	Adult	\N
64	NCT03751878		Child	\N	\N
65	NCT03749655	40 Years to 75 Years   	\N	Adult	\N
66	NCT03748914	up to 15 Minutes   	Child	\N	\N
67	NCT03747887	5 Years to 14 Years   	Child	\N	\N
68	NCT03745209	18 Years and older   	\N	Adult	\N
69	NCT03743480	18 Years and older   	\N	Adult	\N
70	NCT03740659	40 Years and older   	\N	Adult	\N
71	NCT03740321	18 Years to 75 Years   	\N	Adult	\N
72	NCT03739528	40 Years and older   	\N	Adult	\N
73	NCT03737227	18 Years to 25 Years   	\N	Adult	\N
74	NCT03736382	18 Years to 60 Years   	\N	Adult	\N
75	NCT03730454	up to 6 Months   	Child	\N	\N
76	NCT03729687	18 Years and older   	\N	Adult	\N
77	NCT03729648	18 Years to 64 Years   	\N	Adult	\N
78	NCT03729297	18 Years and older   	\N	Adult	\N
79	NCT03727321	18 Years to 65 Years   	\N	Adult	\N
80	NCT03725215	18 Years and older   	\N	Adult	\N
81	NCT03724383	19 Years to 75 Years   	\N	Adult	\N
82	NCT03723525	16 Years and older   	Child	\N	\N
83	NCT03719235	10 Years to 70 Years   	Child	\N	\N
84	NCT03716219	8 Years to 35 Years   	Child	\N	\N
85	NCT03714139	25 Years to 70 Years   	\N	Adult	\N
86	NCT03711630	18 Years and older   	\N	Adult	\N
87	NCT03711370	up to 8 Weeks   	Child	\N	\N
88	NCT03709979	up to 24 Months   	Child	\N	\N
89	NCT03704415	18 Years to 65 Years   	\N	Adult	\N
90	NCT03704064	18 Years and older   	\N	Adult	\N
91	NCT03704051	up to 24 Weeks   	Child	\N	\N
92	NCT03699059	18 Years and older   	\N	Adult	\N
93	NCT03697837	3 Years to 9 Years   	Child	\N	\N
94	NCT03695003	30 Years to 60 Years   	\N	Adult	\N
95	NCT03690154	18 Years and older   	\N	Adult	\N
96	NCT03689348	35 Years to 65 Years   	\N	Adult	\N
97	NCT03689049	65 Years and older   	\N	\N	Older Adult
98	NCT03687411	21 Years to 75 Years   	\N	Adult	\N
99	NCT03685227	18 Years to 45 Years   	\N	Adult	\N
100	NCT03682601	20 Years to 70 Years   	\N	Adult	\N
101	NCT03680833	18 Years to 80 Years   	\N	Adult	\N
102	NCT03679689	19 Years to 27 Years   	\N	Adult	\N
103	NCT03678935	18 Years to 75 Years   	\N	Adult	\N
104	NCT03675009	18 Years and older   	\N	Adult	\N
105	NCT03674996	40 Years to 75 Years   	\N	Adult	\N
106	NCT03668873	2 Years to 7 Years   	Child	\N	\N
107	NCT03667755	18 Years and older   	\N	Adult	\N
108	NCT03667001	18 Years to 80 Years   	\N	Adult	\N
109	NCT03663075	40 Years to 60 Years   	\N	Adult	\N
110	NCT03658434	18 Years and older   	\N	Adult	\N
111	NCT03654508	6 Years to 17 Years   	Child	\N	\N
112	NCT03648437	up to 4 Months   	Child	\N	\N
113	NCT03648060	18 Years and older   	\N	Adult	\N
114	NCT03648047	18 Years and older   	\N	Adult	\N
115	NCT03647007	7 Years to 14 Years   	Child	\N	\N
116	NCT03646357	18 Years and older   	\N	Adult	\N
117	NCT03646240	3 Years to 26 Years   	Child	\N	\N
118	NCT03645603	up to 18 Years   	Child	\N	\N
119	NCT03645005	21 Years and older   	\N	Adult	\N
120	NCT03642769	18 Years and older   	\N	Adult	\N
121	NCT03638609	18 Years to 75 Years   	\N	Adult	\N
122	NCT03635840	18 Years to 80 Years   	\N	Adult	\N
123	NCT03632837	18 Years to 75 Years   	\N	Adult	\N
124	NCT03630770	up to 6 Months   	Child	\N	\N
125	NCT03630328	21 Years to 65 Years   	\N	Adult	\N
126	NCT03628001	18 Years and older   	\N	Adult	\N
127	NCT03625544	18 Years to 80 Years   	\N	Adult	\N
128	NCT03623880	18 Years and older   	\N	Adult	\N
129	NCT03620942	21 Years to 50 Years   	\N	Adult	\N
130	NCT03619720	18 Years and older   	\N	Adult	\N
131	NCT03618108	18 Years to 80 Years   	\N	Adult	\N
132	NCT03618017	21 Years to 84 Years   	\N	Adult	\N
133	NCT03615586	18 Years to 85 Years   	\N	Adult	\N
134	NCT03602768	60 Years and older   	\N	Adult	\N
135	NCT03602677	18 Years and older   	\N	Adult	\N
136	NCT03602014	18 Years to 89 Years   	\N	Adult	\N
137	NCT03600987	18 Years and older   	\N	Adult	\N
138	NCT03598114	18 Years and older   	\N	Adult	\N
139	NCT03593889	60 Years and older   	\N	Adult	\N
140	NCT03593148	18 Years to 99 Years   	\N	Adult	\N
141	NCT03591237	18 Years and older   	\N	Adult	\N
142	NCT03585920	18 Years to 70 Years   	\N	Adult	\N
143	NCT03585192		Child	\N	\N
144	NCT03582046	18 Years and older   	\N	Adult	\N
145	NCT03579303	18 Years to 36 Years   	\N	Adult	\N
146	NCT03578848	20 Years to 90 Years   	\N	Adult	\N
147	NCT03578432	18 Years to 75 Years   	\N	Adult	\N
148	NCT03577301	15 Years to 24 Years   	Child	\N	\N
149	NCT03577106	50 Years and older   	\N	Adult	\N
150	NCT03577054	18 Years to 65 Years   	\N	Adult	\N
151	NCT03575026	60 Years and older   	\N	Adult	\N
152	NCT03568812	18 Years to 55 Years   	\N	Adult	\N
153	NCT03567031	up to 6 Months   	Child	\N	\N
154	NCT03567018	18 Years and older   	\N	Adult	\N
155	NCT03565354	18 Years and older   	\N	Adult	\N
156	NCT03564665	25 Years to 85 Years   	\N	Adult	\N
157	NCT03562546	18 Years to 99 Years   	\N	Adult	\N
158	NCT03561961	18 Years and older   	\N	Adult	\N
159	NCT03561103	18 Years to 100 Years   	\N	Adult	\N
160	NCT03559751	22 Years to 65 Years   	\N	Adult	\N
161	NCT03559179		Child	\N	\N
162	NCT03558763	45 Years and older   	\N	Adult	\N
163	NCT03555500	18 Years and older   	\N	Adult	\N
164	NCT03553927	18 Years to 60 Years   	\N	Adult	\N
165	NCT03553004	18 Years and older   	\N	Adult	\N
166	NCT03552523	18 Years and older   	\N	Adult	\N
167	NCT03550885	45 Years to 75 Years   	\N	Adult	\N
168	NCT03543098	16 Years to 55 Years   	Child	\N	\N
169	NCT03542383	45 Years to 78 Years   	\N	Adult	\N
170	NCT03541291	18 Years and older   	\N	Adult	\N
171	NCT03540732	60 Years and older   	\N	Adult	\N
172	NCT03540368	18 Years and older   	\N	Adult	\N
173	NCT03540134	30 Years and older   	\N	Adult	\N
174	NCT03540069	30 Years to 59 Years   	\N	Adult	\N
175	NCT03538730	4 Years to 7 Years   	Child	\N	\N
176	NCT03538379	18 Years and older   	\N	Adult	\N
177	NCT03537612	10 Years to 21 Years   	Child	\N	\N
178	NCT03535675	18 Years to 99 Years   	\N	Adult	\N
179	NCT03534362	18 Years to 90 Years   	\N	Adult	\N
180	NCT03527927	40 Years to 90 Years   	\N	Adult	\N
181	NCT03527849	50 Years to 80 Years   	\N	Adult	\N
182	NCT03527121	18 Years and older   	\N	Adult	\N
183	NCT03526068	21 Years to 100 Years   	\N	Adult	\N
184	NCT03526042	16 Years to 50 Years   	Child	\N	\N
185	NCT03524703	18 Years to 80 Years   	\N	Adult	\N
186	NCT03523806	10 Years to 18 Years   	Child	\N	\N
187	NCT03523299	18 Years and older   	\N	Adult	\N
188	NCT03521960	18 Years and older   	\N	Adult	\N
189	NCT03519750	20 Years to 40 Years   	\N	Adult	\N
190	NCT03519659	18 Years and older   	\N	Adult	\N
191	NCT03518216	11 Years to 16 Years   	Child	\N	\N
192	NCT03517397	18 Years to 64 Years   	\N	Adult	\N
193	NCT03516877	18 Years to 64 Years   	\N	Adult	\N
194	NCT03513822	18 Years and older   	\N	Adult	\N
195	NCT03512691	40 Years to 70 Years   	\N	Adult	\N
196	NCT03510195	18 Years and older   	\N	Adult	\N
197	NCT03508921	18 Years and older   	\N	Adult	\N
198	NCT03508908	18 Years to 39 Years   	\N	Adult	\N
199	NCT03507647	18 Years and older   	\N	Adult	\N
200	NCT03503721	50 Years and older   	\N	Adult	\N
201	NCT03503162	22 Years and older   	\N	Adult	\N
202	NCT03502655	18 Years and older   	\N	Adult	\N
203	NCT03502252	2 Years to 4 Years   	Child	\N	\N
204	NCT03501316	18 Years to 70 Years   	\N	Adult	\N
205	NCT03500419	18 Years and older   	\N	Adult	\N
206	NCT03500406	18 Years and older   	\N	Adult	\N
207	NCT03500367	18 Years to 50 Years   	\N	Adult	\N
208	NCT03496948	35 Years to 80 Years   	\N	Adult	\N
209	NCT03495791	18 Years and older   	\N	Adult	\N
210	NCT03495752	18 Years and older   	\N	Adult	\N
211	NCT03495661	50 Years to 85 Years   	\N	Adult	\N
212	NCT03495518	8 Years to 18 Years   	Child	\N	\N
213	NCT03495089	40 Years and older   	\N	Adult	\N
214	NCT03494816	18 Years and older   	\N	Adult	\N
215	NCT03494335	18 Years and older   	\N	Adult	\N
216	NCT03494205	18 Years and older   	\N	Adult	\N
217	NCT03492476	18 Years and older   	\N	Adult	\N
218	NCT03491059	18 Years to 80 Years   	\N	Adult	\N
219	NCT03491046	18 Years to 60 Years   	\N	Adult	\N
220	NCT03490812	18 Years and older   	\N	Adult	\N
221	NCT03490656	18 Years and older   	\N	Adult	\N
222	NCT03489395	18 Years to 99 Years   	\N	Adult	\N
223	NCT03488511	18 Years and older   	\N	Adult	\N
224	NCT03487718	18 Years to 80 Years   	\N	Adult	\N
225	NCT03486444	18 Years and older   	\N	Adult	\N
226	NCT03486106	18 Years and older   	\N	Adult	\N
227	NCT03484533	18 Years and older   	\N	Adult	\N
228	NCT03484338	60 Years and older   	\N	Adult	\N
229	NCT03484273	18 Years to 60 Years   	\N	Adult	\N
230	NCT03483935	18 Years and older   	\N	Adult	\N
231	NCT03482908	18 Years to 55 Years   	\N	Adult	\N
232	NCT03481023	18 Years to 90 Years   	\N	Adult	\N
233	NCT03479697	18 Years and older   	\N	Adult	\N
234	NCT03478163	18 Years and older   	\N	Adult	\N
235	NCT03478137	35 Years and older   	\N	Adult	\N
236	NCT03477500	18 Years to 50 Years   	\N	Adult	\N
237	NCT03477045	18 Years to 65 Years   	\N	Adult	\N
238	NCT03473899	18 Years to 35 Years   	\N	Adult	\N
239	NCT03473665	18 Years and older   	\N	Adult	\N
240	NCT03472820	50 Years to 72 Years   	\N	Adult	\N
241	NCT03472430	18 Years to 42 Years   	\N	Adult	\N
242	NCT03472378	18 Years to 64 Years   	\N	Adult	\N
243	NCT03471117	35 Years to 70 Years   	\N	Adult	\N
244	NCT03470389	18 Years and older   	\N	Adult	\N
245	NCT03469609	up to 12 Months   	Child	\N	\N
246	NCT03468621		Child	\N	\N
247	NCT03466164	22 Years to 45 Years   	\N	Adult	\N
248	NCT03465982	18 Years and older   	\N	Adult	\N
249	NCT03464773	6 Months to 18 Years   	Child	\N	\N
250	NCT03464266	16 Years to 25 Years   	Child	\N	\N
251	NCT03462966	18 Years to 75 Years   	\N	Adult	\N
252	NCT03462823	18 Years to 60 Years   	\N	Adult	\N
253	NCT03459014	55 Years and older   	\N	Adult	\N
254	NCT03457519	15 Years to 60 Years   	Child	\N	\N
255	NCT03457506	18 Years and older   	\N	Adult	\N
256	NCT03456895	18 Years and older   	\N	Adult	\N
257	NCT03456128	65 Years and older   	\N	\N	Older Adult
258	NCT03455426	20 Years and older   	\N	Adult	\N
259	NCT03454282	18 Years to 75 Years   	\N	Adult	\N
260	NCT03454087	18 Years and older   	\N	Adult	\N
261	NCT03453190	18 Years and older   	\N	Adult	\N
262	NCT03451266	18 Years to 50 Years   	\N	Adult	\N
263	NCT03450655	70 Years to 70 Years   	\N	\N	Older Adult
264	NCT03450564	15 Years to 49 Years   	Child	\N	\N
265	NCT03449693	9 Years to 18 Years   	Child	\N	\N
266	NCT03448289	15 Years to 49 Years   	Child	\N	\N
267	NCT03447119	3 Years and older   	Child	\N	\N
268	NCT03444103	18 Years to 100 Years   	\N	Adult	\N
269	NCT03443388	18 Years to 60 Years   	\N	Adult	\N
270	NCT03443258	16 Years and older   	Child	\N	\N
271	NCT03441867	18 Years to 60 Years   	\N	Adult	\N
272	NCT03438708	18 Years and older   	\N	Adult	\N
273	NCT03435497	18 Years and older   	\N	Adult	\N
274	NCT03435172	18 Years to 65 Years   	\N	Adult	\N
275	NCT03434392	18 Years and older   	\N	Adult	\N
276	NCT03433222	18 Years and older   	\N	Adult	\N
277	NCT03432832	12 Years to 21 Years   	Child	\N	\N
278	NCT03432819	18 Years and older   	\N	Adult	\N
279	NCT03429010	75 Years and older   	\N	\N	Older Adult
280	NCT03428477	18 Years and older   	\N	Adult	\N
281	NCT03426436	18 Years and older   	\N	Adult	\N
282	NCT03425890	21 Years to 85 Years   	\N	Adult	\N
283	NCT03423394	18 Years and older   	\N	Adult	\N
284	NCT03423303	50 Years to 63 Years   	\N	Adult	\N
285	NCT03422536	18 Years and older   	\N	Adult	\N
286	NCT03421262	18 Years to 50 Years   	\N	Adult	\N
287	NCT03420404	21 Years to 100 Years   	\N	Adult	\N
288	NCT03419715	18 Years to 65 Years   	\N	Adult	\N
289	NCT03418870	up to 33 Weeks   	Child	\N	\N
290	NCT03418324	18 Years and older   	\N	Adult	\N
291	NCT03415880	40 Years to 65 Years   	\N	Adult	\N
292	NCT03415841	21 Years to 85 Years   	\N	Adult	\N
293	NCT03412149	18 Years to 65 Years   	\N	Adult	\N
294	NCT03412084	56 Years and older   	\N	Adult	\N
295	NCT03410511	18 Years to 60 Years   	\N	Adult	\N
296	NCT03408873	18 Years and older   	\N	Adult	\N
297	NCT03408574	18 Years to 75 Years   	\N	Adult	\N
298	NCT03406520	21 Years to 90 Years   	\N	Adult	\N
299	NCT03405090	40 Years to 90 Years   	\N	Adult	\N
300	NCT03404011	18 Years to 70 Years   	\N	Adult	\N
301	NCT03401047	18 Years to 30 Years   	\N	Adult	\N
302	NCT03399318	2 Years to 11 Years   	Child	\N	\N
303	NCT03397030	40 Years and older   	\N	Adult	\N
304	NCT03396094	21 Years to 99 Years   	\N	Adult	\N
305	NCT03394599	18 Years and older   	\N	Adult	\N
306	NCT03392415	18 Years and older   	\N	Adult	\N
307	NCT03386227	18 Years to 43 Years   	\N	Adult	\N
308	NCT03384706	18 Years and older   	\N	Adult	\N
309	NCT03382171	18 Years and older   	\N	Adult	\N
310	NCT03382093	18 Years to 65 Years   	\N	Adult	\N
311	NCT03381027	37 Weeks to 42 Weeks   	Child	\N	\N
312	NCT03380884	60 Years and older   	\N	Adult	\N
313	NCT03380013	37 Weeks and older   	Child	\N	\N
314	NCT03379818	24 Months to 48 Months   	Child	\N	\N
315	NCT03375879	50 Years and older   	\N	Adult	\N
316	NCT03375229	18 Years to 65 Years   	\N	Adult	\N
317	NCT03372174	18 Years and older   	\N	Adult	\N
318	NCT03371836	6 Years to 17 Years   	Child	\N	\N
319	NCT03369600	18 Years and older   	\N	Adult	\N
320	NCT03367364	18 Years and older   	\N	Adult	\N
321	NCT03365518	19 Years and older   	\N	Adult	\N
322	NCT03364660	18 Years and older   	\N	Adult	\N
323	NCT03364114	30 Years to 79 Years   	\N	Adult	\N
324	NCT03362983		Child	\N	\N
325	NCT03359863	18 Years to 80 Years   	\N	Adult	\N
326	NCT03357042	18 Years to 50 Years   	\N	Adult	\N
327	NCT03356652	18 Years and older   	\N	Adult	\N
328	NCT03356210	18 Years and older   	\N	Adult	\N
329	NCT03356106	18 Years to 50 Years   	\N	Adult	\N
330	NCT03355456	18 Years to 85 Years   	\N	Adult	\N
331	NCT03354325	up to 2 Years   	Child	\N	\N
332	NCT03354286	2 Years to 6 Years   	Child	\N	\N
333	NCT03353298	18 Years and older   	\N	Adult	\N
334	NCT03352947	18 Years and older   	\N	Adult	\N
335	NCT03350737		Child	\N	\N
336	NCT03348761	18 Years to 64 Years   	\N	Adult	\N
337	NCT03346668	18 Years and older   	\N	Adult	\N
338	NCT03342976	60 Years to 85 Years   	\N	Adult	\N
339	NCT03341975	14 Years to 19 Years   	Child	\N	\N
340	NCT03341520	18 Years and older   	\N	Adult	\N
341	NCT03340922	18 Years and older   	\N	Adult	\N
342	NCT03337607	18 Years to 80 Years   	\N	Adult	\N
343	NCT03337360	18 Years to 50 Years   	\N	Adult	\N
344	NCT03336879	18 Years to 65 Years   	\N	Adult	\N
345	NCT03335475	15 Years to 25 Years   	Child	\N	\N
346	NCT03335358	18 Years and older   	\N	Adult	\N
347	NCT03335319	18 Years and older   	\N	Adult	\N
348	NCT03335124	18 Years and older   	\N	Adult	\N
349	NCT03334643	18 Years to 65 Years   	\N	Adult	\N
350	NCT03333460	18 Years to 65 Years   	\N	Adult	\N
351	NCT03333174	up to 98 Days   	Child	\N	\N
352	NCT03333161	up to 15 Days   	Child	\N	\N
353	NCT03326232	18 Years to 45 Years   	\N	Adult	\N
354	NCT03324451	20 Years to 70 Years   	\N	Adult	\N
355	NCT03323359	18 Years to 75 Years   	\N	Adult	\N
356	NCT03322774	18 Years and older   	\N	Adult	\N
357	NCT03322072	18 Years to 85 Years   	\N	Adult	\N
358	NCT03320057	15 Years and older   	Child	\N	\N
359	NCT03318874	18 Years and older   	\N	Adult	\N
360	NCT03314792	18 Years to 65 Years   	\N	Adult	\N
361	NCT03313492	18 Years to 25 Years   	\N	Adult	\N
362	NCT03308851	16 Years and older   	Child	\N	\N
363	NCT03306992	18 Years and older   	\N	Adult	\N
364	NCT03304626	21 Years to 75 Years   	\N	Adult	\N
365	NCT03304301	65 Years and older   	\N	\N	Older Adult
366	NCT03302858	18 Years to 75 Years   	\N	Adult	\N
367	NCT03302299	18 Years and older   	\N	Adult	\N
368	NCT03301311	7 Years to 18 Years   	Child	\N	\N
369	NCT03299816	21 Years to 100 Years   	\N	Adult	\N
370	NCT03299296	18 Years and older   	\N	Adult	\N
371	NCT03297658	up to 18 Years   	Child	\N	\N
372	NCT03297346	40 Years to 75 Years   	\N	Adult	\N
373	NCT03295708	18 Years to 50 Years   	\N	Adult	\N
374	NCT03295422	18 Years and older   	\N	Adult	\N
375	NCT03294395	18 Years and older   	\N	Adult	\N
376	NCT03291951	18 Years and older   	\N	Adult	\N
377	NCT03290833	20 Years and older   	\N	Adult	\N
378	NCT03290560	18 Years and older   	\N	Adult	\N
379	NCT03289858	55 Years and older   	\N	Adult	\N
380	NCT03286374	18 Years to 67 Years   	\N	Adult	\N
381	NCT03283943	19 Years to 99 Years   	\N	Adult	\N
382	NCT03275571	35 Years and older   	\N	Adult	\N
383	NCT03269071	18 Years to 55 Years   	\N	Adult	\N
384	NCT03268213	1 Year and older   	Child	\N	\N
385	NCT03267420	18 Years and older   	\N	Adult	\N
386	NCT03267238	7 Years and older   	Child	\N	\N
387	NCT03263780	18 Years and older   	\N	Adult	\N
388	NCT03263156	6 Years to 12 Years   	Child	\N	\N
389	NCT03256396	18 Years and older   	\N	Adult	\N
390	NCT03254589	18 Years and older   	\N	Adult	\N
391	NCT03251495	18 Years to 49 Years   	\N	Adult	\N
392	NCT03248518	18 Years and older   	\N	Adult	\N
393	NCT03243539	18 Years and older   	\N	Adult	\N
394	NCT03241511	21 Years and older   	\N	Adult	\N
395	NCT03237468	12 Years to 22 Years   	Child	\N	\N
396	NCT03229538	up to 12 Months   	Child	\N	\N
397	NCT03229486	2 Years to 7 Years   	Child	\N	\N
398	NCT03227809	17 Years to 22 Years   	Child	\N	\N
399	NCT03227770	18 Years to 75 Years   	\N	Adult	\N
400	NCT03212859	70 Years and older   	\N	\N	Older Adult
401	NCT03205956	40 Years to 79 Years   	\N	Adult	\N
402	NCT03196193	20 Years and older   	\N	Adult	\N
403	NCT03193333	18 Years and older   	\N	Adult	\N
404	NCT03191071	18 Years and older   	\N	Adult	\N
405	NCT03168724	46 Years and older   	\N	Adult	\N
406	NCT03167723	18 Years and older   	\N	Adult	\N
407	NCT03167307	8 Years to 18 Years   	Child	\N	\N
408	NCT03128021	60 Years and older   	\N	Adult	\N
409	NCT03116139	18 Years and older   	\N	Adult	\N
410	NCT03110744	18 Years and older   	\N	Adult	\N
411	NCT03100526	18 Years and older   	\N	Adult	\N
412	NCT03044613	18 Years and older   	\N	Adult	\N
413	NCT03036345	18 Years to 99 Years   	\N	Adult	\N
414	NCT03026816	22 Years and older   	\N	Adult	\N
415	NCT03007511	18 Years to 90 Years   	\N	Adult	\N
416	NCT02996565	18 Years to 85 Years   	\N	Adult	\N
417	NCT02995733	18 Years to 75 Years   	\N	Adult	\N
418	NCT02993432		Child	\N	\N
419	NCT02990429	18 Years to 65 Years   	\N	Adult	\N
420	NCT02978950	18 Years and older   	\N	Adult	\N
421	NCT02959697	18 Years and older   	\N	Adult	\N
422	NCT02957669	14 Years to 19 Years   	Child	\N	\N
423	NCT02957253	18 Years to 85 Years   	\N	Adult	\N
424	NCT02940028	18 Years and older   	\N	Adult	\N
425	NCT02874443		Child	\N	\N
426	NCT02871349	7 Years to 24 Years   	Child	\N	\N
427	NCT02852213	5 Years to 18 Years   	Child	\N	\N
428	NCT02845336	18 Years to 50 Years   	\N	Adult	\N
429	NCT02811627	16 Years and older   	Child	\N	\N
430	NCT02808507	up to 99 Years   	Child	\N	\N
431	NCT02690259	18 Years and older   	\N	Adult	\N
432	NCT02651402	8 Years to 99 Years   	Child	\N	\N
433	NCT02624765	16 Years to 50 Years   	Child	\N	\N
434	NCT02613650	18 Years and older   	\N	Adult	\N
435	NCT02606045	18 Years to 45 Years   	\N	Adult	\N
436	NCT02599480	18 Years to 90 Years   	\N	Adult	\N
437	NCT02587936	18 Years to 85 Years   	\N	Adult	\N
438	NCT02458846	3 Years to 8 Years   	Child	\N	\N
439	NCT02428205	3 Years to 8 Years   	Child	\N	\N
440	NCT02340650	18 Years to 100 Years   	\N	Adult	\N
441	NCT02278198	21 Years and older   	\N	Adult	\N
442	NCT02259621	18 Years and older   	\N	Adult	\N
443	NCT02046694	up to 30 Years   	Child	\N	\N
444	NCT01964859	18 Years to 65 Years   	\N	Adult	\N
445	NCT01247090	18 Years and older   	\N	Adult	\N
446	NCT01042015	18 Years to 65 Years   	\N	Adult	\N
447	NCT00870064	3 Years to 14 Years   	Child	\N	\N
448	NCT03799094	18 Years to 75 Years   	\N	Adult	\N
449	NCT03607630	18 Years and older   	\N	Adult	\N
450	NCT03423342	18 Years and older   	\N	Adult	\N
451	NCT03360929	18 Years and older   	\N	Adult	\N
452	NCT03292731	18 Years to 45 Years   	\N	Adult	\N
453	NCT03275870	18 Years and older   	\N	Adult	\N
454	NCT03104426	up to 2 Years   	Child	\N	\N
455	NCT03753802	3 Months to 12 Months   	Child	\N	\N
456	NCT03630549	10 Years and older   	Child	\N	\N
457	NCT03241732	18 Years to 80 Years   	\N	Adult	\N
458	NCT03032601	30 Years to 80 Years   	\N	Adult	\N
459	NCT03466528	18 Years to 100 Years   	\N	Adult	\N
460	NCT03463252	up to 40 Years   	Child	\N	\N
461	NCT03829956	18 Years and older   	\N	Adult	\N
462	NCT03827616	18 Years to 100 Years   	\N	Adult	\N
463	NCT03808207		Child	\N	\N
464	NCT03795740	up to 85 Years   	Child	\N	\N
465	NCT03787615	18 Years and older   	\N	Adult	\N
466	NCT03781596	6 Years to 60 Years   	Child	\N	\N
467	NCT03771534	18 Years and older   	\N	Adult	\N
468	NCT03770455	18 Years and older   	\N	Adult	\N
469	NCT03766503	18 Years and older   	\N	Adult	\N
470	NCT03762239	13 Years to 16 Years   	Child	\N	\N
471	NCT03761264	3 Years to 11 Years   	Child	\N	\N
472	NCT03757572	18 Years to 80 Years   	\N	Adult	\N
473	NCT03754322		Child	\N	\N
474	NCT03744780	18 Years and older   	\N	Adult	\N
475	NCT03737370	18 Years and older   	\N	Adult	\N
476	NCT03735537	18 Years and older   	\N	Adult	\N
477	NCT03714282	18 Years and older   	\N	Adult	\N
478	NCT03704116	19 Years to 55 Years   	\N	Adult	\N
479	NCT03702465	18 Years and older   	\N	Adult	\N
480	NCT03701113	50 Years to 70 Years   	\N	Adult	\N
481	NCT03699397	18 Years and older   	\N	Adult	\N
482	NCT03698591	18 Years to 39 Years   	\N	Adult	\N
483	NCT03694496	11 Years to 13 Years   	Child	\N	\N
484	NCT03692715	18 Years and older   	\N	Adult	\N
485	NCT03685461	1 Year and older   	Child	\N	\N
486	NCT03680248	18 Years to 65 Years   	\N	Adult	\N
487	NCT03678506	18 Years to 75 Years   	\N	Adult	\N
488	NCT03675165	18 Years and older   	\N	Adult	\N
489	NCT03661385		Child	\N	\N
490	NCT03654131	18 Years and older   	\N	Adult	\N
491	NCT03644381	6 Years to 20 Years   	Child	\N	\N
492	NCT03637413		Child	\N	\N
493	NCT03636724	18 Years to 75 Years   	\N	Adult	\N
494	NCT03633682	18 Years and older   	\N	Adult	\N
495	NCT03632447	18 Years to 89 Years   	\N	Adult	\N
496	NCT03631979	22 Weeks to 26 Weeks   	Child	\N	\N
497	NCT03631030	21 Years and older   	\N	Adult	\N
498	NCT03629145	up to 2 Years   	Child	\N	\N
499	NCT03625011	3 Years to 18 Years   	Child	\N	\N
500	NCT03607461	45 Years to 64 Years   	\N	Adult	\N
501	NCT03603015	18 Years and older   	\N	Adult	\N
502	NCT03594474		Child	\N	\N
503	NCT03589378	18 Years to 75 Years   	\N	Adult	\N
504	NCT03586219	18 Years to 99 Years   	\N	Adult	\N
505	NCT03570424	18 Years to 35 Years   	\N	Adult	\N
506	NCT03563690	40 Years to 75 Years   	\N	Adult	\N
507	NCT03560063	18 Years to 85 Years   	\N	Adult	\N
508	NCT03553862	21 Years and older   	\N	Adult	\N
509	NCT03550495	18 Years and older   	\N	Adult	\N
510	NCT03538860	18 Years and older   	\N	Adult	\N
511	NCT03536858	18 Years and older   	\N	Adult	\N
512	NCT03526458	18 Years and older   	\N	Adult	\N
513	NCT03516396	1 Month to 12 Years   	Child	\N	\N
514	NCT03502005	18 Years and older   	\N	Adult	\N
515	NCT03494231	18 Years and older   	\N	Adult	\N
516	NCT03493126	18 Years and older   	\N	Adult	\N
517	NCT03489850	21 Years to 45 Years   	\N	Adult	\N
518	NCT03488602	12 Years to 18 Years   	Child	\N	\N
519	NCT03483740	40 Years and older   	\N	Adult	\N
520	NCT03478501	18 Years to 89 Years   	\N	Adult	\N
521	NCT03474978	up to 4 Months   	Child	\N	\N
522	NCT03474666	18 Years and older   	\N	Adult	\N
523	NCT03474432	18 Years and older   	\N	Adult	\N
524	NCT03471637	18 Years and older   	\N	Adult	\N
525	NCT03467724	20 Years to 75 Years   	\N	Adult	\N
526	NCT03464851	18 Years and older   	\N	Adult	\N
527	NCT03462979	6 Years to 18 Years   	Child	\N	\N
528	NCT03462459	18 Years and older   	\N	Adult	\N
529	NCT03461016	18 Years and older   	\N	Adult	\N
530	NCT03461003	10 Years to 22 Years   	Child	\N	\N
531	NCT03455985	25 Years to 75 Years   	\N	Adult	\N
532	NCT03453398	18 Years to 70 Years   	\N	Adult	\N
533	NCT03453359	18 Years and older   	\N	Adult	\N
534	NCT03442114	1 Month to 5 Years   	Child	\N	\N
535	NCT03440645	18 Years to 70 Years   	\N	Adult	\N
536	NCT03431467	18 Years to 65 Years   	\N	Adult	\N
537	NCT03429439	18 Years to 65 Years   	\N	Adult	\N
538	NCT03422848	20 Years to 75 Years   	\N	Adult	\N
539	NCT03418649	18 Years to 65 Years   	\N	Adult	\N
540	NCT03413332	18 Years and older   	\N	Adult	\N
541	NCT03406767	50 Years to 100 Years   	\N	Adult	\N
542	NCT03405493	18 Years to 65 Years   	\N	Adult	\N
543	NCT03395301	20 Years to 45 Years   	\N	Adult	\N
544	NCT03387618	18 Years and older   	\N	Adult	\N
545	NCT03382106	25 Years to 65 Years   	\N	Adult	\N
546	NCT03380169	18 Years and older   	\N	Adult	\N
547	NCT03377946	18 Years to 60 Years   	\N	Adult	\N
548	NCT03377088	18 Years to 110 Years   	\N	Adult	\N
549	NCT03373734	18 Years to 55 Years   	\N	Adult	\N
550	NCT03372707	18 Years and older   	\N	Adult	\N
551	NCT03366805	18 Years and older   	\N	Adult	\N
552	NCT03360279	20 Years to 90 Years   	\N	Adult	\N
553	NCT03359447	3 Months to 3 Months   	Child	\N	\N
554	NCT03354572	18 Years and older   	\N	Adult	\N
555	NCT03348605	18 Years and older   	\N	Adult	\N
556	NCT03345615	18 Years and older   	\N	Adult	\N
557	NCT03340818	18 Years to 55 Years   	\N	Adult	\N
558	NCT03340051	18 Years to 65 Years   	\N	Adult	\N
559	NCT03337217	18 Years to 90 Years   	\N	Adult	\N
560	NCT03331965	18 Years and older   	\N	Adult	\N
561	NCT03330509	21 Years to 110 Years   	\N	Adult	\N
562	NCT03327844	6 Years to 16 Years   	Child	\N	\N
563	NCT03324659	18 Years to 60 Years   	\N	Adult	\N
564	NCT03324516	18 Years and older   	\N	Adult	\N
565	NCT03324009	25 Years and older   	\N	Adult	\N
566	NCT03307070	18 Years to 50 Years   	\N	Adult	\N
567	NCT03303053	18 Years and older   	\N	Adult	\N
568	NCT03302572	18 Years and older   	\N	Adult	\N
569	NCT03301831	18 Years and older   	\N	Adult	\N
570	NCT03298997	18 Years to 80 Years   	\N	Adult	\N
571	NCT03297151	18 Years to 35 Years   	\N	Adult	\N
572	NCT03275896	21 Years to 85 Years   	\N	Adult	\N
573	NCT03274518	18 Years to 65 Years   	\N	Adult	\N
574	NCT03273699	18 Years to 60 Years   	\N	Adult	\N
575	NCT03256461	18 Years and older   	\N	Adult	\N
576	NCT03245853	14 Years to 40 Years   	Child	\N	\N
577	NCT03239808	18 Years and older   	\N	Adult	\N
578	NCT03238768	up to 30 Weeks   	Child	\N	\N
579	NCT03235739	18 Years and older   	\N	Adult	\N
580	NCT03234569	18 Years to 50 Years   	\N	Adult	\N
581	NCT03230890	18 Years and older   	\N	Adult	\N
582	NCT03230656	18 Years to 65 Years   	\N	Adult	\N
583	NCT03227614		Child	\N	\N
584	NCT03196349	18 Years and older   	\N	Adult	\N
585	NCT03192020	18 Years to 80 Years   	\N	Adult	\N
586	NCT03036592	18 Years to 65 Years   	\N	Adult	\N
587	NCT02948023	18 Years to 60 Years   	\N	Adult	\N
588	NCT02814123	18 Years and older   	\N	Adult	\N
589	NCT02724163	up to 17 Years   	Child	\N	\N
590	NCT02479100	18 Years to 85 Years   	\N	Adult	\N
591	NCT03799237	18 Years and older   	\N	Adult	\N
592	NCT03759795	21 Years to 75 Years   	\N	Adult	\N
593	NCT03750409	50 Years to 85 Years   	\N	Adult	\N
594	NCT03736031	18 Years to 100 Years   	\N	Adult	\N
595	NCT03726437	18 Years to 20 Years   	\N	Adult	\N
596	NCT03706014	5 Years and older   	Child	\N	\N
597	NCT03695679	18 Years and older   	\N	Adult	\N
598	NCT03669432	18 Years to 70 Years   	\N	Adult	\N
599	NCT03658941	18 Years to 75 Years   	\N	Adult	\N
600	NCT03657212	60 Years to 75 Years   	\N	Adult	\N
601	NCT03648086	18 Years to 65 Years   	\N	Adult	\N
602	NCT03647449	18 Years to 35 Years   	\N	Adult	\N
603	NCT03635775	7 Years to 21 Years   	Child	\N	\N
604	NCT02029937	18 Years and older   	\N	Adult	\N
605	NCT03593356	18 Years and older   	\N	Adult	\N
606	NCT03588806	21 Years to 65 Years   	\N	Adult	\N
607	NCT03588572	18 Years to 75 Years   	\N	Adult	\N
608	NCT03574376	18 Years and older   	\N	Adult	\N
609	NCT03551860	18 Years and older   	\N	Adult	\N
610	NCT03532360	6 Years to 18 Years   	Child	\N	\N
611	NCT03526484	18 Years and older   	\N	Adult	\N
612	NCT03523000	30 Years and older   	\N	Adult	\N
613	NCT03522974	30 Years to 65 Years   	\N	Adult	\N
614	NCT03522337	2 Years to 6 Years   	Child	\N	\N
615	NCT03518255	18 Years and older   	\N	Adult	\N
616	NCT03517852	18 Years and older   	\N	Adult	\N
617	NCT03511443	5 Years and older   	Child	\N	\N
618	NCT03505658	6 Years to 18 Years   	Child	\N	\N
619	NCT03500172	18 Years and older   	\N	Adult	\N
620	NCT03481296	50 Years to 75 Years   	\N	Adult	\N
621	NCT03454308	21 Years to 59 Years   	\N	Adult	\N
622	NCT03437876	18 Years to 50 Years   	\N	Adult	\N
623	NCT03435588	18 Years and older   	\N	Adult	\N
624	NCT03426683	18 Years to 65 Years   	\N	Adult	\N
625	NCT03422159	18 Years and older   	\N	Adult	\N
626	NCT03420846	18 Years and older   	\N	Adult	\N
627	NCT03383731	18 Years to 75 Years   	\N	Adult	\N
628	NCT03376685	45 Years to 70 Years   	\N	Adult	\N
629	NCT03376100	18 Years and older   	\N	Adult	\N
630	NCT03365609	6 Years to 18 Years   	Child	\N	\N
631	NCT03360968	18 Years to 80 Years   	\N	Adult	\N
632	NCT03343431	18 Years and older   	\N	Adult	\N
633	NCT03340103	24 Weeks to 32 Weeks   	Child	\N	\N
634	NCT03338374	18 Years and older   	\N	Adult	\N
635	NCT03337971	50 Years to 70 Years   	\N	Adult	\N
636	NCT03336372	18 Years and older   	\N	Adult	\N
637	NCT03326934	18 Years to 65 Years   	\N	Adult	\N
638	NCT03306173	18 Years to 65 Years   	\N	Adult	\N
639	NCT03287635	18 Years and older   	\N	Adult	\N
640	NCT03265574	18 Years and older   	\N	Adult	\N
641	NCT01785719	18 Years to 38 Years   	\N	Adult	\N
642	NCT03232554	18 Years to 50 Years   	\N	Adult	\N
643	NCT01739933	18 Years and older   	\N	Adult	\N
644	NCT03085784	18 Years and older   	\N	Adult	\N
645	NCT03083366	18 Years to 100 Years   	\N	Adult	\N
646	NCT03009539	12 Years to 16 Years   	Child	\N	\N
647	NCT02744768	18 Years and older   	\N	Adult	\N
648	NCT01447628	16 Years to 75 Years   	Child	\N	\N
649	NCT02188121	18 Years to 89 Years   	\N	Adult	\N
650	NCT03740243	18 Years and older   	\N	Adult	\N
651	NCT03629496	18 Years and older   	\N	Adult	\N
652	NCT03622437	18 Years and older   	\N	Adult	\N
653	NCT03616639	18 Years and older   	\N	Adult	\N
654	NCT03564080		Child	\N	\N
655	NCT03544853	18 Years to 64 Years   	\N	Adult	\N
656	NCT03543774	18 Years and older   	\N	Adult	\N
657	NCT03519568	6 Months to 12 Months   	Child	\N	\N
658	NCT03519087	18 Years and older   	\N	Adult	\N
659	NCT03440099	65 Years to 75 Years   	\N	\N	Older Adult
660	NCT03437811	18 Years to 55 Years   	\N	Adult	\N
661	NCT03423095	60 Years to 89 Years   	\N	Adult	\N
662	NCT03406039	18 Years to 35 Years   	\N	Adult	\N
663	NCT03397277	18 Years to 60 Years   	\N	Adult	\N
664	NCT03375580	18 Years to 75 Years   	\N	Adult	\N
665	NCT03373240	18 Years to 50 Years   	\N	Adult	\N
666	NCT03369145	18 Years to 40 Years   	\N	Adult	\N
667	NCT03337581	3 Years to 9 Years   	Child	\N	\N
668	NCT03335722	18 Years to 45 Years   	\N	Adult	\N
669	NCT03333473	15 Years to 49 Years   	Child	\N	\N
670	NCT03331978	18 Years and older   	\N	Adult	\N
671	NCT03255707	4 Years to 30 Years   	Child	\N	\N
672	NCT03208530	65 Years and older   	\N	\N	Older Adult
673	NCT02781064	16 Years and older   	Child	\N	\N
674	NCT03664934	18 Years to 63 Years   	\N	Adult	\N
675	NCT03584490	18 Years and older   	\N	Adult	\N
676	NCT03558828	18 Years to 70 Years   	\N	Adult	\N
677	NCT03556371	18 Years and older   	\N	Adult	\N
678	NCT03529981	18 Years to 58 Years   	\N	Adult	\N
679	NCT03422562	23 Weeks to 29 Weeks   	Child	\N	\N
680	NCT03394495	70 Years and older   	\N	\N	Older Adult
681	NCT03304444	18 Years to 99 Years   	\N	Adult	\N
682	NCT03686748	10 Years to 17 Years   	Child	\N	\N
683	NCT02018367	18 Years and older   	\N	Adult	\N
684	NCT03538418	65 Years and older   	\N	\N	Older Adult
685	NCT03397160	18 Years and older   	\N	Adult	\N
686	NCT03388970	18 Years to 65 Years   	\N	Adult	\N
687	NCT03376854	18 Years to 80 Years   	\N	Adult	\N
688	NCT03234543	18 Years and older   	\N	Adult	\N
689	NCT03230942	55 Years to 90 Years   	\N	Adult	\N
690	NCT02982772	18 Years and older   	\N	Adult	\N
691	NCT02529644	18 Years to 64 Years   	\N	Adult	\N
692	NCT03326596	18 Years to 54 Years   	\N	Adult	\N
693	NCT03543644	18 Years to 75 Years   	\N	Adult	\N
694	NCT03507400	18 Years and older   	\N	Adult	\N
695	NCT03286153	12 Years and older   	Child	\N	\N
\.


--
-- Data for Name: condition; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.condition (cond_id, cond_detail) FROM stdin;
1	Kidney Pancreas Transplantation
2	Non-small Cell Lung Cancer
3	EGFR Gene Mutation
4	Brain Metastases
5	Prematurity; Extreme
6	Low Birthweight, Extremely (999 Grams or Less)
7	Cognitive Dysfunction
8	Bladder Cancer
9	Metastatic Bladder Cancer
10	Invasive Bladder Cancer
11	Chemotherapy
12	Small Intestinal Bacterial Overgrowth
13	Urinary Tract Infections
14	Postinflammatory Hyperpigmentation
15	Breast Cancer
16	PreDiabetes
17	Overweight and Obesity
18	Head and Neck Squamous Cell Carcinoma
19	Pre-Eclampsia; Mild
20	HIV-1-infection
21	Acute Liver Failure
22	Hematologic Malignancies
23	Hypoxic-Ischemic Encephalopathy
24	Neonatal Encephalopathy
25	Kidney Failure
26	Renal Insufficiency, Chronic
27	Dialysis Related Complication
28	Crohn's Disease
29	Posttraumatic Stress Disorder (PTSD)
30	Avoidant Personality Disorder
31	Dependent Personality Disorder
32	Obsessive Compulsive Personality Disorder
33	Borderline Personality Disorder (BPD)
34	Essential Tremor
35	HIV Prevention
36	Parkinson Disease
37	Distress
38	PTSD
39	Anxiety
40	Depression
41	Trauma
42	Functional Disabilities
43	Common Mental Health Problems
44	Pancreatic Cancer
45	Pancreatic Neoplasms
46	Literacy
47	Child Development
48	Parenting
49	Atrial Fibrillation
50	Defibrillators
51	Persistent Atrial Fibrillation
52	Acute Myeloid Leukaemia Recurrent
53	Insomnia
54	Preterm Birth
55	Twin Pregnancy With Antenatal Problem
56	Twin to Twin Transfusion Syndrome
57	Colorectal Cancer
58	Oxidative Stress
59	Morbid Obesity
60	Anesthesia
61	In-vitro Fertilization
62	Analgesia
63	Erectile Dysfunction
64	Barrett's Esophagus
65	Trachoma
66	Alcohol Use Disorder
67	Treatments of Striae Distensae
68	Exercise Therapy
69	Food Allergy
70	Patella Dislocation
71	Patella Dislocation Recurrent
72	Frail Elderly Syndrome
73	Transitional Care
74	Frailty
75	Readmission
76	Aging
77	Elderly
78	Venous Leg Ulcer
79	Vestibular Schwannoma
80	Meniere Disease
81	Patient Satisfaction
82	Infertility
83	Cervical Radiculopathy
84	Cervical Disc Disease
85	Leadership
86	Physical Activity
87	Postoperative Pain
88	Myalgia
89	Headache
90	Plasmodium Falciparum Malaria
91	Protective Qi Insufficiency (a Condition Term From TCM)
92	Peutz-Jeghers Syndrome
93	Diabetes Mellitus, Type 2
94	Amputation
95	Amputation; Postoperative, Sequelae
96	Wound Dehiscence
97	Seroma
98	Wound Infection, Surgical
99	Lymph Leakage
100	Anterior Knee Pain Syndrome
101	Patellofemoral Pain Syndrome
102	Gonarthrosis; Primary
103	Degenerative Joint Disease of Knee
104	Sphincter (Anal); Perineal Rupture, Obstetric
105	Perineal Tear
106	Pelvic Floor Disorders
107	Experience, Life
108	Second Stage of Labor
109	Methods of Exercise in Children
110	Blue Rubber Bleb Nevus Syndrome
111	Venous Malformation
112	Post Traumatic Stress Disorder
113	Head and Neck Neoplasms
114	Dental Prosthesis
115	Dentures
116	Quality of Life
117	Prostate Cancer
118	Peer Review, Publishing
119	Completeness of Reporting
120	Chronic Obstructive Pulmonary Disease
121	Preterm Infant
122	Term Infant
123	Transition
124	Attention Deficit Hyperactivity Disorder
125	Difficult IV Access
126	Hematologic Neoplasms
127	Cataract
128	Embolization
129	Hemorrhoids
130	Lumbar Intervertebral Motion
131	Obstructive Sleep Apnea
132	Esophageal Atresia
133	Tracheoesophageal Fistula
134	Rectal Cancer
135	Stroke
136	Salivary Gland Cancer
137	Obesity
138	Metabolic Syndrome
139	Freezing of Gait
140	Atrial Fibrillation Paroxysmal
141	HIV
142	Cone Beam Computed Tomography
143	Asthma in Children
144	Edentulous Alveolar Ridge
145	Tinnitus
146	Noise Induced Tinnitus
147	Tinnitus, Subjective
148	Tinnitus, Objective
149	Tinnitus Aggravated
150	Tinnitus, Pulsatile
151	Tinnitus, Spontaneous Oto-Acoustic Emission
152	Tinnitus, Clicking
153	Tinnitus, Tensor Tympani Induced
154	Opaque Bottles
155	Conventional, Clear Bottles
156	Intubation
157	Laryngoscopy
158	Sinusitis, Chronic
159	Asthma
160	Nasal Polyps
161	Aspirin Sensitivity
162	Breastfeeding
163	Bottle Feeding
164	Kidney Transplant; Complications
165	Weight Gain
166	Health Behavior
167	Disruptive Behavior
168	Aggression Childhood
169	Anger
170	Non-Compliance, Patient
171	Irritable Mood
172	Cognitive Change
173	Mood Change
174	Advanced Cancer
175	Solid Tumor
176	Stress, Psychological
177	Mood
178	Polypharmacy
179	Inappropriate Prescribing
180	Aged
181	Primary Health Care
182	Quality Improvement
183	Electronic Health Records
184	Spinal Anaesthesia
185	Electroencephalography
186	Electrocardiography
187	Respiratory Rate
188	Surveys and Questionnaires
189	Sexual Pain Disorders
190	Postmenopausal Symptoms
191	Vulvovaginal Atrophy
192	Female Sexual Dysfunction
193	Dyspareunia
194	Vulvodynia
195	Vestibulodynia
196	Arousal Disorders, Sexual
197	Sentinel Lymph Node Biopsy
198	Celiac Disease
199	Irritable Bowel Syndrome
200	Diet Modification
201	Gluten Sensitivity
202	Pollution; Exposure
203	Autism Spectrum Disorder
204	Sleep Disturbance
205	Fast Track Recovery Surgery
206	Pain, Postoperative
207	Women's Health
208	Mental Health
209	Menopause
210	Sick Leave
211	Hormone-refractory Prostate Cancer
212	Patent Ductus Arteriosus
213	Hip Osteoarthritis
214	Knee Osteoarthritis
215	Rotator Cuff Tear
216	Overweight
217	Acute Myocardial Infarction
218	Non-ST Elevation Myocardial Infarction
219	ST Elevation Myocardial Infarction
220	Epilepsy Intractable
221	Withdrawal Syndrome
222	Cancer-related Problem/Condition
223	Stress, Emotional
224	Pancreatitis, Acute
225	Post-Cardiac Arrest Syndrome
226	Cardiogenic Shock
227	Cardiac Arrest
228	Resuscitation
229	Inflammation
230	Multi-Organ Disorder
231	Candida Infection
232	Premature Infant
233	Innate Immune Cells
234	Bile Duct Obstruction
235	Spinal Fusion
236	Urinary Urgency
237	Urinary Incontinence
238	Nocturia
239	Urinary Frequency/Urgency
240	Lower Urinary Tract Symptoms
241	Urinary Hesitancy
242	Urinary Straining
243	Hypotension
244	Facial Palsy
245	Coronary Heart Disease
246	Chlamydophila Pneumoniae Infections
247	Early-stage Breast Cancer
248	Breast Cancer Female
249	Survivorship
250	Cancer Survivors
251	Exanimation
252	Cognitive Decline
253	Colorectal Neoplasms
254	Gastrointestinal Cancer
255	Gastrointestinal Neoplasms
256	Diverticulosis, Colonic
257	Gastrointestinal Disease
258	Hypotension, Orthostatic
259	Spinal Cord Injuries
260	Aphasia
261	Program Sustainability
262	Tobacco Use
263	Depressive Symptoms
264	Physical Capacity
265	Leg Strength
266	Eating Behavior
267	Life of Quality
268	Pain Management
269	Appetitive Behavior
270	Individual Difference
271	Food Sensitivity
272	Food Preferences
273	Safety Issues
274	Acute Kidney Injury
275	Septic Shock
276	Resuscitations
277	Menstrual Disorders
278	Polycystic Ovary Syndrome
279	Hypertension
280	Salivary Gland Dysfunction
281	Xerostomia
282	Head and Neck Cancer
283	HIV Infections
284	Anxiety Disorders Generalized
285	Birth Asphyxia
286	Neonatal Death
287	Dementia
288	Immunological Abnormality
289	Anesthesia, General
290	Infant
291	Perforator Flap Surgery
292	Anemia, Iron-Deficiency
293	Hot Flashes
294	Chronic Venous Insufficiency
295	Prostate Adenocarcinoma
296	Human Immunodeficiency Virus
297	Opioid-use Disorder
298	COPD
299	Fasting
300	Cardiac Catheterization
301	Male Infertility
302	Weight Loss
303	Type 2 Diabetes Mellitus
304	Knee Dislocations
305	Multiple Ligament Knee Injuries
306	Memory Disorders
307	Word Finding Difficulty
308	Congenital Heart Disease
309	Calorimetry, Indirect
310	Critical Care
311	Muscular Atrophy
312	Gastrointestinal Bleeding
313	Cervical Cancer
314	Behavior
315	Trauma Injury
316	Hemorrhage
317	Scoliosis
318	Adenocarcinoma of the Prostate
319	Stent
320	Sinusitis, Frontal
321	Ankle Sprains
322	Ultraviolet Rays
323	Atherosclerosis
324	Lupus Nephritis
325	Dysphagia
326	Spina Bifida
327	Cerebral Palsy
328	Invasive Ductal Carcinoma, Breast
329	Opioid-Related Disorders
330	Dependency (Psychology)
331	Pain, Chronic
332	Opiate Withdrawal Syndrome
333	Melatonin
334	Pharmacokinetics
335	Safety
336	PET/CT Imaging
337	Functional Abdominal Pain Syndrome
338	Smoking Cessation
339	Burnout, Professional
340	Neuralgia
341	Chronic Pain
342	Cardiovascular Diseases
343	Cardiovascular Risk Factor
344	Psychological Stress
345	Anxiety State
346	Motivation
347	Overactive Bladder
348	Bipolar Disorder
349	Benign Prostatic Hyperplasia
350	Bladder Outlet Obstruction
351	Pain, Acute
352	Catheterization, Peripheral
353	Attachment Disorder
354	Exposure to Violent Event
355	Periodontal Diseases
356	Penile Diseases
357	Uterine Fibroids
358	Peripheral Artery Disease
359	Peripheral Arterial Disease
360	Arterial Occlusive Diseases
361	Vascular Diseases
362	Peripheral Vascular Diseases
363	Rheumatoid Arthritis
364	Arthritis, Rheumatoid
365	Fatigue
366	Spinal Stenosis
367	Spinal Stenosis Lumbar
368	Degeneration Lumbar Spine
369	Degeneration Spine
370	Neurogenic Claudication Co-Occurrent and Due to Spinal Stenosis of Lumbar Region
371	Pseudoclaudication Syndrome
372	Pediatric Cancer
373	Symptom Screening
374	Neuropathy, Diabetic
375	Renal Cell Carcinoma
376	Metastatic Renal Cell Carcinoma
377	Non-metastatic Renal Cell Carcinoma
378	Perception of Imaging
379	Radiation Dermatitis
380	Lymphedema of Upper Arm
381	E-cigarette Use
382	ACL Injury
383	PET Imaging
384	MRI Imaging
385	Surgery
386	Alveolar Ridge Preservation
387	Tooth Extraction
388	Portable Ultrasound
389	Anesthesia; Functional
390	ART Adherence
391	PMTCT
392	Linkage to Care
393	PrEP
394	Grief
395	Trauma, Psychological
396	Postural Tachycardia Syndrome
397	Actinic Keratoses
398	Precancerous Skin Lesion
399	Childhood Obesity
400	Blood Pressure
401	Autonomic Nervous System Imbalance
402	Obstetric Complication
403	Postpartum Hemorrhage
404	Postpartum Endometritis
405	Hiv
406	Multiple Sclerosis
407	Healthy
408	Athletic Injuries
409	Ankylosing Spondylitis
410	Axial Spondyloarthritis
411	Lifestyle
412	Diet
413	Transcutaneous Electric Nerve Stimulation
414	Oocyte Retrieval
415	Migraine With Aura
416	Migraine Without Aura
417	Allodynia
418	Chronic Kidney Diseases
419	Liver Cirrhosis
420	Hypertension, Portal
421	Enterostomy
422	Surgical Wound Infection
423	Pain
424	Neuropathic Pain
425	Irritability
426	Bone Demineralization
427	Hypoestrogenism
428	Subclinical Kidney Injury
429	Bone Microarchitecture
430	Visceral Hypersensitivity
431	ACL - Anterior Cruciate Ligament Rupture
432	ACL
433	Acute Respiratory Infection
434	Lung Cancer
435	Esophageal Cancer
436	Miscellaneous Neoplasm
437	Healthcare Facility Environment - Imaging
438	Disability Physical
439	Intrauterine Insemination
440	Melanoma, Malignant
441	Sepsis
442	Psoriasis
443	Preeclampsia Severe
444	Preeclampsia Postpartum
445	Visceral Obesity
446	Family Size
447	Febrile Neutropenia
448	Postpartum Period
449	Contraception Behavior
450	Health Education
451	Community Health Services
452	Health Services for Persons With Disabilities
453	Developmental Disabilities
454	Antibody-mediated Rejection
455	Drug Resistant Epilepsy
456	Drop Seizures
457	Generalized Tonic Clonic Seizure
458	Complex Partial Seizure
459	Fall Due to Seizure
460	Seizure Disorder
461	Seizure Disorder, Post Traumatic
462	Traumatic Brain Injury
463	Non-Epileptic Seizure
464	Conversion Disorder
465	Magnetic Resonance Imaging
466	Clear Cell Renal Cell Carcinoma
467	Thermal Burn
468	Chronic Pancreatitis
469	Skin Diseases
470	Keloid
471	Scar
472	Fibrosis
473	Hypertrophic Skin
474	Hip Fracture Surgery
475	Nursing
476	Liver Metastasis
477	Colon Cancer
478	Chest Pain
479	Posttraumatic Stress Disorder
480	Head and Neck Basaloid Carcinoma
481	Recurrent Head and Neck Squamous Cell Carcinoma
482	Recurrent Oropharyngeal Squamous Cell Carcinoma
483	Squamous Cell Carcinoma of Unknown Primary Origin
484	Stage IV Squamous Cell Carcinoma of the Lip and Oral Cavity
485	Stage IV Squamous Cell Carcinoma of the Paranasal Sinus and Nasal Cavity
486	Stage IV Nasopharyngeal Keratinizing Squamous Cell Carcinoma
487	Stage IV Oropharyngeal Squamous Cell Carcinoma
488	Stage IVA Lip and Oral Cavity Squamous Cell Carcinoma
489	Stage IVA Nasal Cavity and Paranasal Sinus Squamous Cell Carcinoma
490	Stage IVA Nasopharyngeal Keratinizing Squamous Cell Carcinoma
491	Stage IVA Oropharyngeal Squamous Cell Carcinoma
492	Stage IVB Lip and Oral Cavity Squamous Cell Carcinoma
493	Stage IVB Nasal Cavity and Paranasal Sinus Squamous Cell Carcinoma
494	Stage IVB Nasopharyngeal Keratinizing Squamous Cell Carcinoma
495	Stage IVB Oropharyngeal Squamous Cell Carcinoma
496	Stage IVC Lip and Oral Cavity Squamous Cell Carcinoma
497	Stage IVC Nasal Cavity and Paranasal Sinus Squamous Cell Carcinoma
498	Stage IVC Nasopharyngeal Keratinizing Squamous Cell Carcinoma
499	Stage IVC Oropharyngeal Squamous Cell Carcinoma
500	Oropharyngeal Cancer
501	HNSCC
502	Stage IV Lip and Oral Cavity Squamous Cell Carcinoma
503	Gestational Diabetes
504	Migraine Disorders
505	Headache Disorders
506	Premature Birth of Newborn
507	Diabetes Mellitus
508	Physical Exercise
509	Light Intensity Physical Activity
510	Arterial Stiffness
511	Aortic Stiffness
512	Pulse Wave Velocity
513	Type2 Diabetes
514	Sedentary Lifestyle
515	Artery Disease
516	Post MI
517	Obesity (Disorder)
518	Lung Injury
519	Medication Adherence
520	Medication Non Adherence
521	Healthy Aging
522	Peritoneal Dialysis Catheter Exit Site Infection
523	Metabolic Complication
524	Malaria
525	Seizures
526	Coma
527	Parasitemia
528	Hyperpyrexia
529	Prostatic Neoplasm
530	Oxygen Inhalation Therapy
531	Geriatrics
532	Chronic Total Occlusion of Coronary Artery
533	Heart Failure
534	Angina Pectoris
535	Assisted Reproductive Technology
536	Antibiotic Prophylaxis
537	Embryo Transfer
538	Malnutrition
539	Anxiety Disorders
540	Tobacco Dependence
541	Smoking, Cigarette
542	Smoking, Tobacco
543	Sleep
544	Neurodevelopmental Disorders
545	Distal Radius Fracture
546	Fall Patients
547	Feeding; Difficult, Newborn
548	Language Delay
549	Language Development Disorders
550	Ptosis
551	Blepharoptosis
552	Myofascial Pain
553	Trigger Points
554	Cardiopulmonary Bypass
555	Epilepsy
556	Leiomyoma
557	Venous Thrombosis (Disorder)
558	Sexual Dysfunctions, Psychological
559	Sexual Dysfunction, Physiological
560	Sexual Dysfunction Male
561	Relationships, Marital
562	Prostatic Neoplasms
563	Barretts Esophagus With Dysplasia
564	Chronic Disease
565	Multimorbidity
566	Restrictive Chronic Lung Allograft Dysfunction
567	Lung Transplant Rejection
568	Persistent Post-Concussive Syndrome
569	Substance Use Disorders
570	Sleep Apnea, Obstructive
571	Pre-Eclampsia
572	Hypertension, Pregnancy-Induced
573	Atrial Fibrillation - Symptomatic
574	Bronchiolitis
575	Type 1 Diabetes Mellitus
576	Renal Transplant Donor of Left Kidney
577	Renal Transplant Donor of Right Kidney
578	Melanoma
579	Refractory Angina
580	Chronic Stable Angina
581	Scarring Alopecia
582	Frontal Fibrosing Alopecia
583	Lichen Planopilaris
584	Central Centrifugal Cicatricial Alopecia
585	Central Centrifugal Scarring Alopecia
586	Cognitive Impairment
587	Physical Dependence
588	Sexually Transmitted Diseases
589	Reproductive Behavior
590	Stage II Grade 1 Follicular Lymphoma
591	Stage II Grade 2 Follicular Lymphoma
592	Stage I Follicular Lymphoma Grade 1
593	Stage II Follicular Lymphoma Grade 2
594	Ventricular Premature Complexes
595	Catheter Ablation
596	Low Back Pain
597	Male Subfertility
598	Gambling Disorder
599	Cardiovascular Disease Other
600	Post-stroke Depression
601	Coronary Artery Disease
602	Critical Illness
603	Fluid Overload
604	Type2 Diabetes Mellitus
605	Cocaine Dependence
606	Chemical Addiction
607	Mental Disorder
608	Cocaine-Related Disorders
609	Drug Dependence
610	Infant,Premature
611	Hepatectomy
612	Cancer, Metastatic
613	Hemostasis
614	Insomnia, Primary
615	Rumination
616	Lung Cancer Stage I
617	Lung Cancer Stage II
618	Lung Cancer, Nonsmall Cell
619	Lung Cancer Recurrent
620	Lung Cancer Stage IV
621	Pregnancy Related
622	Abortion Early
623	Dry Eye Syndromes
624	Meibomian Gland Dysfunction
625	Pain Uterus
626	Opioid Use
627	Analgesics, Antipyretics, and Antirheumatics Causing Adverse Effects in Therapeutic Use
628	Visceral Pain
629	Melanoma and Other Malignant Neoplasms of Skin
630	Piezocorticision
631	Osteoperforation
632	Canine Retraction
633	Orthodontic Treatment
634	Non Small Cell Lung Cancer
635	Secondary Lung Cancer
636	Acute Cellular Graft Rejection
637	New Onset Diabetes After Transplant
638	Nursing Homes
639	Depression in Old Age
640	HSIL, High Grade Squamous Intraepithelial Lesions
641	Anal Cancer
642	HPV-Related Squamous Cell Carcinoma
643	Human Papilloma Virus
644	Human Papillomavirus Infection
645	Ain III
646	Tuberculosis
647	HIV/AIDS
648	Alcohol Abuse
649	Inflammatory Bowel Diseases
650	Crohn Disease
651	Ulcerative Colitis
652	Indeterminate Colitis
653	Chronic Kidney Disease
654	Thromboses, Deep Vein
655	Surgery--Complications
656	Congenital Heart Defect
657	Major Depressive Disorder
658	Chronic Atrial Fibrillation
659	Gonorrhea
660	Resistance Training
661	Chemotherapy Effect
662	Acute Ischemic Stroke
663	Hip Fractures
664	Obesity, Morbid
665	Sick-leave
666	Work Related Illnesses
667	Life Style
668	Ovarian Cancer
669	Primary Peritoneal Carcinoma
670	Fallopian Tube Cancer
671	CBT
672	Progressive Multiple Sclerosis
673	Clostridium Difficile Infection
674	ADHD
675	Positive-Pressure Respiration/Methods
676	Esophagus/Physiopathology
677	Pleura/Physiopathology
678	Gynecologic Surgical Procedures
679	Laparoscopy
680	Humans
681	Female
682	Stiffness, Aortic
683	Endothelial Dysfunction
684	Cholera
685	Lupus Erythematosus, Systemic
686	Psoriatic Arthritis
687	Sjogren's Syndrome
688	Acute Brain Injury
689	Intracerebral Hemorrhage
690	Cerebral Edema
691	Anoxic Brain Injury
692	Chronic Periodontitis
693	End Stage Renal Disease
694	Concussion, Brain
695	Congenital Heart Disease in Children
696	Inflammatory Response
697	Emergence Delirium
698	Substance Abuse
699	Risk Reduction
700	RIsky Sexual Behavior
701	End-stage Renal Disease
702	Parkinson's Disease
703	Trochanteric Fracture of Femur
704	Primary Open-angle Glaucoma
705	Lower Resp Tract Infection
706	Hemothorax
707	Hemopneumothorax; Traumatic
708	Empyema
709	Chest Tube Size
710	Pulmonary Embolism
711	Contrast-induced Nephropathy
712	Chordoma
713	Health Care Costs
714	Gastric Cancer
715	GastroEsophageal Cancer
716	Paraplegia, Complete
717	Feeding Tube
718	Labour; Induced
719	Pilot Study
720	Cervical Ripening
721	Hypothermia; Anesthesia
722	Venous Thromboembolism
723	Deep Vein Thrombosis
724	Trauma, Multiple
725	Teen Pregnancy Prevention
726	Post-traumatic Growth
727	Cesarean Section, Dystocia
728	AADC Deficiency
729	Thyroid Eye Disease
730	Endometrial Neoplasms
731	Fetal Atrial Flutter Without Hydrops
732	Fetal Supraventricular Tachycardia Without Hydrops
733	Fetal Supraventricular Tachycardia With Hydrops
734	Advanced KRAS Positive Metastatic Colorectal Cancer
735	Type 1 Von Willebrand Disease
736	Hypertrophy, Left Ventricular
737	Diabetes
738	High BP
739	Type 2 Diabetes
740	Amblyopia
741	Autism
742	Differentiated Thyroid Cancer
743	Non-Small Cell Lung Cancer
744	Acute Lymphoblastic Leukemia (ALL)
745	Wounds and Injuries
746	Cardiac Arrest From Trauma
747	Fractures, Open
748	Carcinoma, Non-Small-Cell Lung
749	Psychosis
750	Heart Failure, Systolic
751	Hidradenitis Suppurativa
752	Hidradenitis
753	Acne Inversa
754	Boils
755	Follicular Occlusion Triad
756	Follicular Occlusion Tetrad
757	Erythroblastosis, Fetal
758	Erythroblastosis Fetalis, Rh Disease
759	Erythroblastosis Fetalis Due to RH Antibodies
760	Erythroblastosis Fetalis Due to Isoimmunization
761	Acute Bronchiolitis
762	Chronic Traumatic Brain Injury
763	Alcohol Withdrawal
764	Lactic Acidosis
765	Vitamin B1 Deficiency
766	Magnesium Deficiency
767	Wernicke Encephalopathy
768	Endometrial Cancer
769	Atypical Endometrial Hyperplasia
770	Snoring
771	Genital Neoplasms
772	Human Milk
773	Diet Habit
774	Fatty Acid
775	Infant Growth
776	Chronic Thromboembolic Pulmonary Hypertension
777	Urolithiasis
778	Eosinophilic Esophagitis
779	TGA - Transposition of Great Arteries
780	Metastatic Castration-resistant Prostate Cancer
781	Attention Impaired
782	Risk-Taking
783	Risk Behavior
784	Social Preferences
785	Decision Making
786	Attention
787	Dentoalveolar Abscess
788	Pilonidal Cyst/Fistula
789	Pregnancy Malaria
790	Malaria in Pregnancy
791	Emotional Eating
792	Metastatic Castrate Resistant Prostate Cancer
793	Osteogenesis Imperfecta
794	Pre Diabetes
795	Bone and Bones
796	Osteoporosis Risk
797	Osteoporosis, Postmenopausal
798	Stroke, Ischemic
799	Emotion Regulation
800	Real Versus Sham Transcranial Magnetic Stimulation (TMS)
801	Caries, Dental
802	Ureteral Stones
803	Ureteral Calculi
804	Nephrolithiasis
805	Hearing Loss
806	Cochlear Implant
807	Hepatic Fat Content
808	Anticoagulants
809	Low Cardiac Output Syndrome
810	Transposition of Great Vessels
811	Colorectal Carcinoma
812	Liver Metastases
813	Cow Milk Allergy
814	Cardiac Rehabilitation
815	Fruit and Vegetable Intake
816	Stress Urinary Incontinence
817	Mixed Urinary Incontinence
818	Necrotizing Enterocolitis
819	Time to Full Enteral Nutrition
820	Arthritis;Lumbosacral
821	Osteo Arthritis Knee
822	Sacroiliitis
823	Arthritis, Degenerative
824	Respiratory Syncytial Virus Infections
825	Tonsillitis
826	Tonsillectomy
827	Total Knee Arthroplasty
828	Very Low Birth Weight Infant
829	Multiple Organ Dysfunction Syndrome
830	Pelvic Organ Prolapse
831	Muscle, Skeletal
832	High-Intensity Interval Training
833	Exercise
834	Osteoarthritis, Hip
835	Osteoarthritis
836	Arthritis
837	Musculoskeletal Diseases or Conditions
838	Delirium
839	Mood Disorder
840	Anxiety Disorder
841	Substance Use Disorder
842	Chronic Medical Condition
843	Living Donor Kidney Transplantation
844	Renal Dialysis
845	Stone Ureter
846	Stone;Renal
847	Solid Tumor, Adult
848	Vaginal Atrophy
849	Suicide
850	Suicide, Attempted
851	Suicidal Ideation
852	Mild Cognitive Impairment
853	Group, Peer
854	Emergencies
855	Liver Transplantation
856	Percutaneous Coronary Intervention
857	Optical Coherence Tomography
858	In-stent Coronary Artery Restenosis
859	Psychological Distress
860	Surgical Scar
861	Breast Augmentation
862	Abdominoplasty
863	Face Lift
864	Carotid Artery Stenosis
865	Gluten Enteropathy
866	Digestive System Disease
867	Intestinal Disease
868	Malabsorption Syndromes
869	Patient Compliance
870	Diagnostic Self Evaluation
871	Recurrent Clostridium Difficile Infection
872	Phobic Disorders
873	Dental Anxiety
874	Treatment Outcome
875	Pediatric Hypertension
876	Patient Discharge
877	Blood Glucose, Low
878	Blood Glucose, High
879	Shift Work Type Circadian Rhythm Sleep Disorder
880	Chronobiology Disorders
881	Mood Swing
882	Colonoscopy
883	Sickle Cell Anemia
884	Children, Only
885	Chronic Hepatitis b
886	Glucose, High Blood
887	Degenerative Intervertebral Discs
888	Sciatic Radiculopathy
889	Osteoarthritis, Knee
890	Depressive Disorder, Major
891	Depression, Unipolar
892	Depression Moderate
893	Hydrosalpinx
894	New-generation Digital PET/CT Imaging
895	Emphysema
896	Surgical Site Infection
897	Back Pain
898	Back Pain, Low
899	Sciatica
900	Perinatal Mental Health
901	Antenatal Depression
902	Antenatal Anxiety
903	Laryngeal Edema
904	Analgesics, Opioid
905	Orthopedic Surgery
906	Ambulatory Surgery
907	Education, Patient
908	Injuries and Wounds
909	Hemodialysis Access Failure (Disorder)
910	Stent-Graft Restenosis
911	Arteriovenous Graft
912	Drug-coated Balloon
913	Anemia
914	Iron-deficiency
915	Lower Limb Amputation Below Knee (Injury)
916	Atrial Fibrillation New Onset
917	Myocardial Infarction
918	Discogenic Pain
919	Alcohol Dependence
920	Alcohol-Related Disorders
921	Radiation Exposure
922	Enteral Nutrition
923	Health Services Research
924	Infected Immature Permanent Teeth
925	Chronic Low Back Pain
926	Temporal Wasting
927	Hyperthyroidism
928	Graves Disease
929	Primary Care
930	Advance Directives
931	Randomized Controlled Trial
932	Multiple Chronic Conditions
933	Family Caregivers
934	Muscle Damage
935	Fuchs' Endothelial Dystrophy
936	Dialysis Hypotension
937	Hemodialysis-Induced Symptom
938	Obsessive-Compulsive Disorder
939	Keratoconus
940	Keratoconus, Unstable
941	Renal Disease, End-Stage
942	Infertility, Female
943	Stress Disorders, Post-Traumatic
944	Concussion
945	Mild Traumatic Brain Injury
946	Cognitive Communication Disorder
947	Abortion
948	Dupuytren Contracture
949	Non-Diabetic Disorder of Endocrine Pancreas
950	Corneal Injuries
951	Corneal Burns
952	Corneal Scars and Opacities
953	Diabetes Mellitus, Type 1
954	Acute Myeloid Leukaemia
955	Dengue
956	Effect of Training
957	Mild to Moderate Dementia
958	Palliative Care
959	Sexual Violence
960	Promotion of Positive Sibling Relationships
961	Safe Sex
962	Thyroid Cancer Stage IV
963	Radiation Toxicity
964	Epidural Hematoma
965	Non-alcoholic Fatty Liver Disease
966	Epigenetics
967	Microbiome
968	Perinatal Stroke
969	Periventricular Leukomalacia
970	Suspected or Known Squamous Cell Neoplasia
971	Prior History of Squamous Cell Dysplasia and /or Neoplasia
972	Brain Development
973	Household and Family Processes
974	Deglutition
975	Subcortical Aphasia
976	Ischemic Stroke
977	Hip Replacement
978	Peanut Allergy
979	Tree Nut Allergy
980	Lumbar Post-Laminectomy Syndrome
981	Vertebral Compression Fracture
982	Failed Back Surgery Syndrome
983	Intellectual Disability
984	Developmental Disorders
985	Developmental Delay
986	Autistic Spectrum Disorders
987	Down Syndrome
988	Developmental Disability
989	Learning Disorders
990	Cancer
991	Peritoneal Carcinomatosis
992	Malaria Diagnosis
993	Malaria,Falciparum
994	Nutrient; Excess
995	Community Health Education
996	HIV-1 Virologic Response
997	Medication Non-Adherence
998	Cirrhosis, Liver
999	Solid Pancreatic Tumor
1000	Inflammatory Bowel Disease(IBD)
1001	Sepsis, Severe
1002	Carcinoma, Basal Cell
1003	Macular Holes
1004	Retinal Detachment
1005	High Myopia
1006	Pre-diabetes
1007	Fracture Closed of Lower End of Forearm, Unspecified
1008	Helicobacter Infections
1009	Mechanical Ventilation Complication
1010	Hepatitis B
1011	Pregnancy
1012	Antioxidant Role of the Lutein in Preterm Newborn
1013	Diastolic Heart Failure
1014	Molluscum Contagiosum
1015	Dietary Supplementation
1016	Substance-Related Disorders
1017	Dry Eye Disease
1018	Anovulation
1019	Amenorrhea
1020	Iron-Deficiency Anemia
1021	Impaired Cognition
1022	Radiation Retinopathy
1023	Spinal Cord Injury, Acute
1024	Neurogenic Bladder
1025	Incontinence
1026	Sexual Risk Behavior
1027	Drug Use
1028	Family Functioning
1029	Acute Lymphoblastic Leukemia
1030	Pulmonary Arterial Hypertension
1031	Iron Deficiency
1032	Serious Mental Illness
1033	Schizophrenia
1034	Schizoaffective Disorder
1035	Cardiovascular Disease
1036	Psychosis NOS
1037	Feasibility Study
1038	End Stage Renal Disease on Dialysis (Diagnosis)
1039	Rectal Neoplasms
1040	Terminal Illness
1041	Renal Impairment
1042	Intermittent Claudication
1043	Amputation Stump
1044	Hypercholesterolemia
1045	Enterovirus 71 Inactivated Vaccine
1046	HFMD
1047	Clinical Decision Making
1048	Nonarthritic Hip Disease
1049	Biological Aging
1050	Cystic Fibrosis, Pulmonary
1051	Intimate Partner Violence
1052	Nonalcoholic Fatty Liver Disease
1053	Drug Use Disorders
1054	Insulin Resistance
1055	Non-Alcoholic Fatty Liver Disease
1056	Pediatrics
1057	Dexmedetomidine
1058	Pharmacodynamics
1059	Stuttering, Developmental
1060	Post-pregnancy Family Planning
1061	Capacity Building of Healthcare Providers
1062	Emergency Service, Hospital
1063	Motivational Interviewing
1064	Advance Care Planning
1065	Whiplash Injuries
1066	Health Literacy
1067	Microbial Colonization
1068	Gynecologic Cancer
1069	Post Operative Pain
1070	Ehlers-Danlos Syndrome (EDS)
1071	Complex Regional Pain Syndrome (CRPS)
1072	Amplified Musculoskeletal Pain Syndrome (AMPS)
1073	Fibromyalgia
1074	Chronic Widespread Pain
1075	Frail Elderly
1076	Decision Support Systems, Clinical
1077	Intracerebral Haemorrhage in Cerebellum
1078	Respiratory Distress Syndrome, Adult
1079	Laparotomy
1080	Retroperitoneal Disease
1081	Pelvis Disease
1082	Pancreatic Diseases
1083	Liver Diseases
1084	Urologic Diseases
1085	Complication of Surgical Procedure
1086	Knee Arthropathy
1087	Dysglycemia
1088	Migraine
1089	Chronic Migraine
1090	Hemophilia A
\.


--
-- Data for Name: condxref; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.condxref (nct_cond_id, nct_number, cond_id) FROM stdin;
1	NCT03769298	1
2	NCT03653546	2
3	NCT03653546	3
4	NCT03653546	4
5	NCT03641209	5
6	NCT03641209	6
7	NCT03601000	7
8	NCT03498196	8
9	NCT03498196	9
10	NCT03498196	10
11	NCT03453255	11
12	NCT03420976	12
13	NCT03395288	13
14	NCT03361345	14
15	NCT03354611	15
16	NCT03334175	16
17	NCT03334175	17
18	NCT03317327	18
19	NCT03262961	19
20	NCT03227731	20
21	NCT02786836	21
22	NCT01203722	22
23	NCT03837717	23
24	NCT03837717	24
25	NCT03836508	25
26	NCT03836508	26
27	NCT03836508	27
28	NCT03833596	28
29	NCT03833531	29
30	NCT03833531	30
31	NCT03833531	31
32	NCT03833531	32
33	NCT03833453	33
34	NCT03832712	34
35	NCT03832530	35
36	NCT03830190	36
37	NCT03830008	37
38	NCT03830008	38
39	NCT03830008	39
40	NCT03830008	40
41	NCT03830008	41
42	NCT03830008	42
43	NCT03830008	43
44	NCT03829748	44
45	NCT03829748	45
46	NCT03828721	46
47	NCT03828721	47
48	NCT03828721	48
49	NCT03827915	49
50	NCT03827915	50
51	NCT03827915	51
52	NCT03825146	52
53	NCT03823456	53
54	NCT03818867	54
55	NCT03818867	55
56	NCT03818867	56
57	NCT03817489	57
58	NCT03814577	58
59	NCT03814577	59
60	NCT03814330	60
61	NCT03814330	61
62	NCT03814330	62
63	NCT03813992	63
64	NCT03813381	64
65	NCT03813069	65
66	NCT03809286	66
67	NCT03807986	67
68	NCT03801772	68
69	NCT03799328	69
70	NCT03798483	70
71	NCT03798483	71
72	NCT03796923	72
73	NCT03796923	73
74	NCT03796923	74
75	NCT03796923	75
76	NCT03796923	76
77	NCT03796923	77
78	NCT03796793	78
79	NCT03795675	79
80	NCT03795675	80
81	NCT03791697	81
82	NCT03790449	82
83	NCT03786432	83
84	NCT03786432	84
85	NCT03783767	85
86	NCT03783767	86
87	NCT03783312	87
88	NCT03783312	88
89	NCT03783312	89
90	NCT03783299	90
91	NCT03782974	91
92	NCT03781050	92
93	NCT03778580	93
94	NCT03773575	94
95	NCT03773575	95
96	NCT03773575	96
97	NCT03773575	97
98	NCT03773575	98
99	NCT03773575	99
100	NCT03771495	100
101	NCT03771495	101
102	NCT03771430	102
103	NCT03771430	103
104	NCT03770962	104
105	NCT03770962	105
106	NCT03770962	106
107	NCT03770962	107
108	NCT03770962	108
109	NCT03770507	109
110	NCT03767660	110
111	NCT03767660	111
112	NCT03761732	112
113	NCT03753932	113
114	NCT03753932	114
115	NCT03753932	115
116	NCT03753932	116
117	NCT03753243	117
118	NCT03751878	118
119	NCT03751878	119
120	NCT03749655	120
121	NCT03748914	121
122	NCT03748914	122
123	NCT03748914	123
124	NCT03747887	124
125	NCT03745209	125
126	NCT03743480	126
127	NCT03740659	127
128	NCT03740321	128
129	NCT03740321	129
130	NCT03737227	130
131	NCT03736382	131
132	NCT03730454	132
133	NCT03730454	133
134	NCT03729687	134
135	NCT03729648	135
136	NCT03729297	136
137	NCT03727321	137
138	NCT03727321	138
139	NCT03725215	139
140	NCT03724383	140
141	NCT03723525	141
142	NCT03719235	142
143	NCT03716219	143
144	NCT03714139	144
145	NCT03711630	145
146	NCT03711630	146
147	NCT03711630	147
148	NCT03711630	148
149	NCT03711630	149
150	NCT03711630	150
151	NCT03711630	151
152	NCT03711630	152
153	NCT03711630	153
154	NCT03711370	154
155	NCT03711370	155
156	NCT03709979	156
157	NCT03709979	157
158	NCT03704415	158
159	NCT03704415	159
160	NCT03704415	160
161	NCT03704415	161
162	NCT03704051	162
163	NCT03704051	163
164	NCT03699059	164
165	NCT03699059	165
166	NCT03699059	166
167	NCT03697837	167
168	NCT03697837	168
169	NCT03697837	169
170	NCT03697837	170
171	NCT03697837	171
172	NCT03695003	172
173	NCT03695003	173
174	NCT03690154	174
175	NCT03690154	175
176	NCT03689348	176
177	NCT03689348	177
178	NCT03689049	178
179	NCT03689049	179
180	NCT03689049	180
181	NCT03689049	181
182	NCT03689049	182
183	NCT03689049	183
184	NCT03687411	184
185	NCT03685227	185
186	NCT03685227	186
187	NCT03685227	187
188	NCT03685227	188
189	NCT03682601	189
190	NCT03682601	190
191	NCT03682601	191
192	NCT03682601	192
193	NCT03682601	193
194	NCT03682601	194
195	NCT03682601	195
196	NCT03682601	196
197	NCT03680833	197
198	NCT03678935	198
199	NCT03678935	199
200	NCT03678935	200
201	NCT03678935	201
202	NCT03675009	202
203	NCT03668873	203
204	NCT03668873	204
205	NCT03667755	205
206	NCT03667001	206
207	NCT03663075	207
208	NCT03663075	208
209	NCT03663075	209
210	NCT03663075	210
211	NCT03658434	211
212	NCT03648437	212
213	NCT03648060	213
214	NCT03648060	214
215	NCT03648047	215
216	NCT03647007	216
217	NCT03646357	217
218	NCT03646357	218
219	NCT03646357	219
220	NCT03646240	220
221	NCT03645603	221
222	NCT03645005	222
223	NCT03645005	223
224	NCT03642769	224
225	NCT03638609	225
226	NCT03635840	226
227	NCT03632837	227
228	NCT03632837	228
229	NCT03632837	229
230	NCT03632837	230
231	NCT03630770	231
232	NCT03630770	232
233	NCT03630328	233
234	NCT03628001	234
235	NCT03625544	235
236	NCT03623880	236
237	NCT03623880	237
238	NCT03623880	238
239	NCT03623880	239
240	NCT03623880	240
241	NCT03623880	241
242	NCT03623880	242
243	NCT03620942	243
244	NCT03619720	244
245	NCT03618108	245
246	NCT03618108	246
247	NCT03618017	247
248	NCT03618017	248
249	NCT03618017	249
250	NCT03618017	250
251	NCT03615586	251
252	NCT03602768	252
253	NCT03602677	253
254	NCT03602677	254
255	NCT03602677	255
256	NCT03602677	256
257	NCT03602677	257
258	NCT03602014	258
259	NCT03602014	259
260	NCT03600987	260
261	NCT03598114	261
262	NCT03598114	262
263	NCT03593889	263
264	NCT03593148	264
265	NCT03593148	265
266	NCT03593148	266
267	NCT03593148	267
268	NCT03591237	268
269	NCT03585920	269
270	NCT03585920	270
271	NCT03585920	271
272	NCT03585920	272
273	NCT03585192	273
274	NCT03582046	274
275	NCT03582046	275
276	NCT03582046	276
277	NCT03579303	277
278	NCT03579303	278
279	NCT03578848	279
280	NCT03578432	280
281	NCT03578432	281
282	NCT03578432	282
283	NCT03577301	283
284	NCT03577106	284
285	NCT03577054	285
286	NCT03577054	286
287	NCT03575026	287
288	NCT03568812	288
289	NCT03567031	289
290	NCT03567031	290
291	NCT03567018	291
292	NCT03565354	292
293	NCT03564665	293
294	NCT03562546	294
295	NCT03561961	295
296	NCT03561103	296
297	NCT03559179	297
298	NCT03558763	298
299	NCT03555500	299
300	NCT03555500	300
301	NCT03553927	301
302	NCT03553927	302
303	NCT03552523	303
304	NCT03543098	304
305	NCT03543098	305
306	NCT03542383	306
307	NCT03542383	307
308	NCT03541291	308
309	NCT03540732	309
310	NCT03540732	310
311	NCT03540732	311
312	NCT03540368	312
313	NCT03540069	313
314	NCT03540069	314
315	NCT03538379	315
316	NCT03538379	316
317	NCT03537612	317
318	NCT03535675	318
319	NCT03534362	319
320	NCT03534362	320
321	NCT03527121	321
322	NCT03526068	322
323	NCT03526042	323
324	NCT03526042	324
325	NCT03524703	325
326	NCT03523806	326
327	NCT03523806	327
328	NCT03523299	328
329	NCT03521960	329
330	NCT03521960	330
331	NCT03521960	331
332	NCT03521960	332
333	NCT03519750	333
334	NCT03519750	334
335	NCT03519750	335
336	NCT03519659	336
337	NCT03518216	337
338	NCT03517397	338
339	NCT03516877	339
340	NCT03513822	340
341	NCT03513822	341
342	NCT03512691	342
343	NCT03512691	343
344	NCT03510195	344
345	NCT03510195	345
346	NCT03510195	346
347	NCT03508921	347
348	NCT03507647	348
349	NCT03503721	349
350	NCT03503721	350
351	NCT03502655	351
352	NCT03502655	352
353	NCT03502252	353
354	NCT03502252	354
355	NCT03501316	355
356	NCT03500419	356
357	NCT03500367	357
358	NCT03496948	358
359	NCT03496948	359
360	NCT03496948	360
361	NCT03496948	361
362	NCT03496948	362
363	NCT03495791	363
364	NCT03495791	364
365	NCT03495752	365
366	NCT03495661	366
367	NCT03495661	367
368	NCT03495661	368
369	NCT03495661	369
370	NCT03495661	370
371	NCT03495661	371
372	NCT03495518	372
373	NCT03495518	373
374	NCT03495089	374
375	NCT03494816	375
376	NCT03494816	376
377	NCT03494816	377
378	NCT03494335	378
379	NCT03494205	379
380	NCT03492476	380
381	NCT03491059	381
382	NCT03491046	382
383	NCT03490812	383
384	NCT03490656	384
385	NCT03488511	385
386	NCT03487718	386
387	NCT03487718	387
388	NCT03486444	388
389	NCT03486106	389
390	NCT03484533	390
391	NCT03484533	391
392	NCT03484533	392
393	NCT03484533	393
394	NCT03484338	394
395	NCT03484338	395
396	NCT03484273	396
397	NCT03483935	397
398	NCT03483935	398
399	NCT03482908	399
400	NCT03479697	400
401	NCT03479697	401
402	NCT03478163	402
403	NCT03478163	403
404	NCT03478163	404
405	NCT03478137	405
406	NCT03477500	406
407	NCT03477045	407
408	NCT03473899	408
409	NCT03473665	409
410	NCT03473665	410
411	NCT03472820	411
412	NCT03472820	412
413	NCT03472430	413
414	NCT03472430	414
415	NCT03472378	415
416	NCT03472378	416
417	NCT03472378	417
418	NCT03471117	418
419	NCT03470389	419
420	NCT03470389	420
421	NCT03469609	421
422	NCT03468621	422
423	NCT03464773	423
424	NCT03464773	424
425	NCT03464773	425
426	NCT03464266	426
427	NCT03464266	427
428	NCT03464266	428
429	NCT03464266	429
430	NCT03462966	430
431	NCT03462823	431
432	NCT03462823	432
433	NCT03457519	433
434	NCT03457506	434
435	NCT03457506	435
436	NCT03457506	436
437	NCT03456895	437
438	NCT03456128	438
439	NCT03455426	439
440	NCT03454282	440
441	NCT03454087	441
442	NCT03453190	442
443	NCT03451266	443
444	NCT03451266	444
445	NCT03450655	445
446	NCT03450564	446
447	NCT03449693	447
448	NCT03448289	448
449	NCT03448289	449
450	NCT03447119	450
451	NCT03447119	451
452	NCT03447119	452
453	NCT03447119	453
454	NCT03444103	454
455	NCT03443388	455
456	NCT03443388	456
457	NCT03443388	457
458	NCT03443388	458
459	NCT03443388	459
460	NCT03441867	460
461	NCT03441867	461
462	NCT03441867	462
463	NCT03441867	463
464	NCT03441867	464
465	NCT03441867	465
466	NCT03438708	466
467	NCT03435172	467
468	NCT03434392	468
469	NCT03433222	469
470	NCT03433222	470
471	NCT03433222	471
472	NCT03433222	472
473	NCT03433222	473
474	NCT03429010	474
475	NCT03429010	475
476	NCT03428477	476
477	NCT03428477	477
478	NCT03426436	478
479	NCT03423394	479
480	NCT03422536	480
481	NCT03422536	481
482	NCT03422536	482
483	NCT03422536	483
484	NCT03422536	484
485	NCT03422536	485
486	NCT03422536	486
487	NCT03422536	487
488	NCT03422536	488
489	NCT03422536	489
490	NCT03422536	490
491	NCT03422536	491
492	NCT03422536	492
493	NCT03422536	493
494	NCT03422536	494
495	NCT03422536	495
496	NCT03422536	496
497	NCT03422536	497
498	NCT03422536	498
499	NCT03422536	499
500	NCT03422536	500
501	NCT03422536	501
502	NCT03422536	502
503	NCT03421262	503
504	NCT03419715	504
505	NCT03419715	505
506	NCT03418870	506
507	NCT03415880	507
508	NCT03415880	508
509	NCT03415880	509
510	NCT03415880	510
511	NCT03415880	511
512	NCT03415880	512
513	NCT03415880	513
514	NCT03415880	514
515	NCT03415880	515
516	NCT03415841	516
517	NCT03412149	517
518	NCT03410511	518
519	NCT03408873	519
520	NCT03408873	520
521	NCT03408574	521
522	NCT03406520	522
523	NCT03404011	523
524	NCT03399318	524
525	NCT03399318	525
526	NCT03399318	526
527	NCT03399318	527
528	NCT03399318	528
529	NCT03397030	529
530	NCT03396094	530
531	NCT03394599	531
532	NCT03392415	532
533	NCT03392415	533
534	NCT03392415	534
535	NCT03386227	535
536	NCT03386227	536
537	NCT03386227	537
538	NCT03382171	538
539	NCT03382093	539
540	NCT03382093	540
541	NCT03382093	541
542	NCT03382093	542
543	NCT03381027	543
544	NCT03381027	544
545	NCT03380884	545
546	NCT03380884	546
547	NCT03380013	547
548	NCT03379818	548
549	NCT03379818	549
550	NCT03375879	550
551	NCT03375879	551
552	NCT03375229	552
553	NCT03375229	553
554	NCT03372174	554
555	NCT03371836	555
556	NCT03369600	556
557	NCT03367364	557
558	NCT03365518	558
559	NCT03365518	559
560	NCT03365518	560
561	NCT03365518	561
562	NCT03365518	562
563	NCT03364114	563
564	NCT03362983	564
565	NCT03362983	565
566	NCT03359863	566
567	NCT03359863	567
568	NCT03357042	568
569	NCT03356210	569
570	NCT03356106	570
571	NCT03356106	571
572	NCT03356106	572
573	NCT03355456	573
574	NCT03354325	574
575	NCT03354286	575
576	NCT03353298	576
577	NCT03353298	577
578	NCT03352947	578
579	NCT03350737	579
580	NCT03350737	580
581	NCT03346668	581
582	NCT03346668	582
583	NCT03346668	583
584	NCT03346668	584
585	NCT03346668	585
586	NCT03342976	586
587	NCT03342976	587
588	NCT03341975	588
589	NCT03341975	589
590	NCT03341520	590
591	NCT03341520	591
592	NCT03341520	592
593	NCT03341520	593
594	NCT03340922	594
595	NCT03340922	595
596	NCT03337607	596
597	NCT03337360	597
598	NCT03336879	598
599	NCT03335475	599
600	NCT03335358	600
601	NCT03335319	601
602	NCT03335124	602
603	NCT03335124	603
604	NCT03334643	604
605	NCT03333460	605
606	NCT03333460	606
607	NCT03333460	607
608	NCT03333460	608
609	NCT03333460	609
610	NCT03333174	610
611	NCT03323359	611
612	NCT03323359	612
613	NCT03323359	613
614	NCT03322774	614
615	NCT03322774	615
616	NCT03322072	616
617	NCT03322072	617
618	NCT03322072	618
619	NCT03322072	619
620	NCT03322072	620
621	NCT03320057	621
622	NCT03320057	622
623	NCT03318874	623
624	NCT03318874	624
625	NCT03314792	625
626	NCT03314792	626
627	NCT03314792	627
628	NCT03314792	628
629	NCT03313492	629
630	NCT03308851	630
631	NCT03308851	631
632	NCT03308851	632
633	NCT03308851	633
634	NCT03306992	634
635	NCT03306992	635
636	NCT03304626	636
637	NCT03304626	637
638	NCT03304301	638
639	NCT03304301	639
640	NCT03302858	640
641	NCT03302858	641
642	NCT03302858	642
643	NCT03302858	643
644	NCT03302858	644
645	NCT03302858	645
646	NCT03302299	646
647	NCT03302299	647
648	NCT03302299	648
649	NCT03301311	649
650	NCT03301311	650
651	NCT03301311	651
652	NCT03301311	652
653	NCT03299816	653
654	NCT03299296	654
655	NCT03299296	655
656	NCT03297658	656
657	NCT03295708	657
658	NCT03295422	658
659	NCT03294395	659
660	NCT03291951	660
661	NCT03291951	661
662	NCT03290560	662
663	NCT03289858	663
664	NCT03286374	664
665	NCT03286374	665
666	NCT03286374	666
667	NCT03286374	667
668	NCT03283943	668
669	NCT03283943	669
670	NCT03283943	670
671	NCT03275571	671
672	NCT03269071	672
673	NCT03268213	673
674	NCT03263156	674
675	NCT03256396	675
676	NCT03256396	676
677	NCT03256396	677
678	NCT03256396	678
679	NCT03256396	679
680	NCT03256396	680
681	NCT03256396	681
682	NCT03254589	682
683	NCT03254589	683
684	NCT03251495	684
685	NCT03248518	685
686	NCT03248518	686
687	NCT03248518	687
688	NCT03243539	688
689	NCT03243539	689
690	NCT03243539	690
691	NCT03243539	691
692	NCT03241511	692
693	NCT03241511	693
694	NCT03237468	694
695	NCT03229538	695
696	NCT03229538	696
697	NCT03229486	697
698	NCT03227809	698
699	NCT03227809	699
700	NCT03227809	700
701	NCT03227770	701
702	NCT03205956	702
703	NCT03196193	703
704	NCT03193333	704
705	NCT03191071	705
706	NCT03167723	706
707	NCT03167723	707
708	NCT03167723	708
709	NCT03167723	709
710	NCT03116139	710
711	NCT03116139	711
712	NCT03110744	712
713	NCT03100526	713
714	NCT03044613	714
715	NCT03044613	715
716	NCT03026816	716
717	NCT03007511	717
718	NCT02993432	718
719	NCT02993432	719
720	NCT02993432	720
721	NCT02990429	721
722	NCT02978950	722
723	NCT02978950	723
724	NCT02978950	724
725	NCT02957669	725
726	NCT02940028	726
727	NCT02874443	727
728	NCT02852213	728
729	NCT02845336	729
730	NCT02690259	730
731	NCT02624765	731
732	NCT02624765	732
733	NCT02624765	733
734	NCT02613650	734
735	NCT02606045	735
736	NCT02599480	736
737	NCT02587936	737
738	NCT02587936	738
739	NCT02587936	739
740	NCT02458846	740
741	NCT02428205	741
742	NCT02278198	742
743	NCT02259621	743
744	NCT02046694	744
745	NCT01964859	745
746	NCT01042015	746
747	NCT00870064	747
748	NCT03799094	748
749	NCT03607630	749
750	NCT03423342	750
751	NCT03275870	751
752	NCT03275870	752
753	NCT03275870	753
754	NCT03275870	754
755	NCT03275870	755
756	NCT03275870	756
757	NCT03104426	757
758	NCT03104426	758
759	NCT03104426	759
760	NCT03104426	760
761	NCT03753802	761
762	NCT03241732	762
763	NCT03466528	763
764	NCT03466528	764
765	NCT03466528	765
766	NCT03466528	766
767	NCT03466528	767
768	NCT03463252	768
769	NCT03463252	769
770	NCT03829956	770
771	NCT03827616	771
772	NCT03808207	772
773	NCT03808207	773
774	NCT03808207	774
775	NCT03808207	775
776	NCT03795740	776
777	NCT03787615	777
778	NCT03781596	778
779	NCT03771534	779
780	NCT03770455	780
781	NCT03762239	781
782	NCT03762239	782
783	NCT03762239	783
784	NCT03762239	784
785	NCT03762239	785
786	NCT03762239	786
787	NCT03761264	787
788	NCT03757572	788
789	NCT03754322	789
790	NCT03754322	790
791	NCT03744780	791
792	NCT03737370	792
793	NCT03735537	793
794	NCT03702465	794
795	NCT03701113	795
796	NCT03701113	796
797	NCT03701113	797
798	NCT03699397	798
799	NCT03698591	799
800	NCT03698591	800
801	NCT03694496	801
802	NCT03692715	802
803	NCT03692715	803
804	NCT03692715	804
805	NCT03685461	805
806	NCT03685461	806
807	NCT03680248	807
808	NCT03678506	808
809	NCT03661385	809
810	NCT03661385	810
811	NCT03654131	811
812	NCT03654131	812
813	NCT03644381	813
814	NCT03636724	814
815	NCT03636724	815
816	NCT03632447	816
817	NCT03632447	817
818	NCT03631979	818
819	NCT03631979	819
820	NCT03631030	820
821	NCT03631030	821
822	NCT03631030	822
823	NCT03631030	823
824	NCT03629145	824
825	NCT03625011	825
826	NCT03625011	826
827	NCT03607461	827
828	NCT03594474	828
829	NCT03589378	829
830	NCT03586219	830
831	NCT03570424	831
832	NCT03570424	832
833	NCT03570424	833
834	NCT03560063	834
835	NCT03560063	835
836	NCT03560063	836
837	NCT03560063	837
838	NCT03550495	838
839	NCT03538860	839
840	NCT03538860	840
841	NCT03538860	841
842	NCT03538860	842
843	NCT03536858	843
844	NCT03536858	844
845	NCT03526458	845
846	NCT03526458	846
847	NCT03494231	847
848	NCT03493126	848
849	NCT03488602	849
850	NCT03488602	850
851	NCT03488602	851
852	NCT03483740	852
853	NCT03483740	853
854	NCT03478501	854
855	NCT03474666	855
856	NCT03474432	856
857	NCT03474432	857
858	NCT03474432	858
859	NCT03471637	859
860	NCT03467724	860
861	NCT03467724	861
862	NCT03467724	862
863	NCT03467724	863
864	NCT03464851	864
865	NCT03462979	865
866	NCT03462979	866
867	NCT03462979	867
868	NCT03462979	868
869	NCT03462979	869
870	NCT03462979	870
871	NCT03462459	871
872	NCT03461016	872
873	NCT03461016	873
874	NCT03461016	874
875	NCT03461003	875
876	NCT03455985	876
877	NCT03455985	877
878	NCT03455985	878
879	NCT03453398	879
880	NCT03453398	880
881	NCT03453398	881
882	NCT03453359	882
883	NCT03442114	883
884	NCT03442114	884
885	NCT03429439	885
886	NCT03422848	886
887	NCT03418649	887
888	NCT03418649	888
889	NCT03406767	889
890	NCT03405493	890
891	NCT03405493	891
892	NCT03405493	892
893	NCT03395301	893
894	NCT03387618	894
895	NCT03382106	895
896	NCT03380169	896
897	NCT03377088	897
898	NCT03377088	898
899	NCT03377088	899
900	NCT03373734	900
901	NCT03373734	901
902	NCT03373734	902
903	NCT03372707	903
904	NCT03366805	904
905	NCT03366805	905
906	NCT03366805	906
907	NCT03366805	907
908	NCT03366805	908
909	NCT03360279	909
910	NCT03360279	910
911	NCT03360279	911
912	NCT03360279	912
913	NCT03359447	913
914	NCT03359447	914
915	NCT03348605	915
916	NCT03345615	916
917	NCT03345615	917
918	NCT03340818	918
919	NCT03340051	919
920	NCT03340051	920
921	NCT03331965	921
922	NCT03331965	922
923	NCT03330509	923
924	NCT03327844	924
925	NCT03324659	925
926	NCT03324516	926
927	NCT03303053	927
928	NCT03303053	928
929	NCT03302572	929
930	NCT03302572	930
931	NCT03302572	931
932	NCT03301831	932
933	NCT03301831	933
934	NCT03297151	934
935	NCT03275896	935
936	NCT03274518	936
937	NCT03274518	937
938	NCT03273699	938
939	NCT03245853	939
940	NCT03245853	940
941	NCT03239808	941
942	NCT03234569	942
943	NCT03230890	943
944	NCT03230656	944
945	NCT03230656	945
946	NCT03230656	946
947	NCT03227614	947
948	NCT03192020	948
949	NCT03036592	949
950	NCT02948023	950
951	NCT02948023	951
952	NCT02948023	952
953	NCT02814123	953
954	NCT02724163	954
955	NCT03799237	955
956	NCT03759795	956
957	NCT03750409	957
958	NCT03736031	958
959	NCT03726437	959
960	NCT03706014	960
961	NCT03695679	961
962	NCT03669432	962
963	NCT03669432	963
964	NCT03658941	964
965	NCT03648086	965
966	NCT03647449	966
967	NCT03647449	967
968	NCT03635775	968
969	NCT03635775	969
970	NCT02029937	970
971	NCT02029937	971
972	NCT03593356	972
973	NCT03593356	973
974	NCT03588806	974
975	NCT03588572	975
976	NCT03588572	976
977	NCT03551860	977
978	NCT03532360	978
979	NCT03532360	979
980	NCT03523000	980
981	NCT03523000	981
982	NCT03523000	982
983	NCT03522337	983
984	NCT03522337	984
985	NCT03522337	985
986	NCT03522337	986
987	NCT03522337	987
988	NCT03522337	988
989	NCT03522337	989
990	NCT03518255	990
991	NCT03517852	991
992	NCT03511443	992
993	NCT03511443	993
994	NCT03505658	994
995	NCT03505658	995
996	NCT03500172	996
997	NCT03454308	997
998	NCT03437876	998
999	NCT03435588	999
1000	NCT03426683	1000
1001	NCT03422159	1001
1002	NCT03420846	1002
1003	NCT03383731	1003
1004	NCT03383731	1004
1005	NCT03383731	1005
1006	NCT03376685	1006
1007	NCT03376100	1007
1008	NCT03365609	1008
1009	NCT03360968	1009
1010	NCT03343431	1010
1011	NCT03343431	1011
1012	NCT03340103	1012
1013	NCT03338374	1013
1014	NCT03336372	1014
1015	NCT03326934	1015
1016	NCT03306173	1016
1017	NCT03287635	1017
1018	NCT01785719	1018
1019	NCT01785719	1019
1020	NCT03232554	1020
1021	NCT01739933	1021
1022	NCT03085784	1022
1023	NCT03083366	1023
1024	NCT03083366	1024
1025	NCT03083366	1025
1026	NCT03009539	1026
1027	NCT03009539	1027
1028	NCT03009539	1028
1029	NCT02744768	1029
1030	NCT01447628	1030
1031	NCT01447628	1031
1032	NCT02188121	1032
1033	NCT02188121	1033
1034	NCT02188121	1034
1035	NCT02188121	1035
1036	NCT02188121	1036
1037	NCT03629496	1037
1038	NCT03629496	1038
1039	NCT03622437	1039
1040	NCT03616639	1040
1041	NCT03616639	1041
1042	NCT03564080	1042
1043	NCT03544853	1043
1044	NCT03543774	1044
1045	NCT03519568	1045
1046	NCT03519568	1046
1047	NCT03519087	1047
1048	NCT03519087	1048
1049	NCT03440099	1049
1050	NCT03437811	1050
1051	NCT03397277	1051
1052	NCT03375580	1052
1053	NCT03373240	1053
1054	NCT03369145	1054
1055	NCT03369145	1055
1056	NCT03337581	1056
1057	NCT03337581	1057
1058	NCT03337581	1058
1059	NCT03335722	1059
1060	NCT03333473	1060
1061	NCT03333473	1061
1062	NCT03208530	1062
1063	NCT03208530	1063
1064	NCT03208530	1064
1065	NCT03664934	1065
1066	NCT03584490	1066
1067	NCT03422562	1067
1068	NCT03304444	1068
1069	NCT03304444	1069
1070	NCT03686748	1070
1071	NCT03686748	1071
1072	NCT03686748	1072
1073	NCT03686748	1073
1074	NCT03686748	1074
1075	NCT03538418	1075
1076	NCT03397160	1076
1077	NCT03388970	1077
1078	NCT03376854	1078
1079	NCT03234543	1079
1080	NCT03234543	1080
1081	NCT03234543	1081
1082	NCT03234543	1082
1083	NCT03234543	1083
1084	NCT03234543	1084
1085	NCT03234543	1085
1086	NCT03230942	1086
1087	NCT03543644	1087
1088	NCT03507400	1088
1089	NCT03507400	1089
1090	NCT03286153	1090
\.


--
-- Data for Name: inter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.inter (inter_id, inter_detail) FROM stdin;
1	Drug: Envarsus XR
2	Drug: AZD3759
3	Drug: Erlotinib
4	Drug: Gefitinib
5	Drug: Paracetamol 10mg/mL infusion solution
6	Other: Placebo
7	Drug: Yi-Zhi-An-Shen
8	Drug: Placebo
9	Drug: Avelumab
10	Drug: Chemotherapy
11	Dietary Supplement: Novel Supplement Based Therapy
12	Drug: D-Mannose
13	Drug: Tranexamic Acid
14	Drug: Vehicle
15	Radiation: Contrast Enhanced Cone Beam Breast CT Scan
16	Drug: Contrast Dye, Iodinated
17	Drug: Walnuts
18	Drug: Nivolumab
19	Radiation: Radiotherapy (RT)
20	Drug: Sildenafil 20 MG
21	Drug: Placebo Oral Tablet
22	Drug: Truvada
23	Drug: 13C-Methacetin
24	Drug: Fludarabine
25	Drug: Cytoxan
26	Radiation: Total Body Irradiation
27	Procedure: Allogeneic Blood or Marrow Transplant
28	Procedure: Peripheral Blood Stem Cell Transplant
29	Drug: Mycophenolate Mofetil
30	Drug: Sirolimus
31	Drug: Tacrolimus
32	Behavioral: Holding
33	Other: Saliva collection
34	Behavioral: No Holding
35	Device: Medium cut-off
36	Device: High-Flux
37	Drug: Prednisone
38	Dietary Supplement: Exclusive Enteral Nutrition
39	Behavioral: ImRS
40	Behavioral: SFT
41	Behavioral: EMDR
42	Behavioral: DBT
43	Procedure: Deep Brain Stimulation
44	Drug: Best Medical Treatment
45	Behavioral: Safer conception counseling inclusive of periconception PrEP
46	Other: Parkinson's disease nurse specialist care
47	Behavioral: Problem Management Plus
48	Procedure: Intermittent aspiration
49	Other: Rx for Success Smartphone Application
50	Other: Control - screen time reduction
51	Device: Double sequential external defibrillation
52	Biological: Autologous Multi-lineage Potential Cells (AMPC)
53	Other: Self-acupressure
54	Other: Sham Self-acupressure
55	Procedure: Insertion of cervical cerclage
56	Behavioral: Baduanjin qigong
57	Behavioral: Mindfulness meditation
58	Diagnostic Test: Total Antioxidant Status
59	Diagnostic Test: Total Oxidant Status
60	Device: Bispectral Index
61	Other: Invasive arterial monitorization
62	Diagnostic Test: State-Trait Anxiety Inventory
63	Diagnostic Test: Quality of Recovery Score
64	Other: Sedation/Analgesia
65	Device: Laryngeal Mask Airway
66	Drug: MED2005
67	Behavioral: Calorie and protein restriction diet
68	Other: IR3535
69	Other: Permethrin lower dose
70	Other: Permethrin higher dose
71	Device: active rTMS
72	Behavioral: Inpatient admission
73	Device: sham rTMS
74	Procedure: Nanofat grafting
75	Procedure: Microfat grafting
76	Procedure: Platelet-rich plasma (PRP) Injection
77	Device: Metronome
78	Other: multi-OIT
79	Other: Individualised exercise
80	Other: Early follow-up visit after discharge
81	Other: Comprehensive geriatric assessment (CGA)
82	Other: Continued geriatric care
83	Other: Possible follow-up visit from GP
84	Procedure: Debridement
85	Device: Cochlear Implant
86	Other: Telehealth 2 week postoperative visit
87	Behavioral: PreLiFe-programme
88	Behavioral: Attention Control Programme
89	Device: Spira-C Interbody Device
90	Behavioral: Leadership Intervention
91	Drug: placebo
92	Drug: paracetamol
93	Drug: ibuprofen
94	Diagnostic Test: Standard RDT and HS-RDT
95	Drug: Artemether-lumefantrine
96	Drug: Primaquine Phosphate
97	Dietary Supplement: beta glucan
98	Drug: Rapamycin
99	Dietary Supplement: Pyridoxamine Dihydrochloride
100	Device: PREVENA™ PEEL & PLACE™ Dressing Kit
101	Other: Joint Mobilization
102	Other: Laying on of Hands
103	Behavioral: Group osteoarthritis education, exercise and CBT
104	Procedure: Total Knee Arthroplasty
105	Behavioral: Two midwives
106	Other: Exercise Training
107	Behavioral: Islamic Trauma Healing
108	Device: Fixed prosthodontics
109	Drug: Pembrolizumab
110	Drug: Enzalutamide
111	Behavioral: Evaluation of reporting inconsistencies
112	Behavioral: Standard Peer Review.
113	Behavioral: Physical Activity Promotion
114	Other: Intervention Group
115	Other: Control Group
116	Behavioral: Daily Report Card
117	Other: School as Usual
118	Device: Ultrasound
119	Other: early palliative care
120	Drug: Levofloxacin + Dexamethasone
121	Drug: Levofloxacin
122	Drug: Dexamethasone
123	Device: Embolization with tri-acryl gelatin (Embosphere) particles
124	Drug: Levofloxacin + dexamethasone followed by dexamethasone
125	Drug: Tobramycin + Dexamethasone
126	Radiation: Cinematographic recording
127	Other: Mild intermittent hypoxia
128	Other: Sham protocol
129	Other: Continuous positive airway pressure (CPAP)
130	Device: Transanastomotic Tube (5FR)
131	Other: No Transanastomotic Tube
132	Combination Product: radiotherapy, capecitabine, oxaliplatin
133	Behavioral: Expressive Arts Therapy
134	Drug: Cabozantinib
135	Combination Product: Fecal Microbial Transplant
136	Dietary Supplement: Fiber
137	Dietary Supplement: Cellulose
138	Behavioral: Split-Belt Treadmill Training
139	Behavioral: Risk Factor Management Consult
140	Behavioral: Diet Classes
141	Behavioral: Stress Management Classes
142	Other: Exercise Classes
143	Other: Home based exercise program
144	Combination Product: Package of HIV care
145	Combination Product: Standard HIV care
146	Other: CBCT
147	Procedure: immediate loading
148	Procedure: non implant loading
149	Behavioral: Meditation
150	Other: Clear Bottle
151	Other: Opaque Bottle
152	Device: C-MAC videolaryngoscope
153	Procedure: Extended endoscopic sinus surgery
154	Procedure: Limited endoscopic sinus surgery
155	Behavioral: Stigma-Reduction Intervention
156	Behavioral: Behavioral Weight Loss (BWL)
157	Behavioral: Mode of Feeding (breastfeeding versus bottle-feeding
158	Other: ExeRTiOn
159	Behavioral: Parent Management Training
160	Dietary Supplement: Cognivia
161	Dietary Supplement: Placebo
162	Drug: FN-1501
163	Dietary Supplement: Avena sativa
164	Procedure: SPIDER
165	Procedure: Usual Care
166	Procedure: Neuraxial ultrasonography
167	Other: Yoga Nidra
168	Drug: Sinecatechins Topical
169	Procedure: Sentinel node detection in cervical cancer
170	Dietary Supplement: artificially sweetened beverages
171	Other: Low FODMAP diet
172	Other: Educational Programming
173	Other: Same day discharge
174	Other: Next-day discharge
175	Other: 2-days discharge
176	Behavioral: Sleep Parent Training
177	Behavioral: Sleep Parent Education
178	Procedure: fast track recovery surgery with whey protein infused carbohydrate loading and early oral feeding
179	Drug: Lidocaine Hydrochloride
180	Drug: Saline Solution
181	Behavioral: Group information (GI)
182	Behavioral: Structured person-centered support (PCS)
183	Radiation: Palliative radiotherapy
184	Genetic: ADRB2-genotype guided treatment
185	Other: Randomisation
186	Drug: Paracetamol 10Mg/mL
187	Drug: 0.45% Sodium Chloride
188	Drug: Ibuprofen
189	Device: Digital kinematic biofeedback system
190	Device: Digital kinematic biofeedback device
191	Other: Conventional rehabilitation
192	Other: Additional face-to-face rehabilitation sessions
193	Other: FIFA 11 for health
194	Other: Non-betablocker
195	Drug: Betablocker
196	Drug: ABI-009
197	Drug: Dexmedetomidine
198	Behavioral: ""My Guide"" (psychoeducation & self-management program)
199	Behavioral: ""My Health"" (health education program)
200	Other: Fluid administration
201	Device: Intra Aortic Balloon Pump
202	Device: Hemoadsorption
203	Drug: Medium-Chain Triglyceride (MCT) Oil
204	Dietary Supplement: Cogni.Q
205	Procedure: ERCP
206	Procedure: Instrumented posterolateral spinal fusion
207	Device: MagnetOs™ Granules
208	Procedure: Autologous bone graft
209	Behavioral: Unified Protocol
210	Behavioral: Supportive Therapy
211	Drug: Phenylephrine
212	Drug: Ephedrine
213	Device: ADIVA System
214	Device: DIVA System
215	Other: Records
216	Drug: Doxycycline Capsule
217	Drug: Azithromycin Capsule
218	Drug: Rifabutin Oral Capsule
219	Drug: Placebo oral capsule
220	Behavioral: CCC website
221	Behavioral: Static care plan
222	Other: With Chaperone
223	Other: Without Chaperone
224	Behavioral: Goal Management Training
225	Behavioral: Memory & Aging Program
226	Behavioral: BrainHQ
227	Device: ICG fluorescence imaging
228	Drug: Northera
229	Behavioral: Simultaneous music and reading lyrics
230	Behavioral: Priming with music
231	Behavioral: Control
232	Behavioral: Program Sustainability Action Planning Model and Training Curricula
233	Behavioral: Collaborative stepped care and peer support programme
234	Other: Treatment as usual
235	Other: Lifestyle
236	Behavioral: Mindfulness-Based Cognitive Therapy
237	Behavioral: Expanded Corn Snack
238	Other: Skin Group
239	Other: Warmer Group
240	Device: Abdominal Perfusion Pressure (APP)
241	Other: Homoeopathic Remedies
242	Device: uAOBP
243	Device: Home BP
244	Device: CBP
245	Drug: Everolimus
246	Other: Laboratory Biomarker Analysis
247	Other: Survey Administration
248	Behavioral: Clinic-based Delivery
249	Behavioral: Remote Delivery
250	Device: Transcranial magnetic stimulation (TMS)
251	Behavioral: HBB Prompt
252	Behavioral: Low-Dose High Frequency training
253	Behavioral: Music-with-movement
254	Behavioral: Usual care
255	Drug: Rillus®
256	Procedure: EtCO2 modification
257	Device: MRI Scan
258	Drug: iron isomaltoside(Monofer®)
259	Dietary Supplement: 400mg Magnesium Glycinate BID
260	Other: Strength From Within
261	Radiation: Moderate Hypo-fractionation
262	Radiation: Extreme Hypo-fractionation
263	Behavioral: Client-Centered Representative Payee
264	Other: VLN cigarettes (A)
265	Other: Usual Brand Cigarettes (B)
266	Drug: Nicotine gum (C)
267	Other: Opioid Wizard
268	Device: Telemonitoring
269	Other: Normal Care
270	Other: Non fasting
271	Dietary Supplement: Low Energy Diet
272	Other: NHS advice on healthy eating
273	Drug: Niraparib Treatment
274	Device: Bionic Pancreas
275	Other: Usual Care
276	Other: High taurine and saturated fat diet
277	Other: Low in taurine and saturated fat diet
278	Procedure: Early Surgery
279	Procedure: Delayed Surgery
280	Procedure: Early Rehab
281	Procedure: Delayed Rehab
282	Device: High Definition Transcranial Direct Current Stimulation
283	Device: Sham High Definition Transcranial Direct Current Stimulation
284	Device: SMART-SYNC LM02
285	Other: Indirect Calorimetry directed feeding.
286	Procedure: Cycle Ergometry
287	Drug: Tranexamic acid injection
288	Device: Intracerebral Infusion of Autologous Cerebral Spinal Fluid
289	Behavioral: Care Group Cervical Cancer Screening Education Curriculum
290	Behavioral: Memory Reframing
291	Behavioral: Bleeding Control Basic (B-Con) Course
292	Drug: Clonidine
293	Other: Morphine
294	Drug: Muscadine Plus
295	Drug: Placebos
296	Device: Nasopore
297	Device: Propel
298	Drug: Any LABA/LAMA
299	Behavioral: Mindfulness-Based Stress Reduction
300	Behavioral: Health Enhancement Program
301	Other: ESP physiotherapy
302	Other: Usual care
303	Device: SafeZoneUVC
304	Drug: Losartan
305	Drug: Enalapril
306	Other: chewing gum
307	Behavioral: Solution-Focused Coaching in Pediatric Rehabilitation
308	Procedure: Cryoablation
309	Drug: Buspirone oral capsule
310	Drug: Melatonin 25 mg
311	Diagnostic Test: PET/CT scan with 13 mCi radiation dose
312	Diagnostic Test: PET/CT scan with 5 mCi radiation dose
313	Diagnostic Test: PET/CT scan with 2.5 mCi radiation dose
314	Diagnostic Test: PET/CT Scan with 6.5 mCi radiation dose
315	Diagnostic Test: PET/CT Scan with not yet determined radiation dose
316	Behavioral: ADAPT
317	Behavioral: Mobile Contingency Management
318	Behavioral: Enhanced Stress Resilience Training for Faculty Physicians
319	Drug: Ketamine 10 MG/ML
320	Drug: Midazolam 1 MG/ML
321	Behavioral: Information on CVD Risk
322	Behavioral: Lottery Incentive
323	Other: MEDICORP HO PREPARATORY MODULE
324	Procedure: Periprocedural Antibiotics
325	Drug: Extended Antibiotics
326	Procedure: Injection of OnabotulinumtoxinA (BTX-A)
327	Diagnostic Test: HIV-1 RNA testing
328	Behavioral: Mindfulness Based Cognitive Therapy
329	Procedure: BipolEP
330	Procedure: bipolarTURP
331	Device: Pure-Vu System
332	Other: Experimental: Intervention message (first phase)
333	Other: Placebo Comparator: Control message (first phase)
334	Other: Experimental: Intervention message (second phase)
335	Other: Placebo Comparator: Control message (second phase)
336	Behavioral: Semillas de Apego
337	Device: Hand Instrumentation Treatment
338	Device: Ultrasonic Instrumentation Treatment
339	Device: RestoreX
340	Other: Control
341	Drug: rapamycin
342	Behavioral: TeGeCoach
343	Other: YouTube Video
344	Other: Bruce Fatigue Protocol
345	Procedure: Decompression
346	Other: Symptom feedback to Health Care Provider
347	Other: Standard of care
348	Diagnostic Test: dermal electrochemical conductance (DEC)
349	Diagnostic Test: Monofilament testing
350	Drug: Axitinib Oral Tablet
351	Other: Online surveys
352	Drug: Urtica comp. gel
353	Drug: institutional standard skin care ""Excipial-Hydrolotion""
354	Device: Circaid
355	Device: Short-stretching Bandage (Reference treatment)
356	Drug: C-11 labeled nicotine
357	Radiation: PET/CT imaging
358	Device: PET scan
359	Device: MRI scan
360	Diagnostic Test: PET scan
361	Other: Retrospective data analysis
362	Diagnostic Test: MRI Scan - in addition to standard of care
363	Diagnostic Test: MRI Scan - not in addition to standard of care
364	Drug: Edoxaban
365	Other: FoodforCare at home
366	Biological: Leukocyte platelet rich fibrin plug + d-PTFE membrane
367	Biological: d-PTFE membrane
368	Diagnostic Test: Phillips Lumify Diagnostic Ultrasound System
369	Other: Surveys
370	Other: Music
371	Other: Headphones
372	Drug: Propofol
373	Behavioral: HIV self-test kit
374	Behavioral: Standard of Care
375	Behavioral: Accelerated Resolution Therapy
376	Device: LifeWrap Compression Garment
377	Other: Microwave treatment
378	Behavioral: Early healthy lifestyles
379	Behavioral: Responsive parenting curriculum
380	Behavioral: Data sharing/coordination
381	Device: EnsoETM
382	Procedure: Conventional Care
383	Device: HIRREM
384	Other: Continued Current Care
385	Drug: CeFAZolin 1000 MG
386	Drug: Clindamycin 900 MG in 6 ML Injection
387	Behavioral: CPAP intervention
388	Drug: Cyclophosphamide and ATG
389	Drug: Alemtuzumab
390	Dietary Supplement: Single dose fish oil
391	Dietary Supplement: Repeated dose fish oil
392	Dietary Supplement: single dose Camelina seed oil
393	Dietary Supplement: repeated dose camelina seed oil
394	Device: rESWT
395	Device: Sham-rESWT
396	Drug: Indomethacin
397	Drug: Diclofenac
398	Drug: Meloxicam
399	Drug: Celecoxib
400	Other: Diet Recommendations
401	Other: Lifestyle Recommendations
402	Other: Exercise Recommendations
403	Other: Stress Management Recommendations
404	Other: PhytoGanix (tropical fruit flavor)
405	Other: UltraFlora Intensive Care
406	Device: Transcutaneous electrical nerve stimulation
407	Device: TENS machine with electrodes not emitting any impulses.
408	Drug: DFN-15
409	Drug: Pioglitazone
410	Procedure: HVPG measurement
411	Other: mucous fistula refeeding
412	Procedure: Wound closure
413	Behavioral: Mindfulness Based Stress Reduction Program
414	Procedure: Surgery after 8 weeks from chemoradiation treatment
415	Procedure: Surgery after 12 weeks from chemoradiation treatment
416	Other: PIUO Pathway
417	Combination Product: FTC/TDF and DMPA
418	Drug: FTC/TDF
419	Drug: DMPA
420	Other: Neither DMPA nor FTC/TDF
421	Drug: Rifaximin
422	Device: Osteoconductive scaffold-hamstring tendon composite repair
423	Device: Hamstring tendon-only repair
424	Other: Stimulus rich VE
425	Other: Stimulus poor VE
426	Device: Children's Automated Respiration Monitor (ChARM)
427	Diagnostic Test: Digital PET/CT scan
428	Other: Light perception
429	Other: Sound perception
430	Other: Smell perception
431	Other: Vibration perception
432	Other: Voice activation
433	Other: CAPABLE
434	Drug: letrozole
435	Other: FMD
436	Other: Enteral Dextrose Infusion
437	Other: Free Water Infusion
438	Combination Product: Apremilast and Clobetasol
439	Drug: Vitamin C
440	Other: 10-week aerobic exercise program
441	Behavioral: Women Education
442	Behavioral: Male Involvement
443	Other: Control group
444	Dietary Supplement: Magnesium Oxide Supplement
445	Behavioral: RLPT
446	Behavioral: Living Well with a Disability
447	Drug: Clazakizumab / Clazakizumab
448	Drug: Placebo / Clazakizumab
449	Device: Hövding inflatable helmet
450	Other: Needs assesment tool integrated in nursing consultation.
451	Behavioral: Cognitive Behavioral Therapy for Seizures
452	Other: Standard Medical Care
453	Drug: Axitinib Oral Tablet [Inlyta]
454	Behavioral: Game Changers
455	Device: Device-ADRCs intravenously infusion
456	Diagnostic Test: Quantitative Sensory Test1
457	Diagnostic Test: Quantitative Sensory Test 2
458	Diagnostic Test: Quantitatie Sensory Test 3
459	Device: HF-LED-RL Phototherapy
460	Device: Mock Therapy
461	Behavioral: EASE
462	Behavioral: Siempre Seguiré
463	Procedure: New ""guideline"" anesthesia strategy team
464	Drug: Icosapent Ethyl
465	Diagnostic Test: Two consecutive 15-lead ECGs
466	Behavioral: SURE program
467	Behavioral: Motivational Enhancement Therapy
468	Behavioral: Treatment as Usual
469	Diagnostic Test: Prostate cancer screening
470	Biological: Cetuximab
471	Drug: Ficlatuzumab
472	Diagnostic Test: IADPSG Criteria
473	Diagnostic Test: NDDG Criteria
474	Other: TCM physician involved collaborative care model (TCMCMC)
475	Drug: Bimatoprost Topical Solution
476	Drug: Control
477	Behavioral: Family Integrated Care
478	Drug: TRC105
479	Drug: Abiraterone
480	Behavioral: Interactive workshops LiPAT intervention group
481	Device: Wrist-worn feedback physical activity monitor
482	Device: Smartphone application LiPAT
483	Behavioral: Telephone Coaching
484	Behavioral: Workshops control group LiPAT
485	Device: mHealth remote monitoring devices
486	Procedure: Mini Gastric Bypass
487	Procedure: Roux en Y Gastric Bypass
488	Behavioral: Stand up and move more
489	Other: Nicotine free intake
490	Other: Nicotine intake
491	Other: Cessation intake
492	Drug: Abilify Maintena
493	Behavioral: Customized Adherence Enhancement (CAE)
494	Drug: Nicotine patch, oral mecamylamine, placebo
495	Device: Chlorhexidine-impregnated disk
496	Drug: Fentanyl Citrate
497	Drug: Combivent
498	Other: Propylene glycol and Glycerol intake
499	Device: Mimicking intake
500	Drug: Estradiol
501	Drug: Acetaminophen
502	Drug: placebo for acetaminophen
503	Drug: placebo for ibuprofen
504	Other: Home-Based Exercise Program
505	Device: High-flow nasal cannulae (HFNC) oxygenation
506	Device: Non-rebreather mask and standard nasal cannula
507	Device: TheraTrainer + Motiview
508	Device: TheraTrainer Only
509	Procedure: CTO PCI
510	Other: Withholding antibiotic prophylaxis
511	Behavioral: Cognitive Processing Therapy (CPT)
512	Behavioral: Accelerated Resolution Therapy (ART)
513	Behavioral: Personalized Feedback Intervention
514	Behavioral: Smoking Information Control
515	Procedure: Baby Massage
516	Device: Low-magnitude high-frequency vibration (LMHFV)
517	Procedure: Osteopathic Manipulative Treatment (OMT)
518	Behavioral: Shape training intervention
519	Behavioral: Specific word training
520	Device: Bandage contact lens
521	Other: Dry Needling
522	Device: Low-Level Laser Therapy
523	Device: Maintaining mechanical ventilation during surgery
524	Device: Absence of mechanical ventilation during surgery
525	Drug: Clobazam
526	Device: Supersonic Imagine Aixplorer SWE Ultrasound Imaging
527	Behavioral: Patient education bundle (PEB),
528	Behavioral: Nurse feedback and coaching (NFC)
529	Behavioral: Cognitive Behavioural Therapy (CBT)
530	Behavioral: Mindfulness-Based Therapy
531	Device: Epidural Stimulation
532	Biological: Stand Training
533	Device: EndoRotor Mucosal Resection System
534	Device: Continued Ablation
535	Other: CareHND
536	Drug: Pirfenidone
537	Other: Aerobic exercise and balance retraining
538	Procedure: Noninvasive electrical dyssynchrony study
539	Behavioral: Neurofeedback
540	Device: Continuous positive airway pressure (CPAP)
541	Procedure: Radiofrequency ablation
542	Behavioral: Scheduled PCP follow-up
543	Behavioral: As needed PCP follow-up
544	Behavioral: Developmental & Technological Demands
545	Behavioral: Distress Reduction
546	Behavioral: Nutrition, Set Point, & C:I Ratio
547	Behavioral: Hypoglycemia management
548	Behavioral: Minimal Intervention
549	Drug: Allopurinol 300 mg
550	Drug: Dabrafenib
551	Drug: Trametinib
552	Other: Physical rehabilitation
553	Drug: Heparin
554	Device: rTMS group
555	Drug: Topical gabapentin
556	Other: My-AHA platform
557	Behavioral: SexHealth
558	Drug: Obinutuzumab Injection [Gazyva]
559	Radiation: Low dose radiation Therapy (LDRT)
560	Device: Automatic annotation of LAT (WF-method)
561	Device: Manual annotation of LAT (M-method)
562	Drug: Eperisone
563	Dietary Supplement: Impryl
564	Device: Repetitive Transcranial Magnetic Stimulation
565	Behavioral: Physical Activity Lifestyle Intervention
566	Behavioral: Physical Activity Monitoring
567	Behavioral: Dyadic (couples-based) positive psychology intervention
568	Other: Periodized Exercise Training Regime
569	Other: Non Periodized Exercise Training Regime
570	Drug: Hydrocortisone
571	Drug: Thiamine
572	Drug: 0.9% Sodium Chloride Injection
573	Dietary Supplement: Fiber mix
574	Diagnostic Test: Cardiorespiratory monitoring
575	Device: Continuous glucose monitoring
576	Behavioral: TTM Intervention for Insulin Initiation
577	Device: Hemopatch
578	Procedure: Common Surgical Techniques
579	Behavioral: digital Cognitive Behavioral Therapy for Insomnia
580	Behavioral: face-to-face Cognitive Behavioral Therapy for Insomnia
581	Behavioral: Sleep Hygiene Education
582	Device: Real-Time Position Transponder Beacons
583	Drug: Mifepristone
584	Device: Blephasteam
585	Device: THERA°PEARL Eye Mask
586	Drug: Hylo-comod
587	Drug: Tapentadol
588	Drug: Oxycodone
589	Behavioral: UV4.me2
590	Behavioral: UV4.me
591	Behavioral: E-Pamphlet
592	Procedure: Piezocorticision
593	Procedure: Osteoperforation
594	Behavioral: Personalized Exercise Program
595	Drug: Budesonide 3Mg Capsule
596	Behavioral: sunlight exposure
597	Device: BARRX™ Anorectal Wand
598	Drug: Isoniazid 300 Mg ORAL TABLET
599	Drug: Pyridoxine 25 Mg Oral Tablet
600	Other: Specific Carbohydrate Diet (SCD)
601	Other: Modified Specific Carbohydrate Diet (MSCD)
602	Behavioral: Coaching DASH group (C-DASH)
603	Behavioral: Self-Shopping DASH group (S-DASH)
604	Drug: Rivaroxaban 10 Milligrams
605	Drug: Enoxaparin 40 Milligrams/0.4 Milliliters Prefilled Syringe
606	Device: electro-acupuncture (EA)
607	Device: sham
608	Other: Cardiac imaging and circulating biomarkers
609	Dietary Supplement: fish oil capsule
610	Dietary Supplement: soybean oil capsule
611	Procedure: RF ablation PVI alone
612	Procedure: RF ablation PVI plus LPAW
613	Drug: Ertapenem 1000 MG
614	Drug: Fosfomycin Oral Suspension
615	Drug: Gentamicin Sulfate, Injectable
616	Drug: Ceftriaxone
617	Behavioral: Resistance training
618	Device: Robotic
619	Other: Conventional therapy
620	Drug: Recombinant human tissue kallikrein
621	Drug: Exparel
622	Drug: Sodium Chloride
623	Behavioral: Occupational rehabilitation
624	Radiation: Focal radiotherapy
625	Drug: Durvalumab
626	Behavioral: cCBT intervention
627	Drug: human fetal-derived Neural Stem Cells (hNSCs)
628	Biological: Fecal Microbial Transplantation
629	Diagnostic Test: BpTRU First, Unattended Omron Second
630	Diagnostic Test: Unattended Omron First, BpTRU Second
631	Diagnostic Test: Partially Attended Omron First, Unattended Omron Second
632	Drug: 18F-Fluciclovine
633	Behavioral: Sleep hygiene practices and behavioural intervention
634	Procedure: PEEP setting based on esophageal pressure measured
635	Drug: Methotrexate
636	Drug: Sulfasalazine
637	Drug: Other DMARDs
638	Drug: Vaxchora
639	Behavioral: Usual Care
640	Behavioral: Cognitive behavioural approach
641	Behavioral: Personalised Exercise Programme
642	Procedure: Lung Protective Ventilation
643	Other: Test
644	Other: Neck strengthening exercise to prevent concussion
645	Drug: Methylprednisolone
646	Drug: Isotonic saline
647	Drug: Sugammadex Injection [Bridion]
648	Drug: Neostigmine+Glycopyrronium
649	Behavioral: Handbook condition
650	Behavioral: Handbook plus condition
651	Device: hemoperfusion combined with hemodialysis
652	Device: hemodialysis
653	Behavioral: Coach2Move
654	Drug: Levodopa
655	Procedure: Open Reduction and Internal Fixation
656	Device: ZNN CM Asia
657	Device: Anterior Support Screw
658	Drug: PRO-122
659	Drug: Timolol eye drops
660	Drug: Dorzolamide-Timolol Ophthalmic
661	Drug: Brimonidine Ophthalmic Solution
662	Other: Placebo1
663	Other: Placebo 2
664	Drug: Krytantek
665	Diagnostic Test: UltraPro
666	Diagnostic Test: Procalcitonin
667	Diagnostic Test: Blood sampling
668	Diagnostic Test: Naso-pharyngeal swab and sputum culture
669	Behavioral: GMT intervention
670	Device: Chest tube placement
671	Drug: Omega 3 fatty acid
672	Drug: Placebo oil
673	Drug: Escitalopram Pill
674	Drug: Levomilnacipran Pill
675	Diagnostic Test: V/Q imaging
676	Diagnostic Test: Computed tomography scan
677	Drug: Palbociclib
678	Behavioral: PACT Intensive Management
679	Drug: Relatlimab
680	Drug: Carboplatin
681	Drug: Paclitaxel
682	Radiation: Radiation
683	Device: Dual-monitoring
684	Device: Epidural Spinal Cord Stimulation
685	Device: Fidmi enhanced enteral feeding device
686	Other: Best Practice Clinic-Based Care
687	Other: Telehealth Care
688	Drug: PARTICS using QVAR
689	Device: Foley catheter filled to 80cc
690	Drug: prostaglandin of the clinician's choice
691	Procedure: Forced Air warmer
692	Procedure: Intravenous Fluid Warmer
693	Other: Duplex ultrasound surveillance
694	Other: No ultrasound surveillance
695	Drug: Subcut. + Subconj. Xylocaine
696	Drug: Subcut. + Sham Subconj. Injection
697	Procedure: Blepharoptosis Repair
698	Behavioral: Practice Self-Regulation
699	Behavioral: Therapy Practice Group
700	Other: risk factors
701	Other: self-care
702	Other: nutrition
703	Other: lifestyle
704	Other: psychosocial needs
705	Other: Nurse-led clinic
706	Behavioral: Expressive writing
707	Behavioral: Control writing
708	Other: Knowledge Translation of labor management guidelines
709	Drug: Propranolol
710	Device: Magnetic Resonance Imaging (MRI)
711	Drug: AAV2-hAADC
712	Drug: artificial tears
713	Drug: Memantine
714	Device: Magnetic Resonance Imaging
715	Other: Active TB case finding
716	Procedure: Sentinel node procedure
717	Behavioral: FRIENDS for Life
718	Behavioral: Adapted FRIENDS
719	Behavioral: Train-the-Trainer
720	Behavioral: Train-the-Trainer Plus
721	Drug: Digoxin (monotherapy)
722	Drug: Sotalol (monotherapy)
723	Drug: Flecainide (monotherapy)
724	Drug: Digoxin (dual therapy)
725	Drug: Sotalol (dual therapy)
726	Drug: Flecainide (dual therapy)
727	Drug: MEK162 and mFOLFIRI
728	Drug: recombinant von Willebrand factor
729	Drug: tranexamic acid
730	Drug: mirabegron
731	Procedure: Echocardiography
732	Procedure: Cardiac MRI
733	Procedure: Maximal exercise capacity
734	Procedure: Blood sampling
735	Procedure: Endothelial function measurement
736	Radiation: 18FDG-PET
737	Other: Collaborative Model of Primary care and Subspecialty care
738	Other: Crowded HOTV Acuity Test
739	Other: Preschool Randot Stereoacuity Test
740	Device: Plusoptix Autorefractor
741	Other: Comprehensive Eye Exam
742	Device: Standard High Resolution Microendoscope and/or Line-Scanning Confocal High Resolution Microendoscope
743	Drug: rhTSH
744	Drug: Ipilimumab
745	Drug: Allopurinol
746	Biological: autologous skin fibroblasts
747	Drug: Vasopressin - Very Low Dose
748	Drug: Vasopressin - Low Dose
749	Drug: Placebo Comparator
750	Combination Product: Emergency preservation and resuscitation
751	Other: Standard resuscitation
752	Procedure: Formal Operative Treatment
753	Procedure: Emergency Department Treatment
754	Drug: Tyrosine kinase inhibitor
755	Other: Imagery Rescripting
756	Dietary Supplement: nicotinamide riboside
757	Drug: Hydroxyprogesterone 250 Mg
758	Drug: hydroxyprogesterone 500mg
759	Drug: Hydroxychloroquine
760	Drug: Darbepoetin Alfa
761	Other: Chest Physiotherapy
762	Other: Surveillance
763	Other: Standard of Care
764	Other: Village-based ART refill
765	Other: Anti-inflammatory Diet
766	Dietary Supplement: N-acetyl Cysteine
767	Drug: Magnesium Sulfate
768	Drug: Pabrinex
769	Drug: Progesterone
770	Device: Mirena®
771	Drug: GnRH agonist
772	Device: Intraoral tongue stimulator (Snoozeal)
773	Radiation: Hypofractionated IMRT using helical Tomotherapy.
774	Other: Dietary counseling and DHA dietary increase in breastfeeding mothers
775	Diagnostic Test: 3-D CT scanning
776	Device: sipIT tools
777	Diagnostic Test: Retrospective evaluation of endoscopy prior to study drug
778	Other: Symptom Survey
779	Other: Medication Compliance Phone Call
780	Diagnostic Test: Endoscopy while on study drug
781	Drug: Fluticasone
782	Drug: Omeprazole
783	Drug: Oxygen gas
784	Drug: 2nd generation ADT (abiraterone or enzalutamide)
785	Other: Daily
786	Other: Purifying the air with a Pure Airbox device (Zonair 3D)
787	Other: Using a sham air purifier (same device without filters)
788	Drug: Odontopaste®
789	Drug: Pulpdent
790	Drug: Amoxicillin
791	Other: Alginate dressings
792	Other: Simple gauze dressings
793	Diagnostic Test: LAMP
794	Diagnostic Test: Microscopy
795	Behavioral: ACT Workshop for Emotional Eating
796	Drug: Docetaxel
797	Radiation: Radium 223
798	Drug: Teriparatide Pen Injector
799	Drug: Zoledronic Acid
800	Device: Noninvasive spinal stimulation with gait training
801	Behavioral: Expedition
802	Other: DNA-based dietary intervention
803	Other: DNA-based dietary intervention using an app
804	Other: Control arm
805	Dietary Supplement: Milk-based protein matrix (MBPM)
806	Dietary Supplement: Habitual dietary behaviour
807	Diagnostic Test: Dry electrode EEG
808	Device: Transcranial magnetic stimulation task
809	Device: Sham transcranial magnetic stimulation task
810	Behavioral: peer-led theory-based intervention group
811	Drug: Ciprofloxacin
812	Other: Electrocochleography
813	Dietary Supplement: Fat
814	Dietary Supplement: Fasting
815	Dietary Supplement: Fat+Glucose
816	Dietary Supplement: Glucose
817	Dietary Supplement: Fat+Fructose
818	Dietary Supplement: Fructose
819	Drug: Apixaban
820	Behavioral: Best Possible Self
821	Drug: Nitric Oxide
822	Device: MWA
823	Radiation: SBRT
824	Other: Oral Immunotherapy
825	Dietary Supplement: Hindmilk
826	Behavioral: E-intervention
827	Behavioral: Headspace - Meditation and Mindfulness App
828	Behavioral: Stop, Breathe, & Think - Meditation and Mindfulness App
829	Device: Leva
830	Device: PFDx
831	Other: Intestinal lavage with normal saline
832	Device: Cooled radiofrequency ablation
833	Behavioral: Live Music Therapy
834	Behavioral: Recorded Music Therapy
835	Drug: Gabapentin
836	Device: Smartphone App
837	Combination Product: Control Group
838	Diagnostic Test: Penile cuff test
839	Other: Intravenous lipid emulsion
840	Procedure: PEAF
841	Behavioral: Opioid-specific educational patient pamphlets
842	Dietary Supplement: Nutrient support to HIIT
843	Other: treatment1
844	Other: treatment2
845	Other: treatment3
846	Other: treatment4
847	Other: treatment5
848	Drug: Celebrex
849	Procedure: Corin Optimised Positioning System
850	Procedure: Standard templating
851	Behavioral: collaborative care
852	Behavioral: psychiatry involvement
853	Behavioral: Active comparator: Human interpreter
854	Behavioral: Intervention: Asynchronous Telepsychiatry
855	Behavioral: COACH (Communicating about Choices in Transplantation)
856	Device: Holmium:YAG laser
857	Behavioral: Training Plus
858	Behavioral: Training Only
859	Behavioral: No Inputs then Community development and training
860	Drug: bictegravir/emtricitabine/tenofovir alafenamide
861	Drug: HLX06
862	Drug: Ibudilast
863	Behavioral: F-SPS+UC
864	Behavioral: EUC
865	Behavioral: CRGT
866	Behavioral: HIV group therapy
867	Behavioral: Decision Aid
868	Device: Peripherally Inserted Central Venous Cather (PICC)
869	Procedure: Strict Glycemic Control Group
870	Procedure: Standard Glycemic Control Group
871	Device: Optical Coherence Tomography
872	Other: Compassion-Focused Therapy
873	Device: fractional radiofrequency
874	Diagnostic Test: Carotid Stenotic Scan (CSS)
875	Device: Immunochromatographic lateral flow test
876	Drug: Vancomycin
877	Behavioral: Exposure Therapy
878	Other: NICHE method
879	Drug: Amlodipine
880	Drug: Lisinopril
881	Drug: Hydrochlorothiazide
882	Other: Discharge Order Set (DOS)
883	Other: Enhanced Standard Care (ESC)
884	Other: Shifts working hours with different schedules
885	Device: BIS monitor
886	Device: Ramsay scale
887	Behavioral: Hydroxyurea SDM Toolkit
888	Behavioral: Clinician Pocket Guide
889	Other: Family-oriented primary cardiovascular prevention
890	Device: Impella-CP LV Vent
891	Other: intestinal microbiota transplant
892	Drug: Antiviral Agents
893	Dietary Supplement: Water
894	Behavioral: general life style advice
895	Drug: Eplerenone 50 Mg Tab
896	Other: E-Talkcare
897	Other: GLA:D Canada Program
898	Other: JointEffort Program
899	Behavioral: Wake and Light Therapy
900	Behavioral: Sleep and Light Therapy
901	Device: Coil
902	Diagnostic Test: Digital PET/CT imaging
903	Other: Prophylactic advance wound dressing
904	Other: Prophylactic conventional wound dressing
905	Biological: probiotics
906	Biological: placebo
907	Other: Rose oil
908	Other: Almond Oil
909	Device: Enjoy Your Bump
910	Diagnostic Test: Cuff Leak Test
911	Behavioral: Pain Management Patient Education Video
912	Behavioral: Wound Care Patient Education Video
913	Device: Regular balloon
914	Device: DCB (paclitaxel-coated balloon)
915	Drug: Weekly Ferrous Sulfate
916	Drug: Daily Ferrous Sulfate
917	Drug: Acetyl cysteine
918	Device: Phantom Stimulator, Cort X Sensorics, Spaichingen, Germany
919	Diagnostic Test: 30-day ambulatory cardiac event monitor
920	Other: Bone Marrow Concentrate
921	Behavioral: Episodic Future Thinking (EFT)
922	Behavioral: Episodic Recent Thinking (ERT)
923	Procedure: Position during colonoscopy
924	Drug: Metoclopramide 5 MG/ML Injectable Solution
925	Drug: Saline
926	Other: SPARK intervention
927	Drug: RET using antibiotics (Ciprofloxacin and Metronidazole)
928	Drug: RET using non-setting Calcium Hydroxide
929	Behavioral: Exercise and Meditation
930	Procedure: Re-Suspension of the temporal muscle after a craniotomy.
931	Procedure: Traditional re-suspension of the temporal muscle
932	Diagnostic Test: 2-stage screen
933	Behavioral: Cognitive Behavioral Therapy for individuals with TBI
934	Other: Waitlist Control
935	Drug: Cholestyramine Powder 4g
936	Drug: Prednisolone
937	Drug: Standard treatment
938	Other: Brief information group
939	Behavioral: Resourcefulness Training
940	Procedure: Ligation and Hemorrhoidopexy
941	Procedure: Ultrasound Guided Ligation of Hemorrhoidal Arteries
942	Dietary Supplement: CONTROL
943	Dietary Supplement: Whey Protein Concentrate
944	Dietary Supplement: Whey Protein Hydrolysate
945	Other: Descemet Membrane Transplantation
946	Device: Expanded Hemodialysis
947	Device: Online Hemodiafiltration
948	Device: Mindfulness
949	Behavioral: Lactate clearance 10% target group
950	Behavioral: Lactate clearance 20% target group
951	Behavioral: Standard EGDT group
952	Drug: Riboflavin 5'-Phosphate
953	Procedure: Incremental haemodialysis
954	Procedure: Conventional haemodialysis
955	Other: Enhanced Intravenous Nutrition
956	Other: Standard Intravenous Nutrition
957	Drug: Naloxegol 25 MG
958	Procedure: sonoHSG
959	Other: Early cognitive-communication therapy
960	Behavioral: Support Person Intervention
961	Drug: Warfarin
962	Drug: Apixaban 2.5 MG
963	Drug: Rivaroxaban 10 MG
964	Procedure: Percutaneous needle fasciotomy
965	Drug: Collagenase Clostridium Histolyticum 2.9 MG/ML [Xiaflex]
966	Procedure: Limited fasciectomy
967	Behavioral: Early OGTT
968	Behavioral: Late OGTT
969	Biological: Ex-vivo cultivated limbal stem cell pool
970	Other: 24-hour inpatient intervention
971	Drug: Gemtuzumab ozogamicin
972	Drug: Liposomal daunorubicin
973	Drug: Mitoxantrone
974	Drug: Cytarabine
975	Drug: Busulfan
976	Drug: Cyclophosphamide
977	Diagnostic Test: Contrast Enhanced Spectral Mammogram
978	Other: GOS trap and dengue NS1 antigen kit
979	Behavioral: ACTr (Acceptance and Commitment Training)
980	Device: Helmet
981	Behavioral: Intervention (Promotora)
982	Behavioral: RealConsent
983	Behavioral: Stress and Mood Management
984	Behavioral: SIBS Program
985	Behavioral: Interactive computer-based intervention
986	Radiation: Intensity Modulated Radiotherapy
987	Procedure: Surgery alone
988	Procedure: No dural tenting techniques
989	Procedure: Dural tenting techniques
990	Drug: Zolpidem
991	Other: intestinal microbiota transplantation
992	Dietary Supplement: Juice
993	Behavioral: Caloric restriction via Plant-based meals
994	Dietary Supplement: Plant-based meal
995	Device: Active tDCS
996	Device: Sham tDCS
997	Drug: Proflavine, high resolution imaging
998	Behavioral: Cash Gift Payments
999	Drug: Xtampza ER (oxycodone)
1000	Drug: Venlafaxine hydrochloride capsules
1001	Drug: Bupivacaine Liposome Injection
1002	Drug: Bupivacaine
1003	Procedure: TQL
1004	Procedure: FIB
1005	Other: Oral immunotherapy
1006	Behavioral: Experimental
1007	Other: Continuous intrathecal prognostic infusion test
1008	Dietary Supplement: Strawberry powder
1009	Dietary Supplement: Placebo powder
1010	Other: Visual pedagogy (social stories)
1011	Other: Conventional leaflets
1012	Other: Nature video
1013	Device: Human Intravital Microscopy
1014	Diagnostic Test: hsRDT
1015	Behavioral: Education and Behavior
1016	Behavioral: DTP
1017	Behavioral: ICM
1018	Behavioral: Advanced Control
1019	Behavioral: Culturally-Adapted Decision Support Navigation Intervention
1020	Behavioral: SMASH
1021	Behavioral: Enhanced SC
1022	Procedure: EUS
1023	Procedure: FNA with ROSE
1024	Procedure: FNB alone
1025	Other: Intestinal Microbiota Transplantation
1026	Drug: Ascorbic Acid
1027	Drug: Sodium Chloride 0.9%
1028	Other: OCT Mapped
1029	Procedure: Group 1
1030	Procedure: Group 2
1031	Behavioral: Endurance Exercise Training (END)
1032	Behavioral: Sprint Exercise Training (SIT)
1033	Behavioral: Combined Endurance-Sprint Exercise Training (COMB)
1034	Procedure: Ultrasound guided nerve blocks
1035	Procedure: Hematoma Block
1036	Drug: triple therapy
1037	Drug: sequential therapy
1038	Drug: bismuth quadruple therapy
1039	Drug: concomitant therapy
1040	Procedure: Variable-PS
1041	Procedure: SPN-CPAP/PS
1042	Drug: Anti-HBV antiviral prophylaxis
1043	Dietary Supplement: LUTEIN ofta 0,5 gocce
1044	Device: Biventricular pacemaker
1045	Dietary Supplement: PLACEBO
1046	Dietary Supplement: MBPM
1047	Drug: Picato
1048	Dietary Supplement: Dark chocolate
1049	Dietary Supplement: Milk Chocolate
1050	Other: Commercially available cigarette
1051	Drug: Corticotropin 80Unit/Ml Repository Injection
1052	Behavioral: Commercial Weight Loss Program
1053	Drug: Buxue Yimu Pills
1054	Drug: Buxue Yimu Pills &Ferrous Sulfate
1055	Drug: Ferrous Sulfate
1056	Drug: Aflibercept
1057	Device: PrimeAdvanced Surescan 97702 Neurostimulator - Medtronic (Minneapolis, MN)
1058	Behavioral: eHealth Familias Unidas Primary Care
1059	Drug: Dasatinib
1060	Drug: Blinatumomab
1061	Drug: Ferinject or CosmoFer
1062	Drug: Simvastatin
1063	Drug: Buprenorphine/naloxone
1064	Drug: Buprenorphine
1065	Other: Arts-based intervention
1066	Behavioral: Patient-led follow-up
1067	Other: Standard follow-up
1068	Drug: Morphine
1069	Other: Combined - PAD and CAD
1070	Device: Prosthetic socket for transtibial amputee
1071	Drug: Simvastatin 40mg
1072	Drug: Ezetimibe/simvastatin 10/20 mg/day
1073	Drug: Ezetimibe/simvastatin 10/40 mg/day
1074	Biological: EV71 (inoculation vaccine)
1075	Other: Interdisciplinary Evaluation for Nonarthritic Hip Disease
1076	Other: Posture and Movement Training
1077	Other: Treatment-of-choice
1078	Other: Resistance exercise training
1079	Device: Electro Flo Percussor, Model 5000
1080	Behavioral: Active Jaw Exercise with Relaxation
1081	Behavioral: Active Tongue Exercise
1082	Behavioral: Active Tongue Exercise + Mental Practice
1083	Behavioral: Mental Practice Tongue Exercise
1084	Behavioral: Integrated Online CBT and MI
1085	Behavioral: Safety behaviour promoting video
1086	Behavioral: Control video
1087	Dietary Supplement: TLC
1088	Drug: metformin
1089	Drug: Compound Zhenzhu Tiaozhi capsule
1090	Behavioral: TAU plus Cognitive Remediation Program
1091	Behavioral: TAU plus Control Tasks
1092	Dietary Supplement: High-fat diet
1093	Behavioral: Metronome-timed speech
1094	Behavioral: PPFP Clinical and Counseling Skills
1095	Behavioral: Facility-Level Leadership Management and Governance Training
1096	Behavioral: Rise - Treatment Education
1097	Device: eye patch
1098	Device: dichoptic treatment
1099	Behavioral: Brief motivational interview intervention
1100	Drug: Atorvastatin 20mg
1101	Other: Exercises
1102	Other: Computerized Talking Touchscreen
1103	Behavioral: Step 1: PA Monitor
1104	Behavioral: Step 1: PA Monitor + Text
1105	Behavioral: Step 2: PA Monitor with Calls
1106	Behavioral: Step 2: PA Monitor with Meetings
1107	Behavioral: Step 2: PA Monitor + Texts with Calls
1108	Behavioral: Step 2: PA Monitor + Texts with Meetings
1109	Behavioral: Step 3: PA Monitor
1110	Drug: N-Acetylcysteine
1111	Other: Guided mindfulness meditation
1112	Other: Tuned Vibroacoustic Stimulation (TVS)
1113	Dietary Supplement: Florababy
1114	Other: BCE Combination group
1115	Drug: liposomal bupivacaine
1116	Behavioral: Two-point discrimination training
1117	Behavioral: One-point discrimination training
1118	Other: WAT
1119	Behavioral: Decision Support Intervention (DSI)
1120	Drug: Vitamin K 1
1121	Drug: normal saline
1122	Device: Hypothermia
1123	Device: Standard of Care
1124	Procedure: Remote ischemic conditioning
1125	Procedure: No Remote ischemic conditioning
1126	Other: Pre-operative education
1127	Other: Pos-operative rehabilitation
1128	Other: Combination Therapy
1129	Other: Standard Care Intervention
1130	Behavioral: Taking It to the Pews (Comparison)
1131	Behavioral: Taking It to the Pews (Experimental)
1132	Drug: Tranexamic Acid 1000 mg/10ml normal saline infusion
1133	Other: Sugar-sweetened beverage (SSB)
1134	Other: Non-nutritive sweetened beverages (NSB)
1135	Other: Water
1136	Behavioral: Introvision: mental and emotional self-regulation
1137	Other: Ideal Body Weight First
1138	Other: Actual Body Weight First
\.


--
-- Data for Name: interxref; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.interxref (nct_inter_id, nct_number, inter_id) FROM stdin;
1	NCT03769298	1
2	NCT03653546	2
3	NCT03653546	3
4	NCT03653546	4
5	NCT03641209	5
6	NCT03641209	6
7	NCT03601000	7
8	NCT03601000	8
9	NCT03498196	9
10	NCT03453255	10
11	NCT03420976	11
12	NCT03395288	12
13	NCT03361345	13
14	NCT03361345	14
15	NCT03354611	15
16	NCT03354611	16
17	NCT03334175	17
18	NCT03317327	18
19	NCT03317327	19
20	NCT03262961	20
21	NCT03262961	21
22	NCT03227731	22
23	NCT02786836	23
24	NCT01203722	24
25	NCT01203722	25
26	NCT01203722	26
27	NCT01203722	27
28	NCT01203722	28
29	NCT01203722	29
30	NCT01203722	30
31	NCT01203722	31
32	NCT03837717	32
33	NCT03837717	33
34	NCT03837717	34
35	NCT03836508	35
36	NCT03836508	36
37	NCT03833596	37
38	NCT03833596	38
39	NCT03833531	39
40	NCT03833531	40
41	NCT03833453	41
42	NCT03833453	42
43	NCT03832712	43
44	NCT03832712	44
45	NCT03832530	45
46	NCT03830190	46
47	NCT03830008	47
48	NCT03829748	48
49	NCT03828721	49
50	NCT03828721	50
51	NCT03827915	51
52	NCT03825146	52
53	NCT03823456	53
54	NCT03823456	54
55	NCT03818867	55
56	NCT03817489	56
57	NCT03817489	57
58	NCT03814577	58
59	NCT03814577	59
60	NCT03814577	60
61	NCT03814577	61
62	NCT03814330	62
63	NCT03814330	63
64	NCT03814330	64
65	NCT03814330	65
66	NCT03813992	66
67	NCT03813381	67
68	NCT03813069	68
69	NCT03813069	69
70	NCT03813069	70
71	NCT03809286	71
72	NCT03809286	72
73	NCT03809286	73
74	NCT03807986	74
75	NCT03807986	75
76	NCT03807986	76
77	NCT03801772	77
78	NCT03799328	78
79	NCT03798483	79
80	NCT03796923	80
81	NCT03796923	81
82	NCT03796923	82
83	NCT03796923	83
84	NCT03796793	84
85	NCT03795675	85
86	NCT03791697	86
87	NCT03790449	87
88	NCT03790449	88
89	NCT03786432	89
90	NCT03783767	90
91	NCT03783312	91
92	NCT03783312	92
93	NCT03783312	93
94	NCT03783299	94
95	NCT03783299	95
96	NCT03783299	96
97	NCT03782974	97
98	NCT03781050	98
99	NCT03778580	99
100	NCT03773575	100
101	NCT03771495	101
102	NCT03771495	102
103	NCT03771430	103
104	NCT03771430	104
105	NCT03770962	105
106	NCT03770507	106
107	NCT03761732	107
108	NCT03753932	108
109	NCT03753243	109
110	NCT03753243	110
111	NCT03751878	111
112	NCT03751878	112
113	NCT03749655	113
114	NCT03748914	114
115	NCT03748914	115
116	NCT03747887	116
117	NCT03747887	117
118	NCT03745209	118
119	NCT03743480	119
120	NCT03740659	120
121	NCT03740659	121
122	NCT03740659	122
123	NCT03740321	123
124	NCT03739528	124
125	NCT03739528	125
126	NCT03737227	126
127	NCT03736382	127
128	NCT03736382	128
129	NCT03736382	129
130	NCT03730454	130
131	NCT03730454	131
132	NCT03729687	132
133	NCT03729648	133
134	NCT03729297	134
135	NCT03727321	135
136	NCT03727321	136
137	NCT03727321	137
138	NCT03725215	138
139	NCT03724383	139
140	NCT03724383	140
141	NCT03724383	141
142	NCT03724383	142
143	NCT03724383	143
144	NCT03723525	144
145	NCT03723525	145
146	NCT03719235	146
147	NCT03714139	147
148	NCT03714139	148
149	NCT03711630	149
150	NCT03711370	150
151	NCT03711370	151
152	NCT03709979	152
153	NCT03704415	153
154	NCT03704415	154
155	NCT03704064	155
156	NCT03704064	156
157	NCT03704051	157
158	NCT03699059	158
159	NCT03697837	159
160	NCT03695003	160
161	NCT03695003	161
162	NCT03690154	162
163	NCT03689348	163
164	NCT03689049	164
165	NCT03689049	165
166	NCT03687411	166
167	NCT03685227	167
168	NCT03682601	168
169	NCT03680833	169
170	NCT03679689	170
171	NCT03678935	171
172	NCT03675009	172
173	NCT03674996	173
174	NCT03674996	174
175	NCT03674996	175
176	NCT03668873	176
177	NCT03668873	177
178	NCT03667755	178
179	NCT03667001	179
180	NCT03667001	180
181	NCT03663075	181
182	NCT03663075	182
183	NCT03658434	183
184	NCT03654508	184
185	NCT03654508	185
186	NCT03648437	186
187	NCT03648437	187
188	NCT03648437	188
189	NCT03648060	189
190	NCT03648047	190
191	NCT03648047	191
192	NCT03648047	192
193	NCT03647007	193
194	NCT03646357	194
195	NCT03646357	195
196	NCT03646240	196
197	NCT03645603	197
198	NCT03645005	198
199	NCT03645005	199
200	NCT03642769	200
201	NCT03638609	201
202	NCT03632837	202
203	NCT03630770	203
204	NCT03630328	204
205	NCT03628001	205
206	NCT03625544	206
207	NCT03625544	207
208	NCT03625544	208
209	NCT03623880	209
210	NCT03623880	210
211	NCT03620942	211
212	NCT03620942	212
213	NCT03620942	213
214	NCT03620942	214
215	NCT03619720	215
216	NCT03618108	216
217	NCT03618108	217
218	NCT03618108	218
219	NCT03618108	219
220	NCT03618017	220
221	NCT03618017	221
222	NCT03615586	222
223	NCT03615586	223
224	NCT03602768	224
225	NCT03602768	225
226	NCT03602768	226
227	NCT03602677	227
228	NCT03602014	228
229	NCT03600987	229
230	NCT03600987	230
231	NCT03600987	231
232	NCT03598114	232
233	NCT03593889	233
234	NCT03593889	234
235	NCT03593148	235
236	NCT03591237	236
237	NCT03585920	237
238	NCT03585192	238
239	NCT03585192	239
240	NCT03582046	240
241	NCT03579303	241
242	NCT03578848	242
243	NCT03578848	243
244	NCT03578848	244
245	NCT03578432	245
246	NCT03578432	246
247	NCT03578432	247
248	NCT03577301	248
249	NCT03577301	249
250	NCT03577106	250
251	NCT03577054	251
252	NCT03577054	252
253	NCT03575026	253
254	NCT03575026	254
255	NCT03568812	255
256	NCT03567031	256
257	NCT03567018	257
258	NCT03565354	258
259	NCT03564665	259
260	NCT03562546	260
261	NCT03561961	261
262	NCT03561961	262
263	NCT03561103	263
264	NCT03559751	264
265	NCT03559751	265
266	NCT03559751	266
267	NCT03559179	267
268	NCT03558763	268
269	NCT03558763	269
270	NCT03555500	270
271	NCT03553927	271
272	NCT03553927	272
273	NCT03553004	273
274	NCT03552523	274
275	NCT03552523	275
276	NCT03550885	276
277	NCT03550885	277
278	NCT03543098	278
279	NCT03543098	279
280	NCT03543098	280
281	NCT03543098	281
282	NCT03542383	282
283	NCT03542383	283
284	NCT03541291	284
285	NCT03540732	285
286	NCT03540732	286
287	NCT03540368	287
288	NCT03540134	288
289	NCT03540069	289
290	NCT03538730	290
291	NCT03538379	291
292	NCT03537612	292
293	NCT03537612	293
294	NCT03535675	294
295	NCT03535675	295
296	NCT03534362	296
297	NCT03534362	297
298	NCT03527927	298
299	NCT03527849	299
300	NCT03527849	300
301	NCT03527121	301
302	NCT03527121	302
303	NCT03526068	303
304	NCT03526042	304
305	NCT03526042	305
306	NCT03524703	306
307	NCT03523806	307
308	NCT03523299	308
309	NCT03521960	309
310	NCT03519750	310
311	NCT03519659	311
312	NCT03519659	312
313	NCT03519659	313
314	NCT03519659	314
315	NCT03519659	315
316	NCT03518216	316
317	NCT03517397	317
318	NCT03516877	318
319	NCT03513822	319
320	NCT03513822	320
321	NCT03512691	321
322	NCT03512691	322
323	NCT03510195	323
324	NCT03508921	324
325	NCT03508921	325
326	NCT03508921	326
327	NCT03508908	327
328	NCT03507647	328
329	NCT03503721	329
330	NCT03503721	330
331	NCT03503162	331
332	NCT03502655	332
333	NCT03502655	333
334	NCT03502655	334
335	NCT03502655	335
336	NCT03502252	336
337	NCT03501316	337
338	NCT03501316	338
339	NCT03500419	339
340	NCT03500406	340
341	NCT03500367	341
342	NCT03496948	342
343	NCT03495791	343
344	NCT03495752	344
345	NCT03495661	345
346	NCT03495518	346
347	NCT03495518	347
348	NCT03495089	348
349	NCT03495089	349
350	NCT03494816	350
351	NCT03494335	351
352	NCT03494205	352
353	NCT03494205	353
354	NCT03492476	354
355	NCT03492476	355
356	NCT03491059	356
357	NCT03491059	357
358	NCT03491046	358
359	NCT03491046	359
360	NCT03490812	360
361	NCT03490812	361
362	NCT03490656	362
363	NCT03490656	363
364	NCT03489395	364
365	NCT03488511	365
366	NCT03487718	366
367	NCT03487718	367
368	NCT03486444	368
369	NCT03486444	369
370	NCT03486106	370
371	NCT03486106	371
372	NCT03486106	372
373	NCT03484533	373
374	NCT03484533	374
375	NCT03484338	375
376	NCT03484273	376
377	NCT03483935	377
378	NCT03482908	378
379	NCT03482908	379
380	NCT03482908	380
381	NCT03481023	381
382	NCT03481023	382
383	NCT03479697	383
384	NCT03479697	384
385	NCT03478163	385
386	NCT03478163	386
387	NCT03478137	387
388	NCT03477500	388
389	NCT03477500	389
390	NCT03477045	390
391	NCT03477045	391
392	NCT03477045	392
393	NCT03477045	393
394	NCT03473899	394
395	NCT03473899	395
396	NCT03473665	396
397	NCT03473665	397
398	NCT03473665	398
399	NCT03473665	399
400	NCT03472820	400
401	NCT03472820	401
402	NCT03472820	402
403	NCT03472820	403
404	NCT03472820	404
405	NCT03472820	405
406	NCT03472430	406
407	NCT03472430	407
408	NCT03472378	408
409	NCT03471117	409
410	NCT03470389	410
411	NCT03469609	411
412	NCT03468621	412
413	NCT03466164	413
414	NCT03465982	414
415	NCT03465982	415
416	NCT03464773	416
417	NCT03464266	417
418	NCT03464266	418
419	NCT03464266	419
420	NCT03464266	420
421	NCT03462966	421
422	NCT03462823	422
423	NCT03462823	423
424	NCT03459014	424
425	NCT03459014	425
426	NCT03457519	426
427	NCT03457506	427
428	NCT03456895	428
429	NCT03456895	429
430	NCT03456895	430
431	NCT03456895	431
432	NCT03456895	432
433	NCT03456128	433
434	NCT03455426	434
435	NCT03454282	435
436	NCT03454087	436
437	NCT03454087	437
438	NCT03453190	438
439	NCT03451266	439
440	NCT03450655	440
441	NCT03450564	441
442	NCT03450564	442
443	NCT03450564	443
444	NCT03449693	444
445	NCT03448289	445
446	NCT03447119	446
447	NCT03444103	447
448	NCT03444103	448
449	NCT03443388	449
450	NCT03443258	450
451	NCT03441867	451
452	NCT03441867	452
453	NCT03438708	453
454	NCT03435497	454
455	NCT03435172	455
456	NCT03434392	456
457	NCT03434392	457
458	NCT03434392	458
459	NCT03433222	459
460	NCT03433222	460
461	NCT03432832	461
462	NCT03432819	462
463	NCT03429010	463
464	NCT03428477	464
465	NCT03426436	465
466	NCT03425890	466
467	NCT03423394	467
468	NCT03423394	468
469	NCT03423303	469
470	NCT03422536	470
471	NCT03422536	471
472	NCT03421262	472
473	NCT03421262	473
474	NCT03420404	474
475	NCT03419715	475
476	NCT03419715	476
477	NCT03418870	477
478	NCT03418324	478
479	NCT03418324	479
480	NCT03415880	480
481	NCT03415880	481
482	NCT03415880	482
483	NCT03415880	483
484	NCT03415880	484
485	NCT03415841	485
486	NCT03412149	486
487	NCT03412149	487
488	NCT03412084	488
489	NCT03410511	489
490	NCT03410511	490
491	NCT03410511	491
492	NCT03408873	492
493	NCT03408873	493
494	NCT03408574	494
495	NCT03406520	495
496	NCT03405090	496
497	NCT03405090	497
498	NCT03404011	498
499	NCT03404011	499
500	NCT03401047	500
501	NCT03399318	501
502	NCT03399318	502
503	NCT03399318	503
504	NCT03397030	504
505	NCT03396094	505
506	NCT03396094	506
507	NCT03394599	507
508	NCT03394599	508
509	NCT03392415	509
510	NCT03386227	510
511	NCT03384706	511
512	NCT03384706	512
513	NCT03382093	513
514	NCT03382093	514
515	NCT03381027	515
516	NCT03380884	516
517	NCT03380013	517
518	NCT03379818	518
519	NCT03379818	519
520	NCT03375879	520
521	NCT03375229	521
522	NCT03375229	522
523	NCT03372174	523
524	NCT03372174	524
525	NCT03371836	525
526	NCT03369600	526
527	NCT03367364	527
528	NCT03367364	528
529	NCT03365518	529
530	NCT03365518	530
531	NCT03364660	531
532	NCT03364660	532
533	NCT03364114	533
534	NCT03364114	534
535	NCT03362983	535
536	NCT03359863	536
537	NCT03357042	537
538	NCT03356652	538
539	NCT03356210	539
540	NCT03356106	540
541	NCT03355456	541
542	NCT03354325	542
543	NCT03354325	543
544	NCT03354286	544
545	NCT03354286	545
546	NCT03354286	546
547	NCT03354286	547
548	NCT03354286	548
549	NCT03353298	549
550	NCT03352947	550
551	NCT03352947	551
552	NCT03350737	552
553	NCT03350737	553
554	NCT03348761	554
555	NCT03346668	555
556	NCT03342976	556
557	NCT03341975	557
558	NCT03341520	558
559	NCT03341520	559
560	NCT03340922	560
561	NCT03340922	561
562	NCT03337607	562
563	NCT03337360	563
564	NCT03336879	564
565	NCT03335475	565
566	NCT03335475	566
567	NCT03335358	567
568	NCT03335319	568
569	NCT03335319	569
570	NCT03335124	570
571	NCT03335124	571
572	NCT03335124	572
573	NCT03334643	573
574	NCT03333174	574
575	NCT03326232	575
576	NCT03324451	576
577	NCT03323359	577
578	NCT03323359	578
579	NCT03322774	579
580	NCT03322774	580
581	NCT03322774	581
582	NCT03322072	582
583	NCT03320057	583
584	NCT03318874	584
585	NCT03318874	585
586	NCT03318874	586
587	NCT03314792	587
588	NCT03314792	588
589	NCT03313492	589
590	NCT03313492	590
591	NCT03313492	591
592	NCT03308851	592
593	NCT03308851	593
594	NCT03306992	594
595	NCT03304626	595
596	NCT03304301	596
597	NCT03302858	597
598	NCT03302299	598
599	NCT03302299	599
600	NCT03301311	600
601	NCT03301311	601
602	NCT03299816	602
603	NCT03299816	603
604	NCT03299296	604
605	NCT03299296	605
606	NCT03297658	606
607	NCT03297658	607
608	NCT03297346	608
609	NCT03295708	609
610	NCT03295708	610
611	NCT03295422	611
612	NCT03295422	612
613	NCT03294395	613
614	NCT03294395	614
615	NCT03294395	615
616	NCT03294395	616
617	NCT03291951	617
618	NCT03290833	618
619	NCT03290833	619
620	NCT03290560	620
621	NCT03289858	621
622	NCT03289858	622
623	NCT03286374	623
624	NCT03283943	624
625	NCT03283943	625
626	NCT03275571	626
627	NCT03269071	627
628	NCT03268213	628
629	NCT03267420	629
630	NCT03267420	630
631	NCT03267420	631
632	NCT03263780	632
633	NCT03263156	633
634	NCT03256396	634
635	NCT03254589	635
636	NCT03254589	636
637	NCT03254589	637
638	NCT03251495	638
639	NCT03248518	639
640	NCT03248518	640
641	NCT03248518	641
642	NCT03243539	642
643	NCT03241511	643
644	NCT03237468	644
645	NCT03229538	645
646	NCT03229538	646
647	NCT03229486	647
648	NCT03229486	648
649	NCT03227809	649
650	NCT03227809	650
651	NCT03227770	651
652	NCT03227770	652
653	NCT03212859	653
654	NCT03205956	654
655	NCT03196193	655
656	NCT03196193	656
657	NCT03196193	657
658	NCT03193333	658
659	NCT03193333	659
660	NCT03193333	660
661	NCT03193333	661
662	NCT03193333	662
663	NCT03193333	663
664	NCT03193333	664
665	NCT03191071	665
666	NCT03191071	666
667	NCT03191071	667
668	NCT03191071	668
669	NCT03168724	669
670	NCT03167723	670
671	NCT03167307	671
672	NCT03167307	672
673	NCT03128021	673
674	NCT03128021	674
675	NCT03116139	675
676	NCT03116139	676
677	NCT03110744	677
678	NCT03100526	678
679	NCT03044613	679
680	NCT03044613	680
681	NCT03044613	681
682	NCT03044613	682
683	NCT03036345	683
684	NCT03026816	684
685	NCT03007511	685
686	NCT02996565	686
687	NCT02996565	687
688	NCT02995733	688
689	NCT02993432	689
690	NCT02993432	690
691	NCT02990429	691
692	NCT02990429	692
693	NCT02978950	693
694	NCT02978950	694
695	NCT02959697	695
696	NCT02959697	696
697	NCT02959697	697
698	NCT02957669	698
699	NCT02957669	699
700	NCT02957253	700
701	NCT02957253	701
702	NCT02957253	702
703	NCT02957253	703
704	NCT02957253	704
705	NCT02957253	705
706	NCT02940028	706
707	NCT02940028	707
708	NCT02874443	708
709	NCT02871349	709
710	NCT02871349	710
711	NCT02852213	711
712	NCT02845336	712
713	NCT02811627	713
714	NCT02811627	714
715	NCT02808507	715
716	NCT02690259	716
717	NCT02651402	717
718	NCT02651402	718
719	NCT02651402	719
720	NCT02651402	720
721	NCT02624765	721
722	NCT02624765	722
723	NCT02624765	723
724	NCT02624765	724
725	NCT02624765	725
726	NCT02624765	726
727	NCT02613650	727
728	NCT02606045	728
729	NCT02606045	729
730	NCT02599480	730
731	NCT02599480	731
732	NCT02599480	732
733	NCT02599480	733
734	NCT02599480	734
735	NCT02599480	735
736	NCT02599480	736
737	NCT02587936	737
738	NCT02458846	738
739	NCT02458846	739
740	NCT02458846	740
741	NCT02458846	741
742	NCT02340650	742
743	NCT02278198	743
744	NCT02259621	744
745	NCT02046694	745
746	NCT01964859	746
747	NCT01247090	747
748	NCT01247090	748
749	NCT01247090	749
750	NCT01042015	750
751	NCT01042015	751
752	NCT00870064	752
753	NCT00870064	753
754	NCT03799094	754
755	NCT03607630	755
756	NCT03423342	756
757	NCT03292731	757
758	NCT03292731	758
759	NCT03275870	759
760	NCT03104426	760
761	NCT03753802	761
762	NCT03753802	762
763	NCT03630549	763
764	NCT03630549	764
765	NCT03241732	765
766	NCT03241732	766
767	NCT03466528	767
768	NCT03466528	768
769	NCT03463252	769
770	NCT03463252	770
771	NCT03463252	771
772	NCT03829956	772
773	NCT03827616	773
774	NCT03808207	774
775	NCT03795740	775
776	NCT03787615	776
777	NCT03781596	777
778	NCT03781596	778
779	NCT03781596	779
780	NCT03781596	780
781	NCT03781596	781
782	NCT03781596	782
783	NCT03771534	783
784	NCT03770455	784
785	NCT03766503	785
786	NCT03762239	786
787	NCT03762239	787
788	NCT03761264	788
789	NCT03761264	789
790	NCT03761264	790
791	NCT03757572	791
792	NCT03757572	792
793	NCT03754322	793
794	NCT03754322	794
795	NCT03744780	795
796	NCT03737370	796
797	NCT03737370	797
798	NCT03735537	798
799	NCT03735537	799
800	NCT03714282	800
801	NCT03704116	801
802	NCT03702465	802
803	NCT03702465	803
804	NCT03702465	804
805	NCT03701113	805
806	NCT03701113	806
807	NCT03699397	807
808	NCT03698591	808
809	NCT03698591	809
810	NCT03694496	810
811	NCT03692715	811
812	NCT03685461	812
813	NCT03680248	813
814	NCT03680248	814
815	NCT03680248	815
816	NCT03680248	816
817	NCT03680248	817
818	NCT03680248	818
819	NCT03678506	819
820	NCT03675165	820
821	NCT03661385	821
822	NCT03654131	822
823	NCT03654131	823
824	NCT03644381	824
825	NCT03637413	825
826	NCT03636724	826
827	NCT03633682	827
828	NCT03633682	828
829	NCT03632447	829
830	NCT03632447	830
831	NCT03631979	831
832	NCT03631030	832
833	NCT03629145	833
834	NCT03629145	834
835	NCT03625011	835
836	NCT03607461	836
837	NCT03607461	837
838	NCT03603015	838
839	NCT03594474	839
840	NCT03589378	840
841	NCT03586219	841
842	NCT03570424	842
843	NCT03563690	843
844	NCT03563690	844
845	NCT03563690	845
846	NCT03563690	846
847	NCT03563690	847
848	NCT03563690	848
849	NCT03560063	849
850	NCT03560063	850
851	NCT03553862	851
852	NCT03550495	852
853	NCT03538860	853
854	NCT03538860	854
855	NCT03536858	855
856	NCT03526458	856
857	NCT03516396	857
858	NCT03516396	858
859	NCT03516396	859
860	NCT03502005	860
861	NCT03494231	861
862	NCT03489850	862
863	NCT03488602	863
864	NCT03488602	864
865	NCT03483740	865
866	NCT03483740	866
867	NCT03478501	867
868	NCT03474978	868
869	NCT03474666	869
870	NCT03474666	870
871	NCT03474432	871
872	NCT03471637	872
873	NCT03467724	873
874	NCT03464851	874
875	NCT03462979	875
876	NCT03462459	876
877	NCT03461016	877
878	NCT03461003	878
879	NCT03461003	879
880	NCT03461003	880
881	NCT03461003	881
882	NCT03455985	882
883	NCT03455985	883
884	NCT03453398	884
885	NCT03453359	885
886	NCT03453359	886
887	NCT03442114	887
888	NCT03442114	888
889	NCT03440645	889
890	NCT03431467	890
891	NCT03429439	891
892	NCT03429439	892
893	NCT03422848	893
894	NCT03422848	894
895	NCT03418649	895
896	NCT03413332	896
897	NCT03406767	897
898	NCT03406767	898
899	NCT03405493	899
900	NCT03405493	900
901	NCT03395301	901
902	NCT03387618	902
903	NCT03380169	903
904	NCT03380169	904
905	NCT03377946	905
906	NCT03377946	906
907	NCT03377088	907
908	NCT03377088	908
909	NCT03373734	909
910	NCT03372707	910
911	NCT03366805	911
912	NCT03366805	912
913	NCT03360279	913
914	NCT03360279	914
915	NCT03359447	915
916	NCT03359447	916
917	NCT03354572	917
918	NCT03348605	918
919	NCT03345615	919
920	NCT03340818	920
921	NCT03340051	921
922	NCT03340051	922
923	NCT03337217	923
924	NCT03331965	924
925	NCT03331965	925
926	NCT03330509	926
927	NCT03327844	927
928	NCT03327844	928
929	NCT03324659	929
930	NCT03324516	930
931	NCT03324516	931
932	NCT03324009	932
933	NCT03307070	933
934	NCT03307070	934
935	NCT03303053	935
936	NCT03303053	936
937	NCT03303053	937
938	NCT03302572	938
939	NCT03301831	939
940	NCT03298997	940
941	NCT03298997	941
942	NCT03297151	942
943	NCT03297151	943
944	NCT03297151	944
945	NCT03275896	945
946	NCT03274518	946
947	NCT03274518	947
948	NCT03273699	948
949	NCT03256461	949
950	NCT03256461	950
951	NCT03256461	951
952	NCT03245853	952
953	NCT03239808	953
954	NCT03239808	954
955	NCT03238768	955
956	NCT03238768	956
957	NCT03235739	957
958	NCT03234569	958
959	NCT03230656	959
960	NCT03227614	960
961	NCT03196349	961
962	NCT03196349	962
963	NCT03196349	963
964	NCT03192020	964
965	NCT03192020	965
966	NCT03192020	966
967	NCT03036592	967
968	NCT03036592	968
969	NCT02948023	969
970	NCT02814123	970
971	NCT02724163	971
972	NCT02724163	972
973	NCT02724163	973
974	NCT02724163	974
975	NCT02724163	975
976	NCT02724163	976
977	NCT02479100	977
978	NCT03799237	978
979	NCT03759795	979
980	NCT03750409	980
981	NCT03736031	981
982	NCT03726437	982
983	NCT03726437	983
984	NCT03706014	984
985	NCT03695679	985
986	NCT03669432	986
987	NCT03669432	987
988	NCT03658941	988
989	NCT03658941	989
990	NCT03657212	990
991	NCT03648086	991
992	NCT03647449	992
993	NCT03647449	993
994	NCT03647449	994
995	NCT03635775	995
996	NCT03635775	996
997	NCT02029937	997
998	NCT03593356	998
999	NCT03588806	999
1000	NCT03588572	1000
1001	NCT03574376	1001
1002	NCT03574376	1002
1003	NCT03551860	1003
1004	NCT03551860	1004
1005	NCT03532360	1005
1006	NCT03526484	1006
1007	NCT03523000	1007
1008	NCT03522974	1008
1009	NCT03522974	1009
1010	NCT03522337	1010
1011	NCT03522337	1011
1012	NCT03518255	1012
1013	NCT03517852	1013
1014	NCT03511443	1014
1015	NCT03505658	1015
1016	NCT03500172	1016
1017	NCT03500172	1017
1018	NCT03481296	1018
1019	NCT03481296	1019
1020	NCT03454308	1020
1021	NCT03454308	1021
1022	NCT03435588	1022
1023	NCT03435588	1023
1024	NCT03435588	1024
1025	NCT03426683	1025
1026	NCT03422159	1026
1027	NCT03422159	1027
1028	NCT03420846	1028
1029	NCT03383731	1029
1030	NCT03383731	1030
1031	NCT03376685	1031
1032	NCT03376685	1032
1033	NCT03376685	1033
1034	NCT03376100	1034
1035	NCT03376100	1035
1036	NCT03365609	1036
1037	NCT03365609	1037
1038	NCT03365609	1038
1039	NCT03365609	1039
1040	NCT03360968	1040
1041	NCT03360968	1041
1042	NCT03343431	1042
1043	NCT03340103	1043
1044	NCT03338374	1044
1045	NCT03337971	1045
1046	NCT03337971	1046
1047	NCT03336372	1047
1048	NCT03326934	1048
1049	NCT03326934	1049
1050	NCT03306173	1050
1051	NCT03287635	1051
1052	NCT01785719	1052
1053	NCT03232554	1053
1054	NCT03232554	1054
1055	NCT03232554	1055
1056	NCT03085784	1056
1057	NCT03083366	1057
1058	NCT03009539	1058
1059	NCT02744768	1059
1060	NCT02744768	1060
1061	NCT01447628	1061
1062	NCT02188121	1062
1063	NCT03740243	1063
1064	NCT03740243	1064
1065	NCT03629496	1065
1066	NCT03622437	1066
1067	NCT03622437	1067
1068	NCT03616639	1068
1069	NCT03564080	1069
1070	NCT03544853	1070
1071	NCT03543774	1071
1072	NCT03543774	1072
1073	NCT03543774	1073
1074	NCT03519568	1074
1075	NCT03519087	1075
1076	NCT03519087	1076
1077	NCT03519087	1077
1078	NCT03440099	1078
1079	NCT03437811	1079
1080	NCT03423095	1080
1081	NCT03423095	1081
1082	NCT03423095	1082
1083	NCT03423095	1083
1084	NCT03406039	1084
1085	NCT03397277	1085
1086	NCT03397277	1086
1087	NCT03375580	1087
1088	NCT03375580	1088
1089	NCT03375580	1089
1090	NCT03373240	1090
1091	NCT03373240	1091
1092	NCT03369145	1092
1093	NCT03335722	1093
1094	NCT03333473	1094
1095	NCT03333473	1095
1096	NCT03331978	1096
1097	NCT03255707	1097
1098	NCT03255707	1098
1099	NCT03208530	1099
1100	NCT02781064	1100
1101	NCT03664934	1101
1102	NCT03584490	1102
1103	NCT03558828	1103
1104	NCT03558828	1104
1105	NCT03558828	1105
1106	NCT03558828	1106
1107	NCT03558828	1107
1108	NCT03558828	1108
1109	NCT03558828	1109
1110	NCT03556371	1110
1111	NCT03529981	1111
1112	NCT03529981	1112
1113	NCT03422562	1113
1114	NCT03394495	1114
1115	NCT03304444	1115
1116	NCT03686748	1116
1117	NCT03686748	1117
1118	NCT03538418	1118
1119	NCT03397160	1119
1120	NCT03388970	1120
1121	NCT03388970	1121
1122	NCT03376854	1122
1123	NCT03376854	1123
1124	NCT03234543	1124
1125	NCT03234543	1125
1126	NCT03230942	1126
1127	NCT03230942	1127
1128	NCT02982772	1128
1129	NCT02982772	1129
1130	NCT02529644	1130
1131	NCT02529644	1131
1132	NCT03326596	1132
1133	NCT03543644	1133
1134	NCT03543644	1134
1135	NCT03543644	1135
1136	NCT03507400	1136
1137	NCT03286153	1137
1138	NCT03286153	1138
\.


--
-- Data for Name: phase; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.phase (phase_id, phase_detail) FROM stdin;
1	Phase 2
2	Phase 3
3	Phase 1
4	Not Applicable
5	Phase 4
6	Early Phase 1
\.


--
-- Data for Name: phasexref; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.phasexref (nct_phase_id, nct_number, phase_id) FROM stdin;
1	NCT03769298	1
2	NCT03769298	2
3	NCT03653546	2
4	NCT03641209	3
5	NCT03601000	3
6	NCT03498196	3
7	NCT03453255	3
8	NCT03420976	3
9	NCT03395288	3
10	NCT03361345	3
11	NCT03354611	3
12	NCT03334175	3
13	NCT03317327	3
14	NCT03262961	3
15	NCT03227731	3
16	NCT02786836	3
17	NCT01203722	3
18	NCT03837717	4
19	NCT03836508	4
20	NCT03833596	5
21	NCT03833531	5
22	NCT03833453	5
23	NCT03832712	5
24	NCT03832530	5
25	NCT03830190	5
26	NCT03830008	5
27	NCT03829748	5
28	NCT03828721	5
29	NCT03827915	5
30	NCT03825146	5
31	NCT03823456	5
32	NCT03818867	5
33	NCT03817489	5
34	NCT03814577	5
35	NCT03814330	5
36	NCT03813992	5
37	NCT03813381	5
38	NCT03813069	5
39	NCT03809286	5
40	NCT03807986	5
41	NCT03801772	5
42	NCT03799328	5
43	NCT03798483	5
44	NCT03796923	5
45	NCT03796793	5
46	NCT03795675	5
47	NCT03791697	5
48	NCT03790449	5
49	NCT03786432	5
50	NCT03783767	5
51	NCT03783312	5
52	NCT03783299	5
53	NCT03782974	5
54	NCT03781050	5
55	NCT03778580	5
56	NCT03773575	5
57	NCT03771495	5
58	NCT03771430	5
59	NCT03770962	5
60	NCT03770507	5
61	NCT03767660	5
62	NCT03761732	5
63	NCT03753932	5
64	NCT03753243	5
65	NCT03751878	5
66	NCT03749655	5
67	NCT03748914	5
68	NCT03747887	5
69	NCT03745209	5
70	NCT03743480	5
71	NCT03740659	5
72	NCT03740321	5
73	NCT03739528	5
74	NCT03737227	5
75	NCT03736382	5
76	NCT03730454	5
77	NCT03729687	5
78	NCT03729648	5
79	NCT03729297	5
80	NCT03727321	5
81	NCT03725215	5
82	NCT03724383	5
83	NCT03723525	5
84	NCT03719235	5
85	NCT03716219	5
86	NCT03714139	5
87	NCT03711630	5
88	NCT03711370	5
89	NCT03709979	5
90	NCT03704415	5
91	NCT03704064	5
92	NCT03704051	5
93	NCT03699059	5
94	NCT03697837	5
95	NCT03695003	5
96	NCT03690154	5
97	NCT03689348	5
98	NCT03689049	5
99	NCT03687411	5
100	NCT03685227	5
101	NCT03682601	5
102	NCT03680833	5
103	NCT03679689	5
104	NCT03678935	5
105	NCT03675009	5
106	NCT03674996	5
107	NCT03668873	5
108	NCT03667755	5
109	NCT03667001	5
110	NCT03663075	5
111	NCT03658434	5
112	NCT03654508	5
113	NCT03648437	5
114	NCT03648060	5
115	NCT03648047	5
116	NCT03647007	5
117	NCT03646357	5
118	NCT03646240	5
119	NCT03645603	5
120	NCT03645005	5
121	NCT03642769	5
122	NCT03638609	5
123	NCT03635840	5
124	NCT03632837	5
125	NCT03630770	5
126	NCT03630328	5
127	NCT03628001	5
128	NCT03625544	5
129	NCT03623880	5
130	NCT03620942	5
131	NCT03619720	5
132	NCT03618108	5
133	NCT03618017	5
134	NCT03615586	5
135	NCT03602768	5
136	NCT03602677	5
137	NCT03602014	5
138	NCT03600987	5
139	NCT03598114	5
140	NCT03593889	5
141	NCT03593148	5
142	NCT03591237	5
143	NCT03585920	5
144	NCT03585192	5
145	NCT03582046	5
146	NCT03579303	5
147	NCT03578848	5
148	NCT03578432	6
149	NCT03577301	6
150	NCT03577106	6
151	NCT03577054	6
152	NCT03575026	6
153	NCT03568812	6
154	NCT03567031	6
155	NCT03567018	6
156	NCT03565354	6
157	NCT03564665	6
158	NCT03562546	6
159	NCT03561961	6
160	NCT03561103	6
161	NCT03559751	6
162	NCT03559179	6
163	NCT03558763	6
164	NCT03555500	6
165	NCT03553927	6
166	NCT03553004	6
167	NCT03552523	6
168	NCT03550885	6
169	NCT03543098	6
170	NCT03542383	6
171	NCT03541291	6
172	NCT03540732	6
173	NCT03540368	6
174	NCT03540134	6
175	NCT03540069	6
176	NCT03538730	6
177	NCT03538379	6
178	NCT03537612	6
179	NCT03535675	6
180	NCT03534362	6
181	NCT03527927	6
182	NCT03527849	6
183	NCT03527121	6
184	NCT03526068	6
185	NCT03526042	6
186	NCT03524703	6
187	NCT03523806	6
188	NCT03523299	6
189	NCT03521960	6
190	NCT03519750	6
191	NCT03519659	6
192	NCT03518216	6
193	NCT03517397	6
194	NCT03516877	6
195	NCT03513822	6
196	NCT03512691	6
197	NCT03510195	6
198	NCT03508921	6
199	NCT03508908	6
200	NCT03507647	6
201	NCT03503721	6
202	NCT03503162	6
203	NCT03502655	6
204	NCT03502252	6
205	NCT03501316	6
206	NCT03500419	6
207	NCT03500406	6
208	NCT03500367	6
209	NCT03496948	6
210	NCT03495791	6
211	NCT03495752	6
212	NCT03495661	6
213	NCT03495518	6
214	NCT03495089	6
215	NCT03494816	6
216	NCT03494335	6
217	NCT03494205	6
218	NCT03492476	6
219	NCT03491059	6
220	NCT03491046	6
221	NCT03490812	6
222	NCT03490656	6
223	NCT03489395	6
224	NCT03488511	6
225	NCT03487718	6
226	NCT03486444	6
227	NCT03486106	6
228	NCT03484533	6
229	NCT03484338	6
230	NCT03484273	6
231	NCT03483935	6
232	NCT03482908	6
233	NCT03481023	6
234	NCT03479697	6
235	NCT03478163	6
236	NCT03478137	6
237	NCT03477500	6
238	NCT03477045	6
239	NCT03473899	6
240	NCT03473665	6
241	NCT03472820	6
242	NCT03472430	6
243	NCT03472378	6
244	NCT03471117	6
245	NCT03470389	6
246	NCT03469609	6
247	NCT03468621	6
248	NCT03466164	6
249	NCT03465982	6
250	NCT03464773	6
251	NCT03464266	6
252	NCT03462966	6
253	NCT03462823	6
254	NCT03459014	6
255	NCT03457519	6
256	NCT03457506	6
257	NCT03456895	6
258	NCT03456128	6
259	NCT03455426	6
260	NCT03454282	6
261	NCT03454087	6
262	NCT03453190	6
263	NCT03451266	6
264	NCT03450655	6
265	NCT03450564	6
266	NCT03449693	6
267	NCT03448289	6
268	NCT03447119	6
269	NCT03444103	6
270	NCT03443388	6
271	NCT03443258	6
272	NCT03441867	6
273	NCT03438708	6
274	NCT03435497	6
275	NCT03435172	6
276	NCT03434392	6
277	NCT03433222	6
278	NCT03432832	6
279	NCT03432819	6
280	NCT03429010	6
281	NCT03428477	6
282	NCT03426436	6
283	NCT03425890	6
284	NCT03423394	6
285	NCT03423303	6
286	NCT03422536	6
287	NCT03421262	6
288	NCT03420404	6
289	NCT03419715	6
290	NCT03418870	6
291	NCT03418324	6
292	NCT03415880	6
293	NCT03415841	6
294	NCT03412149	6
295	NCT03412084	6
296	NCT03410511	6
297	NCT03408873	6
298	NCT03408574	6
299	NCT03406520	6
300	NCT03405090	6
301	NCT03404011	6
302	NCT03401047	6
303	NCT03399318	6
304	NCT03397030	6
305	NCT03396094	6
306	NCT03394599	6
307	NCT03392415	6
308	NCT03386227	6
309	NCT03384706	6
310	NCT03382171	6
311	NCT03382093	6
312	NCT03381027	6
313	NCT03380884	6
314	NCT03380013	6
315	NCT03379818	6
316	NCT03375879	6
317	NCT03375229	6
318	NCT03372174	6
319	NCT03371836	6
320	NCT03369600	6
321	NCT03367364	6
322	NCT03365518	6
323	NCT03364660	6
324	NCT03364114	6
325	NCT03362983	6
326	NCT03359863	6
327	NCT03357042	6
328	NCT03356652	6
329	NCT03356210	6
330	NCT03356106	6
331	NCT03355456	6
332	NCT03354325	6
333	NCT03354286	6
334	NCT03353298	6
335	NCT03352947	6
336	NCT03350737	6
337	NCT03348761	6
338	NCT03346668	6
339	NCT03342976	6
340	NCT03341975	6
341	NCT03341520	6
342	NCT03340922	6
343	NCT03337607	6
344	NCT03337360	6
345	NCT03336879	6
346	NCT03335475	6
347	NCT03335358	6
348	NCT03335319	6
349	NCT03335124	6
350	NCT03334643	6
351	NCT03333460	6
352	NCT03333174	6
353	NCT03333161	6
354	NCT03326232	6
355	NCT03324451	6
356	NCT03323359	6
357	NCT03322774	6
358	NCT03322072	6
359	NCT03320057	6
360	NCT03318874	6
361	NCT03314792	6
362	NCT03313492	6
363	NCT03308851	6
364	NCT03306992	6
365	NCT03304626	6
366	NCT03304301	6
367	NCT03302858	6
368	NCT03302299	6
369	NCT03301311	6
370	NCT03299816	6
371	NCT03299296	6
372	NCT03297658	6
373	NCT03297346	6
374	NCT03295708	6
375	NCT03295422	6
376	NCT03294395	6
377	NCT03291951	6
378	NCT03290833	6
379	NCT03290560	6
380	NCT03289858	6
381	NCT03286374	6
382	NCT03283943	6
383	NCT03275571	6
384	NCT03269071	6
385	NCT03268213	6
386	NCT03267420	6
387	NCT03267238	6
388	NCT03263780	6
389	NCT03263156	6
390	NCT03256396	6
391	NCT03254589	6
392	NCT03251495	6
393	NCT03248518	6
394	NCT03243539	6
395	NCT03241511	6
396	NCT03237468	6
397	NCT03229538	6
398	NCT03229486	6
399	NCT03227809	6
400	NCT03227770	6
401	NCT03212859	6
402	NCT03205956	6
403	NCT03196193	6
404	NCT03193333	6
405	NCT03191071	6
406	NCT03168724	6
407	NCT03167723	6
408	NCT03167307	6
409	NCT03128021	6
410	NCT03116139	6
411	NCT03110744	6
412	NCT03100526	6
413	NCT03044613	6
414	NCT03036345	6
415	NCT03026816	6
416	NCT03007511	6
417	NCT02996565	6
418	NCT02995733	6
419	NCT02993432	6
420	NCT02990429	6
421	NCT02978950	6
422	NCT02959697	6
423	NCT02957669	6
424	NCT02957253	6
425	NCT02940028	6
426	NCT02874443	6
427	NCT02871349	6
428	NCT02852213	6
429	NCT02845336	6
430	NCT02811627	6
431	NCT02808507	6
432	NCT02690259	6
433	NCT02651402	6
434	NCT02624765	6
435	NCT02613650	6
436	NCT02606045	6
437	NCT02599480	6
438	NCT02587936	6
439	NCT02458846	6
440	NCT02428205	6
441	NCT02340650	6
442	NCT02278198	6
443	NCT02259621	6
444	NCT02046694	6
445	NCT01964859	6
446	NCT01247090	6
447	NCT01042015	6
448	NCT00870064	6
449	NCT03799094	6
450	NCT03607630	6
451	NCT03423342	6
452	NCT03360929	6
453	NCT03292731	6
454	NCT03275870	6
455	NCT03104426	6
456	NCT03753802	6
457	NCT03630549	6
458	NCT03241732	6
459	NCT03032601	6
460	NCT03466528	6
461	NCT03463252	6
462	NCT03829956	6
463	NCT03827616	6
464	NCT03808207	6
465	NCT03795740	6
466	NCT03787615	6
467	NCT03781596	6
468	NCT03771534	6
469	NCT03770455	6
470	NCT03766503	6
471	NCT03762239	6
472	NCT03761264	6
473	NCT03757572	6
474	NCT03754322	6
475	NCT03744780	6
476	NCT03737370	6
477	NCT03735537	6
478	NCT03714282	6
479	NCT03704116	6
480	NCT03702465	6
481	NCT03701113	6
482	NCT03699397	6
483	NCT03698591	6
484	NCT03694496	6
485	NCT03692715	6
486	NCT03685461	6
487	NCT03680248	6
488	NCT03678506	6
489	NCT03675165	6
490	NCT03661385	6
491	NCT03654131	6
492	NCT03644381	6
493	NCT03637413	6
494	NCT03636724	6
495	NCT03633682	6
496	NCT03632447	6
497	NCT03631979	6
498	NCT03631030	6
499	NCT03629145	6
500	NCT03625011	6
501	NCT03607461	6
502	NCT03603015	6
503	NCT03594474	6
504	NCT03589378	6
505	NCT03586219	6
506	NCT03570424	6
507	NCT03563690	6
508	NCT03560063	6
509	NCT03553862	6
510	NCT03550495	6
511	NCT03538860	6
512	NCT03536858	6
513	NCT03526458	6
514	NCT03516396	6
515	NCT03502005	6
516	NCT03494231	6
517	NCT03493126	6
518	NCT03489850	6
519	NCT03488602	6
520	NCT03483740	6
521	NCT03478501	6
522	NCT03474978	6
523	NCT03474666	6
524	NCT03474432	6
525	NCT03471637	6
526	NCT03467724	6
527	NCT03464851	6
528	NCT03462979	6
529	NCT03462459	6
530	NCT03461016	6
531	NCT03461003	6
532	NCT03455985	6
533	NCT03453398	6
534	NCT03453359	6
535	NCT03442114	6
536	NCT03440645	6
537	NCT03431467	6
538	NCT03429439	6
539	NCT03422848	6
540	NCT03418649	6
541	NCT03413332	6
542	NCT03406767	6
543	NCT03405493	6
544	NCT03395301	6
545	NCT03387618	6
546	NCT03382106	6
547	NCT03380169	6
548	NCT03377946	6
549	NCT03377088	6
550	NCT03373734	6
551	NCT03372707	6
552	NCT03366805	6
553	NCT03360279	6
554	NCT03359447	6
555	NCT03354572	6
556	NCT03348605	6
557	NCT03345615	6
558	NCT03340818	6
559	NCT03340051	6
560	NCT03337217	6
561	NCT03331965	6
562	NCT03330509	6
563	NCT03327844	6
564	NCT03324659	6
565	NCT03324516	6
566	NCT03324009	6
567	NCT03307070	6
568	NCT03303053	6
569	NCT03302572	6
570	NCT03301831	6
571	NCT03298997	6
572	NCT03297151	6
573	NCT03275896	6
574	NCT03274518	6
575	NCT03273699	6
576	NCT03256461	6
577	NCT03245853	6
578	NCT03239808	6
579	NCT03238768	6
580	NCT03235739	6
581	NCT03234569	6
582	NCT03230890	6
583	NCT03230656	6
584	NCT03227614	6
585	NCT03196349	6
586	NCT03192020	6
587	NCT03036592	6
588	NCT02948023	6
589	NCT02814123	6
590	NCT02724163	6
591	NCT02479100	6
592	NCT03799237	6
593	NCT03759795	6
594	NCT03750409	6
595	NCT03736031	6
596	NCT03726437	6
597	NCT03706014	6
598	NCT03695679	6
599	NCT03669432	6
600	NCT03658941	6
601	NCT03657212	6
602	NCT03648086	6
603	NCT03647449	6
604	NCT03635775	6
605	NCT02029937	6
606	NCT03593356	6
607	NCT03588806	6
608	NCT03588572	6
609	NCT03574376	6
610	NCT03551860	6
611	NCT03532360	6
612	NCT03526484	6
613	NCT03523000	6
614	NCT03522974	6
615	NCT03522337	6
616	NCT03518255	6
617	NCT03517852	6
618	NCT03511443	6
619	NCT03505658	6
620	NCT03500172	6
621	NCT03481296	6
622	NCT03454308	6
623	NCT03437876	6
624	NCT03435588	6
625	NCT03426683	6
626	NCT03422159	6
627	NCT03420846	6
628	NCT03383731	6
629	NCT03376685	6
630	NCT03376100	6
631	NCT03365609	6
632	NCT03360968	6
633	NCT03343431	6
634	NCT03340103	6
635	NCT03338374	6
636	NCT03337971	6
637	NCT03336372	6
638	NCT03326934	6
639	NCT03306173	6
640	NCT03287635	6
641	NCT03265574	6
642	NCT01785719	6
643	NCT03232554	6
644	NCT01739933	6
645	NCT03085784	6
646	NCT03083366	6
647	NCT03009539	6
648	NCT02744768	6
649	NCT01447628	6
650	NCT02188121	6
651	NCT03740243	6
652	NCT03629496	6
653	NCT03622437	6
654	NCT03616639	6
655	NCT03564080	6
656	NCT03544853	6
657	NCT03543774	6
658	NCT03519568	6
659	NCT03519087	6
660	NCT03440099	6
661	NCT03437811	6
662	NCT03423095	6
663	NCT03406039	6
664	NCT03397277	6
665	NCT03375580	6
666	NCT03373240	6
667	NCT03369145	6
668	NCT03337581	6
669	NCT03335722	6
670	NCT03333473	6
671	NCT03331978	6
672	NCT03255707	6
673	NCT03208530	6
674	NCT02781064	6
675	NCT03664934	6
676	NCT03584490	6
677	NCT03558828	6
678	NCT03556371	6
679	NCT03529981	6
680	NCT03422562	6
681	NCT03394495	6
682	NCT03304444	6
683	NCT03686748	6
684	NCT02018367	6
685	NCT03538418	6
686	NCT03397160	6
687	NCT03388970	6
688	NCT03376854	6
689	NCT03234543	6
690	NCT03230942	6
691	NCT02982772	6
692	NCT02529644	6
693	NCT03326596	6
694	NCT03543644	6
695	NCT03507400	6
696	NCT03286153	6
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.site (site_id, site_name, site_city, site_state, site_country, site_address, site_lat, site_lng, site_zipcode) FROM stdin;
1	University of Wisconsin	 Madison	 Wisconsin	 United States	University of Wisconsin, Madison, Wisconsin, United States	43.076591999999998	-89.4124874999999975	53706
2	China site 0104	 Hefei	 Anhui	 China	China site 0104, Hefei, Anhui, China	31.8205910000000003	117.227219000000005	China
3	China site 0108	 Fuzhou	 Fujian	 China	China site 0108, Fuzhou, Fujian, China	26.0744779999999992	119.296481999999997	China
4	China site 0128	 Xiamen	 Fujian	 China	China site 0128, Xiamen, Fujian, China	24.4798329999999993	118.089425000000006	China
5	China site 0101	 Guangzhou	 Guangdong	 China	China site 0101, Guangzhou, Guangdong, China	23.1291100000000007	113.264385000000004	China
6	China site 0132	 Guangzhou	 Guangdong	 China	China site 0132, Guangzhou, Guangdong, China	23.1291100000000007	113.264385000000004	China
7	China site 0110	 Haerbin	 Heilongjiang	 China	China site 0110, Haerbin, Heilongjiang, China	45.8037749999999875	126.534966999999995	China
8	China site 0109	 Zhengzhou	 Henan	 China	China site 0109, Zhengzhou, Henan, China	34.7466110000000015	113.625327999999996	China
23	China site 0127	 Xi'an	 Shaanxi	 China	China site 0127, Xi'an, Shaanxi, China	34.3415740000000014	108.939769999999996	China
24	China site 0123	 Jinan	 Shandong	 China	China site 0123, Jinan, Shandong, China	36.6512000000000029	117.120095000000006	China
25	China site 0121	 Linyi	 Shandong	 China	China site 0121, Linyi, Shandong, China	35.1046729999999982	118.356414000000001	China
26	China site 0138	 Weifang	 Shandong	 China	China site 0138, Weifang, Shandong, China	36.7069619999999972	119.161748000000003	China
27	China site 0140	 Yantai	 Shandong	 China	China site 0140, Yantai, Shandong, China	37.4645389999999878	121.447851999999997	China
28	China site 0135	 Shenyang	 Shenyang	 China	China site 0135, Shenyang, Shenyang, China	41.8056989999999971	123.431471999999999	China
29	China site 0141	 Chengdu	 Sichuan	 China	China site 0141, Chengdu, Sichuan, China	30.5728149999999985	104.066800999999998	China
30	China site 0129	 Kunming	 Yunnan	 China	China site 0129, Kunming, Yunnan, China	24.8800950000000007	102.832891000000004	China
31	China site 0136	 Hangzhou	 Zhejiang	 China	China site 0136, Hangzhou, Zhejiang, China	30.2740839999999984	120.155069999999995	China
32	China site 0137	 Hangzhou	 Zhejiang	 China	China site 0137, Hangzhou, Zhejiang, China	30.2740839999999984	120.155069999999995	China
33	China site 0115	 Hangzhou	 Zhejiang	 China	China site 0115, Hangzhou, Zhejiang, China	30.2740839999999984	120.155069999999995	China
34	China site 0102		 Beijing	 China	China site 0102,, Beijing, China	39.9041998999999876	116.407396300000002	China
35	China site 0133		 Beijing	 China	China site 0133,, Beijing, China	39.9041998999999876	116.407396300000002	China
36	China site 0105		 Beijing	 China	China site 0105,, Beijing, China	39.9041998999999876	116.407396300000002	China
37	China site 0130		 Beijing	 China	China site 0130,, Beijing, China	39.9041998999999876	116.407396300000002	China
38	China site 0106		 Chongqing	 China	China site 0106,, Chongqing, China	29.4315861000000005	106.912250999999998	China
39	China site 0120		 Chongqing	 China	China site 0120,, Chongqing, China	29.4315861000000005	106.912250999999998	China
40	China site 0134		 Chongqing	 China	China site 0134,, Chongqing, China	29.4315861000000005	106.912250999999998	China
41	China site 0103		 Shanghai	 China	China site 0103,, Shanghai, China	31.230390400000001	121.473702099999997	China
42	China site 0107		 Shanghai	 China	China site 0107,, Shanghai, China	31.230390400000001	121.473702099999997	China
43	China site 0139		 Tianjin	 China	China site 0139,, Tianjin, China	39.3433574000000021	117.361647599999998	China
44	Korea Site 0203	 Chungbuk		 Korea	Korea Site 0203, Chungbuk,, Korea	36.7999999999999972	127.700000000000003	South Korea
45	Korea site 0210	 Daegu		 Korea	Korea site 0210, Daegu,, Korea	35.8714354000000029	128.601445000000012	South Korea
46	Korea site 0209	 Gyeonggi-do		 Korea	Korea site 0209, Gyeonggi-do,, Korea	37.4137999999999877	127.518299999999996	South Korea
47	Korea site 0206	 Gyeongsang		 Korea	Korea site 0206, Gyeongsang,, Korea	35.8059055000000015	128.987674099999992	South Korea
48	Korea site 0205	 Incheon		 Korea	Korea site 0205, Incheon,, Korea	37.4562556999999998	126.705206200000006	South Korea
49	Korea Site 0202	 Seoul		 Korea	Korea Site 0202, Seoul,, Korea	37.5665350000000018	126.977969200000004	South Korea
50	Korea site 0212	 Seoul		 Korea	Korea site 0212, Seoul,, Korea	37.5665350000000018	126.977969200000004	South Korea
51	Korea Site 0201	 Seoul		 Korea	Korea Site 0201, Seoul,, Korea	37.5665350000000018	126.977969200000004	South Korea
52	Korea site 0204	 Seoul		 Korea	Korea site 0204, Seoul,, Korea	37.5665350000000018	126.977969200000004	South Korea
53	Korea site 0211	 Seoul		 Korea	Korea site 0211, Seoul,, Korea	37.5665350000000018	126.977969200000004	South Korea
54	Korea site 0207	 Suwon		 Korea	Korea site 0207, Suwon,, Korea	37.2635726999999974	127.028600900000001	South Korea
55	Korea site 0208	 Ulsan		 Korea	Korea site 0208, Ulsan,, Korea	35.5383773000000005	129.311359600000003	South Korea
56	Singapore site 0301		 Singapore	 Singapore	Singapore site 0301,, Singapore, Singapore	1.35208299999999992	103.819835999999995	Singapore
57	Taiwan site 0403		 Taichung	 Taiwan	Taiwan site 0403,, Taichung, Taiwan	24.1477357999999995	120.673648200000002	Taiwan
58	Taiwan site 0404		 Tainan	 Taiwan	Taiwan site 0404,, Tainan, Taiwan	22.9998998999999991	120.226875800000002	Taiwan
59	Taiwan site 0401		 Taipei	 Taiwan	Taiwan site 0401,, Taipei, Taiwan	25.0329693999999989	121.565417699999998	Taiwan
60	Taiwan site 0402		 Taoyuan	 Taiwan	Taiwan site 0402,, Taoyuan, Taiwan	24.9936280999999987	121.300979799999993	Taiwan
61	 Oulu University Hospital		 Oulu	 Finland	 Oulu University Hospital,, Oulu, Finland	65.0069652999999903	25.5179524999999998	90220
62	Teaching Hospital of Chengdu University of Traditional Chinese Medicine	 Chengdu	 Sichuan	 China	Teaching Hospital of Chengdu University of Traditional Chinese Medicine, Chengdu, Sichuan, China	30.6862449999999995	103.808454999999995	611130
1088	Guangdong General Hospital	 Guangzhou	 Guangdong	 China	Guangdong General Hospital, Guangzhou, Guangdong, China	23.1256720000000016	113.287200999999996	510080
63	Welfare Institution of Emei Civil Administration	 Leshan	 Sichuan	 China	Welfare Institution of Emei Civil Administration, Leshan, Sichuan, China	29.5863610000000001	103.774957000000001	614000
64	Baylor Clinic	 Houston	 Texas	 United States	Baylor Clinic, Houston, Texas, United States	29.7094571999999992	-95.4030358999999919	77030
65	Baylor College of Medicine	 Houston	 Texas	 United States	Baylor College of Medicine, Houston, Texas, United States	29.7105289999999904	-95.3962409999999892	3411
66	Ben Taub General Hospital	 Houston	 Texas	 United States	Ben Taub General Hospital, Houston, Texas, United States	29.710625799999999	-95.393453799999989	77030
67	Michael E. DeBakey Veteran Affairs Medical Center	 Houston	 Texas	 United States	Michael E. DeBakey Veteran Affairs Medical Center, Houston, Texas, United States	29.7012439000000015	-95.3885590000000008	4211
68	Chinese PLA General Hospital		 Beijing	 China	Chinese PLA General Hospital,, Beijing, China	39.9029769999999999	116.274668000000005	100039
69	Good Medicine	 Oxford	 Ohio	 United States	Good Medicine, Oxford, Ohio, United States	39.5191680000000005	-84.7427129999999948	8928
70	Washington University School of Medicine	 Saint Louis	 Missouri	 United States	Washington University School of Medicine, Saint Louis, Missouri, United States	38.635144099999998	-90.2629288999999915	1010
71	WSUPG Dermatology	 Dearborn	 Michigan	 United States	WSUPG Dermatology, Dearborn, Michigan, United States	42.2933014999999983	-83.2119613999999928	48124
72	UR Medicine Breast Imaging	 Rochester	 New York	 United States	UR Medicine Breast Imaging, Rochester, New York, United States	43.0650410000000008	-77.6312509999999918	14623
73	UR Medicine Breast Imaging	 Rochester	 New York	 United States	UR Medicine Breast Imaging, Rochester, New York, United States	43.0650410000000008	-77.6312509999999918	14623
74	Oslo University Hospital		 Oslo	 Norway	Oslo University Hospital,, Oslo, Norway	59.9492404999999877	10.7150818000000001	0372
75	Assiut Univeristy Hospitals		 Assiut	 Egypt	Assiut Univeristy Hospitals,, Assiut, Egypt	27.1848697000000001	31.1661488999999996	Egypt
76	University of KwaZulu-Natal	 Durban	 KwaZulu-Natal	 South Africa	University of KwaZulu-Natal, Durban, KwaZulu-Natal, South Africa	-29.8674219000000001	30.9807272000000005	4041
77	University of KwaZulu-Natal	 Durban	 KwaZulu-Natal	 South Africa	University of KwaZulu-Natal, Durban, KwaZulu-Natal, South Africa	-29.8674219000000001	30.9807272000000005	4041
78	University of KwaZulu-Natal	 Durban	 KwaZulu-Natal	 South Africa	University of KwaZulu-Natal, Durban, KwaZulu-Natal, South Africa	-29.8674219000000001	30.9807272000000005	4041
79	Yale University School of Medicine	 New Haven	 Connecticut	 United States	Yale University School of Medicine, New Haven, Connecticut, United States	41.3032299999999992	-72.9338697999999965	06510
80	Northwestern University	 Chicago	 Illinois	 United States	Northwestern University, Chicago, Illinois, United States	41.894582800000002	-87.6231705999999946	2834
81	University of Kansas Medical Center	 Kansas City	 Kansas	 United States	University of Kansas Medical Center, Kansas City, Kansas, United States	39.0563499999999877	-94.6113986999999952	66160
82	University of Michigan	 Ann Arbor	 Michigan	 United States	University of Michigan, Ann Arbor, Michigan, United States	42.2780435999999966	-83.7382240999999965	48109
83	Ohio State University Medical Center	 Columbus	 Ohio	 United States	Ohio State University Medical Center, Columbus, Ohio, United States	39.9953221999999968	-83.01774979999999	43210
84	Medical University of South Carolina	 Charleston	 South Carolina	 United States	Medical University of South Carolina, Charleston, South Carolina, United States	32.7847215000000034	-79.9493842999999913	29425
85	UT Southwestern Medical Center at Dallas	 Dallas	 Texas	 United States	UT Southwestern Medical Center at Dallas, Dallas, Texas, United States	32.8174648999999974	-96.8421196999999978	75390
86	VCU Medical Center	 Richmond	 Virginia	 United States	VCU Medical Center, Richmond, Virginia, United States	37.5407141000000024	-77.4307977999999935	23298
87	University of Washington Medical Center	 Seattle	 Washington	 United States	University of Washington Medical Center, Seattle, Washington, United States	47.6588307000000029	-122.3178901	98105
88	Sidney Kimmel Comprehensive Cancer Center at Johns Hopkins	 Baltimore	 Maryland	 United States	Sidney Kimmel Comprehensive Cancer Center at Johns Hopkins, Baltimore, Maryland, United States	39.295855600000003	-76.5932626999999968	21231
89	Maine Medical Center	 Portland	 Maine	 United States	Maine Medical Center, Portland, Maine, United States	43.6531738999999988	-70.2763989999999978	04102
90	Sisli Hamidiye Etfal Training and Research Hospital		 Istanbul	 Turkey	Sisli Hamidiye Etfal Training and Research Hospital,, Istanbul, Turkey	41.0583371000000028	28.9899334999999994	34371
91	Sisli Hamidiye Etfal Training and Research Hospital		 Istanbul	 Turkey	Sisli Hamidiye Etfal Training and Research Hospital,, Istanbul, Turkey	41.0583371000000028	28.9899334999999994	34371
92	Sinai Centrum	 Amstelveen	 Noord-Holland	 Netherlands	Sinai Centrum, Amstelveen, Noord-Holland, Netherlands	52.293621899999998	4.87644569999999966	1186 AM
93	Sinai Centrum	 Amstelveen	 Noord-Holand	 Netherlands	Sinai Centrum, Amstelveen, Noord-Holand, Netherlands	52.293621899999998	4.87644569999999966	1186 AM
94	Sahlgrenska University Hospital		 Göteborg	 Sweden	Sahlgrenska University Hospital,, Göteborg, Sweden	57.6823671999999874	11.9614317999999997	413 45
95	Linköping University Hospital		 Linköping	 Sweden	Linköping University Hospital,, Linköping, Sweden	58.4006675999999985	15.6207642	581 85
96	Lund University Hospital		 Lund	 Sweden	Lund University Hospital,, Lund, Sweden	55.7119483000000031	13.2034929999999999	Sweden
97	Karolinska University Hospital		 Stockholm	 Sweden	Karolinska University Hospital,, Stockholm, Sweden	59.3510442999999981	18.0335037999999983	171 76
98	Umeå University Hospital		 Umeå	 Sweden	Umeå University Hospital,, Umeå, Sweden	63.8174404000000024	20.2988233999999999	907 37
99	Akademiska Sjukhuset		 Uppsala	 Sweden	Akademiska Sjukhuset,, Uppsala, Sweden	59.8484837000000027	17.6407363000000004	751 85
100	Mbarara University of Science and Technology		 Mbarara	 Uganda	Mbarara University of Science and Technology,, Mbarara, Uganda	-0.616724500000000009	30.6567879999999988	Uganda
101	Mbarara University of Science and Technology		 Mbarara	 Uganda	Mbarara University of Science and Technology,, Mbarara, Uganda	-0.616724500000000009	30.6567879999999988	Uganda
102	University Hospital Zurich	 Zürich	 ZH	 Switzerland	University Hospital Zurich, Zürich, ZH, Switzerland	47.3766843000000009	8.5491457000000004	8091
103	Hospital Universitario de la Princesa		 Madrid	 Spain	Hospital Universitario de la Princesa,, Madrid, Spain	40.4340811000000002	-3.67573669999999897	28006
104	Community Health Center@ Connecticut Children's Medical Center	 Hartford	 Connecticut	 United States	Community Health Center@ Connecticut Children's Medical Center, Hartford, Connecticut, United States	41.7538885000000022	-72.6819407999999925	06106
105	American University of Beirut Medical Center		 Beirut	 Lebanon	American University of Beirut Medical Center,, Beirut, Lebanon	33.8978850000000023	35.486151999999997	Lebanon
106	Panacee Hospital Rama 2		 Samut Sakhon	 Thailand	Panacee Hospital Rama 2,, Samut Sakhon, Thailand	13.6007695999999996	100.3771354	74000
107	Vietnam National Cancer Institution	 Hanoi	 Ha Dong	 Vietnam	Vietnam National Cancer Institution, Hanoi, Ha Dong, Vietnam	21.0268875000000008	105.8460836	110000
108	Hanoi Oncology Hospital	 Hanoi	 Hai Ba Trung	 Vietnam	Hanoi Oncology Hospital, Hanoi, Hai Ba Trung, Vietnam	21.0046172999999996	105.859167600000006	Vietnam
109	St George's Hospital		 London	 United Kingdom	St George's Hospital,, London, United Kingdom	51.4252255000000034	-0.174999399999999999	SW17 0QT
110	 The University of Hong Kong		 Hong Kong	 Hong Kong	 The University of Hong Kong,, Hong Kong, Hong Kong	22.2829988999999991	114.137084799999997	Hong Kong
111	Sedat Akbas	 Malatya	 Türkiye-Türkçe	 Turkey	Sedat Akbas, Malatya, Türkiye-Türkçe, Turkey	38.3553627000000006	38.3335247000000123	Turkey
112	Sedat Akbas	 Malatya	 Türkiye-Türkçe	 Turkey	Sedat Akbas, Malatya, Türkiye-Türkçe, Turkey	38.3553627000000006	38.3335247000000123	Turkey
113	UMHAT Burgas EAD		 Burgas	 Bulgaria	UMHAT Burgas EAD,, Burgas, Bulgaria	42.5047925999999876	27.462636100000001	Bulgaria
114	Multiprofile Hospital for Active Treatment		 Pleven	 Bulgaria	Multiprofile Hospital for Active Treatment,, Pleven, Bulgaria	43.4163842000000031	24.6284513999999994	5809
115	University Multiprofile Hospital for Active Treatment		 Plovdiv	 Bulgaria	University Multiprofile Hospital for Active Treatment,, Plovdiv, Bulgaria	42.1300014999999988	24.7159836000000013	4001
116	Urology Office Diagnostic-Consultative Center		 Varna	 Bulgaria	Urology Office Diagnostic-Consultative Center,, Varna, Bulgaria	43.2124904000000001	27.9098964000000009	Bulgaria
117	Medical Center Biomed		 Vidin	 Bulgaria	Medical Center Biomed,, Vidin, Bulgaria	43.9872234999999989	22.8765451000000013	3700
118	URAN MUDr.Jan Hiblbauer s.r.o		 Hradec Králové	 Czechia	URAN MUDr.Jan Hiblbauer s.r.o,, Hradec Králové, Czechia	50.2166210000000035	15.8538590999999993	500 03
119	ANDROGEOS	 spol. s.r.o.	 Praha	 Czechia	ANDROGEOS, spol. s.r.o., Praha, Czechia	50.0968449999999876	14.4072630000000004	160 00
120	Urosante s.r.o.		 Praha	 Czechia	Urosante s.r.o.,, Praha, Czechia	50.0489105999999992	14.4546112000000004	140 00
122	LTD Gidmedi		 Tbilisi	 Georgia	LTD Gidmedi,, Tbilisi, Georgia	41.7251686999999976	44.7639883000000012	Georgia
123	LTD Multiprofile Clinic Consilium Medulla		 Tbilisi	 Georgia	LTD Multiprofile Clinic Consilium Medulla,, Tbilisi, Georgia	41.7192526999999984	44.7144868999999971	Georgia
124	LTDHealth House		 Tbilisi	 Georgia	LTDHealth House,, Tbilisi, Georgia	41.7151376999999997	44.8270959999999974	Georgia
125	Semmelweis Egyetem ÁOK Urologiai Klinika		 Budapest	 Hungary	Semmelweis Egyetem ÁOK Urologiai Klinika,, Budapest, Hungary	47.4836300999999992	19.0832568999999985	1082
126	Synexus Magyarorszag Kft		 Budapest	 Hungary	Synexus Magyarorszag Kft,, Budapest, Hungary	47.5294560000000033	19.0382375999999987	1036
127	Civis Egeszseghaz		 Debrecen	 Hungary	Civis Egeszseghaz,, Debrecen, Hungary	47.5503197000000029	21.6123073999999988	4032
128	Korona Prevent-Med Kft.		 Sopron	 Hungary	Korona Prevent-Med Kft.,, Sopron, Hungary	47.6877137000000033	16.5900937000000006	9400
129	Aranyklinika		 Szeged	 Hungary	Aranyklinika,, Szeged, Hungary	46.2557821999999987	20.1517242000000003	6720
130	Latgales Urology Center		 Daugavpils	 Latvia	Latgales Urology Center,, Daugavpils, Latvia	55.8729524999999967	26.5225860000000004	5401
131	V. Lietuviesa Private Practice		 Riga	 Latvia	V. Lietuviesa Private Practice,, Riga, Latvia	56.9496486999999973	24.1051864999999985	Latvia
132	Vidzemes Hospital		 Valmiera	 Latvia	Vidzemes Hospital,, Valmiera, Latvia	57.5186796000000129	25.3848151000000009	4201
133	Indywidualna Specjalistyczna Praktyka Lekarska Dr Adam Sipinski		 Katowice	 Poland	Indywidualna Specjalistyczna Praktyka Lekarska Dr Adam Sipinski,, Katowice, Poland	50.2520400000000009	19.0073949000000013	40-065
134	PROVITA Specjalistyczna Praktyka Ginekologiczno-Seksuologiczna		 Lublin	 Poland	PROVITA Specjalistyczna Praktyka Ginekologiczno-Seksuologiczna,, Lublin, Poland	51.2627840999999975	22.5644548	20-093
135	Indywidualna Specjalistyczna Praktyka Lekarska		 Szczecin	 Poland	Indywidualna Specjalistyczna Praktyka Lekarska,, Szczecin, Poland	53.453001399999998	14.5476206999999995	71-472
136	Medea Specjalistyczny Gabinet Lekarski		 Warszawa	 Poland	Medea Specjalistyczny Gabinet Lekarski,, Warszawa, Poland	52.2296756000000002	21.0122287000000014	03
137	Gabinet Lekarski Ryszard Smolinski		 Wrocław	 Poland	Gabinet Lekarski Ryszard Smolinski,, Wrocław, Poland	51.1019519999999972	17.0255189999999992	53-532
138	"State Budgetary Healthcare Institution of Sverdlovskaya region ""Sverdlovskaya Regional Clinical Hospital No.1"""		 Ekaterinburg	 Russian Federation	"State Budgetary Healthcare Institution of Sverdlovskaya region ""Sverdlovskaya Regional Clinical Hospital No.1""",, Ekaterinburg, Russian Federation	56.9146003999999976	60.4780202000000031	620908
139	"Regional Budgetary Healthcare Institution ""Ivanovskaya Regional Clinical Hospital"""		 Ivanovo	 Russian Federation	"Regional Budgetary Healthcare Institution ""Ivanovskaya Regional Clinical Hospital""",, Ivanovo, Russian Federation	57.005067099999998	40.9766453000000013	Russia
140	"CJSC ""Nasledniki"""		 Moscow	 Russian Federation	"CJSC ""Nasledniki""",, Moscow, Russian Federation	55.755825999999999	37.617299899999999	Russia
141	"Federal State Budgetary Institution ""National Medical Research Center of Obstetrics"	" Gynecology and Perinatology n.a. acad. V.I. Kulakov"" of the Ministry of Healthcare of the Russian Federation"	 Moscow	 Russian Federation	"Federal State Budgetary Institution ""National Medical Research Center of Obstetrics"," Gynecology and Perinatology n.a. acad. V.I. Kulakov"" of the Ministry of Healthcare of the Russian Federation", Moscow, Russian Federation	55.755825999999999	37.617299899999999	Russia
142	 Russian Gerontological Scientific and Research Center		 Moscow	 Russian Federation	 Russian Gerontological Scientific and Research Center,, Moscow, Russian Federation	55.755825999999999	37.617299899999999	Russia
143	"LLC ""Bessalar Clinic"""		 Moscow	 Russian Federation	"LLC ""Bessalar Clinic""",, Moscow, Russian Federation	55.7709049999999991	37.4658931000000024	123423
144	"LLC ""Unimed-S"""		 Moscow	 Russian Federation	"LLC ""Unimed-S""",, Moscow, Russian Federation	55.755825999999999	37.617299899999999	Russia
145	"State Budgetary Institution ""Hospital for War Veterans"""		 Rostov-on-Don	 Russian Federation	"State Budgetary Institution ""Hospital for War Veterans""",, Rostov-on-Don, Russian Federation	47.235713699999998	39.7015049999999974	Russia
146	"Federal State Budgetary Educational Institution of Higher Education ""North-Western State Medical University n.a. I.I. Mechnikov"" of the Ministry of Healthcare of the Russian Federation"		 Saint Petersburg	 Russian Federation	"Federal State Budgetary Educational Institution of Higher Education ""North-Western State Medical University n.a. I.I. Mechnikov"" of the Ministry of Healthcare of the Russian Federation",, Saint Petersburg, Russian Federation	59.9831770999999989	30.4333163999999989	195067
147	"LLC ""Medical center PRIME ROSE"""		 Saint Petersburg	 Russian Federation	"LLC ""Medical center PRIME ROSE""",, Saint Petersburg, Russian Federation	59.9342802000000034	30.3350985999999985	Russia
148	"LLC ""Sanavita"""		 Saint Petersburg	 Russian Federation	"LLC ""Sanavita""",, Saint Petersburg, Russian Federation	59.9342802000000034	30.3350985999999985	Russia
149	Llc <<Mart>>		 Saint Petersburg	 Russian Federation	Llc <<Mart>>,, Saint Petersburg, Russian Federation	59.9342802000000034	30.3350985999999985	Russia
150	 branch of Saint-Petersburg State Unitary Institution of road passenger transport		 Saint Petersburg	 Russian Federation	 branch of Saint-Petersburg State Unitary Institution of road passenger transport,, Saint Petersburg, Russian Federation	59.9342802000000034	30.3350985999999985	Russia
151	"Research Center ""Eco-Safety"""		 Saint Petersburg	 Russian Federation	"Research Center ""Eco-Safety""",, Saint Petersburg, Russian Federation	59.9324521999999931	30.4341352000000001	195213
152	"Saint Petersburg State Budgetary Healthcare Institution ""City Polyclinic No. 4"""		 Saint Petersburg	 Russian Federation	"Saint Petersburg State Budgetary Healthcare Institution ""City Polyclinic No. 4""",, Saint Petersburg, Russian Federation	59.9342802000000034	30.3350985999999985	Russia
153	"Clinical Hospital n.a. S.R. Mirotvortseva of the Federal State Budgetary Educational Institution of Higher Education ""Saratovskiy State Medical University n.a. V.I. Razumovskiy"" of the Ministry of Healthcare of the Russian Federation"		 Saratov	 Russian Federation	"Clinical Hospital n.a. S.R. Mirotvortseva of the Federal State Budgetary Educational Institution of Higher Education ""Saratovskiy State Medical University n.a. V.I. Razumovskiy"" of the Ministry of Healthcare of the Russian Federation",, Saratov, Russian Federation	51.5923653999999985	45.9608030999999997	Russia
154	"Federal State Budgetary Educational Institution of Higher Education "" Voronezhskiy State Medical University n.a. N.N. Burdenko"" of the Ministry of Healthcare of the Russian Federation on the clinical base of Budgetary Healthcare Institution of Voronezhsk"		 Voronezh	 Russian Federation	"Federal State Budgetary Educational Institution of Higher Education "" Voronezhskiy State Medical University n.a. N.N. Burdenko"" of the Ministry of Healthcare of the Russian Federation on the clinical base of Budgetary Healthcare Institution of Voronezhsk",, Voronezh, Russian Federation	51.6462580000000031	39.1019110000000012	394065
155	"SBHI of Leningradskaya region ""Vsevolozhskaya Clinical Interdistrict Hospital"""		 Vsevolozhsk	 Russian Federation	"SBHI of Leningradskaya region ""Vsevolozhskaya Clinical Interdistrict Hospital""",, Vsevolozhsk, Russian Federation	60.0375419999999878	30.6312162000000008	188643
156	"FSBEI HPE ""Yaroslavskiy State Medical University"" of The Ministry of Healthcare of the Russian Federation with clinical base in State Autonomous Institution of Yaroslavskaya region ""Clinical Hospital No.9"""		 Yaroslavl	 Russian Federation	"FSBEI HPE ""Yaroslavskiy State Medical University"" of The Ministry of Healthcare of the Russian Federation with clinical base in State Autonomous Institution of Yaroslavskaya region ""Clinical Hospital No.9""",, Yaroslavl, Russian Federation	57.6260744000000074	39.8844708999999966	Russia
157	CUIMED		 Bratislava	 Slovakia	CUIMED,, Bratislava, Slovakia	48.1556350999999978	17.1630229000000014	821 01
158	Urologicka ambulancia		 Košice	 Slovakia	Urologicka ambulancia,, Košice, Slovakia	48.7127669999999995	21.2364689999999996	Slovakia
159	Urologicka ambulancia Urobet s.r.o.		 Malacky	 Slovakia	Urologicka ambulancia Urobet s.r.o.,, Malacky, Slovakia	48.4407989999999984	17.0338619999999992	Slovakia
160	Urologicka ambulancia - Uromeda s.r.o.		 Martin	 Slovakia	Urologicka ambulancia - Uromeda s.r.o.,, Martin, Slovakia	49.0668075999999971	18.9197480999999996	036 01
161	Urologicka ambulancia Uroexam s.r.o.		 Nitra	 Slovakia	Urologicka ambulancia Uroexam s.r.o.,, Nitra, Slovakia	48.3022925000000001	18.087363400000001	949 01
162	Privatna urologicka ambulancia s.r.o.		 Trenčín	 Slovakia	Privatna urologicka ambulancia s.r.o.,, Trenčín, Slovakia	48.8896575999999996	18.0329484999999998	911 01
163	 Urology department		 Cherkasy	 Ukraine	 Urology department,, Cherkasy, Ukraine	49.4444329999999965	32.0597670000000008	18000
164	 Urology department		 Cherkasy	 Ukraine	 Urology department,, Cherkasy, Ukraine	49.4444329999999965	32.0597670000000008	18000
165	 Urology department		 Cherkasy	 Ukraine	 Urology department,, Cherkasy, Ukraine	49.4444329999999965	32.0597670000000008	18000
166	 Polyclinic Department		 Ivano-Frankivs'k	 Ukraine	 Polyclinic Department,, Ivano-Frankivs'k, Ukraine	48.9226329999999976	24.7111170000000016	76000
167	 consulting and diagnostic center		 Kyiv	 Ukraine	 consulting and diagnostic center,, Kyiv, Ukraine	50.5005214999999978	30.5049811999999996	04210
168	" ""Medical Center ""Consilium Medical"""""		 Kyiv	 Ukraine	" ""Medical Center ""Consilium Medical""""",, Kyiv, Ukraine	50.4625345999999979	30.4910227999999996	04050
169	"State Institution ""Institute of urology of the National Academy of Medical Science of Ukraine"""		 Kyiv	 Ukraine	"State Institution ""Institute of urology of the National Academy of Medical Science of Ukraine""",, Kyiv, Ukraine	50.4500999999999991	30.5233999999999988	02000
170	 policlinic department		 Kyiv	 Ukraine	 policlinic department,, Kyiv, Ukraine	50.4500999999999991	30.5233999999999988	02000
171	 Department of Sexual Pathology and Andrology		 Kyiv	 Ukraine	 Department of Sexual Pathology and Andrology,, Kyiv, Ukraine	50.4500999999999991	30.5233999999999988	02000
172	 Department of Sexual Pathology and Andrology		 Kyiv	 Ukraine	 Department of Sexual Pathology and Andrology,, Kyiv, Ukraine	50.4500999999999991	30.5233999999999988	02000
173	 Department of Sexual Pathology and Andrology		 Kyiv	 Ukraine	 Department of Sexual Pathology and Andrology,, Kyiv, Ukraine	50.4500999999999991	30.5233999999999988	02000
174	 Therapeutic Department		 Vinnytsia	 Ukraine	 Therapeutic Department,, Vinnytsia, Ukraine	49.2330830000000006	28.4682169000000016	21000
175	 Therapeutic Department		 Vinnytsia	 Ukraine	 Therapeutic Department,, Vinnytsia, Ukraine	49.2330830000000006	28.4682169000000016	21000
176	" consulting and medical department ""Research center"""		 Zhytomyr	 Ukraine	" consulting and medical department ""Research center""",, Zhytomyr, Ukraine	50.254649999999998	28.6586669000000001	10000
178	Fred Hollows Foundation		 Addis Ababa	 Ethiopia	Fred Hollows Foundation,, Addis Ababa, Ethiopia	8.98060339999999968	38.7577605000000034	Ethiopia
179	London School of Hygiene and Tropical Medicine		 London	 United Kingdom	London School of Hygiene and Tropical Medicine,, London, United Kingdom	51.5209006999999986	-0.130280299999999988	WC1E 7HT
180	New York State Psychiatric Institute	 New York	 New York	 United States	New York State Psychiatric Institute, New York, New York, United States	40.8425117000000029	-73.9444142999999912	1098
181	The First Affiliated Hospital of Jinan University	 Guangzhou	 Guangdong	 China	The First Affiliated Hospital of Jinan University, Guangzhou, Guangdong, China	23.1260900000000014	113.350537000000003	China
182	Aultman Tusc Therapy	 Canton	 Ohio	 United States	Aultman Tusc Therapy, Canton, Ohio, United States	40.7991373999999993	-81.4044804999999911	4603
183	Hospital for Sick Children	 Toronto	 Ontario	 Canada	Hospital for Sick Children, Toronto, Ontario, Canada	43.6573064999999971	-79.3874268000000001	M5G 1X8
184	John Radcliffe Hospital		 Oxford	 United Kingdom	John Radcliffe Hospital,, Oxford, United Kingdom	51.7642712999999972	-1.22055960000000008	OX3 9DU
185	Aarhus University		 Aarhus	 Denmark	Aarhus University,, Aarhus, Denmark	56.1681383999999966	10.2030118000000005	8000
186	University of Miami	 Miami	 Florida	 United States	University of Miami, Miami, Florida, United States	25.7191684999999985	-80.2771252999999945	33146
187	The Ohio State University	 Columbus	 Ohio	 United States	The Ohio State University, Columbus, Ohio, United States	40.014190499999998	-83.0309142999999921	43210
188	University of Florida Health	 Tampa	 Florida	 United States	University of Florida Health, Tampa, Florida, United States	28.0673299000000007	-82.4249728000000061	3805
189	University Hospital Antwerp		 Antwerp	 Belgium	University Hospital Antwerp,, Antwerp, Belgium	51.1576929999999876	4.41081090000000042	2650
190	Imelda Hospital Bonheiden		 Bonheiden	 Belgium	Imelda Hospital Bonheiden,, Bonheiden, Belgium	51.0173723999999993	4.56020120000000073	2820
191	Academic Hospital Sint Jan Bruges-Ostend		 Bruges	 Belgium	Academic Hospital Sint Jan Bruges-Ostend,, Bruges, Belgium	51.2206672000000012	3.19328479999999981	8000
192	Academic Hospital Diest		 Diest	 Belgium	Academic Hospital Diest,, Diest, Belgium	50.9865269000000012	5.05205089999999934	3290
193	University Hospitals Leuven		 Leuven	 Belgium	University Hospitals Leuven,, Leuven, Belgium	50.8803326999999967	4.69534590000000041	3000
194	William Beaumont Hospital	 Royal Oak	 Michigan	 United States	William Beaumont Hospital, Royal Oak, Michigan, United States	42.5143555000000006	-83.1928130999999951	48073
195	William Beaumont Hospital	 Royal Oak	 Michigan	 United States	William Beaumont Hospital, Royal Oak, Michigan, United States	42.5143555000000006	-83.1928130999999951	48073
196	Erol Karaaslan	 Malatya	 Türkiye-Türkçe	 Turkey	Erol Karaaslan, Malatya, Türkiye-Türkçe, Turkey	38.3553627000000006	38.3335247000000123	Turkey
197	Erol Karaaslan	 Malatya	 Türkiye-Türkçe	 Turkey	Erol Karaaslan, Malatya, Türkiye-Türkçe, Turkey	38.3553627000000006	38.3335247000000123	Turkey
198	Erol Karaaslan	 Malatya	 Türkiye-Türkçe	 Turkey	Erol Karaaslan, Malatya, Türkiye-Türkçe, Turkey	38.3553627000000006	38.3335247000000123	Turkey
199	Elegant And Olive Health Clinic	 Markham	 Ontario	 Canada	Elegant And Olive Health Clinic, Markham, Ontario, Canada	43.8326492999999999	-79.328848899999997	L3R 5V6
200	Elegant And Olive Health Clinic	 Markham	 Ontario	 Canada	Elegant And Olive Health Clinic, Markham, Ontario, Canada	43.8326492999999999	-79.328848899999997	L3R 5V6
201	Columbia University Medical Center - Harkness Pavillion	 New York	 New York	 United States	Columbia University Medical Center - Harkness Pavillion, New York, New York, United States	40.8411210000000011	-73.9423639999999978	3722
202	Kaleida Health - Buffalo General Medical Center	 Buffalo	 New York	 United States	Kaleida Health - Buffalo General Medical Center, Buffalo, New York, United States	42.9018676000000028	-78.8662872000000021	14203
203	Upstate University Hospital	 Syracuse	 New York	 United States	Upstate University Hospital, Syracuse, New York, United States	43.0422979000000012	-76.1395978999999983	13210
204	Westchester Medical Center	 Valhalla	 New York	 United States	Westchester Medical Center, Valhalla, New York, United States	41.0861706999999967	-73.806244300000003	10595
205	Abington Hospital	 Abington	 Pennsylvania	 United States	Abington Hospital, Abington, Pennsylvania, United States	40.1194399999999973	-75.1206349999999929	19001
206	Thomas Jefferson University/Hospital	 Philadelphia	 Pennsylvania	 United States	Thomas Jefferson University/Hospital, Philadelphia, Pennsylvania, United States	39.9494542000000123	-75.1580300999999906	4824
207	Gemelli Hospital	 Roma	 RM	 Italy	Gemelli Hospital, Roma, RM, Italy	41.9307779999999966	12.4305152999999997	00168
208	"Praxisgemeinschaft ""Bewegungsoase"""		 Vienna	 Austria	"Praxisgemeinschaft ""Bewegungsoase""",, Vienna, Austria	48.2038787999999983	16.3340181999999992	1150
209	Haukeland University Hospital - Kysthospitalet Hagevik		 Bergen	 Norway	Haukeland University Hospital - Kysthospitalet Hagevik,, Bergen, Norway	60.3739405999999974	5.35948099999999972	5021
210	Lovisenberg Diaconal Hospital		 Oslo	 Norway	Lovisenberg Diaconal Hospital,, Oslo, Norway	59.9333611000000133	10.7468815000000006	0456
211	Lovisenberg Diaconal Hospital		 Oslo	 Norway	Lovisenberg Diaconal Hospital,, Oslo, Norway	59.9333611000000133	10.7468815000000006	0456
212	Lovisenberg Diaconal Hospital		 Oslo	 Norway	Lovisenberg Diaconal Hospital,, Oslo, Norway	59.9333611000000133	10.7468815000000006	0456
213	 Karolinska University Hospital		 Stockholm	 Sweden	 Karolinska University Hospital,, Stockholm, Sweden	59.3510442999999981	18.0335037999999983	171 76
214	 Karolinska University Hospital		 Stockholm	 Sweden	 Karolinska University Hospital,, Stockholm, Sweden	59.3510442999999981	18.0335037999999983	171 76
215	 Karolinska University Hospital		 Stockholm	 Sweden	 Karolinska University Hospital,, Stockholm, Sweden	59.3510442999999981	18.0335037999999983	171 76
216	Borama Mosque		 Borama	 Somalia	Borama Mosque,, Borama, Somalia	9.94013599999999897	43.1852342999999976	Somalia
217	Hargeisa Mosque		 Hargeisa	 Somalia	Hargeisa Mosque,, Hargeisa, Somalia	9.56114809999999871	44.0712143000000012	Somalia
218	Public Dental Health		 Jönköping	 Sweden	Public Dental Health,, Jönköping, Sweden	57.7826137000000131	14.1617876000000003	Sweden
219	VA Portland Healthcare System	 Portland	 Oregon	 United States	VA Portland Healthcare System, Portland, Oregon, United States	45.4968705	-122.683768000000001	2964
220	BMJ Open		 London	 United Kingdom	BMJ Open,, London, United Kingdom	51.5073508999999987	-0.127758299999999991	United Kingdom
221	Newcastle upon Tyne NHS trust	 Newcastle Upon Tyne	 Tyne And Wear	 United Kingdom	Newcastle upon Tyne NHS trust, Newcastle Upon Tyne, Tyne And Wear, United Kingdom	55.003028399999998	-1.59294559999999996	NE7 7DN
222	Newcastle upon Tyne NHS trust	 Newcastle Upon Tyne	 Tyne And Wear	 United Kingdom	Newcastle upon Tyne NHS trust, Newcastle Upon Tyne, Tyne And Wear, United Kingdom	55.003028399999998	-1.59294559999999996	NE7 7DN
223	SUNY at Buffalo	 Buffalo	 New York	 United States	SUNY at Buffalo, Buffalo, New York, United States	43.0008093000000002	-78.7889696999999956	14260
224	Kingston General Hospital	 Kingston	 Ontario	 Canada	Kingston General Hospital, Kingston, Ontario, Canada	44.2241659000000027	-76.4927093000000013	K7L 2V7
225	Arcispedale santa maria nuova-viale risorgimento 80	 Reggio Emilia	 Emilia Romagna	 Italy	Arcispedale santa maria nuova-viale risorgimento 80, Reggio Emilia, Emilia Romagna, Italy	44.6847959999999986	10.6297940000000004	42123
226	Viale Risorgimento 80		 Reggio Emilia	 Italy	Viale Risorgimento 80,, Reggio Emilia, Italy	44.6836330000000004	10.6317266999999998	42123
227	ASST Santi Paolo e Carlo di Milano - P.O. San Paolo di Milano	 Milano	 MI	 Italy	ASST Santi Paolo e Carlo di Milano - P.O. San Paolo di Milano, Milano, MI, Italy	45.4334076999999965	9.15985579999999899	20142
228	A.O.U. Pisana - P.O. di Cisanello	 Pisa	 PI	 Italy	A.O.U. Pisana - P.O. di Cisanello, Pisa, PI, Italy	43.7056004000000016	10.4434913999999992	56124
229	A.O.U. Pisana - P.O. di Cisanello	 Pisa	 PI	 Italy	A.O.U. Pisana - P.O. di Cisanello, Pisa, PI, Italy	43.7056004000000016	10.4434913999999992	56124
230	A.O.U. Osp. Riuniti Umberto I - G.M. Lancisi - G. Salesi - Università degli Studi di Ancona	 Ancona	 AN	 Italy	A.O.U. Osp. Riuniti Umberto I - G.M. Lancisi - G. Salesi - Università degli Studi di Ancona, Ancona, AN, Italy	43.6026491000000007	13.4538758999999999	60030
231	"Ospedale della Murgia ""Fabio Perinei"" di Altamura"	 Altamura	 BA	 Italy	"Ospedale della Murgia ""Fabio Perinei"" di Altamura", Altamura, BA, Italy	40.8201427999999993	16.4695254999999996	70022
232	A.O.U. Policlinico Consorziale di Bari	 Bari	 BA	 Italy	A.O.U. Policlinico Consorziale di Bari, Bari, BA, Italy	41.1104964000000024	16.8565678000000005	70124
233	"ASL Bari - Ospedale ""Di Venere"" - Carbonara di Bari"	 Bari	 BA	 Italy	"ASL Bari - Ospedale ""Di Venere"" - Carbonara di Bari", Bari, BA, Italy	41.0731149000000002	16.8643196000000017	70131
234	Cliniche Gavazzeni S.p.A. - Humanitas Gavazzeni di Bergamo	 Bergamo	 BG	 Italy	Cliniche Gavazzeni S.p.A. - Humanitas Gavazzeni di Bergamo, Bergamo, BG, Italy	45.688769299999997	9.67900039999999962	24125
235	A.O.U. di Bologna - Policlinico S. Orsola-Malpighi di Bologna	 Bologna	 BO	 Italy	A.O.U. di Bologna - Policlinico S. Orsola-Malpighi di Bologna, Bologna, BO, Italy	44.4926877999999988	11.3603582000000003	40138
236	Policlinico S. Orsola-Malpighi di Bologna	 Bologna	 BO	 Italy	Policlinico S. Orsola-Malpighi di Bologna, Bologna, BO, Italy	44.4917102	11.3628625999999997	40138
237	ASST degli Spedali Civili di Brescia - P.O. Spedali Civili di Brescia	 Brescia	 BS	 Italy	ASST degli Spedali Civili di Brescia - P.O. Spedali Civili di Brescia, Brescia, BS, Italy	45.5614101000000034	10.2337070000000008	25123
238	ASST Franciacorta - P.O. di Chiari	 Chiari	 BS	 Italy	ASST Franciacorta - P.O. di Chiari, Chiari, BS, Italy	45.5379172999999966	9.93090570000000028	25032
239	P.O. Ospedale Clinicizzato SS. Annunziata di Chieti	 Chieti	 CH	 Italy	P.O. Ospedale Clinicizzato SS. Annunziata di Chieti, Chieti, CH, Italy	42.3657900999999981	14.1529012000000005	66100
240	Ospedale Valduce di Como	 Como	 CO	 Italy	Ospedale Valduce di Como, Como, CO, Italy	45.8107271000000011	9.08869249999999873	22100
241	A.O.U. Policlinico Vittorio Emanuele - P.O. Gaspare Rodolico - Università degli Studi di Catania	 Catania	 CT	 Italy	A.O.U. Policlinico Vittorio Emanuele - P.O. Gaspare Rodolico - Università degli Studi di Catania, Catania, CT, Italy	37.5293360999999877	15.0693985999999995	95125
242	Policlinico G.B. Morgagni di Catania - Casa di Cura s.r.l.	 Catania	 CT	 Italy	Policlinico G.B. Morgagni di Catania - Casa di Cura s.r.l., Catania, CT, Italy	37.5333872	15.0794425000000007	95125
243	A.O. Mater Domini di Catanzaro - Università degli Studi Magna Graecia di Catanzaro	 Catanzaro	 CZ	 Italy	A.O. Mater Domini di Catanzaro - Università degli Studi Magna Graecia di Catanzaro, Catanzaro, CZ, Italy	38.868692099999997	16.5787739000000016	88100
244	IRCCS Casa Sollievo della Sofferenza di San Giovanni Rotondo	 San Giovanni Rotondo	 FG	 Italy	IRCCS Casa Sollievo della Sofferenza di San Giovanni Rotondo, San Giovanni Rotondo, FG, Italy	41.7085063999999974	15.7019132999999993	71013
245	A.O.U. Careggi di Firenze	 Firenze	 FI	 Italy	A.O.U. Careggi di Firenze, Firenze, FI, Italy	43.8038292999999967	11.2465779999999995	50134
246	IRCCS Ospedale Policlinico San Martino di Genova	 Genova	 GE	 Italy	IRCCS Ospedale Policlinico San Martino di Genova, Genova, GE, Italy	44.4075380000000024	8.97034099999999945	16132
247	Ospedale Policlinico San Martino - Università degli Studi di Genova	 Genova	 GE	 Italy	Ospedale Policlinico San Martino - Università degli Studi di Genova, Genova, GE, Italy	44.4075380000000024	8.97034099999999945	16132
248	"Fatebenefratelli - Ospedale ""Sacra Famiglia"" di Erba"	 Erba	 LC	 Italy	"Fatebenefratelli - Ospedale ""Sacra Famiglia"" di Erba", Erba, LC, Italy	45.816710999999998	9.22558399999999956	22036
249	Az. USL Toscana Nord Ovest - Ospedale della Versilia	 Lido Di Camaiore	 LU	 Italy	Az. USL Toscana Nord Ovest - Ospedale della Versilia, Lido Di Camaiore, LU, Italy	43.9142268000000016	10.2240918999999995	55049
250	AUSL Toscana Nord Ovest - P.O. San Luca di Lucca	 San Filippo	 LU	 Italy	AUSL Toscana Nord Ovest - P.O. San Luca di Lucca, San Filippo, LU, Italy	43.8426040000000015	10.5329318000000001	55100
251	"A.O.U. Policlinico ""G. Martino"" di Messina"	 Messina	 ME	 Italy	"A.O.U. Policlinico ""G. Martino"" di Messina", Messina, ME, Italy	38.1653014999999982	15.5380047000000001	98124
252	"ASP di Messina - P.O. ""Giuseppe Fogliani"" di Milazzo"	 Milazzo	 ME	 Italy	"ASP di Messina - P.O. ""Giuseppe Fogliani"" di Milazzo", Milazzo, ME, Italy	38.2266728000000029	15.2412346000000003	98057
253	ASST Ovest Milanese - Ospedale Civile di Legnano	 Legnano	 MI	 Italy	ASST Ovest Milanese - Ospedale Civile di Legnano, Legnano, MI, Italy	45.5809645000000003	8.8877606999999994	20025
254	IRCCS Ca' Granda Ospedale Maggiore Policlinico di Milano	 Milano	 MI	 Italy	IRCCS Ca' Granda Ospedale Maggiore Policlinico di Milano, Milano, MI, Italy	45.4592627999999976	9.19590990000000019	20122
255	Gruppo Multimedica - Ospedale San Giuseppe di Milano	 Milano	 MI	 Italy	Gruppo Multimedica - Ospedale San Giuseppe di Milano, Milano, MI, Italy	45.4599440000000001	9.1995799999999992	20122
256	Ospedale San Raffaele IRCCS S.r.l.	 Milano	 MI	 Italy	Ospedale San Raffaele IRCCS S.r.l., Milano, MI, Italy	45.5049962999999877	9.26575540000000153	20132
257	ASST Fatebenefratelli Sacco - Università degli Studi di Milano - Ospedale L. Sacco	 Milano	 MI	 Italy	ASST Fatebenefratelli Sacco - Università degli Studi di Milano - Ospedale L. Sacco, Milano, MI, Italy	45.5193926999999974	9.12595299999999909	20157
258	IRCCS Istituto Clinico Humanitas di Rozzano	 Rozzano	 MI	 Italy	IRCCS Istituto Clinico Humanitas di Rozzano, Rozzano, MI, Italy	45.3720270000000028	9.16749800000000015	20089
259	ASST di Melegnano e della Martesana - Ospedale di Vizzolo Predabissi	 Vizzolo Predabissi	 MI	 Italy	ASST di Melegnano e della Martesana - Ospedale di Vizzolo Predabissi, Vizzolo Predabissi, MI, Italy	45.358940699999998	9.34062370000000008	20077
260	A.O.U. Policlinico di Modena - Università degli Studi di Modena e Reggio Emilia	 Modena	 MO	 Italy	A.O.U. Policlinico di Modena - Università degli Studi di Modena e Reggio Emilia, Modena, MO, Italy	44.6354894999999985	10.9425871000000008	41125
261	Ospedale di Sassuolo	 Sassuolo	 MO	 Italy	Ospedale di Sassuolo, Sassuolo, MO, Italy	44.5313941	10.7929361999999998	41049
262	Centro Polispecialistico Monterosso di Carrara	 Carrara	 MS	 Italy	Centro Polispecialistico Monterosso di Carrara, Carrara, MS, Italy	44.0805049000000011	10.1046768	54033
263	"A.O.U. Policlinico ""P. Giaccone"" di Palermo"	 Palermo	 PA	 Italy	"A.O.U. Policlinico ""P. Giaccone"" di Palermo", Palermo, PA, Italy	38.1031730999999994	13.3620104000000008	90127
264	"A.O. ""Ospedali Riuniti Villa Sofia-Cervello"" di Palermo - P.O. ""Villa Sofia"" di Palermo"	 Palermo	 PA	 Italy	"A.O. ""Ospedali Riuniti Villa Sofia-Cervello"" di Palermo - P.O. ""Villa Sofia"" di Palermo", Palermo, PA, Italy	38.1584654999999984	13.3249580999999999	90146
265	"AUSL di Piacenza - Ospedale ""Guglielmo da Saliceto"" di Piacenza"	 Piacenza	 PC	 Italy	"AUSL di Piacenza - Ospedale ""Guglielmo da Saliceto"" di Piacenza", Piacenza, PC, Italy	45.0551612999999875	9.68099899999999991	29121
266	Az. ULSS 6 Euganea - Ospedali Riuniti Padova Sud - Ospedale Madre Teresa di Calcutta-Schiavonia	 Monselice	 PD)	 Italy	Az. ULSS 6 Euganea - Ospedali Riuniti Padova Sud - Ospedale Madre Teresa di Calcutta-Schiavonia, Monselice, PD), Italy	45.2065908000000007	11.7211558	35043
267	Az. ULSS 6 Euganea - Ospedale S. Antonio - Centro Oculistico San Paolo di Padova	 Padova	 PD	 Italy	Az. ULSS 6 Euganea - Ospedale S. Antonio - Centro Oculistico San Paolo di Padova, Padova, PD, Italy	45.3927758999999966	11.8917480999999992	35127
268	A.O. di Perugia - Ospedale S. Maria della Misericordia di Perugia	 Perugia	 PG	 Italy	A.O. di Perugia - Ospedale S. Maria della Misericordia di Perugia, Perugia, PG, Italy	43.0799498000000014	12.3549521000000002	06129
269	Fondazione IRCCS Policlinico S. Matteo - Università degli Studi di Pavia	 Pavia	 PV	 Italy	Fondazione IRCCS Policlinico S. Matteo - Università degli Studi di Pavia, Pavia, PV, Italy	45.1961078000000001	9.14883689999999916	27100
270	Grande Ospedale Metropolitano Bianchi-Melacrino-Morelli di Reggio Calabria	 Reggio Calabria	 RC	 Italy	Grande Ospedale Metropolitano Bianchi-Melacrino-Morelli di Reggio Calabria, Reggio Calabria, RC, Italy	38.1125098999999992	15.6552779999999991	89124
271	Policlinico Universitario Campus Bio-medico di Roma	 Roma	 RM	 Italy	Policlinico Universitario Campus Bio-medico di Roma, Roma, RM, Italy	41.7708907999999965	12.4681084999999996	00128
272	Fondazione PTV Policlinico Tor Vergata	 Roma	 RM	 Italy	Fondazione PTV Policlinico Tor Vergata, Roma, RM, Italy	41.8582857999999973	12.6311473000000003	00133
273	A.O.U. Sant'Andrea di Roma	 Roma	 RM	 Italy	A.O.U. Sant'Andrea di Roma, Roma, RM, Italy	41.8962191999999973	12.4743481999999997	00186
274	IRCCS Fondazione G.B. Bietti di Roma	 Roma	 RM	 Italy	IRCCS Fondazione G.B. Bietti di Roma, Roma, RM, Italy	41.9136777000000009	12.4955312999999997	00198
275	ASL Roma 4 - Ospedale San Paolo di Civitavecchia	 Civitavecchia	 RN	 Italy	ASL Roma 4 - Ospedale San Paolo di Civitavecchia, Civitavecchia, RN, Italy	42.0981464999999986	11.8097145000000001	00053
276	"Az. ULSS 5 Polesana - Ospedale ""Santa Maria della Misericordia"""	 Rovigo	 RO	 Italy	"Az. ULSS 5 Polesana - Ospedale ""Santa Maria della Misericordia""", Rovigo, RO, Italy	34.0489280999999977	-111.093731099999999	United States
277	A.O.U Città della Salute e della Scienza di Torino - Ospedale Molinette	 Torino	 TO	 Italy	A.O.U Città della Salute e della Scienza di Torino - Ospedale Molinette, Torino, TO, Italy	45.0413665000000023	7.67426079999999988	10126
278	Az. Sanitaria Universitaria Integrata di Trieste - Ospedali Riuniti di Trieste - Ospedale Maggiore	 Trieste	 TS	 Italy	Az. Sanitaria Universitaria Integrata di Trieste - Ospedali Riuniti di Trieste - Ospedale Maggiore, Trieste, TS, Italy	34.0489280999999977	-111.093731099999999	United States
279	Az. ULSS 2 Marca Trevigiana - Ospedale di Treviso	 Treviso	 TV	 Italy	Az. ULSS 2 Marca Trevigiana - Ospedale di Treviso, Treviso, TV, Italy	45.6597185999999979	12.2619810000000005	31100
280	"Az. Sanitaria Universitaria Integrata di Udine - P.O. Universitario ""Santa Maria della Misericordia"" diUdine"	 Udine	 UD	 Italy	"Az. Sanitaria Universitaria Integrata di Udine - P.O. Universitario ""Santa Maria della Misericordia"" diUdine", Udine, UD, Italy	34.0489280999999977	-111.093731099999999	United States
281	Az. ULSS 7 Pedemontana - Ospedale San Bassiano di Bassano del Grappa	 Bassano Del Grappa	 VI	 Italy	Az. ULSS 7 Pedemontana - Ospedale San Bassiano di Bassano del Grappa, Bassano Del Grappa, VI, Italy	45.7473462999999967	11.7443513999999993	36061
282	Ospedale Sacro Cuore - Don Calabria di Negrar	 Negrar	 VR	 Italy	Ospedale Sacro Cuore - Don Calabria di Negrar, Negrar, VR, Italy	45.5303850999999966	10.9364015000000006	37024
283	A.O.U. Integrata di Verona - Ospedale Borgo Roma	 Verona	 VR	 Italy	A.O.U. Integrata di Verona - Ospedale Borgo Roma, Verona, VR, Italy	45.4522963000000004	10.9844667000000005	37126
284	"Az. Osp. di Rilievo Nazionale ""A. Cardarelli"" di Napoli"		 Napoli	 Italy	"Az. Osp. di Rilievo Nazionale ""A. Cardarelli"" di Napoli",, Napoli, Italy	40.8651106000000013	14.2258286999999992	80131
285	"A.O.U. ""Maggiore della Carità"" di Novara"		 Novara	 Italy	"A.O.U. ""Maggiore della Carità"" di Novara",, Novara, Italy	45.4439362999999972	8.62248529999999924	28100
286	A.O.U. Senese - Università degli Studi di Siena		 Siena	 Italy	A.O.U. Senese - Università degli Studi di Siena,, Siena, Italy	43.342362399999999	11.3288253999999995	53100
287	Zuyderland Medical Center	 Sittard	 Limburg	 Netherlands	Zuyderland Medical Center, Sittard, Limburg, Netherlands	50.9834790000000027	5.84539999999999971	6162 BG
288	John D Dingell VA Medical Center	 Detroit	 Michigan	 United States	John D Dingell VA Medical Center, Detroit, Michigan, United States	42.3556651999999971	-83.0591577000000001	48201
289	Wayne State University	 Detroit	 Michigan	 United States	Wayne State University, Detroit, Michigan, United States	42.3591387999999966	-83.0665461999999906	48202
290	Phoenix Children's Hospital	 Phoenix	 Arizona	 United States	Phoenix Children's Hospital, Phoenix, Arizona, United States	33.4789774999999992	-112.040882300000007	85016
291	Children's Hospital Los Angeles	 Los Angeles	 California	 United States	Children's Hospital Los Angeles, Los Angeles, California, United States	34.0975538	-118.290095699999995	90027
292	Rady Children's Hospital	 San Diego	 California	 United States	Rady Children's Hospital, San Diego, California, United States	32.797980299999999	-117.151497699999993	4223
293	Benioff Children's Hospital	 San Francisco	 California	 United States	Benioff Children's Hospital, San Francisco, California, United States	37.7648523000000012	-122.390158499999998	94158
294	Lucile Packard Children's Hospital	 Stanford	 California	 United States	Lucile Packard Children's Hospital, Stanford, California, United States	37.4368081000000004	-122.173053600000003	94304
295	Children's Hospital Colorado	 Aurora	 Colorado	 United States	Children's Hospital Colorado, Aurora, Colorado, United States	39.7416547999999992	-104.835290599999993	80045
296	Doernbecher Children's Hospital	 Portland	 Oregon	 United States	Doernbecher Children's Hospital, Portland, Oregon, United States	45.4976211000000035	-122.685859300000004	97239
297	Primary Children's Hospital	 Salt Lake City	 Utah	 United States	Primary Children's Hospital, Salt Lake City, Utah, United States	40.7711079999999981	-111.838905600000004	84113
298	Seattle Children's Hospital	 Seattle	 Washington	 United States	Seattle Children's Hospital, Seattle, Washington, United States	47.6621517000000026	-122.280440799999994	3901
300	Centre on Behavioral Health HKU		 Hong Kong	 Hong Kong	Centre on Behavioral Health HKU,, Hong Kong, Hong Kong	22.2823361999999996	114.139118300000007	Hong Kong
302	Royal Alexandra Hospital	 Edmonton	 Alberta	 Canada	Royal Alexandra Hospital, Edmonton, Alberta, Canada	53.5576817000000034	-113.498005399999997	T5H 3V9
303	University of Alberta Hospital	 Edmonton	 Alberta	 Canada	University of Alberta Hospital, Edmonton, Alberta, Canada	53.5203085000000129	-113.5231019	T6G 2B7
304	Faculty of Movement and Rehabilitation Sciences (FaBeR)		 Leuven	 Belgium	Faculty of Movement and Rehabilitation Sciences (FaBeR),, Leuven, Belgium	50.869568000000001	4.69249519999999976	3001
305	University Hospital Schleswig-Holstein		 Kiel	 Germany	University Hospital Schleswig-Holstein,, Kiel, Germany	54.3314499000000026	10.1429936000000005	24105
306	Richmond Hospital Cardiac Rehabilitation	 Richmond	 British Columbia	 Canada	Richmond Hospital Cardiac Rehabilitation, Richmond, British Columbia, Canada	49.1686898999999968	-123.146936400000001	V6X 1A2
307	Richmond Health Services	 Richmond	 British Columbia	 Canada	Richmond Health Services, Richmond, British Columbia, Canada	49.1620320999999976	-123.139741900000004	V6Y 3Z5
308	Garratt Wellness Centre	 Richmond	 British Columbia	 Canada	Garratt Wellness Centre, Richmond, British Columbia, Canada	49.1582039999999978	-123.154586899999998	V7C 3S9
309	Richmond Cardiology Clinic	 Richmond	 British Columbia	 Canada	Richmond Cardiology Clinic, Richmond, British Columbia, Canada	49.1692828999999989	-123.147984600000001	V7C 5L9
310	Gordon and Leslie Diamond Health Care Centre	 Vancouver	 British Columbia	 Canada	Gordon and Leslie Diamond Health Care Centre, Vancouver, British Columbia, Canada	49.2611460999999977	-123.126032699999996	V5Z 1M9
311	Live Well Clinic	 Vancouver	 British Columbia	 Canada	Live Well Clinic, Vancouver, British Columbia, Canada	49.2352362000000028	-123.155714399999994	V6M 3W7
312	St. Paul's Healthy Heart Program	 Vancouver	 British Columbia	 Canada	St. Paul's Healthy Heart Program, Vancouver, British Columbia, Canada	49.2252322999999876	-122.893233899999998	V3L 3W4
313	Sukraraj Tropical & Infectious Disease Control Hospital	 Kathmandu	 Bagmati	 Nepal	Sukraraj Tropical & Infectious Disease Control Hospital, Kathmandu, Bagmati, Nepal	27.6953877999999989	85.306839999999994	44600
314	Bharatpur District Hospital		 Bharatpur	 Nepal	Bharatpur District Hospital,, Bharatpur, Nepal	27.6818786999999986	84.4365657000000027	44200
315	Rapti Sub Regional Hospital		 Dang	 Nepal	Rapti Sub Regional Hospital,, Dang, Nepal	28.0378091000000005	82.492026899999999	22415
316	Seti Zonal Hospital		 Kailālī	 Nepal	Seti Zonal Hospital,, Kailālī, Nepal	28.7041079000000003	80.5878464999999977	10900
317	Tikapur Hospital		 Kailālī	 Nepal	Tikapur Hospital,, Kailālī, Nepal	28.534234699999999	81.1206418000000014	10901
318	Mahakali Zonal Hospital		 Kanchanpur	 Nepal	Mahakali Zonal Hospital,, Kanchanpur, Nepal	28.9638880000000007	80.1850653999999992	10400
319	 Bir Hospital		 Kathmandu	 Nepal	 Bir Hospital,, Kathmandu, Nepal	27.7048248999999984	85.3136513999999977	44600
320	Tribhuvan University Teaching Hospital		 Kathmandu	 Nepal	Tribhuvan University Teaching Hospital,, Kathmandu, Nepal	27.7360022000000015	85.3302640999999937	44600
321	Western Regional Hospital		 Pokhara	 Nepal	Western Regional Hospital,, Pokhara, Nepal	28.2125845999999996	83.9975714999999923	33700
322	B.P. Koirala Institute of Health Sciences		 Sunsari	 Nepal	B.P. Koirala Institute of Health Sciences,, Sunsari, Nepal	26.8122712000000014	87.2682807999999994	56700
323	Cairo University		 Cairo	 Egypt	Cairo University,, Cairo, Egypt	30.0227645999999986	31.2073201000000005	Egypt
324	Cairo University		 Cairo	 Egypt	Cairo University,, Cairo, Egypt	30.0227645999999986	31.2073201000000005	Egypt
325	Colombia	 Cartagena de Indias	 Cartagena	 Colombia	Colombia, Cartagena de Indias, Cartagena, Colombia	10.3910485000000001	-75.4794256999999931	Colombia
326	University at Buffalo	 Buffalo	 New York	 United States	University at Buffalo, Buffalo, New York, United States	43.0008093000000002	-78.7889696999999956	14260
327	Healthy Kids Laboratory within the French Hospital Copeland Health Education Pavilion	 San Luis Obispo	 California	 United States	Healthy Kids Laboratory within the French Hospital Copeland Health Education Pavilion, San Luis Obispo, California, United States	35.2779631000000009	-120.651086699999993	93401
328	Turgut Ozal Medical Center		 Malatya	 Turkey	Turgut Ozal Medical Center,, Malatya, Turkey	38.3436960000000013	38.2717535000000026	44090
329	 Helsinki University Hospital		 Helsinki	 Finland	 Helsinki University Hospital,, Helsinki, Finland	60.1907179999999968	24.9038728999999996	00290
330	Kuopio University Hospital		 Kuopio	 Finland	Kuopio University Hospital,, Kuopio, Finland	62.8975419999999872	27.6470249999999993	70210
331	The University of Pennsylvania Center for Weight and Eating Disorders	 Philadelphia	 Pennsylvania	 United States	The University of Pennsylvania Center for Weight and Eating Disorders, Philadelphia, Pennsylvania, United States	39.9522187999999971	-75.1932137000000012	19104
332	Healthy Kids Laboratory within the French Hospital Copeland Health Education Pavilion	 San Luis Obispo	 California	 United States	Healthy Kids Laboratory within the French Hospital Copeland Health Education Pavilion, San Luis Obispo, California, United States	35.2779631000000009	-120.651086699999993	93401
333	King's College Hospital		 London	 United Kingdom	King's College Hospital,, London, United Kingdom	51.4679288000000028	-0.0943968999999999919	SE5 9RS
334	Yale Child Study Center	 New Haven	 Connecticut	 United States	Yale Child Study Center, New Haven, Connecticut, United States	41.3039777999999984	-72.9334501000000017	06519
1089	University of Alabama	 Birmingham	 Alabama	 United States	University of Alabama, Birmingham, Alabama, United States	33.502122700000001	-86.8064447000000001	35294
335	Brain Performance and Nutrition Research Centre	 Newcastle Upon Tyne	 Tyne And Wear	 United Kingdom	Brain Performance and Nutrition Research Centre, Newcastle Upon Tyne, Tyne And Wear, United Kingdom	54.9780394999999871	-1.60835259999999991	NE1 8ST
336	KUMC Cancer Center	 Fairway	 Kansas	 United States	KUMC Cancer Center, Fairway, Kansas, United States	39.0337914999999995	-94.6160589999999928	66205
337	Karmanos Cancer Institute	 Detroit	 Michigan	 United States	Karmanos Cancer Institute, Detroit, Michigan, United States	42.3521959999999993	-83.0571757000000161	48201
338	Cabrini Malvern Hospital	 Malvern	 Victoria	 Australia	Cabrini Malvern Hospital, Malvern, Victoria, Australia	-37.8626035999999999	145.033330599999999	3144
339	Northumbria University		 Newcastle Upon Tyne	 United Kingdom	Northumbria University,, Newcastle Upon Tyne, United Kingdom	54.9767622999999972	-1.60749830000000005	NE1 8ST
340	Southern Alberta Primary Care Research Network (SAPCReN)	 Calgary	 Alberta	 Canada	Southern Alberta Primary Care Research Network (SAPCReN), Calgary, Alberta, Canada	51.0486150999999992	-114.070845899999995	Canada
341	Northern Alberta Primary Care Research Network (NAPCReN)	 Edmonton	 Alberta	 Canada	Northern Alberta Primary Care Research Network (NAPCReN), Edmonton, Alberta, Canada	53.5443890000000025	-113.490926700000003	Canada
342	Manitoba Primary Care Research Network (MaPCReN)	 Winnipeg	 Manitoba	 Canada	Manitoba Primary Care Research Network (MaPCReN), Winnipeg, Manitoba, Canada	49.8951360000000008	-97.1383743999999894	Canada
343	Maritime Family Practice Research Network (MaRNet-FP)	 Halifax	 Nova Scotia	 Canada	Maritime Family Practice Research Network (MaRNet-FP), Halifax, Nova Scotia, Canada	44.6505334999999874	-63.606172100000002	Canada
344	Ottawa Practice Enhancement Network (OPEN )	 Ottawa	 Ontario	 Canada	Ottawa Practice Enhancement Network (OPEN ), Ottawa, Ontario, Canada	45.4215295999999995	-75.6971930999999927	Canada
345	University of Toronto Practice Based Research Network	 Toronto	 Ontario	 Canada	University of Toronto Practice Based Research Network, Toronto, Ontario, Canada	43.655458000000003	-79.3889679999999913	M5G 1V7
346	Réseau de recherche en soins primaires de l'Université de Montréal (RRSPUM)	 Laval	 Quebec	 Canada	Réseau de recherche en soins primaires de l'Université de Montréal (RRSPUM), Laval, Quebec, Canada	45.5056155999999987	-73.6137591999999898	H3T 1J4
347	KK Women's and Children's Hospital		 Singapore	 Singapore	KK Women's and Children's Hospital,, Singapore, Singapore	1.31072680000000008	103.846836800000005	229899
348	KK Women's and Children's Hospital		 Singapore	 Singapore	KK Women's and Children's Hospital,, Singapore, Singapore	1.31072680000000008	103.846836800000005	229899
349	KK Women's and Children's Hospital		 Singapore	 Singapore	KK Women's and Children's Hospital,, Singapore, Singapore	1.31072680000000008	103.846836800000005	229899
350			 Lund	 Sweden	,, Lund, Sweden	55.7046600999999981	13.1910073000000008	Sweden
351	Universidad Veracruzana	 Xalapa	 Veracruz	 Mexico	Universidad Veracruzana, Xalapa, Veracruz, Mexico	19.5255656000000002	-96.9318918000000025	91000
352	Universidad Veracruzana	 Xalapa	 Veracruz	 Mexico	Universidad Veracruzana, Xalapa, Veracruz, Mexico	19.5255656000000002	-96.9318918000000025	91000
353	Medical College of Wisconsin	 Milwaukee	 Wisconsin	 United States	Medical College of Wisconsin, Milwaukee, Wisconsin, United States	43.0435773999999967	-88.0217863000000023	53226
354	Nucleo de Apoio ao Pesquisador	 Barretos	 Sao Paulo	 Brazil	Nucleo de Apoio ao Pesquisador, Barretos, Sao Paulo, Brazil	-20.5534810000000014	-48.5703531999999996	Brazil
355	Cleveland Clinic Lerner School for Autism	 Cleveland	 Ohio	 United States	Cleveland Clinic Lerner School for Autism, Cleveland, Ohio, United States	41.4829962000000023	-81.6072011999999916	44104
356	National Cancer Institute	 Putrajaya	 Wilayah Persekutuan Putrajaya	 Malaysia	National Cancer Institute, Putrajaya, Wilayah Persekutuan Putrajaya, Malaysia	2.92690699999999993	101.673902100000006	62250
357	Cantonal Hospital of St. Gallen		 St. Gallen	 Switzerland	Cantonal Hospital of St. Gallen,, St. Gallen, Switzerland	47.4297591999999995	9.38893350000000027	9000
358	Research and Development Unit	 Boras	 Vastra Gotaland	 Sweden	Research and Development Unit, Boras, Vastra Gotaland, Sweden	57.7210350000000076	12.939819	Sweden
359	Research and Development Unit	 Boras	 Vastra Gotaland	 Sweden	Research and Development Unit, Boras, Vastra Gotaland, Sweden	57.7210350000000076	12.939819	Sweden
360	University Hospital Schleswig-Holstein	 Kiel	 Schleswig-Holstein	 Germany	University Hospital Schleswig-Holstein, Kiel, Schleswig-Holstein, Germany	54.3314499000000026	10.1429936000000005	24105
361	University Hospital Schleswig-Holstein	 Lubeck	 Schleswig-Holstein	 Germany	University Hospital Schleswig-Holstein, Lubeck, Schleswig-Holstein, Germany	53.8333972999999872	10.7035160000000005	23562
362	Medisch Centrum Leeuwarden	 Leeuwarden	 Friesland	 Netherlands	Medisch Centrum Leeuwarden, Leeuwarden, Friesland, Netherlands	53.1889011000000025	5.80410029999999999	8934 AD
363	Rijnstate	 Arnhem	 Gelderland	 Netherlands	Rijnstate, Arnhem, Gelderland, Netherlands	52.0007183000000026	5.90931799999999985	6815 AD
364	RadboudUMC	 Nijmegen	 Gelderland	 Netherlands	RadboudUMC, Nijmegen, Gelderland, Netherlands	51.8235728000000009	5.86118119999999987	6525 GA
365	Canisius Wilhelmina Ziekenhuis	 Nijmegen	 Gelderland	 Netherlands	Canisius Wilhelmina Ziekenhuis, Nijmegen, Gelderland, Netherlands	51.8169266000000022	5.83057249999999971	6532 SZ
366	Zuyderland Medisch Centrum	 Sittard	 Limburg	 Netherlands	Zuyderland Medisch Centrum, Sittard, Limburg, Netherlands	50.9839403999999874	5.84293819999999986	6162 BG
367	Amphia ziekenhuis	 Breda	 Noord-Brabant	 Netherlands	Amphia ziekenhuis, Breda, Noord-Brabant, Netherlands	51.5819334999999981	4.79704579999999936	4818 CK
368	Catharina ziekenhuis	 Eindhoven	 Noord-Brabant	 Netherlands	Catharina ziekenhuis, Eindhoven, Noord-Brabant, Netherlands	51.4656633999999968	5.47164610000000007	5623 EJ
369	Catharina ziekenhuis	 Eindhoven	 Noord-Brabant	 Netherlands	Catharina ziekenhuis, Eindhoven, Noord-Brabant, Netherlands	51.4656633999999968	5.47164610000000007	5623 EJ
370	VUmc locatie Boelelaan	 Amsterdam	 Noord-Holland	 Netherlands	VUmc locatie Boelelaan, Amsterdam, Noord-Holland, Netherlands	52.3345709000000028	4.8598157999999998	1081 HV
371	VUmc locatie Louwesweg	 Amsterdam	 Noord-Holland	 Netherlands	VUmc locatie Louwesweg, Amsterdam, Noord-Holland, Netherlands	52.3345709000000028	4.8598157999999998	1081 HV
372	Spaarne Gasthuis	 Hoofddorp	 Noord-Holland	 Netherlands	Spaarne Gasthuis, Hoofddorp, Noord-Holland, Netherlands	52.3243440000000035	4.65360739999999939	2134 TM
373	Medisch Spectrum Twente	 Enschede	 Twente	 Netherlands	Medisch Spectrum Twente, Enschede, Twente, Netherlands	52.2168003999999968	6.89090509999999856	7512 KZ
374	Reinier de Graaf Gasthuis	 Delft	 Zuid-Holland	 Netherlands	Reinier de Graaf Gasthuis, Delft, Zuid-Holland, Netherlands	51.9979257000000032	4.33940120000000018	2625 AD
375	Haga ziekenhuis	 Den Haag	 Zuid-Holland	 Netherlands	Haga ziekenhuis, Den Haag, Zuid-Holland, Netherlands	52.0810490000000001	4.26419700000000024	2566 MJ
376	Erasmus Medical Center	 Rotterdam	 Zuid-Holland	 Netherlands	Erasmus Medical Center, Rotterdam, Zuid-Holland, Netherlands	51.9108847999999981	4.46785409999999938	3015 GD
509	Semiilas de Apego		 Tumaco	 Colombia	Semiilas de Apego,, Tumaco, Colombia	1.78743399999999997	-78.7912649999999957	Colombia
377	Maasstadziekenhuis	 Rotterdam	 Zuid-Holland	 Netherlands	Maasstadziekenhuis, Rotterdam, Zuid-Holland, Netherlands	51.8793385000000029	4.5347938000000001	3079 DZ
378	University Medical Center Groningen		 Groningen	 Netherlands	University Medical Center Groningen,, Groningen, Netherlands	53.2216896999999989	6.57638989999999968	9713 GZ
379	Martini ziekenhuis		 Groningen	 Netherlands	Martini ziekenhuis,, Groningen, Netherlands	53.1925280000000029	6.55137599999999942	9728 NT
380	Tergooi ziekenhuis		 Hilversum	 Netherlands	Tergooi ziekenhuis,, Hilversum, Netherlands	52.2168640000000011	5.20041799999999999	1213 XZ
381	 Oulu University Hospital		 Oulu	 Finland	 Oulu University Hospital,, Oulu, Finland	65.0069652999999903	25.5179524999999998	90220
382	Hospital da Prelada		 Porto	 Portugal	Hospital da Prelada,, Porto, Portugal	41.1708078999999998	-8.62892339999999969	4250-449
383	Hospital da Prelada		 Porto	 Portugal	Hospital da Prelada,, Porto, Portugal	41.1708078999999998	-8.62892339999999969	4250-449
384	Skælskør Julemærkehjem	 Skælskør	 Region Sjælland	 Denmark	Skælskør Julemærkehjem, Skælskør, Region Sjælland, Denmark	55.2496136000000035	11.2738297000000003	4230
385	Kildemose Julemærkehjem	 Ølsted	 Region Sjælland	 Denmark	Kildemose Julemærkehjem, Ølsted, Region Sjælland, Denmark	55.9256770000000003	12.0438779999999994	3310
386	Sørlandet Sykehus		 Arendal	 Norway	Sørlandet Sykehus,, Arendal, Norway	58.4668417000000034	8.75517009999999907	4838
387	Drammen Hospital		 Drammen	 Norway	Drammen Hospital,, Drammen, Norway	59.7486531999999997	10.1983166000000001	3004
388	AHUS		 Lørenskog	 Norway	AHUS,, Lørenskog, Norway	59.9320704999999876	10.9939242000000004	1478
389	Vestfold hospital		 Tønsberg	 Norway	Vestfold hospital,, Tønsberg, Norway	59.2723328999999879	10.4179078999999994	3103
390	Seattle Children's Hospital	 Seattle	 Washington	 United States	Seattle Children's Hospital, Seattle, Washington, United States	47.6621517000000026	-122.280440799999994	3901
391	PICU Policlinico S.Orsola-Malpighi		 Bologna	 Italy	PICU Policlinico S.Orsola-Malpighi,, Bologna, Italy	44.4926877999999988	11.3603582000000003	40138
392	University of Illinois Cancer Center	 Chicago	 Illinois	 United States	University of Illinois Cancer Center, Chicago, Illinois, United States	41.8687319000000002	-87.6718573999999933	60612
393	Northwestern University	 Chicago	 Illinois	 United States	Northwestern University, Chicago, Illinois, United States	41.894582800000002	-87.6231705999999946	2834
394	LAC+USC Medical Center	 Los Angeles	 California	 United States	LAC+USC Medical Center, Los Angeles, California, United States	34.0573756000000003	-118.2077046	90033
395	National Cradiovascular Center Harapan Kita Hospital		 Jakarta	 Indonesia	National Cradiovascular Center Harapan Kita Hospital,, Jakarta, Indonesia	-6.18546460000000042	106.798736500000004	11420
396	National Cradiovascular Center Harapan Kita Hospital		 Jakarta	 Indonesia	National Cradiovascular Center Harapan Kita Hospital,, Jakarta, Indonesia	-6.18546460000000042	106.798736500000004	11420
397	University Hospital Hamburg-Eppendorf		 Hamburg	 Germany	University Hospital Hamburg-Eppendorf,, Hamburg, Germany	53.5899986000000013	9.97511019999999959	20251
398	Women & Infants Hospital of Rhode Island	 Providence	 Rhode Island	 United States	Women & Infants Hospital of Rhode Island, Providence, Rhode Island, United States	41.8108356999999984	-71.4122641000000016	02905
399	Penn State College of Medicine	 Hershey	 Pennsylvania	 United States	Penn State College of Medicine, Hershey, Pennsylvania, United States	40.2641976000000028	-76.6761034999999964	17033
401	Onze Lieve Vrouwe Gasthuis		 Amsterdam	 Netherlands	Onze Lieve Vrouwe Gasthuis,, Amsterdam, Netherlands	52.3582370999999966	4.91537519999999972	1091 AC
402	Rijnstate Hospital		 Arnhem	 Netherlands	Rijnstate Hospital,, Arnhem, Netherlands	52.0007183000000026	5.90931799999999985	6815 AD
403	Amphia Hospital		 Breda	 Netherlands	Amphia Hospital,, Breda, Netherlands	51.5819334999999981	4.79704579999999936	4818 CK
404	St. Antonius Hospital		 Nieuwegein	 Netherlands	St. Antonius Hospital,, Nieuwegein, Netherlands	52.0252655999999973	5.08145600000000019	3435 CM
405	University Medical Center Utrecht		 Utrecht	 Netherlands	University Medical Center Utrecht,, Utrecht, Netherlands	52.0862837000000027	5.17992499999999989	3584 CX
406	Northwestern University	 Chicago	 Illinois	 United States	Northwestern University, Chicago, Illinois, United States	41.894582800000002	-87.6231705999999946	2834
407	KK Women's and Children's Hospital		 Singapore	 Singapore	KK Women's and Children's Hospital,, Singapore, Singapore	1.31072680000000008	103.846836800000005	229899
408	Laboratoire de Physiopathologie Respiratoire du Service de Pneumologie et de Réanimation		 Paris	 France	Laboratoire de Physiopathologie Respiratoire du Service de Pneumologie et de Réanimation,, Paris, France	48.8566140000000004	2.35222189999999998	France
409	Liverpool hospital	 Liverpool	 New South Wales	 Australia	Liverpool hospital, Liverpool, New South Wales, Australia	-33.9202911	150.932214700000003	2170
410	The University of Michigan Rogel Cancer Center	 Ann Arbor	 Michigan	 United States	The University of Michigan Rogel Cancer Center, Ann Arbor, Michigan, United States	42.2780435999999966	-83.7382240999999965	48109
411	Hospital de Clinicas de Porto Alegre	 Porto Alegre	 RS	 Brazil	Hospital de Clinicas de Porto Alegre, Porto Alegre, RS, Brazil	-30.0389935999999906	-51.2072769999999977	90035-007
412	Baycrest Health Sciences	 Toronto	 Ontario	 Canada	Baycrest Health Sciences, Toronto, Ontario, Canada	43.7300067999999982	-79.4342381000000017	M6A 2E1
413	Central Finland Central Hospital		 Jyväskylä	 Finland	Central Finland Central Hospital,, Jyväskylä, Finland	62.2294318999999874	25.7107363999999983	40620
414	Päijät Häme Central Hospital		 Lahti	 Finland	Päijät Häme Central Hospital,, Lahti, Finland	60.9922591999999923	25.5681711999999983	15850
415	James J. Peters Veteran's Affair Medical Center	 Bronx	 New York	 United States	James J. Peters Veteran's Affair Medical Center, Bronx, New York, United States	40.8685210000000012	-73.9052720999999906	3904
416	The Icahn School of Medicine at Mount Sinai	 New York	 New York	 United States	The Icahn School of Medicine at Mount Sinai, New York, New York, United States	40.7898694999999876	-73.9533615999999938	6500
417	The Icahn School of Medicine at Mount Sinai	 New York	 New York	 United States	The Icahn School of Medicine at Mount Sinai, New York, New York, United States	40.7898694999999876	-73.9533615999999938	6500
418	Prevention Research Center in St. Louis	 Saint Louis	 Missouri	 United States	Prevention Research Center in St. Louis, Saint Louis, Missouri, United States	38.6561214000000035	-90.2997339000000068	4838
419	Hong Kong Sheng Kung Hui Lady MacLehose Centre		 Kwai Chung	 Hong Kong	Hong Kong Sheng Kung Hui Lady MacLehose Centre,, Kwai Chung, Hong Kong	22.3652900000000017	114.136448999999999	Hong Kong
576	UT Southwestern	 Dallas	 Texas	 United States	UT Southwestern, Dallas, Texas, United States	32.8119828999999967	-96.8392036999999988	75390
420	New Life Psychiatric Rehabilitation Association		 Kwai Chung	 Hong Kong	New Life Psychiatric Rehabilitation Association,, Kwai Chung, Hong Kong	22.3608200000000004	114.137382000000002	Hong Kong
421	Christian Family Service Centre		 Kwun Tong	 Hong Kong	Christian Family Service Centre,, Kwun Tong, Hong Kong	22.3117665999999986	114.228881200000004	Hong Kong
422	The Mental Health Association of Hong Kong		 Kwun Tong	 Hong Kong	The Mental Health Association of Hong Kong,, Kwun Tong, Hong Kong	22.3174914999999991	114.222439899999998	Hong Kong
423	Caritas Hong Kong		 Sham Shui Po	 Hong Kong	Caritas Hong Kong,, Sham Shui Po, Hong Kong	22.3336509999999997	114.157687999999993	Hong Kong
424	New Life Psychiatric Rehabilitation Association		 Sham Shui Po	 Hong Kong	New Life Psychiatric Rehabilitation Association,, Sham Shui Po, Hong Kong	22.3388087000000013	114.168060100000005	Hong Kong
425	Christian Family Service Centre		 Tseung Kwan O	 Hong Kong	Christian Family Service Centre,, Tseung Kwan O, Hong Kong	22.3216029999999996	114.260885000000002	Hong Kong
426	Haven of Hope Christian Service		 Tseung Kwan O	 Hong Kong	Haven of Hope Christian Service,, Tseung Kwan O, Hong Kong	22.3179680000000005	114.270210000000006	Hong Kong
427	Jarle Berge		 Tønsberg	 Norway	Jarle Berge,, Tønsberg, Norway	59.3085572999999968	10.4272033999999998	Norway
428	Aarhus University	 Aarhus	 Jylland	 Denmark	Aarhus University, Aarhus, Jylland, Denmark	56.1681383999999966	10.2030118000000005	8000
429	Aarhus University	 Aarhus	 Jylland	 Denmark	Aarhus University, Aarhus, Jylland, Denmark	56.1681383999999966	10.2030118000000005	8000
430	Aarhus University	 Aarhus	 Jylland	 Denmark	Aarhus University, Aarhus, Jylland, Denmark	56.1681383999999966	10.2030118000000005	8000
431	UH Cleveland Medical Center	 Cleveland	 Ohio	 United States	UH Cleveland Medical Center, Cleveland, Ohio, United States	41.506015699999999	-81.6068396999999948	44106
432	Central Arkansas Veterans Healthcare System	 Little Rock	 Arkansas	 United States	Central Arkansas Veterans Healthcare System, Little Rock, Arkansas, United States	34.7463675999999992	-92.3204674999999924	72205
433	Grady Memorial Hospital	 Atlanta	 Georgia	 United States	Grady Memorial Hospital, Atlanta, Georgia, United States	33.7518552000000014	-84.3821396999999962	30303
434	Fr Muller Homoeopathic Medical College	 Mangalore	 Karnataka	 India	Fr Muller Homoeopathic Medical College, Mangalore, Karnataka, India	12.8086944999999996	74.8911655999999937	575018
435	Taipei Veterans General Hospital		 Taipei	 Taiwan	Taipei Veterans General Hospital,, Taipei, Taiwan	25.1203356999999983	121.520133700000002	112
436	The University of Arizona Cancer Center	 Phoenix	 Arizona	 United States	The University of Arizona Cancer Center, Phoenix, Arizona, United States	33.4550470000000004	-112.065681999999995	85004
437	University of Miami Miller School of Medicine	 Miami	 Florida	 United States	University of Miami Miller School of Medicine, Miami, Florida, United States	25.7904063999999984	-80.2119927999999902	1015
438	Wayne State University	 Detroit	 Michigan	 United States	Wayne State University, Detroit, Michigan, United States	42.3591387999999966	-83.0665461999999906	48202
439	Children's Hospital of Philadelphia	 Philadelphia	 Pennsylvania	 United States	Children's Hospital of Philadelphia, Philadelphia, Pennsylvania, United States	39.9488993000000008	-75.1938645999999977	19104
440	University of Pittsburgh	 Pittsburgh	 Pennsylvania	 United States	University of Pittsburgh, Pittsburgh, Pennsylvania, United States	40.4443533000000031	-79.960835000000003	15260
441	Mbarara University of Science and Technology		 Mbarara	 Uganda	Mbarara University of Science and Technology,, Mbarara, Uganda	-0.616724500000000009	30.6567879999999988	Uganda
442	 The Hong Kong Polytechnic University		 Hong Kong	 Hong Kong	 The Hong Kong Polytechnic University,, Hong Kong, Hong Kong	22.3045718999999991	114.179564200000002	Hong Kong
443	 Cipto Mangunkusumo Hospital		 Jakarta	 Indonesia	 Cipto Mangunkusumo Hospital,, Jakarta, Indonesia	-6.19718029999999942	106.846869999999996	10430
444	Sainte Justine's Hospital	 Montréal	 Quebec	 Canada	Sainte Justine's Hospital, Montréal, Quebec, Canada	45.5032185999999967	-73.6239156000000037	H3T 1C5
445	Martha Morehouse Medical Plaza	 Columbus	 Ohio	 United States	Martha Morehouse Medical Plaza, Columbus, Ohio, United States	40.001293699999998	-83.0315440999999907	43221
446	The Ohio State University Hospital	 Columbus	 Ohio	 United States	The Ohio State University Hospital, Columbus, Ohio, United States	39.9953221999999968	-83.01774979999999	43210
447	Prince of Wales Hospital		 Shatin	 Hong Kong	Prince of Wales Hospital,, Shatin, Hong Kong	22.3784039999999997	114.201222000000001	Hong Kong
448	Mayo Clinic in Florida	 Jacksonville	 Florida	 United States	Mayo Clinic in Florida, Jacksonville, Florida, United States	30.2640896999999995	-81.4409507000000019	32224
450	Dr Vedang Murthy	 Navi-Mumbai	 Maharashtra	 India	Dr Vedang Murthy, Navi-Mumbai, Maharashtra, India	19.0330487999999995	73.0296625000000006	India
451	Action Wellness	 Philadelphia	 Pennsylvania	 United States	Action Wellness, Philadelphia, Pennsylvania, United States	39.9569685000000021	-75.1992896999999942	3192
452	Action Wellness	 Philadelphia	 Pennsylvania	 United States	Action Wellness, Philadelphia, Pennsylvania, United States	39.9569685000000021	-75.1992896999999942	3192
453	HealthPartners	 Bloomington	 Minnesota	 United States	HealthPartners, Bloomington, Minnesota, United States	44.8474168999999989	-93.2791319999999899	2855
454	COPD center	 Gothenburg	 Västra Götaland	 Sweden	COPD center, Gothenburg, Västra Götaland, Sweden	57.7088699999999974	11.9745600000000003	Sweden
455	Blackpool Victoria Hospital	 Blackpool	 Lancashire	 United Kingdom	Blackpool Victoria Hospital, Blackpool, Lancashire, United Kingdom	53.8205880000000008	-3.01375159999999997	FY3 8NR
456	Imperial College NHS Healthcare Trust		 North West London	 United Kingdom	Imperial College NHS Healthcare Trust,, North West London, United Kingdom	51.5178112999999982	-0.174274700000000005	W2 1NY
457	University of Kansas Cancer Center - Clinical Research Center	 Fairway	 Kansas	 United States	University of Kansas Cancer Center - Clinical Research Center, Fairway, Kansas, United States	39.0280399999999972	-94.6373669999999976	66205
458	University of Kansas Cancer Center - West	 Kansas City	 Kansas	 United States	University of Kansas Cancer Center - West, Kansas City, Kansas, United States	39.1264490000000009	-94.7867169999999959	66112
459	University of Kansas Cancer Center - Overland Park	 Overland Park	 Kansas	 United States	University of Kansas Cancer Center - Overland Park, Overland Park, Kansas, United States	38.9305889999999977	-94.7270249999999976	66210
460	The University of Kansas Cancer Center	 Westwood	 Kansas	 United States	The University of Kansas Cancer Center, Westwood, Kansas, United States	39.0337914999999995	-94.6160589999999928	66205
461	University of Kansas Cancer Center - North	 Kansas City	 Missouri	 United States	University of Kansas Cancer Center - North, Kansas City, Missouri, United States	39.1508864999999986	-94.5525135999999975	64116
462	University of Kansas Cancer Center - Lee's Summit	 Lee's Summit	 Missouri	 United States	University of Kansas Cancer Center - Lee's Summit, Lee's Summit, Missouri, United States	39.0008070000000018	-94.3535359999999912	64064
463	Diabetes Research Center	 Boston	 Massachusetts	 United States	Diabetes Research Center, Boston, Massachusetts, United States	42.3385551999999876	-71.1081799999999902	02215
464	Rush University Medical Center and University of Illinois at Chicago	 Chicago	 Illinois	 United States	Rush University Medical Center and University of Illinois at Chicago, Chicago, Illinois, United States	41.8746399999999994	-87.6687122999999957	60612
465	University of Pittsburgh	 Pittsburgh	 Pennsylvania	 United States	University of Pittsburgh, Pittsburgh, Pennsylvania, United States	40.4443533000000031	-79.960835000000003	15260
466	Callier Center for Communication Disorders at The University of Texas at Dallas	 Dallas	 Texas	 United States	Callier Center for Communication Disorders at The University of Texas at Dallas, Dallas, Texas, United States	32.9920729999999978	-96.7482577999999904	75080
467	The Hospital for Sick Children	 Toronto	 Ontario	 Canada	The Hospital for Sick Children, Toronto, Ontario, Canada	43.6573064999999971	-79.3874268000000001	M5G 1X8
468	National University Health System		 Singapore	 Singapore	National University Health System,, Singapore, Singapore	1.29228140000000002	103.783499399999997	119228
469	Cipto Mangunkusumo National Central General Hospital	 Jakarta Pusat	 DKI Jakarta	 Indonesia	Cipto Mangunkusumo National Central General Hospital, Jakarta Pusat, DKI Jakarta, Indonesia	-6.19718029999999942	106.846869999999996	10430
470	University of Virginia	 Charlottesville	 Virginia	 United States	University of Virginia, Charlottesville, Virginia, United States	38.0335528999999966	-78.5079771999999991	United States
471	University of Illinois at Chicago	 Chicago	 Illinois	 United States	University of Illinois at Chicago, Chicago, Illinois, United States	41.8697937999999965	-87.6496336000000014	60607
472	Sénégal Ministère de la Santé et l'Action Sociale Département de Recherche		 Dakar	 Senegal	Sénégal Ministère de la Santé et l'Action Sociale Département de Recherche,, Dakar, Senegal	14.6935620999999994	-17.4689800999999996	Senegal
473	Sénégal Ministère de la Santé et l'Action Sociale Département de Recherche		 Dakar	 Senegal	Sénégal Ministère de la Santé et l'Action Sociale Département de Recherche,, Dakar, Senegal	14.6935620999999994	-17.4689800999999996	Senegal
474	Alberta Children's Hospital	 Calgary	 Alberta	 Canada	Alberta Children's Hospital, Calgary, Alberta, Canada	51.0746243999999976	-114.148680299999995	T3B 6A8
475	Brigham and Women's Hospital	 Boston	 Massachusetts	 United States	Brigham and Women's Hospital, Boston, Massachusetts, United States	42.3362325000000013	-71.1065442999999959	02115
476	Shriners Hospitals for Children - Canada	 Montréal	 Quebec	 Canada	Shriners Hospitals for Children - Canada, Montréal, Quebec, Canada	45.471812700000001	-73.6018114999999966	H4A 0A9
477	Sibley Memorial Hospital	 Washington	 District of Columbia	 United States	Sibley Memorial Hospital, Washington, District of Columbia, United States	38.9366442000000035	-77.1084055000000035	20016
478	Johns Hopkins Hospital	 Baltimore	 Maryland	 United States	Johns Hopkins Hospital, Baltimore, Maryland, United States	39.2969464000000031	-76.5941753999999975	21287
479	Saint Louis Universtiy	 Saint Louis	 Missouri	 United States	Saint Louis Universtiy, Saint Louis, Missouri, United States	38.6354597999999996	-90.2338231999999891	63103
480	Prince Philip Hospital	 Llanelli	 Carmarthenshire	 United Kingdom	Prince Philip Hospital, Llanelli, Carmarthenshire, United Kingdom	51.6917576000000025	-4.13611899999999988	SA14 8QF
481	Prince Philip Hospital	 Llanelli	 Carmarthenshire	 United Kingdom	Prince Philip Hospital, Llanelli, Carmarthenshire, United Kingdom	51.6917576000000025	-4.13611899999999988	SA14 8QF
482	Prince Philip Hospital	 Llanelli	 Carmarthenshire	 United Kingdom	Prince Philip Hospital, Llanelli, Carmarthenshire, United Kingdom	51.6917576000000025	-4.13611899999999988	SA14 8QF
483	Prince Philip Hospital	 Llanelli	 Carmarthenshire	 United Kingdom	Prince Philip Hospital, Llanelli, Carmarthenshire, United Kingdom	51.6917576000000025	-4.13611899999999988	SA14 8QF
484	National University Hospital		 Singapore	 Singapore	National University Hospital,, Singapore, Singapore	1.29372780000000009	103.783175600000007	119074
485	Instituto Nacional de Ciencias Medicas y Nutricion Salvador Zubiran		 Mexico City	 Mexico	Instituto Nacional de Ciencias Medicas y Nutricion Salvador Zubiran,, Mexico City, Mexico	19.2880685000000014	-99.1563218999999947	14080
486	Guangdong General Hospital	 Guangzhou	 Guangdong	 China	Guangdong General Hospital, Guangzhou, Guangdong, China	23.1256720000000016	113.287200999999996	510080
487	Thames Valley Children's Centre	 London	 Ontario	 Canada	Thames Valley Children's Centre, London, Ontario, Canada	42.9612359999999995	-81.2257438999999977	N6C 5Y6
488	Holland Bloorview Kids Rehabilitation Hospital	 Toronto	 Ontario	 Canada	Holland Bloorview Kids Rehabilitation Hospital, Toronto, Ontario, Canada	43.7180569000000006	-79.3741804000000002	M4G 1R8
489	Sibley Memorial Hospital	 Washington	 District of Columbia	 United States	Sibley Memorial Hospital, Washington, District of Columbia, United States	38.9366442000000035	-77.1084055000000035	20016
490	Johns Hopkins University	 Baltimore	 Maryland	 United States	Johns Hopkins University, Baltimore, Maryland, United States	39.3299013000000031	-76.6205176999999935	21218
491	Herlev Hospital		 Herlev	 Denmark	Herlev Hospital,, Herlev, Denmark	55.7313700999999995	12.4427248000000006	2730
492	The Ohio State University Wexner Medical Center	 Columbus	 Ohio	 United States	The Ohio State University Wexner Medical Center, Columbus, Ohio, United States	39.9953221999999968	-83.01774979999999	43210
493	Cincinnati Children's Hospital Medical Center	 Cincinnati	 Ohio	 United States	Cincinnati Children's Hospital Medical Center, Cincinnati, Ohio, United States	39.1408656999999991	-84.5022079000000019	45229
494	Cincinnati Children's Hospital Medical Center	 Cincinnati	 Ohio	 United States	Cincinnati Children's Hospital Medical Center, Cincinnati, Ohio, United States	39.1408656999999991	-84.5022079000000019	45229
495	University of California San Francisco	 San Francisco	 California	 United States	University of California San Francisco, San Francisco, California, United States	37.7627655000000004	-122.457752999999997	94143
496	Raymond Poincaré Hospital	 Garches	 Hauts De Seine	 France	Raymond Poincaré Hospital, Garches, Hauts De Seine, France	48.8398605000000003	2.17011300000000018	92380
497	UPecon Foundation		 Quezon City	 Philippines	UPecon Foundation,, Quezon City, Philippines	14.654261	121.064785999999998	1101
498	FRIM	 Kepong	 Selangor	 Malaysia	FRIM, Kepong, Selangor, Malaysia	3.23367979999999999	101.632655799999995	52109
499	Vanderbilt University Medical Center	 Nashville	 Tennessee	 United States	Vanderbilt University Medical Center, Nashville, Tennessee, United States	36.1417373000000026	-86.8021305999999981	37232
500	KEMRI Mtwapa		 Kilifi	 Kenya	KEMRI Mtwapa,, Kilifi, Kenya	-3.93856949999999983	39.7497984000000031	Kenya
501	Radboud University Nijmegen Medical Center	 Nijmegen	 Gelderland	 Netherlands	Radboud University Nijmegen Medical Center, Nijmegen, Gelderland, Netherlands	51.8236261999999996	5.85906970000000005	6525 EZ
502	Dimence GGZ		 Deventer	 Netherlands	Dimence GGZ,, Deventer, Netherlands	52.2613759999999985	6.18074299999999965	7416 SB
503	Pro Persona		 Nijmegen	 Netherlands	Pro Persona,, Nijmegen, Netherlands	51.8178820999999985	5.82674179999999975	6534 AM
504	Altrecht GGZ		 Utrecht	 Netherlands	Altrecht GGZ,, Utrecht, Netherlands	52.0849536999999998	5.12524399999999858	3512 PG
505	Universitätsklinik für Urologie und Andrologie	 Salzburger Landeskliniken	 Salzburg	 Austria	Universitätsklinik für Urologie und Andrologie, Salzburger Landeskliniken, Salzburg, Austria	47.8066699000000028	13.0301325000000006	5020
506	Universitätsklinik für Urologie und Andrologie	 Salzburger Landeskliniken	 Salzburg	 Austria	Universitätsklinik für Urologie und Andrologie, Salzburger Landeskliniken, Salzburg, Austria	47.8066699000000028	13.0301325000000006	5020
507	Washington University School of Medicine	 Saint Louis	 Missouri	 United States	Washington University School of Medicine, Saint Louis, Missouri, United States	38.635144099999998	-90.2629288999999915	1010
508	Centre Hospitalier Universitaire Vaudois (CHUV)	 Lausanne	 Vaud	 Switzerland	Centre Hospitalier Universitaire Vaudois (CHUV), Lausanne, Vaud, Switzerland	46.5251459999999994	6.64254959999999972	1005
510	Michael Paterson	 Glasgow	 Glasgow City	 United Kingdom	Michael Paterson, Glasgow, Glasgow City, United Kingdom	55.8642370000000028	-4.2518060000000002	United Kingdom
511	Mayo Clinic in Rochester	 Rochester	 Minnesota	 United States	Mayo Clinic in Rochester, Rochester, Minnesota, United States	44.0226254999999966	-92.4668832999999921	55905
512	Mayo Clinic in Rochester	 Rochester	 Minnesota	 United States	Mayo Clinic in Rochester, Rochester, Minnesota, United States	44.0226254999999966	-92.4668832999999921	55905
513	Washington University School of Medicine	 Saint Louis	 Missouri	 United States	Washington University School of Medicine, Saint Louis, Missouri, United States	38.635144099999998	-90.2629288999999915	1010
514	Washington University School of Medicine	 Saint Louis	 Missouri	 United States	Washington University School of Medicine, Saint Louis, Missouri, United States	38.635144099999998	-90.2629288999999915	1010
515	TK statutory health insurance		 Hamburg	 Germany	TK statutory health insurance,, Hamburg, Germany	53.5407215999999977	10.0023856999999996	20457
516	KKH statutory health insurance		 Hannover	 Germany	KKH statutory health insurance,, Hannover, Germany	52.3918299999999988	9.79750999999999905	30625
517	Mhplus Statutory Health Insurance		 Nürnberg	 Germany	Mhplus Statutory Health Insurance,, Nürnberg, Germany	49.4521018000000012	11.0766653999999996	Germany
518	Rush University Medical Center	 Chicago	 Illinois	 United States	Rush University Medical Center, Chicago, Illinois, United States	41.8746399999999994	-87.6687122999999957	60612
519	LSUHSC-Shreveport	 Shreveport	 Louisiana	 United States	LSUHSC-Shreveport, Shreveport, Louisiana, United States	32.4805980000000005	-93.7606679999999955	71103
520	Uppsala University Hospital		 Uppsala	 Sweden	Uppsala University Hospital,, Uppsala, Sweden	59.8484837000000027	17.6407363000000004	751 85
521	The Hospital For SickKids	 Toronto	 Ontario	 Canada	The Hospital For SickKids, Toronto, Ontario, Canada	43.6573064999999971	-79.3874268000000001	M5G 1X8
522	Hospital Universitari Mútua Terrassa	 Terrassa	 Barcelona	 Spain	Hospital Universitari Mútua Terrassa, Terrassa, Barcelona, Spain	41.5638671999999971	2.01720699999999997	08221
523	Mútua Terrassa Primary Care	 Terrassa	 Barcelona	 Spain	Mútua Terrassa Primary Care, Terrassa, Barcelona, Spain	41.5638671999999971	2.01720699999999997	08221
524	Hospital Universitari Sant Joan de Reus	 Reus	 Tarragona	 Spain	Hospital Universitari Sant Joan de Reus, Reus, Tarragona, Spain	41.1443444000000014	1.12322250000000001	43204
525	Addenbrookes Hospital		 Cambridge	 United Kingdom	Addenbrookes Hospital,, Cambridge, United Kingdom	52.1751266999999999	0.140661599999999998	CB2 0QQ
526	Western General Hospital		 Edinburgh	 United Kingdom	Western General Hospital,, Edinburgh, United Kingdom	55.9623265999999973	-3.23508510000000005	EH4 2XU
527	Beatson West of Scotland Cancer Centre		 Glasgow	 United Kingdom	Beatson West of Scotland Cancer Centre,, Glasgow, United Kingdom	55.8814441999999971	-4.31234619999999857	G12 0YN
528	St George's Hospital		 London	 United Kingdom	St George's Hospital,, London, United Kingdom	51.4252255000000034	-0.174999399999999999	SW17 0QT
529	Royal Marsden		 London	 United Kingdom	Royal Marsden,, London, United Kingdom	51.4908767000000012	-0.172799599999999998	SW3 6JJ
530	The Christie		 Manchester	 United Kingdom	The Christie,, Manchester, United Kingdom	53.4299658999999991	-2.2304081	M20 4BX
531	Martha Morehouse Medical Plaza	 Columbus	 Ohio	 United States	Martha Morehouse Medical Plaza, Columbus, Ohio, United States	40.001293699999998	-83.0315440999999907	43221
532	Universitätsklinik für Radio-Onkologie		 Bern	 Switzerland	Universitätsklinik für Radio-Onkologie,, Bern, Switzerland	46.9484112000000025	7.42468579999999889	3010
533	Polyclinique Bordeaux Nord Aquitaine		 Bordeaux	 France	Polyclinique Bordeaux Nord Aquitaine,, Bordeaux, France	44.8638679999999965	-0.578751999999999933	33300
534	Chu Saint Eloi		 Montpellier	 France	Chu Saint Eloi,, Montpellier, France	43.6292832999999973	3.86616660000000012	34090
535	Ghr Mulhouse Sud Alsace		 Mulhouse	 France	Ghr Mulhouse Sud Alsace,, Mulhouse, France	47.7247070000000022	7.34372469999999922	68100
536	Hopital Cognacq Jay		 Paris	 France	Hopital Cognacq Jay,, Paris, France	48.8377801999999974	2.29285279999999991	75015
537	The Ohio State University Wexner Medical Center	 Columbus	 Ohio	 United States	The Ohio State University Wexner Medical Center, Columbus, Ohio, United States	39.9953221999999968	-83.01774979999999	43210
538	The Ohio State University Wexner Medical Center	 Columbus	 Ohio	 United States	The Ohio State University Wexner Medical Center, Columbus, Ohio, United States	39.9953221999999968	-83.01774979999999	43210
539	The Ohio State University Wexner Medical Center	 Columbus	 Ohio	 United States	The Ohio State University Wexner Medical Center, Columbus, Ohio, United States	39.9953221999999968	-83.01774979999999	43210
540	The Ohio State University Wexner Medical Center	 Columbus	 Ohio	 United States	The Ohio State University Wexner Medical Center, Columbus, Ohio, United States	39.9953221999999968	-83.01774979999999	43210
541	Ospedale Madonna del Soccorso	 San Benedetto Del Tronto	 Ascoli Piceno	 Italy	Ospedale Madonna del Soccorso, San Benedetto Del Tronto, Ascoli Piceno, Italy	42.9479698999999968	13.8768889000000009	63074
542	Presidio Ospedaliero S. Maria delle Grazie	 Pozzuoli	 Napoli	 Italy	Presidio Ospedaliero S. Maria delle Grazie, Pozzuoli, Napoli, Italy	40.848916899999999	14.0732774999999997	80078
543	AORN S.ANNA e S.SEBASTIANO		 Caserta	 Italy	AORN S.ANNA e S.SEBASTIANO,, Caserta, Italy	41.0871232999999876	14.3341791999999995	81100
544	Università degli Studi G. D'Annunzio		 Chieti	 Italy	Università degli Studi G. D'Annunzio,, Chieti, Italy	42.3695272000000003	14.1482931999999995	66100
545	Ospedale P. Monaldi		 Napoli	 Italy	Ospedale P. Monaldi,, Napoli, Italy	40.8698134999999994	14.2106495000000006	80131
546	Policlinico AO di Padova		 Padova	 Italy	Policlinico AO di Padova,, Padova, Italy	45.4033987999999979	11.8878380000000003	35128
547	Policlinico Universitario Campus Bio-Medico		 Roma	 Italy	Policlinico Universitario Campus Bio-Medico,, Roma, Italy	41.7708907999999965	12.4681084999999996	00128
548	Radboudumc	 Nijmegen	 Gelderland	 Netherlands	Radboudumc, Nijmegen, Gelderland, Netherlands	51.8235728000000009	5.86118119999999987	6525 GA
549	Univerisity of Kentucky College of Dentistry	 Lexington	 Kentucky	 United States	Univerisity of Kentucky College of Dentistry, Lexington, Kentucky, United States	38.0312243999999993	-84.5074500999999998	40536
550	The Ohio State University Wexner Medical Center	 Columbus	 Ohio	 United States	The Ohio State University Wexner Medical Center, Columbus, Ohio, United States	39.9953221999999968	-83.01774979999999	43210
551	Virginia Commonwealth University	 Richmond	 Virginia	 United States	Virginia Commonwealth University, Richmond, Virginia, United States	37.5495049000000023	-77.4509716000000026	23284
552	Infectious Disease Institute		 Kampala	 Uganda	Infectious Disease Institute,, Kampala, Uganda	0.338779500000000011	32.5762908000000024	Uganda
553	University of South Florida	 Tampa	 Florida	 United States	University of South Florida, Tampa, Florida, United States	28.0587030999999989	-82.4138538999999923	33620
554	Unversity of Calgary	 Calgary	 Alberta	 Canada	Unversity of Calgary, Calgary, Alberta, Canada	51.0780742999999973	-114.129178100000004	T2N 1N4
555	NHS Tayside		 Dundee	 United Kingdom	NHS Tayside,, Dundee, United Kingdom	56.4636033999999967	-3.03756510000000013	DD2 1UB
556	Geisinger Health Systems	 Danville	 Pennsylvania	 United States	Geisinger Health Systems, Danville, Pennsylvania, United States	40.9698232000000075	-76.6043360999999976	17822
557	Riverside Medical Center	 Kankakee	 Illinois	 United States	Riverside Medical Center, Kankakee, Illinois, United States	41.1247243999999981	-87.8817298999999963	60901
558	Riverside Medical Center	 Kankakee	 Illinois	 United States	Riverside Medical Center, Kankakee, Illinois, United States	41.1247243999999981	-87.8817298999999963	60901
559	Cedars-Sinai Medical Center	 Los Angeles	 California	 United States	Cedars-Sinai Medical Center, Los Angeles, California, United States	34.0753069000000011	-118.380417399999999	1804
560	McGill University Health Center	 Montréal	 Quebec	 Canada	McGill University Health Center, Montréal, Quebec, Canada	45.4728824999999972	-73.6017702999999983	H4A 3J1
561	Rigshospitalet		 Copenhagen	 Denmark	Rigshospitalet,, Copenhagen, Denmark	55.6959810000000033	12.5666080000000004	2100
562	VUmc		 Amsterdam	 Netherlands	VUmc,, Amsterdam, Netherlands	52.3345709000000028	4.8598157999999998	1081 HV
563	Haukeland University Hospital		 Bergen	 Norway	Haukeland University Hospital,, Bergen, Norway	60.3739405999999974	5.35948099999999972	5021
564	Akershus University Hospital		 Oslo	 Norway	Akershus University Hospital,, Oslo, Norway	59.9320704999999876	10.9939242000000004	1478
565	University Hospital of North Norway		 Tromsø	 Norway	University Hospital of North Norway,, Tromsø, Norway	69.6829613999999964	18.9824887000000011	9019
566	St. Olav's University Hospital		 Trondheim	 Norway	St. Olav's University Hospital,, Trondheim, Norway	63.4210380000000029	10.3880389999999991	7030
567	Sahlgrenska University Hospital		 Gothenburg	 Sweden	Sahlgrenska University Hospital,, Gothenburg, Sweden	57.6823671999999874	11.9614317999999997	413 45
568	Akademiska sjukhuset		 Uppsala	 Sweden	Akademiska sjukhuset,, Uppsala, Sweden	59.8484837000000027	17.6407363000000004	751 85
569	Akademiska sjukhuset		 Uppsala	 Sweden	Akademiska sjukhuset,, Uppsala, Sweden	59.8484837000000027	17.6407363000000004	751 85
570	KinEf Kinesiología Deportiva	 Buenos Aires	 Caba	 Argentina	KinEf Kinesiología Deportiva, Buenos Aires, Caba, Argentina	-34.5700221000000028	-58.4450907000000015	Argentina
571	Columbia University Medical Center	 New York	 New York	 United States	Columbia University Medical Center, New York, New York, United States	40.8411210000000011	-73.9423639999999978	3722
572	NUNM Helfgott Research Institute	 Portland	 Oregon	 United States	NUNM Helfgott Research Institute, Portland, Oregon, United States	45.5068580000000011	-122.678251000000003	5003
573	 Hong Kong		 Hong Kong	 China	 Hong Kong,, Hong Kong, China	22.3964280000000002	114.109497000000005	Hong Kong
574	Hartford HealthCare Headache Center	 West Hartford	 Connecticut	 United States	Hartford HealthCare Headache Center, West Hartford, Connecticut, United States	41.7593026999999992	-72.7408526999999907	06109
575	University of Texas at Arlington	 Arlington	 Texas	 United States	University of Texas at Arlington, Arlington, Texas, United States	32.729871799999998	-97.1140115999999978	76019
577	 Shanghai Jiao Tong University School of Medicine		 Shanghai	 China	 Shanghai Jiao Tong University School of Medicine,, Shanghai, China	31.2123400000000011	121.470674000000002	China
578	 Shanghai Jiao Tong University School of Medicine		 Shanghai	 China	 Shanghai Jiao Tong University School of Medicine,, Shanghai, China	31.2123400000000011	121.470674000000002	China
579	University of Leipzig	 Leipzig	 Sachsen	 Germany	University of Leipzig, Leipzig, Sachsen, Germany	51.3385737999999989	12.3784615000000002	04109
580	Keski-Suomen keskussairaala	 Jyväskylä	 Keski-Suomi	 Finland	Keski-Suomen keskussairaala, Jyväskylä, Keski-Suomi, Finland	62.2294318999999874	25.7107363999999983	40620
581	Pohjois-Karjalan keskussairaala	 Joensuu	 Pohjois-Karjala	 Finland	Pohjois-Karjalan keskussairaala, Joensuu, Pohjois-Karjala, Finland	62.5914172000000022	29.7797285000000009	80210
582	Satakunnan keskussairaala	 Pori	 Satakunta	 Finland	Satakunnan keskussairaala, Pori, Satakunta, Finland	61.4730431999999993	21.780190300000001	28500
583	University Hospital of Turku	 Turku	 Varsinais-Suomi	 Finland	University Hospital of Turku, Turku, Varsinais-Suomi, Finland	60.4531409000000011	22.2915987999999992	20521
584	Washington University	 Saint Louis	 Missouri	 United States	Washington University, Saint Louis, Missouri, United States	38.6487894999999995	-90.3107962000000128	63130
585	SS. Antonio e Biagio e Cesare Arrigo Hospital	 Alessandria	 AL	 Italy	SS. Antonio e Biagio e Cesare Arrigo Hospital, Alessandria, AL, Italy	44.9164496	8.62302639999999876	15121
586	Casa Sollievo della Sofferenza Opera Padre Pio	 San Giovanni Rotondo	 Foggia	 Italy	Casa Sollievo della Sofferenza Opera Padre Pio, San Giovanni Rotondo, Foggia, Italy	41.7089888000000002	15.7073145000000007	71013
587	Ospedale Civile Pietro Cosma	 Camposampiero	 Padua	 Italy	Ospedale Civile Pietro Cosma, Camposampiero, Padua, Italy	45.5641217000000012	11.9279788	35012
588	Ospedale Sacro Cuore	 Negrar	 Verona	 Italy	Ospedale Sacro Cuore, Negrar, Verona, Italy	45.5303465000000003	10.9359535999999995	37024
589	Ospedale degli Infermi		 Biella	 Italy	Ospedale degli Infermi,, Biella, Italy	45.5431523000000027	8.06338449999999973	13875
590	Ospedale Maggiore Policlinico Fondazione Ca' Granda		 Milano	 Italy	Ospedale Maggiore Policlinico Fondazione Ca' Granda,, Milano, Italy	45.4592627999999976	9.19590990000000019	20122
591	Ospedale San Raffaele IRCCS		 Milano	 Italy	Ospedale San Raffaele IRCCS,, Milano, Italy	45.5049962999999877	9.26575540000000153	20132
592	Istituto Nazionale Tumori - IRCCS Fondazione G. Pascale		 Napoli	 Italy	Istituto Nazionale Tumori - IRCCS Fondazione G. Pascale,, Napoli, Italy	40.8624389999999877	14.2226575999999998	80131
888					,,,	0	0	
593	Ospedale San Francesco		 Nuoro	 Italy	Ospedale San Francesco,, Nuoro, Italy	40.3255781000000013	9.31597350000000013	08100
594	Ospedale Sant' Antonio		 Padova	 Italy	Ospedale Sant' Antonio,, Padova, Italy	45.3927758999999966	11.8917480999999992	35127
595	Azienda Ospedaliera San Giovanni - Addolorata		 Roma	 Italy	Azienda Ospedaliera San Giovanni - Addolorata,, Roma, Italy	41.8857203999999967	12.5020349999999993	00184
596	BC Children's Hospital	 Vancouver	 British Columbia	 Canada	BC Children's Hospital, Vancouver, British Columbia, Canada	49.2436290999999997	-123.125712500000006	V6H 3N1
597	Infectious Disease Institute		 Kampala	 Uganda	Infectious Disease Institute,, Kampala, Uganda	0.338779500000000011	32.5762908000000024	Uganda
598	Cedars-Sinai Medical Center	 Los Angeles	 California	 United States	Cedars-Sinai Medical Center, Los Angeles, California, United States	34.0753069000000011	-118.380417399999999	1804
599	Balgrist University Hospital		 Zürich	 Switzerland	Balgrist University Hospital,, Zürich, Switzerland	47.353260000000013	8.57504370000000016	8008
600	Rehabilitation center TrainM		 Antwerp	 Belgium	Rehabilitation center TrainM,, Antwerp, Belgium	51.2162258999999978	4.41594759999999997	2018
601	iCCM sites	 Banamba	 Koulikoro	 Mali	iCCM sites, Banamba, Koulikoro, Mali	13.5543248999999992	-7.44354409999999866	Mali
602	iCCM Sites		 Koulikoro	 Mali	iCCM Sites,, Koulikoro, Mali	13.8018073999999995	-7.43813549999999957	Mali
603	Isala	 Zwolle	 Overijssel	 Netherlands	Isala, Zwolle, Overijssel, Netherlands	52.513203500000003	6.12437709999999935	8025 AB
604	The Ohio State University Wexner Medical Center	 Columbus	 Ohio	 United States	The Ohio State University Wexner Medical Center, Columbus, Ohio, United States	39.9953221999999968	-83.01774979999999	43210
605	Visiting Nurse Service of New York	 New York	 New York	 United States	Visiting Nurse Service of New York, New York, New York, United States	40.7695480000000003	-73.964154999999991	10021
606	Peking University third Hospital	 Beijing	 Beijing	 China	Peking University third Hospital, Beijing, Beijing, China	39.9819150999999877	116.359425900000005	100083
607	Fondazione IRCCS Istituto Nazionale dei Tumori		 Milan	 Italy	Fondazione IRCCS Istituto Nazionale dei Tumori,, Milan, Italy	45.4744689999999991	9.23043839999999882	20133
608	University of Pittsburgh Medical Center	 Pittsburgh	 Pennsylvania	 United States	University of Pittsburgh Medical Center, Pittsburgh, Pennsylvania, United States	40.4425937000000033	-79.9610059999999976	2536
609	Washington Dermatology Center	 Rockville	 Maryland	 United States	Washington Dermatology Center, Rockville, Maryland, United States	39.0490238000000005	-77.1252106999999967	20852
610	UMC Ljubljana		 Ljubljana	 Slovenia	UMC Ljubljana,, Ljubljana, Slovenia	46.053633099999999	14.5213538	1000
611	Livsmedicin (LIFE)	 Umeå	 Västerbotten	 Sweden	Livsmedicin (LIFE), Umeå, Västerbotten, Sweden	63.8258470999999972	20.2630353999999997	Sweden
612	Afar Region	 Semera	 Zone 1	 Ethiopia	Afar Region, Semera, Zone 1, Ethiopia	11.7927941999999994	41.0091481999999985	Ethiopia
613	Hospital Infantil de Mexico Dr. Federico Gomez	 Cuauhtémoc	 Ciudad De México	 Mexico	Hospital Infantil de Mexico Dr. Federico Gomez, Cuauhtémoc, Ciudad De México, Mexico	19.4108114	-99.1521812000000011	06720
614	University of Illinois at Chicago	 Chicago	 Illinois	 United States	University of Illinois at Chicago, Chicago, Illinois, United States	41.8697937999999965	-87.6496336000000014	60607
615	B and B Care Services	 Springfield	 Georgia	 United States	B and B Care Services, Springfield, Georgia, United States	32.366582600000001	-81.3091343999999907	9259
616	Medical University of Vienna		 Vienna	 Austria	Medical University of Vienna,, Vienna, Austria	48.2196988999999974	16.3515215000000005	1090
617	Charité University		 Berlin	 Germany	Charité University,, Berlin, Germany	52.5264617999999999	13.3766245000000001	10117
618	University of Pennsylvania	 Philadelphia	 Pennsylvania	 United States	University of Pennsylvania, Philadelphia, Pennsylvania, United States	39.9522187999999971	-75.1932137000000012	19104
619	Dept. Of Otorhinolaryngology		 Copenhagen	 Denmark	Dept. Of Otorhinolaryngology,, Copenhagen, Denmark	55.6760968000000034	12.5683372000000002	Denmark
620	Dept. Of Otorhinolaryngology		 Copenhagen	 Denmark	Dept. Of Otorhinolaryngology,, Copenhagen, Denmark	55.6760968000000034	12.5683372000000002	Denmark
621	Rhode Island Hospital	 Providence	 Rhode Island	 United States	Rhode Island Hospital, Providence, Rhode Island, United States	41.8110386000000034	-71.4110385999999977	02903
622	Providence VA Medical Center	 Providence	 Rhode Island	 United States	Providence VA Medical Center, Providence, Rhode Island, United States	41.8323703000000009	-71.4340933000000007	02908
623	UC San Diego Moores Cancer Center	 La Jolla	 California	 United States	UC San Diego Moores Cancer Center, La Jolla, California, United States	32.8785384999999977	-117.222714400000001	92093
624	Infectious Diseases Institute		 Kampala	 Uganda	Infectious Diseases Institute,, Kampala, Uganda	0.338779500000000011	32.5762908000000024	Uganda
625	Maricopa IHS	 Phoenix	 Arizona	 United States	Maricopa IHS, Phoenix, Arizona, United States	33.4969499999999982	-112.049420999999995	85016
626	Univeristy of Southern California	 Los Angeles	 California	 United States	Univeristy of Southern California, Los Angeles, California, United States	34.0223518999999968	-118.285117	90007
627	MedStar Health Research Institute	 Washington	 District of Columbia	 United States	MedStar Health Research Institute, Washington, District of Columbia, United States	38.9286124999999998	-77.0134879000000154	20010
628	University of Florida	 Gainesville	 Florida	 United States	University of Florida, Gainesville, Florida, United States	29.6436324999999989	-82.3549301999999983	32611
629	Ohio State University	 Columbus	 Ohio	 United States	Ohio State University, Columbus, Ohio, United States	40.014190499999998	-83.0309142999999921	43210
630	University of Pittsburgh Medical Center	 Pittsburgh	 Pennsylvania	 United States	University of Pittsburgh Medical Center, Pittsburgh, Pennsylvania, United States	40.4425937000000033	-79.9610059999999976	2536
631	Sacramento VA Medical Center	 Mather	 California	 United States	Sacramento VA Medical Center, Mather, California, United States	38.5726993999999976	-121.296374400000005	95655
632	University of Alabama	 Tuscaloosa	 Alabama	 United States	University of Alabama, Tuscaloosa, Alabama, United States	33.2140233000000009	-87.5391417999999959	35487
633	University of Pittsburgh School of Medicine	 Pittsburgh	 Pennsylvania	 United States	University of Pittsburgh School of Medicine, Pittsburgh, Pennsylvania, United States	40.4431287000000026	-79.9613240999999988	15213
634	University of Pittsburgh School of Medicine	 Pittsburgh	 Pennsylvania	 United States	University of Pittsburgh School of Medicine, Pittsburgh, Pennsylvania, United States	40.4431287000000026	-79.9613240999999988	15213
635	The Second Affiliated Hospital and Yuying Children's Hospital of Wenzhou Medical University	 Wenzhou	 Zhejiang	 China	The Second Affiliated Hospital and Yuying Children's Hospital of Wenzhou Medical University, Wenzhou, Zhejiang, China	28.0062110000000004	120.672250000000005	325003
636	Hampshire Hospitals NHS Foundation Trust	 Basingstoke	 Royal Hampshire	 United Kingdom	Hampshire Hospitals NHS Foundation Trust, Basingstoke, Royal Hampshire, United Kingdom	51.2801884999999871	-1.11111059999999995	RG24 9NA
637	University Hospital Southampton NHS Foundation Trust		 Southampton	 United Kingdom	University Hospital Southampton NHS Foundation Trust,, Southampton, United Kingdom	50.9336024999999992	-1.43371760000000004	SO16 6YD
638	North Shore University Hospital	 Manhasset	 New York	 United States	North Shore University Hospital, Manhasset, New York, United States	40.776185599999998	-73.7012864999999948	11030
639	Long Island Jewish Medical Center	 New Hyde Park	 New York	 United States	Long Island Jewish Medical Center, New Hyde Park, New York, United States	40.7544453000000004	-73.7077152999999896	11040
640	Tan Tock Seng Hospital Rehabilitation Centre		 Singapore	 Singapore	Tan Tock Seng Hospital Rehabilitation Centre,, Singapore, Singapore	1.38413309999999989	103.840371700000006	569766
641	University of Washington Innovative Programs Research Group	 Seattle	 Washington	 United States	University of Washington Innovative Programs Research Group, Seattle, Washington, United States	47.6502096999999978	-122.308188999999999	98195
642	Helsinki University and Helsinki University Hospital		 Helsinki	 Finland	Helsinki University and Helsinki University Hospital,, Helsinki, Finland	60.1907179999999968	24.9038728999999996	00290
643	University of Tampere		 Tampere	 Finland	University of Tampere,, Tampere, Finland	61.4936494000000025	23.7788527999999992	33100
644	The University of Arizona Cancer Center	 Tucson	 Arizona	 United States	The University of Arizona Cancer Center, Tucson, Arizona, United States	32.2765477000000018	-110.943165899999997	85719
645	Hospital Universitari Mutua Terrassa	 Terrassa	 Barcelona	 Spain	Hospital Universitari Mutua Terrassa, Terrassa, Barcelona, Spain	41.5638671999999971	2.01720699999999997	08221
646	Singapore General Hospital		 Singapore	 Singapore	Singapore General Hospital,, Singapore, Singapore	1.27958769999999999	103.835888100000005	169608
647	CTI Clinical Trial and Consulting Services	 Cincinnati	 Ohio	 United States	CTI Clinical Trial and Consulting Services, Cincinnati, Ohio, United States	39.0903255999999999	-84.5099257999999907	41011
648	Omega Medical Research	 Warwick	 Rhode Island	 United States	Omega Medical Research, Warwick, Rhode Island, United States	41.7256256000000008	-71.4790270999999962	02886
649	Community Regional Medical Center	 Fresno	 California	 United States	Community Regional Medical Center, Fresno, California, United States	36.7433527999999967	-119.784541099999998	93721
650	Community Regional Medical Center	 Fresno	 California	 United States	Community Regional Medical Center, Fresno, California, United States	36.7433527999999967	-119.784541099999998	93721
651	UCSF Benioff Children's Hospital Oakland	 Oakland	 California	 United States	UCSF Benioff Children's Hospital Oakland, Oakland, California, United States	37.8376334000000014	-122.267473800000005	94609
652	UCSF Benioff Children's Hospital San Francisco	 San Francisco	 California	 United States	UCSF Benioff Children's Hospital San Francisco, San Francisco, California, United States	37.7648523000000012	-122.390158499999998	94158
653	Kaiser Permanente - Santa Clara	 Santa Clara	 California	 United States	Kaiser Permanente - Santa Clara, Santa Clara, California, United States	37.3376317999999969	-121.978801200000007	95051
654	Kaiser Permanente - Santa Clara	 Santa Clara	 California	 United States	Kaiser Permanente - Santa Clara, Santa Clara, California, United States	37.3376317999999969	-121.978801200000007	95051
655	Cedars Sinai Medical Center	 Los Angeles	 California	 United States	Cedars Sinai Medical Center, Los Angeles, California, United States	34.0753069000000011	-118.380417399999999	1804
656	Academisch Ziekenhuis Maastricht		 Maastricht	 Netherlands	Academisch Ziekenhuis Maastricht,, Maastricht, Netherlands	50.8351899999999972	5.71464289999999941	6229 HX
657	Changi General Hospital		 Singapore	 Singapore	Changi General Hospital,, Singapore, Singapore	1.34040390000000009	103.9494744	529889
658	ICOT Hospital		 Latina	 Italy	ICOT Hospital,, Latina, Italy	41.4426557999999972	12.9010315999999996	04100
659	Kelli Koltyn	 Madison	 Wisconsin	 United States	Kelli Koltyn, Madison, Wisconsin, United States	43.0730517000000006	-89.4012302000000005	United States
660	Erasme Hospital	 Brussels	 Anderlecht	 Belgium	Erasme Hospital, Brussels, Anderlecht, Belgium	50.813444699999998	4.26589259999999992	1070
661	University Hospitals Cleveland Medical Center	 Cleveland	 Ohio	 United States	University Hospitals Cleveland Medical Center, Cleveland, Ohio, United States	41.506015699999999	-81.6068396999999948	44106
662	University of Vermont	 Burlington	 Vermont	 United States	University of Vermont, Burlington, Vermont, United States	44.4778528000000009	-73.1964636999999954	05405
663	Singapore General Hospital		 Singapore	 Singapore	Singapore General Hospital,, Singapore, Singapore	1.27958769999999999	103.835888100000005	169608
664	Respiratory Investigation Unit	 Kingston	 Ontario	 Canada	Respiratory Investigation Unit, Kingston, Ontario, Canada	44.2311716999999973	-76.4859543999999971	Canada
665	Saint-Pierre Hospital		 Brussels	 Belgium	Saint-Pierre Hospital,, Brussels, Belgium	50.834223999999999	4.34724600000000017	1000
666	University of Virginia Clinical Research Unit	 Charlottesville	 Virginia	 United States	University of Virginia Clinical Research Unit, Charlottesville, Virginia, United States	38.0319129000000018	-78.4991814999999917	22908
667	Pediatric Research Ward at Queen Elizabeth Central Hospital		 Blantyre	 Malawi	Pediatric Research Ward at Queen Elizabeth Central Hospital,, Blantyre, Malawi	-15.8029930000000007	35.0216060999999996	Malawi
668	University Teaching Hospital's Lusaka Childrens Hospital		 Lusaka	 Zambia	University Teaching Hospital's Lusaka Childrens Hospital,, Lusaka, Zambia	-15.4323291999999999	28.3136848000000008	Zambia
669	UT Health San Antonio School of Nursing	 San Antonio	 Texas	 United States	UT Health San Antonio School of Nursing, San Antonio, Texas, United States	29.507465400000001	-98.5753520999999893	78229
670	National University Hospital		 Singapore	 Singapore	National University Hospital,, Singapore, Singapore	1.29372780000000009	103.783175600000007	119074
671	Bruyere Research Institute	 Ottawa	 Ontario	 Canada	Bruyere Research Institute, Ottawa, Ontario, Canada	45.4120625999999987	-75.7100044999999966	K1R 6M1
672	Baycrest Health Sciences	 Toronto	 Ontario	 Canada	Baycrest Health Sciences, Toronto, Ontario, Canada	43.7300067999999982	-79.4342381000000017	M6A 2E1
673	Aalborg University Hospital		 Aalborg	 Denmark	Aalborg University Hospital,, Aalborg, Denmark	57.0381684999999976	9.90617229999999971	9100
674	Washington University Reproductive Endocrinology	 Saint Louis	 Missouri	 United States	Washington University Reproductive Endocrinology, Saint Louis, Missouri, United States	38.6370219000000006	-90.2569817999999913	63110
675	University of Cincinnati	 Cincinnati	 Ohio	 United States	University of Cincinnati, Cincinnati, Ohio, United States	39.1329218999999995	-84.5149503999999894	45221
676	Cincinnati VA Medical Center	 Cincinnati	 Ohio	 United States	Cincinnati VA Medical Center, Cincinnati, Ohio, United States	39.1389347000000001	-84.5086395999999951	45220
677	Radboudumc	 Nijmegen	 Gelderland	 Netherlands	Radboudumc, Nijmegen, Gelderland, Netherlands	51.8235728000000009	5.86118119999999987	6525 GA
678	Radboudumc	 Nijmegen	 Gelderland	 Netherlands	Radboudumc, Nijmegen, Gelderland, Netherlands	51.8235728000000009	5.86118119999999987	6525 GA
679	Cork University Maternity Hospital	 Cork	 Munster	 Ireland	Cork University Maternity Hospital, Cork, Munster, Ireland	51.8823635999999979	-8.51118559999999924	Ireland
680	 Prince of Wales Hospital		 Sha Tin	 Hong Kong	 Prince of Wales Hospital,, Sha Tin, Hong Kong	22.3809159999999991	114.201794000000007	Hong Kong
681	Maine Medical Center	 Portland	 Maine	 United States	Maine Medical Center, Portland, Maine, United States	43.6531738999999988	-70.2763989999999978	04102
682	Maine Medical Center	 Portland	 Maine	 United States	Maine Medical Center, Portland, Maine, United States	43.6531738999999988	-70.2763989999999978	04102
683	St. Joseph's Hospital Hamilton	 Hamilton	 Ontario	 Canada	St. Joseph's Hospital Hamilton, Hamilton, Ontario, Canada	43.2483112999999975	-79.8713063999999946	L8N 4A6
684	Universidade Federal de Santa Catarina	 Araranguá	 Santa Catarina	 Brazil	Universidade Federal de Santa Catarina, Araranguá, Santa Catarina, Brazil	-28.9484101000000003	-49.4982562000000001	88905-120
685	CHU Angers		 Angers	 France	CHU Angers,, Angers, France	47.4815098999999989	-0.554829699999999981	49100
686	CHU Bordeaux		 Bordeaux	 France	CHU Bordeaux,, Bordeaux, France	44.8332864999999998	-0.579609399999999941	33075
687	CHU Lille		 Lille	 France	CHU Lille,, Lille, France	50.6108998999999997	3.03470310000000021	59000
688	Hôpital Pitié Salpêtrière		 Paris	 France	Hôpital Pitié Salpêtrière,, Paris, France	48.837079199999998	2.36504290000000017	75013
689	CHU Rennes		 Rennes	 France	CHU Rennes,, Rennes, France	48.12059	-1.69485029999999992	35000
690	CHU Toulouse		 Toulouse	 France	CHU Toulouse,, Toulouse, France	43.6139853999999971	1.40288370000000007	31300
691	Kennedy Krieger Institute	 Baltimore	 Maryland	 United States	Kennedy Krieger Institute, Baltimore, Maryland, United States	39.2986592999999971	-76.5940475000000021	21205
692	Kennedy Krieger Institute	 Baltimore	 Maryland	 United States	Kennedy Krieger Institute, Baltimore, Maryland, United States	39.2986592999999971	-76.5940475000000021	21205
693	Johns Hopkins Medical Institutions	 Baltimore	 Maryland	 United States	Johns Hopkins Medical Institutions, Baltimore, Maryland, United States	39.2992161000000024	-76.5933799000000022	21205
694	Gordon & Leslie Diamond Health Centre -- Vancouver General Hospital	 Vancouver	 British Columbia	 Canada	Gordon & Leslie Diamond Health Centre -- Vancouver General Hospital, Vancouver, British Columbia, Canada	49.2611460999999977	-123.126032699999996	V5Z 1M9
695	University of Louisville	 Louisville	 Kentucky	 United States	University of Louisville, Louisville, Kentucky, United States	38.2122760999999969	-85.7585022999999893	40292
696	The Mayo Clinic	 Rochester	 Minnesota	 United States	The Mayo Clinic, Rochester, Minnesota, United States	44.0207180000000022	-92.4827619999999939	55902
697	University of Rochester Medical Center	 Rochester	 New York	 United States	University of Rochester Medical Center, Rochester, New York, United States	43.1230503000000027	-77.6269403000000011	14642
698	Hospital University of Pennsylvania	 Philadelphia	 Pennsylvania	 United States	Hospital University of Pennsylvania, Philadelphia, Pennsylvania, United States	39.9500225999999969	-75.1937544000000031	19104
699	Hospital University of Pennsylvania	 Philadelphia	 Pennsylvania	 United States	Hospital University of Pennsylvania, Philadelphia, Pennsylvania, United States	39.9500225999999969	-75.1937544000000031	19104
700	Hospital University of Pennsylvania	 Philadelphia	 Pennsylvania	 United States	Hospital University of Pennsylvania, Philadelphia, Pennsylvania, United States	39.9500225999999969	-75.1937544000000031	19104
701	Fairway Physiotherapy	 Thunder Bay	 Ontario	 Canada	Fairway Physiotherapy, Thunder Bay, Ontario, Canada	48.380201999999997	-89.2960619999999921	P7E 5R8
702	The Chinese University of Hong Kong		 Hong Kong	 Hong Kong	The Chinese University of Hong Kong,, Hong Kong, Hong Kong	22.4162631999999995	114.210931799999997	Hong Kong
703	Sorlandet Hospital HF	 Kristiansand	 Vest Agder	 Norway	Sorlandet Hospital HF, Kristiansand, Vest Agder, Norway	58.1641047000000029	7.98077840000000016	4615
704	Phramongkutklao Hospital		 Bangkok	 Thailand	Phramongkutklao Hospital,, Bangkok, Thailand	13.7677212999999998	100.534385299999997	10400
705	Rajavithi Hospital		 Bangkok	 Thailand	Rajavithi Hospital,, Bangkok, Thailand	13.7638248999999995	100.535601900000003	10400
706	Ramathibodi hospital		 Bangkok	 Thailand	Ramathibodi hospital,, Bangkok, Thailand	13.7660149999999994	100.526786400000006	10400
707	MetroHealth Medical Center	 Cleveland	 Ohio	 United States	MetroHealth Medical Center, Cleveland, Ohio, United States	41.4613172999999975	-81.6981875000000031	44109
708	Packard El Camino Hospital	 Mountain View	 California	 United States	Packard El Camino Hospital, Mountain View, California, United States	37.3697935000000001	-122.082368599999995	94040
709	Lucile Packard Children's Hospital	 Palo Alto	 California	 United States	Lucile Packard Children's Hospital, Palo Alto, California, United States	37.4368081000000004	-122.173053600000003	94304
710	Intermountain Riverton Hospital	 Riverton	 Utah	 United States	Intermountain Riverton Hospital, Riverton, Utah, United States	40.5205638999999991	-111.980426499999993	84065
711	Primary Children's Hospital	 Salt Lake City	 Utah	 United States	Primary Children's Hospital, Salt Lake City, Utah, United States	40.7711079999999981	-111.838905600000004	84113
712	Stanford University School of Medicine	 Palo Alto	 California	 United States	Stanford University School of Medicine, Palo Alto, California, United States	37.431810200000001	-122.175758000000002	94305
713	Oslo University Hospital		 Oslo	 Norway	Oslo University Hospital,, Oslo, Norway	59.9492404999999877	10.7150818000000001	0372
714	Addenbrooke's Hospital	 Cambridge	 England	 United Kingdom	Addenbrooke's Hospital, Cambridge, England, United Kingdom	52.1751266999999999	0.140661599999999998	CB2 0QQ
715	Clinical Centre of Serbia		 Belgrade	 Serbia	Clinical Centre of Serbia,, Belgrade, Serbia	44.7992297999999991	20.4583952999999994	11000
716	 CUHK		 Hong Kong	 Hong Kong	 CUHK,, Hong Kong, Hong Kong	22.4162631999999995	114.210931799999997	Hong Kong
717	University of Minnesota	 Minneapolis	 Minnesota	 United States	University of Minnesota, Minneapolis, Minnesota, United States	44.9739900000000006	-93.2277284999999978	55455
718	University of Minnesota	 Minneapolis	 Minnesota	 United States	University of Minnesota, Minneapolis, Minnesota, United States	44.9739900000000006	-93.2277284999999978	55455
719	Children's Mercy Hospital	 Kansas City	 Missouri	 United States	Children's Mercy Hospital, Kansas City, Missouri, United States	39.0838788999999878	-94.5771759000000003	4619
720	University of Tuebingen	 Tuebingen	 Baden-Wuerttemberg	 Germany	University of Tuebingen, Tuebingen, Baden-Wuerttemberg, Germany	48.5294781999999998	9.04377399999999909	72074
721	University of Cologne		 Cologne	 Germany	University of Cologne,, Cologne, Germany	50.9281624999999991	6.92881929999999979	50923
722	University of Essen		 Essen	 Germany	University of Essen,, Essen, Germany	51.4630687999999878	7.00707919999999973	45141
723	University of Heidelberg		 Heidelberg	 Germany	University of Heidelberg,, Heidelberg, Germany	49.4191402000000011	8.67024919999999888	69117
724	LMU		 Munich	 Germany	LMU,, Munich, Germany	48.1508060000000029	11.5804299999999998	80539
725	TU		 Munich	 Germany	TU,, Munich, Germany	48.1496599999999972	11.5678602000000001	80333
726	University of Ulm		 Ulm	 Germany	University of Ulm,, Ulm, Germany	48.4222304999999977	9.95558199999999971	89081
727	University of Ulm		 Ulm	 Germany	University of Ulm,, Ulm, Germany	48.4222304999999977	9.95558199999999971	89081
728	University of Ulm		 Ulm	 Germany	University of Ulm,, Ulm, Germany	48.4222304999999977	9.95558199999999971	89081
729	Canisius-Wilhelmina Hospital	 Nijmegen	 Gelderland	 Netherlands	Canisius-Wilhelmina Hospital, Nijmegen, Gelderland, Netherlands	51.8169266000000022	5.83057249999999971	6532 SZ
730	Jeroen Bosch Ziekenhuis		 's-Hertogenbosch	 Netherlands	Jeroen Bosch Ziekenhuis,, 's-Hertogenbosch, Netherlands	51.6847423999999975	5.27720959999999994	5223 GZ
731	Gelre Ziekenhuizen		 Apeldoorn	 Netherlands	Gelre Ziekenhuizen,, Apeldoorn, Netherlands	52.1813100000000034	5.94755599999999962	7334 DZ
732	Rijnstate		 Arnhem	 Netherlands	Rijnstate,, Arnhem, Netherlands	52.0007183000000026	5.90931799999999985	6815 AD
733	Maasziekenhuis Pantein		 Boxmeer	 Netherlands	Maasziekenhuis Pantein,, Boxmeer, Netherlands	51.6635220000000004	5.94056599999999957	5835 DV
734	Slingeland Ziekenhuis		 Doetinchem	 Netherlands	Slingeland Ziekenhuis,, Doetinchem, Netherlands	51.9759699999999967	6.28439630000000005	7009 BL
735	Nij Geertgen		 Elsendorp	 Netherlands	Nij Geertgen,, Elsendorp, Netherlands	51.5781532999999968	5.7678010000000004	5424 SM
736	Medisch Centrum Kinderwens		 Leiderdorp	 Netherlands	Medisch Centrum Kinderwens,, Leiderdorp, Netherlands	52.1553553999999977	4.54169749999999972	2353 GA
737	Maastricht UMC+		 Maastricht	 Netherlands	Maastricht UMC+,, Maastricht, Netherlands	50.8351899999999972	5.71464289999999941	6229 HX
738	Radboudumc		 Nijmegen	 Netherlands	Radboudumc,, Nijmegen, Netherlands	51.8235728000000009	5.86118119999999987	6525 GA
739	Elisabeth-TweeSteden Ziekenhuis		 Tilburg	 Netherlands	Elisabeth-TweeSteden Ziekenhuis,, Tilburg, Netherlands	51.5772884000000005	5.05949150000000003	5042 AD
740	Bernhoven Ziekenhuis		 Uden	 Netherlands	Bernhoven Ziekenhuis,, Uden, Netherlands	51.6738872000000029	5.60652969999999939	5406 PT
741	Máxima Medisch Centrum		 Veldhoven	 Netherlands	Máxima Medisch Centrum,, Veldhoven, Netherlands	51.4056499999999872	5.41830099999999959	5504 DB
742	Nij Barrahus		 Wolvega	 Netherlands	Nij Barrahus,, Wolvega, Netherlands	52.8858030000000028	5.99974199999999858	8471 ZA
743	 Imaging and Clinical Sciences		 Chieti	 Italy	 Imaging and Clinical Sciences,, Chieti, Italy	42.3478860000000026	14.1635845000000007	66100
744	La Promessa ONLUS		 Roma	 Italy	La Promessa ONLUS,, Roma, Italy	41.9027834999999982	12.4963654999999996	Italy
745	Nationwide Children's Hospital	 Columbus	 Ohio	 United States	Nationwide Children's Hospital, Columbus, Ohio, United States	39.9531269999999878	-82.9794890000000009	43205
746	University of Utah	 Salt Lake City	 Utah	 United States	University of Utah, Salt Lake City, Utah, United States	40.764936800000001	-111.842102100000005	84112
747	Faculty of Human Kinetics - University of Lisbon	 Lisbon	 Cruz Quebrada	 Portugal	Faculty of Human Kinetics - University of Lisbon, Lisbon, Cruz Quebrada, Portugal	38.7050705999999991	-9.25209760000000081	1495-687
748	 UMC Ljubljana		 Ljubljana	 Slovenia	 UMC Ljubljana,, Ljubljana, Slovenia	46.053633099999999	14.5213538	1000
749	 UMC Ljubljana		 Ljubljana	 Slovenia	 UMC Ljubljana,, Ljubljana, Slovenia	46.053633099999999	14.5213538	1000
750	 Imaging and Clinical Sciences		 Chieti	 Italy	 Imaging and Clinical Sciences,, Chieti, Italy	42.3478860000000026	14.1635845000000007	66100
751	La Promessa ONLUS		 Rome	 Italy	La Promessa ONLUS,, Rome, Italy	41.9027834999999982	12.4963654999999996	Italy
752	La Promessa ONLUS		 Rome	 Italy	La Promessa ONLUS,, Rome, Italy	41.9027834999999982	12.4963654999999996	Italy
753	La Promessa ONLUS		 Rome	 Italy	La Promessa ONLUS,, Rome, Italy	41.9027834999999982	12.4963654999999996	Italy
754	Eastern Virginia Medical School	 Norfolk	 Virginia	 United States	Eastern Virginia Medical School, Norfolk, Virginia, United States	36.8604020000000006	-76.3036050999999986	23507
755	Lee's clinic		 Kaohsiung	 Taiwan	Lee's clinic,, Kaohsiung, Taiwan	22.5901783999999992	120.488660100000004	913
756	Policlinico Universitario Agostino Gemelli		 Rome	 Italy	Policlinico Universitario Agostino Gemelli,, Rome, Italy	41.9307779999999966	12.4305152999999997	00168
757	Henry Ford Medical Center - Columbus	 Novi	 Michigan	 United States	Henry Ford Medical Center - Columbus, Novi, Michigan, United States	42.4982469999999992	-83.4373409999999893	48377
758	CancerCare Manitoba	 Winnipeg	 Manitoba	 Canada	CancerCare Manitoba, Winnipeg, Manitoba, Canada	49.9030606999999975	-97.1583208000000127	R3E 0V9
759	Health Sciences Center	 Winnipeg	 Manitoba	 Canada	Health Sciences Center, Winnipeg, Manitoba, Canada	49.9030599000000024	-97.1574039999999997	R3A 1R9
760	Obstetrics and Gynecology Family Planning Clinic at University of California Davis	 Sacramento	 California	 United States	Obstetrics and Gynecology Family Planning Clinic at University of California Davis, Sacramento, California, United States	38.5524027000000018	-121.449512200000001	2307
761	Women's Health Services at University of California San Diego	 San Diego	 California	 United States	Women's Health Services at University of California San Diego, San Diego, California, United States	32.8774044000000032	-117.240616700000004	0304
762	Kaiser Permanente Northern California	 San Francisco	 California	 United States	Kaiser Permanente Northern California, San Francisco, California, United States	37.7683163000000022	-122.395256599999996	94158
763	Kaiser Permanente Northern California	 San Francisco	 California	 United States	Kaiser Permanente Northern California, San Francisco, California, United States	37.7683163000000022	-122.395256599999996	94158
764	University of Washington	 Seattle	 Washington	 United States	University of Washington, Seattle, Washington, United States	47.6553350999999878	-122.303519899999998	98195
765	The Norwegian Dry Eye Clinic		 Oslo	 Norway	The Norwegian Dry Eye Clinic,, Oslo, Norway	59.9302636999999976	10.7162331000000002	0366
766	Oslo University Hospital		 Oslo	 Norway	Oslo University Hospital,, Oslo, Norway	59.9492404999999877	10.7150818000000001	0372
767	Rutgers Cancer Institute of New Jersey	 New Brunswick	 New Jersey	 United States	Rutgers Cancer Institute of New Jersey, New Brunswick, New Jersey, United States	40.4964398999999986	-74.4486871000000008	1998
768	Clinique d'orthodontie de l'Université de Montréal	 Montréal	 Quebec	 Canada	Clinique d'orthodontie de l'Université de Montréal, Montréal, Quebec, Canada	45.5036148000000082	-73.615536800000001	H3T 1J4
769	Huntsman Cancer Institute	 Salt Lake City	 Utah	 United States	Huntsman Cancer Institute, Salt Lake City, Utah, United States	40.7735959999999977	-111.835144	84112
770	University of Cincinnati Medical Center	 Cincinnati	 Ohio	 United States	University of Cincinnati Medical Center, Cincinnati, Ohio, United States	39.1385502999999986	-84.5037426999999894	45267
771	BaoKang Long-Term Care Center		 Chia-Yi	 Taiwan	BaoKang Long-Term Care Center,, Chia-Yi, Taiwan	23.4800751000000005	120.449111299999998	600
772	Laser Surgery Care	 New York	 New York	 United States	Laser Surgery Care, New York, New York, United States	40.7466646000000026	-74.0024090000000001	2155
773	Mbarara University of Science and Technology/Mbarara Regional Referral Hospital		 Mbarara	 Uganda	Mbarara University of Science and Technology/Mbarara Regional Referral Hospital,, Mbarara, Uganda	-0.617059099999999972	30.65766249999999	Uganda
774	Lucile Packard Children's Hospital	 Palo Alto	 California	 United States	Lucile Packard Children's Hospital, Palo Alto, California, United States	37.4368081000000004	-122.173053600000003	94304
775	University of California San Francisco Benioff Children's Hospita;	 San Francisco	 California	 United States	University of California San Francisco Benioff Children's Hospita;, San Francisco, California, United States	37.7648523000000012	-122.390158499999998	94158
776	University of California San Francisco Benioff Children's Hospita;	 San Francisco	 California	 United States	University of California San Francisco Benioff Children's Hospita;, San Francisco, California, United States	37.7648523000000012	-122.390158499999998	94158
777	GI Care for Kids	 Atlanta	 Georgia	 United States	GI Care for Kids, Atlanta, Georgia, United States	33.9066059999999965	-84.3552809999999909	30342
778	Riley Hospital for Children	 Indianapolis	 Indiana	 United States	Riley Hospital for Children, Indianapolis, Indiana, United States	39.7774284999999992	-86.1800805000000025	5109
779	Children's Mercy Hospital	 Kansas City	 Missouri	 United States	Children's Mercy Hospital, Kansas City, Missouri, United States	39.0838788999999878	-94.5771759000000003	4619
780	Nationwide Children's Hospital	 Columbus	 Ohio	 United States	Nationwide Children's Hospital, Columbus, Ohio, United States	39.9531269999999878	-82.9794890000000009	43205
781	Oregon Health Sciences University	 Portland	 Oregon	 United States	Oregon Health Sciences University, Portland, Oregon, United States	45.5047354000000013	-122.681324000000004	4901
782	UT Soutwestern Medical Center	 Dallas	 Texas	 United States	UT Soutwestern Medical Center, Dallas, Texas, United States	32.8125658000000016	-96.8413812999999948	7208
783	Pediatric Specialists of Virginia	 Fairfax	 Virginia	 United States	Pediatric Specialists of Virginia, Fairfax, Virginia, United States	38.8684100999999984	-77.2356982000000016	22031
784	Children's Hospital of the King's Daughters	 Norfolk	 Virginia	 United States	Children's Hospital of the King's Daughters, Norfolk, Virginia, United States	36.8621551000000025	-76.3017054999999971	23507
785	Seattle Children's	 Seattle	 Washington	 United States	Seattle Children's, Seattle, Washington, United States	47.6621517000000026	-122.280440799999994	3901
786	East Baltimore Medical Campus	 Baltimore	 Maryland	 United States	East Baltimore Medical Campus, Baltimore, Maryland, United States	39.3019940000000005	-76.6029583999999915	5597
788	West Virginia University	 Morgantown	 West Virginia	 United States	West Virginia University, Morgantown, West Virginia, United States	39.6361395999999999	-79.9559357999999918	26506
789	IRSN - Clinique Pasteur		 Toulouse	 France	IRSN - Clinique Pasteur,, Toulouse, France	43.5950141000000002	1.41681260000000009	31300
790	Klinikum rechts der Isar der Technischen Universität München		 Munich	 Germany	Klinikum rechts der Isar der Technischen Universität München,, Munich, Germany	48.1375004999999874	11.601051	81675
791	Academisch Ziekenhuis Groningen		 Groningen	 Netherlands	Academisch Ziekenhuis Groningen,, Groningen, Netherlands	53.2216896999999989	6.57638989999999968	9713 GZ
792	Associação para Investigação e Desenvolvimento da Faculdade de Medicina		 Lisbon	 Portugal	Associação para Investigação e Desenvolvimento da Faculdade de Medicina,, Lisbon, Portugal	38.7495471000000009	-9.16252390000000005	1649-028
793	Institut Català d'Oncologia		 Girona	 Spain	Institut Català d'Oncologia,, Girona, Spain	41.9979013000000023	2.82057810000000009	17007
794	Institut Català d'Oncologia		 Girona	 Spain	Institut Català d'Oncologia,, Girona, Spain	41.9979013000000023	2.82057810000000009	17007
795	Institut Català d'Oncologia		 Girona	 Spain	Institut Català d'Oncologia,, Girona, Spain	41.9979013000000023	2.82057810000000009	17007
796	Public Health Service	 Amsterdam	 Noord Holland	 Netherlands	Public Health Service, Amsterdam, Noord Holland, Netherlands	52.3624760000000009	4.9087670000000001	1018 WT
797	Kaiser Permanente Division of Research	 Oakland	 California	 United States	Kaiser Permanente Division of Research, Oakland, California, United States	37.8100687000000022	-122.263999799999993	94612
798	Dana Farber Cancer Institute	 Boston	 Massachusetts	 United States	Dana Farber Cancer Institute, Boston, Massachusetts, United States	42.3374515000000002	-71.1081798999999961	02215
799	Penn State Cancer Institute	 Hershey	 Pennsylvania	 United States	Penn State Cancer Institute, Hershey, Pennsylvania, United States	40.2645546999999979	-76.6744676999999939	17033
800	Ten Chan General Hospital		 Taoyuan City	 Taiwan	Ten Chan General Hospital,, Taoyuan City, Taiwan	24.9936280999999987	121.300979799999993	Taiwan
801	Calvary Public Hospital	 Bruce	 Australian Capital Territory	 Australia	Calvary Public Hospital, Bruce, Australian Capital Territory, Australia	-35.2532394999999994	149.089790599999986	2617
802	Lismore Base Hospital	 Lismore	 New South Wales	 Australia	Lismore Base Hospital, Lismore, New South Wales, Australia	-28.8088662999999912	153.292146900000006	2480
803	Liverpool Hospital	 Liverpool	 New South Wales	 Australia	Liverpool Hospital, Liverpool, New South Wales, Australia	-33.9202911	150.932214700000003	2170
804	John Hunter Hospital	 New Lambton Heights	 New South Wales	 Australia	John Hunter Hospital, New Lambton Heights, New South Wales, Australia	-32.9226874000000009	151.692587000000003	2305
805	Royal Brisbane and Women's Hospital	 Herston	 Queensland	 Australia	Royal Brisbane and Women's Hospital, Herston, Queensland, Australia	-27.4469624000000003	153.028412900000006	4029
806	Princess Alexandria Hospital	 Woolloongabba	 Queensland	 Australia	Princess Alexandria Hospital, Woolloongabba, Queensland, Australia	-27.5003512999999984	153.03409640000001	4102
807	Royal Melbourne Hospital	 Parkville	 Victoria	 Australia	Royal Melbourne Hospital, Parkville, Victoria, Australia	-37.7994094000000018	144.955625700000013	3050
808	Sunshine Hospital	 St Albans	 Victoria	 Australia	Sunshine Hospital, St Albans, Victoria, Australia	-37.7608800000000002	144.815819199999993	3021
809	Fiona Stanley Hospital	 Murdoch	 Western Australia	 Australia	Fiona Stanley Hospital, Murdoch, Western Australia, Australia	-32.0701768999999999	115.846016199999994	6150
810	Royal Adelaide Hospital		 Adelaide	 Australia	Royal Adelaide Hospital,, Adelaide, Australia	-34.9209685000000007	138.587357700000013	5000
811	Ballarat Health Services		 Ballarat	 Australia	Ballarat Health Services,, Ballarat, Australia	-37.5587519999999984	143.847235600000005	3350
812	Box Hill Hospital		 Box Hill	 Australia	Box Hill Hospital,, Box Hill, Australia	-37.8135254000000032	145.11850960000001	3128
813	University of Kentucky	 Lexington	 Kentucky	 United States	University of Kentucky, Lexington, Kentucky, United States	38.0306511	-84.503969699999999	40506
814	UMass Memorial Medical Center	 Worcester	 Massachusetts	 United States	UMass Memorial Medical Center, Worcester, Massachusetts, United States	42.277212200000001	-71.7610607000000016	01605
815	Anita Dyb Linge	 Valldal	 Møre Og Romsdal	 Norway	Anita Dyb Linge, Valldal, Møre Og Romsdal, Norway	62.2892113999999921	7.22366629999999965	Norway
816	BC Cancer Agency	 Vancouver	 British Columbia	 Canada	BC Cancer Agency, Vancouver, British Columbia, Canada	49.2631423000000126	-123.119623200000007	V5Z 1G1
817	McGill University Health Center	 Montreal	 Quebec	 Canada	McGill University Health Center, Montreal, Quebec, Canada	45.4728824999999972	-73.6017702999999983	H4A 3J1
818	IRCCS Ospedale San Raffaele	 Milan	 MI	 Italy	IRCCS Ospedale San Raffaele, Milan, MI, Italy	45.5049962999999877	9.26575540000000153	20132
819	Stony Brook University Hospital	 Stony Brook	 New York	 United States	Stony Brook University Hospital, Stony Brook, New York, United States	40.9092253000000028	-73.1153968999999933	11794
820	The Hypertension Unit of The Ottawa Hospital	 Ottawa	 Ontario	 Canada	The Hypertension Unit of The Ottawa Hospital, Ottawa, Ontario, Canada	45.4018514999999994	-75.6478697999999952	K1H 8L6
821	Stony Brook University Hospital	 Stony Brook	 New York	 United States	Stony Brook University Hospital, Stony Brook, New York, United States	40.9092253000000028	-73.1153968999999933	11794
822	Cedars-Sinai Medical Center	 Los Angeles	 California	 United States	Cedars-Sinai Medical Center, Los Angeles, California, United States	34.0753069000000011	-118.380417399999999	1804
823	Cedars-Sinai Medical Center	 Los Angeles	 California	 United States	Cedars-Sinai Medical Center, Los Angeles, California, United States	34.0753069000000011	-118.380417399999999	1804
824	Cedars-Sinai Medical Center	 Los Angeles	 California	 United States	Cedars-Sinai Medical Center, Los Angeles, California, United States	34.0753069000000011	-118.380417399999999	1804
825	Siriraj Hospital	 Bangkoknoi	 Bangkok	 Thailand	Siriraj Hospital, Bangkoknoi, Bangkok, Thailand	13.7572396000000001	100.484885800000001	10700
826	Southern Adelaide Local Health Network	 Bedford Park	 South Australia	 Australia	Southern Adelaide Local Health Network, Bedford Park, South Australia, Australia	-35.0055229999999966	138.627228500000001	5052
827	The Hope Clinic of Emory University	 Atlanta	 Georgia	 United States	The Hope Clinic of Emory University, Atlanta, Georgia, United States	33.7908410000000003	-84.2785969999999907	1705
828	NHS Grampian		 Aberdeen	 United Kingdom	NHS Grampian,, Aberdeen, United Kingdom	57.1539417999999984	-2.13340890000000005	AB25 2ZY
829	NHS Tayside		 Dundee	 United Kingdom	NHS Tayside,, Dundee, United Kingdom	56.4636033999999967	-3.03756510000000013	DD2 1UB
830	NHS Lothian		 Edinburgh	 United Kingdom	NHS Lothian,, Edinburgh, United Kingdom	55.9682302999999877	-3.17414659999999982	EH6 8NP
831	NHS Greater Glasgow and Clyde		 Glasgow	 United Kingdom	NHS Greater Glasgow and Clyde,, Glasgow, United Kingdom	55.883619000000003	-4.32101600000000019	G12 0XH
832	Newcastle upon Tyne Hospitals NHS Foundation Trust		 Newcastle Upon Tyne	 United Kingdom	Newcastle upon Tyne Hospitals NHS Foundation Trust,, Newcastle Upon Tyne, United Kingdom	55.003028399999998	-1.59294559999999996	NE7 7DN
833	Midlands Partnership NHS Foundation Trust		 Stoke on Trent	 United Kingdom	Midlands Partnership NHS Foundation Trust,, Stoke on Trent, United Kingdom	52.8105645999999993	-2.10911470000000012	ST16 3SR
834	Intermountain Medical Center	 Murray	 Utah	 United States	Intermountain Medical Center, Murray, Utah, United States	40.6630626999999976	-111.8934687	84107
835	University of Connecticut Health Center	 Farmington	 Connecticut	 United States	University of Connecticut Health Center, Farmington, Connecticut, United States	41.7307424999999981	-72.7904774999999944	0002
836	Hennepin County Medical Center	 Minneapolis	 Minnesota	 United States	Hennepin County Medical Center, Minneapolis, Minnesota, United States	44.9722223999999997	-93.2625236000000086	55415
837	Hennepin County Medical Center	 Minneapolis	 Minnesota	 United States	Hennepin County Medical Center, Minneapolis, Minnesota, United States	44.9722223999999997	-93.2625236000000086	55415
838	Children's Hospital of Los Angeles	 Los Angeles	 California	 United States	Children's Hospital of Los Angeles, Los Angeles, California, United States	34.0975538	-118.290095699999995	90027
839	Children's Hospital of Los Angeles	 Los Angeles	 California	 United States	Children's Hospital of Los Angeles, Los Angeles, California, United States	34.0975538	-118.290095699999995	90027
840	All Children's Research Institute	 Saint Petersburg	 Florida	 United States	All Children's Research Institute, Saint Petersburg, Florida, United States	27.7638950999999992	-82.6399028000000015	33701
841	Ann & Robert Lurie Children's Hospital of Chicago	 Chicago	 Illinois	 United States	Ann & Robert Lurie Children's Hospital of Chicago, Chicago, Illinois, United States	41.8962237000000002	-87.6218320999999918	60611
842	Children's Mercy Hospital	 Kansas City	 Kansas	 United States	Children's Mercy Hospital, Kansas City, Kansas, United States	39.0838788999999878	-94.5771759000000003	4619
843	Johns Hopkins University	 Baltimore	 Maryland	 United States	Johns Hopkins University, Baltimore, Maryland, United States	39.3299013000000031	-76.6205176999999935	21218
1090	Cedars-Sinai Medical Group	 Beverly Hills	 California	 United States	Cedars-Sinai Medical Group, Beverly Hills, California, United States	34.0694883000000033	-118.383543299999999	90211
844	Morgan Stanley Children's Hospital of New York Presbyterian	 New York	 New York	 United States	Morgan Stanley Children's Hospital of New York Presbyterian, New York, New York, United States	40.8396716000000026	-73.9413797999999929	10032
845	Duke University Medical Center	 Durham	 North Carolina	 United States	Duke University Medical Center, Durham, North Carolina, United States	36.0069403999999977	-78.9374112999999937	27710
846	Children's Hospital Medical Center	 Cincinnati	 Ohio	 United States	Children's Hospital Medical Center, Cincinnati, Ohio, United States	39.1408656999999991	-84.5022079000000019	45229
847	Nationwide Children's Hospital	 Columbus	 Ohio	 United States	Nationwide Children's Hospital, Columbus, Ohio, United States	39.9531269999999878	-82.9794890000000009	43205
848	Medical University of South Carolina	 Charleston	 South Carolina	 United States	Medical University of South Carolina, Charleston, South Carolina, United States	32.7847215000000034	-79.9493842999999913	29425
849	Vanderbilt University Medical Center	 Nashville	 Tennessee	 United States	Vanderbilt University Medical Center, Nashville, Tennessee, United States	36.1417373000000026	-86.8021305999999981	37232
850	The University of Texas Southwestern Medical Center	 Dallas	 Texas	 United States	The University of Texas Southwestern Medical Center, Dallas, Texas, United States	32.8174648999999974	-96.8421196999999978	75390
851	The University of Texas Southwestern Medical Center	 Dallas	 Texas	 United States	The University of Texas Southwestern Medical Center, Dallas, Texas, United States	32.8174648999999974	-96.8421196999999978	75390
852	Washington State University	 Pullman	 Washington	 United States	Washington State University, Pullman, Washington, United States	46.7319225000000031	-117.154212099999995	United States
853	Changhai Hospital	 Shanghai	 Shanghai	 China	Changhai Hospital, Shanghai, Shanghai, China	31.3091472000000017	121.525759899999997	200433
854	Longhua Hospital Shanghai University of Traditional Chinese Medicine	 Shanghai	 Shanghai	 China	Longhua Hospital Shanghai University of Traditional Chinese Medicine, Shanghai, Shanghai, China	31.1879463000000001	121.450304799999998	200000
855	RenJi Hospital	 Shanghai	 Shanghai	 China	RenJi Hospital, Shanghai, Shanghai, China	31.2336080000000003	121.484459999999999	200002
856	Ruijin Hospital	 Shanghai	 Shanghai	 China	Ruijin Hospital, Shanghai, Shanghai, China	31.2106199999999987	121.467360999999997	China
857	Shanghai 6th People's Hospital	 Shanghai	 Shanghai	 China	Shanghai 6th People's Hospital, Shanghai, Shanghai, China	31.1776750000000007	121.423371000000003	200235
858	Shanghai 6th People's Hospital	 Shanghai	 Shanghai	 China	Shanghai 6th People's Hospital, Shanghai, Shanghai, China	31.1776750000000007	121.423371000000003	200235
859	Shanghai Ninth People's Hospital Affiliated to Shanghai Jiao Tong University	 Shanghai	 Shanghai	 China	Shanghai Ninth People's Hospital Affiliated to Shanghai Jiao Tong University, Shanghai, Shanghai, China	31.2023070000000011	121.486912000000004	China
860	Shanghai Ninth People's Hospital Affiliated to Shanghai Jiao Tong University	 Shanghai	 Shanghai	 China	Shanghai Ninth People's Hospital Affiliated to Shanghai Jiao Tong University, Shanghai, Shanghai, China	31.2023070000000011	121.486912000000004	China
861	Shanghai Zhongshan Hospital	 Shanghai	 Shanghai	 China	Shanghai Zhongshan Hospital, Shanghai, Shanghai, China	31.19763429999999	121.454765699999996	China
862	Yangpu District Central Hospital Affiliated to Tongji University	 Shanghai	 Shanghai	 China	Yangpu District Central Hospital Affiliated to Tongji University, Shanghai, Shanghai, China	31.2627211000000003	121.459897499999997	200072
863	Yangpu District Central Hospital Affiliated to Tongji University	 Shanghai	 Shanghai	 China	Yangpu District Central Hospital Affiliated to Tongji University, Shanghai, Shanghai, China	31.2627211000000003	121.459897499999997	200072
864	Ward Heij	 Nijmegen	 Gelderland	 Netherlands	Ward Heij, Nijmegen, Gelderland, Netherlands	51.8448836999999969	5.8428280999999993	Netherlands
865	Ward Heij	 Nijmegen	 Gelderland	 Netherlands	Ward Heij, Nijmegen, Gelderland, Netherlands	51.8448836999999969	5.8428280999999993	Netherlands
866	Kure Kyosai Hospital	 Kure	 Hiroshima	 Japan	Kure Kyosai Hospital, Kure, Hiroshima, Japan	34.2487275000000011	132.558744499999989	737-8505
867	Toyooka Hospital	 Toyooka	 Hyogo	 Japan	Toyooka Hospital, Toyooka, Hyogo, Japan	35.5265929999999983	134.806310999999994	668-8501
868	Kasugai Municipal Hospital	 Aichi	 Kasugai	 Japan	Kasugai Municipal Hospital, Aichi, Kasugai, Japan	35.2716904999999983	136.969346999999999	486-8510
869	Hoshigaoka Medical Center	 Hirakata	 Osaka	 Japan	Hoshigaoka Medical Center, Hirakata, Osaka, Japan	34.8113778000000025	135.667767800000007	573-8511
870	Numazu City Hospital	 Numazu	 Shizuoka	 Japan	Numazu City Hospital, Numazu, Shizuoka, Japan	35.1199510000000004	138.835216000000003	410-0302
871	Saiseikai Takaoka Hospital	 Takaoka	 Toyama	 Japan	Saiseikai Takaoka Hospital, Takaoka, Toyama, Japan	36.7378089999999986	137.25525300000001	931-8442
872	Kyushu Central Hospital		 Fukuoka	 Japan	Kyushu Central Hospital,, Fukuoka, Japan	33.5632466000000065	130.424742299999991	815-8588
873	Saiseikai Kumamoto Hospital		 Kumamoto	 Japan	Saiseikai Kumamoto Hospital,, Kumamoto, Japan	32.7652149999999978	130.700973000000005	861-4193
874	Niigata Central Hospital		 Niigata	 Japan	Niigata Central Hospital,, Niigata, Japan	37.1066486000000069	138.270492700000005	943-0192
875	Okayama Red Cross Hospital		 Okayama	 Japan	Okayama Red Cross Hospital,, Okayama, Japan	34.6364700000000028	133.922239999999988	700-0941
876	Okayama Rosai Hospital		 Okayama	 Japan	Okayama Rosai Hospital,, Okayama, Japan	34.6036909999999978	133.932589000000007	702-8055
877	Saga Pref. Medical Centre Koseikan		 Saga	 Japan	Saga Pref. Medical Centre Koseikan,, Saga, Japan	33.2414607999999987	130.268716600000005	840-0861
878	MD. Sandra Belalcazar Rey	 Bogotá	 Bogotá D.C.	 Colombia	MD. Sandra Belalcazar Rey, Bogotá, Bogotá D.C., Colombia	4.71098859999999942	-74.0720919999999978	Colombia
879	MD. Victoria Eugenia Sanchez Castellanos	 Zapopan	 Jalisco	 Mexico	MD. Victoria Eugenia Sanchez Castellanos, Zapopan, Jalisco, Mexico	39.0457548999999986	-76.6412711999999914	United States
880	Centre Hospitalier Universitaire Vaudois	 Lausanne	 Vaud	 Switzerland	Centre Hospitalier Universitaire Vaudois, Lausanne, Vaud, Switzerland	46.5251459999999994	6.64254959999999972	1005
881	Clinique Medicale L'Actuel	 Montreal	 Quebec	 Canada	Clinique Medicale L'Actuel, Montreal, Quebec, Canada	45.5180629999999979	-73.5590801000000027	H2L 4P9
882	McGill University Health Center	 Montreal	 Quebec	 Canada	McGill University Health Center, Montreal, Quebec, Canada	45.4728824999999972	-73.6017702999999983	H4A 3J1
883	Carolinas Medical Center	 Charlotte	 North Carolina	 United States	Carolinas Medical Center, Charlotte, North Carolina, United States	35.2035775000000015	-80.8388519000000088	28203
884	Carolinas Medical Center	 Charlotte	 North Carolina	 United States	Carolinas Medical Center, Charlotte, North Carolina, United States	35.2035775000000015	-80.8388519000000088	28203
885	University of Pittsburgh	 Pittsburgh	 Pennsylvania	 United States	University of Pittsburgh, Pittsburgh, Pennsylvania, United States	40.4443533000000031	-79.960835000000003	15260
886	Indiana University Health Methodist Hospital	 Indianapolis	 Indiana	 United States	Indiana University Health Methodist Hospital, Indianapolis, Indiana, United States	39.7904199000000034	-86.1630901999999992	46202
887	National Center for Tumor Diseases		 Heidelberg	 Germany	National Center for Tumor Diseases,, Heidelberg, Germany	49.4184174000000027	8.66397510000000004	69120
889	Johns Hopkins University	 Baltimore	 Maryland	 United States	Johns Hopkins University, Baltimore, Maryland, United States	39.3299013000000031	-76.6205176999999935	21218
890	Alleghany Health Network	 Pittsburgh	 Pennsylvania	 United States	Alleghany Health Network, Pittsburgh, Pennsylvania, United States	40.4571516000000031	-80.007677000000001	15212
891	Baylor University	 Dallas	 Texas	 United States	Baylor University, Dallas, Texas, United States	32.7893432999999987	-96.779515399999994	75246
892	Baylor University	 Dallas	 Texas	 United States	Baylor University, Dallas, Texas, United States	32.7893432999999987	-96.779515399999994	75246
893	Hennepin County Medical Center	 Minneapolis	 Minnesota	 United States	Hennepin County Medical Center, Minneapolis, Minnesota, United States	44.9722223999999997	-93.2625236000000086	55415
894	Hadassah Medical Center	 Jerusalem	 Ein Kerem	 Israel	Hadassah Medical Center, Jerusalem, Ein Kerem, Israel	31.7649502999999989	35.1494106000000031	Israel
895	Shaare Zedek Medical Center		 Jerusalem	 Israel	Shaare Zedek Medical Center,, Jerusalem, Israel	31.7731990000000017	35.185260999999997	9103102
896	HealthPartners Institute	 Bloomington	 Minnesota	 United States	HealthPartners Institute, Bloomington, Minnesota, United States	44.8558659999999989	-93.2270018999999905	55425
897	University of Alabama	 Birmingham	 Alabama	 United States	University of Alabama, Birmingham, Alabama, United States	33.502122700000001	-86.8064447000000001	35294
898	Denver Health and Hospital Authority	 Denver	 Colorado	 United States	Denver Health and Hospital Authority, Denver, Colorado, United States	39.7278078999999877	-104.991186200000001	80204
899	Yale University	 New Haven	 Connecticut	 United States	Yale University, New Haven, Connecticut, United States	41.3163243999999992	-72.922343099999992	06520
900	University of Florida	 Gainesville	 Florida	 United States	University of Florida, Gainesville, Florida, United States	29.6436324999999989	-82.3549301999999983	32611
901	University of Miami	 Miami	 Florida	 United States	University of Miami, Miami, Florida, United States	25.7191684999999985	-80.2771252999999945	33146
902	Grace Medical Home	 Orlando	 Florida	 United States	Grace Medical Home, Orlando, Florida, United States	28.5213485999999996	-81.3782683999999961	2937
903	University of Central Florida	 Orlando	 Florida	 United States	University of Central Florida, Orlando, Florida, United States	28.6024273999999998	-81.2000598999999994	32816
904	University of South Florida	 Tampa	 Florida	 United States	University of South Florida, Tampa, Florida, United States	28.0587030999999989	-82.4138538999999923	33620
905	University of Illinois- Chicago	 Chicago	 Illinois	 United States	University of Illinois- Chicago, Chicago, Illinois, United States	41.8697937999999965	-87.6496336000000014	60607
906	Baystate Health Center	 Springfield	 Massachusetts	 United States	Baystate Health Center, Springfield, Massachusetts, United States	42.1217225999999982	-72.6031122999999923	01199
907	Montefiore	 Bronx	 New York	 United States	Montefiore, Bronx, New York, United States	40.8942124999999876	-73.8608885000000015	10466
908	Mt. Sinai	 New York	 New York	 United States	Mt. Sinai, New York, New York, United States	40.7898106999999968	-73.9528798999999992	10029
909	University of North Carolina	 Chapel Hill	 North Carolina	 United States	University of North Carolina, Chapel Hill, North Carolina, United States	35.9049121999999983	-79.046913399999994	United States
910	Atrium Health	 Charlotte	 North Carolina	 United States	Atrium Health, Charlotte, North Carolina, United States	35.2112003000000016	-80.8575412	28203
911	Duke University	 Durham	 North Carolina	 United States	Duke University, Durham, North Carolina, United States	36.0014257999999998	-78.9382286000000022	27708
912	MetroHealth	 Cleveland	 Ohio	 United States	MetroHealth, Cleveland, Ohio, United States	41.4622584000000032	-81.6979688999999922	44109
913	University of Pennsylvania	 Philadelphia	 Pennsylvania	 United States	University of Pennsylvania, Philadelphia, Pennsylvania, United States	39.9522187999999971	-75.1932137000000012	19104
914	Temple University	 Philadelphia	 Pennsylvania	 United States	Temple University, Philadelphia, Pennsylvania, United States	39.9811935000000034	-75.1553511999999984	19122
915	Ponce Health Sciences University		 Ponce	 Puerto Rico	Ponce Health Sciences University,, Ponce, Puerto Rico	17.9944929999999985	-66.6195773000000031	00716
916	University of Puerto Rico		 San Juan	 Puerto Rico	University of Puerto Rico,, San Juan, Puerto Rico	18.4069412999999997	-66.0473819999999989	Puerto Rico
918	Warunee Boayam	 Bangkok Noi	 Bangkok	 Thailand	Warunee Boayam, Bangkok Noi, Bangkok, Thailand	13.7659225000000003	100.467757599999999	10700
919	Intermountain Medical Center	 Murray	 Utah	 United States	Intermountain Medical Center, Murray, Utah, United States	40.6630626999999976	-111.8934687	84107
920	Intermountain Medical Center	 Murray	 Utah	 United States	Intermountain Medical Center, Murray, Utah, United States	40.6630626999999976	-111.8934687	84107
921	Private Office (Dr. Lee-Wing). 1010-233 Kennedy st.	 Winnipeg	 Manitoba	 Canada	Private Office (Dr. Lee-Wing). 1010-233 Kennedy st., Winnipeg, Manitoba, Canada	49.8835540999999978	-97.205213399999991	R3J 3X1
923			 Falun	 Sweden	,, Falun, Sweden	60.6064600000000127	15.6355000000000004	Sweden
924	 Sahlgrenska hospital		 Gothenburg	 Sweden	 Sahlgrenska hospital,, Gothenburg, Sweden	57.6823671999999874	11.9614317999999997	413 45
925	 Skane Universityhospital		 Malmo	 Sweden	 Skane Universityhospital,, Malmo, Sweden	55.5895679999999999	13.0016352000000008	214 21
926	 Danderyd hospital		 Stockholm	 Sweden	 Danderyd hospital,, Stockholm, Sweden	59.3923210000000026	18.0394320999999991	182 88
927	 Uppsala academical hospital		 Uppsala	 Sweden	 Uppsala academical hospital,, Uppsala, Sweden	59.8484837000000027	17.6407363000000004	751 85
928	 Örebro Universityhospital		 Örebro	 Sweden	 Örebro Universityhospital,, Örebro, Sweden	59.2757427000000021	15.2251034999999995	701 85
929	Intermountain Medical Center	 Murray	 Utah	 United States	Intermountain Medical Center, Murray, Utah, United States	40.6630626999999976	-111.8934687	84107
930	University of Calgary	 Calgary	 Alberta	 Canada	University of Calgary, Calgary, Alberta, Canada	51.0663073999999995	-114.133153399999998	T2N 4N1
931	Thompson Center for Autism & Neurodevelopmental Disorders	 Columbia	 Missouri	 United States	Thompson Center for Autism & Neurodevelopmental Disorders, Columbia, Missouri, United States	38.9563558999999984	-92.2863943999999918	6569
932	Thompson Center for Autism & Neurodevelopmental Disorders	 Columbia	 Missouri	 United States	Thompson Center for Autism & Neurodevelopmental Disorders, Columbia, Missouri, United States	38.9563558999999984	-92.2863943999999918	6569
933	Thompson Center for Autism & Neurodevelopmental Disorders	 Columbia	 Missouri	 United States	Thompson Center for Autism & Neurodevelopmental Disorders, Columbia, Missouri, United States	38.9563558999999984	-92.2863943999999918	6569
934	University of Missouri	 Columbia	 Missouri	 United States	University of Missouri, Columbia, Missouri, United States	38.9403807999999998	-92.327737500000012	65211
935	Vhembe health subdistrict	 Louis Trichardt	 Limpopo	 South Africa	Vhembe health subdistrict, Louis Trichardt, Limpopo, South Africa	-23.0462412999999984	29.9046562000000016	South Africa
936	Waterberg health subdistrict	 Mokopane	 Limpopo	 South Africa	Waterberg health subdistrict, Mokopane, Limpopo, South Africa	-24.1771774999999991	29.0018984999999994	South Africa
937			 Lund	 Sweden	,, Lund, Sweden	55.7046600999999981	13.1910073000000008	Sweden
938	Children's Hospital of Philadelphia	 Philadelphia	 Pennsylvania	 United States	Children's Hospital of Philadelphia, Philadelphia, Pennsylvania, United States	39.9488993000000008	-75.1938645999999977	19104
939	Ronald Reagan UCLA Medical Center	 Los Angeles	 California	 United States	Ronald Reagan UCLA Medical Center, Los Angeles, California, United States	34.0662795000000003	-118.446317800000003	90095
940	Ronald Reagan UCLA Medical Center	 Los Angeles	 California	 United States	Ronald Reagan UCLA Medical Center, Los Angeles, California, United States	34.0662795000000003	-118.446317800000003	90095
941	Children's Hospital of Colorado	 Denver	 Colorado	 United States	Children's Hospital of Colorado, Denver, Colorado, United States	39.7456892000000011	-104.967817600000004	80218
942	Boston Childrens Hospital	 Boston	 Massachusetts	 United States	Boston Childrens Hospital, Boston, Massachusetts, United States	42.3376671999999985	-71.1052863999999971	02115
943	Cohen Children's Medical Center	 New York	 New York	 United States	Cohen Children's Medical Center, New York, New York, United States	40.7542382999999973	-73.7087159999999955	11040
944	Morgan Stanley Children's Hospital of New York-Presbyterian	 New York	 New York	 United States	Morgan Stanley Children's Hospital of New York-Presbyterian, New York, New York, United States	40.8396716000000026	-73.9413797999999929	10032
945	Cincinnati Children's Hospital	 Cincinnati	 Ohio	 United States	Cincinnati Children's Hospital, Cincinnati, Ohio, United States	39.1408656999999991	-84.5022079000000019	45229
946	MUSC Children's Hospital	 Charleston	 South Carolina	 United States	MUSC Children's Hospital, Charleston, South Carolina, United States	32.7846856000000031	-79.9467901999999953	29425
947	MUSC Children's Hospital	 Charleston	 South Carolina	 United States	MUSC Children's Hospital, Charleston, South Carolina, United States	32.7846856000000031	-79.9467901999999953	29425
948	Baylor College of Medicine	 Houston	 Texas	 United States	Baylor College of Medicine, Houston, Texas, United States	29.7105289999999904	-95.3962409999999892	3411
949	University of Utah	 Salt Lake City	 Utah	 United States	University of Utah, Salt Lake City, Utah, United States	40.764936800000001	-111.842102100000005	84112
950	West Virginia University Hospitals	 Morgantown	 West Virginia	 United States	West Virginia University Hospitals, Morgantown, West Virginia, United States	39.6534507000000005	-79.9573463999999916	26506
951	Children's Hospital of Wisconsin	 Milwaukee	 Wisconsin	 United States	Children's Hospital of Wisconsin, Milwaukee, Wisconsin, United States	43.042397600000001	-88.024061599999996	53226
952	The Royal Women's Hospital		 Melbourne	 Australia	The Royal Women's Hospital,, Melbourne, Australia	-37.7986147000000017	144.954857900000007	3052
953	University of Alberta/WCCHN		 Edmonton	 Canada	University of Alberta/WCCHN,, Edmonton, Canada	53.5232189000000034	-113.526318599999996	T6G 2R3
954	McMaster University		 Hamilton	 Canada	McMaster University,, Hamilton, Canada	43.2608790000000027	-79.919225400000002	L8S 4L8
955	Sainte-Justine Hospital		 Montreal	 Canada	Sainte-Justine Hospital,, Montreal, Canada	45.5032185999999967	-73.6239156000000037	H3T 1C5
956	Mount Sinai Hospital		 Toronto	 Canada	Mount Sinai Hospital,, Toronto, Canada	43.6574633999999975	-79.3903693000000032	M5G 1X5
957	The Hospital for Sick Children		 Toronto	 Canada	The Hospital for Sick Children,, Toronto, Canada	43.6573064999999971	-79.3874268000000001	M5G 1X8
958	British Columbia Children's Hospital		 Vancouver	 Canada	British Columbia Children's Hospital,, Vancouver, Canada	49.2436290999999997	-123.125712500000006	V6H 3N1
959	UKB Universitätsklinikum BONN		 Bonn	 Germany	UKB Universitätsklinikum BONN,, Bonn, Germany	50.6972059999999871	7.10170489999999965	53127
960	Academic Medical Center - AMC		 Amsterdam	 Netherlands	Academic Medical Center - AMC,, Amsterdam, Netherlands	52.2946290000000005	4.95797299999999996	1105 AZ
961	Leiden University Medical Center - LUMC		 Leiden	 Netherlands	Leiden University Medical Center - LUMC,, Leiden, Netherlands	52.167709600000002	4.47747359999999972	2333 ZA
962	Erasmus Medical Center Rotterdam		 Rotterdam	 Netherlands	Erasmus Medical Center Rotterdam,, Rotterdam, Netherlands	51.9108847999999981	4.46785409999999938	3015 GD
963	University Medical Center Utrecht		 Utrecht	 Netherlands	University Medical Center Utrecht,, Utrecht, Netherlands	52.0862837000000027	5.17992499999999989	3584 CX
964	Belfast Health and Social Care Trust		 Belfast	 United Kingdom	Belfast Health and Social Care Trust,, Belfast, United Kingdom	54.6039298000000031	-5.94333430000000007	BT13 1FD
965	 Birmingham Women's Foundation Trust		 Birmingham	 United Kingdom	 Birmingham Women's Foundation Trust,, Birmingham, United Kingdom	52.453249900000003	-1.9427821999999999	B15 2TG
966	 Southern General Hospital		 Glasgow	 United Kingdom	 Southern General Hospital,, Glasgow, United Kingdom	55.8650779999999969	-4.336252	G51 4TE
967	Liverpool Women's Hospital		 Liverpool	 United Kingdom	Liverpool Women's Hospital,, Liverpool, United Kingdom	53.3985590999999999	-2.96008989999999983	L8 7SS
968	Chelsea and Westminster		 London	 United Kingdom	Chelsea and Westminster,, London, United Kingdom	51.4849533000000008	-0.182401000000000008	SW10 9NH
969	St George's University Hospital Foundation Trust		 London	 United Kingdom	St George's University Hospital Foundation Trust,, London, United Kingdom	51.4274010000000033	-0.174935599999999997	SW17 0RE
970	Huntsman Cancer Institute	 Salt Lake City	 Utah	 United States	Huntsman Cancer Institute, Salt Lake City, Utah, United States	40.7735959999999977	-111.835144	84112
971	University of Pittsburgh and Hemophilia Center Western PA	 Pittsburgh	 Pennsylvania	 United States	University of Pittsburgh and Hemophilia Center Western PA, Pittsburgh, Pennsylvania, United States	40.4342275999999998	-79.9534611999999925	4306
972	Cliniques universitaires Saint-Luc		 Brussels	 Belgium	Cliniques universitaires Saint-Luc,, Brussels, Belgium	50.8521388999999999	4.45214029999999994	1200
973	Nantes university hospital (CHU Nantes)		 Nantes	 France	Nantes university hospital (CHU Nantes),, Nantes, France	47.2120803999999978	-1.55438889999999996	44000
974	Center for Cardiovascular Research Berlin (CCR/Charité)		 Berlin	 Germany	Center for Cardiovascular Research Berlin (CCR/Charité),, Berlin, Germany	52.5290283999999872	13.3804721999999998	10115
975	University Medical Center Göttingen (UMG-GOE)		 Göttingen	 Germany	University Medical Center Göttingen (UMG-GOE),, Göttingen, Germany	51.5502920000000131	9.94282299999999886	37075
976	Athens University Medical School (NKUA)		 Athens	 Greece	Athens University Medical School (NKUA),, Athens, Greece	37.9681959999999989	23.7786870999999991	157 72
977	"Hospital ""Papa Giovanni XXIII"" (HPG23)"		 Bergamo	 Italy	"Hospital ""Papa Giovanni XXIII"" (HPG23)",, Bergamo, Italy	45.6870426999999992	9.63913849999999961	24127
978			 Wroclaw	 Poland	,, Wroclaw, Poland	51.1078851999999983	17.0385376000000015	51
979	Association for Research and Development of the Faculty of Medicine (AIDFM)		 Lisbon	 Portugal	Association for Research and Development of the Faculty of Medicine (AIDFM),, Lisbon, Portugal	38.7495471000000009	-9.16252390000000005	1649-028
980	University of Oxford - Division of Cardiovascular Medicine (UOXF)		 Oxford	 United Kingdom	University of Oxford - Division of Cardiovascular Medicine (UOXF),, Oxford, United Kingdom	51.7548164000000028	-1.25436679999999989	OX1 2JD
981	ProHealth	 Farmington	 Connecticut	 United States	ProHealth, Farmington, Connecticut, United States	41.7276037000000031	-72.799498799999995	2482
982	Texas Health Resources	 Arlington	 Texas	 United States	Texas Health Resources, Arlington, Texas, United States	32.7624587000000034	-97.103163600000002	76011
983	Veteran's Administration	 Dallas	 Texas	 United States	Veteran's Administration, Dallas, Texas, United States	32.6948712000000015	-96.7895048999999972	75216
984	Parkland Health and Hospital System	 Dallas	 Texas	 United States	Parkland Health and Hospital System, Dallas, Texas, United States	32.810705200000001	-96.8385385999999926	75235
985	The Hospital for Sick Children	 Toronto	 Ontario	 Canada	The Hospital for Sick Children, Toronto, Ontario, Canada	43.6573064999999971	-79.3874268000000001	M5G 1X8
986	Thompson Center for Autism & Neurodevelopmental Disorders	 Columbia	 Missouri	 United States	Thompson Center for Autism & Neurodevelopmental Disorders, Columbia, Missouri, United States	38.9563558999999984	-92.2863943999999918	6569
987	Lyndon B. Johnson General Hospital	 Houston	 Texas	 United States	Lyndon B. Johnson General Hospital, Houston, Texas, United States	29.811777199999991	-95.3130355999999921	1967
988	University of Colorado Anschutz Medical Campus	 Aurora	 Colorado	 United States	University of Colorado Anschutz Medical Campus, Aurora, Colorado, United States	39.7439563000000007	-104.837615	80045
989	Sibley Memorial Hospital	 Washington	 District of Columbia	 United States	Sibley Memorial Hospital, Washington, District of Columbia, United States	38.9366442000000035	-77.1084055000000035	20016
990	Johns Hopkins at Bayview Medical Center	 Baltimore	 Maryland	 United States	Johns Hopkins at Bayview Medical Center, Baltimore, Maryland, United States	39.2910745000000006	-76.5483931999999925	2735
991	Sidney Kimmel Comprehensive Cancer Center at Johns Hopkins	 Baltimore	 Maryland	 United States	Sidney Kimmel Comprehensive Cancer Center at Johns Hopkins, Baltimore, Maryland, United States	39.295855600000003	-76.5932626999999968	21231
992	Memorial Sloan Kettering	 New York	 New York	 United States	Memorial Sloan Kettering, New York, New York, United States	40.7640831999999875	-73.9560269999999917	6094
993	Johns Hopkins Hospital	 Baltimore	 Maryland	 United States	Johns Hopkins Hospital, Baltimore, Maryland, United States	39.2969464000000031	-76.5941753999999975	21287
994	Texas Children's Cancer and Hematology Centers	 Houston	 Texas	 United States	Texas Children's Cancer and Hematology Centers, Houston, Texas, United States	29.7069639999999993	-95.4022176999999942	77030
995	Seattle Children's Hospital	 Seattle	 Washington	 United States	Seattle Children's Hospital, Seattle, Washington, United States	47.6621517000000026	-122.280440799999994	3901
996	Seattle Children's Hospital	 Seattle	 Washington	 United States	Seattle Children's Hospital, Seattle, Washington, United States	47.6621517000000026	-122.280440799999994	3901
997	Columbia University Medical Center	 New York	 New York	 United States	Columbia University Medical Center, New York, New York, United States	40.8411210000000011	-73.9423639999999978	3722
998	University of Maryland	 Baltimore	 Maryland	 United States	University of Maryland, Baltimore, Maryland, United States	39.2892130999999978	-76.6249758999999955	1508
999	University of Pittsburgh	 Pittsburgh	 Pennsylvania	 United States	University of Pittsburgh, Pittsburgh, Pennsylvania, United States	40.4443533000000031	-79.960835000000003	15260
1000	Ann & Robert H. Lurie Children's Hospital of Chicago	 Chicago	 Illinois	 United States	Ann & Robert H. Lurie Children's Hospital of Chicago, Chicago, Illinois, United States	41.8962237000000002	-87.6218320999999918	60611
1001	Clifford Hospital		 Guangzhou	 China	Clifford Hospital,, Guangzhou, China	22.9694809999999983	113.324619999999996	511495
1002	South London and the Maudsley NHS Foundation Trust		 London	 United Kingdom	South London and the Maudsley NHS Foundation Trust,, London, United Kingdom	51.4682906999999972	-0.0909382999999999997	SE5 8AZ
1003	University of Washington	 Seattle	 Washington	 United States	University of Washington, Seattle, Washington, United States	47.6553350999999878	-122.303519899999998	98195
1004	Guangdong General Hospital	 Guangzhou	 Guangdong	 China	Guangdong General Hospital, Guangzhou, Guangdong, China	23.1256720000000016	113.287200999999996	510080
1005	Northwestern University	 Chicago	 Illinois	 United States	Northwestern University, Chicago, Illinois, United States	41.894582800000002	-87.6231705999999946	2834
1006	University of Pittsburgh-Magee Womens Hospital	 Pittsburgh	 Pennsylvania	 United States	University of Pittsburgh-Magee Womens Hospital, Pittsburgh, Pennsylvania, United States	40.4443533000000031	-79.960835000000003	15260
1007	University of Texas Medical Branch	 Galveston	 Texas	 United States	University of Texas Medical Branch, Galveston, Texas, United States	29.3110199000000016	-94.7777698000000015	77555
1008	University of Pittsburgh	 Pittsburgh	 Pennsylvania	 United States	University of Pittsburgh, Pittsburgh, Pennsylvania, United States	40.4443533000000031	-79.960835000000003	15260
1009	Leiden University Medical Center		 Leiden	 Netherlands	Leiden University Medical Center,, Leiden, Netherlands	52.167709600000002	4.47747359999999972	2333 ZA
1010	Maison de Santé Pluri professionnelle Les allées	 Corbeil-Essonnes	 Essonne	 France	Maison de Santé Pluri professionnelle Les allées, Corbeil-Essonnes, Essonne, France	48.6103509999999872	2.47608300000000003	91100
1011	Cabinet Pédiatrique Saint-Germain	 Saint-Germain-lès-Arpajon	 Essonne	 France	Cabinet Pédiatrique Saint-Germain, Saint-Germain-lès-Arpajon, Essonne, France	48.6068041999999991	2.24929790000000018	91180
1012	District of Butha-Buthe		 Butha-Buthe	 Lesotho	District of Butha-Buthe,, Butha-Buthe, Lesotho	-28.8015609999999995	28.5331037999999992	Lesotho
1013	District of Mokhotlong		 Mokhotlong	 Lesotho	District of Mokhotlong,, Mokhotlong, Lesotho	-29.2875556999999986	29.0605388999999903	Lesotho
1014	District of Mokhotlong		 Mokhotlong	 Lesotho	District of Mokhotlong,, Mokhotlong, Lesotho	-29.2875556999999986	29.0605388999999903	Lesotho
1015	District of Mokhotlong		 Mokhotlong	 Lesotho	District of Mokhotlong,, Mokhotlong, Lesotho	-29.2875556999999986	29.0605388999999903	Lesotho
1016	Thomas Jefferson University	 Philadelphia	 Pennsylvania	 United States	Thomas Jefferson University, Philadelphia, Pennsylvania, United States	40.018720799999997	-75.192288099999999	5497
1017	Glasgow Royal Infirmary		 Glasgow	 United Kingdom	Glasgow Royal Infirmary,, Glasgow, United Kingdom	55.8637562999999986	-4.23564900000000044	G4 0SF
1018	West China Second University Hospital	 Chengdu	 Sichuan	 China	West China Second University Hospital, Chengdu, Sichuan, China	30.5857589999999995	104.14846	610101
1019	 Barking and Havering NHS Trust		 London	 United Kingdom	 Barking and Havering NHS Trust,, London, United Kingdom	51.5177156999999966	0.171921099999999993	RM13 8EU
1020	Tatarstan Cancer Cente	 Kazan	 Tatarstan	 Russian Federation	Tatarstan Cancer Cente, Kazan, Tatarstan, Russian Federation	55.8304307000000009	49.0660806000000065	Russia
1021	UO Neonatal Intensive Care Unit and Neonatology		 Ferrara	 Italy	UO Neonatal Intensive Care Unit and Neonatology,, Ferrara, Italy	44.838123699999997	11.6197870000000005	Italy
1022	UO Neonatal Intensive Care Unit and Neonatology		 Ferrara	 Italy	UO Neonatal Intensive Care Unit and Neonatology,, Ferrara, Italy	44.838123699999997	11.6197870000000005	Italy
1023	 University Park		 Pennsylvania	 United States	 University Park,, Pennsylvania, United States	40.8147955000000024	-77.86531260000001	United States
1024	Walter Reed National Military Medical Center	 Bethesda	 Maryland	 United States	Walter Reed National Military Medical Center, Bethesda, Maryland, United States	38.9996037000000015	-77.0964445999999981	20814
1025	The Hospital For Sick Children		 Toronto	 Canada	The Hospital For Sick Children,, Toronto, Canada	43.6573064999999971	-79.3874268000000001	M5G 1X8
1026	Tulane University School of Medicine	 New Orleans	 Louisiana	 United States	Tulane University School of Medicine, New Orleans, Louisiana, United States	29.9548997999999997	-90.0769497000000001	70112
1029	University of Malaya	 Kuala Lumpur	 Wilayah Persekutuan Kuala Lumpur	 Malaysia	University of Malaya, Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur, Malaysia	3.12010109999999985	101.654399299999994	50603
1030	University Hospital of Larissa		 Larissa	 Greece	University Hospital of Larissa,, Larissa, Greece	39.6149715000000029	22.3873013999999984	Greece
1031	University of Calgary	 Calgary	 Alberta	 Canada	University of Calgary, Calgary, Alberta, Canada	51.0663073999999995	-114.133153399999998	T2N 4N1
1032	Amhara Public Health Institute	 Bahir Dar	 Amhara	 Ethiopia	Amhara Public Health Institute, Bahir Dar, Amhara, Ethiopia	11.6061279000000006	37.3703094999999976	Ethiopia
1033	Amhara Public Health Institute	 Bahir Dar	 Amhara	 Ethiopia	Amhara Public Health Institute, Bahir Dar, Amhara, Ethiopia	11.6061279000000006	37.3703094999999976	Ethiopia
1034	University of Gondar		 Gondar	 Ethiopia	University of Gondar,, Gondar, Ethiopia	12.5894130000000004	37.4442386999999997	Ethiopia
1035	McGill University	 Montreal	 Quebec	 Canada	McGill University, Montreal, Quebec, Canada	45.5047846999999877	-73.5771510999999947	H3A 0G4
1036	Lahey Hospital & Medical Center	 Boston	 Massachusetts	 United States	Lahey Hospital & Medical Center, Boston, Massachusetts, United States	42.484232200000001	-71.2040719999999965	01805
1037	Tufts Medical Center	 Boston	 Massachusetts	 United States	Tufts Medical Center, Boston, Massachusetts, United States	42.3496620000000021	-71.0639170000000036	02116
1038	St Vincent's Hospital		 Dublin	 Ireland	St Vincent's Hospital,, Dublin, Ireland	53.3169996999999967	-6.21289010000000097	D04 T6F4
1039	Aberdeen Royal Infirmary		 Aberdeen	 United Kingdom	Aberdeen Royal Infirmary,, Aberdeen, United Kingdom	57.1546175999999875	-2.13598759999999999	AB25 2ZN
1040	Royal Victoria Hospital		 Belfast	 United Kingdom	Royal Victoria Hospital,, Belfast, United Kingdom	54.5928189999999987	-5.95559290000000097	BT12 6BA
1041	Queen Elizabeth Hospital		 Birmingham	 United Kingdom	Queen Elizabeth Hospital,, Birmingham, United Kingdom	52.4511253000000011	-1.94296770000000008	B15 2TH
1042	Bristol Royal Infirmary		 Bristol	 United Kingdom	Bristol Royal Infirmary,, Bristol, United Kingdom	51.4583946999999995	-2.59661769999999992	BS2 8HW
1043	Addenbrooke's Hospital		 Cambridge	 United Kingdom	Addenbrooke's Hospital,, Cambridge, United Kingdom	52.1751266999999999	0.140661599999999998	CB2 0QQ
1044	Ninewells Hospital		 Dundee	 United Kingdom	Ninewells Hospital,, Dundee, United Kingdom	56.463479300000003	-3.03692330000000021	DD2 1SY
1045	Western General Hospital		 Edinburgh	 United Kingdom	Western General Hospital,, Edinburgh, United Kingdom	55.9623265999999973	-3.23508510000000005	EH4 2XU
1046	Queen Elizabeth University Hospital		 Glasgow	 United Kingdom	Queen Elizabeth University Hospital,, Glasgow, United Kingdom	55.8624201000000014	-4.34043389999999984	G51 4TF
1047	Leicester Royal Infirmary		 Leicester	 United Kingdom	Leicester Royal Infirmary,, Leicester, United Kingdom	52.6283183999999977	-1.13537719999999998	LE1 5WW
1048	Royal Liverpool Hospital		 Liverpool	 United Kingdom	Royal Liverpool Hospital,, Liverpool, United Kingdom	53.410021399999998	-2.96701680000000012	L7 8XW
1049	Llandough University Hospital		 Llandough	 United Kingdom	Llandough University Hospital,, Llandough, United Kingdom	51.448927900000001	-3.2028376999999999	CF64 2XX
1050	Guy's and St Thomas' Hospital		 London	 United Kingdom	Guy's and St Thomas' Hospital,, London, United Kingdom	51.4988750999999993	-0.118164699999999998	SE1 7EH
1051	Manchester Royal Infirmary		 Manchester	 United Kingdom	Manchester Royal Infirmary,, Manchester, United Kingdom	53.4628790000000009	-2.22611880000000006	M13 9WL
1052	James Cook University Hospital		 Middlesbrough	 United Kingdom	James Cook University Hospital,, Middlesbrough, United Kingdom	54.551210300000001	-1.21480440000000001	TS4 3BW
1053	Freeman Hospital		 Newcastle Upon Tyne	 United Kingdom	Freeman Hospital,, Newcastle Upon Tyne, United Kingdom	55.003028399999998	-1.59294559999999996	NE7 7DN
1054	Norfolk and Norwich University Hospital		 Norwich	 United Kingdom	Norfolk and Norwich University Hospital,, Norwich, United Kingdom	52.6180858000000029	1.22106690000000007	NR4 7UY
1055	Nottingham City Hospital		 Nottingham	 United Kingdom	Nottingham City Hospital,, Nottingham, United Kingdom	52.9902530000000027	-1.15417590000000003	NG5 1PB
1056	Nuffield Orthopaedic Centre		 Oxford	 United Kingdom	Nuffield Orthopaedic Centre,, Oxford, United Kingdom	51.7541524999999965	-1.20919310000000002	OX3 7HE
1057	Queen Alexandria Hospital		 Portsmouth	 United Kingdom	Queen Alexandria Hospital,, Portsmouth, United Kingdom	50.8499829999999875	-1.0700809	PO6 3LY
1058	Northern General Hospital		 Sheffield	 United Kingdom	Northern General Hospital,, Sheffield, United Kingdom	53.4093236999999874	-1.45941879999999991	S5 7AU
1059	University Hospital Southampton		 Southampton	 United Kingdom	University Hospital Southampton,, Southampton, United Kingdom	50.9336024999999992	-1.43371760000000004	SO16 6YD
1060	Royal National Orthopaedic Hospital		 Stanmore	 United Kingdom	Royal National Orthopaedic Hospital,, Stanmore, United Kingdom	51.6315570000000008	-0.310002	HA7 4LP
1061	Haywood Community Hospital		 Stoke-on-Trent	 United Kingdom	Haywood Community Hospital,, Stoke-on-Trent, United Kingdom	53.0572416999999987	-2.19153110000000018	ST6 7AG
9	China site 0131	 Zhengzhou	 Henan	 China	China site 0131, Zhengzhou, Henan, China	34.7466110000000015	113.625327999999996	China
10	China site 0111	 Wuhan	 Hubei	 China	China site 0111, Wuhan, Hubei, China	30.5928490000000011	114.305538999999996	China
11	China site 0112	 Wuhan	 Hubei	 China	China site 0112, Wuhan, Hubei, China	30.5928490000000011	114.305538999999996	China
12	China site 0114	 Wuhan	 Hubei	 China	China site 0114, Wuhan, Hubei, China	30.5928490000000011	114.305538999999996	China
13	China site 0142	 Yichang	 Hubei	 China	China site 0142, Yichang, Hubei, China	30.6919660000000007	111.286471000000006	China
14	China site 0113	 Changsha	 Hunan	 China	China site 0113, Changsha, Hunan, China	28.2282089999999997	112.938813999999994	China
15	China site 0122	 Nanjing	 Jiangsu	 China	China site 0122, Nanjing, Jiangsu, China	32.0602549999999979	118.796876999999995	China
16	China site 0118	 Nanjing	 Jiangsu	 China	China site 0118, Nanjing, Jiangsu, China	32.0602549999999979	118.796876999999995	China
17	China site 0124	 Suzhou	 Jiangsu	 China	China site 0124, Suzhou, Jiangsu, China	31.2989740000000012	120.585289000000003	China
18	China site 0125	 Wuxi	 Jiangsu	 China	China site 0125, Wuxi, Jiangsu, China	31.4911689999999993	120.311909999999997	China
19	China site 0126	 Xuzhou	 Jiangsu	 China	China site 0126, Xuzhou, Jiangsu, China	34.2057679999999991	117.284124000000006	China
20	China site 0119	 Yangzhou	 Jiangsu	 China	China site 0119, Yangzhou, Jiangsu, China	32.3942089999999965	119.412938999999994	China
21	China site 0116	 Changchun	 Jilin	 China	China site 0116, Changchun, Jilin, China	43.8170709999999985	125.323543999999998	China
22	China site 0117	 Changchun	 Jilin	 China	China site 0117, Changchun, Jilin, China	43.8170709999999985	125.323543999999998	China
1062	Wishaw General Hospital		 Wishaw	 United Kingdom	Wishaw General Hospital,, Wishaw, United Kingdom	55.7737261999999987	-3.94199270000000013	ML2 0DP
1063	Shirley Ryan AbilityLab	 Chicago	 Illinois	 United States	Shirley Ryan AbilityLab, Chicago, Illinois, United States	41.8938876000000135	-87.6182420999999891	60611
1064	The University of Texas at Dallas Center for BrainHealth	 Dallas	 Texas	 United States	The University of Texas at Dallas Center for BrainHealth, Dallas, Texas, United States	32.8247300000000024	-96.8475912999999906	75235
1065	Imperial Clinical Research Facility		 London	 United Kingdom	Imperial Clinical Research Facility,, London, United Kingdom	51.5168249999999972	-0.234305900000000011	W12 0HS
1066	University of Limerick		 Limerick	 Ireland	University of Limerick,, Limerick, Ireland	52.6735881000000035	-8.57243719999999954	V94 T9PX
1067	University of Limerick		 Limerick	 Ireland	University of Limerick,, Limerick, Ireland	52.6735881000000035	-8.57243719999999954	V94 T9PX
1068	University of Limerick		 Limerick	 Ireland	University of Limerick,, Limerick, Ireland	52.6735881000000035	-8.57243719999999954	V94 T9PX
1069	the Faculty of Dentistry		 Hong Kong	 Hong Kong	the Faculty of Dentistry,, Hong Kong, Hong Kong	22.2861569999999993	114.144067199999995	Hong Kong
1070	Hospital Sao Luiz		 São Paulo	 Brazil	Hospital Sao Luiz,, São Paulo, Brazil	-23.5909399999999998	-46.7037290999999968	05605-050
1071	University of Sherbrooke	 Sherbrooke	 Quebec	 Canada	University of Sherbrooke, Sherbrooke, Quebec, Canada	45.3780055999999874	-71.929388000000003	J1K 0A5
1072	Helsinki University Hospital		 Helsinki	 Finland	Helsinki University Hospital,, Helsinki, Finland	60.1907179999999968	24.9038728999999996	00290
1073	King Abdulaziz University		 Jeddah	 Saudi Arabia	King Abdulaziz University,, Jeddah, Saudi Arabia	21.4941020000000016	39.2326169999999976	21589
1074	Medical College of Wisconsin	 Milwaukee	 Wisconsin	 United States	Medical College of Wisconsin, Milwaukee, Wisconsin, United States	43.0435773999999967	-88.0217863000000023	53226
1075	Institute for Clinical and Experimental Medicine		 Prague 4	 Czechia	Institute for Clinical and Experimental Medicine,, Prague 4, Czechia	50.0227343000000033	14.4627918999999991	140 21
1076	Daniela Poli		 Firenze	 Italy	Daniela Poli,, Firenze, Italy	43.7695604000000031	11.2558135999999998	Italy
1077	Liverpool John Moores University	 Liverpool	 Merseyside	 United Kingdom	Liverpool John Moores University, Liverpool, Merseyside, United Kingdom	53.4110755999999967	-2.9881956999999999	L2 2ER
1078	Texas Children's Hospital	 Houston	 Texas	 United States	Texas Children's Hospital, Houston, Texas, United States	29.7080662000000011	-95.4015720999999957	77030
1079	Royal Children's Hospital	 Melbourne	 Victoria	 Australia	Royal Children's Hospital, Melbourne, Victoria, Australia	-37.7936993000000001	144.949084599999992	3052
1080	Harapan Kita Children and Women's Hospital		 Jakarta	 Indonesia	Harapan Kita Children and Women's Hospital,, Jakarta, Indonesia	-6.1850720999999993	106.797942500000005	11420
1081	Schneider Children's medical center		 Petach Tikvah	 Israel	Schneider Children's medical center,, Petach Tikvah, Israel	32.0879417000000018	34.8678169000000011	Israel
1082	Institut Jantung Negara		 Kuala Lumpur	 Malaysia	Institut Jantung Negara,, Kuala Lumpur, Malaysia	3.16999930000000019	101.7094247	50400
1083	Alder Hey Hospital		 Liverpool	 United Kingdom	Alder Hey Hospital,, Liverpool, United Kingdom	53.4176598000000027	-2.89587700000000003	L14 5NG
1084	Righospitalet		 Copenhagen	 Denmark	Righospitalet,, Copenhagen, Denmark	55.6959810000000033	12.5666080000000004	2100
1085	MUHC	 Montreal	 Quebec	 Canada	MUHC, Montreal, Quebec, Canada	45.4728824999999972	-73.6017702999999983	H4A 3J1
1086	Foothills Medical Centre	 Calgary	 Alberta	 Canada	Foothills Medical Centre, Calgary, Alberta, Canada	51.0644909999999967	-114.134061000000003	T2N 2T9
121	LTD Gormedi		 Gori	 Georgia	LTD Gormedi,, Gori, Georgia	0	0	
177					,,,	0	0	
299	Akademiska sjukhuset		 Uppsala	 Sweden	Akademiska sjukhuset,, Uppsala, Sweden	59.8484837000000027	17.6407363000000004	751 85
301	Radboudumc	 Nijmegen	 Gelderland	 Netherlands	Radboudumc, Nijmegen, Gelderland, Netherlands	51.8235728000000009	5.86118119999999987	6525 GA
400					,,,	0	0	
449	Galway Clinic		 Galway	 Ireland	Galway Clinic,, Galway, Ireland	53.2822543999999994	-8.97404169999999901	Ireland
787					,,,	0	0	
917					,,,	0	0	
922					,,,	0	0	
1027					,,,	0	0	
1028	ISGlobal		 Barcelona	 Spain	ISGlobal,, Barcelona, Spain	41.385378799999998	2.19405170000000016	08003
1126					,,,	0	0	
1127					,,,	0	0	
1189	 Stony Brook		 New York	 United States	 Stony Brook,, New York, United States	40.9256537999999992	-73.1409428999999989	United States
1087	Guangdong General Hospital	 Guangzhou	 Guangdong	 China	Guangdong General Hospital, Guangzhou, Guangdong, China	23.1256720000000016	113.287200999999996	510080
1564	COSAM Lota	 Lota	 Concepción	 Chile	COSAM Lota, Lota, Concepción, Chile	-37.0907198000000022	-73.1556307999999973	Chile
1091	Northwestern University	 Chicago	 Illinois	 United States	Northwestern University, Chicago, Illinois, United States	41.894582800000002	-87.6231705999999946	2834
1092	Massachusetts General Hospital	 Boston	 Massachusetts	 United States	Massachusetts General Hospital, Boston, Massachusetts, United States	42.3631541999999968	-71.0688334000000026	02114
1093	Cleveland Clinic	 Cleveland	 Ohio	 United States	Cleveland Clinic, Cleveland, Ohio, United States	41.4619963999999968	-81.6970869999999962	1900
1094	Univeristy of Oklahoma	 Oklahoma City	 Oklahoma	 United States	Univeristy of Oklahoma, Oklahoma City, Oklahoma, United States	35.4955746999999988	-97.541068199999998	73106
1095	Univeristy of Oklahoma	 Oklahoma City	 Oklahoma	 United States	Univeristy of Oklahoma, Oklahoma City, Oklahoma, United States	35.4955746999999988	-97.541068199999998	73106
1096	Univeristy of Oklahoma	 Oklahoma City	 Oklahoma	 United States	Univeristy of Oklahoma, Oklahoma City, Oklahoma, United States	35.4955746999999988	-97.541068199999998	73106
1097	Univeristy of Oklahoma	 Oklahoma City	 Oklahoma	 United States	Univeristy of Oklahoma, Oklahoma City, Oklahoma, United States	35.4955746999999988	-97.541068199999998	73106
1098	Children's Healthcare of Atlanta	 Atlanta	 Georgia	 United States	Children's Healthcare of Atlanta, Atlanta, Georgia, United States	33.7937282999999979	-84.3197717999999981	30322
1099	Children's Healthcare of Atlanta	 Atlanta	 Georgia	 United States	Children's Healthcare of Atlanta, Atlanta, Georgia, United States	33.7937282999999979	-84.3197717999999981	30322
1100	Office	 Shreveport	 Louisiana	 United States	Office, Shreveport, Louisiana, United States	32.4973075999999992	-93.7519486999999998	71101
1101	Office	 Shreveport	 Louisiana	 United States	Office, Shreveport, Louisiana, United States	32.4973075999999992	-93.7519486999999998	71101
1102	Foothills Medical Centre	 Calgary	 Alberta	 Canada	Foothills Medical Centre, Calgary, Alberta, Canada	51.0644909999999967	-114.134061000000003	T2N 2T9
1103	Dongguan Fifth People's Hospital (Taiping Hospital)	 Dongguan	 Guang Dong	 China	Dongguan Fifth People's Hospital (Taiping Hospital), Dongguan, Guang Dong, China	23.0206729999999986	113.751799000000005	China
1104	Guangzhou General Hospital of Guangzhou Military Region	 Guangzhou	 Guang Dong	 China	Guangzhou General Hospital of Guangzhou Military Region, Guangzhou, Guang Dong, China	23.1403590000000001	113.256513999999996	510016
1105	Guangzhou General Hospital of Guangzhou Military Region	 Guangzhou	 Guang Dong	 China	Guangzhou General Hospital of Guangzhou Military Region, Guangzhou, Guang Dong, China	23.1403590000000001	113.256513999999996	510016
1106	Shenzhen Luohu People's hospitial	 Shenzhen	 Guang Dong	 China	Shenzhen Luohu People's hospitial, Shenzhen, Guang Dong, China	22.5559609999999999	114.128759000000002	518000
1107	Shenzhen People's Hospital	 Shenzhen	 Guang Dong	 China	Shenzhen People's Hospital, Shenzhen, Guang Dong, China	22.5559609999999999	114.128759000000002	518000
1108	Shenzhen People's Hospital	 Shenzhen	 Guang Dong	 China	Shenzhen People's Hospital, Shenzhen, Guang Dong, China	22.5559609999999999	114.128759000000002	518000
1109	Peking University Shenzhen Hospital	 Shenzhen	 Guang Dong	 China	Peking University Shenzhen Hospital, Shenzhen, Guang Dong, China	22.5558669999999992	114.049178999999995	518036
1110	Shenzhen Sixth People's Hospital (Nanshan Hospital)	 ShenZhen	 Guang Dong	 China	Shenzhen Sixth People's Hospital (Nanshan Hospital), ShenZhen, Guang Dong, China	22.5314340000000009	113.924223999999995	518054
1111	Shenzhen Sixth People's Hospital (Nanshan Hospital)	 ShenZhen	 Guang Dong	 China	Shenzhen Sixth People's Hospital (Nanshan Hospital), ShenZhen, Guang Dong, China	22.5314340000000009	113.924223999999995	518054
1112	Shenzhen Longgang Central Hospital	 Shenzhen	 Guang Dong	 China	Shenzhen Longgang Central Hospital, Shenzhen, Guang Dong, China	22.7359079999999985	114.282752000000002	Shenzhen
1113	Shenzhen hospital of southern medicial university	 Shenzhen	 Guang Dong	 China	Shenzhen hospital of southern medicial university, Shenzhen, Guang Dong, China	22.5774317999999994	113.853110799999996	China
1114	Shenzhen Second People's Hospital		 Shenzhen	 China	Shenzhen Second People's Hospital,, Shenzhen, China	22.5565989999999985	114.086145000000002	518029
1115	Kaiser Permanente Orange County - Anaheim	 Anaheim	 California	 United States	Kaiser Permanente Orange County - Anaheim, Anaheim, California, United States	33.8518247000000017	-117.844651200000001	92806
1116	Kaiser Permanente Orange County-Irvine Medical Center	 Irvine	 California	 United States	Kaiser Permanente Orange County-Irvine Medical Center, Irvine, California, United States	33.6572097000000028	-117.7737348	92618
1117	University of California Irvine Medical Center	 Orange	 California	 United States	University of California Irvine Medical Center, Orange, California, United States	33.7876562000000007	-117.889422300000007	3201
1118	University of Limerick	 Limerick	 Munster	 Ireland	University of Limerick, Limerick, Munster, Ireland	52.6725819999999985	-8.57676000000000016	Ireland
1119	The third affiliated hospital of Zhejiang CMU	 Hangzhou	 Zhejiang	 China	The third affiliated hospital of Zhejiang CMU, Hangzhou, Zhejiang, China	30.2577590000000001	120.184141400000001	310009
1120	 Oxford University Hospitals Trust		 Oxford	 United Kingdom	 Oxford University Hospitals Trust,, Oxford, United Kingdom	51.7642712999999972	-1.22055960000000008	OX3 9DU
1121	Chua Chu Kang Polyclinic		 Singapore	 Singapore	Chua Chu Kang Polyclinic,, Singapore, Singapore	1.38236000000000003	103.750829899999999	688846
1122	Keck School of Medicine of the University of Southern California	 Los Angeles	 California	 United States	Keck School of Medicine of the University of Southern California, Los Angeles, California, United States	34.0603726999999878	-118.205954000000006	90089
1123	UC Davis Medical Center	 Sacramento	 California	 United States	UC Davis Medical Center, Sacramento, California, United States	38.5546859999999967	-121.454639	95817
1124	Temple University	 Philadelphia	 Pennsylvania	 United States	Temple University, Philadelphia, Pennsylvania, United States	39.9811935000000034	-75.1553511999999984	19122
1125	University of Wisconsin	 Madison	 Wisconsin	 United States	University of Wisconsin, Madison, Wisconsin, United States	43.076591999999998	-89.4124874999999975	53706
1128	Taipei Medical University-Shuang Ho Hospital		 New Taipei City	 Taiwan	Taipei Medical University-Shuang Ho Hospital,, New Taipei City, Taiwan	24.9926990000000018	121.493526000000003	235
1129	The Ohio State University Urogynecology Clinic	 Columbus	 Ohio	 United States	The Ohio State University Urogynecology Clinic, Columbus, Ohio, United States	39.9962750999999983	-83.0160498999999987	1267
1130	The Ohio State University Urogynecology Clinic	 Columbus	 Ohio	 United States	The Ohio State University Urogynecology Clinic, Columbus, Ohio, United States	39.9962750999999983	-83.0160498999999987	1267
1131	Matthew Tracey	 Toronto	 Ontario	 Canada	Matthew Tracey, Toronto, Ontario, Canada	43.6532259999999965	-79.3831842999999964	Canada
1132	AIDS Committee of Toronto (ACT)	 Toronto	 Ontario	 Canada	AIDS Committee of Toronto (ACT), Toronto, Ontario, Canada	43.6643369000000021	-79.3840464999999966	M4Y 1Y5
1133	St. Michael's Hospital Neurobehavioral Research Unit	 Toronto	 Ontario	 Canada	St. Michael's Hospital Neurobehavioral Research Unit, Toronto, Ontario, Canada	43.6537210999999985	-79.3778066999999936	M5B 1W8
1134	St. Michael's Hospital Neurobehavioral Research Unit	 Toronto	 Ontario	 Canada	St. Michael's Hospital Neurobehavioral Research Unit, Toronto, Ontario, Canada	43.6537210999999985	-79.3778066999999936	M5B 1W8
1135	University of Colorado Hospital	 Aurora	 Colorado	 United States	University of Colorado Hospital, Aurora, Colorado, United States	39.7424833999999976	-104.841915	80045
1136	Memorial Hospital	 Colorado Springs	 Colorado	 United States	Memorial Hospital, Colorado Springs, Colorado, United States	38.8397641999999976	-104.799409199999999	80909
1137	Denver Health	 Denver	 Colorado	 United States	Denver Health, Denver, Colorado, United States	39.7274491000000012	-104.991107799999995	80204
1138	Foothills Medical Centre	 Calgary	 Alberta	 Canada	Foothills Medical Centre, Calgary, Alberta, Canada	51.0644909999999967	-114.134061000000003	T2N 2T9
1139	Hospital Santa Casa de São José dos Campos	 São José Dos Campos	 São Paulo	 Brazil	Hospital Santa Casa de São José dos Campos, São José Dos Campos, São Paulo, Brazil	-23.1867060000000009	-45.8825179999999975	12210-110
1140	Birmingham VA Medical Center	 Birmingham	 Alabama	 United States	Birmingham VA Medical Center, Birmingham, Alabama, United States	33.5041206000000003	-86.8015548999999993	1927
1141	Southern Arizona VA Health Care System	 Tucson	 Arizona	 United States	Southern Arizona VA Health Care System, Tucson, Arizona, United States	32.179834900000003	-110.965686599999998	0001
1142	VA Long Beach Healthcare	 Long Beach	 California	 United States	VA Long Beach Healthcare, Long Beach, California, United States	33.7775689999999997	-118.118942799999999	90822
1143	San Francisco VA	 San Francisco	 California	 United States	San Francisco VA, San Francisco, California, United States	37.7824978000000016	-122.505346200000005	94121
1144	VA Eastern Colorado Health Care System	 Denver	 Colorado	 United States	VA Eastern Colorado Health Care System, Denver, Colorado, United States	39.731423300000003	-104.936261099999996	80220
1145	Atlanta VA Medical Center	 Atlanta	 Georgia	 United States	Atlanta VA Medical Center, Atlanta, Georgia, United States	33.8017072000000027	-84.311715300000003	30033
1146	Jesse Brown VAMC	 Chicago	 Illinois	 United States	Jesse Brown VAMC, Chicago, Illinois, United States	41.8696022999999968	-87.6768275999999958	60612
1147	VA Louis Stokes Cleveland VA Medical Center	 Cleveland	 Ohio	 United States	VA Louis Stokes Cleveland VA Medical Center, Cleveland, Ohio, United States	41.5132714000000007	-81.6136972999999983	44106
1148	Oklahoma City VA Health Care System	 Oklahoma City	 Oklahoma	 United States	Oklahoma City VA Health Care System, Oklahoma City, Oklahoma, United States	35.4842089999999999	-97.4957399999999978	73104
1149	VA Pittsburgh Healthcare System	 Pittsburgh	 Pennsylvania	 United States	VA Pittsburgh Healthcare System, Pittsburgh, Pennsylvania, United States	40.4469362999999973	-79.9619615000000152	15213
1150	Ralph H. Johnson VA Medical Center	 Charleston	 South Carolina	 United States	Ralph H. Johnson VA Medical Center, Charleston, South Carolina, United States	32.7840357999999981	-79.9539071000000092	5703
1151	Dallas VA Medical Center	 Dallas	 Texas	 United States	Dallas VA Medical Center, Dallas, Texas, United States	32.6948712000000015	-96.7895048999999972	75216
1152	San Antonio VA	 San Antonio	 Texas	 United States	San Antonio VA, San Antonio, Texas, United States	29.5068154999999983	-98.5796325999999965	4404
1153	Astley Ainslie Hospital	 Edinburgh	 Edinburgh City	 United Kingdom	Astley Ainslie Hospital, Edinburgh, Edinburgh City, United Kingdom	55.929615499999997	-3.19797039999999999	EH9 2HL
1154	Ocean Clinic		 Marbella	 Spain	Ocean Clinic,, Marbella, Spain	36.5091200000000029	-4.88541699999999857	29601
1155	Cleveland Clinic	 Cleveland	 Ohio	 United States	Cleveland Clinic, Cleveland, Ohio, United States	41.4619963999999968	-81.6970869999999962	1900
1156	Boston Children's Hospital	 Boston	 Massachusetts	 United States	Boston Children's Hospital, Boston, Massachusetts, United States	42.3376671999999985	-71.1052863999999971	02115
1157	University of Wisconsin-Madison	 Madison	 Wisconsin	 United States	University of Wisconsin-Madison, Madison, Wisconsin, United States	43.076591999999998	-89.4124874999999975	53706
1158	West Virginia University	 Morgantown	 West Virginia	 United States	West Virginia University, Morgantown, West Virginia, United States	39.6361395999999999	-79.9559357999999918	26506
1159	The University of Texas Health Science Center at Houston	 Houston	 Texas	 United States	The University of Texas Health Science Center at Houston, Houston, Texas, United States	29.7034179000000016	-95.403045199999994	77030
1160	The Ohio State University	 Columbus	 Ohio	 United States	The Ohio State University, Columbus, Ohio, United States	40.014190499999998	-83.0309142999999921	43210
1161	IRCCS Istituto Ortopedico Galeazzi	 Milan	 MI	 Italy	IRCCS Istituto Ortopedico Galeazzi, Milan, MI, Italy	45.5231619999999992	9.1740049999999993	20161
1162	Hospital Galdakao-Usansolo	 Galdakao	 Vizcaya	 Spain	Hospital Galdakao-Usansolo, Galdakao, Vizcaya, Spain	43.223446899999999	-2.81792670000000012	48960
1163	Children's Hospital and Research Center at Oakland	 Oakland	 California	 United States	Children's Hospital and Research Center at Oakland, Oakland, California, United States	37.8368996000000024	-122.267145499999998	1809
1164	Howard University	 Washington	 District of Columbia	 United States	Howard University, Washington, District of Columbia, United States	38.9226843000000002	-77.0194376999999974	20059
1165	Ann & Robert H Lurie Children's Hospital of Chicago	 Chicago	 Illinois	 United States	Ann & Robert H Lurie Children's Hospital of Chicago, Chicago, Illinois, United States	41.8962237000000002	-87.6218320999999918	60611
1166	The Washington University	 Saint Louis	 Missouri	 United States	The Washington University, Saint Louis, Missouri, United States	38.6487894999999995	-90.3107962000000128	63130
1167	Nationwide Children's Hospital	 Columbus	 Ohio	 United States	Nationwide Children's Hospital, Columbus, Ohio, United States	39.9531269999999878	-82.9794890000000009	43205
1168	Children's Hospital of Philadelphia	 Philadelphia	 Pennsylvania	 United States	Children's Hospital of Philadelphia, Philadelphia, Pennsylvania, United States	39.9488993000000008	-75.1938645999999977	19104
1169	Vanderbilt University Medical Center	 Nashville	 Tennessee	 United States	Vanderbilt University Medical Center, Nashville, Tennessee, United States	36.1417373000000026	-86.8021305999999981	37232
1170	Baylor College of Medicine	 Houston	 Texas	 United States	Baylor College of Medicine, Houston, Texas, United States	29.7105289999999904	-95.3962409999999892	3411
1171	Jewish General Hospital / Lady Davis Institute	 Montréal	 Quebec	 Canada	Jewish General Hospital / Lady Davis Institute, Montréal, Quebec, Canada	45.4968795999999998	-73.6296468999999973	H3T 1E2
1172	Hospital of The University of Pennsylvania	 Philadelphia	 Pennsylvania	 United States	Hospital of The University of Pennsylvania, Philadelphia, Pennsylvania, United States	39.9500225999999969	-75.1937544000000031	19104
1173	Zhongshan Hospital Affiliated to Xiamen University	 Xiamen	 Fujian	 China	Zhongshan Hospital Affiliated to Xiamen University, Xiamen, Fujian, China	24.471582999999999	118.098573000000002	361000
1174	 Skåne University Hospital in Malmö		 Malmö	 Sweden	 Skåne University Hospital in Malmö,, Malmö, Sweden	55.5895679999999999	13.0016352000000008	214 21
1175	UC Health Pain Medicine Center in Midtown	 Cincinnati	 Ohio	 United States	UC Health Pain Medicine Center in Midtown, Cincinnati, Ohio, United States	39.1711779999999976	-84.4153108999999944	45213
1176	UC Health Pain Medicine Center in West Chester	 West Chester	 Ohio	 United States	UC Health Pain Medicine Center in West Chester, West Chester, Ohio, United States	39.3564149999999984	-84.3677879999999902	6578
1177	UC Health Pain Medicine Center West Chester	 West Chester	 Ohio	 United States	UC Health Pain Medicine Center West Chester, West Chester, Ohio, United States	39.3564149999999984	-84.3677879999999902	6578
1178	Georgetown University	 Washington	 District of Columbia	 United States	Georgetown University, Washington, District of Columbia, United States	38.9076088999999996	-77.0722584999999896	20057
1179	Georgetown University	 Washington	 District of Columbia	 United States	Georgetown University, Washington, District of Columbia, United States	38.9076088999999996	-77.0722584999999896	20057
1180	Georgetown University	 Washington	 District of Columbia	 United States	Georgetown University, Washington, District of Columbia, United States	38.9076088999999996	-77.0722584999999896	20057
1181	Georgetown University	 Washington	 District of Columbia	 United States	Georgetown University, Washington, District of Columbia, United States	38.9076088999999996	-77.0722584999999896	20057
1182	Georgetown University	 Washington	 District of Columbia	 United States	Georgetown University, Washington, District of Columbia, United States	38.9076088999999996	-77.0722584999999896	20057
1183	South London and Maudsley NHS Foundation Trust		 London	 United Kingdom	South London and Maudsley NHS Foundation Trust,, London, United Kingdom	51.4682906999999972	-0.0909382999999999997	SE5 8AZ
1184	the 1st Affiliated Hospital of Wenzhou Medical College	 Wenzhou	 Zhejiang	 China	the 1st Affiliated Hospital of Wenzhou Medical College, Wenzhou, Zhejiang, China	27.9397610000000007	120.695886999999999	Wenzhou
1185	Martha Morehouse Medical Plaza	 Columbus	 Ohio	 United States	Martha Morehouse Medical Plaza, Columbus, Ohio, United States	40.001293699999998	-83.0315440999999907	43221
1186	University of Iowa Hospitals and Clinics	 Iowa City	 Iowa	 United States	University of Iowa Hospitals and Clinics, Iowa City, Iowa, United States	41.6589363000000006	-91.5478078999999951	52242
1187	Princess Margaret Hospital		 Hong Kong	 Hong Kong	Princess Margaret Hospital,, Hong Kong, Hong Kong	22.3415435000000002	114.133832400000003	Hong Kong
1188	Princess Margaret Hospital		 Hong Kong	 Hong Kong	Princess Margaret Hospital,, Hong Kong, Hong Kong	22.3415435000000002	114.133832400000003	Hong Kong
1190	NHS Lothian / University of Edinburgh	 Edinburgh	 Scotland	 United Kingdom	NHS Lothian / University of Edinburgh, Edinburgh, Scotland, United Kingdom	55.9301998999999981	-3.21291709999999986	EH10 5HF
1191	St Joseph's Hospital	 Hamilton	 Ontartio	 Canada	St Joseph's Hospital, Hamilton, Ontartio, Canada	43.2409543999999997	-79.8848232999999937	L9C 0E3
1192	Jagiellonian University Medical College	 Kraków	 Lesser Poland	 Poland	Jagiellonian University Medical College, Kraków, Lesser Poland, Poland	50.0657515999999987	19.9281667999999996	31-127
1193	Imam Adbulrahman Bin Faisal University	 Dammam	 Eastern Province	 Saudi Arabia	Imam Adbulrahman Bin Faisal University, Dammam, Eastern Province, Saudi Arabia	26.3921607999999992	50.1894617999999966	34212
1194	Institute for Orthopedics and Neurosciences	 Roanoke	 Virginia	 United States	Institute for Orthopedics and Neurosciences, Roanoke, Virginia, United States	37.2507289999999998	-79.9558660000000003	1111
1195	National Taiwan University Hospital Hsinchu Branch	 Hsinchu	 Hsinchu City	 Taiwan	National Taiwan University Hospital Hsinchu Branch, Hsinchu, Hsinchu City, Taiwan	24.8162924999999994	120.980130200000005	300
1196	Instituto de Desarrollo e Investigaciones Pediátricas Prof. Dr. Fernando E. Viteri	 La Plata	 Buenos Aires	 Argentina	Instituto de Desarrollo e Investigaciones Pediátricas Prof. Dr. Fernando E. Viteri, La Plata, Buenos Aires, Argentina	-34.931939100000001	-57.9478322999999875	AKS
1197	Maxima Medical Centre	 Eindhoven	 Noord Brabant	 Netherlands	Maxima Medical Centre, Eindhoven, Noord Brabant, Netherlands	51.4544847000000019	5.48791609999999963	5631 BM
1198	Rehaklinik Bellikon	 Bellikon	 Aargau	 Switzerland	Rehaklinik Bellikon, Bellikon, Aargau, Switzerland	47.388235899999998	8.34346410000000027	5454
1199	Vancouver General Hospital	 Vancouver	 British Columbia	 Canada	Vancouver General Hospital, Vancouver, British Columbia, Canada	49.2616159999999965	-123.123911300000003	V5Z 1M9
1200	Jordan Young Institute	 Virginia Beach	 Virginia	 United States	Jordan Young Institute, Virginia Beach, Virginia, United States	36.8481710000000007	-76.1774664000000001	23462
1201	Virginia Tech Carilion Research Institute	 Roanoke	 Virginia	 United States	Virginia Tech Carilion Research Institute, Roanoke, Virginia, United States	37.2575795999999997	-79.9425985000000026	24016
1202	University of Virginia	 Charlottesville	 Virginia	 United States	University of Virginia, Charlottesville, Virginia, United States	38.0335528999999966	-78.5079771999999991	United States
1203	Duke University Hospital	 Durham	 North Carolina	 United States	Duke University Hospital, Durham, North Carolina, United States	36.0078403999999992	-78.9380187999999947	27710
1204	National Cancer Centre Singapore		 Singapore	 Singapore	National Cancer Centre Singapore,, Singapore, Singapore	1.27930480000000002	103.836576199999996	169610
1205	 Health Promotion Board		 Singapore	 Singapore	 Health Promotion Board,, Singapore, Singapore	1.27954799999999991	103.838437999999996	168937
1206	National University Hospital		 Singapore	 Singapore	National University Hospital,, Singapore, Singapore	1.29372780000000009	103.783175600000007	119074
1207	Duquesne University	 Pittsburgh	 Pennsylvania	 United States	Duquesne University, Pittsburgh, Pennsylvania, United States	40.4374516000000028	-79.9905862999999897	15282
1208	Johns Hopkins Outpatient CENTER	 Baltimore	 Maryland	 United States	Johns Hopkins Outpatient CENTER, Baltimore, Maryland, United States	39.2969282999999976	-76.5951343999999921	21287
1209	Princess Marina Hospital		 Gaborone	 Botswana	Princess Marina Hospital,, Gaborone, Botswana	-24.6568739999999984	25.9239327999999993	Botswana
1210	Massachusetts General Hospital	 Boston	 Massachusetts	 United States	Massachusetts General Hospital, Boston, Massachusetts, United States	42.3631541999999968	-71.0688334000000026	02114
1211	Hospital Queen Elizabeth 2	 Kota Kinabalu	 Sabah	 Malaysia	Hospital Queen Elizabeth 2, Kota Kinabalu, Sabah, Malaysia	5.96648720000000043	116.093792800000003	88300
1212	Hospital Ampang	 Ampang	 Selangor	 Malaysia	Hospital Ampang, Ampang, Selangor, Malaysia	3.12784089999999981	101.763898999999995	68000
1213	Hospital Putrajaya	 Putrajaya	 Wilayah Persekutuan	 Malaysia	Hospital Putrajaya, Putrajaya, Wilayah Persekutuan, Malaysia	2.92915560000000008	101.674227000000002	62250
1214	 L'Hospitalet de Llobregat		 Barcelona	 Spain	 L'Hospitalet de Llobregat,, Barcelona, Spain	41.3661864999999977	2.11649419999999999	Spain
1215	University Hospitals Cleveland Medical Center	 Cleveland	 Ohio	 United States	University Hospitals Cleveland Medical Center, Cleveland, Ohio, United States	41.506015699999999	-81.6068396999999948	44106
1216	University Hospitals Cleveland Medical Center	 Cleveland	 Ohio	 United States	University Hospitals Cleveland Medical Center, Cleveland, Ohio, United States	41.506015699999999	-81.6068396999999948	44106
1217	University of Limerick	 Limerick	 Co Limerick	 Ireland	University of Limerick, Limerick, Co Limerick, Ireland	52.6735881000000035	-8.57243719999999954	V94 T9PX
1218	Singapore National Eye Centre		 Singapore	 Singapore	Singapore National Eye Centre,, Singapore, Singapore	1.28108960000000005	103.835956600000003	168751
1219	Hospital das Clínicas		 São Paulo	 Brazil	Hospital das Clínicas,, São Paulo, Brazil	-23.5574773999999998	-46.6699024999999992	05403-000
1220	Sunnybrook Health Sciences Centre	 Toronto	 Ontario	 Canada	Sunnybrook Health Sciences Centre, Toronto, Ontario, Canada	43.7216064000000131	-79.3759227999999979	M4N 3M5
1221	NanFang hospital	 Guangzhou	 Guangdong	 China	NanFang hospital, Guangzhou, Guangdong, China	23.1878039999999999	113.328560999999993	510000
1222	Comprehensive EyeCare of Central Ohio	 Westerville	 Ohio	 United States	Comprehensive EyeCare of Central Ohio, Westerville, Ohio, United States	40.1381100999999987	-82.9441161000000022	43082
1223	FundeSalud. Junta de Extremadura	 Mérida	 Badajoz	 Spain	FundeSalud. Junta de Extremadura, Mérida, Badajoz, Spain	38.9264330000000029	-6.33578770000000002	06800
1224	Hospital Virgen del Puerto	 Plasencia	 Cáceres	 Spain	Hospital Virgen del Puerto, Plasencia, Cáceres, Spain	40.0495645999999965	-6.08647570000000027	10600
1225	Hospital San Pedro de Alcántara		 Cáceres	 Spain	Hospital San Pedro de Alcántara,, Cáceres, Spain	39.4650295	-6.36775179999999974	10003
1226	University of Minnesota Masonic Children's Hospital	 Minneapolis	 Minnesota	 United States	University of Minnesota Masonic Children's Hospital, Minneapolis, Minnesota, United States	44.9667221000000126	-93.2373538000000082	55454
1227	The Cleveland Clinic Foundation	 Cleveland	 Ohio	 United States	The Cleveland Clinic Foundation, Cleveland, Ohio, United States	41.4619963999999968	-81.6970869999999962	1900
1228	Northwell Health- North Shore University Hospital	 Manhasset	 New York	 United States	Northwell Health- North Shore University Hospital, Manhasset, New York, United States	40.776185599999998	-73.7012864999999948	11030
1229	Wake Forest School of Medicine	 Winston-Salem	 North Carolina	 United States	Wake Forest School of Medicine, Winston-Salem, North Carolina, United States	36.1002069000000034	-80.2399434000000014	27101
1230	Northern Arizona University	 Flagstaff	 Arizona	 United States	Northern Arizona University, Flagstaff, Arizona, United States	35.1805786999999981	-111.654031799999998	86011
1231	Planned Parentehood of Southwest and Central Florida (PPSWCF)	 Tampa	 Florida	 United States	Planned Parentehood of Southwest and Central Florida (PPSWCF), Tampa, Florida, United States	27.7705684999999995	-82.6420772999999969	33701
1232	University of California Irvine Medical Center	 Orange	 California	 United States	University of California Irvine Medical Center, Orange, California, United States	33.7876562000000007	-117.889422300000007	3201
1233	Central Hospital of Central Finland	 Jyväskylä	 Keski-Suomi	 Finland	Central Hospital of Central Finland, Jyväskylä, Keski-Suomi, Finland	62.3872088000000034	25.682368499999999	41160
1234	Tampere University Hospital	 Tampere	 Pirkanmaa	 Finland	Tampere University Hospital, Tampere, Pirkanmaa, Finland	61.5049813999999984	23.8157539000000007	33521
1235	Oulu University hospital	 Oulu	 Pohjois-Pohjanmaa	 Finland	Oulu University hospital, Oulu, Pohjois-Pohjanmaa, Finland	65.0069652999999903	25.5179524999999998	90220
1236	Kuopio University hospital	 Kuopio	 Pohjois-Savo	 Finland	Kuopio University hospital, Kuopio, Pohjois-Savo, Finland	62.8975419999999872	27.6470249999999993	70210
1237	Helsinki University hospital	 Helsinki	 Uusimaa	 Finland	Helsinki University hospital, Helsinki, Uusimaa, Finland	60.1810588999999965	24.9225066999999996	00260
1238	Turku University Hospital	 Turku	 Varsinais-Suomi	 Finland	Turku University Hospital, Turku, Varsinais-Suomi, Finland	60.4531409000000011	22.2915987999999992	20521
1239	University of Murcia		 Murcia	 Spain	University of Murcia,, Murcia, Spain	38.0187510000000088	-1.16938000000000009	30100
1240	LV Prasad Eye Institute	 Hyderabad	 Telangana	 India	LV Prasad Eye Institute, Hyderabad, Telangana, India	17.4245170999999992	78.4278288000000003	500034
1241	McGill University Health Centre	 Montréal	 Quebec	 Canada	McGill University Health Centre, Montréal, Quebec, Canada	45.4728824999999972	-73.6017702999999983	H4A 3J1
1242	Royal Aberdeen Children's Hospital		 Aberdeen	 United Kingdom	Royal Aberdeen Children's Hospital,, Aberdeen, United Kingdom	57.1535080000000022	-2.135494	AB25 2ZG
1243	 NHS Grampian		 Aberdeen	 United Kingdom	 NHS Grampian,, Aberdeen, United Kingdom	57.1539417999999984	-2.13340890000000005	AB25 2ZY
1244	 Belfast Health and Social Care Trust		 Belfast	 United Kingdom	 Belfast Health and Social Care Trust,, Belfast, United Kingdom	54.6039298000000031	-5.94333430000000007	BT13 1FD
1245	Birmingham Children's Hospital NHS Foundation Trust		 Birmingham	 United Kingdom	Birmingham Children's Hospital NHS Foundation Trust,, Birmingham, United Kingdom	52.4850556999999966	-1.89467319999999995	B4 6NH
1246	University Hospitals Bristol NHS Foundation Trust		 Bristol	 United Kingdom	University Hospitals Bristol NHS Foundation Trust,, Bristol, United Kingdom	51.4599694999999997	-2.59447939999999999	BS1 3NU
1247	 Cambridge University Hospitals NHS Foundation Trust		 Cambridge	 United Kingdom	 Cambridge University Hospitals NHS Foundation Trust,, Cambridge, United Kingdom	52.1751266999999999	0.140661599999999998	CB2 0QQ
1248	 Noah's Ark Children's Hospital for Wales		 Cardiff	 United Kingdom	 Noah's Ark Children's Hospital for Wales,, Cardiff, United Kingdom	51.5081085999999999	-3.18828319999999987	CF14 4XW
1249	 Royal Hospital for Sick Children		 Edinburgh	 United Kingdom	 Royal Hospital for Sick Children,, Edinburgh, United Kingdom	55.9384579999999971	-3.18885700000000005	EH9 1LF
1250	 The Royal Hospital for Children		 Glasgow	 United Kingdom	 The Royal Hospital for Children,, Glasgow, United Kingdom	55.8627287999999993	-4.34247460000000007	G51 4TF
1251	 Leeds Teaching Hospitals NHS Trust		 Leeds	 United Kingdom	 Leeds Teaching Hospitals NHS Trust,, Leeds, United Kingdom	53.8029113999999993	-1.55157100000000003	LS1 3EX
1252	Alder Hey Children's NHS Foundation Trust		 Liverpool	 United Kingdom	Alder Hey Children's NHS Foundation Trust,, Liverpool, United Kingdom	53.4182050999999873	-2.89600549999999979	L14 5AB
1253	University College London Hospitals NHS Foundation Trust		 London	 United Kingdom	University College London Hospitals NHS Foundation Trust,, London, United Kingdom	51.5250833999999998	-0.136355100000000007	NW1 2BU
1254	The Royal Marsden NHS Foundation Trust		 London	 United Kingdom	The Royal Marsden NHS Foundation Trust,, London, United Kingdom	51.4908767000000012	-0.172799599999999998	SW3 6JJ
1255	Great Ormond Street Hospital For Children NHS Trust		 London	 United Kingdom	Great Ormond Street Hospital For Children NHS Trust,, London, United Kingdom	51.5218625999999986	-0.120746199999999998	WC1N 3JH
1256	 Central Manchester University Hospitals NHS Foundation Trust		 Manchester	 United Kingdom	 Central Manchester University Hospitals NHS Foundation Trust,, Manchester, United Kingdom	53.4628790000000009	-2.22611880000000006	M13 9WL
1257	The Christie NHS Foundation		 Manchester	 United Kingdom	The Christie NHS Foundation,, Manchester, United Kingdom	53.4299658999999991	-2.2304081	M20 4BX
1258	The Newcastle Upon Tyne Hospitals NHS Foundation Trust		 Newcastle	 United Kingdom	The Newcastle Upon Tyne Hospitals NHS Foundation Trust,, Newcastle, United Kingdom	55.003028399999998	-1.59294559999999996	NE7 7DN
1259	Nottingham University Hospitals NHS Trust		 Nottingham	 United Kingdom	Nottingham University Hospitals NHS Trust,, Nottingham, United Kingdom	52.9902530000000027	-1.15417590000000003	NG5 1PB
1260	 Oxford Radcliffe Hospitals NHS Trust		 Oxford	 United Kingdom	 Oxford Radcliffe Hospitals NHS Trust,, Oxford, United Kingdom	51.7642712999999972	-1.22055960000000008	OX3 9DU
1261	Sheffield Children's NHS Foundation Trust		 Sheffield	 United Kingdom	Sheffield Children's NHS Foundation Trust,, Sheffield, United Kingdom	53.3804283999999996	-1.48950669999999996	S10 2TH
1262	Southampton University Hospitals NHS Trust		 Southampton	 United Kingdom	Southampton University Hospitals NHS Trust,, Southampton, United Kingdom	50.9336024999999992	-1.43371760000000004	SO16 6YD
1263	Cambridge University Hospitals NHS Foundation Trust	 Cambridge	 Cambridgeshire	 United Kingdom	Cambridge University Hospitals NHS Foundation Trust, Cambridge, Cambridgeshire, United Kingdom	52.1751266999999999	0.140661599999999998	CB2 0QQ
1264	Petaling Jaya City Council	 Petaling Jaya	 Selangor	 Malaysia	Petaling Jaya City Council, Petaling Jaya, Selangor, Malaysia	3.09740120000000019	101.644714800000003	46675
1265	Royal Bournemouth and Christchurch Hospitals NHS Foundation Trust		 Bournemouth	 United Kingdom	Royal Bournemouth and Christchurch Hospitals NHS Foundation Trust,, Bournemouth, United Kingdom	50.7469628999999998	-1.82171700000000003	BH7 7DW
1266	Poole Hopsital		 Poole	 United Kingdom	Poole Hopsital,, Poole, United Kingdom	50.7218665999999985	-1.9728348	BH15 2JB
1267	Quietmind Foundation	 Elkins Park	 Pennsylvania	 United States	Quietmind Foundation, Elkins Park, Pennsylvania, United States	40.0791879000000009	-75.1277235000000019	19027
1268	Quietmind Foundation	 Elkins Park	 Pennsylvania	 United States	Quietmind Foundation, Elkins Park, Pennsylvania, United States	40.0791879000000009	-75.1277235000000019	19027
1269	Texas Tech University Health Sciences Center El Paso	 El Paso	 Texas	 United States	Texas Tech University Health Sciences Center El Paso, El Paso, Texas, United States	31.7731445000000008	-106.434421900000004	79905
1270	Georgia State University	 Atlanta	 Georgia	 United States	Georgia State University, Atlanta, Georgia, United States	33.753067999999999	-84.3852819000000096	30302
1271	Arizona State University	 Tempe	 Arizona	 United States	Arizona State University, Tempe, Arizona, United States	33.4242399000000034	-111.928052699999995	85281
1272	Arizona State University	 Tempe	 Arizona	 United States	Arizona State University, Tempe, Arizona, United States	33.4242399000000034	-111.928052699999995	85281
1273	Gouri Pantvaidya	 Mumbai	 Maharashtra	 India	Gouri Pantvaidya, Mumbai, Maharashtra, India	19.0759836999999983	72.8776558999999935	India
1274	Gouri Pantvaidya	 Mumbai	 Maharashtra	 India	Gouri Pantvaidya, Mumbai, Maharashtra, India	19.0759836999999983	72.8776558999999935	India
1275	Gouri Pantvaidya	 Mumbai	 Maharashtra	 India	Gouri Pantvaidya, Mumbai, Maharashtra, India	19.0759836999999983	72.8776558999999935	India
1276	Gouri Pantvaidya	 Mumbai	 Maharashtra	 India	Gouri Pantvaidya, Mumbai, Maharashtra, India	19.0759836999999983	72.8776558999999935	India
1277	Gouri Pantvaidya	 Mumbai	 Maharashtra	 India	Gouri Pantvaidya, Mumbai, Maharashtra, India	19.0759836999999983	72.8776558999999935	India
1278	Sleep and Cognition Lab	 Irvine	 California	 United States	Sleep and Cognition Lab, Irvine, California, United States	33.6845672999999977	-117.826504900000003	United States
1279	Zhongshan Hospital Affiliated to Xiamen University	 Xiamen	 Fujian	 China	Zhongshan Hospital Affiliated to Xiamen University, Xiamen, Fujian, China	24.471582999999999	118.098573000000002	361000
1280	Northwestern University	 Chicago	 Illinois	 United States	Northwestern University, Chicago, Illinois, United States	41.894582800000002	-87.6231705999999946	2834
1281	Samuel Nemanich	 Minneapolis	 Minnesota	 United States	Samuel Nemanich, Minneapolis, Minnesota, United States	44.9777529999999999	-93.2650107999999989	United States
1282	Baylor College of Medicine	 Houston	 Texas	 United States	Baylor College of Medicine, Houston, Texas, United States	29.7105289999999904	-95.3962409999999892	3411
1283	First Hospital of Jilin University	 Changchun	 Jilin	 China	First Hospital of Jilin University, Changchun, Jilin, China	43.8770740000000004	125.304465100000002	130021
1284	 Chinese Academy of Medical Sciences (CICAMS)		 Beijing	 China	 Chinese Academy of Medical Sciences (CICAMS),, Beijing, China	39.8721979999999974	116.447760000000002	China
1285	Hospital 1	 Omaha	 Nebraska	 United States	Hospital 1, Omaha, Nebraska, United States	41.3219384000000005	-96.0214833999999939	68152
1286	UPMC Pain Medicine at Centre Commons	 Pittsburgh	 Pennsylvania	 United States	UPMC Pain Medicine at Centre Commons, Pittsburgh, Pennsylvania, United States	40.4898837	-79.8947773999999953	15215
1287	Guangzhou General Hospital of Guangzhou Military Command	 Guangzhou	 Guangdong	 China	Guangzhou General Hospital of Guangzhou Military Command, Guangzhou, Guangdong, China	23.1403590000000001	113.256513999999996	510016
1288	 GuangZhou		 Guangdong	 China	 GuangZhou,, Guangdong, China	23.1291100000000007	113.264385000000004	China
1289	Osf St Francis Medical Center	 Peoria	 Illinois	 United States	Osf St Francis Medical Center, Peoria, Illinois, United States	40.7024678000000009	-89.5928085999999979	61637
1290	Osf St Francis Medical Center	 Peoria	 Illinois	 United States	Osf St Francis Medical Center, Peoria, Illinois, United States	40.7024678000000009	-89.5928085999999979	61637
1291	Montreal Children's Hospital	 Montreal	 Quebec	 Canada	Montreal Children's Hospital, Montreal, Quebec, Canada	45.4735298000000014	-73.6007326999999947	H4A 3J1
1292	William S. Middleton Memorial Veterans Hospital	 Madison	 Wisconsin	 United States	William S. Middleton Memorial Veterans Hospital, Madison, Wisconsin, United States	43.0745718000000011	-89.4313211999999993	53705
1293	University of Wisconsin Hospital and Clinics	 Madison	 Wisconsin	 United States	University of Wisconsin Hospital and Clinics, Madison, Wisconsin, United States	43.0766352999999995	-89.4311230999999935	53792
1294	University Hospitals Cleveland Medical Center	 Cleveland	 Ohio	 United States	University Hospitals Cleveland Medical Center, Cleveland, Ohio, United States	41.506015699999999	-81.6068396999999948	44106
1295	University of Arizona	 Tucson	 Arizona	 United States	University of Arizona, Tucson, Arizona, United States	32.2318850999999995	-110.950109400000002	85721
1296	University of Arizona	 Tucson	 Arizona	 United States	University of Arizona, Tucson, Arizona, United States	32.2318850999999995	-110.950109400000002	85721
1297	Hospital Israelita Albert Einstein		 Sao Paulo	 Brazil	Hospital Israelita Albert Einstein,, Sao Paulo, Brazil	-23.600093900000001	-46.7151776999999981	05652-900
1298	Mayo Clinic Florida	 Jacksonville	 Florida	 United States	Mayo Clinic Florida, Jacksonville, Florida, United States	30.2647528000000001	-81.4406535999999903	1865
1299	University Research Co.		 Yangon	 Myanmar	University Research Co.,, Yangon, Myanmar	16.8240730999999997	96.1588911999999993	11201
1300	California State University	 Fresno	 California	 United States	California State University, Fresno, California, United States	36.8124450999999979	-119.745780499999995	93740
1301	University of Illinois at Urbana-Champaign	 Urbana	 Illinois	 United States	University of Illinois at Urbana-Champaign, Urbana, Illinois, United States	40.1019523000000007	-88.227161499999994	United States
1302	Iowa State University	 Ames	 Iowa	 United States	Iowa State University, Ames, Iowa, United States	42.0266187000000002	-93.6464653999999967	50011
1303	University of Houston	 Houston	 Texas	 United States	University of Houston, Houston, Texas, United States	29.7199488999999986	-95.3422333999999978	77004
1304	University of Puerto Rico		 San Juan	 Puerto Rico	University of Puerto Rico,, San Juan, Puerto Rico	18.4069412999999997	-66.0473819999999989	Puerto Rico
1305	TB HIV Care		 Durban	 South Africa	TB HIV Care,, Durban, South Africa	-29.83101559999999	31.0234234999999998	4001
1306	 College Park		 Maryland	 United States	 College Park,, Maryland, United States	38.9896967000000032	-76.9377599999999973	United States
1307	Medical University of South Carolina	 Charleston	 South Carolina	 United States	Medical University of South Carolina, Charleston, South Carolina, United States	32.7847215000000034	-79.9493842999999913	29425
1308	Zhongshan Hospital Affiliated to Xiamen University	 Xiamen	 Fujian	 China	Zhongshan Hospital Affiliated to Xiamen University, Xiamen, Fujian, China	24.471582999999999	118.098573000000002	361000
1309	University of Alberta	 Edmonton	 Alberta	 Canada	University of Alberta, Edmonton, Alberta, Canada	53.5232189000000034	-113.526318599999996	T6G 2R3
1310	The Ottawa Hospital	 Ottawa	 Ontario	 Canada	The Ottawa Hospital, Ottawa, Ontario, Canada	45.4018514999999994	-75.6478697999999952	K1H 8L6
1311	St-Michael's Hospital	 Toronto	 Ontario	 Canada	St-Michael's Hospital, Toronto, Ontario, Canada	43.6537210999999985	-79.3778066999999936	M5B 1W8
1312	McGill University Health Centre	 Montréal	 Quebec	 Canada	McGill University Health Centre, Montréal, Quebec, Canada	45.4728824999999972	-73.6017702999999983	H4A 3J1
1313	Zhongshan Hospital Affiliated to Xiamen University	 Xiamen	 Fujian	 China	Zhongshan Hospital Affiliated to Xiamen University, Xiamen, Fujian, China	24.471582999999999	118.098573000000002	361000
1314	Zhongshan Hospital Affiliated to Xiamen University	 Xiamen	 Fujian	 China	Zhongshan Hospital Affiliated to Xiamen University, Xiamen, Fujian, China	24.471582999999999	118.098573000000002	361000
1315	Community Medical Center	 Toms River	 New Jersey	 United States	Community Medical Center, Toms River, New Jersey, United States	39.9642419999999987	-74.21558619999999	08755
1316	SkinCare Network		 London	 United Kingdom	SkinCare Network,, London, United Kingdom	51.6532120000000035	-0.201750000000000013	EN5 4QS
1317	SkinCare Network		 London	 United Kingdom	SkinCare Network,, London, United Kingdom	51.6532120000000035	-0.201750000000000013	EN5 4QS
1318	University of Guelph	 Guelph	 Ontario	 Canada	University of Guelph, Guelph, Ontario, Canada	43.5293731999999878	-80.2252501999999907	N1G 1Y4
1319	 Viborg Regional Hospital		 Viborg	 Denmark	 Viborg Regional Hospital,, Viborg, Denmark	56.4454901999999876	9.40413180000000004	8800
1320	Children's hospital of Fudan university	 Shanghai	 Shanghai	 China	Children's hospital of Fudan university, Shanghai, Shanghai, China	31.1394680000000008	121.395242999999994	China
1321	Medical University of Vienna		 Vienna	 Austria	Medical University of Vienna,, Vienna, Austria	48.2196988999999974	16.3515215000000005	1090
1322	Mahosot Hospital		 Vientiane	 Lao People's Democratic Republic	Mahosot Hospital,, Vientiane, Lao People's Democratic Republic	17.9601033000000001	102.611844000000005	Laos
1323	Mother and Newborn Hospital		 Vientiane	 Lao People's Democratic Republic	Mother and Newborn Hospital,, Vientiane, Lao People's Democratic Republic	18.0349229000000015	102.602219599999998	Laos
1324	Setthathirath Hospital		 Vientiane	 Lao People's Democratic Republic	Setthathirath Hospital,, Vientiane, Lao People's Democratic Republic	17.9343323999999988	102.648534799999993	Laos
1325	Mae Sai Hospital	 Mae Sai	 Chiang Rai	 Thailand	Mae Sai Hospital, Mae Sai, Chiang Rai, Thailand	20.4297149000000005	99.8782700000000006	57130
1326	Mae Chan Hospital	 Mae Chan	 Chiangrai	 Thailand	Mae Chan Hospital, Mae Chan, Chiangrai, Thailand	20.1345211000000006	99.8599256999999909	57110
1327	Mahasarakam Hospital	 Maha Sarakham	 Mahasarakham	 Thailand	Mahasarakam Hospital, Maha Sarakham, Mahasarakham, Thailand	16.1814093999999997	103.299088400000002	44000
1328	Chiang Kham Hospital	 Chiang Kham	 Phayao	 Thailand	Chiang Kham Hospital, Chiang Kham, Phayao, Thailand	19.5182910000000014	100.298443000000006	56110
1329	Hat Yai Hospital	 Hat Yai	 Songkla	 Thailand	Hat Yai Hospital, Hat Yai, Songkla, Thailand	7.01676030000000139	100.467390800000004	90110
1330	Bhumibol Adulyadej Hospital		 Bangkok	 Thailand	Bhumibol Adulyadej Hospital,, Bangkok, Thailand	13.9091141999999994	100.617736399999998	10220
1331	Nopparat Rajathanee Hospital		 Bangkok	 Thailand	Nopparat Rajathanee Hospital,, Bangkok, Thailand	13.8168065000000002	100.687598899999998	10230
1332	Bhuddasothorn Hospital		 Chachoengsao	 Thailand	Bhuddasothorn Hospital,, Chachoengsao, Thailand	13.6859670999999992	101.073739599999996	24000
1333	Prapokklao Hospital		 Chanthaburi	 Thailand	Prapokklao Hospital,, Chanthaburi, Thailand	12.6042716000000006	102.1023517	22000
1334	Health Promotion Center Region 1		 Chiang Mai	 Thailand	Health Promotion Center Region 1,, Chiang Mai, Thailand	18.7917158999999998	99.0183485000000019	50000
1335	Sanpatong Hospital		 Chiang Mai	 Thailand	Sanpatong Hospital,, Chiang Mai, Thailand	18.5953294999999983	98.8849534999999946	50120
1336	Nakornping Hospital		 Chiang Mai	 Thailand	Nakornping Hospital,, Chiang Mai, Thailand	18.8516916999999999	98.9681221999999963	50180
1337	Chiangrai Prachanukroh Hospital		 Chiang Rai	 Thailand	Chiangrai Prachanukroh Hospital,, Chiang Rai, Thailand	19.9009819000000014	99.8289067999999986	57000
1338	Chonburi Hospital		 Chon Buri	 Thailand	Chonburi Hospital,, Chon Buri, Thailand	13.3515890000000006	100.982448599999998	20000
1339	Banglamung Hospital		 Chon Buri	 Thailand	Banglamung Hospital,, Chon Buri, Thailand	12.9667191000000006	100.906087400000004	20150
1340	Kalasin Hospital		 Kalasin	 Thailand	Kalasin Hospital,, Kalasin, Thailand	16.4342602000000007	103.505257	46000
1341	Phaholpolpayuhasena Hospital		 Kanchanaburi	 Thailand	Phaholpolpayuhasena Hospital,, Kanchanaburi, Thailand	14.0050448000000003	99.5466966999999983	71000
1342	Khon Kaen Regional Hospital		 Khon Kaen	 Thailand	Khon Kaen Regional Hospital,, Khon Kaen, Thailand	16.4290742999999999	102.850228700000002	40000
1343	Lampang Hospital		 Lampang	 Thailand	Lampang Hospital,, Lampang, Thailand	18.2861069000000001	99.5062361999999894	52100
1344	Lamphun Hospital		 Lamphun	 Thailand	Lamphun Hospital,, Lamphun, Thailand	18.5826309999999992	98.994697699999989	51000
1345	Maharat Nakhon Ratchasima Hospital		 Nakhon Ratchasima	 Thailand	Maharat Nakhon Ratchasima Hospital,, Nakhon Ratchasima, Thailand	14.9847038000000001	102.103404100000006	30000
1346	Maharaj Nakhon Si Thammarat Hospital		 Nakhon Si Thammarat	 Thailand	Maharaj Nakhon Si Thammarat Hospital,, Nakhon Si Thammarat, Thailand	8.39006009999999947	99.9716323999999901	80000
1347	Nong Khai Hospital		 Nong Khai	 Thailand	Nong Khai Hospital,, Nong Khai, Thailand	17.8815616999999989	102.741566700000007	43000
1348	Phayao Provincial Hospital		 Phayao	 Thailand	Phayao Provincial Hospital,, Phayao, Thailand	19.1904530999999992	99.8776510999999942	56000
1349	Buddhachinaraj Hospital		 Phitsanulok	 Thailand	Buddhachinaraj Hospital,, Phitsanulok, Thailand	16.8082917999999992	100.263487499999997	65000
1350	Rayong Hospital		 Rayong	 Thailand	Rayong Hospital,, Rayong, Thailand	12.6821032000000002	101.276478100000006	21000
1351	Samutprakarn Hospital		 Samut Prakan	 Thailand	Samutprakarn Hospital,, Samut Prakan, Thailand	13.5982736000000006	100.6146691	10270
1352	Samutsakhon Hospital		 Samut Sakhon	 Thailand	Samutsakhon Hospital,, Samut Sakhon, Thailand	13.5518210999999997	100.279057899999998	74000
1353	Songkhla Hospital		 Songkhla	 Thailand	Songkhla Hospital,, Songkhla, Thailand	7.14217010000000041	100.566401099999993	90100
1354	Azienda Ospedaliera di Rilievo Nazionale Santobono-Pausilipon	 Napoli	 Italia	 Italy	Azienda Ospedaliera di Rilievo Nazionale Santobono-Pausilipon, Napoli, Italia, Italy	40.8489605999999981	14.2323190000000004	80129
1355	Azienda Ospedaliera Universitaria Padova	 Padova	 Italia	 Italy	Azienda Ospedaliera Universitaria Padova, Padova, Italia, Italy	45.4033987999999979	11.8878380000000003	35128
1356	Azienda Ospedaliera Le Scotte Siena	 Siena	 Italia	 Italy	Azienda Ospedaliera Le Scotte Siena, Siena, Italia, Italy	43.3434230000000014	11.3293209000000008	53100
1357	Cardiff and Vale University Health Board	 Cardiff	 Mid Glamorgan	 United Kingdom	Cardiff and Vale University Health Board, Cardiff, Mid Glamorgan, United Kingdom	51.5067919999999972	-3.19021800000000022	CF14 4XW
1358	Cardiff Metropolitan University	 Cardiff	 Mid Glamorgan	 United Kingdom	Cardiff Metropolitan University, Cardiff, Mid Glamorgan, United Kingdom	51.495742700000001	-3.21252000000000004	CF5 2YB
1359	University of Limerick	 Limerick	 Co Limerick	 Ireland	University of Limerick, Limerick, Co Limerick, Ireland	52.6735881000000035	-8.57243719999999954	V94 T9PX
1360	Center for Clinical Studies	 Houston	 Texas	 United States	Center for Clinical Studies, Houston, Texas, United States	29.7238143000000008	-95.3857754999999941	77004
1361	University of the Incarnate Word Rosenberg School of Optometry	 San Antonio	 Texas	 United States	University of the Incarnate Word Rosenberg School of Optometry, San Antonio, Texas, United States	29.5274001000000013	-98.5628289999999936	78229
1362	Virginia Tech Carilion Research Institute	 Roanoke	 Virginia	 United States	Virginia Tech Carilion Research Institute, Roanoke, Virginia, United States	37.2575795999999997	-79.9425985000000026	24016
1363	Toyos Clinic	 Nashville	 Tennessee	 United States	Toyos Clinic, Nashville, Tennessee, United States	36.1091252000000011	-86.8143547999999896	2002
1364	South Tees Hospitals NHS FT	 Middlesbrough	 Teesside	 United Kingdom	South Tees Hospitals NHS FT, Middlesbrough, Teesside, United Kingdom	54.5713628000000028	-1.16799990000000009	TS6 6TD
1365	Cornell University - Human Metabolic Research Unit	 Ithaca	 New York	 United States	Cornell University - Human Metabolic Research Unit, Ithaca, New York, United States	42.4497008000000022	-76.4790485999999987	14850
1366	Lei Li	 Beijing	 Beijing	 China	Lei Li, Beijing, Beijing, China	39.9635210000000001	116.323324999999997	China
1367	Lei Li	 Beijing	 Beijing	 China	Lei Li, Beijing, Beijing, China	39.9635210000000001	116.323324999999997	China
1368	Baton Rouge General Medical Center and Our Lady of The Lakes Regional Medical Center	 Baton Rouge	 Louisiana	 United States	Baton Rouge General Medical Center and Our Lady of The Lakes Regional Medical Center, Baton Rouge, Louisiana, United States	30.4041074999999985	-91.1075979999999959	4375
1369	Tufts Medical Center	 Boston	 Massachusetts	 United States	Tufts Medical Center, Boston, Massachusetts, United States	42.3496620000000021	-71.0639170000000036	02116
1370	Baystate Medical Center	 Springfield	 Massachusetts	 United States	Baystate Medical Center, Springfield, Massachusetts, United States	42.1217225999999982	-72.6031122999999923	01199
1371	Mission Hospital	 Asheville	 North Carolina	 United States	Mission Hospital, Asheville, North Carolina, United States	35.5767591999999979	-82.5489785999999981	28801
1372	Vanderbilt University Medical Center	 Nashville	 Tennessee	 United States	Vanderbilt University Medical Center, Nashville, Tennessee, United States	36.1417373000000026	-86.8021305999999981	37232
1373	Texas Health Harris Fort Worth	 Fort Worth	 Texas	 United States	Texas Health Harris Fort Worth, Fort Worth, Texas, United States	32.7356241000000026	-97.3389217000000002	76104
1374	Baylor College of Medicine	 Houston	 Texas	 United States	Baylor College of Medicine, Houston, Texas, United States	29.7105289999999904	-95.3962409999999892	3411
1375	Houston Methodist Hospital	 Houston	 Texas	 United States	Houston Methodist Hospital, Houston, Texas, United States	29.709907900000001	-95.3997224999999958	77030
1376	University of Texas Health Science Center at San Antonio	 San Antonio	 Texas	 United States	University of Texas Health Science Center at San Antonio, San Antonio, Texas, United States	29.507465400000001	-98.5753520999999893	78229
1377	University of Wisconsin	 Madison	 Wisconsin	 United States	University of Wisconsin, Madison, Wisconsin, United States	43.076591999999998	-89.4124874999999975	53706
1378	Retina Consultants of Houston/Texas Medical Center	 Houston	 Texas	 United States	Retina Consultants of Houston/Texas Medical Center, Houston, Texas, United States	29.7108904000000003	-95.4003094999999917	2727
1379	Retina Consultants of Houston	 Katy	 Texas	 United States	Retina Consultants of Houston, Katy, Texas, United States	29.7430836999999997	-95.7751358999999951	77494
1380	Retina Consultants of Houston/The Woodlands	 The Woodlands	 Texas	 United States	Retina Consultants of Houston/The Woodlands, The Woodlands, Texas, United States	30.2039557999999992	-95.4581644999999952	77384
1381	University of Michigan	 Ann Arbor	 Michigan	 United States	University of Michigan, Ann Arbor, Michigan, United States	42.2780435999999966	-83.7382240999999965	48109
1382	University of Minnesota	 Minneapolis	 Minnesota	 United States	University of Minnesota, Minneapolis, Minnesota, United States	44.9739900000000006	-93.2277284999999978	55455
1383	University of Utah	 Salt Lake City	 Utah	 United States	University of Utah, Salt Lake City, Utah, United States	40.764936800000001	-111.842102100000005	84112
1384	PrimeCare Pediatrics	 Hialeah	 Florida	 United States	PrimeCare Pediatrics, Hialeah, Florida, United States	25.8731286000000011	-80.3240388999999908	33016
1385	Ileana Fuentes Clinic	 Miami	 Florida	 United States	Ileana Fuentes Clinic, Miami, Florida, United States	25.8108295000000005	-80.1906013999999914	3795
1386	Ambulatory Care Center West Pediatrics at Jackson Memorial Hospital	 Miami	 Florida	 United States	Ambulatory Care Center West Pediatrics at Jackson Memorial Hospital, Miami, Florida, United States	25.7917988999999999	-80.2126379999999983	1005
1387	UM Pediatric Mobile Clinic	 Miami	 Florida	 United States	UM Pediatric Mobile Clinic, Miami, Florida, United States	25.7901533000000001	-80.2142429999999962	1005
1388	UM UHealth Pediatrics at the Professional Arts Center	 Miami	 Florida	 United States	UM UHealth Pediatrics at the Professional Arts Center, Miami, Florida, United States	25.7873865000000002	-80.2138129000000077	33136
1389	Borinquean Medical Centers	 Miami	 Florida	 United States	Borinquean Medical Centers, Miami, Florida, United States	25.8108728999999997	-80.1905070999999907	33137
1390	Borinquen Medical Centers	 Miami	 Florida	 United States	Borinquen Medical Centers, Miami, Florida, United States	25.8108728999999997	-80.1905070999999907	33137
1391	Kidstown Pediatrics	 Miami	 Florida	 United States	Kidstown Pediatrics, Miami, Florida, United States	25.8569969999999998	-80.1928290000000032	33138
1392	Belkys Bravo Clinic	 Miami	 Florida	 United States	Belkys Bravo Clinic, Miami, Florida, United States	25.7505185999999995	-80.2265931000000023	2624
1393	Castro Pediatrics	 Miami	 Florida	 United States	Castro Pediatrics, Miami, Florida, United States	25.7005920000000003	-80.3427640000000025	3015
1394	University of Miami UHealth Pediatrics at Kendall	 Miami	 Florida	 United States	University of Miami UHealth Pediatrics at Kendall, Miami, Florida, United States	25.6864376000000014	-80.3506390999999951	33176
1395	S. Florida Pediatric Partners	 Miami	 Florida	 United States	S. Florida Pediatric Partners, Miami, Florida, United States	25.9047990000000006	-80.3261969999999934	1590
1396	"U.O.C. Ematologia e Terapia Cellulare - Ospedale ""C. e G. Mazzoni"" di Ascoli Piceno"		 Ascoli Piceno	 Italy	"U.O.C. Ematologia e Terapia Cellulare - Ospedale ""C. e G. Mazzoni"" di Ascoli Piceno",, Ascoli Piceno, Italy	42.851637199999999	13.6186346999999994	63100
1397	Az.Ospedaliera S.G.Moscati		 Avellino	 Italy	Az.Ospedaliera S.G.Moscati,, Avellino, Italy	40.9257305000000002	14.7995146999999996	83100
1398	UO Ematologia con trapianto-Università degli Studi di Bari Aldo Moro		 Bari	 Italy	UO Ematologia con trapianto-Università degli Studi di Bari Aldo Moro,, Bari, Italy	41.1205545999999984	16.8684745000000014	70121
1399	Azienda Ospedaliera - Papa Giovanni XXIII		 Bergamo	 Italy	Azienda Ospedaliera - Papa Giovanni XXIII,, Bergamo, Italy	45.6858866999999975	9.63727680000000042	24129
1400	"Istituto di Ematologia ""Lorenzo e A. Seragnoli"" - Università degli Studi di Bologna - Policlinico S. Orsola - Malpighi"		 Bologna	 Italy	"Istituto di Ematologia ""Lorenzo e A. Seragnoli"" - Università degli Studi di Bologna - Policlinico S. Orsola - Malpighi",, Bologna, Italy	44.4968776999999989	11.3524089000000004	40126
1401	Divisione di Ematologia Ospedale A. Perrino		 Brindisi	 Italy	Divisione di Ematologia Ospedale A. Perrino,, Brindisi, Italy	40.6242380999999995	17.9144472999999991	72100
1402	"Università di Catania - Cattedra di Ematologia - Ospedale ""Ferrarotto"""		 Catania	 Italy	"Università di Catania - Cattedra di Ematologia - Ospedale ""Ferrarotto""",, Catania, Italy	37.5035646999999983	15.0864981	95124
1403	Unità di Ricerca e di Malattie del sangue - Ematologia San Luca Vecchio Pad. 16 - 1° Piano		 Firenze	 Italy	Unità di Ricerca e di Malattie del sangue - Ematologia San Luca Vecchio Pad. 16 - 1° Piano,, Firenze, Italy	43.8072546000000003	11.2470215000000007	50134
1404	Unità Operative Complesse di Ematologia 1 e 2 Centro Trapianti di Midollo dell'IRCCS AOU San Martino-IST		 Genova	 Italy	Unità Operative Complesse di Ematologia 1 e 2 Centro Trapianti di Midollo dell'IRCCS AOU San Martino-IST,, Genova, Italy	44.4075380000000024	8.97034099999999945	16132
1405	ASL Le/1 P.O. Vito Fazzi - U.O. di Ematologia ed UTIE		 Lecce	 Italy	ASL Le/1 P.O. Vito Fazzi - U.O. di Ematologia ed UTIE,, Lecce, Italy	40.3298525000000012	18.1571710000000017	73100
1406	U.O. di Ematologia- Ospedale dell'Angelo - Mestre		 Mestre	 Italy	U.O. di Ematologia- Ospedale dell'Angelo - Mestre,, Mestre, Italy	45.5138500999999991	12.2230153999999995	30174
1407	Fondazione IRCCS Ca' Granda Ospedale Maggiore Policlinico UOC Oncoematologia- Padiglione Marcora 2° piano		 Milano	 Italy	Fondazione IRCCS Ca' Granda Ospedale Maggiore Policlinico UOC Oncoematologia- Padiglione Marcora 2° piano,, Milano, Italy	45.4588217000000014	9.20008559999999953	20122
1408	Fondazione IRCCS Ca' Granda Ospedale Maggiore Policlinico UOC Oncoematologia- Padiglione Marcora 2° piano		 Milano	 Italy	Fondazione IRCCS Ca' Granda Ospedale Maggiore Policlinico UOC Oncoematologia- Padiglione Marcora 2° piano,, Milano, Italy	45.4588217000000014	9.20008559999999953	20122
1409	"Azienda Ospedaliera di Rilievo Nazionale ""A. Cardarelli"""		 Napoli	 Italy	"Azienda Ospedaliera di Rilievo Nazionale ""A. Cardarelli""",, Napoli, Italy	40.8651106000000013	14.2258286999999992	80131
1410	"Azienda Ospedaliera Universitaria - Università degli Studi di Napoli ""Federico II"" - Facoltà di Medicina e Chirurgia"		 Napoli	 Italy	"Azienda Ospedaliera Universitaria - Università degli Studi di Napoli ""Federico II"" - Facoltà di Medicina e Chirurgia",, Napoli, Italy	40.8699121000000005	14.2175657999999991	80131
1411	S.C.D.U. Ematologia - DIMECS e Dipartimento Oncologico - Università del Piemonte Orientale Amedeo Avogadro		 Novara	 Italy	S.C.D.U. Ematologia - DIMECS e Dipartimento Oncologico - Università del Piemonte Orientale Amedeo Avogadro,, Novara, Italy	45.3275748000000007	8.42456340000000026	13100
1412	Dip. di Scienze Cliniche e Biologiche - Ospedale S. Luigi Gonzaga-Medicina Interna 2		 Orbassano	 Italy	Dip. di Scienze Cliniche e Biologiche - Ospedale S. Luigi Gonzaga-Medicina Interna 2,, Orbassano, Italy	45.0294750999999991	7.55800629999999884	10043
1413	"U.O. di Oncoematologia -plesso ospedaliero ""A. Tortora"" di Pagani"		 Pagani	 Italy	"U.O. di Oncoematologia -plesso ospedaliero ""A. Tortora"" di Pagani",, Pagani, Italy	41.8719400000000022	12.56738	Italy
1414	"Ospedali Riuniti ""Villa Sofia-Cervello"""		 Palermo	 Italy	"Ospedali Riuniti ""Villa Sofia-Cervello""",, Palermo, Italy	38.1545297999999988	13.3138740999999996	90146
1415	Sezione di Ematologia ed Immunologia Clinica - Ospedale S.Maria della Misericordia		 Perugia	 Italy	Sezione di Ematologia ed Immunologia Clinica - Ospedale S.Maria della Misericordia,, Perugia, Italy	43.0799498000000014	12.3549521000000002	06129
1416	Ematologia Clinica - Azienda USL di Pescara		 Pescara	 Italy	Ematologia Clinica - Azienda USL di Pescara,, Pescara, Italy	42.4629976000000013	14.2001150999999997	65124
1417	"Dipartimento Emato-Oncologia A.O.""Bianchi-Melacrino-Morelli"""		 Reggio Calabria	 Italy	"Dipartimento Emato-Oncologia A.O.""Bianchi-Melacrino-Morelli""",, Reggio Calabria, Italy	38.1131043000000034	15.6595057000000004	89124
1418	Complesso Ospedaliero S. Giovanni Addolorata		 Roma	 Italy	Complesso Ospedaliero S. Giovanni Addolorata,, Roma, Italy	41.8856499999999983	12.5024131999999994	00184
1419	Università Cattolica del Sacro Cuore - Policlinico A. Gemelli		 Roma	 Italy	Università Cattolica del Sacro Cuore - Policlinico A. Gemelli,, Roma, Italy	41.9314107999999877	12.4303547000000005	00168
1420	Università degli Studi - Policlinico di Tor Vergata		 Roma	 Italy	Università degli Studi - Policlinico di Tor Vergata,, Roma, Italy	41.8520309000000026	12.6289995000000008	00133
1421	UOC Medicina Trasfusionale e Cellule Staminali Azienda Ospedaliera San Camillo Forlanini		 Roma	 Italy	UOC Medicina Trasfusionale e Cellule Staminali Azienda Ospedaliera San Camillo Forlanini,, Roma, Italy	41.8697743000000031	12.4557236000000007	00152
1422	 Hematology Department		 Rome	 Italy	 Hematology Department,, Rome, Italy	41.9027834999999982	12.4963654999999996	Italy
1423	"Università degli Studi ""Sapienza"" - Dip Biotecnologie Cellulari ed Ematologia - Divisione di Ematologia"		 Rome	 Italy	"Università degli Studi ""Sapienza"" - Dip Biotecnologie Cellulari ed Ematologia - Divisione di Ematologia",, Rome, Italy	41.9113840999999994	12.5136634999999998	00161
1424	Sezione di Ematologia Cancer Center Humanitas		 Rozzano	 Italy	Sezione di Ematologia Cancer Center Humanitas,, Rozzano, Italy	45.3720270000000028	9.16749800000000015	20089
1425	Istituto di Ematologia - IRCCS Ospedale Casa Sollievo della Sofferenza		 San Giovanni Rotondo	 Italy	Istituto di Ematologia - IRCCS Ospedale Casa Sollievo della Sofferenza,, San Giovanni Rotondo, Italy	41.7089888000000002	15.7073145000000007	71013
1426	Dipartimento di Oncologia ed Ematologia S.C. Ematologia 2 A.O. Città della Salute e della Scienza di Torino San Giovanni Battista		 Torino	 Italy	Dipartimento di Oncologia ed Ematologia S.C. Ematologia 2 A.O. Città della Salute e della Scienza di Torino San Giovanni Battista,, Torino, Italy	45.0386974999999978	7.6726283000000004	10126
1427	 P.O. Umberto I-Ospedale Torino		 Torino	 Italy	 P.O. Umberto I-Ospedale Torino,, Torino, Italy	45.0517804999999996	7.66548909999999939	10128
1428	 P.O. Umberto I-Ospedale		 Torino	 Italy	 P.O. Umberto I-Ospedale,, Torino, Italy	45.0517804999999996	7.66548909999999939	10128
1429	Università degli Studi di Verona - A. O. - Istituti Ospitalieri di Verona- Div. di Ematologia - Policlinico G.B. Rossi		 Verona	 Italy	Università degli Studi di Verona - A. O. - Istituti Ospitalieri di Verona- Div. di Ematologia - Policlinico G.B. Rossi,, Verona, Italy	45.4370625999999973	11.0036321000000008	37129
1430	Fuwai Hospital		 Beijing	 China	Fuwai Hospital,, Beijing, China	39.9266359999999878	116.3446	100037
1431	Justus-Liebig University		 Giessen	 Germany	Justus-Liebig University,, Giessen, Germany	50.5804673000000022	8.67714029999999958	35390
1432	Papworth Hospital NHS Foundation Trust		 Cambridge	 United Kingdom	Papworth Hospital NHS Foundation Trust,, Cambridge, United Kingdom	52.2486498000000026	-0.115527400000000002	CB23 3RE
1433	 Imperial College NHS Trust		 London	 United Kingdom	 Imperial College NHS Trust,, London, United Kingdom	51.5173028999999971	-0.173482400000000009	W2 1NY
1434	Royal Hallamshire Hospital		 Sheffield	 United Kingdom	Royal Hallamshire Hospital,, Sheffield, United Kingdom	53.3784721999999974	-1.49346500000000004	S10 2JF
1435	McLean Hospital	 Belmont	 Massachusetts	 United States	McLean Hospital, Belmont, Massachusetts, United States	42.3932028999999986	-71.1909083000000038	02478
1436	University Associates in OBGYN office	 East Setauket	 New York	 United States	University Associates in OBGYN office, East Setauket, New York, United States	40.9055587000000003	-73.0903593000000029	6400
1437	Antrim Area Hospital Renal Unit		 Antrim	 United Kingdom	Antrim Area Hospital Renal Unit,, Antrim, United Kingdom	54.7329699999999875	-6.18594639999999973	BT41 2RL
1438	 Department of Surgery		 Aalborg	 Denmark	 Department of Surgery,, Aalborg, Denmark	57.0488195000000005	9.92174699999999987	Denmark
1439	 Department of Surgery		 Aarhus C	 Denmark	 Department of Surgery,, Aarhus C, Denmark	56.1460464999999971	10.2027260999999996	8000
1440	 Department of Surgery		 Herning	 Denmark	 Department of Surgery,, Herning, Denmark	56.1385569999999987	8.96732199999999935	7400
1441	 Department of Surgery		 Randers	 Denmark	 Department of Surgery,, Randers, Denmark	56.4605839999999972	10.0365389999999994	Denmark
1442	Envida - De Wilgenhof	 Bunde	 Limburg	 Netherlands	Envida - De Wilgenhof, Bunde, Limburg, Netherlands	50.8942472000000024	5.73291079999999997	6241 BH
1443	Envida - De Bron	 Eijsden	 Limburg	 Netherlands	Envida - De Bron, Eijsden, Limburg, Netherlands	50.7782662999999985	5.71046019999999999	6245 EL
1444	Envida - Klein Gulpen	 Gulpen	 Limburg	 Netherlands	Envida - Klein Gulpen, Gulpen, Limburg, Netherlands	50.8166342000000029	5.9017874999999993	6271 AA
1445	Envida - Hospice Trajectum	 Maastricht	 Limburg	 Netherlands	Envida - Hospice Trajectum, Maastricht, Limburg, Netherlands	50.8471830000000082	5.68385889999999971	6211 LS
1446	Envida - Larisa	 Maastricht	 Limburg	 Netherlands	Envida - Larisa, Maastricht, Limburg, Netherlands	50.845386299999987	5.68344989999999939	6211 LX
1447	Envida - De Mins	 Maastricht	 Limburg	 Netherlands	Envida - De Mins, Maastricht, Limburg, Netherlands	50.8618921999999998	5.64953259999999968	6218 SM
1448	Envida - Koepelhof	 Maastricht	 Limburg	 Netherlands	Envida - Koepelhof, Maastricht, Limburg, Netherlands	50.8467312000000007	5.70829129999999996	6224 LW
1449	Envida - De Zeven Bronnen	 Maastricht	 Limburg	 Netherlands	Envida - De Zeven Bronnen, Maastricht, Limburg, Netherlands	50.8607118999999983	5.72612719999999964	6225 AG
1450	Envida - Hagerpoort	 Maastricht	 Limburg	 Netherlands	Envida - Hagerpoort, Maastricht, Limburg, Netherlands	50.866742500000008	5.73448509999999967	6225 GA
1451	Envida - Grubbeveld	 Maastricht	 Limburg	 Netherlands	Envida - Grubbeveld, Maastricht, Limburg, Netherlands	50.8498280000000022	5.73616050000000044	6226 NB
1452	Envida - Croonenhoff	 Maastricht	 Limburg	 Netherlands	Envida - Croonenhoff, Maastricht, Limburg, Netherlands	50.8359379999999987	5.72840460000000018	6227 SZ
1453	Envida - La Valence	 Maastricht	 Limburg	 Netherlands	Envida - La Valence, Maastricht, Limburg, Netherlands	50.8264718999999872	5.70930669999999996	6229 VN
1454	Envida - De Lommer	 Margraten	 Limburg	 Netherlands	Envida - De Lommer, Margraten, Limburg, Netherlands	50.8204052000000033	5.82427829999999958	6269 DD
1455	Envida - Appelgaard	 Margraten	 Limburg	 Netherlands	Envida - Appelgaard, Margraten, Limburg, Netherlands	50.8204052000000033	5.82427829999999958	6269 DD
1456	Envida - Beukeloord	 Meerssen	 Limburg	 Netherlands	Envida - Beukeloord, Meerssen, Limburg, Netherlands	50.8858456000000032	5.75238719999999937	6231 JZ
1457	Salford Royal NHS Foundation Trust	 Salford	 Manchester	 United Kingdom	Salford Royal NHS Foundation Trust, Salford, Manchester, United Kingdom	53.487482	-2.32389549999999989	M6 8HD
1458	Salford Royal NHS Foundation Trust	 Salford	 Manchester	 United Kingdom	Salford Royal NHS Foundation Trust, Salford, Manchester, United Kingdom	53.487482	-2.32389549999999989	M6 8HD
1459	Hue University of Medicine and Pharmacy	 Hue	 Thua Thien Hue	 Vietnam	Hue University of Medicine and Pharmacy, Hue, Thua Thien Hue, Vietnam	16.4590907999999985	107.587408400000001	Vietnam
1460	Shandong Provincial Center for Disease Control and Prevention	 Jinan	 Shandong	 China	Shandong Provincial Center for Disease Control and Prevention, Jinan, Shandong, China	33.7993177999999972	-84.328007999999997	30333
1461	The Ohio State University Wexner Medical Center Jameson Crane Sports Medicine Institute	 Columbus	 Ohio	 United States	The Ohio State University Wexner Medical Center Jameson Crane Sports Medicine Institute, Columbus, Ohio, United States	40.0178079000000011	-83.0316311999999925	43202
1462	University of Massachusetts	 Amherst	 Massachusetts	 United States	University of Massachusetts, Amherst, Massachusetts, United States	42.3911568999999986	-72.5267120999999975	01003
1463	University of Massachusetts	 Amherst	 Massachusetts	 United States	University of Massachusetts, Amherst, Massachusetts, United States	42.3911568999999986	-72.5267120999999975	01003
1464	University of Massachusetts	 Amherst	 Massachusetts	 United States	University of Massachusetts, Amherst, Massachusetts, United States	42.3911568999999986	-72.5267120999999975	01003
1465	University of Manitoba	 Winnipeg	 Manitoba	 Canada	University of Manitoba, Winnipeg, Manitoba, Canada	49.8075007999999997	-97.1366258999999985	R3T 2N2
1466	Trøgstad Community Health Center		 Askim	 Norway	Trøgstad Community Health Center,, Askim, Norway	37.0059891000000007	-94.7381570000000011	66713
1467	Rælingen Community Health Center		 Flateby	 Norway	Rælingen Community Health Center,, Flateby, Norway	59.8341597999999877	11.1401135999999994	Norway
1468	Familie Hus Halden		 Halden	 Norway	Familie Hus Halden,, Halden, Norway	59.1274039999999985	11.3884161000000006	1777
1469	Aurskog- Høland Community Health Center		 Høland	 Norway	Aurskog- Høland Community Health Center,, Høland, Norway	59.8457052999999988	11.5256024000000004	Norway
1470	Jevnaker Community Health Center		 Jevnaker	 Norway	Jevnaker Community Health Center,, Jevnaker, Norway	60.2407558000000023	10.3834786000000001	Norway
1471	Lillestrøm Communicy Health Center		 Lillestrøm	 Norway	Lillestrøm Communicy Health Center,, Lillestrøm, Norway	59.9536718000000022	11.0407677	2000
1472	Nesodden Community Health Center		 Nesoddtangen	 Norway	Nesodden Community Health Center,, Nesoddtangen, Norway	37.1697501000000017	-94.8434003999999931	66725
1473	Oppegård Community Health Center		 Oppegård	 Norway	Oppegård Community Health Center,, Oppegård, Norway	37.1697501000000017	-94.8434003999999931	66725
1474	Grorud Community Health Center		 Oslo	 Norway	Grorud Community Health Center,, Oslo, Norway	37.0059891000000007	-94.7381570000000011	66713
1475	Bjerke Community Center		 Oslo	 Norway	Bjerke Community Center,, Oslo, Norway	59.9366303999999985	10.8253921000000002	0598
1476	Health Centre Alna		 Oslo	 Norway	Health Centre Alna,, Oslo, Norway	59.9270498000000131	10.8646449	0675
1477	Stovner Community Health Center		 Oslo	 Norway	Stovner Community Health Center,, Oslo, Norway	59.9608532999999895	10.9223899000000007	Norway
1478	Rakkestad Community Health Center		 Rakkestad	 Norway	Rakkestad Community Health Center,, Rakkestad, Norway	59.4255463999999876	11.3430388999999998	Norway
1479	Skedsmo Community Health Center		 Skedsmokorset	 Norway	Skedsmo Community Health Center,, Skedsmokorset, Norway	59.9536718000000022	11.0407677	2000
1480	Langhus		 Ski	 Norway	Langhus,, Ski, Norway	59.755223100000002	10.8461812999999996	Norway
1481	Ski Community Health Center		 Ski	 Norway	Ski Community Health Center,, Ski, Norway	60.4720239999999905	8.46894599999999897	Norway
1482	Våler Community Health Center		 Våler	 Norway	Våler Community Health Center,, Våler, Norway	37.1697501000000017	-94.8434003999999931	66725
1483	Nordberg		 Ås	 Norway	Nordberg,, Ås, Norway	60.4720239999999905	8.46894599999999897	Norway
1484	Ås Community Health Center		 Ås	 Norway	Ås Community Health Center,, Ås, Norway	59.6647828999999987	10.7898213999999992	1430
1485	First Affiliated Hospital of Guangdong Pharmaceutical University	 Guangzhou	 Guangdong	 China	First Affiliated Hospital of Guangdong Pharmaceutical University, Guangzhou, Guangdong, China	23.1272458000000007	113.295668199999994	510080
1486	Substance Abuse Treatment Center (SATU)	 New Haven	 Connecticut	 United States	Substance Abuse Treatment Center (SATU), New Haven, Connecticut, United States	41.2894852000000014	-72.9298879999999912	06511
1487	Substance Abuse Treatment Center (SATU)	 New Haven	 Connecticut	 United States	Substance Abuse Treatment Center (SATU), New Haven, Connecticut, United States	41.2894852000000014	-72.9298879999999912	06511
1488	Substance Abuse Treatment Center (SATU)	 New Haven	 Connecticut	 United States	Substance Abuse Treatment Center (SATU), New Haven, Connecticut, United States	41.2894852000000014	-72.9298879999999912	06511
1489	The second Affiliated Hospital and Yuying Children's Hospital of Wenzhou Medical University	 Wenzhou	 Zhejiang	 China	The second Affiliated Hospital and Yuying Children's Hospital of Wenzhou Medical University, Wenzhou, Zhejiang, China	28.0062110000000004	120.672250000000005	325003
1490	 University of Oxford		 Oxford	 United Kingdom	 University of Oxford,, Oxford, United Kingdom	51.7548164000000028	-1.25436679999999989	OX1 2JD
1491	RSU QOlbu Insan Mulia	 Batang	 Central Java	 Indonesia	RSU QOlbu Insan Mulia, Batang, Central Java, Indonesia	-6.91610229999999859	109.745794500000002	51216
1492	Puskesmas Subah	 Batang	 Central Java	 Indonesia	Puskesmas Subah, Batang, Central Java, Indonesia	-6.97181189999999962	109.876828099999997	51262
1493	RSUD Batang	 Batang	 Jawa Tengah	 Indonesia	RSUD Batang, Batang, Jawa Tengah, Indonesia	-6.91471109999999989	109.719010600000004	51215
1494	Puskesmas Bawang	 Batang	 Jawa Tengah	 Indonesia	Puskesmas Bawang, Batang, Jawa Tengah, Indonesia	-7.10509909999999856	109.916010200000002	51274
1495	RSUD Brebes	 Brebes	 Jawa Tengah	 Indonesia	RSUD Brebes, Brebes, Jawa Tengah, Indonesia	-6.87419399999999925	109.049105999999995	52212
1496	Puskesmas Kecipir	 Brebes	 Jawa Tengah	 Indonesia	Puskesmas Kecipir, Brebes, Jawa Tengah, Indonesia	-6.8633229999999994	108.832931400000007	52255
1497	Puskesmas Ketanggungan	 Brebes	 Jawa Tengah	 Indonesia	Puskesmas Ketanggungan, Brebes, Jawa Tengah, Indonesia	-6.94163999999999959	108.888189999999994	52263
1498	RSU Alam Medika Bumi Ayu	 Brebes	 Jawa Tengah	 Indonesia	RSU Alam Medika Bumi Ayu, Brebes, Jawa Tengah, Indonesia	-7.26265680000000025	109.010572199999999	52273
1499	AIDS Project Los Angeles	 Los Angeles	 California	 United States	AIDS Project Los Angeles, Los Angeles, California, United States	34.0187270999999996	-118.356329099999996	5309
1500	Ain Shams University Hospitals (Demerdash)		 Cairo	 Egypt	Ain Shams University Hospitals (Demerdash),, Cairo, Egypt	30.0727358000000002	31.2767634999999906	Egypt
1501	Brigham and Women's Hospital	 Boston	 Massachusetts	 United States	Brigham and Women's Hospital, Boston, Massachusetts, United States	42.3362325000000013	-71.1065442999999959	02115
1502	Bicester Health Centre		 Bicester	 United Kingdom	Bicester Health Centre,, Bicester, United Kingdom	51.8967644000000021	-1.15721389999999991	OX26 6AT
1503	Oak Tree Surgery		 Bridgend	 United Kingdom	Oak Tree Surgery,, Bridgend, United Kingdom	51.5070233000000002	-3.55898950000000003	CF31 2PQ
1504	Bromley Common Practice		 Bromley	 United Kingdom	Bromley Common Practice,, Bromley, United Kingdom	51.3881278000000066	0.0383843999999999991	BR2 9GT
1505	Great Sutton Medical Centre		 Chester	 United Kingdom	Great Sutton Medical Centre,, Chester, United Kingdom	53.2764448000000002	-2.93757629999999992	CH66 3SP
1506	Woodlands Practice		 Chislehurst	 United Kingdom	Woodlands Practice,, Chislehurst, United Kingdom	51.4205338000000083	0.0649692999999999937	BR7 6DB
1507	Regent House Surgery		 Chorley	 United Kingdom	Regent House Surgery,, Chorley, United Kingdom	53.650521299999987	-2.63598979999999994	PR7 2DH
1508	Creffield Medical Centre		 Colchester	 United Kingdom	Creffield Medical Centre,, Colchester, United Kingdom	51.8824552999999966	0.893245299999999909	CO2 7GH
1509	Mattishall & Lenwade Surgeries		 Dereham	 United Kingdom	Mattishall & Lenwade Surgeries,, Dereham, United Kingdom	52.659027199999997	1.0333768000000001	NR20 3QA
1510	Conisbrough Group Practice		 Doncaster	 United Kingdom	Conisbrough Group Practice,, Doncaster, United Kingdom	53.4822222999999966	-1.23755839999999995	DN12 3JW
1511	Scott Practice		 Doncaster	 United Kingdom	Scott Practice,, Doncaster, United Kingdom	53.5070697000000024	-1.15139820000000004	DN4 0TG
1512	Bentley Surgery		 Doncaster	 United Kingdom	Bentley Surgery,, Doncaster, United Kingdom	53.5466193999999973	-1.14656829999999998	DN5 0AT
1513	Oak Lodge Medical Centre		 Edgware	 United Kingdom	Oak Lodge Medical Centre,, Edgware, United Kingdom	51.6043694999999971	-0.271716000000000013	HA8 0AP
1514	Falkland Surgery		 Great Yarmouth	 United Kingdom	Falkland Surgery,, Great Yarmouth, United Kingdom	52.5727369999999965	1.70140939999999996	NR31 8RW
1515	Freshney (Littlefields) Green Primary Care Centre		 Grimsby	 United Kingdom	Freshney (Littlefields) Green Primary Care Centre,, Grimsby, United Kingdom	53.5643322000000026	-0.113838300000000003	DN34 4GB
1516	Bay Medical Group		 Heysham	 United Kingdom	Bay Medical Group,, Heysham, United Kingdom	54.041692800000007	-2.89399890000000015	LA3 2LE
1517	Hoveton and Wroxham Medical Centre		 Hoveton	 United Kingdom	Hoveton and Wroxham Medical Centre,, Hoveton, United Kingdom	52.7177067000000008	1.4221410000000001	NR12 8DU
1518	Mathukia's Surgery		 Ilford	 United Kingdom	Mathukia's Surgery,, Ilford, United Kingdom	51.5498797000000124	0.0753395999999999927	IG1 2SF
1519	Station House Surgery		 Kendal	 United Kingdom	Station House Surgery,, Kendal, United Kingdom	54.3319705999999982	-2.73978069999999985	LA9 6SA
1520	Queen Square Medical Practice		 Lancaster	 United Kingdom	Queen Square Medical Practice,, Lancaster, United Kingdom	54.0461809000000031	-2.80088690000000007	LA1 1RP
1521	Brownlow Health		 Liverpool	 United Kingdom	Brownlow Health,, Liverpool, United Kingdom	53.401842000000002	-2.98491829999999991	L1 5DL
1522	William Harvey Heart Centre		 London	 United Kingdom	William Harvey Heart Centre,, London, United Kingdom	51.5224824000000012	-0.0979526000000000008	EC1M
1523	Tottenham Health Centre		 London	 United Kingdom	Tottenham Health Centre,, London, United Kingdom	51.6045528999999874	-0.068277400000000002	N17 8AH
1524	Hornsey Rise Health Centre		 London	 United Kingdom	Hornsey Rise Health Centre,, London, United Kingdom	51.5714469999999992	-0.124980999999999995	N19 3YU
1525	Keats Medical Practice		 London	 United Kingdom	Keats Medical Practice,, London, United Kingdom	51.5549139000000025	-0.171684100000000006	NW3 1NR
1526	Hampstead Group Practice		 London	 United Kingdom	Hampstead Group Practice,, London, United Kingdom	51.5535376999999997	-0.163083000000000006	NW3 2QU
1527	Parliament Hill Medical Centre		 London	 United Kingdom	Parliament Hill Medical Centre,, London, United Kingdom	51.5553011000000012	-0.14541090000000001	NW5 1TR
1528	West Hampstead Medical Centre		 London	 United Kingdom	West Hampstead Medical Centre,, London, United Kingdom	51.5499012999999877	-0.196329399999999987	NW6 1TP
1529	Everglade Medical Practice		 London	 United Kingdom	Everglade Medical Practice,, London, United Kingdom	51.6015723000000008	-0.244199500000000014	NW9 5XT
1530	Vanbrugh Group Practice		 London	 United Kingdom	Vanbrugh Group Practice,, London, United Kingdom	51.4855507999999986	0.00854949999999999981	SE10 9GB
1531	Hurley Clinic		 London	 United Kingdom	Hurley Clinic,, London, United Kingdom	51.4906758999999994	-0.107071799999999995	SE11 4HJ
1532	Albion Street Practice		 London	 United Kingdom	Albion Street Practice,, London, United Kingdom	51.5010072999999977	-0.0506426999999999988	SE16 7JX
1533	Paxton Green Group Practice		 London	 United Kingdom	Paxton Green Group Practice,, London, United Kingdom	51.4283434999999969	-0.08631599999999999	SE21 8AU
1534	Honor Oak Group Practice		 London	 United Kingdom	Honor Oak Group Practice,, London, United Kingdom	51.4582720999999879	-0.0414121000000000003	SE4 2LA
1535	Open Door Surgery		 London	 United Kingdom	Open Door Surgery,, London, United Kingdom	51.4431632000000008	-0.1557423	SW12 8EU
1536	Mayfield Surgery		 London	 United Kingdom	Mayfield Surgery,, London, United Kingdom	51.4483583999999965	-0.237336999999999992	SW15 4AA
1537	The Exchange Surgery		 London	 United Kingdom	The Exchange Surgery,, London, United Kingdom	51.4327540000000027	-0.127843000000000012	SW16 2ST
1538	Streatham Common Practice		 London	 United Kingdom	Streatham Common Practice,, London, United Kingdom	51.4159805000000034	-0.129043999999999992	SW16 5LS
1539	Riverside Medical Practice		 London	 United Kingdom	Riverside Medical Practice,, London, United Kingdom	51.4851499999999973	-0.126508000000000009	SW8 2JB
1540	Watling Medical Centre		 London	 United Kingdom	Watling Medical Centre,, London, United Kingdom	51.6213580000000007	-0.296441999999999983	HA7 4NU
1541	Rosedale Surgery		 Lowestoft	 United Kingdom	Rosedale Surgery,, Lowestoft, United Kingdom	52.4572448999999992	1.7058625999999999	NR33 8LG
1542	Mitcham Family Practice		 Mitcham	 United Kingdom	Mitcham Family Practice,, Mitcham, United Kingdom	51.4112233999999972	-0.167562700000000009	CR4 3HW
1543	Vale of Neath		 Neath	 United Kingdom	Vale of Neath,, Neath, United Kingdom	51.6799766000000034	-4.15596750000000004	SA15 1LF
1544	Pendle View Medical Centre		 Nelson	 United Kingdom	Pendle View Medical Centre,, Nelson, United Kingdom	53.8262489999999971	-2.2318929999999999	BB9 5RZ
1545	Long Stratton Medical Partnership		 Norwich	 United Kingdom	Long Stratton Medical Partnership,, Norwich, United Kingdom	52.4926328000000026	1.227468	NR15 2UY
1546	Clarence Medical Centre		 Rhyl	 United Kingdom	Clarence Medical Centre,, Rhyl, United Kingdom	53.317350900000001	-3.49132549999999986	LL18 1DA
1547	North House Surgery		 Ripon	 United Kingdom	North House Surgery,, Ripon, United Kingdom	54.1391042999999996	-1.52388879999999993	HG4 1HL
1548	Beechtree Surgery		 Selby	 United Kingdom	Beechtree Surgery,, Selby, United Kingdom	53.7748141000000004	-1.08051049999999993	YO8 9AJ
1549	Snaith & Rawcliffe Medical Group (The Marshes Surgery)		 Snaith	 United Kingdom	Snaith & Rawcliffe Medical Group (The Marshes Surgery),, Snaith, United Kingdom	53.6887854000000004	-1.02434669999999994	DN14 9DY
1550	Kings Road Surgery		 Swansea	 United Kingdom	Kings Road Surgery,, Swansea, United Kingdom	51.5737590000000026	-4.00375619999999977	SA3 4AJ
1551	Strawberry Place Surgery		 Swansea	 United Kingdom	Strawberry Place Surgery,, Swansea, United Kingdom	51.6660978000000028	-3.92668160000000022	SA6 7AQ
1552	School Lane Surgery		 Thetford	 United Kingdom	School Lane Surgery,, Thetford, United Kingdom	52.4124630000000025	0.749271999999999938	IP24 2AG
1553	Brigstock & South Norwood Partnership		 Thornton Heath	 United Kingdom	Brigstock & South Norwood Partnership,, Thornton Heath, United Kingdom	51.3948426999999981	-0.110004099999999994	CR7 7JN
1554	Village Practice Thornton		 Thornton-Cleveleys	 United Kingdom	Village Practice Thornton,, Thornton-Cleveleys, United Kingdom	53.8767449999999997	-3.01835999999999993	FY5 2TZ
1555	Cleveleys Group Practice		 Thornton-Cleveleys	 United Kingdom	Cleveleys Group Practice,, Thornton-Cleveleys, United Kingdom	53.8749340999999973	-3.04263890000000004	FY5 3LF
1556	Wallington Family Practice		 Wallington	 United Kingdom	Wallington Family Practice,, Wallington, United Kingdom	51.357273499999998	-0.150881299999999996	United Kingdom
1557	Windermere & Bowness Surgery		 Windermere	 United Kingdom	Windermere & Bowness Surgery,, Windermere, United Kingdom	54.3708270000000127	-2.91337299999999999	LA23 2EG
1558	Hope Family Medical Centre		 Wrexham	 United Kingdom	Hope Family Medical Centre,, Wrexham, United Kingdom	53.1119385999999878	-3.03206610000000021	LL12 9NL
1559	Jorvik Gillygate Practice		 York	 United Kingdom	Jorvik Gillygate Practice,, York, United Kingdom	53.9600278000000131	-1.07631140000000003	YO1 7NP
1560	Linköping University	 Linköping	 Östergötland	 Sweden	Linköping University, Linköping, Östergötland, Sweden	58.3978364000000028	15.5760071999999994	581 83
1561	Northwestern University	 Chicago	 Illinois	 United States	Northwestern University, Chicago, Illinois, United States	41.894582800000002	-87.6231705999999946	2834
1562	Rush University College of Nursing	 Chicago	 Illinois	 United States	Rush University College of Nursing, Chicago, Illinois, United States	41.8737520000000032	-87.6692019999999985	60612
1563	Centro Terapéutico Anün	 Coronel	 Concepción	 Chile	Centro Terapéutico Anün, Coronel, Concepción, Chile	-37.0280119999999968	-73.1384707999999932	Chile
1565	COSAM Concepción		 Concepción	 Chile	COSAM Concepción,, Concepción, Chile	-36.8312358000000017	-73.0532122999999984	Chile
1566	Psychiatry Service of Hospital Guillermo Grant Benavente		 Concepción	 Chile	Psychiatry Service of Hospital Guillermo Grant Benavente,, Concepción, Chile	-36.8271007000000026	-73.0413808999999929	Chile
1567	Western Psychiatric Institute and Clinic	 Pittsburgh	 Pennsylvania	 United States	Western Psychiatric Institute and Clinic, Pittsburgh, Pennsylvania, United States	40.4433937000000014	-79.9599996999999973	15213
1568	Foothills Medical Centre	 Calgary	 Alberta	 Canada	Foothills Medical Centre, Calgary, Alberta, Canada	51.0644909999999967	-114.134061000000003	T2N 2T9
1569	Justina Liu		 Hong Kong	 Hong Kong	Justina Liu,, Hong Kong, Hong Kong	22.3964280000000002	114.109497000000005	Hong Kong
1570	Abington Hospital Jefferson Health	 Abington	 Pennsylvania	 United States	Abington Hospital Jefferson Health, Abington, Pennsylvania, United States	40.1194399999999973	-75.1206349999999929	19001
1571	Cincinnati Children's Hospital Medical Center	 Cincinnati	 Ohio	 United States	Cincinnati Children's Hospital Medical Center, Cincinnati, Ohio, United States	39.1408656999999991	-84.5022079000000019	45229
1572	Baylor College of Medicine	 Houston	 Texas	 United States	Baylor College of Medicine, Houston, Texas, United States	29.7105289999999904	-95.3962409999999892	3411
1573	The Hong Kong Polytechnic Universtiy		 Hong Kong	 Hong Kong	The Hong Kong Polytechnic Universtiy,, Hong Kong, Hong Kong	22.3045718999999991	114.179564200000002	Hong Kong
1574	San Francisco VA Medical Center	 San Francisco	 California	 United States	San Francisco VA Medical Center, San Francisco, California, United States	37.7824978000000016	-122.505346200000005	94121
1575	University of California San Francisco	 San Francisco	 California	 United States	University of California San Francisco, San Francisco, California, United States	37.7627655000000004	-122.457752999999997	94143
1576	CentraCare Clinic Adult & Pediatric Urology	 Sartell	 Minnesota	 United States	CentraCare Clinic Adult & Pediatric Urology, Sartell, Minnesota, United States	45.5877805999999879	-94.2036538000000121	2477
1577	Lancaster Urology	 Lancaster	 Pennsylvania	 United States	Lancaster Urology, Lancaster, Pennsylvania, United States	40.0652526000000009	-76.3549974999999961	2644
1578	Shenzhen second people's hospital	 Shenzhen	 Guangdong	 China	Shenzhen second people's hospital, Shenzhen, Guangdong, China	22.5565989999999985	114.086145000000002	518029
1579	Shenzhen second people's hospital	 Shenzhen	 Guangdong	 China	Shenzhen second people's hospital, Shenzhen, Guangdong, China	22.5565989999999985	114.086145000000002	518029
1580	Baoan District central hospital of Shenzhen	 Shenzhen	 Guangdong	 China	Baoan District central hospital of Shenzhen, Shenzhen, Guangdong, China	22.6684079999999994	113.812000999999995	511700
1581	Baoan District central hospital of Shenzhen	 Shenzhen	 Guangdong	 China	Baoan District central hospital of Shenzhen, Shenzhen, Guangdong, China	22.6684079999999994	113.812000999999995	511700
1582	Baoan District central hospital of Shenzhen	 Shenzhen	 Guangdong	 China	Baoan District central hospital of Shenzhen, Shenzhen, Guangdong, China	22.6684079999999994	113.812000999999995	511700
1583	University of Maryland Medical Center	 Baltimore	 Maryland	 United States	University of Maryland Medical Center, Baltimore, Maryland, United States	39.2881658000000016	-76.6243752000000029	21201
1584	University Hospital	 Newark	 New Jersey	 United States	University Hospital, Newark, New Jersey, United States	40.7406294000000031	-74.1910883999999982	2406
1585	Center for Health and Sport Sciences	 Florianópolis	 Santa Catarina	 Brazil	Center for Health and Sport Sciences, Florianópolis, Santa Catarina, Brazil	-27.5948698000000014	-48.5482194999999876	Brazil
1586	University of Miami	 Miami	 Florida	 United States	University of Miami, Miami, Florida, United States	25.7191684999999985	-80.2771252999999945	33146
1587	University of Missouri-Kansas City	 Kansas City	 Missouri	 United States	University of Missouri-Kansas City, Kansas City, Missouri, United States	39.0335539000000011	-94.5760258999999905	64110
1588	Navy Medical Center	 San Diego	 California	 United States	Navy Medical Center, San Diego, California, United States	32.7273526000000032	-117.145891599999999	1112
1589	St Michael's Hospital	 Toronto	 Ontario	 Canada	St Michael's Hospital, Toronto, Ontario, Canada	43.6537210999999985	-79.3778066999999936	M5B 1W8
1590	Hospital of the Ludwig-Maximilians-University	 Munich	 Bavaria	 Germany	Hospital of the Ludwig-Maximilians-University, Munich, Bavaria, Germany	48.1542221999999995	11.5814205000000001	80799
1591	Oregon Health & Science University	 Portland	 Oregon	 United States	Oregon Health & Science University, Portland, Oregon, United States	45.4989097999999998	-122.685860599999998	3098
1592	Washington Center for Bleeding Disorders at Bloodworks Northwest	 Seattle	 Washington	 United States	Washington Center for Bleeding Disorders at Bloodworks Northwest, Seattle, Washington, United States	47.6332019999999972	-122.326135600000001	98102
1593	Seattle Children's Hospital	 Seattle	 Washington	 United States	Seattle Children's Hospital, Seattle, Washington, United States	47.6621517000000026	-122.280440799999994	3901
1594	Providence Sacred Heart Children's Hospital	 Spokane	 Washington	 United States	Providence Sacred Heart Children's Hospital, Spokane, Washington, United States	47.6490616999999972	-117.4135201	99204
\.


--
-- Data for Name: sitexref; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sitexref (nct_site_id, nct_number, site_id) FROM stdin;
1	NCT03769298	1
2	NCT03653546	2
3	NCT03653546	3
4	NCT03653546	4
5	NCT03653546	5
6	NCT03653546	6
7	NCT03653546	7
8	NCT03653546	8
9	NCT03653546	9
10	NCT03653546	10
11	NCT03653546	11
12	NCT03653546	12
13	NCT03653546	13
14	NCT03653546	14
15	NCT03653546	15
16	NCT03653546	16
17	NCT03653546	17
18	NCT03653546	18
19	NCT03653546	19
20	NCT03653546	20
21	NCT03653546	21
22	NCT03653546	22
23	NCT03653546	23
24	NCT03653546	24
25	NCT03653546	25
26	NCT03653546	26
27	NCT03653546	27
28	NCT03653546	28
29	NCT03653546	29
30	NCT03653546	30
31	NCT03653546	31
32	NCT03653546	32
33	NCT03653546	33
34	NCT03653546	34
35	NCT03653546	35
36	NCT03653546	36
37	NCT03653546	37
38	NCT03653546	38
39	NCT03653546	39
40	NCT03653546	40
41	NCT03653546	41
42	NCT03653546	42
43	NCT03653546	43
44	NCT03653546	44
45	NCT03653546	45
46	NCT03653546	46
47	NCT03653546	47
48	NCT03653546	48
49	NCT03653546	49
50	NCT03653546	50
51	NCT03653546	51
52	NCT03653546	52
53	NCT03653546	53
54	NCT03653546	54
55	NCT03653546	55
56	NCT03653546	56
57	NCT03653546	57
58	NCT03653546	58
59	NCT03653546	59
60	NCT03653546	60
61	NCT03641209	61
62	NCT03601000	62
63	NCT03601000	63
64	NCT03498196	64
65	NCT03498196	66
66	NCT03498196	67
67	NCT03498196	65
68	NCT03453255	68
69	NCT03420976	69
70	NCT03395288	70
71	NCT03361345	71
72	NCT03354611	72
73	NCT03334175	73
74	NCT03317327	74
75	NCT03262961	75
76	NCT03227731	76
77	NCT02786836	77
78	NCT02786836	78
79	NCT02786836	79
80	NCT02786836	80
81	NCT02786836	81
82	NCT02786836	82
83	NCT02786836	83
84	NCT02786836	84
85	NCT02786836	85
86	NCT02786836	86
87	NCT02786836	87
88	NCT01203722	88
89	NCT03837717	89
90	NCT03836508	90
91	NCT03833596	91
92	NCT03833531	92
93	NCT03833453	93
94	NCT03832712	99
95	NCT03832712	97
96	NCT03832712	95
97	NCT03832712	98
98	NCT03832712	94
99	NCT03832712	96
100	NCT03832530	100
101	NCT03830190	101
102	NCT03830008	102
103	NCT03829748	103
104	NCT03828721	104
105	NCT03827915	105
106	NCT03825146	106
107	NCT03823456	107
108	NCT03823456	108
109	NCT03818867	109
110	NCT03817489	110
111	NCT03814577	111
112	NCT03814330	112
113	NCT03813992	147
114	NCT03813992	170
115	NCT03813992	134
116	NCT03813992	148
117	NCT03813992	135
118	NCT03813992	149
119	NCT03813992	164
120	NCT03813992	150
121	NCT03813992	152
122	NCT03813992	154
123	NCT03813992	172
124	NCT03813992	130
125	NCT03813992	167
126	NCT03813992	151
127	NCT03813992	155
128	NCT03813992	136
129	NCT03813992	173
130	NCT03813992	132
131	NCT03813992	137
132	NCT03813992	169
133	NCT03813992	174
134	NCT03813992	138
135	NCT03813992	175
136	NCT03813992	153
137	NCT03813992	139
138	NCT03813992	171
139	NCT03813992	176
140	NCT03813992	133
141	NCT03813992	140
142	NCT03813992	162
143	NCT03813992	120
144	NCT03813992	163
145	NCT03813992	157
146	NCT03813992	116
147	NCT03813992	141
148	NCT03813992	121
149	NCT03813992	159
150	NCT03813992	129
151	NCT03813992	142
152	NCT03813992	114
153	NCT03813992	124
154	NCT03813992	161
155	NCT03813992	158
156	NCT03813992	128
157	NCT03813992	165
158	NCT03813992	156
159	NCT03813992	143
160	NCT03813992	118
161	NCT03813992	127
162	NCT03813992	117
163	NCT03813992	168
164	NCT03813992	115
165	NCT03813992	125
166	NCT03813992	166
167	NCT03813992	144
168	NCT03813992	119
169	NCT03813992	126
170	NCT03813992	113
171	NCT03813992	145
172	NCT03813992	160
173	NCT03813992	131
174	NCT03813992	123
175	NCT03813992	146
176	NCT03813992	122
177	NCT03813381	177
178	NCT03813069	178
179	NCT03813069	179
180	NCT03809286	180
181	NCT03807986	181
182	NCT03801772	182
183	NCT03799328	183
184	NCT03798483	184
185	NCT03796923	185
186	NCT03796793	186
187	NCT03795675	187
188	NCT03791697	188
189	NCT03790449	190
190	NCT03790449	191
191	NCT03790449	192
192	NCT03790449	193
193	NCT03790449	189
194	NCT03786432	194
195	NCT03783767	195
196	NCT03783312	196
197	NCT03783299	198
198	NCT03783299	197
199	NCT03782974	199
200	NCT03781050	200
201	NCT03778580	201
202	NCT03773575	207
203	NCT03773575	204
204	NCT03773575	202
205	NCT03773575	205
206	NCT03773575	206
207	NCT03773575	203
208	NCT03771495	208
209	NCT03771430	209
210	NCT03771430	210
211	NCT03770962	211
212	NCT03770962	212
213	NCT03770962	213
214	NCT03770507	214
215	NCT03767660	215
216	NCT03761732	216
217	NCT03761732	217
218	NCT03753932	218
219	NCT03753243	219
220	NCT03751878	220
221	NCT03749655	221
222	NCT03748914	222
223	NCT03747887	223
224	NCT03745209	224
225	NCT03743480	225
226	NCT03743480	226
227	NCT03740659	227
228	NCT03740659	228
229	NCT03740321	229
230	NCT03739528	230
231	NCT03739528	231
232	NCT03739528	232
233	NCT03739528	233
234	NCT03739528	234
235	NCT03739528	235
236	NCT03739528	236
237	NCT03739528	237
238	NCT03739528	238
239	NCT03739528	239
240	NCT03739528	240
241	NCT03739528	241
242	NCT03739528	242
243	NCT03739528	243
244	NCT03739528	244
245	NCT03739528	245
246	NCT03739528	246
247	NCT03739528	247
248	NCT03739528	248
249	NCT03739528	249
250	NCT03739528	250
251	NCT03739528	251
252	NCT03739528	252
253	NCT03739528	253
254	NCT03739528	254
255	NCT03739528	255
256	NCT03739528	256
257	NCT03739528	257
258	NCT03739528	258
259	NCT03739528	259
260	NCT03739528	260
261	NCT03739528	261
262	NCT03739528	262
263	NCT03739528	263
264	NCT03739528	264
265	NCT03739528	265
266	NCT03739528	266
267	NCT03739528	267
268	NCT03739528	268
269	NCT03739528	269
270	NCT03739528	270
271	NCT03739528	271
272	NCT03739528	272
273	NCT03739528	273
274	NCT03739528	274
275	NCT03739528	275
276	NCT03739528	276
277	NCT03739528	277
278	NCT03739528	278
279	NCT03739528	279
280	NCT03739528	280
281	NCT03739528	281
282	NCT03739528	282
283	NCT03739528	283
284	NCT03739528	284
285	NCT03739528	285
286	NCT03739528	286
287	NCT03737227	287
288	NCT03736382	288
289	NCT03736382	289
290	NCT03730454	295
291	NCT03730454	290
292	NCT03730454	294
293	NCT03730454	291
294	NCT03730454	292
295	NCT03730454	298
296	NCT03730454	296
297	NCT03730454	297
298	NCT03730454	293
299	NCT03729687	299
300	NCT03729648	300
301	NCT03729297	301
302	NCT03727321	302
303	NCT03727321	303
304	NCT03725215	304
305	NCT03725215	305
306	NCT03724383	306
307	NCT03724383	312
308	NCT03724383	311
309	NCT03724383	308
310	NCT03724383	307
311	NCT03724383	309
312	NCT03724383	310
313	NCT03723525	318
314	NCT03723525	313
315	NCT03723525	316
316	NCT03723525	322
317	NCT03723525	319
318	NCT03723525	320
319	NCT03723525	314
320	NCT03723525	321
321	NCT03723525	315
322	NCT03723525	317
323	NCT03719235	323
324	NCT03716219	324
325	NCT03714139	325
326	NCT03711630	326
327	NCT03711370	327
328	NCT03709979	328
329	NCT03704415	329
330	NCT03704415	330
331	NCT03704064	331
332	NCT03704051	332
333	NCT03699059	333
334	NCT03697837	334
335	NCT03695003	335
336	NCT03690154	336
337	NCT03690154	337
338	NCT03690154	338
339	NCT03689348	339
340	NCT03689049	340
341	NCT03689049	341
342	NCT03689049	342
343	NCT03689049	343
344	NCT03689049	344
345	NCT03689049	345
346	NCT03689049	346
347	NCT03687411	347
348	NCT03685227	348
349	NCT03682601	349
350	NCT03680833	350
351	NCT03679689	351
352	NCT03678935	352
353	NCT03675009	353
354	NCT03674996	354
355	NCT03668873	355
356	NCT03667755	356
357	NCT03667001	357
358	NCT03663075	358
359	NCT03658434	361
360	NCT03658434	360
361	NCT03658434	359
362	NCT03654508	368
363	NCT03654508	366
364	NCT03654508	363
365	NCT03654508	367
366	NCT03654508	380
367	NCT03654508	375
368	NCT03654508	364
369	NCT03654508	371
370	NCT03654508	374
371	NCT03654508	378
372	NCT03654508	362
373	NCT03654508	373
374	NCT03654508	370
375	NCT03654508	377
376	NCT03654508	365
377	NCT03654508	372
378	NCT03654508	369
379	NCT03654508	379
380	NCT03654508	376
381	NCT03648437	381
382	NCT03648060	382
383	NCT03648047	383
384	NCT03647007	384
385	NCT03647007	385
386	NCT03646357	387
387	NCT03646357	388
388	NCT03646357	389
389	NCT03646357	386
390	NCT03646240	390
391	NCT03645603	391
392	NCT03645005	393
393	NCT03645005	392
394	NCT03642769	394
395	NCT03638609	395
396	NCT03635840	396
397	NCT03632837	397
398	NCT03630770	398
399	NCT03630328	399
400	NCT03628001	400
401	NCT03625544	404
402	NCT03625544	405
403	NCT03625544	402
404	NCT03625544	403
405	NCT03625544	401
406	NCT03623880	406
407	NCT03620942	407
408	NCT03619720	408
409	NCT03618108	409
410	NCT03618017	410
411	NCT03615586	411
412	NCT03602768	412
413	NCT03602677	413
414	NCT03602677	414
415	NCT03602014	415
416	NCT03602014	416
417	NCT03600987	417
418	NCT03598114	418
419	NCT03593889	419
420	NCT03593889	420
421	NCT03593889	421
422	NCT03593889	422
423	NCT03593889	423
424	NCT03593889	424
425	NCT03593889	425
426	NCT03593889	426
427	NCT03593148	427
428	NCT03591237	429
429	NCT03591237	428
430	NCT03585920	430
431	NCT03585192	431
432	NCT03582046	432
433	NCT03582046	433
434	NCT03579303	434
435	NCT03578848	435
436	NCT03578432	436
437	NCT03577301	437
438	NCT03577301	438
439	NCT03577301	439
440	NCT03577106	440
441	NCT03577054	441
442	NCT03575026	442
443	NCT03568812	443
444	NCT03567031	444
445	NCT03567018	445
446	NCT03567018	446
447	NCT03565354	447
448	NCT03564665	448
449	NCT03562546	449
450	NCT03561961	450
451	NCT03561103	451
452	NCT03559751	452
453	NCT03559179	453
454	NCT03558763	454
455	NCT03555500	455
456	NCT03553927	456
457	NCT03553004	461
458	NCT03553004	462
459	NCT03553004	457
460	NCT03553004	458
461	NCT03553004	460
462	NCT03553004	459
463	NCT03552523	463
464	NCT03550885	464
465	NCT03543098	465
466	NCT03542383	466
467	NCT03541291	467
468	NCT03540732	468
469	NCT03540368	469
470	NCT03540134	470
471	NCT03540069	472
472	NCT03540069	473
473	NCT03540069	471
474	NCT03538730	474
475	NCT03538379	475
476	NCT03537612	476
477	NCT03535675	477
478	NCT03535675	478
479	NCT03534362	479
480	NCT03527927	480
481	NCT03527849	481
482	NCT03527121	483
483	NCT03527121	482
484	NCT03526068	484
485	NCT03526042	485
486	NCT03524703	486
487	NCT03523806	487
488	NCT03523806	488
489	NCT03523299	489
490	NCT03521960	490
491	NCT03519750	491
492	NCT03519659	492
493	NCT03518216	493
494	NCT03517397	494
495	NCT03516877	495
496	NCT03513822	496
497	NCT03512691	497
498	NCT03510195	498
499	NCT03508921	499
500	NCT03508908	500
501	NCT03507647	504
502	NCT03507647	502
503	NCT03507647	503
504	NCT03507647	501
505	NCT03503721	506
506	NCT03503721	505
507	NCT03503162	507
508	NCT03502655	508
509	NCT03502252	509
510	NCT03501316	510
511	NCT03500419	511
512	NCT03500406	513
513	NCT03500406	512
514	NCT03500367	514
515	NCT03496948	517
516	NCT03496948	515
517	NCT03496948	516
518	NCT03495791	518
519	NCT03495752	519
520	NCT03495661	520
521	NCT03495518	521
522	NCT03495089	522
523	NCT03495089	523
524	NCT03495089	524
525	NCT03494816	525
526	NCT03494816	526
527	NCT03494816	530
528	NCT03494816	527
529	NCT03494816	529
530	NCT03494816	528
531	NCT03494335	531
532	NCT03494205	532
533	NCT03492476	533
534	NCT03492476	534
535	NCT03492476	535
536	NCT03492476	536
537	NCT03491059	537
538	NCT03491046	538
539	NCT03490812	539
540	NCT03490656	540
541	NCT03489395	541
542	NCT03489395	542
543	NCT03489395	543
544	NCT03489395	544
545	NCT03489395	545
546	NCT03489395	546
547	NCT03489395	547
548	NCT03488511	548
549	NCT03487718	549
550	NCT03486444	550
551	NCT03486106	551
552	NCT03484533	552
553	NCT03484338	553
554	NCT03484273	554
555	NCT03483935	555
556	NCT03482908	556
557	NCT03481023	557
558	NCT03479697	558
559	NCT03478163	559
560	NCT03478137	560
561	NCT03477500	561
562	NCT03477500	562
563	NCT03477500	563
564	NCT03477500	564
565	NCT03477500	565
566	NCT03477500	566
567	NCT03477500	567
568	NCT03477500	568
569	NCT03477045	569
570	NCT03473899	570
571	NCT03473665	571
572	NCT03472820	572
573	NCT03472430	573
574	NCT03472378	574
575	NCT03471117	575
576	NCT03471117	576
577	NCT03470389	577
578	NCT03469609	578
579	NCT03469609	579
580	NCT03468621	580
581	NCT03468621	581
582	NCT03468621	582
583	NCT03468621	583
584	NCT03466164	584
585	NCT03465982	585
586	NCT03465982	587
587	NCT03465982	593
588	NCT03465982	588
589	NCT03465982	594
590	NCT03465982	595
591	NCT03465982	592
592	NCT03465982	590
593	NCT03465982	589
594	NCT03465982	586
595	NCT03465982	591
596	NCT03464773	596
597	NCT03464266	597
598	NCT03462966	598
599	NCT03462823	599
600	NCT03459014	600
601	NCT03457519	602
602	NCT03457519	601
603	NCT03457506	603
604	NCT03456895	604
605	NCT03456128	605
606	NCT03455426	606
607	NCT03454282	607
608	NCT03454087	608
609	NCT03453190	609
610	NCT03451266	610
611	NCT03450655	611
612	NCT03450564	612
613	NCT03449693	613
614	NCT03448289	614
615	NCT03447119	615
616	NCT03444103	616
617	NCT03444103	617
618	NCT03443388	618
619	NCT03443258	619
620	NCT03441867	621
621	NCT03441867	620
622	NCT03441867	622
623	NCT03438708	623
624	NCT03435497	624
625	NCT03435172	625
626	NCT03435172	629
627	NCT03435172	628
628	NCT03435172	627
629	NCT03435172	626
630	NCT03434392	630
631	NCT03433222	631
632	NCT03432832	632
633	NCT03432832	633
634	NCT03432819	634
635	NCT03429010	635
636	NCT03428477	637
637	NCT03428477	636
638	NCT03426436	638
639	NCT03426436	639
640	NCT03425890	640
641	NCT03423394	641
642	NCT03423303	642
643	NCT03423303	643
644	NCT03422536	644
645	NCT03421262	645
646	NCT03420404	646
647	NCT03419715	647
648	NCT03419715	648
649	NCT03418870	649
650	NCT03418870	650
651	NCT03418870	651
652	NCT03418870	652
653	NCT03418870	653
654	NCT03418870	654
655	NCT03418324	655
656	NCT03415880	656
657	NCT03415841	657
658	NCT03412149	658
659	NCT03412084	659
660	NCT03410511	660
661	NCT03408873	661
662	NCT03408574	662
663	NCT03406520	663
664	NCT03405090	664
665	NCT03404011	665
666	NCT03401047	666
667	NCT03399318	667
668	NCT03399318	668
669	NCT03397030	669
670	NCT03396094	670
671	NCT03394599	671
672	NCT03394599	672
673	NCT03392415	673
674	NCT03386227	674
675	NCT03384706	676
676	NCT03384706	675
677	NCT03382171	677
678	NCT03382093	678
679	NCT03381027	679
680	NCT03380884	680
681	NCT03380013	681
682	NCT03379818	682
683	NCT03375879	683
684	NCT03375229	684
685	NCT03372174	685
686	NCT03372174	686
687	NCT03372174	687
688	NCT03372174	688
689	NCT03372174	689
690	NCT03372174	690
691	NCT03371836	691
692	NCT03369600	692
693	NCT03367364	693
694	NCT03365518	694
695	NCT03364660	695
696	NCT03364114	696
697	NCT03364114	697
698	NCT03364114	698
699	NCT03362983	699
700	NCT03359863	700
701	NCT03357042	701
702	NCT03356652	702
703	NCT03356210	703
704	NCT03356106	704
705	NCT03356106	705
706	NCT03356106	706
707	NCT03355456	707
708	NCT03354325	708
709	NCT03354325	709
710	NCT03354325	710
711	NCT03354325	711
712	NCT03354286	712
713	NCT03353298	713
714	NCT03352947	714
715	NCT03350737	715
716	NCT03348761	716
717	NCT03346668	717
718	NCT03342976	718
719	NCT03341975	719
720	NCT03341520	720
721	NCT03341520	726
722	NCT03341520	721
723	NCT03341520	725
724	NCT03341520	724
725	NCT03341520	722
726	NCT03341520	723
727	NCT03340922	727
728	NCT03337607	728
729	NCT03337360	732
730	NCT03337360	741
731	NCT03337360	731
732	NCT03337360	736
733	NCT03337360	730
734	NCT03337360	737
735	NCT03337360	738
736	NCT03337360	742
737	NCT03337360	740
738	NCT03337360	729
739	NCT03337360	734
740	NCT03337360	733
741	NCT03337360	735
742	NCT03337360	739
743	NCT03336879	743
744	NCT03336879	744
745	NCT03335475	745
746	NCT03335358	746
747	NCT03335319	747
748	NCT03335124	748
749	NCT03334643	749
750	NCT03333460	750
751	NCT03333460	751
752	NCT03333174	752
753	NCT03333161	753
754	NCT03326232	754
755	NCT03324451	755
756	NCT03323359	756
757	NCT03322774	757
758	NCT03322072	758
759	NCT03322072	759
760	NCT03320057	760
761	NCT03320057	761
762	NCT03320057	762
763	NCT03320057	763
764	NCT03320057	764
765	NCT03318874	765
766	NCT03314792	766
767	NCT03313492	767
768	NCT03308851	768
769	NCT03306992	769
770	NCT03304626	770
771	NCT03304301	771
772	NCT03302858	772
773	NCT03302299	773
774	NCT03301311	781
775	NCT03301311	775
776	NCT03301311	784
777	NCT03301311	776
778	NCT03301311	777
779	NCT03301311	774
780	NCT03301311	783
781	NCT03301311	780
782	NCT03301311	782
783	NCT03301311	785
784	NCT03301311	778
785	NCT03301311	779
786	NCT03299816	786
787	NCT03299296	787
788	NCT03297658	788
789	NCT03297346	792
790	NCT03297346	791
791	NCT03297346	789
792	NCT03297346	793
793	NCT03297346	790
794	NCT03295708	794
795	NCT03295422	795
796	NCT03294395	796
797	NCT03291951	797
798	NCT03291951	798
799	NCT03291951	799
800	NCT03290833	800
801	NCT03290560	801
802	NCT03290560	802
803	NCT03290560	803
804	NCT03290560	804
805	NCT03290560	805
806	NCT03290560	806
807	NCT03290560	807
808	NCT03290560	808
809	NCT03290560	809
810	NCT03290560	810
811	NCT03290560	811
812	NCT03290560	812
813	NCT03289858	813
814	NCT03289858	814
815	NCT03286374	815
816	NCT03283943	816
817	NCT03275571	817
818	NCT03269071	818
819	NCT03268213	819
820	NCT03267420	820
821	NCT03267238	821
822	NCT03263780	822
823	NCT03263156	823
824	NCT03263156	824
825	NCT03256396	825
826	NCT03254589	826
827	NCT03251495	827
828	NCT03248518	829
829	NCT03248518	830
830	NCT03248518	828
831	NCT03248518	832
832	NCT03248518	831
833	NCT03248518	833
834	NCT03243539	834
835	NCT03241511	835
836	NCT03237468	837
837	NCT03237468	836
838	NCT03229538	849
839	NCT03229538	842
840	NCT03229538	843
841	NCT03229538	845
842	NCT03229538	839
843	NCT03229538	840
844	NCT03229538	846
845	NCT03229538	847
846	NCT03229538	841
847	NCT03229538	844
848	NCT03229538	848
849	NCT03229538	838
850	NCT03229538	850
851	NCT03229486	851
852	NCT03227809	852
853	NCT03227770	862
854	NCT03227770	856
855	NCT03227770	855
856	NCT03227770	854
857	NCT03227770	858
858	NCT03227770	861
859	NCT03227770	860
860	NCT03227770	853
861	NCT03227770	857
862	NCT03227770	863
863	NCT03227770	859
864	NCT03212859	864
865	NCT03205956	865
866	NCT03196193	866
867	NCT03196193	867
868	NCT03196193	868
869	NCT03196193	869
870	NCT03196193	870
871	NCT03196193	871
872	NCT03196193	872
873	NCT03196193	873
874	NCT03196193	874
875	NCT03196193	875
876	NCT03196193	876
877	NCT03196193	877
878	NCT03193333	878
879	NCT03193333	879
880	NCT03191071	880
881	NCT03168724	881
882	NCT03168724	882
883	NCT03167723	883
884	NCT03167307	884
885	NCT03128021	885
886	NCT03116139	886
887	NCT03110744	887
888	NCT03100526	888
889	NCT03044613	889
890	NCT03044613	890
891	NCT03044613	891
892	NCT03036345	892
893	NCT03026816	893
894	NCT03007511	894
895	NCT03007511	895
896	NCT02996565	896
897	NCT02995733	897
898	NCT02995733	898
899	NCT02995733	899
900	NCT02995733	900
901	NCT02995733	901
902	NCT02995733	902
903	NCT02995733	903
904	NCT02995733	904
905	NCT02995733	905
906	NCT02995733	906
907	NCT02995733	907
908	NCT02995733	908
909	NCT02995733	909
910	NCT02995733	910
911	NCT02995733	911
912	NCT02995733	912
913	NCT02995733	913
914	NCT02995733	914
915	NCT02995733	915
916	NCT02995733	916
917	NCT02993432	917
918	NCT02990429	918
919	NCT02978950	919
920	NCT02959697	921
921	NCT02959697	920
922	NCT02957669	922
923	NCT02957253	926
924	NCT02957253	928
925	NCT02957253	924
926	NCT02957253	923
927	NCT02957253	927
928	NCT02957253	925
929	NCT02940028	929
930	NCT02874443	930
931	NCT02871349	931
932	NCT02852213	932
933	NCT02845336	933
934	NCT02811627	934
935	NCT02808507	936
936	NCT02808507	935
937	NCT02690259	937
938	NCT02651402	938
939	NCT02624765	939
940	NCT02624765	940
941	NCT02624765	941
942	NCT02624765	942
943	NCT02624765	943
944	NCT02624765	944
945	NCT02624765	945
946	NCT02624765	946
947	NCT02624765	947
948	NCT02624765	948
949	NCT02624765	949
950	NCT02624765	950
951	NCT02624765	951
952	NCT02624765	952
953	NCT02624765	953
954	NCT02624765	954
955	NCT02624765	955
956	NCT02624765	956
957	NCT02624765	957
958	NCT02624765	958
959	NCT02624765	959
960	NCT02624765	960
961	NCT02624765	961
962	NCT02624765	962
963	NCT02624765	963
964	NCT02624765	964
965	NCT02624765	965
966	NCT02624765	966
967	NCT02624765	967
968	NCT02624765	968
969	NCT02624765	969
970	NCT02613650	970
971	NCT02606045	971
972	NCT02599480	978
973	NCT02599480	973
974	NCT02599480	977
975	NCT02599480	976
976	NCT02599480	980
977	NCT02599480	974
978	NCT02599480	975
979	NCT02599480	972
980	NCT02599480	979
981	NCT02587936	982
982	NCT02587936	984
983	NCT02587936	981
984	NCT02587936	983
985	NCT02458846	985
986	NCT02428205	986
987	NCT02340650	987
988	NCT02278198	988
989	NCT02259621	991
990	NCT02259621	989
991	NCT02259621	990
992	NCT02259621	992
993	NCT02046694	993
994	NCT02046694	994
995	NCT02046694	995
996	NCT01964859	996
997	NCT01247090	997
998	NCT01042015	998
999	NCT01042015	999
1000	NCT00870064	1000
1001	NCT03799094	1001
1002	NCT03607630	1002
1003	NCT03423342	1003
1004	NCT03360929	1004
1005	NCT03292731	1006
1006	NCT03292731	1007
1007	NCT03292731	1005
1008	NCT03275870	1008
1009	NCT03104426	1009
1010	NCT03753802	1011
1011	NCT03753802	1010
1012	NCT03630549	1012
1013	NCT03630549	1013
1014	NCT03241732	1014
1015	NCT03241732	1015
1016	NCT03032601	1016
1017	NCT03466528	1017
1018	NCT03463252	1018
1019	NCT03829956	1019
1020	NCT03827616	1020
1021	NCT03808207	1021
1022	NCT03795740	1022
1023	NCT03787615	1023
1024	NCT03781596	1024
1025	NCT03771534	1025
1026	NCT03770455	1026
1027	NCT03766503	1027
1028	NCT03762239	1028
1029	NCT03761264	1029
1030	NCT03757572	1030
1031	NCT03754322	1031
1032	NCT03754322	1033
1033	NCT03754322	1032
1034	NCT03754322	1034
1035	NCT03744780	1035
1036	NCT03737370	1037
1037	NCT03737370	1036
1038	NCT03735537	1038
1039	NCT03735537	1039
1040	NCT03735537	1040
1041	NCT03735537	1041
1042	NCT03735537	1042
1043	NCT03735537	1043
1044	NCT03735537	1044
1045	NCT03735537	1045
1046	NCT03735537	1046
1047	NCT03735537	1047
1048	NCT03735537	1048
1049	NCT03735537	1049
1050	NCT03735537	1050
1051	NCT03735537	1051
1052	NCT03735537	1052
1053	NCT03735537	1053
1054	NCT03735537	1054
1055	NCT03735537	1055
1056	NCT03735537	1056
1057	NCT03735537	1057
1058	NCT03735537	1058
1059	NCT03735537	1059
1060	NCT03735537	1060
1061	NCT03735537	1061
1062	NCT03735537	1062
1063	NCT03714282	1063
1064	NCT03704116	1064
1065	NCT03702465	1065
1066	NCT03701113	1066
1067	NCT03699397	1067
1068	NCT03698591	1068
1069	NCT03694496	1069
1070	NCT03692715	1070
1071	NCT03692715	1071
1072	NCT03692715	1072
1073	NCT03692715	1073
1074	NCT03685461	1074
1075	NCT03680248	1075
1076	NCT03678506	1076
1077	NCT03675165	1077
1078	NCT03661385	1080
1079	NCT03661385	1081
1080	NCT03661385	1083
1081	NCT03661385	1082
1082	NCT03661385	1079
1083	NCT03661385	1078
1084	NCT03654131	1084
1085	NCT03644381	1085
1086	NCT03637413	1086
1087	NCT03636724	1087
1088	NCT03633682	1088
1089	NCT03632447	1091
1090	NCT03632447	1092
1091	NCT03632447	1089
1092	NCT03632447	1094
1093	NCT03632447	1090
1094	NCT03632447	1093
1095	NCT03631979	1095
1096	NCT03631030	1097
1097	NCT03631030	1096
1098	NCT03629145	1098
1099	NCT03625011	1099
1100	NCT03607461	1100
1101	NCT03603015	1101
1102	NCT03594474	1102
1103	NCT03589378	1108
1104	NCT03589378	1113
1105	NCT03589378	1103
1106	NCT03589378	1105
1107	NCT03589378	1107
1108	NCT03589378	1109
1109	NCT03589378	1112
1110	NCT03589378	1114
1111	NCT03589378	1104
1112	NCT03589378	1111
1113	NCT03589378	1106
1114	NCT03589378	1110
1115	NCT03586219	1115
1116	NCT03586219	1116
1117	NCT03586219	1117
1118	NCT03570424	1118
1119	NCT03563690	1119
1120	NCT03560063	1120
1121	NCT03553862	1121
1122	NCT03550495	1122
1123	NCT03538860	1123
1124	NCT03536858	1124
1125	NCT03526458	1125
1126	NCT03516396	1126
1127	NCT03502005	1127
1128	NCT03494231	1128
1129	NCT03493126	1129
1130	NCT03489850	1130
1131	NCT03488602	1131
1132	NCT03483740	1133
1133	NCT03483740	1132
1134	NCT03483740	1134
1135	NCT03478501	1135
1136	NCT03478501	1137
1137	NCT03478501	1136
1138	NCT03474978	1138
1139	NCT03474666	1139
1140	NCT03474432	1140
1141	NCT03474432	1141
1142	NCT03474432	1142
1143	NCT03474432	1143
1144	NCT03474432	1144
1145	NCT03474432	1145
1146	NCT03474432	1146
1147	NCT03474432	1147
1148	NCT03474432	1148
1149	NCT03474432	1149
1150	NCT03474432	1150
1151	NCT03474432	1151
1152	NCT03474432	1152
1153	NCT03471637	1153
1154	NCT03467724	1154
1155	NCT03464851	1155
1156	NCT03462979	1156
1157	NCT03462459	1157
1158	NCT03461016	1158
1159	NCT03461003	1159
1160	NCT03455985	1160
1161	NCT03453398	1161
1162	NCT03453359	1162
1163	NCT03442114	1163
1164	NCT03442114	1164
1165	NCT03442114	1165
1166	NCT03442114	1166
1167	NCT03442114	1167
1168	NCT03442114	1168
1169	NCT03442114	1169
1170	NCT03442114	1170
1171	NCT03440645	1171
1172	NCT03431467	1172
1173	NCT03429439	1173
1174	NCT03422848	1174
1175	NCT03418649	1175
1176	NCT03418649	1176
1177	NCT03418649	1177
1178	NCT03413332	1178
1179	NCT03406767	1179
1180	NCT03406767	1180
1181	NCT03406767	1181
1182	NCT03406767	1182
1183	NCT03405493	1183
1184	NCT03395301	1184
1185	NCT03387618	1185
1186	NCT03382106	1186
1187	NCT03380169	1187
1188	NCT03377946	1188
1189	NCT03377088	1189
1190	NCT03373734	1190
1191	NCT03372707	1191
1192	NCT03372707	1192
1193	NCT03372707	1193
1194	NCT03366805	1194
1195	NCT03360279	1195
1196	NCT03359447	1196
1197	NCT03354572	1197
1198	NCT03348605	1198
1199	NCT03345615	1199
1200	NCT03340818	1200
1201	NCT03340051	1201
1202	NCT03337217	1202
1203	NCT03331965	1203
1204	NCT03330509	1204
1205	NCT03327844	1205
1206	NCT03327844	1206
1207	NCT03324659	1207
1208	NCT03324516	1208
1209	NCT03324009	1209
1210	NCT03307070	1210
1211	NCT03303053	1211
1212	NCT03303053	1212
1213	NCT03303053	1213
1214	NCT03302572	1214
1215	NCT03301831	1215
1216	NCT03298997	1216
1217	NCT03297151	1217
1218	NCT03275896	1218
1219	NCT03274518	1219
1220	NCT03273699	1220
1221	NCT03256461	1221
1222	NCT03245853	1222
1223	NCT03239808	1223
1224	NCT03239808	1224
1225	NCT03239808	1225
1226	NCT03238768	1226
1227	NCT03235739	1227
1228	NCT03234569	1228
1229	NCT03230890	1229
1230	NCT03230656	1230
1231	NCT03227614	1231
1232	NCT03196349	1232
1233	NCT03192020	1233
1234	NCT03192020	1234
1235	NCT03192020	1235
1236	NCT03192020	1236
1237	NCT03192020	1237
1238	NCT03192020	1238
1239	NCT03036592	1239
1240	NCT02948023	1240
1241	NCT02814123	1241
1242	NCT02724163	1245
1243	NCT02724163	1256
1244	NCT02724163	1244
1245	NCT02724163	1253
1246	NCT02724163	1260
1247	NCT02724163	1243
1248	NCT02724163	1261
1249	NCT02724163	1248
1250	NCT02724163	1255
1251	NCT02724163	1251
1252	NCT02724163	1258
1253	NCT02724163	1250
1254	NCT02724163	1254
1255	NCT02724163	1247
1256	NCT02724163	1257
1257	NCT02724163	1262
1258	NCT02724163	1259
1259	NCT02724163	1249
1260	NCT02724163	1246
1261	NCT02724163	1252
1262	NCT02724163	1242
1263	NCT02479100	1263
1264	NCT03799237	1264
1265	NCT03759795	1265
1266	NCT03759795	1266
1267	NCT03750409	1268
1268	NCT03750409	1267
1269	NCT03736031	1269
1270	NCT03726437	1270
1271	NCT03706014	1271
1272	NCT03695679	1272
1273	NCT03669432	1273
1274	NCT03658941	1274
1275	NCT03658941	1275
1276	NCT03658941	1276
1277	NCT03658941	1277
1278	NCT03657212	1278
1279	NCT03648086	1279
1280	NCT03647449	1280
1281	NCT03635775	1281
1282	NCT02029937	1282
1283	NCT02029937	1283
1284	NCT02029937	1284
1285	NCT03593356	1285
1286	NCT03588806	1286
1287	NCT03588572	1287
1288	NCT03588572	1288
1289	NCT03574376	1289
1290	NCT03551860	1290
1291	NCT03532360	1291
1292	NCT03526484	1292
1293	NCT03526484	1293
1294	NCT03523000	1294
1295	NCT03522974	1295
1296	NCT03522337	1296
1297	NCT03518255	1297
1298	NCT03517852	1298
1299	NCT03511443	1299
1300	NCT03505658	1300
1301	NCT03505658	1301
1302	NCT03505658	1302
1303	NCT03505658	1303
1304	NCT03505658	1304
1305	NCT03500172	1305
1306	NCT03481296	1306
1307	NCT03454308	1307
1308	NCT03437876	1308
1309	NCT03435588	1309
1310	NCT03435588	1310
1311	NCT03435588	1311
1312	NCT03435588	1312
1313	NCT03426683	1313
1314	NCT03422159	1314
1315	NCT03422159	1315
1316	NCT03420846	1316
1317	NCT03383731	1317
1318	NCT03376685	1318
1319	NCT03376100	1319
1320	NCT03365609	1320
1321	NCT03360968	1321
1322	NCT03343431	1322
1323	NCT03343431	1335
1324	NCT03343431	1344
1325	NCT03343431	1353
1326	NCT03343431	1352
1327	NCT03343431	1327
1328	NCT03343431	1337
1329	NCT03343431	1340
1330	NCT03343431	1332
1331	NCT03343431	1336
1332	NCT03343431	1349
1333	NCT03343431	1323
1334	NCT03343431	1328
1335	NCT03343431	1339
1336	NCT03343431	1345
1337	NCT03343431	1350
1338	NCT03343431	1325
1339	NCT03343431	1347
1340	NCT03343431	1333
1341	NCT03343431	1330
1342	NCT03343431	1351
1343	NCT03343431	1342
1344	NCT03343431	1346
1345	NCT03343431	1343
1346	NCT03343431	1326
1347	NCT03343431	1324
1348	NCT03343431	1348
1349	NCT03343431	1341
1350	NCT03343431	1331
1351	NCT03343431	1334
1352	NCT03343431	1338
1353	NCT03343431	1329
1354	NCT03340103	1355
1355	NCT03340103	1354
1356	NCT03340103	1356
1357	NCT03338374	1357
1358	NCT03338374	1358
1359	NCT03337971	1359
1360	NCT03336372	1360
1361	NCT03326934	1361
1362	NCT03306173	1362
1363	NCT03287635	1363
1364	NCT03265574	1364
1365	NCT01785719	1365
1366	NCT03232554	1366
1367	NCT01739933	1367
1368	NCT01739933	1368
1369	NCT01739933	1369
1370	NCT01739933	1370
1371	NCT01739933	1371
1372	NCT01739933	1372
1373	NCT01739933	1373
1374	NCT01739933	1374
1375	NCT01739933	1375
1376	NCT01739933	1376
1377	NCT01739933	1377
1378	NCT03085784	1379
1379	NCT03085784	1378
1380	NCT03085784	1380
1381	NCT03083366	1383
1382	NCT03083366	1381
1383	NCT03083366	1382
1384	NCT03009539	1387
1385	NCT03009539	1395
1386	NCT03009539	1385
1387	NCT03009539	1388
1388	NCT03009539	1394
1389	NCT03009539	1384
1390	NCT03009539	1392
1391	NCT03009539	1389
1392	NCT03009539	1393
1393	NCT03009539	1391
1394	NCT03009539	1390
1395	NCT03009539	1386
1396	NCT02744768	1396
1397	NCT02744768	1397
1398	NCT02744768	1398
1399	NCT02744768	1399
1400	NCT02744768	1400
1401	NCT02744768	1401
1402	NCT02744768	1402
1403	NCT02744768	1403
1404	NCT02744768	1404
1405	NCT02744768	1405
1406	NCT02744768	1406
1407	NCT02744768	1407
1408	NCT02744768	1408
1409	NCT02744768	1409
1410	NCT02744768	1410
1411	NCT02744768	1411
1412	NCT02744768	1412
1413	NCT02744768	1413
1414	NCT02744768	1414
1415	NCT02744768	1415
1416	NCT02744768	1416
1417	NCT02744768	1417
1418	NCT02744768	1418
1419	NCT02744768	1419
1420	NCT02744768	1420
1421	NCT02744768	1421
1422	NCT02744768	1422
1423	NCT02744768	1423
1424	NCT02744768	1424
1425	NCT02744768	1425
1426	NCT02744768	1426
1427	NCT02744768	1427
1428	NCT02744768	1428
1429	NCT02744768	1429
1430	NCT01447628	1430
1431	NCT01447628	1431
1432	NCT01447628	1432
1433	NCT01447628	1433
1434	NCT01447628	1434
1435	NCT02188121	1435
1436	NCT03740243	1436
1437	NCT03629496	1437
1438	NCT03622437	1438
1439	NCT03622437	1439
1440	NCT03622437	1440
1441	NCT03622437	1441
1442	NCT03616639	1450
1443	NCT03616639	1453
1444	NCT03616639	1455
1445	NCT03616639	1445
1446	NCT03616639	1442
1447	NCT03616639	1456
1448	NCT03616639	1449
1449	NCT03616639	1452
1450	NCT03616639	1444
1451	NCT03616639	1447
1452	NCT03616639	1451
1453	NCT03616639	1448
1454	NCT03616639	1443
1455	NCT03616639	1454
1456	NCT03616639	1446
1457	NCT03564080	1457
1458	NCT03544853	1458
1459	NCT03543774	1459
1460	NCT03519568	1460
1461	NCT03519087	1461
1462	NCT03440099	1462
1463	NCT03437811	1463
1464	NCT03423095	1464
1465	NCT03406039	1465
1466	NCT03397277	1466
1467	NCT03397277	1467
1468	NCT03397277	1468
1469	NCT03397277	1469
1470	NCT03397277	1470
1471	NCT03397277	1471
1472	NCT03397277	1472
1473	NCT03397277	1473
1474	NCT03397277	1474
1475	NCT03397277	1475
1476	NCT03397277	1476
1477	NCT03397277	1477
1478	NCT03397277	1478
1479	NCT03397277	1479
1480	NCT03397277	1480
1481	NCT03397277	1481
1482	NCT03397277	1482
1483	NCT03397277	1483
1484	NCT03397277	1484
1485	NCT03375580	1485
1486	NCT03373240	1486
1487	NCT03369145	1488
1488	NCT03369145	1487
1489	NCT03337581	1489
1490	NCT03335722	1490
1491	NCT03333473	1491
1492	NCT03333473	1492
1493	NCT03333473	1493
1494	NCT03333473	1494
1495	NCT03333473	1495
1496	NCT03333473	1496
1497	NCT03333473	1497
1498	NCT03333473	1498
1499	NCT03331978	1499
1500	NCT03255707	1500
1501	NCT03208530	1501
1502	NCT02781064	1551
1503	NCT02781064	1522
1504	NCT02781064	1507
1505	NCT02781064	1514
1506	NCT02781064	1549
1507	NCT02781064	1515
1508	NCT02781064	1508
1509	NCT02781064	1534
1510	NCT02781064	1548
1511	NCT02781064	1525
1512	NCT02781064	1546
1513	NCT02781064	1516
1514	NCT02781064	1503
1515	NCT02781064	1524
1516	NCT02781064	1506
1517	NCT02781064	1510
1518	NCT02781064	1528
1519	NCT02781064	1530
1520	NCT02781064	1540
1521	NCT02781064	1537
1522	NCT02781064	1556
1523	NCT02781064	1505
1524	NCT02781064	1550
1525	NCT02781064	1511
1526	NCT02781064	1544
1527	NCT02781064	1512
1528	NCT02781064	1513
1529	NCT02781064	1504
1530	NCT02781064	1517
1531	NCT02781064	1532
1532	NCT02781064	1533
1533	NCT02781064	1547
1534	NCT02781064	1557
1535	NCT02781064	1526
1536	NCT02781064	1518
1537	NCT02781064	1531
1538	NCT02781064	1538
1539	NCT02781064	1552
1540	NCT02781064	1545
1541	NCT02781064	1558
1542	NCT02781064	1521
1543	NCT02781064	1555
1544	NCT02781064	1519
1545	NCT02781064	1523
1546	NCT02781064	1542
1547	NCT02781064	1535
1548	NCT02781064	1553
1549	NCT02781064	1539
1550	NCT02781064	1554
1551	NCT02781064	1543
1552	NCT02781064	1541
1553	NCT02781064	1559
1554	NCT02781064	1529
1555	NCT02781064	1502
1556	NCT02781064	1509
1557	NCT02781064	1520
1558	NCT02781064	1536
1559	NCT02781064	1527
1560	NCT03664934	1560
1561	NCT03584490	1561
1562	NCT03558828	1562
1563	NCT03556371	1563
1564	NCT03556371	1564
1565	NCT03556371	1565
1566	NCT03556371	1566
1567	NCT03529981	1567
1568	NCT03422562	1568
1569	NCT03394495	1569
1570	NCT03304444	1570
1571	NCT03686748	1571
1572	NCT02018367	1572
1573	NCT03538418	1573
1574	NCT03397160	1576
1575	NCT03397160	1574
1576	NCT03397160	1577
1577	NCT03397160	1575
1578	NCT03388970	1578
1579	NCT03388970	1579
1580	NCT03388970	1580
1581	NCT03388970	1581
1582	NCT03388970	1582
1583	NCT03376854	1583
1584	NCT03234543	1584
1585	NCT03230942	1585
1586	NCT02982772	1586
1587	NCT02529644	1587
1588	NCT03326596	1588
1589	NCT03543644	1589
1590	NCT03507400	1590
1591	NCT03286153	1591
1592	NCT03286153	1592
1593	NCT03286153	1593
1594	NCT03286153	1594
\.


--
-- Data for Name: study; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.study (index, nct_number, status, study_type, title, start_date, gender, enrollment) FROM stdin;
1	NCT03769298	Recruiting	Interventional	CIRTEN-Simultaneous Pancreas-Kidney Transplant Recipients	February 15, 2019	All	30
2	NCT03653546	Recruiting	Interventional	First Line Treatment in EGFR Mutation Positive Advanced NSCLC Patients With Central Nervous System Metastases	October 29, 2018	All	300
3	NCT03641209	Recruiting	Interventional	Extremely Low Gestatonal Age Infants' Paracetamol Study	September 3, 2018	All	40
4	NCT03601000	Recruiting	Interventional	Efficacy Study of Yi-Zhi-An-Shen Granules For Older Adults With Amnestic Mild Cognitive Impairment	April 21, 2018	All	80
5	NCT03498196	Recruiting	Interventional	A Window of Opportunity Trial: Avelumab in Non-metastatic Muscle Invasive Bladder Cancer	December 14, 2018	All	10
6	NCT03453255	Recruiting	Interventional	DCHA as Postremission Therapy for AML With t(8;21)	January 1, 2018	All	120
7	NCT03420976	Recruiting	Interventional	Novel Supplement-based Therapy for the Treatment of Small Intestinal Bacterial Overgrowth	December 7, 2017	All	10
8	NCT03395288	Recruiting	Interventional	Nutraceutical Efficacy for rUTI	March 22, 2018	Female	180
9	NCT03361345	Recruiting	Interventional	Topical 5% Tranexamic Acid as a Treatment for Postinflammatory Hyperpigmentation Due to Acne Vulgaris	November 1, 2018	All	25
10	NCT03354611	Recruiting	Interventional	Contrast-Enhanced Cone Beam Breast CT for Diagnostic Breast Imaging	September 10, 2018	Female	100
11	NCT03334175	Recruiting	Interventional	Walnuts to Achieve Lasting NUTrition to Prevent Diabetes	May 21, 2018	All	40
12	NCT03317327	Recruiting	Interventional	REirradiation and Programmed Cell Death Protein 1 (PD-1) Blockade On Recurrent Squamous Cell Head and Neck Tumors	September 9, 2017	All	20
13	NCT03262961	Recruiting	Interventional	Use of Sildenafil Citrate in Management of Mild Pre-eclampsia	September 15, 2016	Female	80
14	NCT03227731	Recruiting	Interventional	Immediate or Deferred Pre-exposure Prophylaxis for HIV Prevention: Safe Options for Pregnant and Lactating Women	September 28, 2017	Female	842
15	NCT02786836	Recruiting	Interventional	13C-Methacetin Breath Test for the Prediction of Outcome in in ALI or ALF	June 2016	All	200
16	NCT01203722	Recruiting	Interventional	Reduced Intensity, Partially HLA Mismatched BMT to Treat Hematologic Malignancies	September 2010	All	100
17	NCT03837717	Recruiting	Interventional	The Impact of Holding on Stress and Bonding in Mother-Infant Pairs During Therapeutic Hypothermia	December 4, 2018	All	34
18	NCT03836508	Recruiting	Interventional	Effect of Dialysis Membranes on Inflammatory and Immune Processes in Hemodialysis	September 1, 2018	All	52
19	NCT03833596	Recruiting	Interventional	Exclusive Enteral Nutrition and Corticosteroids Therapy in Crohn's Disease (EENCD)	October 25, 2018	All	100
20	NCT03833531	Recruiting	Interventional	Effectiveness of PTSD-treatment Compared to Integrated PTSD-PD-treatment in Adult Patients With Comorbid PTSD and CPD	June 1, 2018	All	160
21	NCT03833453	Recruiting	Interventional	Effectiveness of PTSD-treatment Compared to Integrated PTSD-PD-treatment in Adult Patients With Comorbid PTSD and BPD	June 1, 2018	All	160
22	NCT03832712	Recruiting	Interventional	The Swedish Essential Tremor (SWEET) Trial	June 30, 2018	All	100
23	NCT03832530	Recruiting	Interventional	Periconception PrEP for HIV-exposed Ugandan Women	November 27, 2017	Female	150
24	NCT03830190	Recruiting	Interventional	Cost-effectiveness of Nursing Interventions for Patients With PD	January 7, 2019	All	240
25	NCT03830008	Recruiting	Interventional	Scaling-up Psychological Interventions With Syrian Refugees in Switzerland	December 21, 2018	All	80
26	NCT03829748	Recruiting	Interventional	Intermittent Suction Technique in the Diagnosis of Pancreatic Solid Lesions	January 16, 2019	All	20
27	NCT03828721	Recruiting	Interventional	Rx for Success: RCT of an App for Dialogic Reading Training	March 20, 2018	All	248
28	NCT03827915	Recruiting	Interventional	Double Sequential External Defibrillation in Patients With Atrial Fibrillation Refractory to DC Cardioversion	January 21, 2019	All	100
29	NCT03825146	Recruiting	Interventional	The Effects of AMPC in the Treatments of Refractory or Relapsed AML	January 4, 2019	All	10
30	NCT03823456	Recruiting	Interventional	Self-acupressure for Cancer-related Symptom Cluster of Insomnia, Depression, and Anxiety: a Feasibility Study	December 4, 2018	All	114
31	NCT03818867	Recruiting	Interventional	Emergency Cerclage in Twin Pregnancies at Imminent Risk of Preterm Birth: an Open-Label Randomised Controlled Trial	May 15, 2017	Female	31
32	NCT03817489	Recruiting	Interventional	Mindfulness Meditation and Qigong for Colorectal Cancer Survivors	January 4, 2017	All	189
33	NCT03814577	Enrolling by invitation	Interventional	A Comparison of the Effects of Desflurane and TIVA on Antioxidant System in Morbidly Obese Patients	January 24, 2019	All	70
34	NCT03814330	Enrolling by invitation	Interventional	A Comparison of Sedation/Analgesia & LMA on Anxiety Level and Patient Satisfaction in In-Vitro Fertilization	January 24, 2019	Female	140
35	NCT03813992	Recruiting	Interventional	Clinical Trial Using Topically Applied Glyceryl Trinitrate (GTN) for the Treatment of Erectile Dysfunction	November 1, 2018	Male	1000
36	NCT03813381	Enrolling by invitation	Interventional	CAlorie and Protein REstriction PROgram in Barrett's Esophagus Patients (CARE-PRO).	November 25, 2015	All	190
37	NCT03813069	Recruiting	Interventional	Testing Insect Repellents Against Musca Sorbens, the Vector of Trachoma	January 2019	All	103
38	NCT03809286	Recruiting	Interventional	The Effect of rTMS to the Prefrontal Cortex in Alcohol Use Disorder	January 2019	All	32
39	NCT03807986	Recruiting	Interventional	The Combination Therapy of Nanofat Grafting and PRP Compared With Microfat Grafting and PRP Synergy in Treating Striae Distensae	February 1, 2019	All	12
40	NCT03801772	Recruiting	Interventional	Effects of a Metronome on Functional Outcomes in Aquatic Therapy	January 21, 2019	All	120
41	NCT03799328	Recruiting	Interventional	Low Dose Multi-OIT for Food Allergy (LoMo)	January 2019	All	18
42	NCT03798483	Recruiting	Interventional	INDividualised EXercise for Kneecap Dislocations	January 24, 2019	All	15
43	NCT03796923	Recruiting	Interventional	Models of Care in the Transition From the Secondary to the Primary Sector Among the Frailest Elderly	January 1, 2018	All	3057
44	NCT03796793	Recruiting	Interventional	Developing Strategies for Effective Debridement in Patients for Venous Leg Ulcers	January 2019	All	360
45	NCT03795675	Recruiting	Interventional	CI Following VS Removal or Labyrinthectomy	January 1, 2019	All	15
46	NCT03791697	Recruiting	Interventional	Telehealth Postop Follow up RCT	July 9, 2018	Female	142
47	NCT03790449	Recruiting	Interventional	Evaluation of a Mobile Preconception Lifestyle Programme in Couples Undergoing In Vitro Fertilisation	January 1, 2019	All	460
48	NCT03786432	Recruiting	Interventional	Prospective Study of Fusion Rates Using Spira-C Device for Anterior Cervical Discectomy and Fusion Surgery	January 10, 2019	All	40
49	NCT03783767	Recruiting	Interventional	Peer Leadership for Physical Literacy	January 7, 2019	All	1344
50	NCT03783312	Enrolling by invitation	Interventional	Effects of Preemptive Paracetamol and Ibuprofen on Headache and Myalgia in Patients After Electroconvulsive Therapy	December 20, 2018	All	60
51	NCT03783299	Enrolling by invitation	Interventional	Targeted Active Case Detection Among High Risk Populations in Southern Lao Peoples Democratic Republic	November 28, 2017	All	85000
52	NCT03782974	Recruiting	Interventional	A Follow-up Trial of Proglucamune® in the Treatment of Protective Qi Insufficiency, a TCM Condition	January 6, 2019	All	130
53	NCT03781050	Recruiting	Interventional	Efficacy of Rapamycin (Sirolimus) in the Treatment of Peutz-Jeghers Syndrome	September 16, 2018	All	10
54	NCT03778580	Recruiting	Interventional	Advanced Glycation Endproducts and Bone Material Strength in T2D Treated With Pyridoxamine	March 1, 2018	Female	52
55	NCT03773575	Recruiting	Interventional	Evaluation of Closed Incision Negative Pressure Dressing (PREVENA) to Prevent Lower Extremity Amputation Wound Complications	January 15, 2019	All	440
56	NCT03771495	Recruiting	Interventional	The Immediate Effects of Passive Hip Joint Mobilization on Hip Muscle Strength in Patients With Anterior Knee Pain	December 10, 2018	All	20
57	NCT03771430	Recruiting	Interventional	A Multidisciplinary Intervention in Total Knee Arthroplasty	January 24, 2019	All	230
58	NCT03770962	Recruiting	Interventional	One Plus One Equals Two, Will That do?	December 10, 2018	Female	2946
59	NCT03770507	Recruiting	Interventional	Gas Exchange Kinetics and Work Load During Exercise	April 25, 2016	All	180
60	NCT03767660	Recruiting	Interventional	Efficacy of Rapamycin (Sirolimus) in the Treatment of BRBNS, Hereditary or Sporadic Venous Malformation	July 31, 2018	All	20
61	NCT03761732	Recruiting	Interventional	Islamic Trauma Healing: Feasibility Study	October 15, 2018	All	20
62	NCT03753932	Recruiting	Interventional	Impact of Fixed Dentures in Head and Neck Cancer (IMFDHAC)	March 1, 2013	All	60
63	NCT03753243	Recruiting	Interventional	Neoadjuvant Pembrolizumab Plus Androgen Axis Blockade Prior to Prostatectomy for High Risk Localized Prostate Cancer	December 3, 2018	Male	32
64	NCT03751878	Recruiting	Interventional	Evaluating the Impact of Assessing During Peer Review the CONSORT Checklist Submitted by Authors	December 7, 2018	All	24
65	NCT03749655	Recruiting	Interventional	Physical Activity Promotion Added to Standard Care Pulmonary Rehabilitation and Cognitive Behavioural Therapy	November 20, 2018	All	40
66	NCT03748914	Recruiting	Interventional	C-UCM and Cerebral Oxygenation and Perfusion	November 21, 2018	All	80
67	NCT03747887	Recruiting	Interventional	Enhancing IEPs of Children With ADHD Using Daily Report Cards	January 3, 2019	All	216
68	NCT03745209	Recruiting	Interventional	Ultrasound-guided Peripheral IV vs. Standard Technique in Difficult Vascular Access Patients by ICU Nurses	January 21, 2019	All	50
69	NCT03743480	Recruiting	Interventional	Early Palliative Care and Hematological Cancer Patients	November 21, 2018	All	60
70	NCT03740659	Recruiting	Interventional	Evaluation Of Aqueous Humor Of Levofloxacin-Dexamethasone Eye Drops And Of Its Components In Patients Undergoing Cataract Surgery	September 4, 2018	All	120
71	NCT03740321	Recruiting	Interventional	SRAE With Embospheres for Hemorrhoids.	December 1, 2018	All	50
72	NCT03739528	Recruiting	Interventional	Levo-Dexa vs. Tobra+Dexa for Prevention and Treatment of Inflammation and Prevention of Infection in Cataract Surgery	September 3, 2018	All	800
73	NCT03737227	Recruiting	Interventional	Lumbar Intervertebral Motion in Asymptomatic Male Participants	January 9, 2019	Male	11
74	NCT03736382	Recruiting	Interventional	Mild Intermittent Hypoxia and Its Multipronged Effect on Sleep Apnea	November 2018	All	8
75	NCT03730454	Recruiting	Interventional	Transanastomotic Tube for Proximal Esophageal Atresia With Distal Tracheoesophageal Fistula Repair	May 11, 2018	All	150
76	NCT03729687	Recruiting	Interventional	Short Course Radiation Therapy Followed by Pre-operative Chemotherapy and Surgery in High-risk Rectal Cancer	July 4, 2016	All	100
77	NCT03729648	Recruiting	Interventional	Expressive Arts-based Intervention for Young and Pre-elderly Stroke Survivors	September 1, 2017	All	154
78	NCT03729297	Recruiting	Interventional	Cabozantinib in Advanced Salivary Gland Cancer Patients	September 5, 2018	All	43
79	NCT03727321	Recruiting	Interventional	FMT and Fiber in Patients With Metabolic Syndrome	July 1, 2018	All	68
80	NCT03725215	Recruiting	Interventional	Motor Adaptation to Split-Belt Treadmill in Parkinson's Disease	December 1, 2017	All	128
81	NCT03724383	Recruiting	Interventional	Atrial Fibrillation Lifestyle Project	September 6, 2018	All	80
82	NCT03723525	Recruiting	Interventional	Package of Care to Improve Retention in ART and Mortality Among Treatment Naive HIV Infected Individuals	March 1, 2018	All	1000
83	NCT03719235	Recruiting	Interventional	Accuracy of Linear Measurements of Ultra-low Dose Cone Beam Computed Tomography and Digital Panoramic Radiography	July 10, 2018	All	10
84	NCT03716219	Recruiting	Interventional	The Effect of 10-Week Exercise Training on Children With Asthma	October 10, 2013	All	42
85	NCT03714139	Enrolling by invitation	Interventional	Immediate Loading a Histological Study	March 3, 2018	All	12
86	NCT03711630	Recruiting	Interventional	Impact of Meditation on Bothersome Tinnitus	October 6, 2018	All	40
87	NCT03711370	Recruiting	Interventional	Opaque Bottle Study	October 15, 2018	All	100
88	NCT03709979	Enrolling by invitation	Interventional	Effect Of Position On Laryngeal Visualisation With The C-Mac Videolaryngoscope	January 21, 2019	All	96
89	NCT03704415	Recruiting	Interventional	Aggravated Airway Inflammation: Research on Genomics and Optimal Operative Treatment (AirGOs Operative)	October 23, 2018	All	174
90	NCT03704064	Recruiting	Interventional	Behavioral Weight Loss and Stigma Reduction	October 16, 2018	All	104
91	NCT03704051	Recruiting	Interventional	Breast Versus Bottle Study	October 15, 2018	All	40
92	NCT03699059	Recruiting	Interventional	The wEight Management in Renal Transplant Online Study (ExeRTiOn)	May 31, 2018	All	15
93	NCT03697837	Recruiting	Interventional	Digital Parent Training for Disruptive Behaviors in Children	September 18, 2018	All	32
94	NCT03695003	Recruiting	Interventional	Cognitive Effects of Sage in Healthy Humans	September 3, 2018	All	90
95	NCT03690154	Recruiting	Interventional	Study to Evaluate the Safety, Tolerability, Pharmacokinetics (PK) and Anti-tumor Activity of FN-1501 Monotherapy in Patients With Advanced Solid Tumors	July 23, 2018	All	33
96	NCT03689348	Recruiting	Interventional	Acute and Chronic Effects of Avena Sativa on Cognition and Stress	September 24, 2018	All	128
97	NCT03689049	Enrolling by invitation	Interventional	SPIDER: A Research & QI Collaboration Supporting Practices in Improving Care for Complex Elderly Patients	March 26, 2018	All	104
98	NCT03687411	Recruiting	Interventional	An Ultrasound Guided Automated Spinal Landmark Identification With Real-time Neuraxial Needle Insertion System	May 24, 2018	Female	70
99	NCT03685227	Recruiting	Interventional	A Closer Look at Yoga Nidra: Sleep Lab Analyses	September 10, 2018	All	22
100	NCT03682601	Recruiting	Interventional	Topical Treatment for Sexual Pain, Vulvar Pain, in Postmenopausal Women Not Taking Estrogens or Similiar Hormones. Women on Tamoxifen CAN Enter the Clinical Trial	August 30, 2018	Female	60
101	NCT03680833	Recruiting	Interventional	Sentinel Node Detection in Cervical Cancer	June 15, 2014	Female	226
102	NCT03679689	Recruiting	Interventional	Metabolism Effects of Artificially Sweetened Beverages Restriction	February 1, 2017	All	45
103	NCT03678935	Recruiting	Interventional	Effect of FODMAP Restriction on Persistent GI-symptoms in Coeliac Patients	November 26, 2018	All	72
104	NCT03675009	Recruiting	Interventional	Milwaukee Day Cares Indoor Air Quality Assessment and Educational Response Study	April 1, 2018	All	32
105	NCT03674996	Enrolling by invitation	Interventional	Safety and Security Evaluation of Patients Submitted to Minimally Invasive Radical Prostatectomy	March 22, 2017	Male	72
106	NCT03668873	Recruiting	Interventional	Telehealth Delivery of Treatment for Sleep Disturbances in Young Children With Autism Spectrum Disorder	January 1, 2019	All	90
107	NCT03667755	Recruiting	Interventional	Fast Track Recovery Surgery Among Gynecologic Oncology Patients	October 3, 2017	Female	106
108	NCT03667001	Recruiting	Interventional	Comparing Analgesic Efficacy of Systemic Lidocaine Against Placebo in General Anesthesia in Bariatric Surgery	November 16, 2018	All	140
109	NCT03663075	Recruiting	Interventional	Effect of Group Education and Individual Counselling on Mental Health and Quality of Life in 45-60 Year Old Women	September 24, 2018	Female	370
110	NCT03658434	Recruiting	Interventional	Palliative Radiotherapy to Dominant Symptomatic Lesion in Patients With Hormone Refractory Prostate Cancer	August 1, 2018	Male	34
111	NCT03654508	Recruiting	Interventional	Pharmacogenetics Use For Further Treatment Improvement in childreN	June 12, 2018	All	310
112	NCT03648437	Recruiting	Interventional	Paracetamol And Ibuprofen in Closing Patent Ductus Arteriosus	September 3, 2018	All	20
113	NCT03648060	Recruiting	Interventional	Efficacy of a Digital Biofeedback System for Home-based Rehabilitation After Total Joint Replacement	October 8, 2018	All	160
114	NCT03648047	Recruiting	Interventional	Digital Biofeedback System Versus Conventional Rehabilitation After Rotator Cuff Repair	November 11, 2018	All	80
115	NCT03647007	Recruiting	Interventional	Short- and Long-term Health Effects of a Residential Stay in a Danish Christmas Seal Home.	September 11, 2018	All	600
116	NCT03646357	Recruiting	Interventional	BEtablocker Treatment After Acute Myocardial Infarction in Patients Without Reduced Left Ventricular Systolic Function	October 1, 2018	All	10000
117	NCT03646240	Recruiting	Interventional	ABI-009 (Nab-rapamycin) for Surgically-Refractory Epilepsy (RaSuRE)	July 31, 2018	All	18
118	NCT03645603	Recruiting	Interventional	Efficacy and Safety of Dexmedetomidine During Weaning From Analgesia and Sedation in PICU (TIP-15-01)	August 30, 2018	All	160
119	NCT03645005	Recruiting	Interventional	A Research Study for Latina Women After Breast Cancer Treatment	March 25, 2015	Female	80
120	NCT03642769	Recruiting	Interventional	Lactated Ringer's Versus Normal Saline for Acute Pancreatitis	September 18, 2018	All	119
121	NCT03638609	Recruiting	Interventional	The Effect of IABP Early Insertion on Mortality in Post Cardiac Arrest Patients With Acute Coronary Syndrome	October 23, 2017	All	102
122	NCT03635840	Recruiting	Interventional	The Effects of IABP Prior to Revascularization on Mortality of ACS Patients Complicated With Cardiogenic Shock	January 4, 2018	All	92
123	NCT03632837	Recruiting	Interventional	HaemoAdsorption Nach Reanimation An ECMO	October 2018	All	40
124	NCT03630770	Recruiting	Interventional	Effect of Medium Chain Triglyceride Intake on Colonization of Preterm Infants With Candida	June 5, 2014	All	120
125	NCT03630328	Recruiting	Interventional	Angelica Gigas Dietary Supplements and Human Immune Cells	August 2018	Male	40
126	NCT03628001	Enrolling by invitation	Interventional	A Study Comparing Sems Placement With and and Without Biliary Sphincterectomy in Patients With Malignant Biliary Obstruction	January 1, 2015	All	400
127	NCT03625544	Recruiting	Interventional	MagnetOs™ Granules vs. Autograft in Instrumented Posterolateral Spinal Fusion	July 4, 2018	All	100
128	NCT03623880	Recruiting	Interventional	Enhancing Behavioral Treatment for Women With Pelvic Floor Disorders	September 3, 2018	Female	40
129	NCT03620942	Recruiting	Interventional	Development of Advanced Double Intravenous Vasopressor Automated (ADIVA) System	November 7, 2018	Female	300
130	NCT03619720	Recruiting	Interventional	Emotional Perception and Production in Facial Palsy: Respiratory, Vocal and Facial Markers.	August 11, 2018	All	60
131	NCT03618108	Recruiting	Interventional	Anti-chlamydophila Antibiotic Combination Therapy in the Treatment of Patients With Coronary Heart Disease	April 4, 2018	All	60
132	NCT03618017	Enrolling by invitation	Interventional	The ConnectedCancerCare Pilot Study (CCC)	August 1, 2018	Female	60
133	NCT03615586	Recruiting	Interventional	The Use of Chaperone in Routine Anorectal Examination	July 26, 2018	Female	188
134	NCT03602768	Recruiting	Interventional	Evaluation of the Online Memory & Aging Program and Online Goal Management Training	June 18, 2018	All	200
135	NCT03602677	Recruiting	Interventional	Indocyanine Green Fluorescence Imaging in Prevention of Colorectal Anastomotic Leakage	September 24, 2018	All	1062
136	NCT03602014	Recruiting	Interventional	Dose Response to the Norepinephrine Precursor Droxidopa in Hypotensive Individuals With Spinal Cord Injury	June 1, 2018	All	65
137	NCT03600987	Enrolling by invitation	Interventional	Effect of Music on Reading Comprehension in Patients With Aphasia	April 4, 2018	All	4
138	NCT03598114	Enrolling by invitation	Interventional	Evaluating and Improving the Sustainability of State-level Tobacco Control Programs in the United States	July 1, 2018	All	288
139	NCT03593889	Recruiting	Interventional	Collaborative Stepped Care and Peer Support Programme for Older People At-Risk of or With Depression	October 1, 2017	All	2500
140	NCT03593148	Recruiting	Interventional	The Effect of Lifestyle Treatment in Patients With Morbid Obesity	April 1, 2017	All	600
141	NCT03591237	Recruiting	Interventional	MBCT for Cancer Patients in Follow-Up	March 1, 2018	All	120
142	NCT03585920	Recruiting	Interventional	The Influence of Fat Perception on Satiety From Consumption of Reduced Fat Snacks	July 2, 2018	All	50
143	NCT03585192	Recruiting	Interventional	Safety of Immediate Skin-to-Skin Contact After Vaginal Birth in Vigorous Late-Preterm Neonates	November 8, 2017	All	92
144	NCT03582046	Recruiting	Interventional	Targeting Abdominal Perfusion Pressure in Septic Shock	February 5, 2019	All	200
145	NCT03579303	Recruiting	Interventional	Homoeopathy and Yoga in the Treatment of Menstrual Disorders in Females With Polycystic Ovarian Syndrome	October 2018	Female	84
146	NCT03578848	Recruiting	Interventional	Guiding Hypertension Management Using Different Blood Pressure Monitoring Strategies	June 6, 2018	All	252
147	NCT03578432	Recruiting	Interventional	Everolimus in Restoring Salivary Gland Function in Participants With Locally Advanced Head and Neck Cancer Treated With Radiation Therapy	May 4, 2018	All	16
148	NCT03577301	Recruiting	Interventional	Young Men's Health Project Targeting HIV Risk Reduction and Substance Abuse	October 4, 2018	Male	270
149	NCT03577106	Enrolling by invitation	Interventional	A Pilot Functional Magnetic Resonance Imaging (fMRI) Study of TMS in Late-Life Severe Worry	December 6, 2018	All	20
150	NCT03577054	Recruiting	Interventional	Development of a Mobile Application for HBB Prompt Study	May 14, 2018	All	20
151	NCT03575026	Recruiting	Interventional	Effectiveness-Implementation Cluster RCT to Improve Community-dwelling Early Dementia Patients by Music Intervention	April 18, 2018	All	75
152	NCT03568812	Recruiting	Interventional	The Role of Probiotics in HIV Patients With Immunological Non-Responder	May 7, 2018	All	80
153	NCT03567031	Recruiting	Interventional	Impact of CO2 on Cerebral Blood Flow in Infants Less Than 6 Months During General Anaesthesia	November 27, 2017	All	60
154	NCT03567018	Recruiting	Interventional	Comprehensive Imaging of Perforator Vessels and Subcutaneous Vascular Network With No-Exogenous Contrast and Non-Ionizing-Radiation Magnetic Resonance Angiography	July 2, 2012	All	75
155	NCT03565354	Recruiting	Interventional	Efficacy of Preoperative Intravenous Iron in Anaemic Colorectal Cancer Surgical Patients	July 1, 2018	All	40
156	NCT03564665	Recruiting	Interventional	Investigating Magnesium Glycinate in Structure/Function Role of Hot Flashes.	July 24, 2018	Female	40
157	NCT03562546	Recruiting	Interventional	The Effect of Structured Exercise on Chronic Venous Insufficiency	August 1, 2018	All	60
158	NCT03561961	Recruiting	Interventional	Prostate Radiotherapy Comparing Moderate and Extreme Hypo-fractionation (PRIME Trial)	May 24, 2018	Male	434
159	NCT03561103	Recruiting	Interventional	Impact of Representative Payee Services on ART Adherence Among Marginalized People Living With HIV/AIDS	May 1, 2017	All	320
160	NCT03559751	Recruiting	Interventional	Evaluation of the Abuse Liability of Very Low Nicotine (VLN) Cigarettes	April 13, 2018	All	54
161	NCT03559179	Enrolling by invitation	Interventional	Clinical Decision Support for Opioid Use Disorders in Medical Settings: Usability Testing in an EMR	April 30, 2018	All	43
162	NCT03558763	Recruiting	Interventional	Remote Monitoring of Patients With COPD	June 7, 2018	All	70
163	NCT03555500	Recruiting	Interventional	Fasting or Non Fasting for Cardiac Catheterization	November 2, 2017	All	350
164	NCT03553927	Recruiting	Interventional	Investigating the Physiological Effects of Weight Loss on Male Fertility	May 16, 2018	Male	136
165	NCT03553004	Recruiting	Interventional	Niraparib in Metastatic Pancreatic Cancer After Previous Chemotherapy (NIRA-PANC): a Phase 2 Trial	January 22, 2019	All	18
166	NCT03552523	Recruiting	Interventional	The Set-Point Study for Type 2 Diabetes: Evaluating the Use of an Insulin Only Bionic Pancreas System in Type 2 Diabetes	July 28, 2017	All	20
167	NCT03550885	Recruiting	Interventional	Diet Modulation of Bacterial Sulfur and Bile Acid Metabolism and Colon Cancer Risk	August 1, 2018	All	44
168	NCT03543098	Recruiting	Interventional	STaR Trial: Multiple Ligament Knee Injuries	July 31, 2018	All	690
169	NCT03542383	Recruiting	Interventional	Treatment of Memory Disorders in Gulf War Illness With High Definition Transcranial Direct Cortical Stimulation	February 1, 2017	All	120
170	NCT03541291	Recruiting	Interventional	Utility of MRI With Doppler Ultrasound Gating for Advanced Fetal Monitoring	May 30, 2018	Female	20
171	NCT03540732	Recruiting	Interventional	Feeding With Indirect Calorimetry and Cycling in the Elderly	November 6, 2017	All	50
172	NCT03540368	Recruiting	Interventional	Tranexamic Acid for The Treatment of Gastrointestinal Bleeding	July 4, 2018	All	336
173	NCT03540134	Recruiting	Interventional	Convection Enhanced Delivery of CSF in DBS for Parkinson's	February 13, 2018	All	8
174	NCT03540069	Recruiting	Interventional	Reducing Barriers and Sustaining Utilization of a Cervical Cancer Screening Program in Rural Senegal	October 3, 2018	All	315
175	NCT03538730	Enrolling by invitation	Interventional	Pain After Tonsillectomy Study	January 12, 2018	All	100
176	NCT03538379	Enrolling by invitation	Interventional	Tourniquet Training Effectiveness Study	April 4, 2018	All	34
177	NCT03537612	Recruiting	Interventional	Sensorial and Physiological Mechanism-based Assessments of Perioperative Pain	June 22, 2018	Female	150
178	NCT03535675	Recruiting	Interventional	Muscadine Plus (MPX) In Men With Prostate Cancer	October 30, 2018	Male	80
179	NCT03534362	Enrolling by invitation	Interventional	Propel Stent vs Kenalog-soaked Nasopore After Frontal Drill-out	April 13, 2018	All	90
180	NCT03527927	Recruiting	Interventional	sTep dOWn Inhalers in the reAl woRlD	May 17, 2017	All	80
181	NCT03527849	Recruiting	Interventional	Effects of Mindfulness-Based Stress Reduction on Knee Osteoarthritis	January 30, 2018	All	30
182	NCT03527121	Recruiting	Interventional	Management of Acute Lateral Ankle Sprains	May 22, 2018	All	226
183	NCT03526068	Recruiting	Interventional	Proof-of-concept Study on Disinfection and Healing Acceleration Capabilities of 222nm Wave Length Narrow Band Ultraviolet Lighting Device	December 2016	All	20
184	NCT03526042	Recruiting	Interventional	Angiotensin-II Receptor Antibodies Blockade With Losartan in Patients With Lupus Nephritis	September 10, 2017	All	40
185	NCT03524703	Recruiting	Interventional	Short-term Effect of Chewing Gum in Patients With Mild-moderate Dysphagia After Anterior Cervical Fusion	April 28, 2018	All	90
186	NCT03523806	Recruiting	Interventional	Children and Teens in Charge of Their Health	March 23, 2018	All	30
187	NCT03523299	Enrolling by invitation	Interventional	Pilot Study to Define the Immune Response Following Cryoablation of Invasive Breast Cancer	May 22, 2018	Female	22
188	NCT03521960	Recruiting	Interventional	Buspirone for Opioid Tapering	May 30, 2018	All	50
189	NCT03519750	Recruiting	Interventional	Pharmacokinetics of Intravenous, Rectal, Intravesical, Vaginal, and Transdermal Melatonin in Healthy Female Volunteers	November 1, 2018	Female	10
190	NCT03519659	Recruiting	Interventional	Validating Low FDG Dose PET/CT Compared to Current Standard of Care Dose PET/CT	July 21, 2015	All	204
191	NCT03518216	Recruiting	Interventional	Neural Mechanisms of Treatment Response to ADAPT	July 3, 2018	All	93
192	NCT03517397	Recruiting	Interventional	Mobile Contingency Management for Smoking Cessation (R01 Supplement)	August 15, 2018	All	20
193	NCT03516877	Recruiting	Interventional	Enhanced Stress Resilience Training for Faculty	July 9, 2018	All	100
194	NCT03513822	Recruiting	Interventional	Ketamine's Efficiency in the Treatment of Chronic Pain: Kynurenin Pathway	February 16, 2018	All	48
195	NCT03512691	Recruiting	Interventional	The Nueva Ecija Cardiovascular Risk Experiment	January 20, 2018	All	5019
196	NCT03510195	Recruiting	Interventional	Effectiveness of Medicorp HO Preparatory Course	April 27, 2018	All	286
197	NCT03508921	Recruiting	Interventional	Comparison of Methods for Prevention of Urinary Tract Infection Following Botox Injection	July 1, 2018	All	68
198	NCT03508908	Recruiting	Interventional	Tambua Mapema Plus - to Discover HIV Infection Early and Prevent Onward Transmission	December 1, 2017	All	2875
199	NCT03507647	Recruiting	Interventional	Mindfulness Based Cognitive Therapy for Bipolar Disorder	April 23, 2018	All	160
200	NCT03503721	Recruiting	Interventional	Bipolar Transurethral Enucleation (BipolEP) vs Bipolar Transurethral Resection of the Prostate	January 18, 2018	Male	84
201	NCT03503162	Recruiting	Interventional	Evaluation of the Bowel Cleansing in Hospitalized Patients Using Pure-Vu System	May 17, 2018	All	100
202	NCT03502655	Recruiting	Interventional	Discomfort During Intravenous Cannulation in an Emergency Department: Impact of Communication	December 13, 2017	All	240
203	NCT03502252	Enrolling by invitation	Interventional	Experimental Evaluation of Semillas de Apego	March 5, 2018	All	1280
204	NCT03501316	Recruiting	Interventional	The Immune Response After Periodontal Treatment	May 1, 2018	All	42
205	NCT03500419	Recruiting	Interventional	Penile Length Maintenance Post-Prostatectomy	March 23, 2018	Male	60
206	NCT03500406	Recruiting	Interventional	Penile Lengthening Pre-Penile Prosthesis Implantation	March 23, 2018	Male	80
207	NCT03500367	Recruiting	Interventional	Efficacy and Safety of Rapamycin (Sirolimus) in the Treatment of Symptomatic Uterine Fibroids and Leiomyomatosis	January 1, 2018	Female	25
208	NCT03496948	Enrolling by invitation	Interventional	Telephone Health Coaching and Remote Exercise Monitoring for Peripheral Artery Disease	April 23, 2018	All	1760
209	NCT03495791	Recruiting	Interventional	Educational Intervention to Improve Patient-Physician Awareness of Cardiovascular Risk in Rheumatoid Arthritis.	October 31, 2016	All	400
210	NCT03495752	Enrolling by invitation	Interventional	The Effect of Fatigue on the Forward-Step-Down Test	June 21, 2018	All	9
211	NCT03495661	Recruiting	Interventional	Decompression vs Physical Training for the Treatment of Lumbar Spinal Stenosis	May 4, 2018	All	150
212	NCT03495518	Recruiting	Interventional	Enabling Symptom Identification and Tracking in Children Receiving Cancer Treatment	July 2, 2018	All	30
213	NCT03495089	Recruiting	Interventional	DECODING Study (Dermal Electrochemical Conductance in Diabetic Neuropathy)	May 2015	All	160
214	NCT03494816	Recruiting	Interventional	Study of Axitinib for Reducing Extent of Venous Tumour Thrombus in Renal Cancer With Venous Invasion	December 15, 2017	All	20
215	NCT03494335	Recruiting	Interventional	Online Surveys to Assess the Perception and Performance of Imaging and Associated Aspects	April 30, 2018	All	5000
216	NCT03494205	Recruiting	Interventional	Urtica Comp. Gel for Prevention and Therapy of Radiation Dermatitis	May 2, 2018	All	30
217	NCT03492476	Recruiting	Interventional	Circaid® Compression Sleeve Versus Short-stretching Bandage in Upper Limb Lymphatic Edema	September 8, 2017	Female	140
218	NCT03491059	Recruiting	Interventional	Feasibility of PET/CT to Detect the Oral/Pulmonary Distribution of Nicotine Following E-cigarette Use	February 16, 2018	All	40
219	NCT03491046	Recruiting	Interventional	Molecular Imaging Assessment of ACL Viability	October 9, 2013	All	100
220	NCT03490812	Recruiting	Interventional	Assessment of Investigational Positron Emission Tomography and Post-Processing Procedures Performed as Add-ons to Standard of Care Imaging	January 2, 2015	All	700
221	NCT03490656	Recruiting	Interventional	Assessment of Investigational Magnetic Resonance Imaging and Post-Processing Procedures	October 21, 2016	All	400
222	NCT03489395	Recruiting	Interventional	A Pilot Study on Edoxaban for the Resolution of Left Atrial Thrombosis in Patients With Non-valvular Atrial Fibrillation	January 30, 2018	All	25
223	NCT03488511	Recruiting	Interventional	The Impact of Preoperative FoodforCare at Home on Nutritional and Functional Outcomes	March 5, 2018	All	122
224	NCT03487718	Recruiting	Interventional	A 14 Weeks Longitudinal Study to Investigate the Effect of Leukocyte- Platelet Rich Fibrin Plug on the Quality of the Newly Formed Bone in Ridge Preservation Procedure Following a Tooth Extraction. It is a Clinical, Radiographic and Histomorphometric Study.	March 26, 2018	All	40
272	NCT03438708	Recruiting	Interventional	Prior Axitinib as a Determinant of Outcome of Renal Surgery	March 5, 2018	All	50
225	NCT03486444	Recruiting	Interventional	Exploring New and Next Generation Ultrasound Technologies for Medical Education, Patient Care, and New Indications	July 1, 2018	All	750
226	NCT03486106	Recruiting	Interventional	Music Distraction and Its Influence on Anesthetic Requirements During Elective Knee Surgery	July 13, 2018	All	32
227	NCT03484533	Enrolling by invitation	Interventional	HIV Self Testing of Male Partners of Women in PMTCT	May 17, 2018	All	1000
228	NCT03484338	Recruiting	Interventional	Accelerated Resolution Therapy for Complicated Grief	February 20, 2018	All	50
229	NCT03484273	Recruiting	Interventional	Hemodynamic Effects of Compression in POTS	July 12, 2018	All	40
230	NCT03483935	Recruiting	Interventional	Microwave Therapy for Treatment of Precancerous Actinic Keratoses	March 7, 2018	All	12
231	NCT03482908	Recruiting	Interventional	Coordination of Care Between Pediatricians and Women Infants & Children Nutritionists	July 6, 2016	All	290
232	NCT03481023	Recruiting	Interventional	Esophageal Cooling in Radiofrequency Cardiac Ablation	March 16, 2018	All	6
233	NCT03479697	Recruiting	Interventional	HIRREM for Stage 1 Primary Hypertension	August 8, 2018	All	24
234	NCT03478163	Recruiting	Interventional	Antibiotics During Intrauterine Balloon Tamponade Placement	March 8, 2018	Female	185
235	NCT03478137	Enrolling by invitation	Interventional	Obstructive Sleep Apnea, CPAP Treatment & Cognitive Ability in HIV	June 5, 2017	All	30
236	NCT03477500	Recruiting	Interventional	RCT Comparing Autologous Hematopoietic Stem Cell Transplantation Versus Alemtuzumab in MS	March 21, 2018	All	100
237	NCT03477045	Recruiting	Interventional	Does Consuming Modified Plant Seed Oil Containing Fish Oil Fatty Acids Act in the Same Way as Consuming Fish Oil?	June 9, 2017	All	80
238	NCT03473899	Recruiting	Interventional	Radial Extracorporeal Shock Wave Therapy for Acute Hamstring Muscle Complex Injury Type 3b in Athletes	March 22, 2018	All	40
239	NCT03473665	Recruiting	Interventional	Non-Steroidal Anti-inflammatory Drugs in Axial Spondyloarthritis	March 1, 2018	All	30
240	NCT03472820	Recruiting	Interventional	Methylation Diet and Lifestyle Study	February 1, 2018	Male	48
241	NCT03472430	Recruiting	Interventional	Transcutaneous Electrical Nerve Stimulation During Transvaginal Oocyte Retrieval	May 4, 2018	Female	160
242	NCT03472378	Recruiting	Interventional	Can DFN-15 Terminate Migraine With Allodynia?	April 1, 2018	All	100
243	NCT03471117	Recruiting	Interventional	Pioglitazone to Reduce Sympathetic Overactivity in CKD Patients	April 1, 2018	All	28
244	NCT03470389	Recruiting	Interventional	Establishment and Assessment of the HVPG Using Biofluid Mechanics (HVPGBFM)	March 20, 2018	All	200
245	NCT03469609	Recruiting	Interventional	"Mucous Fistula Refeeding Reduces the Time From Enterostomy Closure to Full Enteral Feeds (MUCous FIstula REfeeding (""MUC-FIRE"") Trial)"	June 18, 2018	All	106
246	NCT03468621	Recruiting	Interventional	Relation of Skin Closure Method to Groin Wound Infections After Proximal Femoral Artery Exposure.	March 29, 2018	All	480
247	NCT03466164	Recruiting	Interventional	Neural Mechanisms of Mindfulness	July 3, 2017	All	50
248	NCT03465982	Recruiting	Interventional	Timing to Minimally Invasive Surgery After Neoadjuvant Chemoradiotherapy for Rectal Cancer	June 5, 2018	All	332
249	NCT03464773	Enrolling by invitation	Interventional	Pain and Irritability in Non-Verbal Children	April 15, 2018	All	120
250	NCT03464266	Recruiting	Interventional	The Kampala Women's Bone Study	May 15, 2018	Female	500
251	NCT03462966	Recruiting	Interventional	Rifaximin on Visceral Hypersensitivity	July 1, 2018	All	40
252	NCT03462823	Recruiting	Interventional	Use of an Osteoconductive Scaffold in ACL-Reconstruction	August 29, 2017	All	56
253	NCT03459014	Recruiting	Interventional	Immersive Virtual Reality During Robot-assisted Walking.	September 12, 2018	All	28
254	NCT03457519	Recruiting	Interventional	Children's Automated Respiration Monitor (ChARM) for Child Pneumonia Diagnosis by Community Health Workers in Mali	March 5, 2018	All	148
255	NCT03457506	Recruiting	Interventional	Intra-individual Comparison of Conventional and Digital PET/CT Scanners	January 8, 2018	All	225
256	NCT03456895	Recruiting	Interventional	Assessing Environmental Factors in Healthcare Facilities in Order to Improve the Experience of Patients, Staff, and the Quality of Imaging Procedures	December 5, 2017	All	1500
257	NCT03456128	Recruiting	Interventional	Reducing Disability Following Hospital Discharge in Vulnerable Older Adults: The CAPABLE Intervention	August 25, 2018	All	268
258	NCT03455426	Enrolling by invitation	Interventional	Intrauterine Insemination With Letrozole Versus in Natural Cycle	March 15, 2018	Female	100
259	NCT03454282	Recruiting	Interventional	Impact of Dietary Intervention on Tumor Immunity: the DigesT Trial	July 1, 2018	All	100
260	NCT03454087	Recruiting	Interventional	Study of Early Enteral Dextrose in Sepsis	June 4, 2018	All	72
261	NCT03453190	Recruiting	Interventional	Apremilast in Combination With Clobetasol Spray for the Treatment of Plaque Psoriasis	February 25, 2018	All	20
262	NCT03451266	Recruiting	Interventional	Effects of Vitamin C Administration on Extravascular Lung Water in Patients With Severe Features of Preeclampsia	April 7, 2018	Female	34
263	NCT03450655	Enrolling by invitation	Interventional	Cardio Training of Older Adults With Central Obesity	February 9, 2018	All	80
264	NCT03450564	Recruiting	Interventional	Effect of Community-Based Interventions on Increasing Family Planning Utilization in Pastoralist Community	October 1, 2017	All	891
265	NCT03449693	Recruiting	Interventional	Efficacy of Oral Supplementation With Magnesium to Reduce Febrile Neutropenia	October 19, 2017	All	214
266	NCT03448289	Recruiting	Interventional	Use of a Reproductive Life Planning Tool at the Pediatric Well-Baby Visit With Postpartum Women	January 24, 2018	Female	160
267	NCT03447119	Recruiting	Interventional	Living Well With a Disability Curriculum Adaptation Evaluation Plan	March 24, 2018	All	100
268	NCT03444103	Recruiting	Interventional	A Pilot Trial of Clazakizumab in Late ABMR	January 16, 2018	All	20
269	NCT03443388	Recruiting	Interventional	Novel Helmet Design in Patients With Seizures	August 14, 2017	All	24
270	NCT03443258	Recruiting	Interventional	Needs Assessment Tool Integrated in Clinical Practice of Head and Neck Cancer Rehabilitation	June 11, 2018	All	128
271	NCT03441867	Recruiting	Interventional	Neuroimaging Biomarker for Seizures	September 15, 2017	All	264
273	NCT03435497	Recruiting	Interventional	Pilot Intervention to Empower HIV Clients as Prevention Advocates in Uganda	April 16, 2018	All	96
274	NCT03435172	Recruiting	Interventional	Safety and Feasibility of ADRCs Treatment To Patients With Thermal Wounds	April 1, 2018	All	15
275	NCT03434392	Recruiting	Interventional	QST Study: Predicting Treatment Response in Chronic Pancreatitis Using Quantitative Sensory Testing	October 24, 2017	All	500
276	NCT03433222	Recruiting	Interventional	Phase 1 Study of HF-LED-RL in Fitzpatrick Skin Types I to III	January 31, 2018	All	60
277	NCT03432832	Recruiting	Interventional	Emotion Awareness and Skills Enhancement Program	January 30, 2018	All	100
278	NCT03432819	Recruiting	Interventional	Siempre Seguiré: A Pilot Intervention to Improve Coping With Discrimination and Adherence Among HIV-Positive Latino MSM	March 26, 2018	Male	80
279	NCT03429010	Recruiting	Interventional	Efficacy of Perioperative Anesthesia Care Bundle on Prognosis in Elderly Undergoing Hip Fracture Surgery	July 1, 2018	All	300
280	NCT03428477	Recruiting	Interventional	EPA for Metastasis Trial 2	March 16, 2018	All	448
281	NCT03426436	Enrolling by invitation	Interventional	Evaluation of Synthesized 18-Lead ECG in the Emergency Department	February 14, 2018	All	314
282	NCT03425890	Recruiting	Interventional	Effect of Self-empowered Upper Limb Repetitive Engagement (SURE) Program on Upper Limb Recovery After Stroke	February 2, 2018	All	20
283	NCT03423394	Recruiting	Interventional	Efficacy Trial of Stress Check-Up	January 5, 2018	All	200
284	NCT03423303	Enrolling by invitation	Interventional	A Randomized Trial of Early Detection of Clinically Significant Prostate Cancer (ProScreen)	April 23, 2018	Male	11056
285	NCT03422536	Recruiting	Interventional	Ficlatuzumab w/wo Cetuximab in Patients w/Cetuximab-Resistant, Recurrent or Metastatic Head/Neck Squamous Cell Carcinoma	December 5, 2017	All	74
286	NCT03421262	Recruiting	Interventional	Pregnancy Outcomes and Medical Costs According to Gestational Diabetes Mellitus Diagnostic Criteria	June 1, 2017	Female	3644
287	NCT03420404	Recruiting	Interventional	Clinical Trial of TCM Collaborative Care Model in Axial Spondyloarthritis	March 5, 2018	All	160
288	NCT03419715	Recruiting	Interventional	Topical Bimatoprost in the Treatment of Migraine	January 5, 2018	All	80
289	NCT03418870	Recruiting	Interventional	Improving Preterm Infant Outcomes With Family Integrated Care and Mobile Technology	April 3, 2017	All	350
290	NCT03418324	Recruiting	Interventional	Study of TRC105 With Abiraterone and With Enzalutamide in Prostate Cancer Patients Progressing on Therapy	March 5, 2018	Male	40
291	NCT03415880	Recruiting	Interventional	Light Intensity Physical Activity Trial	February 15, 2018	All	160
292	NCT03415841	Recruiting	Interventional	Kardia - A Smartphone-based Care Model for Outpatient Cardiac Rehabilitation	February 1, 2018	All	100
293	NCT03412149	Recruiting	Interventional	Three M Study (Malabsorption, Microbiota, Mini-Gastric Bypass)	March 21, 2018	All	90
294	NCT03412084	Recruiting	Interventional	"A ""Stand Up and Move More"" Intervention for Older Adults"	March 14, 2018	All	80
295	NCT03410511	Recruiting	Interventional	Propylene Glycol/Glycerol Intake and Cardiorespiratory Function	January 15, 2018	Male	21
296	NCT03408873	Recruiting	Interventional	CAE Plus LAI in Individuals With Bipolar Disorder at Risk for Treatment Non-adherence (BD-CAEL)	April 1, 2018	All	30
297	NCT03408574	Recruiting	Interventional	The Nicotinic Cholinergic System and Cognitive Aging	October 1, 2016	All	96
298	NCT03406520	Recruiting	Interventional	Chlorhexidine Disk for Prevention of Exit-site Infection in Peritoneal Dialysis Patients	March 7, 2018	All	50
299	NCT03405090	Recruiting	Interventional	Differential Mechanisms of Dyspnea Relief in Advanced COPD: Opiates vs. Bronchodilators	September 20, 2017	All	17
300	NCT03404011	Recruiting	Interventional	Acute Effects of Propylene Glycol/Glycerol Intake on Blood Parameters	January 15, 2018	All	30
301	NCT03401047	Recruiting	Interventional	Study to Assess Potential Impairments in Estradiol Augmentation of Gonadotropin Secretion in Polycystic Ovary Syndrome	November 30, 2017	Female	37
302	NCT03399318	Recruiting	Interventional	Aggressive Antipyretics for Fever Reduction in CNS Malaria	July 2, 2018	All	284
303	NCT03397030	Recruiting	Interventional	Impact of Exercise on Prognostic Biomarkers Related to Prostate Cancer	January 5, 2017	Male	30
304	NCT03396094	Recruiting	Interventional	Pre- and Apnoeic Oxygenation for RSI in ED	May 7, 2018	All	184
305	NCT03394599	Recruiting	Interventional	Motivating Videos to Encourage Cycling for Geriatric Rehabilitation	January 15, 2018	All	120
306	NCT03392415	Recruiting	Interventional	The NOrdic-Baltic Randomized Registry Study for Evaluation of PCI in Chronic Total Coronary Occlusion	June 1, 2018	All	2000
307	NCT03386227	Recruiting	Interventional	Prophylactic Antibiotics Prior to Embryo Transfer (PAPET): RCT	January 21, 2018	All	356
308	NCT03384706	Recruiting	Interventional	A Comparison of CPT Versus ART Versus WL	September 6, 2017	All	280
309	NCT03382171	Recruiting	Interventional	The Impact of a Home Delivered Meal Service in Advanced Cancer Patients During Chemotherapy	November 17, 2017	All	164
310	NCT03382093	Recruiting	Interventional	Personalized Feedback for Smokers With Elevated Anxiety Sensitivity	August 23, 2017	All	130
311	NCT03381027	Recruiting	Interventional	BABY SMART (Study of Massage Therapy, Sleep And neurodevelopMenT)	June 5, 2017	All	200
312	NCT03380884	Recruiting	Interventional	Vibration Therapy as a Rehabilitation Intervention for Postural Training and Fall Prevention	April 1, 2018	All	100
313	NCT03380013	Recruiting	Interventional	OMT to Improve Feeding After Hypothermia	October 24, 2017	All	12
314	NCT03379818	Recruiting	Interventional	Vocabulary Intervention for Late Talkers	June 19, 2018	All	30
315	NCT03375879	Recruiting	Interventional	Bandage Contact Lens in Post Operative Ptosis Patients	February 21, 2018	All	30
316	NCT03375229	Recruiting	Interventional	Dry Needling and Low-level Laser Therapy to Treat Myofascial Pain	April 1, 2018	Female	60
317	NCT03372174	Recruiting	Interventional	Maintaining Mechanical Ventilation During Cardiopulmonary Bypass for Cardiac Surgery	January 10, 2018	All	1400
318	NCT03371836	Recruiting	Interventional	Use of Clobazam for Epilepsy and Anxiety	October 1, 2017	All	30
319	NCT03369600	Enrolling by invitation	Interventional	Characterisation of Uterine Fibroid Tissue Stiffness	August 17, 2018	Female	60
320	NCT03367364	Recruiting	Interventional	Patient Education Bundle vs. Nurses Feedback and Coaching to Prevent Missed Doses of Venous Thromboembolism (VTE) Prophylaxis	January 1, 2018	All	16
321	NCT03365518	Recruiting	Interventional	Innovations in the Treatment of Sexual Health Post Prostate Cancer Treatment: Comparing Mindfulness vs. CBT	December 29, 2017	All	141
322	NCT03364660	Recruiting	Interventional	Task-specific Epidural Stimulation Study	November 8, 2017	All	36
323	NCT03364114	Recruiting	Interventional	Endorotor Resection In Refractory Barrett's Dysplasia Patients	February 9, 2018	All	110
324	NCT03362983	Recruiting	Interventional	Integrated, Multidisciplinary, Person-centered Care for Patients With Complex Comorbidities: Heart, Kidney and Diabetes	January 1, 2016	All	260
325	NCT03359863	Recruiting	Interventional	Pirfenidone for Restrictive Chronic Lung Allograft Dysfunction	January 8, 2018	All	10
326	NCT03357042	Recruiting	Interventional	Evaluation of a Physical Intervention for Persistent Post-Concussive Symptoms	March 8, 2018	All	60
327	NCT03356652	Recruiting	Interventional	Electrical Activation Mapping Guided Tailor Made Approach for Cardiac Resynchronization Therapy	March 8, 2018	All	93
328	NCT03356210	Recruiting	Interventional	Neurofeedback Training for the Treatment of Substance Use Disorders	September 12, 2017	All	100
329	NCT03356106	Recruiting	Interventional	Screening and Treatment of Obstructive Sleep Apnea in High-risk Pregnancy	November 16, 2016	Female	440
330	NCT03355456	Recruiting	Interventional	Low Voltage-Directed Catheter Ablation for Atrial Fibrillation	January 31, 2019	All	303
331	NCT03354325	Recruiting	Interventional	The Bronchiolitis Follow-up Intervention Trial	January 1, 2018	All	294
332	NCT03354286	Enrolling by invitation	Interventional	Supporting Parents of Young Children With Type 1 Diabetes in Closed-Loop System	November 7, 2017	All	40
333	NCT03353298	Recruiting	Interventional	Lowering Uric Acid in Live Kidney Donors	January 17, 2018	All	80
334	NCT03352947	Recruiting	Interventional	Continuous vs Intermittent Dabrafenib Plus Trametinib in BRAFV600 Mutant Stage 3 Unresectable or Metastatic Melanoma	November 3, 2017	All	150
335	NCT03350737	Recruiting	Interventional	Coronary Arteriogenetic Heparinized Exercise	February 1, 2013	All	60
336	NCT03348761	Recruiting	Interventional	rTMS Response Trajectories in Depression	August 4, 2015	All	130
337	NCT03346668	Recruiting	Interventional	Role of Neurogenic Inflammation and Topical 6% Gabapentin Therapy in Symptomatic Scarring Alopecia	January 28, 2016	All	10
338	NCT03342976	Recruiting	Interventional	Investigating My Active and Healthy Aging	May 3, 2018	All	600
339	NCT03341975	Recruiting	Interventional	Enhanced SexHealth Intervention to Improve Adolescent Outcomes	December 1, 2017	All	116
340	NCT03341520	Recruiting	Interventional	Gazyvaro and Low Dose Radiotherapy in Early Stage Follicular Lymphoma	April 24, 2018	All	93
341	NCT03340922	Recruiting	Interventional	MANual vs. automatIC Local Activation Time Annotation for Guiding Premature Ventricular Complex Ablation	December 1, 2017	All	100
342	NCT03337607	Recruiting	Interventional	Radial Extracorporeal Shock Wave Therapy for Chronic Non-specific Low Back Pain	November 13, 2017	All	150
343	NCT03337360	Recruiting	Interventional	The Impact of a Nutritional Supplement (Impryl®) on Male Fertility	April 23, 2018	Male	1200
344	NCT03336879	Recruiting	Interventional	Repetitive Transcranial Magnetic Stimulation in Gambling Disorder	November 1, 2017	All	10
345	NCT03335475	Recruiting	Interventional	Congenital Heart Disease Physical Activity Lifestyle Study	October 5, 2017	All	100
346	NCT03335358	Recruiting	Interventional	Testing a Positive Psychology-based Intervention for Couples Coping With Stroke	April 14, 2017	All	70
347	NCT03335319	Recruiting	Interventional	The Effect Of An Expanded Long Term Periodization Exercise Training In Patients With Cardiovascular Disease	October 1, 2017	All	56
348	NCT03335124	Recruiting	Interventional	The Effect of Vitamin C, Thiamine and Hydrocortisone on Clinical Course and Outcome in Patients With Severe Sepsis and Septic Shock	September 26, 2017	All	30
349	NCT03334643	Recruiting	Interventional	Fiber Mix and Glycemic Response	June 4, 2018	All	20
350	NCT03333460	Recruiting	Interventional	Transcranial Magnetic Stimulation for Cocaine Addiction	October 1, 2017	All	80
351	NCT03333174	Recruiting	Interventional	Prematurity Related Ventilatory Control (PRE-VENT) - Specific Aim 3	April 4, 2018	All	25
352	NCT03333161	Recruiting	Interventional	Prematurity Related Ventilatory Control (PRE-VENT) - Specific Aim 2	April 4, 2018	All	25
353	NCT03326232	Recruiting	Interventional	Real-time Continuous Glucose Monitoring	November 13, 2017	Female	40
354	NCT03324451	Recruiting	Interventional	The Effectiveness of Intervention on Insulin Injection	March 1, 2018	All	152
355	NCT03323359	Recruiting	Interventional	Efficacy and Tolerability of Hemopatch After Hepatic Resection	March 17, 2017	All	98
356	NCT03322774	Recruiting	Interventional	Sleep To Reduce Incident Depression Effectively	March 9, 2018	All	500
357	NCT03322072	Recruiting	Interventional	Calypso Guided High Precision Stereotactic Ablative Radiosurgery for Lung TUmours Using Real-Time Tumour Tracking & Respiratory Gating	November 23, 2017	All	28
358	NCT03320057	Recruiting	Interventional	Medication Abortion Via Pharmacy Dispensing	June 1, 2018	Female	250
359	NCT03318874	Recruiting	Interventional	Optimization of the Treatment of Dry Eye Disease Caused by Meibomian Gland Dysfunction	October 19, 2017	All	120
360	NCT03314792	Recruiting	Interventional	Effects of Tapentadol Versus Oxycodone After Hysterectomy.	December 4, 2017	Female	90
361	NCT03313492	Recruiting	Interventional	Modifying Young Adult Skin Cancer Risk and Protective Behaviors	September 7, 2018	All	1540
362	NCT03308851	Recruiting	Interventional	Evaluation of the Effects of Osteoperforation and Piezocorticision on Canine Retraction	January 1, 2018	All	30
363	NCT03306992	Recruiting	Interventional	Precision-exercise-prescription for Lung Cancer Patients Undergoing Surgery: The PEP Study	November 1, 2017	All	200
364	NCT03304626	Recruiting	Interventional	Budesonide for Liver Transplant Immune Suppression	June 27, 2017	All	20
365	NCT03304301	Recruiting	Interventional	Effect of Sunlight Exposure and Outdoor Activities on Depression, Cognition and Quality of Life in the Elderly	June 30, 2016	All	74
412	NCT03044613	Recruiting	Interventional	Nivolumab +/- Relatlimab Prior to Chemoradiation Plus Nivolumab +/- Relatlimab With II/III Gastro/Esophageal Cancer	July 11, 2017	All	32
366	NCT03302858	Recruiting	Interventional	A Safety and Efficacy Trial of Circumferential Anal Canal Radiofrequency Ablation for High-Grade Anal Intraepithelial Neoplasia Using the BARRX™ Anorectal Wand	October 2017	All	70
367	NCT03302299	Recruiting	Interventional	Alcohol Drinkers' Exposure to Preventive Therapy for TB (ADEPTT)	April 7, 2017	All	300
368	NCT03301311	Recruiting	Interventional	Personalized Research on Diet in Ulcerative Colitis and Crohn's Disease	April 10, 2018	All	120
369	NCT03299816	Recruiting	Interventional	Five, Plus Nuts and Beans for Kidneys	December 4, 2017	All	150
370	NCT03299296	Enrolling by invitation	Interventional	Thromboprophylaxis in Patients Undergoing Orthopedic Surgeries; Comparison Between Rivaroxaban and Enoxaparin	January 1, 2017	All	100
371	NCT03297658	Recruiting	Interventional	Electro-acupuncture (EA) in Children Undergoing Procedures for Congenital Heart Defects.	November 15, 2017	All	108
372	NCT03297346	Recruiting	Interventional	Early Detection of Cardiovascular Changes After Radiotherapy for Breast Cancer	September 1, 2017	Female	250
373	NCT03295708	Recruiting	Interventional	Fish Oil as Adjunct Treatment for Major Depressive Disorder	October 1, 2017	All	120
374	NCT03295422	Recruiting	Interventional	Comparison of Two Pulmonary Vein Ablation Techniques for Persistent AF	August 25, 2017	All	200
375	NCT03294395	Recruiting	Interventional	New AntiBiotic Treatment Options for Uncomplicated Anogenital GOnorrhoea	September 18, 2017	All	408
376	NCT03291951	Enrolling by invitation	Interventional	FOcus on Reducing Dose-limiting Toxicities in Colon Cancer With Resistance Exercise Study	February 16, 2018	All	180
377	NCT03290833	Recruiting	Interventional	Is the Rehabilitation Robotic a Safe and Effective Choice for Stroke Patients?	November 24, 2017	All	36
378	NCT03290560	Recruiting	Interventional	Evaluation to Assess Safety and Tolerability of DM199 in Subjects With Acute Ischemic Stroke	January 19, 2018	All	60
379	NCT03289858	Recruiting	Interventional	Randomized Controlled Trial for Exparel Hip Fracture	September 1, 2017	All	50
380	NCT03286374	Recruiting	Interventional	Do Change in Life Style Improve Work Ability?	August 30, 2017	All	60
381	NCT03283943	Recruiting	Interventional	PDL-1 Inhibition and Focal Sensitizing Radiotherapy in Recurrent Ovarian/Primary Peritoneal/Fallopian Tube Cancers.	April 1, 2018	Female	22
382	NCT03275571	Enrolling by invitation	Interventional	HIV, Computerized Depression Therapy & Cognition	September 6, 2017	All	30
383	NCT03269071	Enrolling by invitation	Interventional	Neural Stem Cell Transplantation in Multiple Sclerosis Patients	May 17, 2017	All	4
384	NCT03268213	Recruiting	Interventional	Fecal Microbial Transplantation for C. Difficile and/or Ulcerative Colitis or Indeterminate Colitis	November 2013	All	100
385	NCT03267420	Recruiting	Interventional	Blood Pressure Measurement: Should Technique Define Targets?	October 12, 2017	All	90
386	NCT03267238	Recruiting	Interventional	Fecal Microbial Transplantation in Patients With Crohn's Disease	June 16, 2017	All	40
387	NCT03263780	Recruiting	Interventional	High Resolution PET-MRI Before Prostate Cancer HIFU	December 7, 2017	Male	20
388	NCT03263156	Recruiting	Interventional	A Brief Parent-based Sleep Intervention for ADHD Children	April 1, 2017	All	60
389	NCT03256396	Recruiting	Interventional	Intraoperative PEEP Setting During Laparoscopic Gynecologic Surgery	March 30, 2018	Female	44
390	NCT03254589	Recruiting	Interventional	Methotrexate, Blood Pressure and Arterial Function in Rheumatoid Arthritis	October 1, 2017	All	124
391	NCT03251495	Recruiting	Interventional	Immunologic Responses to a Live Attenuated Oral Cholera Vaccine	August 29, 2017	All	50
392	NCT03248518	Enrolling by invitation	Interventional	Lessening the Impact of Fatigue in Inflammatory Rheumatic Diseases	September 5, 2017	All	375
393	NCT03243539	Recruiting	Interventional	Implementation of Neuro Lung Protective Ventilation	August 31, 2017	All	728
394	NCT03241511	Recruiting	Interventional	Novel PAradigm to Improve Inflammatory Burden in ESRD (rePAIR): A Pilot and Feasibility Randomized Controlled Trial	November 7, 2017	All	90
395	NCT03237468	Recruiting	Interventional	Neck Strengthening Program for the Prevention or Mitigation of Sports Concussion	August 11, 2017	All	1500
396	NCT03229538	Recruiting	Interventional	STeroids to REduce Systemic Inflammation After Neonatal Heart Surgery	October 18, 2017	All	1200
397	NCT03229486	Recruiting	Interventional	Effect of Sugammadex vs. Neostigmine/Glycopyrrolate on Pediatric Emergence Delirium in Sevoflurane-rocuronium Anesthesia	October 17, 2017	All	40
398	NCT03227809	Recruiting	Interventional	First Years Away From Home: Letting Go and Staying Connected	April 1, 2017	All	900
399	NCT03227770	Recruiting	Interventional	The Benefit of Hemodialysis Plus Hemoperfusion on Mortality	December 1, 2017	All	1364
400	NCT03212859	Recruiting	Interventional	Coach2Move: Sustainable in Daily Practice	November 6, 2017	All	400
401	NCT03205956	Recruiting	Interventional	Measuring Parkinson's Disease Progression	October 19, 2017	All	40
402	NCT03196193	Recruiting	Interventional	CM Asia Nail With AS2 Without AS2 （AS2 Study）	March 21, 2017	All	240
403	NCT03193333	Recruiting	Interventional	PRO-122 Versus Concomitant Therapy in Subjects With Uncontrolled Primary Open-angle Glaucoma (PRO-122LATAM)	August 4, 2017	All	51
404	NCT03191071	Recruiting	Interventional	An Algorithm to Decide on Antibiotic Prescription in Lower Respiratory Tract Infection in Primary Care	September 1, 2018	All	630
405	NCT03168724	Enrolling by invitation	Interventional	Goal Management Training, Executive Functions and HIV	April 2016	All	60
406	NCT03167723	Enrolling by invitation	Interventional	Prospective Evaluation of 14F Thal Tube vs 28 French Chest Tube for Hemothorax and Use of Maximum Barrier Precautions	May 8, 2017	All	252
407	NCT03167307	Recruiting	Interventional	The Omega-3 Fatty Acid Paediatric Depression Trial	April 28, 2017	All	220
408	NCT03128021	Recruiting	Interventional	Neural Mechanisms of Monoaminergic Engagement in Late-life Depression Treatment Response (NEMO)	May 24, 2017	All	140
409	NCT03116139	Recruiting	Interventional	Acute Kidney Injury in Patients Undergoing Contrast Exposure: VQ vs. CT	July 1, 2017	All	700
410	NCT03110744	Recruiting	Interventional	CDK4/6 Inhibition in Locally Advanced/Metastatic Chordoma	December 15, 2017	All	43
411	NCT03100526	Enrolling by invitation	Interventional	Patient Aligned Care Team (PACT) Intensive Management (PIM) Project	November 2013	All	2210
413	NCT03036345	Recruiting	Interventional	Cerebral Perfusion in the Beach Chair Position	May 25, 2017	All	200
414	NCT03026816	Recruiting	Interventional	Epidural Stimulation After Neurologic Damage	August 7, 2017	All	100
415	NCT03007511	Recruiting	Interventional	Safety and Usability Evaluation of the Fidmi Low-Profile Enteral Feeding Device	May 22, 2017	All	15
416	NCT02996565	Enrolling by invitation	Interventional	Pragmatic Trial Comparing Telehealth Care and Optimized Clinic-Based Care for Uncontrolled High Blood Pressure	November 15, 2017	All	2000
417	NCT02995733	Recruiting	Interventional	Patient Empowered Strategy to Reduce Asthma Morbidity in Highly Impacted Populations; PeRson EmPowered Asthma RElief	November 27, 2017	All	1200
418	NCT02993432	Enrolling by invitation	Interventional	High Volume Foleys Increasing Vaginal Birth Pilot Trial	December 2016	Female	130
419	NCT02990429	Enrolling by invitation	Interventional	Forced Air and Intravenous Fluid Warmers in Gynecologic Laparoscopic Surgery	April 2016	Female	90
420	NCT02978950	Recruiting	Interventional	SToP: Venous Thromboembolism Screening in the Trauma Population	March 20, 2017	All	2000
421	NCT02959697	Recruiting	Interventional	Subconjunctival Injection of Local Anesthetic in Anterior Blepharoptosis Repair	September 1, 2017	All	100
422	NCT02957669	Enrolling by invitation	Interventional	Evaluation of Practice Self-Regulation	July 2016	All	400
423	NCT02957253	Recruiting	Interventional	Effects on Liver Cirrhotic Patients' by a Nurse-led Clinic	November 17, 2016	All	570
424	NCT02940028	Recruiting	Interventional	ICU Experience Among Family Members of ICU Patients	April 29, 2017	All	120
425	NCT02874443	Recruiting	Interventional	The REDUCED Trial: REDucing the Utilization of CEsarean Sections for Dystocia	October 2016	Female	40000
426	NCT02871349	Recruiting	Interventional	Trial of Propranolol in Children and Youth With Autism Spectrum Disorder and Predictors of Response	August 2016	All	96
427	NCT02852213	Recruiting	Interventional	A Single-Stage, Adaptive, Open-label, Dose Escalation Safety and Efficacy Study of AADC Deficiency in Pediatric Patients	July 2016	All	6
428	NCT02845336	Recruiting	Interventional	Celecoxib for Thyroid Eye Disease	March 5, 2017	All	40
429	NCT02811627	Recruiting	Interventional	Predicting Treatment Response to Memantine in Autism Using Magnetic Resonance Spectroscopy	June 2016	All	25
430	NCT02808507	Recruiting	Interventional	Comparative Effectiveness/Implementation of TB Case Finding in Rural South Africa	July 18, 2016	All	128171
431	NCT02690259	Recruiting	Interventional	Sentinel Lymph Node Detection in Endometrial Cancer	June 2014	Female	375
432	NCT02651402	Recruiting	Interventional	A Hybrid Effectiveness-Implementation Trial of Group CBT in Urban Schools	February 2016	All	534
433	NCT02624765	Enrolling by invitation	Interventional	FAST Therapy Trial of Fetal Tachyarrhythmia	February 2016	Female	600
434	NCT02613650	Recruiting	Interventional	A Trial of mFOLFIRI With MEK162 in Patients With Advanced KRAS Positive Metastatic Colorectal Cancers	May 12, 2016	All	30
435	NCT02606045	Recruiting	Interventional	Minimize Menorrhagia in Women With Type 1 Von Willebrand Disease	February 2019	Female	60
436	NCT02599480	Enrolling by invitation	Interventional	Assessment of Efficacy of Mirabegron, a New beta3-adrenergic Receptor in the Prevention of Heart Failure	April 2016	All	297
437	NCT02587936	Recruiting	Interventional	Improving Chronic Disease Management With Pieces	April 2016	All	10991
438	NCT02458846	Recruiting	Interventional	Efficacy of Visual Screening in Ontario	September 2014	All	780
439	NCT02428205	Recruiting	Interventional	Combined Effects of Early Behavioral Intervention and Propranolol on ASD	April 2015	All	30
440	NCT02340650	Recruiting	Interventional	High Resolution Imaging for Early and Better Detection of Bladder Cancer	April 2015	All	100
441	NCT02278198	Recruiting	Interventional	Evaluation of Thyroid Stunning From a Diagnostic Dose of I-123	November 2014	All	5
442	NCT02259621	Recruiting	Interventional	Neoadjuvant Nivolumab, or Nivolumab in Combination With Ipilimumab, in Resectable NSCLC	September 2014	All	30
443	NCT02046694	Recruiting	Interventional	A Pilot Study of Allopurinol As A Modifier of 6-MP Metabolism in Pediatric ALL	January 2014	All	14
444	NCT01964859	Recruiting	Interventional	Feasibility Study for Fibroblast Autologous Skin Grafts	December 2014	All	80
445	NCT01247090	Recruiting	Interventional	Study of the Effect of Intradialytic Vasopressin on Chronic Hypertension in Patients With End Stage Renal Disease	October 2010	All	36
446	NCT01042015	Recruiting	Interventional	Emergency Preservation and Resuscitation (EPR) for Cardiac Arrest From Trauma	October 2016	All	20
447	NCT00870064	Recruiting	Interventional	The Treatment of Type I Open Fractures in Pediatrics	March 2010	All	300
448	NCT03799094	Recruiting	Interventional	Vitamin C and Tyrosine Kinase Inhibitor in Lung Cancer Patients With Epidermal Growth Factor Receptor Mutations	December 5, 2018	All	150
449	NCT03607630	Recruiting	Interventional	Can Imagination Change Upsetting Memories of Trauma?	August 3, 2018	All	12
450	NCT03423342	Recruiting	Interventional	Nicotinamide Riboside in Systolic Heart Failure	May 19, 2016	All	30
451	NCT03360929	Recruiting	Interventional	Evaluate Safety, Tolerability, Pharmacokinetics and Anti-tumor Activity of AZD3759	October 30, 2017	All	180
452	NCT03292731	Recruiting	Interventional	Relationship Between Plasma Concentration of Hydroxyprogesterone Caproate (17-OHPC) and Preterm Birth	February 12, 2018	Female	300
453	NCT03275870	Recruiting	Interventional	Hydroxychloroquine for the Treatment of Hidradenitis Suppurativa	September 28, 2017	All	20
454	NCT03104426	Recruiting	Interventional	EPO-4-Rhesus Study	October 31, 2017	All	42
455	NCT03753802	Recruiting	Interventional	Evaluation of the Effects of Respiratory Physiotherapy in Infants With Moderate Acute Bronchiolitis	November 9, 2018	All	168
456	NCT03630549	Recruiting	Interventional	Village-based vs Clinic-based ART Care - a Cluster Randomized Controlled Trial in Lesotho	August 16, 2018	All	262
457	NCT03241732	Recruiting	Interventional	PET-MRI and the Effect of N-Acetyl Cysteine (NAC) and Anti-Inflammatory Diet in Traumatic Brain Injury	June 7, 2017	All	120
458	NCT03032601	Recruiting	Interventional	Physiological Effects of N-Acetyl Cysteine in Patients With Multiple Sclerosis	January 5, 2017	All	30
459	NCT03466528	Recruiting	Interventional	Alcohol: Thiamine and or Magnesium 1	December 16, 2016	All	120
460	NCT03463252	Recruiting	Interventional	Value of LNG-IUS as Fertility-preserving Treatment of EAH and EC	April 1, 2018	Female	224
461	NCT03829956	Recruiting	Interventional	Intraoral Tongue Stimulation for Treatment of Primary Snoring	April 1, 2018	All	55
462	NCT03827616	Enrolling by invitation	Interventional	Moderately Hypofractionated Radiotherapy for Prostate Cancer.	January 25, 2019	Male	200
463	NCT03808207	Recruiting	Interventional	Human Milk Lipid Profile Assessment and Influences of Mother's Diet	August 6, 2018	Female	24
464	NCT03795740	Recruiting	Interventional	Pulmonary Endarterectomy Guided by CT Scanning for Patients With Chronic Thromboembolic Pulmonary Hypertension----PEACT	February 1, 2017	All	72
465	NCT03787615	Recruiting	Interventional	Feasibility of Using sipIT Tools to Increase Compliance With Fluid Consumption Guidelines in Urolithiasis-Prone Subjects	November 19, 2018	All	30
466	NCT03781596	Recruiting	Interventional	EoE RCT Fluticasone and Omeprazole vs Fluticasone Alone	October 2, 2018	All	100
467	NCT03771534	Recruiting	Interventional	Acute Maternal Hyperoxygenation for Fetal Transposition of the Great Arteries (TGA)	September 20, 2018	Female	50
468	NCT03770455	Recruiting	Interventional	Avelumab Plus 2nd-generation ADT in African American Subjects With mCRPC	January 25, 2019	Male	13
469	NCT03766503	Enrolling by invitation	Interventional	Daily Delivery and Supervision of Psychotropic Medication for High-Risk Patients With Severe/Persistent Mental Illness	October 15, 2016	All	32
470	NCT03762239	Recruiting	Interventional	Effect of Air Pollution on the Cognitive Function of Adolescents	November 23, 2018	All	2500
471	NCT03761264	Recruiting	Interventional	Systemic and Local Antimicrobials in the Management of Dental Abscess in Children	September 18, 2018	All	120
472	NCT03757572	Recruiting	Interventional	Alginate Dressings Versus Gauge Dressings After Pilonidal Cyst Resection: Examination of the Quality of Life	December 25, 2018	All	178
473	NCT03754322	Recruiting	Interventional	The Impact of Molecular Diagnosis of Malaria With LAMP in Pregnant Women	September 1, 2017	Female	500
474	NCT03744780	Recruiting	Interventional	A One-Day ACT Workshop for Emotional Eating	November 5, 2018	All	40
475	NCT03737370	Recruiting	Interventional	Fractionated Docetaxel and Radium 223 in Metastatic Castration-Resistant Prostate Cancer	October 29, 2018	All	25
476	NCT03735537	Recruiting	Interventional	Treatment of Osteogenesis Imperfecta With Parathyroid Hormone and Zoledronic Acid	November 1, 2016	All	380
477	NCT03714282	Recruiting	Interventional	Noninvasive Spinal Stimulation in Stroke	August 17, 2018	All	45
478	NCT03704116	Recruiting	Interventional	Executive Function Training Intervention for Chronic Traumatic Brain Injury	July 16, 2018	All	100
479	NCT03702465	Recruiting	Interventional	Assessment of the Impact of a Personalised Nutrition Intervention in Impaired Glucose Regulation	November 26, 2018	All	180
480	NCT03701113	Recruiting	Interventional	Milk Protein and Bone Health in Postmenopausal Women	October 22, 2018	Female	60
481	NCT03699397	Recruiting	Interventional	EEG Controlled Triage in the Ambulance for Acute Ischemic Stroke	October 4, 2018	All	362
482	NCT03698591	Recruiting	Interventional	Testing a Neurocognitive Model of Distancing Using Transcranial Magnetic Stimulation.	October 31, 2018	All	30
483	NCT03694496	Recruiting	Interventional	The Effectiveness of an Oral Health Education Programme of Adolescents in Hong Kong	September 1, 2018	All	688
484	NCT03692715	Recruiting	Interventional	Antibiotic Prophylaxis Before Shock Wave Lithotripsy	September 27, 2018	All	1500
485	NCT03685461	Recruiting	Interventional	AB-Intra- and Post-Operative Measures of Auditory Function	September 11, 2018	All	192
486	NCT03680248	Recruiting	Interventional	Monitoring of Hepatic Fat Metabolism Using Magnetic Resonance Methods	April 26, 2016	Male	20
487	NCT03678506	Recruiting	Interventional	Apixaban for Extended Anticoagulation (APIDULCIS)	August 16, 2018	All	1200
488	NCT03675165	Recruiting	Interventional	Can You Reduce Diabetes Symptomatology by Becoming Your 'Best Possible Self': The Role of Stress and Resilience	August 28, 2018	All	102
489	NCT03661385	Recruiting	Interventional	Nitric Oxide During Bypass for Arterial Switch Operation	July 11, 2018	All	800
490	NCT03654131	Recruiting	Interventional	Stereotactic Body Radiation Therapy vs. Percutaneous Microwave Ablation for Colorectal Cancer Patients With Metastatic Disease in the Liver	July 25, 2018	All	100
491	NCT03644381	Recruiting	Interventional	Milk Desensitization in Children	July 3, 2013	All	84
492	NCT03637413	Recruiting	Interventional	Effect of Hindmilk on Growth Velocity of Very Preterm Infants	January 22, 2019	All	34
493	NCT03636724	Recruiting	Interventional	Evaluation of an E-intervention on MHBC for Chinese Cardiac Patients in Home-based Rehabilitation	July 1, 2018	All	166
494	NCT03633682	Recruiting	Interventional	Evaluation of Text Message Engagement Support of Mindfulness Smartphone Applications	June 26, 2018	All	40
495	NCT03632447	Recruiting	Interventional	Comparing Use of a Digital Health System of Pelvic Floor Exercise Program to Kegel Exercises in Stress Urinary Incontinence	October 24, 2018	Female	225
496	NCT03631979	Recruiting	Interventional	Intestinal Lavage to Promote Enteral Feeding and Prevent Necrotizing Enterocolitis in Extremely Preterm Infants	August 15, 2018	All	200
497	NCT03631030	Recruiting	Interventional	Cooled RF Lesion MRI Characteristics	February 25, 2018	All	15
498	NCT03629145	Recruiting	Interventional	Music Therapy With Intubated and Sedated Pediatric Patients	January 16, 2018	All	28
499	NCT03625011	Recruiting	Interventional	Gabapentin Premedication to Reduce Postoperative Pain for Pediatric Tonsillectomy	July 31, 2018	All	50
500	NCT03607461	Recruiting	Interventional	Using a Smartphone App to Aid in Functional Mobility Return Following Total Knee Arthroplasty	July 2018	All	30
501	NCT03603015	Recruiting	Interventional	Contractility: Cuff Versus Urodynamics Testing In Males With Voiding Lower Urinary Tract Symptoms	August 28, 2018	Male	50
502	NCT03594474	Recruiting	Interventional	Early Higher Intravenous Lipid Intake in VLBW Infants	August 15, 2018	All	76
503	NCT03589378	Recruiting	Interventional	Therapeutic Plasma Exchange Adsorption Diafiltration	August 13, 2018	All	168
504	NCT03586219	Recruiting	Interventional	Postoperative Opioid Consumption After Urogyneocologic Surgery	December 21, 2017	Female	146
505	NCT03570424	Recruiting	Interventional	Whey Protein Support to Metabolic and Performance Adaptations in Response HIIT	January 31, 2018	Male	30
506	NCT03563690	Recruiting	Interventional	Different Kinds of Acupuncture Treatment for Knee Osteoarthritis	June 24, 2018	All	360
507	NCT03560063	Recruiting	Interventional	The Hip Arthroplasty Positioning Improvement Study	May 1, 2018	All	460
508	NCT03553862	Recruiting	Interventional	Collaborative Care Model on Type 2 Diabetic Patients	May 11, 2018	All	250
509	NCT03550495	Recruiting	Interventional	A Multidisciplinary Delirium Prevention Strategy Involving Psychiatry in the ICU	April 16, 2018	All	104
510	NCT03538860	Recruiting	Interventional	Validation of an Automated Online Language Interpreting Tool - Phase Two.	November 14, 2017	All	100
511	NCT03536858	Recruiting	Interventional	Social Networks and Renal Education: Promoting Transplantation	October 23, 2018	All	255
512	NCT03526458	Enrolling by invitation	Interventional	Clinical Trial Evaluating the Efficiency of Holmium Laser Settings on Urinary Stones	July 1, 2019	All	48
513	NCT03516396	Enrolling by invitation	Interventional	Community Development and Nutrition Education in Banke District, Nepal: Effect on Child Health and Growth	July 1, 2013	All	1500
514	NCT03502005	Recruiting	Interventional	Efficacy, Safety & Tolerability of Switching EFV/TDF/FTC to BIC/FTC/TAF in Virologically Suppressed Adults With HIV-1	March 1, 2018	All	100
515	NCT03494231	Recruiting	Interventional	A Study of HLX06, a Humanized Monoclonal Antibody Targeting Human Vascular Endothelial Growth Factor Receptor-2 in Patients With Advanced Solid Tumors	March 22, 2018	All	30
516	NCT03493126	Recruiting	Interventional	Vaginal Estrogen on Postpartum Atrophy, Perineal Pain, and Sexual Function	October 15, 2018	Female	70
517	NCT03489850	Recruiting	Interventional	Ibudilast and Withdrawal-Related Dysphoria	July 16, 2018	All	50
518	NCT03488602	Recruiting	Interventional	Focused Suicide Prevention Strategy for Youth	March 1, 2018	All	128
519	NCT03483740	Recruiting	Interventional	Psychosocial Intervention for Older HIV+ Adults With HAND	April 9, 2018	All	16
520	NCT03478501	Recruiting	Interventional	Assisting in Decisions in Emergency Departments: (ED-AID) Study	June 20, 2018	All	60
521	NCT03474978	Recruiting	Interventional	Peripherally Inserted Central Catheter Insertion Site and Complication Rate in Neonates	October 19, 2018	All	320
522	NCT03474666	Recruiting	Interventional	Glycemic Control and Surgical Site Infection Incidence Among Liver Transplantation Recipients	March 11, 2018	All	58
523	NCT03474432	Recruiting	Interventional	SOLEMN Study - Synergy Optical Coherence Tomography in Left Main PCI	June 15, 2018	All	75
524	NCT03471637	Recruiting	Interventional	Compassion-Focused Therapy for Chronic Pain	February 26, 2018	All	71
525	NCT03467724	Recruiting	Interventional	Treatment of Surgical Scars Following Breast Augmentation, Abdominoplasty or Face Lift	January 23, 2018	All	75
526	NCT03464851	Recruiting	Interventional	Evaluation of a Novel Technique to Diagnose Carotid Artery Stenosis	March 8, 2018	All	300
527	NCT03462979	Recruiting	Interventional	Effects of Home Gluten Immunogenic Peptide Testing on Children With Celiac Disease	April 15, 2018	All	120
528	NCT03462459	Recruiting	Interventional	Efficacy of Oral Vancomycin Prophylaxis for Prevention of Recurrent Clostridium Difficile Infection	May 21, 2018	All	150
529	NCT03461016	Enrolling by invitation	Interventional	Smartphone-Based Exposure Treatment for Dental Anxiety	April 1, 2016	All	40
530	NCT03461003	Recruiting	Interventional	N-of-1 Trials In Children With Hypertension	April 2, 2018	All	80
531	NCT03455985	Recruiting	Interventional	Effectiveness of a Diabetes Focused Discharge Order Set Among Poorly Controlled Hospitalized Patients Transitioning to Glargine U300 Insulin	May 1, 2018	All	222
532	NCT03453398	Recruiting	Interventional	Effects of Shift Work on Nurse Staff Health	January 23, 2018	All	120
533	NCT03453359	Recruiting	Interventional	Bispectral Index Monitoring of Sedation in Spontaneous Ventilation. Clinical Trial in Scheduled Colonoscopies	January 30, 2018	All	180
534	NCT03442114	Recruiting	Interventional	Shared-Decision Making for Hydroxyurea	July 12, 2018	All	260
535	NCT03440645	Recruiting	Interventional	Cardiovascular Screening for Family Members of People With Acute Coronary Disease	January 9, 2018	All	600
536	NCT03431467	Recruiting	Interventional	Impella CP With VA ECMO for Cardiogenic Shock	March 19, 2018	All	96
537	NCT03429439	Recruiting	Interventional	Study on Effect of Intestinal Microbiota Transplantation in Chronic Hepatitis B	December 29, 2017	All	60
538	NCT03422848	Recruiting	Interventional	Hydration to Optimize Metabolism	April 24, 2018	All	800
539	NCT03418649	Recruiting	Interventional	Eplerenone as a Supplement to Epidural Steroid Injections	November 8, 2017	All	40
540	NCT03413332	Recruiting	Interventional	Web-Based Communication Education for Breast Cancer Survivorship Care	April 1, 2017	Female	141
541	NCT03406767	Recruiting	Interventional	A Comparison Between GLA:D Canada and an Individualized JointEffort Exercise Program in Knee Osteoarthritis Patients	May 1, 2018	All	60
542	NCT03405493	Recruiting	Interventional	Sleep, Wake and Light Therapy for Depression	January 18, 2018	All	60
543	NCT03395301	Recruiting	Interventional	Coil Hysteroscopic Tubal Occlusion in the Treatment of Hydrosalpinx	December 1, 2015	Female	80
544	NCT03387618	Recruiting	Interventional	Feasibility Assessment of Next-generation PET Technology and Procedures	September 19, 2017	All	200
545	NCT03382106	Recruiting	Interventional	Smoking Cessation and Functional CT Assessment	March 19, 2018	All	80
546	NCT03380169	Recruiting	Interventional	Preventing Surgical Site Infection by Using Prophylactic Occlusive Ionic Silver-containing Dressing	October 15, 2017	All	200
547	NCT03377946	Recruiting	Interventional	Effect of Probiotics on Pre-diabetes and Diabetes in China	December 21, 2017	All	220
548	NCT03377088	Recruiting	Interventional	Aromatherapy Randomization of Pain Management in Adults	December 11, 2017	All	60
549	NCT03373734	Recruiting	Interventional	Enjoy Your Bump : Online Cognitive Behavioural Therapy in Pregnancy	May 31, 2017	Female	30
550	NCT03372707	Recruiting	Interventional	Cuff Leak Test and Airway Obstruction in Mechanically Ventilated ICU	July 5, 2018	All	100
551	NCT03366805	Recruiting	Interventional	A Patient Education Video Program for Post-Operative Recovery After Upper Extremity Surgery	November 30, 2017	All	400
552	NCT03360279	Recruiting	Interventional	DCB for Dialysis Access Stent Graft Restenosis	March 5, 2017	All	40
553	NCT03359447	Recruiting	Interventional	Iron Deficiency Anemia, Iron Supplementation and Genomic Stability in Infants	August 1, 2017	All	204
554	NCT03354572	Recruiting	Interventional	Pilot Study: Postoperative Pain Reduction by Pre Emptive N-Acetylcysteine	October 20, 2017	All	60
555	NCT03348605	Enrolling by invitation	Interventional	Descriptive Study of Receptive Fields in Lower Limb Amputees	October 27, 2017	All	35
556	NCT03345615	Recruiting	Interventional	Standard Versus Intensive Monitoring After Myocardial Infarction Looking for Atrial Fibrillation	November 1, 2017	All	240
557	NCT03340818	Recruiting	Interventional	Bone Marrow Concentrate Intradiscal Injection for Chronic Discogenic Low Back Pain	August 1, 2018	All	60
558	NCT03340051	Recruiting	Interventional	Remote Alcohol Monitoring and Episodic Thinking	September 21, 2017	All	200
559	NCT03337217	Recruiting	Interventional	Colonoscopy in the Prone Position for Patients With BMI Greater Than 30	December 10, 2017	All	150
560	NCT03331965	Recruiting	Interventional	Metoclopramide Versus Placebo for GJ Placement	April 9, 2018	All	110
561	NCT03330509	Recruiting	Interventional	Effectiveness of the Supportive and Palliative Care Review Kit (SPARK) for Cancer Patients in the Acute Hospital	December 1, 2017	All	6000
562	NCT03327844	Recruiting	Interventional	Regenerative Endodontic Therapy (RET) for the Management of Immature Non-vital Permanent Teeth in Children	March 1, 2017	All	60
563	NCT03324659	Recruiting	Interventional	Meditation and Exercise to Treat Chronic Back Pain	January 26, 2018	All	42
564	NCT03324516	Recruiting	Interventional	The Effect of Temporal Muscle Suspension of Temporal Hollowing	February 1, 2018	All	30
565	NCT03324009	Recruiting	Interventional	2-stage Cervical Cancer Screening in Botswana	April 20, 2018	Female	300
566	NCT03307070	Recruiting	Interventional	Adapted Cognitive Behavioral Treatment for Depression in Patients With Moderate to Severe Traumatic Brain Injury	September 23, 2017	All	50
567	NCT03303053	Recruiting	Interventional	Efficacy and Safety of Cholestyramine and Prednisolone as Adjunctive Therapy in Treatment of Overt Hyperthyroidism	May 11, 2017	All	135
568	NCT03302572	Recruiting	Interventional	Effectiveness Brief Information Advanced Directives Primary Care	November 3, 2016	All	330
569	NCT03301831	Recruiting	Interventional	Resourcefulness Intervention With Parents of Technology-Dependent Children	February 5, 2018	All	94
570	NCT03298997	Recruiting	Interventional	Ligation and Hemorrhoidopexy Technique Versus Ligation of Hemorrhoidal Arteries Using Ultrasound for Hemorrhoids	October 1, 2017	All	60
571	NCT03297151	Recruiting	Interventional	Protein Supplementation and Recovery of Muscle Function	July 1, 2017	Male	24
572	NCT03275896	Recruiting	Interventional	Evaluation of the Efficacy of Descemet Membrane Transplantation for the Treatment of Fuchs' Endothelial Dystrophy	September 2016	All	20
573	NCT03274518	Recruiting	Interventional	Expanded Hemodialysis Versus Online Hemodiafiltration	November 13, 2017	All	16
574	NCT03273699	Recruiting	Interventional	Mindfulness Meditation Utilizing an EEG Biofeedback Device for the Treatment for Obsessive Compulsive Disorder	April 10, 2017	All	100
575	NCT03256461	Recruiting	Interventional	Lactate Clearance Goal-directed Therapy in Sepsis	August 21, 2017	All	1128
576	NCT03245853	Enrolling by invitation	Interventional	Epi-On Corneal Crosslinking for Keratoconus	July 18, 2017	All	20
577	NCT03239808	Recruiting	Interventional	Incremental Haemodialysis in Incident Patients	March 14, 2018	All	152
578	NCT03238768	Recruiting	Interventional	Enhanced Nutrition for Preterm Infants	August 15, 2017	All	80
579	NCT03235739	Recruiting	Interventional	Ancillary Effects of Oral Naloxegol (Movantik)	October 1, 2017	All	129
580	NCT03234569	Recruiting	Interventional	Safety and Efficacy of Sonohysterosalpingography for the Evaluation of Infertility	January 31, 2018	Female	30
581	NCT03230890	Recruiting	Interventional	HIRREM in Military Personnel	February 16, 2015	All	40
582	NCT03230656	Recruiting	Interventional	Cognitive-Communication Screening and Early Therapy for Adults With Mild TBI	January 2017	All	300
583	NCT03227614	Enrolling by invitation	Interventional	Friends/Family in the Abortion Procedure Room (FAIR)	July 18, 2017	All	410
584	NCT03196349	Recruiting	Interventional	Comparison of Oral Anticoagulants for Extended VEnous Thromboembolism	August 1, 2018	All	3000
585	NCT03192020	Recruiting	Interventional	Trial Comparing Treatment Strategies in Dupuytren's Contracture	September 15, 2017	All	278
586	NCT03036592	Recruiting	Interventional	MTNR1B SNP*Food Timing Interaction on Glucose Control	November 1, 2016	All	1000
587	NCT02948023	Recruiting	Interventional	Stem Cells Therapy for Corneal Blindness	August 31, 2016	All	100
588	NCT02814123	Recruiting	Interventional	Effect of Basal-Bolus Closed-Loop Co-Administration of Insulin and Pramlintide on Improving the Glycemic Control in Type 1 Diabetes	January 13, 2017	All	28
589	NCT02724163	Recruiting	Interventional	International Randomised Phase III Clinical Trial in Children With Acute Myeloid Leukaemia	April 2016	All	700
590	NCT02479100	Recruiting	Interventional	Contrast Enhanced Spectral Mammography (CESM) Study	March 2016	Female	100
591	NCT03799237	Recruiting	Interventional	Combating Dengue With Innovative, Paradigm-shift-Strategies: Early Dengue Surveillance in Adult Aedes Mosquitoes	October 1, 2018	All	7979
592	NCT03759795	Recruiting	Interventional	Bournemouth University Resilience Training for Surgeons	December 14, 2018	All	100
593	NCT03750409	Recruiting	Interventional	Assessing Feasibility of Prolonged Repetitive Near Infrared Light Stimulation in Early to Mid-Stage Dementia	October 15, 2018	All	100
594	NCT03736031	Recruiting	Interventional	With Love: Using Promotoras for a Hispanic Community Palliative Care Promotora Palliative Care	April 19, 2018	All	150
595	NCT03726437	Enrolling by invitation	Interventional	Efficacy of a Web-based Sexual Violence Risk Reduction Program for Female College Students	October 17, 2018	Female	750
596	NCT03706014	Recruiting	Interventional	Innovative Family Prevention With Latino Siblings in Disadvantaged Settings	September 29, 2018	All	288
597	NCT03695679	Recruiting	Interventional	Interactive Computer-based Intervention and Safe Sex Practice in University Students	September 1, 2017	Female	500
598	NCT03669432	Recruiting	Interventional	To Study the Impact of Radiation Treatment After Surgery in Patient With Locally Advanced Thyroid Cancer.	July 2013	All	72
599	NCT03658941	Enrolling by invitation	Interventional	Dural Tenting Sutures in Neurosurgery - is it Necessary?	September 7, 2018	All	2000
600	NCT03657212	Recruiting	Interventional	Enhancing Memory Consolidation in Older Adults	October 1, 2018	All	30
601	NCT03648086	Recruiting	Interventional	Intestinal Microbiota Transplantation for Nonalcoholic Fatty Liver Disease	November 14, 2017	All	30
602	NCT03647449	Recruiting	Interventional	Examining the Effects of Juice Fasting	July 10, 2018	All	18
603	NCT03635775	Recruiting	Interventional	Single-session tDCS in Cerebral Palsy	May 1, 2018	All	32
604	NCT02029937	Recruiting	Interventional	High Resolution Microendoscopy for the Detection of Esophageal Squamous Cell Neoplasia	January 2014	All	1300
605	NCT03593356	Recruiting	Interventional	Baby's First Years	May 9, 2018	Female	1000
606	NCT03588806	Recruiting	Interventional	Use of Xtampza ER to Overcome Difficulties in Swallowing Opioid Pills	May 1, 2018	All	20
607	NCT03588572	Recruiting	Interventional	The Effect of Venlafaxine on Language Function in Patients With Subcortical Aphasia: A fMRI Study	August 1, 2018	All	45
608	NCT03574376	Recruiting	Interventional	Liposomal Bupivacaine Intercostal Nerve Block vs Thoracic Epidural for Regional Analgesia in Multiple Rib Fractures	August 29, 2018	All	44
609	NCT03551860	Recruiting	Interventional	Quadratus Lumborum Block Versus Fascia Iliaca Nerve Block for Patients Undergoing Total Hip Replacement	April 10, 2018	All	50
610	NCT03532360	Recruiting	Interventional	Peanut and Tree Nut Desensitization	February 19, 2018	All	50
611	NCT03526484	Enrolling by invitation	Interventional	The Utility of Urinalysis Prior to In-Office Procedures	September 20, 2018	All	564
612	NCT03523000	Recruiting	Interventional	Determining the Prognostic Value of Continuous Intrathecal Infusion	June 30, 2017	All	36
613	NCT03522974	Recruiting	Interventional	Effects of Freeze Dried Strawberry Powder Supplementation on Cardiovascular Risk Factors and Gut Microbiome	December 1, 2018	All	50
614	NCT03522337	Recruiting	Interventional	Oral Health Promotion Among Preschool Children With Special Needs	April 12, 2016	All	300
615	NCT03518255	Recruiting	Interventional	e-Natureza Project - Affective Validation of Nature Images for Hospital Use	August 22, 2018	All	30
616	NCT03517852	Recruiting	Interventional	Intravital Microscopy (IVM) in Patients With Peritoneal Carcinomatosis (PC)	August 15, 2018	All	10
617	NCT03511443	Recruiting	Interventional	Evaluation of the Performance of a hsRDT Versus cRDT in Reactive Case Detection of Malaria Infections	October 2, 2017	All	1980
618	NCT03505658	Recruiting	Interventional	Abriendo Caminos 2: Clearing the Path to Hispanic Health	April 10, 2015	All	500
619	NCT03500172	Recruiting	Interventional	HIV Treatment Retention Interventions for Women Living With HIV (Siyaphambili Study)	June 22, 2018	Female	1143
620	NCT03481296	Recruiting	Interventional	Screening TO Prevent ColoRectal Cancer (STOP CRC) Among At-Risk Chinese and Korean American Primary Care Patients	August 20, 2018	All	400
621	NCT03454308	Recruiting	Interventional	Patient Centered Health Technology Medication Adherence Program for African American Hypertensives	April 28, 2017	All	192
622	NCT03437876	Recruiting	Interventional	Study on Effect of Intestinal Microbiota Transplantation in Hepatitis B Virus Induced Cirrhosis	October 31, 2016	All	60
623	NCT03435588	Recruiting	Interventional	Endoscopic Ultrasound (EUS)-Guided Fine Needle Aspiration (FNA) With Rapid On-site Evaluation (ROSE) of Cytopathology vs. EUS-guided Fine Needle Biopsy (FNB) Alone in the Diagnosis of Pancreatic Solid Lesions	February 14, 2018	All	236
624	NCT03426683	Recruiting	Interventional	The Effect of Intestinal Microbiota Transplantation for Inflammatory Bowel Diseases	November 21, 2017	All	30
625	NCT03422159	Recruiting	Interventional	Metabolic Resuscitation Using Ascorbic Acid, Thiamine, and Glucocorticoids in Sepsis.	February 5, 2018	All	140
626	NCT03420846	Recruiting	Interventional	Efficiency of Presurgical Basal Cell Carcinoma Margin Mapping	July 1, 2018	All	200
627	NCT03383731	Recruiting	Interventional	A Study of a New Surgical Treatment of Macular Hole Retinal Detachment in High Myopia	April 7, 2017	All	38
628	NCT03376685	Recruiting	Interventional	The Relationship Between Exercise Frequency, Intensity, and Restoration of Cardiometabolic Health	May 30, 2018	Male	45
629	NCT03376100	Recruiting	Interventional	Distal Nerve Blocks for Closed Reduction of Distal Forearm Fractures	December 1, 2017	All	268
630	NCT03365609	Recruiting	Interventional	A Comparison of Four Different Treatment Regimens of Helicobacter Pylori in Chinese Children	September 20, 2017	All	1440
631	NCT03360968	Recruiting	Interventional	Heartrate Variability During Conventional and Variable Pressure Support Mechanical Ventilation	February 6, 2018	All	60
632	NCT03343431	Recruiting	Interventional	Antiviral Prophylaxis and Infant Vaccination to Prevent Perinatal Hepatitis B Infection	August 2, 2018	Female	499
633	NCT03340103	Recruiting	Interventional	Early Administration of the Lutein/Zeaxanthin in Premature Newborns	October 1, 2017	All	50
634	NCT03338374	Recruiting	Interventional	Cardiac Resynchronisation Therapy Versus Rate-responsive Pacing in Heart Failure With Preserved Ejection Fraction	November 27, 2017	All	10
635	NCT03337971	Recruiting	Interventional	Nutritional Supplement and Bone Health in Post-Menopausal Women	October 3, 2017	Female	16
636	NCT03336372	Recruiting	Interventional	Picato for the Treatment of Molluscum Contagiosum in Immunocompromised Patients	December 20, 2017	All	10
637	NCT03326934	Recruiting	Interventional	Impact of Dark Chocolate on Visual Performance	June 25, 2017	All	70
638	NCT03306173	Recruiting	Interventional	COMET Study 1: Filter Ventilated Cigarette Substitution in the ETM	August 8, 2018	All	200
639	NCT03287635	Recruiting	Interventional	Clinical Efficacy of H.P. Acthar Gel 80 U/ml to Improve the Signs and Symptoms in Subjects With Dry Eye Disease	July 1, 2018	All	12
640	NCT03265574	Recruiting	Interventional	PROACT: Can we Prevent Chemotherapy-related Heart Damage in Patients With Breast Cancer?	September 1, 2017	All	170
641	NCT01785719	Recruiting	Interventional	Evaluation of Ovarian Morphology and Function in Overweight Women During Weight Loss	January 2013	Female	100
642	NCT03232554	Recruiting	Interventional	Buxue Yimu Pills for Gynecological Iron-Deficiency Anemia	June 1, 2017	Female	180
643	NCT01739933	Recruiting	Interventional	The MENDS2 Study, Maximizing the Efficacy of Sedation and Reducing Neurological Dysfunction and Mortality in Septic Patients With Acute Respiratory Failure	August 2012	All	420
644	NCT03085784	Recruiting	Interventional	Intravitreal Aflibercept Injection for Radiation Retinopathy Trial	July 5, 2017	All	30
645	NCT03083366	Recruiting	Interventional	Sacral Nerve Stimulation in Improving Bladder After Acute Traumatic Spinal Cord Injury	September 1, 2016	All	60
646	NCT03009539	Recruiting	Interventional	eHealth Evidence-based Intervention (EBI) for Latino Youth in Primary Care	April 26, 2017	All	456
647	NCT02744768	Recruiting	Interventional	D-ALBA Frontline Sequential Dasatinib and Blinatumomab in Adult Philadelphia Positive Acute Lymphoblastic Leukemia	May 31, 2017	All	60
648	NCT01447628	Recruiting	Interventional	IV Iron Replacement for Iron Deficiency in Idiopathic Pulmonary Arterial Hypertension (IPAH) Patients	October 2011	All	60
649	NCT02188121	Recruiting	Interventional	Fixed Dose Intervention Trial of New England Enhancing Survival in SMI Patients	February 2015	All	300
650	NCT03740243	Recruiting	Interventional	Buprenorphine vs Buprenorphine/Naloxone on the Effects of Maternal Symptomatology	November 25, 2018	Female	144
651	NCT03629496	Recruiting	Interventional	Developing an Arts-based Intervention for Patients With End-stage Kidney Disease Whilst Receiving Haemodialysis	September 3, 2018	All	30
652	NCT03622437	Recruiting	Interventional	Individual Follow-up After Rectal Cancer - Focus on the Needs of the Patient	February 26, 2016	All	334
653	NCT03616639	Recruiting	Interventional	Neurotoxic Adverse Effects of Morphine and Oxycodone for Pain in Terminal Patients With Diminished Renal Function	June 4, 2018	All	234
654	NCT03564080	Recruiting	Interventional	Assessing the Feasibility of Including Patients With Peripheral Artery Disease in to an Established Cardiac Rehabilitation Service.	July 18, 2018	All	102
655	NCT03544853	Recruiting	Interventional	Computational Design, Fabrication, and Evaluation of Optimized Patient-Specific Transtibial Prosthetic Sockets	September 15, 2017	All	18
656	NCT03543774	Recruiting	Interventional	Lipid-lowering Therapies in Vietnamese Chronic Kidney Disease Population	June 15, 2018	All	30
657	NCT03519568	Recruiting	Interventional	Clinical Study on Combined Immune Effect of EV71 Inactivated Vaccine	March 1, 2018	All	1944
658	NCT03519087	Recruiting	Interventional	Nonarthritic Hip Disease Evaluation And Treatment	February 27, 2018	All	96
659	NCT03440099	Recruiting	Interventional	Sex-specific Adaptation to Resistance Training in Older Adults	January 1, 2018	All	50
660	NCT03437811	Recruiting	Interventional	Airway Clearance System (K031876) Phase IV Device Efficacy	February 28, 2018	All	70
661	NCT03423095	Recruiting	Interventional	Motor Imagery Exercise and Tongue Strength	December 19, 2017	All	40
662	NCT03406039	Recruiting	Interventional	Testing the Efficacy of an Online Integrated Treatment for Comorbid Alcohol Misuse and Emotional Problems	September 4, 2018	All	214
663	NCT03397277	Recruiting	Interventional	Promoting Safety Behaviours in Antenatal Care Using a Video	January 15, 2018	Female	525
664	NCT03375580	Recruiting	Interventional	Therapeutic Effects of Compound Zhenzhu Tiaozhi Capsules in NAFLD	December 31, 2017	All	196
665	NCT03373240	Recruiting	Interventional	Targeting Self-regulatory Deficits Through Cognitive Remediation Intervention	January 22, 2018	All	100
666	NCT03369145	Recruiting	Interventional	High-fat Overfeeding, Hepatokines and Appetite Regulation	December 11, 2017	Male	12
667	NCT03337581	Recruiting	Interventional	Pharmacodynamics and Pharmacokinetics of Dexmedetomidine in Pediatric	October 20, 2017	All	187
668	NCT03335722	Recruiting	Interventional	Investigating Non-invasive Brain Stimulation to Enhance Fluency in People Who Stutter	November 15, 2017	Male	40
669	NCT03333473	Recruiting	Interventional	Postpregnancy Family Planning Choices in Public and Private Sectors in Kenya and Indonesia	November 9, 2017	Female	9282
670	NCT03331978	Recruiting	Interventional	A Randomized Controlled Trial of an Antiretroviral Treatment Adherence Intervention for HIV+ African Americans	December 1, 2017	All	350
671	NCT03255707	Recruiting	Interventional	A Comparative Study Between Dissociative Treatment and Binocular Interactive Treatment in Amblyopia	November 24, 2016	All	100
672	NCT03208530	Recruiting	Interventional	Motivational Interview Intervention to Help Patients Formulate Their Goals for Medical Care in the Emergency Department	August 1, 2017	All	150
673	NCT02781064	Recruiting	Interventional	STATIN: Web-based Investigation of Side Effects	September 1, 2016	All	200
674	NCT03664934	Recruiting	Interventional	Pathophysiological Mechanism Behind Prolonged Whiplash Associated Disorders	October 4, 2018	All	60
675	NCT03584490	Recruiting	Interventional	Reducing Assessment Barriers for Patients With Low Literacy	September 14, 2018	All	1200
676	NCT03558828	Recruiting	Interventional	Testing Adaptive Interventions to Improve Physical Activity for Sedentary Women	August 24, 2018	Female	312
677	NCT03556371	Recruiting	Interventional	Evaluation of N-Acetylcysteine Efficacy to Reduce the Craving and to Prolong Abstinence Time of Coca Paste	April 9, 2018	All	106
678	NCT03529981	Recruiting	Interventional	Emotion Prosthetics for Augmentation of Mindfulness	April 9, 2018	All	100
679	NCT03422562	Recruiting	Interventional	Probiotics and Intestinal Microbiome in Preterm Infants	October 26, 2017	All	60
680	NCT03394495	Recruiting	Interventional	Individualized Exercise Program Plus Behavioral Change Enhancement Strategies for Managing Fatigue in Frail Older People	February 26, 2018	All	285
681	NCT03304444	Recruiting	Interventional	A Comparison of Exparel to Bupivacaine in TAP Block for Abdominal Gynecologic Surgery	August 2016	Female	128
682	NCT03686748	Recruiting	Interventional	Two Point Discrimination	July 21, 2018	All	60
683	NCT02018367	Recruiting	Interventional	Accuracy, Yield and Clinical Impact of a Low-Cost HRME in the Early Diagnosis of Esophageal Adenocarcinoma	September 2012	All	100
684	NCT03538418	Recruiting	Interventional	Enhancing Physical Activity Levels of Frail Older People With a Wearable Activity Tracker-based Exercise Intervention	June 1, 2018	All	60
685	NCT03397160	Recruiting	Interventional	Pioneering Advances in Care and Education (PACE)	October 10, 2017	Male	160
686	NCT03388970	Enrolling by invitation	Interventional	Vitamin K1 in the Treatment of Spontaneous Intracerebral Hemorrhage	August 1, 2017	All	400
687	NCT03376854	Recruiting	Interventional	Pilot RCT of Therapeutic Hypothermia in ARDS Patients Receiving Neuromuscular Blockade	May 1, 2018	All	20
688	NCT03234543	Enrolling by invitation	Interventional	Remote Ischemic Conditioning in Abdominal Surgery	October 8, 2017	All	100
689	NCT03230942	Recruiting	Interventional	Effect of Pre-op Patient Education on Functional Outcomes After TKA	October 1, 2017	All	50
690	NCT02982772	Recruiting	Interventional	Patch Study - Intervention for HIV Positive Smokers	May 2016	All	600
691	NCT02529644	Recruiting	Interventional	Church-based HIV Screening: Taking It to the Pews	July 2015	All	1540
692	NCT03326596	Recruiting	Interventional	Prevention of Postpartum Hemorrhage With TXA	April 20, 2018	Female	1000
693	NCT03543644	Recruiting	Interventional	Strategies To OPpose Sugars With Non-nutritive Sweeteners Or Water (STOP Sugars NOW) Trial	May 31, 2018	All	75
694	NCT03507400	Recruiting	Interventional	Introvision for Migraine and Headaches	September 20, 2017	All	80
695	NCT03286153	Recruiting	Interventional	Comparison of Ideal vs. Actual Weight Base Factor Dosing	January 2017	Male	20
\.


--
-- Name: age_age_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.age_age_id_seq', 695, true);


--
-- Name: condition_cond_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.condition_cond_id_seq', 1090, true);


--
-- Name: condxref_nct_cond_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.condxref_nct_cond_id_seq', 1090, true);


--
-- Name: inter_inter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.inter_inter_id_seq', 1138, true);


--
-- Name: interxref_nct_inter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.interxref_nct_inter_id_seq', 1138, true);


--
-- Name: phase_phase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.phase_phase_id_seq', 6, true);


--
-- Name: phasexref_nct_phase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.phasexref_nct_phase_id_seq', 696, true);


--
-- Name: site_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.site_site_id_seq', 1594, true);


--
-- Name: sitexref_nct_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sitexref_nct_site_id_seq', 1594, true);


--
-- Name: age age_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.age
    ADD CONSTRAINT age_pkey PRIMARY KEY (age_id);


--
-- Name: condition condition_cond_detail_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.condition
    ADD CONSTRAINT condition_cond_detail_key UNIQUE (cond_detail);


--
-- Name: condition condition_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.condition
    ADD CONSTRAINT condition_pkey PRIMARY KEY (cond_id);


--
-- Name: condxref condxref_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.condxref
    ADD CONSTRAINT condxref_pkey PRIMARY KEY (nct_cond_id);


--
-- Name: inter inter_inter_detail_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inter
    ADD CONSTRAINT inter_inter_detail_key UNIQUE (inter_detail);


--
-- Name: inter inter_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inter
    ADD CONSTRAINT inter_pkey PRIMARY KEY (inter_id);


--
-- Name: interxref interxref_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interxref
    ADD CONSTRAINT interxref_pkey PRIMARY KEY (nct_inter_id);


--
-- Name: phase phase_phase_detail_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phase
    ADD CONSTRAINT phase_phase_detail_key UNIQUE (phase_detail);


--
-- Name: phase phase_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phase
    ADD CONSTRAINT phase_pkey PRIMARY KEY (phase_id);


--
-- Name: phasexref phasexref_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phasexref
    ADD CONSTRAINT phasexref_pkey PRIMARY KEY (nct_phase_id);


--
-- Name: site site_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (site_id);


--
-- Name: sitexref sitexref_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sitexref
    ADD CONSTRAINT sitexref_pkey PRIMARY KEY (nct_site_id);


--
-- Name: study study_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.study
    ADD CONSTRAINT study_pkey PRIMARY KEY (nct_number);


--
-- Name: age age_nct_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.age
    ADD CONSTRAINT age_nct_number_fkey FOREIGN KEY (nct_number) REFERENCES public.study(nct_number);


--
-- Name: condxref condxref_cond_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.condxref
    ADD CONSTRAINT condxref_cond_id_fkey FOREIGN KEY (cond_id) REFERENCES public.condition(cond_id);


--
-- Name: condxref condxref_nct_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.condxref
    ADD CONSTRAINT condxref_nct_number_fkey FOREIGN KEY (nct_number) REFERENCES public.study(nct_number);


--
-- Name: interxref interxref_inter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interxref
    ADD CONSTRAINT interxref_inter_id_fkey FOREIGN KEY (inter_id) REFERENCES public.inter(inter_id);


--
-- Name: interxref interxref_nct_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interxref
    ADD CONSTRAINT interxref_nct_number_fkey FOREIGN KEY (nct_number) REFERENCES public.study(nct_number);


--
-- Name: phasexref phasexref_nct_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phasexref
    ADD CONSTRAINT phasexref_nct_number_fkey FOREIGN KEY (nct_number) REFERENCES public.study(nct_number);


--
-- Name: phasexref phasexref_phase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phasexref
    ADD CONSTRAINT phasexref_phase_id_fkey FOREIGN KEY (phase_id) REFERENCES public.phase(phase_id);


--
-- Name: sitexref sitexref_nct_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sitexref
    ADD CONSTRAINT sitexref_nct_number_fkey FOREIGN KEY (nct_number) REFERENCES public.study(nct_number);


--
-- Name: sitexref sitexref_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sitexref
    ADD CONSTRAINT sitexref_site_id_fkey FOREIGN KEY (site_id) REFERENCES public.site(site_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

