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
-- Name: marks_after_delete_row_tr(); Type: FUNCTION; Schema: public; Owner: dasha
--

CREATE FUNCTION public.marks_after_delete_row_tr() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE videos SET rating = (
      select avg(marks.digit)
      from marks
          where marks.video_id = OLD.video_id)
      WHERE videos.id = OLD.video_id;
    RETURN NULL;
END;
$$;


ALTER FUNCTION public.marks_after_delete_row_tr() OWNER TO dasha;

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
          where marks.video_id = NEW.video_id)
      WHERE videos.id = NEW.video_id;
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
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT digit_check CHECK (((digit >= 1) AND (digit <= 5)))
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
-- Name: user_activities; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.user_activities (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    action character varying NOT NULL,
    login_time timestamp(6) without time zone,
    logout_time timestamp(6) without time zone,
    session_id character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_activities OWNER TO dasha;

--
-- Name: user_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.user_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_activities_id_seq OWNER TO dasha;

--
-- Name: user_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.user_activities_id_seq OWNED BY public.user_activities.id;


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
-- Name: watched_videos; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.watched_videos (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    video_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.watched_videos OWNER TO dasha;

--
-- Name: watched_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.watched_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watched_videos_id_seq OWNER TO dasha;

--
-- Name: watched_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.watched_videos_id_seq OWNED BY public.watched_videos.id;


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
-- Name: user_activities id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.user_activities ALTER COLUMN id SET DEFAULT nextval('public.user_activities_id_seq'::regclass);


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
-- Name: watched_videos id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.watched_videos ALTER COLUMN id SET DEFAULT nextval('public.watched_videos_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-03-17 20:26:34.471237	2024-03-17 20:26:34.471237
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.categories (id, category_name, created_at, updated_at) FROM stdin;
1	продуктовый обзор	2024-03-17 20:26:44.338987	2024-03-17 20:26:44.338987
2	демонстрация продукта	2024-03-17 20:26:44.341792	2024-03-17 20:26:44.341792
3	обучающий материал	2024-03-17 20:26:44.345824	2024-03-17 20:26:44.345824
4	вебинар	2024-03-17 20:26:44.348881	2024-03-17 20:26:44.348881
5	технологические инновации	2024-03-17 20:26:44.351897	2024-03-17 20:26:44.351897
6	тренды	2024-03-17 20:26:44.354354	2024-03-17 20:26:44.354354
7	интервью	2024-03-17 20:26:44.357179	2024-03-17 20:26:44.357179
8	кейс-стадии	2024-03-17 20:26:44.360019	2024-03-17 20:26:44.360019
9	опыт применения	2024-03-17 20:26:44.362624	2024-03-17 20:26:44.362624
10	корпоративная презентация	2024-03-17 20:26:44.365107	2024-03-17 20:26:44.365107
11	мероприятие	2024-03-17 20:26:44.367474	2024-03-17 20:26:44.367474
12	анимация	2024-03-17 20:26:44.37001	2024-03-17 20:26:44.37001
13	инфографика	2024-03-17 20:26:44.373381	2024-03-17 20:26:44.373381
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
1	русский	2024-03-17 20:26:44.327101	2024-03-17 20:26:44.327101
2	английский	2024-03-17 20:26:44.330069	2024-03-17 20:26:44.330069
3	немецкий	2024-03-17 20:26:44.332624	2024-03-17 20:26:44.332624
\.


--
-- Data for Name: marks; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.marks (id, video_id, user_id, digit, created_at, updated_at) FROM stdin;
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
20240301071227
20240301100022
20240317200043
20240318220443
\.


--
-- Data for Name: speakers; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.speakers (id, speaker_fio, created_at, updated_at) FROM stdin;
1	Дмитрий Лось	2024-03-17 20:26:44.382083	2024-03-17 20:26:44.382083
2	Нейт Барбеттини	2024-03-17 20:26:44.384901	2024-03-17 20:26:44.384901
3	Павел Мартысюк	2024-03-17 20:26:44.387906	2024-03-17 20:26:44.387906
4	Лиза Васильева 	2024-03-17 20:26:44.390825	2024-03-17 20:26:44.390825
5	Валерий Колесников	2024-03-17 20:26:44.393517	2024-03-17 20:26:44.393517
6	Влад Евневич	2024-03-17 20:26:44.396122	2024-03-17 20:26:44.396122
7	Аристов Игорь	2024-03-17 20:26:44.398584	2024-03-17 20:26:44.398584
8	Вячеслав Морозов	2024-03-17 20:26:44.401588	2024-03-17 20:26:44.401588
9	Илья Ковалев	2024-03-17 20:26:44.404008	2024-03-17 20:26:44.404008
10	Антон Блинков	2024-03-17 20:26:44.407914	2024-03-17 20:26:44.407914
11	Матвей бойков	2024-03-17 20:26:44.411278	2024-03-17 20:26:44.411278
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.tags (id, tag_name, created_at, updated_at) FROM stdin;
1	приключения	2024-03-17 20:26:44.293714	2024-03-17 20:26:44.293714
2	тестирование	2024-03-17 20:26:44.296672	2024-03-17 20:26:44.296672
3	backend разработка	2024-03-17 20:26:44.299368	2024-03-17 20:26:44.299368
4	frontend разработка	2024-03-17 20:26:44.302042	2024-03-17 20:26:44.302042
5	сис. администрирование	2024-03-17 20:26:44.306418	2024-03-17 20:26:44.306418
6	дизайн	2024-03-17 20:26:44.310013	2024-03-17 20:26:44.310013
7	не разработчик в it	2024-03-17 20:26:44.312868	2024-03-17 20:26:44.312868
8	спорт	2024-03-17 20:26:44.316175	2024-03-17 20:26:44.316175
9	трансляция	2024-03-17 20:26:44.319456	2024-03-17 20:26:44.319456
\.


--
-- Data for Name: user_activities; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.user_activities (id, user_id, action, login_time, logout_time, session_id, created_at, updated_at) FROM stdin;
36	1	logout	\N	2024-03-18 08:03:21.193733	\N	2024-03-18 08:03:21.200071	2024-03-18 08:03:21.200071
37	1	login	2024-03-18 08:03:24.480726	\N	\N	2024-03-18 08:03:24.483659	2024-03-18 08:03:24.483659
38	1	logout	\N	2024-03-18 08:03:37.58666	\N	2024-03-18 08:03:37.592687	2024-03-18 08:03:37.592687
39	1	login	2024-03-18 08:03:41.734127	\N	\N	2024-03-18 08:03:41.737019	2024-03-18 08:03:41.737019
40	1	logout	\N	2024-03-18 08:04:58.600259	\N	2024-03-18 08:04:58.6046	2024-03-18 08:04:58.6046
41	1	login	2024-03-18 08:05:01.399006	\N	\N	2024-03-18 08:05:01.401838	2024-03-18 08:05:01.401838
42	1	logout	\N	2024-03-18 08:07:54.250412	\N	2024-03-18 08:07:54.256788	2024-03-18 08:07:54.256788
43	1	login	2024-03-18 08:07:57.415704	\N	\N	2024-03-18 08:07:57.418339	2024-03-18 08:07:57.418339
44	1	logout	\N	2024-03-18 08:13:04.462926	\N	2024-03-18 08:13:04.469297	2024-03-18 08:13:04.469297
45	19	login	2024-03-18 08:13:12.452512	\N	\N	2024-03-18 08:13:12.455173	2024-03-18 08:13:12.455173
46	19	logout	\N	2024-03-18 08:14:54.271947	\N	2024-03-18 08:14:54.276374	2024-03-18 08:14:54.276374
47	1	login	2024-03-18 08:14:59.75784	\N	\N	2024-03-18 08:14:59.760556	2024-03-18 08:14:59.760556
48	1	login	2024-03-18 08:27:30.571527	\N	\N	2024-03-18 08:27:30.582994	2024-03-18 08:27:30.582994
49	1	logout	\N	2024-03-18 10:06:09.000421	\N	2024-03-18 10:06:09.007081	2024-03-18 10:06:09.007081
50	1	login	2024-03-18 10:06:20.033618	\N	\N	2024-03-18 10:06:20.039769	2024-03-18 10:06:20.039769
51	1	login	2024-03-18 10:36:23.85015	\N	\N	2024-03-18 10:36:23.85404	2024-03-18 10:36:23.85404
52	1	logout	\N	2024-03-18 18:55:23.625677	\N	2024-03-18 18:55:23.631728	2024-03-18 18:55:23.631728
53	1	login	2024-03-18 18:55:26.136731	\N	\N	2024-03-18 18:55:26.138681	2024-03-18 18:55:26.138681
54	1	logout	\N	2024-03-18 19:33:18.781625	\N	2024-03-18 19:33:18.790431	2024-03-18 19:33:18.790431
55	2	login	2024-03-18 19:33:28.89567	\N	\N	2024-03-18 19:33:28.89783	2024-03-18 19:33:28.89783
56	2	logout	\N	2024-03-18 19:34:01.892734	\N	2024-03-18 19:34:01.904331	2024-03-18 19:34:01.904331
57	7	login	2024-03-18 19:34:11.571737	\N	\N	2024-03-18 19:34:11.573987	2024-03-18 19:34:11.573987
58	7	logout	\N	2024-03-18 19:34:18.963618	\N	2024-03-18 19:34:18.965461	2024-03-18 19:34:18.965461
59	4	login	2024-03-18 19:34:25.060544	\N	\N	2024-03-18 19:34:25.06252	2024-03-18 19:34:25.06252
60	4	logout	\N	2024-03-18 19:34:41.763167	\N	2024-03-18 19:34:41.771814	2024-03-18 19:34:41.771814
61	1	login	2024-03-18 19:35:13.667077	\N	\N	2024-03-18 19:35:13.66916	2024-03-18 19:35:13.66916
62	1	logout	\N	2024-03-18 20:40:42.651639	\N	2024-03-18 20:40:42.655979	2024-03-18 20:40:42.655979
63	6	login	2024-03-18 20:40:51.426976	\N	\N	2024-03-18 20:40:51.428946	2024-03-18 20:40:51.428946
64	6	logout	\N	2024-03-18 20:40:57.723921	\N	2024-03-18 20:40:57.726485	2024-03-18 20:40:57.726485
65	1	login	2024-03-18 20:41:02.273717	\N	\N	2024-03-18 20:41:02.275972	2024-03-18 20:41:02.275972
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, username, created_at, updated_at, role) FROM stdin;
1	admin@example.com	$2a$12$bgobJwZoqShC3hWL1ELqmuMspq/CW0GWzzNVyx1qxZRgNYunRQdo.	\N	\N	\N	Dasha Admin	2024-03-17 20:26:34.806788	2024-03-17 20:26:34.806788	1
2	user_0@example.com	$2a$12$lliPuNxldRXhfvaJBokOXu.bx1MESOXIc8DBS0d4OajRW7SkQVmPa	\N	\N	\N	america	2024-03-17 20:26:35.143288	2024-03-17 20:26:35.143288	0
3	user_1@example.com	$2a$12$1pY3AENWI08GVZDEWUOgO.32PJsNXTKhimjWYX/YR939dHMZicwMm	\N	\N	\N	isaias.hills	2024-03-17 20:26:35.323726	2024-03-17 20:26:35.323726	0
4	user_2@example.com	$2a$12$W7rNFilEZd4dsR2o3ey92uBwTmE83bSyA4LTXarvyXWaXf1ambCsW	\N	\N	\N	laquanda	2024-03-17 20:26:35.513995	2024-03-17 20:26:35.513995	0
5	user_3@example.com	$2a$12$0IFb91Ex8nJYyeK5QkReu.6gRc1wyBOBTt2fXTfUSK7nmgYX3U3VW	\N	\N	\N	enda_schumm	2024-03-17 20:26:35.699609	2024-03-17 20:26:35.699609	0
6	user_4@example.com	$2a$12$fXZSFLfWjjsiWZrEFDeyZuGdU.yY7zYSjqDChtMaMjylPQLstCfs6	\N	\N	\N	winter_goyette	2024-03-17 20:26:35.884263	2024-03-17 20:26:35.884263	0
7	user_5@example.com	$2a$12$SSnTyfN56sLc71CYRWqSRuDk0b14IQBxL.Oop46bP5Rj.4NbkjlzC	\N	\N	\N	glen	2024-03-17 20:26:36.069876	2024-03-17 20:26:36.069876	0
8	user_6@example.com	$2a$12$0P40UR2WQ81erTL6v4v.q.usQw2iNTnBbNEfKoDs6.aARQq05PgCS	\N	\N	\N	maxima_oconnell	2024-03-17 20:26:36.255458	2024-03-17 20:26:36.255458	0
9	user_7@example.com	$2a$12$Vy8vJqtj6WFKdTMVOWA/1.SG2ulWruVNUFxEV41M8urM7OOXFdmFO	\N	\N	\N	valentine_gusikowski	2024-03-17 20:26:36.448596	2024-03-17 20:26:36.448596	0
10	user_8@example.com	$2a$12$KKZQRUZmqgqPRQEaWe0FUO7QpZwwDJOpfPeMn5Zlbecso2BmOMLDO	\N	\N	\N	noelia	2024-03-17 20:26:36.638074	2024-03-17 20:26:36.638074	0
11	user_9@example.com	$2a$12$r.dusF2tbQy2ad9C0VaHb.2Mh1RlJe05aRW3qN1PDjXuh711RXZC2	\N	\N	\N	marcelo_langosh	2024-03-17 20:26:36.821074	2024-03-17 20:26:36.821074	0
12	user_10@example.com	$2a$12$fnVu2t.4sVW9c/8H6XzU8OckKuXLxr7PDU2Xk9lf0oDKRxrE3V222	\N	\N	\N	carina.roberts	2024-03-17 20:26:37.01128	2024-03-17 20:26:37.01128	0
13	user_11@example.com	$2a$12$CF8I1r6w7lq56ST6OBFNp.nsTXVjjaonTvL/ZpnqpqGTUFpBWItlG	\N	\N	\N	lasandra	2024-03-17 20:26:37.197542	2024-03-17 20:26:37.197542	0
14	user_12@example.com	$2a$12$NlYxm79gPnl2LqvwjhBWJ.WhBwTBrioBZ8vnuysP2FVp0XNZfd9Sy	\N	\N	\N	eloise_kassulke	2024-03-17 20:26:37.38346	2024-03-17 20:26:37.38346	0
15	user_13@example.com	$2a$12$M7z.cCfd1Eb0VFmZmzLN7OHnsa2x/YgtGQUkZHm9/HdPgzDmqR7jG	\N	\N	\N	noble	2024-03-17 20:26:37.57326	2024-03-17 20:26:37.57326	0
16	user_14@example.com	$2a$12$5RUU3dcZTm/EopT9sVEK3Oo7eCso3n0vIpocv4l19bzticZ.EZNP6	\N	\N	\N	leanne	2024-03-17 20:26:37.759515	2024-03-17 20:26:37.759515	0
17	user_15@example.com	$2a$12$uSWGtKUSZEzEStXYMp37POCkeOu2PcWuENXer6xHtcghBRqL6qMHi	\N	\N	\N	mariel.koss	2024-03-17 20:26:37.945949	2024-03-17 20:26:37.945949	0
18	user_16@example.com	$2a$12$ozVali/bWbkKF7cGiQLn..ugv7ToJKipOn/g8GNPdB2kWbaAnVMN6	\N	\N	\N	odell	2024-03-17 20:26:38.133782	2024-03-17 20:26:38.133782	0
19	user_17@example.com	$2a$12$AL7wTYlyMr9hB6frrUn9ZOlfLy7QWA85A7a5ZQYFpZHbPprjTB0I.	\N	\N	\N	drew_upton	2024-03-17 20:26:38.319773	2024-03-17 20:26:38.319773	0
20	user_18@example.com	$2a$12$fMkr37e5RE.av9R3iV701OMrqiQ9DNyQaBhZWm4g1.tWEetKe4MWO	\N	\N	\N	nu	2024-03-17 20:26:38.505344	2024-03-17 20:26:38.505344	0
21	user_19@example.com	$2a$12$YtoMO1GKIvoTKczdYYJMPu134xAIuv/9i81KaH02dcZEDTQqE3TA6	\N	\N	\N	belva	2024-03-17 20:26:38.691511	2024-03-17 20:26:38.691511	0
22	user_20@example.com	$2a$12$xYbdkrY3yx7wv5aF084SBuLJCN5JHzY1DJ4Qrh.L1ORAt8yiWZHoS	\N	\N	\N	sherlyn_lemke	2024-03-17 20:26:38.87589	2024-03-17 20:26:38.87589	0
23	user_21@example.com	$2a$12$iIOzqKht3jm4MXGICwLF0ueljZlkNqveHQOmr2YRNI/UaUWWiq8Vu	\N	\N	\N	alice	2024-03-17 20:26:39.061114	2024-03-17 20:26:39.061114	0
24	user_22@example.com	$2a$12$9oLl8f.UyB3S.Mo7IzUfaOCZfpkqHBe67TRwifYEGuJvbBquD1ZLy	\N	\N	\N	kathryne	2024-03-17 20:26:39.246886	2024-03-17 20:26:39.246886	0
25	user_23@example.com	$2a$12$.Plkl6e3lqdycv0GmY4qxeIw.i0Z9h5F.eCHU4uPRb.j8cdFyiq/S	\N	\N	\N	rey	2024-03-17 20:26:39.434377	2024-03-17 20:26:39.434377	0
26	user_24@example.com	$2a$12$4jRXcVO7cU98KXOCYRFeruHckz1UTwIy8UBKi90t7NsuuKGuzGnju	\N	\N	\N	ezra_connelly	2024-03-17 20:26:39.624842	2024-03-17 20:26:39.624842	0
27	user_25@example.com	$2a$12$pt6IykerErIsXSrlTYSI.OkL64LUA4jCT4mp8/1LNjkig.2Id4e8C	\N	\N	\N	terrell_considine	2024-03-17 20:26:39.805695	2024-03-17 20:26:39.805695	0
28	user_26@example.com	$2a$12$wdNIkMfVWkogGL2mKCZr4OKY2U/yxvQ0aLOhXvsW6T5Bfy.DYwYsu	\N	\N	\N	kristopher	2024-03-17 20:26:39.990798	2024-03-17 20:26:39.990798	0
29	user_27@example.com	$2a$12$6GUqERvSKy4ke7SR7LxRE.rEoR5ePAk9cIZ/yMWyzroX/xomsaJjS	\N	\N	\N	glendora_runolfsdottir	2024-03-17 20:26:40.176097	2024-03-17 20:26:40.176097	0
30	user_28@example.com	$2a$12$V2tRdMqjj4xsuuxcjNKpTOgUGPHI2fXdzfmU12YYsdtP5ZotzJBQq	\N	\N	\N	caryn	2024-03-17 20:26:40.361825	2024-03-17 20:26:40.361825	0
31	user_29@example.com	$2a$12$EmANVieX4KM2h/tPOxpJ0uMQLNA0EF/tFj4Hjvdds5Z260fp9x/EG	\N	\N	\N	armand	2024-03-17 20:26:40.54686	2024-03-17 20:26:40.54686	0
32	user_30@example.com	$2a$12$tU7za8H4MO8YbOmpFvATqeWjVfom4EYOKhSDFegJV3AE.10AzMH5S	\N	\N	\N	jude	2024-03-17 20:26:40.732855	2024-03-17 20:26:40.732855	0
33	user_31@example.com	$2a$12$wERj1SecjKBDhw2PRxwaNOgT6E6UaeSRp9UzJDncJ3nV9UZCGvf.G	\N	\N	\N	leanne.hermann	2024-03-17 20:26:40.918675	2024-03-17 20:26:40.918675	0
34	user_32@example.com	$2a$12$TDe5KuHsc.W.Ghes/JrAN.HQHaldyLtkJZ32OR9eb3gCBswczXwl2	\N	\N	\N	benito	2024-03-17 20:26:41.103801	2024-03-17 20:26:41.103801	0
35	user_33@example.com	$2a$12$ygYA.Vc/ykUy/U6NWl3Rv.p9tzoen5horTB99JSw8nZWR46vLYLvu	\N	\N	\N	tena.lebsack	2024-03-17 20:26:41.289334	2024-03-17 20:26:41.289334	0
36	user_34@example.com	$2a$12$0iR/KUOlmOlhjN9oJeeVFenpzjazugrmE255u4Om3HJqfyb991mDC	\N	\N	\N	colton	2024-03-17 20:26:41.47545	2024-03-17 20:26:41.47545	0
37	user_35@example.com	$2a$12$v4cSznSFSLk2cU/3Ik.rh.WLLwY33uGBslW0Jc1DkKysrIFnbFyTa	\N	\N	\N	gerardo	2024-03-17 20:26:41.669936	2024-03-17 20:26:41.669936	0
38	user_36@example.com	$2a$12$7BS9Mf4k4caMrwLYJo9UX.sc8Ma55EcqeRaY5ypTlUUXeiP6SkuQC	\N	\N	\N	billye	2024-03-17 20:26:41.849459	2024-03-17 20:26:41.849459	0
39	user_37@example.com	$2a$12$hPRkET/ByiETmfQmeQHo1uyH54r3/road6yJHW4b.lk5jXYrGIcLa	\N	\N	\N	shawnta.volkman	2024-03-17 20:26:42.035165	2024-03-17 20:26:42.035165	0
40	user_38@example.com	$2a$12$IDNa0d7snyn8A57Q91x7lOSvZ2l63J5rYVHu3tcOR5GKzMRIdw.6y	\N	\N	\N	elijah.satterfield	2024-03-17 20:26:42.221592	2024-03-17 20:26:42.221592	0
41	user_39@example.com	$2a$12$uyFZPnJNyzaboaAw0wc1du0K/k.xmysCs5w9i56ntD8yHbUJoIRzi	\N	\N	\N	ronda	2024-03-17 20:26:42.407818	2024-03-17 20:26:42.407818	0
42	user_40@example.com	$2a$12$bQTna4LK0o.TwsfaV20rquIr5FoSxuuWRQLwXWch1LGy0MHxbI0WS	\N	\N	\N	maire	2024-03-17 20:26:42.593592	2024-03-17 20:26:42.593592	0
43	user_41@example.com	$2a$12$NtJcQdqGggTesON1HDKDNeYM8lRoANB.BQKSz3CwGYH305VYVa7PO	\N	\N	\N	martin.zieme	2024-03-17 20:26:42.779652	2024-03-17 20:26:42.779652	0
44	user_42@example.com	$2a$12$IiOQ6.ds7uQvS.OS41D5JeVDSuinkd5Ta7NVVC/pR54.nCZcVCW/.	\N	\N	\N	ray.witting	2024-03-17 20:26:42.965903	2024-03-17 20:26:42.965903	0
45	user_43@example.com	$2a$12$6s4URgFX19yaa9dF8vuVrO9LO7sm41TNZLfCgZhqmrmvX3GTOKphi	\N	\N	\N	wilburn	2024-03-17 20:26:43.151194	2024-03-17 20:26:43.151194	0
46	user_44@example.com	$2a$12$wHogG.GzjHqF3cM7djjgluMU12VeWUUpG3Wum64um2.fE2bsDUKmC	\N	\N	\N	jarod	2024-03-17 20:26:43.335444	2024-03-17 20:26:43.335444	0
47	user_45@example.com	$2a$12$JNRJF3bWuXN3NOVptDxXRuFoMSom06SKAcpTuukLdXGt3mpt029ga	\N	\N	\N	saul_hills	2024-03-17 20:26:43.528969	2024-03-17 20:26:43.528969	0
48	user_46@example.com	$2a$12$6rG3hY3xvnQR8iP6VltGiOqvs1hdV3HT1Qhdk7BXTvvHEigfAtKw2	\N	\N	\N	jessie	2024-03-17 20:26:43.720314	2024-03-17 20:26:43.720314	0
49	user_47@example.com	$2a$12$T9Ek3cQ9AfSt6Zvne10ZhOQ59SEYUtF.WYPYZawpKr3fRs9JO9Zne	\N	\N	\N	freeman_emard	2024-03-17 20:26:43.906682	2024-03-17 20:26:43.906682	0
50	user_48@example.com	$2a$12$khdUMefKEVAQw0GkDgOywOqVpb3L8JXApGrW7uCijj.3I01I6uBc2	\N	\N	\N	farrah	2024-03-17 20:26:44.093073	2024-03-17 20:26:44.093073	0
51	user_49@example.com	$2a$12$O9ZdCL1/Dj0rSPGbSzMQN.nc34nG5whrD68oURXUC.TWAsdlHDlmO	\N	\N	\N	melania.russel	2024-03-17 20:26:44.278552	2024-03-17 20:26:44.278552	0
\.


--
-- Data for Name: video_categories; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.video_categories (id, video_id, category_id, created_at, updated_at) FROM stdin;
2	9	7	2024-03-18 21:43:00.13096	2024-03-18 21:43:00.13096
3	8	3	2024-03-18 21:44:03.337127	2024-03-18 21:44:03.337127
4	8	9	2024-03-18 21:44:26.92175	2024-03-18 21:44:26.92175
5	7	3	2024-03-18 21:49:40.016106	2024-03-18 21:49:40.016106
6	7	9	2024-03-18 21:49:51.40918	2024-03-18 21:49:51.40918
7	6	7	2024-03-18 21:52:25.417928	2024-03-18 21:52:25.417928
8	6	8	2024-03-18 21:52:30.7926	2024-03-18 21:52:30.7926
9	5	7	2024-03-18 21:54:04.282154	2024-03-18 21:54:04.282154
10	5	8	2024-03-18 21:54:11.60128	2024-03-18 21:54:11.60128
11	4	11	2024-03-18 21:55:16.665992	2024-03-18 21:55:16.665992
12	3	5	2024-03-18 21:56:12.94876	2024-03-18 21:56:12.94876
13	3	3	2024-03-18 21:56:18.847738	2024-03-18 21:56:18.847738
14	2	3	2024-03-18 21:57:23.43742	2024-03-18 21:57:23.43742
15	2	8	2024-03-18 21:57:31.566041	2024-03-18 21:57:31.566041
\.


--
-- Data for Name: video_languages; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.video_languages (id, video_id, language_id, created_at, updated_at) FROM stdin;
2	9	1	2024-03-18 21:42:42.94232	2024-03-18 21:42:42.94232
3	8	1	2024-03-18 21:43:30.050203	2024-03-18 21:43:30.050203
4	8	2	2024-03-18 21:43:34.683174	2024-03-18 21:43:34.683174
5	7	1	2024-03-18 21:45:32.315897	2024-03-18 21:45:32.315897
7	6	1	2024-03-18 21:51:47.339109	2024-03-18 21:51:47.339109
8	5	1	2024-03-18 21:53:40.057157	2024-03-18 21:53:40.057157
9	4	1	2024-03-18 21:54:32.616966	2024-03-18 21:54:32.616966
10	3	1	2024-03-18 21:55:51.494378	2024-03-18 21:55:51.494378
11	2	1	2024-03-18 21:56:51.275717	2024-03-18 21:56:51.275717
\.


--
-- Data for Name: video_speakers; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.video_speakers (id, video_id, speaker_id, created_at, updated_at) FROM stdin;
2	9	11	2024-03-18 21:43:10.077753	2024-03-18 21:43:10.077753
3	8	3	2024-03-18 21:43:51.390816	2024-03-18 21:43:51.390816
4	7	6	2024-03-18 21:46:02.990934	2024-03-18 21:46:02.990934
5	6	3	2024-03-18 21:52:02.303204	2024-03-18 21:52:02.303204
6	5	4	2024-03-18 21:53:54.808431	2024-03-18 21:53:54.808431
7	4	5	2024-03-18 21:54:44.995452	2024-03-18 21:54:44.995452
8	4	8	2024-03-18 21:54:49.296857	2024-03-18 21:54:49.296857
9	4	1	2024-03-18 21:54:58.246093	2024-03-18 21:54:58.246093
10	3	9	2024-03-18 21:55:58.531316	2024-03-18 21:55:58.531316
11	2	3	2024-03-18 21:57:17.264004	2024-03-18 21:57:17.264004
\.


--
-- Data for Name: video_tags; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.video_tags (id, video_id, tag_id, created_at, updated_at) FROM stdin;
1	9	5	2024-03-18 21:42:50.295096	2024-03-18 21:42:50.295096
2	8	3	2024-03-18 21:43:39.953663	2024-03-18 21:43:39.953663
3	7	3	2024-03-18 21:45:49.578621	2024-03-18 21:45:49.578621
4	6	7	2024-03-18 21:51:52.485579	2024-03-18 21:51:52.485579
5	5	2	2024-03-18 21:53:46.058039	2024-03-18 21:53:46.058039
6	4	8	2024-03-18 21:54:38.205338	2024-03-18 21:54:38.205338
7	3	3	2024-03-18 21:55:47.856585	2024-03-18 21:55:47.856585
8	2	3	2024-03-18 21:56:56.937992	2024-03-18 21:56:56.937992
\.


--
-- Data for Name: videos; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.videos (id, video_name, video_description, video_url, picture_url, created_at, updated_at, key, low_res_key, rating) FROM stdin;
2	FastAPI с нуля за 10 минут! Взаимодействие с SQLAlchemy, Pydantic, Alembic	FastAPI — штука хоть и не новая, но все же достаточно молодая. Живой интерес к ней начал расти буквально в последние пару лет. Если заглянуть на Github, то увидим, что количество звезд у этого backend-фреймворка составляет примерно половину (и даже больше) от количества звезд у Flask и Django (а это, на минуточку, гиганты рынка, без их упоминания не обходится ни один туториал и ни одна вакансия в Data Science).\r\n\r\nНесмотря на это, широкого обсуждения FastAPI в сети либо на профильных конференциях не наблюдается, равно как и частого использования в IT-продуктах. Соответственно, не так уж много разработчиков понимают, что это и зачем оно им надо.\r\n \r\nМы решили восполнить этот пробел! В новом видео Python-разработчик Innowise Павел Мартысюк: \r\n- рассказывает в общих чертах про фреймворк\r\n- выделяет плюсы и минусы,  показывает возможности\r\n- подробно останавливается на взаимодействии с библиотеками SQLAlchemy, Pydantic, Alembic	FastAPI_с_нуля_за_10_минут__Взаимодействие_с_SQLAlchemy__Pydantic__Alembic.mp4	Screenshot_from_2024-02-05_10-59-52.png	2024-03-18 21:29:22.525711	2024-03-18 21:29:22.525711	\N	\N	\N
3	HintedSpinner - библиотека, дающая возможность добавлять Hint в Android	Кто работает с Android, тот знает: есть проблемка. И не одна, но мы сейчас именно про Spinner с хинтом. Большинство разработчиков "спотыкались" на этом уже давно, а нативного решения от команды Android SDK все не было.\r\n\r\n"Никуда не годится", решили мы - и вуаля! Встречай лёгкую, простую, кастомизируемую библиотеку с крутым экзамплом. Больше ничего не скажем: скачивай, пробуй, изучай возможности. Будет круто, если оставишь фидбэк в комментариях! 🔥	HintedSpinner_-_библиотека__дающая_возможность_добавлять_Hint_в_Android.mp4	Screenshot_from_2024-02-05_10-56-08.png	2024-03-18 21:29:50.668846	2024-03-18 21:29:50.668846	\N	\N	\N
5	QA-инженер – о задачах, проектах, и том, как получить работу мечты [НЕРАЗРАБОТЧИ (1)	\r\n640 просмотров  29 нояб. 2022 г.\r\nQA-инженер: кто такой, как им стать и почему в IT без него было бы очень грустно\r\nНовая рубрика: говорим о профессиях, которые позволят тебе работать в IT-сфере, не будучи разработчиком. Начинаем с Quality Assurance или, если проще, с тестирования.\r\nНа первый взгляд это проще, чем непосредственно разработка ПО, но и тут есть свои нюансы и сложности. Как раз о них (и не только) пойдет речь в этом видео. \r\n\r\nQA-инженер Лиза Васильева рассказывает:\r\n· в чем состоит работа отдела тестирования\r\n· чем отличается Manual QA от AQA\r\n· какие не самые приятные личные качества могут оказаться суперполезными в работе QA\r\n· что освоить и какие скиллы подтянуть, чтобы войти в профессию (от навыков коммуникации до знания http, json и xml протоколов, например)	QA-инженер___о_задачах__проектах__и_том__как_получить_работу_мечты__НЕРАЗРАБОТЧИ__1_.mp4	Screenshot_from_2024-02-05_10-55-22.png	2024-03-18 21:31:08.2897	2024-03-18 21:31:08.2897	\N	\N	\N
4	INNOSPORT #1 __ Земля, вода, огонь и воздух	\r\n913 просмотров  12 авг. 2021 г.\r\nДрузья, всем привет! \r\n\r\nНам очень хочется, чтобы серия видео про спорт стала нашей постоянной рубрикой. Мы сделали первое видео и показали, как будет выглядеть формат. \r\nЕсли у тебя есть идеи, интересные мысли или ты недавно сделал что-то крутое: покажи всем остальным. Давай вместе выберем локацию, напишем сценарий и сделаем классный контент!	INNOSPORT__1____Земля__вода__огонь_и_воздух.mp4	Screenshot_from_2024-02-05_10-57-09.png	2024-03-18 21:30:20.27448	2024-03-18 21:31:37.653674	\N	\N	\N
7	Разработка уведомлений в iOS __ iOS Notifications Tutorial	\r\n754 просмотра  30 авг. 2022 г.  Innowise IT Academy\r\nПри разработке приложений нередко возникает необходимость предусмотреть отправку уведомлений - например, чтобы сообщить пользователю о новом концерте, о добавлении его в друзья, повышении курса валют и других событиях. \r\n\r\nВлад Евневич, Middle iOS-разработчик в Innowise, детально расскажет о Local Notifications, Push Notifications, а также о механизме Rich Notifications в iOS. \r\n\r\nКод демо-приложения доступен для изучения: \r\nhttps://gitlab.com/innowise-group-mee...	Разработка_уведомлений_в_iOS____iOS_Notifications_Tutorial.mp4	Screenshot_from_2024-02-05_10-56-16.png	2024-03-18 21:39:23.953368	2024-03-18 21:39:23.953368	\N	\N	\N
6	Копирайтеры. ИИ нас заменит! [НЕРАЗРАБОТЧИК В IT]	\r\n443 просмотра  14 июн. 2023 г.\r\nВстречайте Лену и Пашу — двух талантливых копирайтеров, работающих в нашей компании. Они решили поделиться своим опытом и рассказать о том, в чем состоит их работа, какие задачи они решают ежедневно и какие трудности они преодолевают.\r\n\r\nВ этом видео Лена и Паша проливают свет на мир копирайтинга в айти-сфере. Они рассказывают о том, какими навыками нужно обладать для успешной работы в этой области, и даже дают советы, где можно приобрести необходимые знания и умения.\r\n\r\nНо это не все! В ролике Лена и Паша также обсуждают какие возможности и вызовы ждут специалистов в этой области, рассказывают какой карьерный путь они прошли за свою жизнь, а также делятся тем, как они учатся сейчас.\r\n\r\nНе упустите шанс заглянуть внутрь работы копирайтеров в IT-компании и получить уникальный взгляд на эту увлекательную профессию. Подписывайтесь на наш канал, чтобы не пропустить новые выпуски!	Копирайтеры._ИИ_нас_заменит___НЕРАЗРАБОТЧИК_В_IT_.mp4	Screenshot_from_2024-02-05_11-06-23.png	2024-03-18 21:38:14.653791	2024-03-18 21:39:48.048717	\N	\N	\N
8	Секреты OAuth 2.0 и OIDC_ Применение в приложениях	В этом видео мы глубоко погружаемся в мир авторизации и аутентификации, рассматривая ключевые аспекты OAUTH 2.0 и OIDC (OpenID Connect). Если вы занимаетесь разработкой приложений или интересуетесь безопасностью в IT, это видео для вас.\r\n\r\nО чем мы узнаем в этом видео:\r\n\r\nОсновы OAUTH 2.0 и OIDC: Мы рассмотрим базовые принципы и функциональность каждого протокола, а также поговорим о том, как они взаимодействуют между собой.\r\n\r\nOIDC vs OAUTH 2.0: Мы проанализируем ключевые различия между OpenID Connect и протоколом авторизации OAUTH 2.0. Это позволит вам лучше понять, когда и как использовать каждый из них.\r\n\r\nПрименение в приложениях: Мы рассмотрим примеры реального применения OAUTH 2.0 и OIDC в приложениях, сфокусировавшись на использовании в рамках языка программирования Java.\r\n\r\nБезопасность: Обсудим вопросы безопасности, связанные с авторизацией и аутентификацией, и как OAUTH 2.0 и OIDC помогают защищать ваши приложения.	Секреты_OAuth_2.0_и_OIDC__Применение_в_приложениях.mp4	Screenshot_from_2024-02-05_10-54-41.png	2024-03-18 21:40:51.048233	2024-03-18 21:40:51.048233	\N	\N	\N
9	Системный администратор [НЕРАЗРАБОТЧИК В IT]	\r\n8 206 просмотров  1 мар. 2023 г.\r\nВсе хоть раз в жизни сталкивались с сисадминами, все знают хотя бы пару шуток и уж точно гору стереотипов о них, но понимаете ли вы, в чем состоит его работа? В новом видео Матфей Байков, system administrator варшавского офиса Innowise, рассказывает:\r\n- чем он занимается каждый день и какие проблемы приходится решать\r\n- какие навыки нужны для такой работы и где их получить\r\n- какие карьерные перспективы у системного администратора, если однажды ему надоест отвечать на глупые вопросы юзеров :)\r\n	Системный_администратор__НЕРАЗРАБОТЧИК_В_IT_.mp4	Screenshot_from_2024-02-05_10-55-11.png	2024-03-18 21:41:32.843118	2024-03-18 21:41:32.843118	\N	\N	\N
\.


--
-- Data for Name: watched_videos; Type: TABLE DATA; Schema: public; Owner: dasha
--

COPY public.watched_videos (id, user_id, video_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.categories_id_seq', 13, true);


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.favorites_id_seq', 20, true);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.languages_id_seq', 3, true);


--
-- Name: marks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.marks_id_seq', 1, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, true);


--
-- Name: speakers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.speakers_id_seq', 11, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.tags_id_seq', 9, true);


--
-- Name: user_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.user_activities_id_seq', 65, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.users_id_seq', 51, true);


