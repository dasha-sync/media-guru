--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)

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
-- Name: marks_after_insert_row_tr(); Type: FUNCTION; Schema: public; Owner: dasha
--

CREATE FUNCTION public.marks_after_insert_row_tr() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE videos SET rating = (
      select avg(marks.digit)
      from marks
          join videos on videos.id = marks.video_id
          where marks.video_id = NEW.video_id);
    RETURN NULL;
END;
$$;


ALTER FUNCTION public.marks_after_insert_row_tr() OWNER TO dasha;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO dasha;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    category_name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO dasha;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO dasha;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: favorites; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.favorites (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    video_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.favorites OWNER TO dasha;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.favorites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_id_seq OWNER TO dasha;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.languages (
    id bigint NOT NULL,
    language_name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.languages OWNER TO dasha;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO dasha;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: marks; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.marks (
    id bigint NOT NULL,
    video_id bigint NOT NULL,
    user_id bigint NOT NULL,
    digit integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.marks OWNER TO dasha;

--
-- Name: marks_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.marks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marks_id_seq OWNER TO dasha;

--
-- Name: marks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.marks_id_seq OWNED BY public.marks.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    text text,
    user_id bigint NOT NULL,
    video_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO dasha;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO dasha;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO dasha;

--
-- Name: speakers; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.speakers (
    id bigint NOT NULL,
    speaker_fio character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.speakers OWNER TO dasha;

--
-- Name: speakers_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.speakers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.speakers_id_seq OWNER TO dasha;

--
-- Name: speakers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.speakers_id_seq OWNED BY public.speakers.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    tag_name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.tags OWNER TO dasha;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO dasha;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    username character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    role integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO dasha;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO dasha;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video_categories; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.video_categories (
    id bigint NOT NULL,
    video_id bigint NOT NULL,
    category_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.video_categories OWNER TO dasha;

--
-- Name: video_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.video_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_categories_id_seq OWNER TO dasha;

--
-- Name: video_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.video_categories_id_seq OWNED BY public.video_categories.id;


--
-- Name: video_languages; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.video_languages (
    id bigint NOT NULL,
    video_id bigint NOT NULL,
    language_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.video_languages OWNER TO dasha;

--
-- Name: video_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.video_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_languages_id_seq OWNER TO dasha;

--
-- Name: video_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.video_languages_id_seq OWNED BY public.video_languages.id;


--
-- Name: video_speakers; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.video_speakers (
    id bigint NOT NULL,
    video_id bigint NOT NULL,
    speaker_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.video_speakers OWNER TO dasha;

--
-- Name: video_speakers_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.video_speakers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_speakers_id_seq OWNER TO dasha;

--
-- Name: video_speakers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.video_speakers_id_seq OWNED BY public.video_speakers.id;


--
-- Name: video_tags; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.video_tags (
    id bigint NOT NULL,
    video_id bigint NOT NULL,
    tag_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.video_tags OWNER TO dasha;

--
-- Name: video_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.video_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_tags_id_seq OWNER TO dasha;

--
-- Name: video_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.video_tags_id_seq OWNED BY public.video_tags.id;


--
-- Name: videos; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.videos (
    id bigint NOT NULL,
    video_name character varying NOT NULL,
    video_description text NOT NULL,
    release_date date NOT NULL,
    video_url character varying NOT NULL,
    picture_url character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    key character varying,
    low_res_key character varying,
    rating integer
);


ALTER TABLE public.videos OWNER TO dasha;

--
-- Name: videos_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.videos_id_seq OWNER TO dasha;

--
-- Name: videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.videos_id_seq OWNED BY public.videos.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: marks id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.marks ALTER COLUMN id SET DEFAULT nextval('public.marks_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: speakers id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.speakers ALTER COLUMN id SET DEFAULT nextval('public.speakers_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video_categories id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_categories ALTER COLUMN id SET DEFAULT nextval('public.video_categories_id_seq'::regclass);


--
-- Name: video_languages id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_languages ALTER COLUMN id SET DEFAULT nextval('public.video_languages_id_seq'::regclass);


--
-- Name: video_speakers id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_speakers ALTER COLUMN id SET DEFAULT nextval('public.video_speakers_id_seq'::regclass);


--
-- Name: video_tags id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_tags ALTER COLUMN id SET DEFAULT nextval('public.video_tags_id_seq'::regclass);


--
-- Name: videos id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.videos ALTER COLUMN id SET DEFAULT nextval('public.videos_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-03-01 09:36:37.765037	2024-03-01 09:36:37.765037
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.categories (id, category_name, created_at, updated_at) FROM stdin;
14	продуктовый обзор	2024-03-01 09:37:45.097815	2024-03-01 09:37:45.097815
15	демонстрация продукта	2024-03-01 09:37:45.101704	2024-03-01 09:37:45.101704
16	обучающий материал	2024-03-01 09:37:45.105943	2024-03-01 09:37:45.105943
17	вебинар	2024-03-01 09:37:45.109196	2024-03-01 09:37:45.109196
18	технологические инновации	2024-03-01 09:37:45.112367	2024-03-01 09:37:45.112367
19	тренды	2024-03-01 09:37:45.115946	2024-03-01 09:37:45.115946
20	интервью	2024-03-01 09:37:45.11936	2024-03-01 09:37:45.11936
21	кейс-стадии	2024-03-01 09:37:45.122758	2024-03-01 09:37:45.122758
22	опыт применения	2024-03-01 09:37:45.126129	2024-03-01 09:37:45.126129
23	корпоративная презентация	2024-03-01 09:37:45.129057	2024-03-01 09:37:45.129057
24	мероприятие	2024-03-01 09:37:45.131789	2024-03-01 09:37:45.131789
25	анимация	2024-03-01 09:37:45.134611	2024-03-01 09:37:45.134611
26	инфографика	2024-03-01 09:37:45.137812	2024-03-01 09:37:45.137812
\.


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.favorites (id, user_id, video_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.languages (id, language_name, created_at, updated_at) FROM stdin;
4	русский	2024-03-01 09:37:45.044944	2024-03-01 09:37:45.044944
5	английский	2024-03-01 09:37:45.048192	2024-03-01 09:37:45.048192
6	немецкий	2024-03-01 09:37:45.051055	2024-03-01 09:37:45.051055
\.


--
-- Data for Name: marks; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.marks (id, video_id, user_id, digit, created_at, updated_at) FROM stdin;
1	1	1	1	2024-03-01 09:37:45.236973	2024-03-01 09:37:45.236973
2	1	2	1	2024-03-01 09:37:45.243247	2024-03-01 09:37:45.243247
3	1	3	1	2024-03-01 09:37:45.24808	2024-03-01 09:37:45.24808
4	2	1	5	2024-03-01 09:37:45.252709	2024-03-01 09:37:45.252709
5	2	2	5	2024-03-01 09:37:45.256898	2024-03-01 09:37:45.256898
6	2	3	5	2024-03-01 09:37:45.261408	2024-03-01 09:37:45.261408
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.reviews (id, text, user_id, video_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.schema_migrations (version) FROM stdin;
20231219135956
20231220143322
20231221141704
20240120120448
20240120120514
20240120123010
20240120194129
20240120194314
20240120194416
20240120205643
20240120205644
20240121010043
20240210111923
20240214063635
20240217120800
20240226081806
20240228071938
\.


--
-- Data for Name: speakers; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.speakers (id, speaker_fio, created_at, updated_at) FROM stdin;
12	Дмитрий Лось	2024-03-01 09:37:45.181911	2024-03-01 09:37:45.181911
13	Нейт Барбеттини	2024-03-01 09:37:45.185413	2024-03-01 09:37:45.185413
14	Павел Мартысюк	2024-03-01 09:37:45.188591	2024-03-01 09:37:45.188591
15	Лиза Васильева 	2024-03-01 09:37:45.191652	2024-03-01 09:37:45.191652
16	Валерий Колесников	2024-03-01 09:37:45.194273	2024-03-01 09:37:45.194273
17	Влад Евневич	2024-03-01 09:37:45.197274	2024-03-01 09:37:45.197274
18	Аристов Игорь	2024-03-01 09:37:45.200429	2024-03-01 09:37:45.200429
19	Вячеслав Морозов	2024-03-01 09:37:45.204881	2024-03-01 09:37:45.204881
20	Илья Ковалев	2024-03-01 09:37:45.208085	2024-03-01 09:37:45.208085
21	Антон Блинков	2024-03-01 09:37:45.211536	2024-03-01 09:37:45.211536
22	Матвей бойков	2024-03-01 09:37:45.215971	2024-03-01 09:37:45.215971
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.tags (id, tag_name, created_at, updated_at) FROM stdin;
10	приключения	2024-03-01 09:37:44.996323	2024-03-01 09:37:44.996323
11	тестирование	2024-03-01 09:37:45.000156	2024-03-01 09:37:45.000156
12	backend разработка	2024-03-01 09:37:45.003287	2024-03-01 09:37:45.003287
13	frontend разработка	2024-03-01 09:37:45.006186	2024-03-01 09:37:45.006186
14	сис. администрирование	2024-03-01 09:37:45.009173	2024-03-01 09:37:45.009173
15	дизайн	2024-03-01 09:37:45.012059	2024-03-01 09:37:45.012059
16	не разработчик в it	2024-03-01 09:37:45.015053	2024-03-01 09:37:45.015053
17	спорт	2024-03-01 09:37:45.018148	2024-03-01 09:37:45.018148
18	трансляция	2024-03-01 09:37:45.021988	2024-03-01 09:37:45.021988
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, username, created_at, updated_at, role) FROM stdin;
1	admin@example.com	$2a$12$fdZDZTRIFY32hcTmgU2CZuuUHgInGzB5ttJlyL1sIvieNyovK470u	\N	\N	\N	Dasha Admin	2024-03-01 09:36:38.090538	2024-03-01 09:36:38.090538	1
2	user_0@example.com	$2a$12$8PCWoq.QBspuleW.uDcq6.WNGwUHEHW.0t1Urf6orpNtR/Scc0HzO	\N	\N	\N	darell	2024-03-01 09:36:38.387016	2024-03-01 09:36:38.387016	0
3	user_1@example.com	$2a$12$99LMmfQK.oX/8ryMPFw0Sereyp4x7VCf4vkBLgCJtWgMsLfsoctny	\N	\N	\N	layla	2024-03-01 09:36:38.571703	2024-03-01 09:36:38.571703	0
4	user_2@example.com	$2a$12$N.cq1Olboa0rs0/aaBlU/eGaUbr/AnJlu3LCAQm72TWhOH5Mwm4bO	\N	\N	\N	genaro.friesen	2024-03-01 09:36:38.757079	2024-03-01 09:36:38.757079	0
5	user_3@example.com	$2a$12$H6rFQSjAHyczDtZ9oMTjXObAp8CUizWzm.3fDjBgITH0AsoYLiVz.	\N	\N	\N	raymond	2024-03-01 09:36:38.946914	2024-03-01 09:36:38.946914	0
6	user_4@example.com	$2a$12$eScv.sDuZt/gE2UJSgshj.DqbaGiZrgIhi561K.QWmoo65a9OTVOK	\N	\N	\N	ellis	2024-03-01 09:36:39.132303	2024-03-01 09:36:39.132303	0
7	user_5@example.com	$2a$12$OueCCCu5viw00zxopWBkv.QrjMogy0ZbkeB6fVRpfAwlCugFsjjj6	\N	\N	\N	gwenn	2024-03-01 09:36:39.321047	2024-03-01 09:36:39.321047	0
8	user_6@example.com	$2a$12$hBzMYTlQfeeJg8UNQ9wu1OPBvLDeCGzjbtazv5CxBEtlNC0eWeEB6	\N	\N	\N	annett	2024-03-01 09:36:39.500619	2024-03-01 09:36:39.500619	0
9	user_7@example.com	$2a$12$EDF0Q.XfMVdKCQ524VQKaexfe7GkAQt0HF7j5FxvcpQUVmyo1OwZq	\N	\N	\N	broderick_parker	2024-03-01 09:36:39.692825	2024-03-01 09:36:39.692825	0
10	user_8@example.com	$2a$12$EarZziCHOP69435gGhzXLub4GN5tFG8oHJRJTOe8.i.6wW34ZCcnu	\N	\N	\N	taryn.hermann	2024-03-01 09:36:39.879839	2024-03-01 09:36:39.879839	0
11	user_9@example.com	$2a$12$6uZMLlblKExv2R2SasGQCu6Z9vWq.hoe49ajXLU1g8aFdtQocNtte	\N	\N	\N	tod_boyle	2024-03-01 09:36:40.06718	2024-03-01 09:36:40.06718	0
12	user_10@example.com	$2a$12$crOLu3w7WBWOXrUy3VFwR.THbqcmskxVtuWnKbyQkyLOK5fLvJXhy	\N	\N	\N	dirk	2024-03-01 09:36:40.254686	2024-03-01 09:36:40.254686	0
13	user_11@example.com	$2a$12$tNI.h698HKTPB.EETYX0dem1pe8U2XijRWCI8mD5Qo/0gTIgg77/C	\N	\N	\N	tynisha.rodriguez	2024-03-01 09:36:40.44067	2024-03-01 09:36:40.44067	0
14	user_12@example.com	$2a$12$acudytmA3LFsuyhyGVJmweUeC/ddN/ke5ME4QgBU6Ka6NSBsY/qlu	\N	\N	\N	terica	2024-03-01 09:36:40.626652	2024-03-01 09:36:40.626652	0
15	user_13@example.com	$2a$12$RgSb6aiTAceNYfGcG92MWu4XkY5IFKiBPTpwSADCRyEihUtRYlv4O	\N	\N	\N	sol	2024-03-01 09:36:40.812941	2024-03-01 09:36:40.812941	0
16	user_14@example.com	$2a$12$G31bBrKb5eLOPw3A7d6YDuL7hyBuIMlWaPx/VwsDkbibwffDSNLXO	\N	\N	\N	ela.kuhic	2024-03-01 09:36:41.003035	2024-03-01 09:36:41.003035	0
17	user_15@example.com	$2a$12$2YuXd3TLY88miktvetiv2uHXT7WUhG.huJEFdXzcUZ15Fovp.a9h6	\N	\N	\N	cherly_steuber	2024-03-01 09:36:41.189665	2024-03-01 09:36:41.189665	0
18	user_16@example.com	$2a$12$20f3jEf2zzBvtY7jd2GJyez7LdgJ7eDPIoDe/EX7JsnHtbgidoM5K	\N	\N	\N	carlos	2024-03-01 09:36:41.375972	2024-03-01 09:36:41.375972	0
19	user_17@example.com	$2a$12$NvUgNBOgAQCG.iv00OM2keCLh5Qoufu69bSi/4C9C5.aGxiVgGX7K	\N	\N	\N	bobbi_collier	2024-03-01 09:36:41.56195	2024-03-01 09:36:41.56195	0
20	user_18@example.com	$2a$12$ju9.bFsw7qM0kLNUlRjgfebd1skNmU4fPdnh./35e.wUBc1fR1PwG	\N	\N	\N	herlinda	2024-03-01 09:36:41.747598	2024-03-01 09:36:41.747598	0
21	user_19@example.com	$2a$12$Usfj7hE0mrEVrXfzAm9/pus2/urZdkobR68GzWNVuOaPmukN3hkyO	\N	\N	\N	david.abshire	2024-03-01 09:36:41.932103	2024-03-01 09:36:41.932103	0
22	user_20@example.com	$2a$12$pvopuwA7euTfgsLZ7iS0X.HPts2rCePnScOvAX5mzJme3WzyGNYjK	\N	\N	\N	tawana	2024-03-01 09:36:42.118673	2024-03-01 09:36:42.118673	0
23	user_21@example.com	$2a$12$Yizu6xvL3jwuL2f7Edc1Q.05EQ0hBhYlR99Lam/18SraSxlbfLzde	\N	\N	\N	dedra	2024-03-01 09:36:42.304005	2024-03-01 09:36:42.304005	0
24	user_22@example.com	$2a$12$hsnEj6VRSrPnUiWc4EMdSOGox9imohA.S/ogY7GhVk9WDhMvArNRG	\N	\N	\N	yun	2024-03-01 09:36:42.489241	2024-03-01 09:36:42.489241	0
25	user_23@example.com	$2a$12$8F28PlXJBedlvwx6.dd4KuJ4.JLUZfThE..FFptezZ6OOVwG5LfMa	\N	\N	\N	chu.marvin	2024-03-01 09:36:42.675602	2024-03-01 09:36:42.675602	0
26	user_24@example.com	$2a$12$YbleqpwCgoQ41nRlRCXQNeSqwMjaY7BcMbhZ6d5DZWZ4nXVbRfBky	\N	\N	\N	eleonora	2024-03-01 09:36:42.860988	2024-03-01 09:36:42.860988	0
27	user_25@example.com	$2a$12$/3ZZDTisoh/A.zm2V/yJ7eqvHKdR4KUovDZtm4voSsRWk9lZsCxca	\N	\N	\N	gil_conroy	2024-03-01 09:36:43.051266	2024-03-01 09:36:43.051266	0
28	user_26@example.com	$2a$12$dlewZNHibd1MrEP9/gEtk./R/4v8cWcTM1SDWHvZOvNrxf9iZkz0e	\N	\N	\N	ethan	2024-03-01 09:36:43.23731	2024-03-01 09:36:43.23731	0
29	user_27@example.com	$2a$12$PIpRuDi5L20vWCow8nli/.cnQ9pdVlDU2/qQOcVN1imL/qJtwf2tO	\N	\N	\N	vince	2024-03-01 09:36:43.423501	2024-03-01 09:36:43.423501	0
30	user_28@example.com	$2a$12$h8BYFC2nG2O6ABZhW1n5bOH35.VOnMlkN5qXaic60S.2PWnTYCkeW	\N	\N	\N	isreal.ebert	2024-03-01 09:36:43.609231	2024-03-01 09:36:43.609231	0
31	user_29@example.com	$2a$12$6So2Dag/ORCYFaPMVZ0CQ.dyJLJZzOM5Qt1R9ieg6VWk.qfklcDna	\N	\N	\N	fairy	2024-03-01 09:36:43.793942	2024-03-01 09:36:43.793942	0
32	user_30@example.com	$2a$12$ADbxkseFZhadGHYZbUUGeuIRB4ne/xQX6UYeIZjL7b.7MSm1FOV6i	\N	\N	\N	willie_mclaughlin	2024-03-01 09:36:43.979095	2024-03-01 09:36:43.979095	0
33	user_31@example.com	$2a$12$0LR7lIevuH/ewHpUKSBjeu3XhiTj0000Eu2uPlHuQIK104u0FYM6m	\N	\N	\N	enid.stark	2024-03-01 09:36:44.165751	2024-03-01 09:36:44.165751	0
34	user_32@example.com	$2a$12$FIjdwfPczUMQ6jkT7VBqmOSxlCjE7l1dK3G2R/f08QbiAYt1stwC6	\N	\N	\N	brooks	2024-03-01 09:36:44.355628	2024-03-01 09:36:44.355628	0
35	user_33@example.com	$2a$12$yaXdn52KRtC6UsfTafbu8Oe./lWW2s66/LQeHsmTH0Xpo7md1CJAy	\N	\N	\N	craig.conroy	2024-03-01 09:36:44.535985	2024-03-01 09:36:44.535985	0
36	user_34@example.com	$2a$12$sN6.5cefNReAaX8OTNiQRe2xGHWTaDkGCHuBVqkK2jCRmWjzPxd7y	\N	\N	\N	anjelica	2024-03-01 09:36:44.721737	2024-03-01 09:36:44.721737	0
37	user_35@example.com	$2a$12$w/7OT/X1MMqaqg1FX/pDSOOAcq1h0te5r81bC35AufM5HdCIIC26i	\N	\N	\N	joslyn	2024-03-01 09:36:44.90737	2024-03-01 09:36:44.90737	0
38	user_36@example.com	$2a$12$Z2pf6jfJEdFBcuHj77MWU.6uxz/CgrNnLyaf/Jh.3KeUXft8OG/Fy	\N	\N	\N	ellen_collier	2024-03-01 09:36:45.096659	2024-03-01 09:36:45.096659	0
39	user_37@example.com	$2a$12$9s/vN1JZPGh89KB4jKfOJu1T1wGe7g82ntIXrORHoN4aUH2mNjr16	\N	\N	\N	augustine	2024-03-01 09:36:45.28081	2024-03-01 09:36:45.28081	0
40	user_38@example.com	$2a$12$sGlSFglvGUNOy2dsp9RF8erGkt/bVEvGyymPIY.fir5XE5kJiY8aa	\N	\N	\N	melony	2024-03-01 09:36:45.466219	2024-03-01 09:36:45.466219	0
41	user_39@example.com	$2a$12$NNUR6wvoADU0hQQb2XkRm.ef66058bwvvEd9mhf6y8/wdGq33AVy6	\N	\N	\N	leena_kiehn	2024-03-01 09:36:45.652279	2024-03-01 09:36:45.652279	0
42	user_40@example.com	$2a$12$MIaNjY2ztgATZWWydIfGlujJdYMiMZZxOqLWegCgx.5BGhCLEVg8q	\N	\N	\N	cyndy_ziemann	2024-03-01 09:36:45.838315	2024-03-01 09:36:45.838315	0
43	user_41@example.com	$2a$12$Bd59WccMleLEYIxGVxEKCOyEyDdbJzxv3vbZQV40YGBucKxs6oCbG	\N	\N	\N	halley	2024-03-01 09:36:46.024712	2024-03-01 09:36:46.024712	0
44	user_42@example.com	$2a$12$9sLFqbYk00L066Wc0UBPpuNs10ELiqzRYVjFZzzCFfZ.5n0fR4eKa	\N	\N	\N	devin	2024-03-01 09:36:46.211074	2024-03-01 09:36:46.211074	0
45	user_43@example.com	$2a$12$O3MZjveqcdpeLBjyfGjv0utpduShAuSIjKTHDRVZ42LMKJuqeAWSG	\N	\N	\N	arnetta_bernhard	2024-03-01 09:36:46.396782	2024-03-01 09:36:46.396782	0
46	user_44@example.com	$2a$12$D1OWxYagpqlu6K7hb/8S5Ohp8E3DMBpwKFKZaHEA7U63ls50kIZIq	\N	\N	\N	denis	2024-03-01 09:36:46.581113	2024-03-01 09:36:46.581113	0
47	user_45@example.com	$2a$12$k0.P5jchcl45X4EcumO9oOphly1gt1ujsp/1xdyQwD.unY.SUoy16	\N	\N	\N	barbra	2024-03-01 09:36:46.766697	2024-03-01 09:36:46.766697	0
48	user_46@example.com	$2a$12$Rhc7Fqk6JO3Y7I2iDv/mtO5IM0nLXd/Jpy6wdp02tHdFiqthWeFLu	\N	\N	\N	brittni	2024-03-01 09:36:46.95389	2024-03-01 09:36:46.95389	0
49	user_47@example.com	$2a$12$/cbnqs9Tb2aIHXcEwIktVONkgww5IisSgeuhlt/qne4a/looizKum	\N	\N	\N	marco	2024-03-01 09:36:47.144023	2024-03-01 09:36:47.144023	0
50	user_48@example.com	$2a$12$3ykSOENEVKze/Uo7BVkKzO4fNKlJgIZhmkjSXBBnQRXi8oZbpRhxW	\N	\N	\N	owen	2024-03-01 09:36:47.329774	2024-03-01 09:36:47.329774	0
51	user_49@example.com	$2a$12$pHVpXivluwa6QBK6gFAm1uwXjXtNuL7u.yA1r/oyLSV43oXboXzhi	\N	\N	\N	terry_bartoletti	2024-03-01 09:36:47.514784	2024-03-01 09:36:47.514784	0
\.


--
-- Data for Name: video_categories; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.video_categories (id, video_id, category_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: video_languages; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.video_languages (id, video_id, language_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: video_speakers; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.video_speakers (id, video_id, speaker_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: video_tags; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.video_tags (id, video_id, tag_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.videos (id, video_name, video_description, release_date, video_url, picture_url, created_at, updated_at, key, low_res_key, rating) FROM stdin;
1	sdfv	edrvdfv	2024-03-07	HintedSpinner_-_библиотека__дающая_возможность_добавлять_Hint_в_Android.mp4	Screenshot_from_2024-02-05_10-56-08.png	2024-03-01 09:37:13.456232	2024-03-01 09:37:13.456232	\N	\N	5
2	FastAPI с нуля за 10 минут! Взаимодействие с SQLAlchemy, Pydantic, Alembic	dfvdf	2024-03-14	HintedSpinner_-_библиотека__дающая_возможность_добавлять_Hint_в_Android.mp4	Screenshot_from_2024-02-05_10-56-08.png	2024-03-01 09:37:25.023914	2024-03-01 09:37:25.023914	\N	\N	5
3	FastAPI с нуля за 10 минут! Взаимодействие с SQLAlchemy, Pydantic, Alembic	adfv	2024-03-15	HintedSpinner_-_библиотека__дающая_возможность_добавлять_Hint_в_Android.mp4	Screenshot_from_2024-02-05_10-56-08.png	2024-03-01 09:37:37.692186	2024-03-01 09:37:37.692186	\N	\N	5
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.categories_id_seq', 26, true);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.favorites_id_seq', 1, false);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.languages_id_seq', 6, true);


--
-- Name: marks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.marks_id_seq', 6, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: speakers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.speakers_id_seq', 22, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.tags_id_seq', 18, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.users_id_seq', 51, true);


--
-- Name: video_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.video_categories_id_seq', 1, false);


--
-- Name: video_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.video_languages_id_seq', 1, false);


--
-- Name: video_speakers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.video_speakers_id_seq', 1, false);


--
-- Name: video_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.video_tags_id_seq', 1, false);


--
-- Name: videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.videos_id_seq', 3, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);


--
-- Name: marks marks_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: speakers speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.speakers
    ADD CONSTRAINT speakers_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video_categories video_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_categories
    ADD CONSTRAINT video_categories_pkey PRIMARY KEY (id);


--
-- Name: video_languages video_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_languages
    ADD CONSTRAINT video_languages_pkey PRIMARY KEY (id);


--
-- Name: video_speakers video_speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_speakers
    ADD CONSTRAINT video_speakers_pkey PRIMARY KEY (id);


--
-- Name: video_tags video_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_tags
    ADD CONSTRAINT video_tags_pkey PRIMARY KEY (id);


--
-- Name: videos videos_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.videos
    ADD CONSTRAINT videos_pkey PRIMARY KEY (id);


--
-- Name: index_favorites_on_user_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_favorites_on_user_id ON public.favorites USING btree (user_id);


--
-- Name: index_favorites_on_video_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_favorites_on_video_id ON public.favorites USING btree (video_id);


--
-- Name: index_marks_on_user_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_marks_on_user_id ON public.marks USING btree (user_id);


--
-- Name: index_marks_on_video_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_marks_on_video_id ON public.marks USING btree (video_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_reviews_on_user_id ON public.reviews USING btree (user_id);


--
-- Name: index_reviews_on_video_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_reviews_on_video_id ON public.reviews USING btree (video_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: dasha
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: dasha
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_video_categories_on_category_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_video_categories_on_category_id ON public.video_categories USING btree (category_id);


--
-- Name: index_video_categories_on_video_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_video_categories_on_video_id ON public.video_categories USING btree (video_id);


--
-- Name: index_video_languages_on_language_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_video_languages_on_language_id ON public.video_languages USING btree (language_id);


--
-- Name: index_video_languages_on_video_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_video_languages_on_video_id ON public.video_languages USING btree (video_id);


--
-- Name: index_video_speakers_on_speaker_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_video_speakers_on_speaker_id ON public.video_speakers USING btree (speaker_id);


--
-- Name: index_video_speakers_on_video_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_video_speakers_on_video_id ON public.video_speakers USING btree (video_id);


--
-- Name: index_video_tags_on_tag_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_video_tags_on_tag_id ON public.video_tags USING btree (tag_id);


--
-- Name: index_video_tags_on_video_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_video_tags_on_video_id ON public.video_tags USING btree (video_id);


--
-- Name: marks marks_after_insert_row_tr; Type: TRIGGER; Schema: public; Owner: dasha
--

CREATE TRIGGER marks_after_insert_row_tr AFTER INSERT ON public.marks FOR EACH ROW EXECUTE FUNCTION public.marks_after_insert_row_tr();


--
-- Name: video_languages fk_rails_160d6c0e07; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_languages
    ADD CONSTRAINT fk_rails_160d6c0e07 FOREIGN KEY (language_id) REFERENCES public.languages(id);


--
-- Name: video_speakers fk_rails_5ae4fef373; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_speakers
    ADD CONSTRAINT fk_rails_5ae4fef373 FOREIGN KEY (video_id) REFERENCES public.videos(id);


--
-- Name: video_categories fk_rails_6c7e71cde7; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_categories
    ADD CONSTRAINT fk_rails_6c7e71cde7 FOREIGN KEY (video_id) REFERENCES public.videos(id);


--
-- Name: marks fk_rails_6f82d45597; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT fk_rails_6f82d45597 FOREIGN KEY (video_id) REFERENCES public.videos(id);


--
-- Name: reviews fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: video_speakers fk_rails_80ba6464b1; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_speakers
    ADD CONSTRAINT fk_rails_80ba6464b1 FOREIGN KEY (speaker_id) REFERENCES public.speakers(id);


--
-- Name: marks fk_rails_8a89591deb; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT fk_rails_8a89591deb FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reviews fk_rails_9d113a2f76; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_9d113a2f76 FOREIGN KEY (video_id) REFERENCES public.videos(id);


--
-- Name: video_languages fk_rails_adb392f21d; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_languages
    ADD CONSTRAINT fk_rails_adb392f21d FOREIGN KEY (video_id) REFERENCES public.videos(id);


--
-- Name: video_tags fk_rails_af94da446b; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_tags
    ADD CONSTRAINT fk_rails_af94da446b FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: video_categories fk_rails_afa6fb1e5b; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_categories
    ADD CONSTRAINT fk_rails_afa6fb1e5b FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: favorites fk_rails_b24a5713a2; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_b24a5713a2 FOREIGN KEY (video_id) REFERENCES public.videos(id);


--
-- Name: favorites fk_rails_d15744e438; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT fk_rails_d15744e438 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: video_tags fk_rails_fcdb957abf; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_tags
    ADD CONSTRAINT fk_rails_fcdb957abf FOREIGN KEY (video_id) REFERENCES public.videos(id);


--
-- PostgreSQL database dump complete
--

