--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: blog_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blog_posts (
    id integer NOT NULL,
    content text,
    date date,
    title text
);


ALTER TABLE public.blog_posts OWNER TO postgres;

--
-- Name: blog_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blog_posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_posts_id_seq OWNER TO postgres;

--
-- Name: blog_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blog_posts_id_seq OWNED BY public.blog_posts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    user_email text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: blog_posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_posts ALTER COLUMN id SET DEFAULT nextval('public.blog_posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: blog_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blog_posts (id, content, date, title) FROM stdin;
1	This is a blog post about nothing. Perhaps you would enjoy reading about nothing.	2022-11-01	Nothingness
2	This is another blog post that shows you 1 + 1 = 2. Hope you enjoyed that.	2022-11-02	Math
3	Sometimes I wonder who is actually reading my blog.. I dont find myself that interesting.	2022-11-03	Thoughts
4	Although my blog posts are super short like "tweets", I still think they are quite informative	2022-11-04	Info
5	The weather today is quite chilly. I do not know what jacket to wear or if I should layer up..	2022-11-05	Weather Thoughts
6	If life a simulation.. are we all just NPCs..	2022-11-06	NPC
7	I love food. I do not know if I could just pick one type of food to eat for the rest of my life. But I am sure there are people out there that could.	2022-11-07	Food
8	Music is food to my soul. If I am having a bad day, I blast music to the point I cannot hear anything around me.	2022-11-08	Music
9	Coding is a great skill to learn. It is quite hard, but once you get a grasp on the concept it becomes easier. Keep it up!	2022-11-09	Coding
10	I do not know what to write anymore.. is anyone even out there reading this..	2022-11-10	IDK
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, user_email) FROM stdin;
1	WildWolf	wildwolf@google.com
2	SmallCat	smallcat@gmail.com
3	BigDog	bigdog@gmail.com
4	BobTheBuilder101	bobthebuilder@gmail.com
5	FrankOcean	frankocean@gmail.com
6	MustardKetchup	mustardketchup@gmail.com
7	frank45	frank45@gmail.com
8	steve98	steve98@gmail.com
9	charles66	charles66@gmail.com
10	TucanSam	sam@gmail.com
\.


--
-- Name: blog_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blog_posts_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: blog_posts blog_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blog_posts
    ADD CONSTRAINT blog_posts_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