--
-- Name: video_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.video_categories_id_seq', 15, true);


--
-- Name: video_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.video_languages_id_seq', 11, true);


--
-- Name: video_speakers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.video_speakers_id_seq', 11, true);


--
-- Name: video_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.video_tags_id_seq', 8, true);


--
-- Name: videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.videos_id_seq', 9, true);


--
-- Name: watched_videos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.watched_videos_id_seq', 2, true);


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
-- Name: user_activities user_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.user_activities
    ADD CONSTRAINT user_activities_pkey PRIMARY KEY (id);


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
-- Name: watched_videos watched_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.watched_videos
    ADD CONSTRAINT watched_videos_pkey PRIMARY KEY (id);


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
-- Name: index_marks_on_user_id_and_video_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE UNIQUE INDEX index_marks_on_user_id_and_video_id ON public.marks USING btree (user_id, video_id);


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
-- Name: index_user_activities_on_user_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_user_activities_on_user_id ON public.user_activities USING btree (user_id);


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
-- Name: index_watched_videos_on_user_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_watched_videos_on_user_id ON public.watched_videos USING btree (user_id);


--
-- Name: index_watched_videos_on_video_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_watched_videos_on_video_id ON public.watched_videos USING btree (video_id);


--
-- Name: marks marks_after_delete_row_tr; Type: TRIGGER; Schema: public; Owner: dasha
--

CREATE TRIGGER marks_after_delete_row_tr AFTER DELETE ON public.marks FOR EACH ROW EXECUTE FUNCTION public.marks_after_delete_row_tr();


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
-- Name: user_activities fk_rails_56e545161c; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.user_activities
    ADD CONSTRAINT fk_rails_56e545161c FOREIGN KEY (user_id) REFERENCES public.users(id);


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
-- Name: watched_videos fk_rails_815a68421f; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.watched_videos
    ADD CONSTRAINT fk_rails_815a68421f FOREIGN KEY (video_id) REFERENCES public.videos(id);


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
-- Name: watched_videos fk_rails_fb3f6236fd; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.watched_videos
    ADD CONSTRAINT fk_rails_fb3f6236fd FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: video_tags fk_rails_fcdb957abf; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.video_tags
    ADD CONSTRAINT fk_rails_fcdb957abf FOREIGN KEY (video_id) REFERENCES public.videos(id);


--
-- PostgreSQL database dump complete
--

