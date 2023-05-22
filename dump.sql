--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: visits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.visits (
    id integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "urlId" integer,
    "ownerId" integer
);


--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.visits_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.visits_id_seq OWNED BY public.visits.id;


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: visits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits ALTER COLUMN id SET DEFAULT nextval('public.visits_id_seq'::regclass);


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (11, '2023-05-20 16:58:15.808501', 'https://stackoverflow.com/questions/28352871/in-express-how-do-i-redirect-a-user-to-an-external-url', 'a5NMK-zP', 16);
INSERT INTO public.urls VALUES (12, '2023-05-20 16:58:16.846352', 'https://stackoverflow.com/questions/28352871/in-express-how-do-i-redirect-a-user-to-an-external-url', 'ULtYbHRj', 16);
INSERT INTO public.urls VALUES (13, '2023-05-20 16:58:17.604703', 'https://stackoverflow.com/questions/28352871/in-express-how-do-i-redirect-a-user-to-an-external-url', '3INPp15a', 16);
INSERT INTO public.urls VALUES (14, '2023-05-20 16:58:18.418301', 'https://stackoverflow.com/questions/28352871/in-express-how-do-i-redirect-a-user-to-an-external-url', '8rIQw9Pb', 16);
INSERT INTO public.urls VALUES (15, '2023-05-20 16:58:24.47265', 'https://stackoverflow.com/questions/28352871/in-express-how-do-i-redirect-a-user-to-an-external-url', 'OlCMbtDK', 16);
INSERT INTO public.urls VALUES (16, '2023-05-20 16:58:24.655314', 'https://stackoverflow.com/questions/28352871/in-express-how-do-i-redirect-a-user-to-an-external-url', 'FMLherdT', 16);
INSERT INTO public.urls VALUES (17, '2023-05-20 17:03:14.537533', 'https://stackoverflow.com/questions/28352871/in-express-how-do-i-redirect-a-user-to-an-external-url', 'Iebru2Ae', 16);
INSERT INTO public.urls VALUES (18, '2023-05-20 17:03:15.241791', 'https://stackoverflow.com/questions/28352871/in-express-how-do-i-redirect-a-user-to-an-external-url', '0Kz507aN', 16);
INSERT INTO public.urls VALUES (19, '2023-05-20 17:27:52.626065', 'https://stackoverflow.com/questions/28352871/in-express-how-do-i-redirect-a-user-to-an-external-url', '8LEsCrK2', 16);
INSERT INTO public.urls VALUES (20, '2023-05-20 17:57:37.438262', 'https://stackoverflow.com/questions/28352871/in-express-how-do-i-redirect-a-user-to-an-external-url', '9LAglzCN', 17);
INSERT INTO public.urls VALUES (22, '2023-05-20 17:57:38.94191', 'https://stackoverflow.com/questions/28352871/in-express-how-do-i-redirect-a-user-to-an-external-url', 'QE--nmEB', 17);
INSERT INTO public.urls VALUES (23, '2023-05-21 03:06:40.854975', 'https://hub.driven.com.br/computacao', 'VXIktLjd', 17);
INSERT INTO public.urls VALUES (24, '2023-05-21 03:08:19.912418', 'https://web.whatsapp.com/', '4FehSL8d', 17);
INSERT INTO public.urls VALUES (25, '2023-05-22 00:09:03.275714', 'https://web.whatsapp.com/', 'h-wfsMuy', 18);
INSERT INTO public.urls VALUES (27, '2023-05-22 00:21:26.234731', 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'Ze-SjT9e', 18);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (16, '2023-05-20 16:56:26.102044', 'DrivenBoyz1', 'drivenboyz1@gmail.com', '$2b$10$hh2K8ih2XFvBtcSghniKlOnrQIl8FOQn1karSkugsoyH73gzIfIXm');
INSERT INTO public.users VALUES (17, '2023-05-20 17:56:59.504377', 'Vinicius', 'kadioba@gmail.com', '$2b$10$ExKzUUejchXjniVIF94/8OOvwC5aQS8iZhlBImaNesiJ81yTx.dXK');
INSERT INTO public.users VALUES (18, '2023-05-22 00:05:11.30469', 'Flavio', 'flavio@gmail.com', '$2b$10$V6qsSnXDvaJioPkFzWKid.osr9TZakHUjZeJXPSK/FRmKoaBkdWqe');


--
-- Data for Name: visits; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.visits VALUES (10, '2023-05-20 17:27:46.976711', 18, 16);
INSERT INTO public.visits VALUES (11, '2023-05-20 17:27:48.546411', 18, 16);
INSERT INTO public.visits VALUES (12, '2023-05-20 17:27:50.013455', 18, 16);
INSERT INTO public.visits VALUES (13, '2023-05-20 17:27:56.813822', 19, 16);
INSERT INTO public.visits VALUES (14, '2023-05-20 17:27:58.025234', 19, 16);
INSERT INTO public.visits VALUES (15, '2023-05-20 17:27:59.399501', 19, 16);
INSERT INTO public.visits VALUES (16, '2023-05-20 17:58:01.069576', 20, 17);
INSERT INTO public.visits VALUES (17, '2023-05-20 17:58:02.758249', 20, 17);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 28, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 21, true);


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.visits_id_seq', 22, true);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: visits visits_ownerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT "visits_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES public.users(id);


--
-- Name: visits visits_urlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visits
    ADD CONSTRAINT "visits_urlId_fkey" FOREIGN KEY ("urlId") REFERENCES public.urls(id);


--
-- PostgreSQL database dump complete
--

