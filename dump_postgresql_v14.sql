--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9
-- Dumped by pg_dump version 14.9

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
-- Name: qualities; Type: TABLE; Schema: public; Owner: tavi
--

CREATE TABLE public.qualities (
    id bigint NOT NULL,
    description character varying(255) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.qualities OWNER TO tavi;

--
-- Name: qualities_id_seq; Type: SEQUENCE; Schema: public; Owner: tavi
--

CREATE SEQUENCE public.qualities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.qualities_id_seq OWNER TO tavi;

--
-- Name: qualities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tavi
--

ALTER SEQUENCE public.qualities_id_seq OWNED BY public.qualities.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: tavi
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    username character varying(20) NOT NULL,
    user_password character varying(255) NOT NULL,
    user_group character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO tavi;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: tavi
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO tavi;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tavi
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: qualities id; Type: DEFAULT; Schema: public; Owner: tavi
--

ALTER TABLE ONLY public.qualities ALTER COLUMN id SET DEFAULT nextval('public.qualities_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: tavi
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: qualities; Type: TABLE DATA; Schema: public; Owner: tavi
--

INSERT INTO public.qualities VALUES (5, 'Wonderful', 4);
INSERT INTO public.qualities VALUES (6, 'Team Player', 3);
INSERT INTO public.qualities VALUES (7, 'Good ead', 3);
INSERT INTO public.qualities VALUES (8, 'Responsible', 4);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: tavi
--

INSERT INTO public.users VALUES (3, 'Sally Adams', 'sally', 'PBKDF2WithHmacSHA256:2048:27VFpuOkowxoztWBwKm9KQaa87W0jmVes9kmNIYj2xg=:AiqUc7JDYfG9pKU0cYZ6dzeX5LfGf1ohWRllaTjzTIY=', 'admin');
INSERT INTO public.users VALUES (4, 'Tom Matthews', 'tom', 'PBKDF2WithHmacSHA256:2048:ZutZndJfyTI/D5G93MXOr9v096Dm2YQsLm4wCdWYock=:xcd4KZkeidKnmTnkF/xEjYB1t5yB4EMbJX90XPj1DnM=', 'user');


--
-- Name: qualities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tavi
--

SELECT pg_catalog.setval('public.qualities_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tavi
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: qualities qualities_pkey; Type: CONSTRAINT; Schema: public; Owner: tavi
--

ALTER TABLE ONLY public.qualities
    ADD CONSTRAINT qualities_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: tavi
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: tavi
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: qualities qualities_userid_fk; Type: FK CONSTRAINT; Schema: public; Owner: tavi
--

ALTER TABLE ONLY public.qualities
    ADD CONSTRAINT qualities_userid_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

