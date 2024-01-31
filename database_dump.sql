--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)


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
-- Name: countries; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.countries (
    id bigint NOT NULL,
    country_name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.countries OWNER TO dasha;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO dasha;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: directors; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.directors (
    id bigint NOT NULL,
    director_fio character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.directors OWNER TO dasha;

--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.directors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_id_seq OWNER TO dasha;

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.directors_id_seq OWNED BY public.directors.id;


--
-- Name: film_countries; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.film_countries (
    id bigint NOT NULL,
    film_id bigint NOT NULL,
    country_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.film_countries OWNER TO dasha;

--
-- Name: film_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.film_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_countries_id_seq OWNER TO dasha;

--
-- Name: film_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.film_countries_id_seq OWNED BY public.film_countries.id;


--
-- Name: film_directors; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.film_directors (
    id bigint NOT NULL,
    film_id bigint NOT NULL,
    director_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.film_directors OWNER TO dasha;

--
-- Name: film_directors_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.film_directors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_directors_id_seq OWNER TO dasha;

--
-- Name: film_directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.film_directors_id_seq OWNED BY public.film_directors.id;


--
-- Name: film_genres; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.film_genres (
    id bigint NOT NULL,
    film_id bigint NOT NULL,
    genre_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.film_genres OWNER TO dasha;

--
-- Name: film_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.film_genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_genres_id_seq OWNER TO dasha;

--
-- Name: film_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.film_genres_id_seq OWNED BY public.film_genres.id;


--
-- Name: film_screenwriters; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.film_screenwriters (
    id bigint NOT NULL,
    film_id bigint NOT NULL,
    screenwriter_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.film_screenwriters OWNER TO dasha;

--
-- Name: film_screenwriters_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.film_screenwriters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_screenwriters_id_seq OWNER TO dasha;

--
-- Name: film_screenwriters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.film_screenwriters_id_seq OWNED BY public.film_screenwriters.id;


--
-- Name: film_speakers; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.film_speakers (
    id bigint NOT NULL,
    film_id bigint NOT NULL,
    speaker_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.film_speakers OWNER TO dasha;

--
-- Name: film_speakers_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.film_speakers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.film_speakers_id_seq OWNER TO dasha;

--
-- Name: film_speakers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.film_speakers_id_seq OWNED BY public.film_speakers.id;


--
-- Name: films; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.films (
    id bigint NOT NULL,
    film_name character varying NOT NULL,
    film_description text NOT NULL,
    release_date date NOT NULL,
    film_url character varying NOT NULL,
    picture_url character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.films OWNER TO dasha;

--
-- Name: films_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.films_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.films_id_seq OWNER TO dasha;

--
-- Name: films_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.films_id_seq OWNED BY public.films.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.genres (
    id bigint NOT NULL,
    genre_name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.genres OWNER TO dasha;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO dasha;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.reviews (
    id bigint NOT NULL,
    text text,
    user_id bigint NOT NULL,
    film_id bigint NOT NULL,
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
-- Name: screenwriters; Type: TABLE; Schema: public; Owner: dasha
--

CREATE TABLE public.screenwriters (
    id bigint NOT NULL,
    screenwriter_fio character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.screenwriters OWNER TO dasha;

--
-- Name: screenwriters_id_seq; Type: SEQUENCE; Schema: public; Owner: dasha
--

CREATE SEQUENCE public.screenwriters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.screenwriters_id_seq OWNER TO dasha;

--
-- Name: screenwriters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dasha
--

ALTER SEQUENCE public.screenwriters_id_seq OWNED BY public.screenwriters.id;


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
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- Name: film_countries id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_countries ALTER COLUMN id SET DEFAULT nextval('public.film_countries_id_seq'::regclass);


--
-- Name: film_directors id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_directors ALTER COLUMN id SET DEFAULT nextval('public.film_directors_id_seq'::regclass);


--
-- Name: film_genres id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_genres ALTER COLUMN id SET DEFAULT nextval('public.film_genres_id_seq'::regclass);


--
-- Name: film_screenwriters id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_screenwriters ALTER COLUMN id SET DEFAULT nextval('public.film_screenwriters_id_seq'::regclass);


--
-- Name: film_speakers id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_speakers ALTER COLUMN id SET DEFAULT nextval('public.film_speakers_id_seq'::regclass);


--
-- Name: films id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.films ALTER COLUMN id SET DEFAULT nextval('public.films_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: screenwriters id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.screenwriters ALTER COLUMN id SET DEFAULT nextval('public.screenwriters_id_seq'::regclass);


--
-- Name: speakers id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.speakers ALTER COLUMN id SET DEFAULT nextval('public.speakers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);



SELECT pg_catalog.setval('public.countries_id_seq', 247, true);


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.directors_id_seq', 3, true);


--
-- Name: film_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.film_countries_id_seq', 1, false);


--
-- Name: film_directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.film_directors_id_seq', 1, false);


--
-- Name: film_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.film_genres_id_seq', 1, false);


--
-- Name: film_screenwriters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.film_screenwriters_id_seq', 1, false);


--
-- Name: film_speakers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.film_speakers_id_seq', 1, false);


--
-- Name: films_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.films_id_seq', 9, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.genres_id_seq', 8, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.reviews_id_seq', 13, true);


--
-- Name: screenwriters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.screenwriters_id_seq', 3, true);


--
-- Name: speakers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.speakers_id_seq', 10, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dasha
--

SELECT pg_catalog.setval('public.users_id_seq', 51, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: film_countries film_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_countries
    ADD CONSTRAINT film_countries_pkey PRIMARY KEY (id);


--
-- Name: film_directors film_directors_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_directors
    ADD CONSTRAINT film_directors_pkey PRIMARY KEY (id);


--
-- Name: film_genres film_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_genres
    ADD CONSTRAINT film_genres_pkey PRIMARY KEY (id);


--
-- Name: film_screenwriters film_screenwriters_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_screenwriters
    ADD CONSTRAINT film_screenwriters_pkey PRIMARY KEY (id);


--
-- Name: film_speakers film_speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_speakers
    ADD CONSTRAINT film_speakers_pkey PRIMARY KEY (id);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


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
-- Name: screenwriters screenwriters_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.screenwriters
    ADD CONSTRAINT screenwriters_pkey PRIMARY KEY (id);


--
-- Name: speakers speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.speakers
    ADD CONSTRAINT speakers_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_film_countries_on_country_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_film_countries_on_country_id ON public.film_countries USING btree (country_id);


--
-- Name: index_film_countries_on_film_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_film_countries_on_film_id ON public.film_countries USING btree (film_id);


--
-- Name: index_film_directors_on_director_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_film_directors_on_director_id ON public.film_directors USING btree (director_id);


--
-- Name: index_film_directors_on_film_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_film_directors_on_film_id ON public.film_directors USING btree (film_id);


--
-- Name: index_film_genres_on_film_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_film_genres_on_film_id ON public.film_genres USING btree (film_id);


--
-- Name: index_film_genres_on_genre_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_film_genres_on_genre_id ON public.film_genres USING btree (genre_id);


--
-- Name: index_film_screenwriters_on_film_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_film_screenwriters_on_film_id ON public.film_screenwriters USING btree (film_id);


--
-- Name: index_film_screenwriters_on_screenwriter_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_film_screenwriters_on_screenwriter_id ON public.film_screenwriters USING btree (screenwriter_id);


--
-- Name: index_film_speakers_on_film_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_film_speakers_on_film_id ON public.film_speakers USING btree (film_id);


--
-- Name: index_film_speakers_on_speaker_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_film_speakers_on_speaker_id ON public.film_speakers USING btree (speaker_id);


--
-- Name: index_reviews_on_film_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_reviews_on_film_id ON public.reviews USING btree (film_id);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: dasha
--

CREATE INDEX index_reviews_on_user_id ON public.reviews USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: dasha
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: dasha
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: film_genres fk_rails_18d0ace0ad; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_genres
    ADD CONSTRAINT fk_rails_18d0ace0ad FOREIGN KEY (film_id) REFERENCES public.films(id);


--
-- Name: film_screenwriters fk_rails_223c4e963f; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_screenwriters
    ADD CONSTRAINT fk_rails_223c4e963f FOREIGN KEY (screenwriter_id) REFERENCES public.screenwriters(id);


--
-- Name: film_screenwriters fk_rails_347f42976c; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_screenwriters
    ADD CONSTRAINT fk_rails_347f42976c FOREIGN KEY (film_id) REFERENCES public.films(id);


--
-- Name: film_countries fk_rails_4858bf1513; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_countries
    ADD CONSTRAINT fk_rails_4858bf1513 FOREIGN KEY (film_id) REFERENCES public.films(id);


--
-- Name: reviews fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: film_countries fk_rails_7fe7c04da2; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_countries
    ADD CONSTRAINT fk_rails_7fe7c04da2 FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: film_speakers fk_rails_a08bd1ff33; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_speakers
    ADD CONSTRAINT fk_rails_a08bd1ff33 FOREIGN KEY (speaker_id) REFERENCES public.speakers(id);


--
-- Name: film_directors fk_rails_b4b5fcbb1f; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_directors
    ADD CONSTRAINT fk_rails_b4b5fcbb1f FOREIGN KEY (film_id) REFERENCES public.films(id);


--
-- Name: film_directors fk_rails_b84caf3b43; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_directors
    ADD CONSTRAINT fk_rails_b84caf3b43 FOREIGN KEY (director_id) REFERENCES public.directors(id);


--
-- Name: film_speakers fk_rails_d3b5b8c23b; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_speakers
    ADD CONSTRAINT fk_rails_d3b5b8c23b FOREIGN KEY (film_id) REFERENCES public.films(id);


--
-- Name: film_genres fk_rails_e7bab1bb99; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.film_genres
    ADD CONSTRAINT fk_rails_e7bab1bb99 FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- Name: reviews fk_rails_f0b9babe94; Type: FK CONSTRAINT; Schema: public; Owner: dasha
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_f0b9babe94 FOREIGN KEY (film_id) REFERENCES public.films(id);


--
-- PostgreSQL database dump complete
--

