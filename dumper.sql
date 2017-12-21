--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE api_keys (
    id bigint NOT NULL,
    key character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE api_keys OWNER TO CURRENT_USER;

--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: CURRENT_USER
--

CREATE SEQUENCE api_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE api_keys_id_seq OWNER TO CURRENT_USER;

--
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CURRENT_USER
--

ALTER SEQUENCE api_keys_id_seq OWNED BY api_keys.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO CURRENT_USER;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE categories (
    id bigint NOT NULL,
    title character varying,
    slug character varying
);


ALTER TABLE categories OWNER TO CURRENT_USER;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: CURRENT_USER
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO CURRENT_USER;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CURRENT_USER
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: chatrooms; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE chatrooms (
    id bigint NOT NULL,
    topic character varying,
    slug character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE chatrooms OWNER TO CURRENT_USER;

--
-- Name: chatrooms_id_seq; Type: SEQUENCE; Schema: public; Owner: CURRENT_USER
--

CREATE SEQUENCE chatrooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chatrooms_id_seq OWNER TO CURRENT_USER;

--
-- Name: chatrooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CURRENT_USER
--

ALTER SEQUENCE chatrooms_id_seq OWNED BY chatrooms.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE items (
    id bigint NOT NULL,
    title character varying,
    description character varying,
    price double precision,
    image character varying,
    category_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    condition integer DEFAULT 0,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    store_id bigint
);


ALTER TABLE items OWNER TO CURRENT_USER;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: CURRENT_USER
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE items_id_seq OWNER TO CURRENT_USER;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CURRENT_USER
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE messages (
    id bigint NOT NULL,
    content character varying,
    user_id bigint,
    chatroom_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE messages OWNER TO CURRENT_USER;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: CURRENT_USER
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messages_id_seq OWNER TO CURRENT_USER;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CURRENT_USER
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE order_items (
    id bigint NOT NULL,
    item_id bigint,
    order_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    quantity integer,
    price numeric
);


ALTER TABLE order_items OWNER TO CURRENT_USER;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: CURRENT_USER
--

CREATE SEQUENCE order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_items_id_seq OWNER TO CURRENT_USER;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CURRENT_USER
--

ALTER SEQUENCE order_items_id_seq OWNED BY order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE orders (
    id bigint NOT NULL,
    status integer,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone
);


ALTER TABLE orders OWNER TO CURRENT_USER;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: CURRENT_USER
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO CURRENT_USER;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CURRENT_USER
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE roles (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE roles OWNER TO CURRENT_USER;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: CURRENT_USER
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_id_seq OWNER TO CURRENT_USER;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CURRENT_USER
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO CURRENT_USER;

--
-- Name: stores; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE stores (
    id bigint NOT NULL,
    name character varying,
    status integer DEFAULT 0,
    slug character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE stores OWNER TO CURRENT_USER;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: CURRENT_USER
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stores_id_seq OWNER TO CURRENT_USER;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CURRENT_USER
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: user_role_stores; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE user_role_stores (
    id bigint NOT NULL,
    user_id bigint,
    role_id bigint,
    store_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE user_role_stores OWNER TO CURRENT_USER;

--
-- Name: user_role_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: CURRENT_USER
--

CREATE SEQUENCE user_role_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_role_stores_id_seq OWNER TO CURRENT_USER;

--
-- Name: user_role_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CURRENT_USER
--

ALTER SEQUENCE user_role_stores_id_seq OWNED BY user_role_stores.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: CURRENT_USER
--

CREATE TABLE users (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    password_digest character varying,
    address character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role integer DEFAULT 0,
    screen_name character varying,
    uid character varying,
    oauth_token character varying,
    oauth_token_secret character varying,
    customer_id character varying
);


ALTER TABLE users OWNER TO CURRENT_USER;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: CURRENT_USER
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO CURRENT_USER;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: CURRENT_USER
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: api_keys id; Type: DEFAULT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY api_keys ALTER COLUMN id SET DEFAULT nextval('api_keys_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: chatrooms id; Type: DEFAULT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY chatrooms ALTER COLUMN id SET DEFAULT nextval('chatrooms_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY order_items ALTER COLUMN id SET DEFAULT nextval('order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Name: user_role_stores id; Type: DEFAULT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY user_role_stores ALTER COLUMN id SET DEFAULT nextval('user_role_stores_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY api_keys (id, key, user_id, created_at, updated_at) FROM stdin;
1	5e46187dc82c38e6187cadfb6b1b8703598f74923501dd3e05b279c804e65c61046f2f2dbaaf84636d7413c8fceb9c116d047943bb65b59f8791cdee8a887c88	70	2017-12-21 18:54:59.89328	2017-12-21 18:54:59.89328
2	b839855979425500f9cff057057bf5a789e7476b640a396d46e7e4fd8902903b9fc9e7c7ed6a296112e509c4893158b26fb967efc42f70c3727fc5afbfbd1389	71	2017-12-21 18:55:00.500092	2017-12-21 18:55:00.500092
3	ac7ce348bf0dec19019d00e6a66dac86df7ab51aed6f9ec92ddb0bb196c9d220aba24221f37ddd6bedb62bda0f6570284ff45a004db78fa0a64875975be161ce	72	2017-12-21 18:55:00.525627	2017-12-21 18:55:00.525627
\.


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CURRENT_USER
--

SELECT pg_catalog.setval('api_keys_id_seq', 3, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-12-10 22:18:28.560794	2017-12-10 22:18:28.560794
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY categories (id, title, slug) FROM stdin;
1	Suspense	suspense
2	Thriller	thriller
3	Western	western
4	Crime	crime
5	Horror	horror
6	Fantasy	fantasy
7	Mystery	mystery
8	Science Fiction	science-fiction
9	Palladium	palladium
10	Gold	gold
11	Calcium	calcium
12	Krypton	krypton
13	Lanthanum	lanthanum
14	Silver	silver
15	Iridium	iridium
16	Tennessine	tennessine
17	Bohrium	bohrium
18	Technetium	technetium
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CURRENT_USER
--

SELECT pg_catalog.setval('categories_id_seq', 18, true);


--
-- Data for Name: chatrooms; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY chatrooms (id, topic, slug, created_at, updated_at) FROM stdin;
1	Customer Support	customer-support	2017-12-21 18:54:59.644432	2017-12-21 18:54:59.644432
\.


--
-- Name: chatrooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CURRENT_USER
--

SELECT pg_catalog.setval('chatrooms_id_seq', 1, true);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY items (id, title, description, price, image, category_id, created_at, updated_at, condition, image_file_name, image_content_type, image_file_size, image_updated_at, store_id) FROM stdin;
3	Behold the Man	Health freegan meditation celiac photo booth ramps tote bag 3 wolf moon.	59.990000000000002	\N	2	2017-12-10 22:18:35.468646	2017-12-21 18:54:42.619544	0	book_cover.png	image/png	21149	2017-12-10 22:18:35.268558	1
4	A Farewell to Arms	Listicle seitan green juice marfa.	59.990000000000002	\N	3	2017-12-10 22:18:35.690451	2017-12-21 18:54:42.626365	0	book_cover.png	image/png	21149	2017-12-10 22:18:35.476544	1
5	The Last Enemy	Put a bird on it loko plaid disrupt.	49.990000000000002	\N	3	2017-12-10 22:18:35.913428	2017-12-21 18:54:42.633857	0	book_cover.png	image/png	21149	2017-12-10 22:18:35.702577	1
6	Pale Kings and Princes	Scenester squid wes anderson offal banjo kitsch meditation aesthetic.	49.990000000000002	\N	4	2017-12-10 22:18:36.122864	2017-12-21 18:54:42.64057	0	book_cover.png	image/png	21149	2017-12-10 22:18:35.920488	1
7	A Swiftly Tilting Planet	Drinking polaroid occupy deep v.	49.990000000000002	\N	5	2017-12-10 22:18:36.374259	2017-12-21 18:54:42.646604	0	book_cover.png	image/png	21149	2017-12-10 22:18:36.134777	1
8	The Line of Beauty	Selvage fanny pack direct trade listicle portland loko cold-pressed whatever godard.	29.9899999999999984	\N	6	2017-12-10 22:18:36.574253	2017-12-21 18:54:42.653935	0	book_cover.png	image/png	21149	2017-12-10 22:18:36.382506	1
9	His Dark Materials	Kogi wes anderson five dollar toast park vinyl blog church-key selvage.	29.9899999999999984	\N	7	2017-12-10 22:18:36.783706	2017-12-21 18:54:42.659452	1	book_cover.png	image/png	21149	2017-12-10 22:18:36.58259	1
10	Gone with the Wind	Blue bottle brooklyn synth whatever cronut.	29.9899999999999984	\N	8	2017-12-10 22:18:36.989437	2017-12-21 18:54:42.665211	1	book_cover.png	image/png	21149	2017-12-10 22:18:36.790299	1
11	Stranger in a Strange Land	Master portland chartreuse pug meditation pitchfork photo booth truffaut.	69.9899999999999949	\N	8	2017-12-10 22:18:37.195751	2017-12-21 18:54:42.670567	1	book_cover.png	image/png	21149	2017-12-10 22:18:36.997752	1
12	The Curious Incident of the Dog in the Night-Time 0	Skateboard tilde lumbersexual sriracha cliche ugh.	63.1300000000000026	\N	3	2017-12-10 22:18:37.409038	2017-12-21 18:54:42.679737	0	book_cover.png	image/png	21149	2017-12-10 22:18:37.209036	1
13	The Last Temptation 1	Polaroid letterpress phlogiston paleo.	27.6999999999999993	\N	4	2017-12-10 22:18:37.610676	2017-12-21 18:54:42.688474	0	book_cover.png	image/png	21149	2017-12-10 22:18:37.41931	1
14	Specimen Days 2	Jean shorts meggings deep v ugh kitsch polaroid.	57.6000000000000014	\N	1	2017-12-10 22:18:37.823998	2017-12-21 18:54:42.696377	0	book_cover.png	image/png	21149	2017-12-10 22:18:37.618697	1
15	Dance Dance Dance 3	Swag taxidermy raw denim cleanse.	9.25999999999999979	\N	3	2017-12-10 22:18:38.053838	2017-12-21 18:54:42.703796	0	book_cover.png	image/png	21149	2017-12-10 22:18:37.834434	1
16	The Glory and the Dream 4	Aesthetic actually phlogiston tofu.	49.7299999999999969	\N	1	2017-12-10 22:18:38.267508	2017-12-21 18:54:42.712144	0	book_cover.png	image/png	21149	2017-12-10 22:18:38.062577	1
17	The Mermaids Singing 5	Migas cliche schlitz 8-bit phlogiston messenger bag gluten-free.	62.6599999999999966	\N	2	2017-12-10 22:18:38.488904	2017-12-21 18:54:42.720847	0	book_cover.png	image/png	21149	2017-12-10 22:18:38.274289	1
18	Tiger! Tiger! 6	Listicle pop-up post-ironic truffaut pork belly swag lo-fi umami.	67.519999999999996	\N	5	2017-12-10 22:18:38.704175	2017-12-21 18:54:42.727679	0	book_cover.png	image/png	21149	2017-12-10 22:18:38.498008	1
19	The Doors of Perception 7	You probably haven't heard of them cliche hammock banh mi.	16.7300000000000004	\N	1	2017-12-10 22:18:38.944463	2017-12-21 18:54:42.734841	0	book_cover.png	image/png	21149	2017-12-10 22:18:38.716218	1
20	Things Fall Apart 8	Ethical biodiesel sriracha ramps tumblr meggings cold-pressed.	29.9400000000000013	\N	7	2017-12-10 22:18:39.200293	2017-12-21 18:54:42.742366	0	book_cover.png	image/png	21149	2017-12-10 22:18:38.957004	1
22	The Heart Is a Lonely Hunter 10	Stumptown xoxo yolo vinegar hammock.	22.9400000000000013	\N	3	2017-12-10 22:18:39.881487	2017-12-21 18:54:42.758572	0	book_cover.png	image/png	21149	2017-12-10 22:18:39.580097	1
23	This Side of Paradise 11	Waistcoat loko bespoke yolo thundercats ethical.	21.4400000000000013	\N	1	2017-12-10 22:18:40.216923	2017-12-21 18:54:42.766078	0	book_cover.png	image/png	21149	2017-12-10 22:18:39.893064	1
24	A Catskill Eagle 12	You probably haven't heard of them pinterest pug bitters lo-fi fashion axe.	18.6099999999999994	\N	2	2017-12-10 22:18:40.497703	2017-12-21 18:54:42.773361	0	book_cover.png	image/png	21149	2017-12-10 22:18:40.235218	1
25	Now Sleeps the Crimson Petal 13	Flannel cold-pressed retro chartreuse pitchfork normcore swag.	22.9100000000000001	\N	2	2017-12-10 22:18:40.743702	2017-12-21 18:54:42.781554	0	book_cover.png	image/png	21149	2017-12-10 22:18:40.511596	1
26	East of Eden 14	Organic fixie green juice biodiesel marfa food truck photo booth cardigan.	32.240000000000002	\N	8	2017-12-10 22:18:40.960811	2017-12-21 18:54:42.790975	0	book_cover.png	image/png	21149	2017-12-10 22:18:40.751715	1
27	Mr Standfast 15	Neutra pop-up gentrify hammock.	10.1699999999999999	\N	2	2017-12-10 22:18:41.187816	2017-12-21 18:54:42.798612	0	book_cover.png	image/png	21149	2017-12-10 22:18:40.969679	1
28	The Far-Distant Oxus 16	Try-hard ugh scenester pbr&b tumblr cold-pressed.	36.1000000000000014	\N	2	2017-12-10 22:18:41.398788	2017-12-21 18:54:42.805997	0	book_cover.png	image/png	21149	2017-12-10 22:18:41.19655	1
29	Time of our Darkness 17	+1 jean shorts kogi blog meggings ethical yr meh sustainable.	55.2000000000000028	\N	2	2017-12-10 22:18:41.605877	2017-12-21 18:54:42.813121	0	book_cover.png	image/png	21149	2017-12-10 22:18:41.408181	1
30	This Side of Paradise 18	Selfies chambray vinyl lo-fi pbr&b brunch.	17.8500000000000014	\N	8	2017-12-10 22:18:41.816949	2017-12-21 18:54:42.820699	0	book_cover.png	image/png	21149	2017-12-10 22:18:41.615429	1
31	Taming a Sea Horse 19	Flannel retro farm-to-table vegan venmo synth.	55.0700000000000003	\N	4	2017-12-10 22:18:42.055846	2017-12-21 18:54:42.82811	0	book_cover.png	image/png	21149	2017-12-10 22:18:41.830312	1
32	It's a Battlefield 20	Biodiesel thundercats truffaut neutra.	34.8999999999999986	\N	1	2017-12-10 22:18:42.272526	2017-12-21 18:54:42.834445	0	book_cover.png	image/png	21149	2017-12-10 22:18:42.066427	1
33	Look Homeward, Angel 21	Food truck pitchfork art party mixtape microdosing asymmetrical.	21.0100000000000016	\N	4	2017-12-10 22:18:42.475546	2017-12-21 18:54:42.840413	0	book_cover.png	image/png	21149	2017-12-10 22:18:42.281638	1
34	Jesting Pilate 22	Shoreditch chia biodiesel direct trade.	66.9500000000000028	\N	6	2017-12-10 22:18:42.685719	2017-12-21 18:54:42.846582	0	book_cover.png	image/png	21149	2017-12-10 22:18:42.484053	1
35	Arms and the Man 23	Kale chips muggle magic goth stumptown pork belly.	57.1199999999999974	\N	3	2017-12-10 22:18:42.904118	2017-12-21 18:54:42.852588	0	book_cover.png	image/png	21149	2017-12-10 22:18:42.695449	1
36	Specimen Days 24	Offal forage irony meh church-key carry sartorial.	53.990000000000002	\N	6	2017-12-10 22:18:43.141466	2017-12-21 18:54:42.858311	0	book_cover.png	image/png	21149	2017-12-10 22:18:42.915503	1
37	Everything is Illuminated 25	Single-origin coffee tofu tattooed polaroid hella.	56.75	\N	1	2017-12-10 22:18:43.355335	2017-12-21 18:54:42.864373	0	book_cover.png	image/png	21149	2017-12-10 22:18:43.151549	1
38	A Summer Bird-Cage 26	Authentic taxidermy master bitters.	54.3500000000000014	\N	1	2017-12-10 22:18:43.564497	2017-12-21 18:54:42.870143	0	book_cover.png	image/png	21149	2017-12-10 22:18:43.369096	1
39	The Millstone 27	Pug lomo keffiyeh slow-carb kitsch.	45	\N	3	2017-12-10 22:18:43.792524	2017-12-21 18:54:42.877633	0	book_cover.png	image/png	21149	2017-12-10 22:18:43.574023	1
40	Bury My Heart at Wounded Knee 28	Listicle cronut xoxo craft beer gastropub austin.	48.9799999999999969	\N	5	2017-12-10 22:18:44.025514	2017-12-21 18:54:42.88915	0	book_cover.png	image/png	21149	2017-12-10 22:18:43.806161	1
42	A Farewell to Arms 30	Kombucha skateboard fanny pack forage bushwick gluten-free.	14.8900000000000006	\N	8	2017-12-10 22:18:44.517836	2017-12-21 18:54:42.908974	0	book_cover.png	image/png	21149	2017-12-10 22:18:44.275689	1
43	Taming a Sea Horse 31	Cornhole tofu pork belly mixtape lo-fi asymmetrical.	40.7100000000000009	\N	2	2017-12-10 22:18:44.733352	2017-12-21 18:54:42.916858	0	book_cover.png	image/png	21149	2017-12-10 22:18:44.529524	1
45	A Time to Kill 33	Hoodie kickstarter celiac portland.	41.1899999999999977	\N	6	2017-12-10 22:18:45.212667	2017-12-21 18:54:42.929393	0	book_cover.png	image/png	21149	2017-12-10 22:18:44.975201	1
46	The Violent Bear It Away 34	Echo normcore celiac chia.	20.9699999999999989	\N	4	2017-12-10 22:18:45.530185	2017-12-21 18:54:42.9365	0	book_cover.png	image/png	21149	2017-12-10 22:18:45.233587	1
47	Some Buried Caesar 35	Cardigan 3 wolf moon selvage kogi sartorial williamsburg pork belly drinking.	51.5200000000000031	\N	4	2017-12-10 22:18:45.7891	2017-12-21 18:54:42.942796	0	book_cover.png	image/png	21149	2017-12-10 22:18:45.547937	1
48	Recalled to Life 36	Slow-carb microdosing cred venmo poutine pinterest.	20.0799999999999983	\N	3	2017-12-10 22:18:46.01883	2017-12-21 18:54:42.949428	0	book_cover.png	image/png	21149	2017-12-10 22:18:45.799892	1
49	O Jerusalem! 37	Quinoa migas cardigan try-hard sriracha.	41.4699999999999989	\N	5	2017-12-10 22:18:46.231032	2017-12-21 18:54:42.955526	0	book_cover.png	image/png	21149	2017-12-10 22:18:46.027704	1
50	The Line of Beauty 38	Marfa tattooed cleanse authentic trust fund actually health.	41.5399999999999991	\N	7	2017-12-10 22:18:46.435531	2017-12-21 18:54:42.961571	0	book_cover.png	image/png	21149	2017-12-10 22:18:46.242398	1
51	In Death Ground 39	Gentrify vinegar hashtag master fixie gluten-free.	26.129999999999999	\N	7	2017-12-10 22:18:46.651119	2017-12-21 18:54:42.968256	0	book_cover.png	image/png	21149	2017-12-10 22:18:46.443528	1
52	The Moving Finger 40	Gastropub cliche thundercats muggle magic street try-hard pbr&b mlkshk.	62.8100000000000023	\N	6	2017-12-10 22:18:46.859162	2017-12-21 18:54:42.974372	0	book_cover.png	image/png	21149	2017-12-10 22:18:46.659959	1
53	A Many-Splendoured Thing 41	Bushwick fixie artisan sustainable before they sold out normcore forage intelligentsia.	19.6799999999999997	\N	4	2017-12-10 22:18:47.074119	2017-12-21 18:54:42.981742	0	book_cover.png	image/png	21149	2017-12-10 22:18:46.867569	1
54	Behold the Man 42	Typewriter deep v mlkshk meditation cray.	10.7599999999999998	\N	1	2017-12-10 22:18:47.309717	2017-12-21 18:54:42.987608	0	book_cover.png	image/png	21149	2017-12-10 22:18:47.082776	1
55	This Lime Tree Bower 43	Street brooklyn tacos migas celiac kale chips irony artisan pork belly.	26.0100000000000016	\N	7	2017-12-10 22:18:47.52687	2017-12-21 18:54:42.993354	0	book_cover.png	image/png	21149	2017-12-10 22:18:47.319338	1
56	Alone on a Wide, Wide Sea 44	Cliche neutra everyday skateboard aesthetic farm-to-table.	50.6599999999999966	\N	7	2017-12-10 22:18:47.735118	2017-12-21 18:54:42.998989	0	book_cover.png	image/png	21149	2017-12-10 22:18:47.54043	1
57	Taming a Sea Horse 45	Green juice beard plaid distillery austin meditation pug pickled hashtag.	24.7100000000000009	\N	7	2017-12-10 22:18:47.951549	2017-12-21 18:54:43.004691	0	book_cover.png	image/png	21149	2017-12-10 22:18:47.751687	1
58	Blithe Spirit 46	Distillery readymade food truck chillwave you probably haven't heard of them 90's church-key mustache street.	19.3399999999999999	\N	5	2017-12-10 22:18:48.17178	2017-12-21 18:54:43.010048	0	book_cover.png	image/png	21149	2017-12-10 22:18:47.965488	1
59	Number the Stars 47	Keffiyeh skateboard viral paleo.	33.0399999999999991	\N	4	2017-12-10 22:18:48.380572	2017-12-21 18:54:43.015602	0	book_cover.png	image/png	21149	2017-12-10 22:18:48.186333	1
60	The Moving Finger 48	Offal vhs bushwick post-ironic tattooed cardigan kinfolk.	13.9399999999999995	\N	1	2017-12-10 22:18:48.589316	2017-12-21 18:54:43.021135	0	book_cover.png	image/png	21149	2017-12-10 22:18:48.393378	1
61	Consider Phlebas 49	Park blog bicycle rights diy viral vinegar sriracha.	55.3599999999999994	\N	5	2017-12-10 22:18:48.815302	2017-12-21 18:54:43.026787	0	book_cover.png	image/png	21149	2017-12-10 22:18:48.604825	1
62	The Last Enemy 50	Art party 3 wolf moon kinfolk letterpress.	40.990000000000002	\N	8	2017-12-10 22:18:49.037189	2017-12-21 18:54:43.032332	0	book_cover.png	image/png	21149	2017-12-10 22:18:48.829482	1
63	The Skull Beneath the Skin 51	Before they sold out cleanse forage selvage stumptown butcher.	15.5899999999999999	\N	8	2017-12-10 22:18:49.250829	2017-12-21 18:54:43.037731	0	book_cover.png	image/png	21149	2017-12-10 22:18:49.049068	1
64	The Millstone 52	Messenger bag single-origin coffee small batch pickled.	20.1499999999999986	\N	5	2017-12-10 22:18:49.477354	2017-12-21 18:54:43.043515	0	book_cover.png	image/png	21149	2017-12-10 22:18:49.263349	1
66	Carrion Comfort 54	Locavore franzen listicle tumblr kale chips vice gastropub freegan.	47.1599999999999966	\N	2	2017-12-10 22:18:49.91903	2017-12-21 18:54:43.055178	0	book_cover.png	image/png	21149	2017-12-10 22:18:49.721942	1
67	The Road Less Traveled 55	Chartreuse beard organic polaroid knausgaard mlkshk kickstarter.	56.1199999999999974	\N	5	2017-12-10 22:18:50.126922	2017-12-21 18:54:43.060631	0	book_cover.png	image/png	21149	2017-12-10 22:18:49.930218	1
68	The Heart Is Deceitful Above All Things 56	Seitan 3 wolf moon art party umami street kombucha tousled pop-up.	16.4200000000000017	\N	6	2017-12-10 22:18:50.340217	2017-12-21 18:54:43.066061	0	book_cover.png	image/png	21149	2017-12-10 22:18:50.138813	1
69	In Death Ground 57	Small batch direct trade tofu jean shorts poutine.	37.8599999999999994	\N	3	2017-12-10 22:18:50.551904	2017-12-21 18:54:43.071354	0	book_cover.png	image/png	21149	2017-12-10 22:18:50.352803	1
70	Recalled to Life 58	Mumblecore banh mi organic vinegar.	42.6700000000000017	\N	8	2017-12-10 22:18:50.764521	2017-12-21 18:54:43.07715	0	book_cover.png	image/png	21149	2017-12-10 22:18:50.565002	1
71	The Moving Toyshop 59	Ennui cleanse helvetica bicycle rights.	29.5	\N	3	2017-12-10 22:18:50.988729	2017-12-21 18:54:43.083754	0	book_cover.png	image/png	21149	2017-12-10 22:18:50.776504	1
72	The House of Mirth 60	Shoreditch literally chillwave slow-carb food truck park aesthetic blue bottle try-hard.	44.0300000000000011	\N	1	2017-12-10 22:18:51.197925	2017-12-21 18:54:43.089336	0	book_cover.png	image/png	21149	2017-12-10 22:18:51.000267	1
73	A Monstrous Regiment of Women 61	Roof street meditation retro wayfarers paleo seitan lomo.	65.5	\N	5	2017-12-10 22:18:51.407817	2017-12-21 18:54:43.095359	0	book_cover.png	image/png	21149	2017-12-10 22:18:51.210451	1
74	Some Buried Caesar 62	Plaid blue bottle humblebrag artisan.	34.5300000000000011	\N	2	2017-12-10 22:18:51.621349	2017-12-21 18:54:43.101383	0	book_cover.png	image/png	21149	2017-12-10 22:18:51.420095	1
75	Tender Is the Night 63	Green juice cleanse normcore typewriter blue bottle.	64.1099999999999994	\N	7	2017-12-10 22:18:51.833145	2017-12-21 18:54:43.106836	0	book_cover.png	image/png	21149	2017-12-10 22:18:51.634217	1
76	Of Human Bondage 64	Phlogiston whatever umami small batch.	23.6499999999999986	\N	6	2017-12-10 22:18:52.047259	2017-12-21 18:54:43.112346	0	book_cover.png	image/png	21149	2017-12-10 22:18:51.847922	1
77	The Heart Is Deceitful Above All Things 65	Small batch williamsburg xoxo you probably haven't heard of them banjo.	39.7199999999999989	\N	6	2017-12-10 22:18:52.259567	2017-12-21 18:54:43.118287	0	book_cover.png	image/png	21149	2017-12-10 22:18:52.059659	1
78	This Lime Tree Bower 66	Forage disrupt salvia bespoke.	48.5	\N	6	2017-12-10 22:18:52.470805	2017-12-21 18:54:43.123867	0	book_cover.png	image/png	21149	2017-12-10 22:18:52.272014	1
79	Blood's a Rover 67	Diy carry bicycle rights five dollar toast organic swag vegan pickled.	17.6099999999999994	\N	8	2017-12-10 22:18:52.699253	2017-12-21 18:54:43.130658	0	book_cover.png	image/png	21149	2017-12-10 22:18:52.482463	1
81	The Cricket on the Hearth 69	Ethical schlitz artisan meh.	15.8499999999999996	\N	8	2017-12-10 22:18:53.130339	2017-12-21 18:54:43.142463	0	book_cover.png	image/png	21149	2017-12-10 22:18:52.929874	1
82	Dance Dance Dance 70	Single-origin coffee trust fund mumblecore roof freegan semiotics vinegar.	42.4399999999999977	\N	6	2017-12-10 22:18:53.354499	2017-12-21 18:54:43.14782	0	book_cover.png	image/png	21149	2017-12-10 22:18:53.138887	1
84	The Last Enemy 72	Pinterest wolf vinegar irony polaroid food truck post-ironic health humblebrag.	23.5300000000000011	\N	4	2017-12-10 22:18:53.793303	2017-12-21 18:54:43.158522	0	book_cover.png	image/png	21149	2017-12-10 22:18:53.578754	1
85	The Golden Apples of the Sun 73	Vinyl park +1 quinoa single-origin coffee tumblr.	33.2899999999999991	\N	6	2017-12-10 22:18:54.006959	2017-12-21 18:54:43.163742	0	book_cover.png	image/png	21149	2017-12-10 22:18:53.801515	1
86	Time To Murder And Create 74	Everyday diy cornhole ennui pork belly.	13.3300000000000001	\N	7	2017-12-10 22:18:54.225946	2017-12-21 18:54:43.16922	0	book_cover.png	image/png	21149	2017-12-10 22:18:54.016689	1
87	The Wives of Bath 75	Yolo butcher organic authentic put a bird on it quinoa pabst stumptown meditation.	32.3599999999999994	\N	6	2017-12-10 22:18:54.440573	2017-12-21 18:54:43.174471	0	book_cover.png	image/png	21149	2017-12-10 22:18:54.235545	1
88	The Road Less Traveled 76	Sustainable meditation humblebrag kickstarter schlitz flexitarian neutra pug swag.	19.4899999999999984	\N	1	2017-12-10 22:18:54.66602	2017-12-21 18:54:43.180027	0	book_cover.png	image/png	21149	2017-12-10 22:18:54.45404	1
89	Antic Hay 77	Sartorial helvetica literally put a bird on it aesthetic cold-pressed quinoa portland.	9.10999999999999943	\N	6	2017-12-10 22:18:54.888828	2017-12-21 18:54:43.185242	0	book_cover.png	image/png	21149	2017-12-10 22:18:54.675362	1
90	The Way of All Flesh 78	Flexitarian vice kale chips freegan chambray pinterest direct trade post-ironic intelligentsia.	61.5600000000000023	\N	1	2017-12-10 22:18:55.118214	2017-12-21 18:54:43.190901	0	book_cover.png	image/png	21149	2017-12-10 22:18:54.899346	1
91	That Good Night 79	Deep v banh mi cray lomo readymade schlitz.	69.5600000000000023	\N	8	2017-12-10 22:18:55.369779	2017-12-21 18:54:43.196383	0	book_cover.png	image/png	21149	2017-12-10 22:18:55.130885	1
92	A Handful of Dust 80	Flannel blog mlkshk iphone hella.	62.8599999999999994	\N	8	2017-12-10 22:18:55.619516	2017-12-21 18:54:43.201808	0	book_cover.png	image/png	21149	2017-12-10 22:18:55.382194	1
93	Dulce et Decorum Est 81	Muggle magic deep v semiotics leggings 3 wolf moon.	57.740000000000002	\N	2	2017-12-10 22:18:55.862127	2017-12-21 18:54:43.207148	0	book_cover.png	image/png	21149	2017-12-10 22:18:55.630988	1
94	Quo Vadis 82	Ennui pour-over listicle letterpress disrupt chartreuse.	64.269999999999996	\N	3	2017-12-10 22:18:56.081323	2017-12-21 18:54:43.213858	0	book_cover.png	image/png	21149	2017-12-10 22:18:55.870738	1
95	I Will Fear No Evil 83	Synth knausgaard you probably haven't heard of them raw denim roof tacos 3 wolf moon.	69.8199999999999932	\N	2	2017-12-10 22:18:56.286058	2017-12-21 18:54:43.220103	0	book_cover.png	image/png	21149	2017-12-10 22:18:56.091012	1
96	In Death Ground 84	Health lo-fi wayfarers blog kombucha meh taxidermy you probably haven't heard of them.	21.129999999999999	\N	7	2017-12-10 22:18:56.511556	2017-12-21 18:54:43.225683	0	book_cover.png	image/png	21149	2017-12-10 22:18:56.295487	1
97	Beneath the Bleeding 85	Occupy art party butcher tousled squid viral mixtape.	33.8500000000000014	\N	5	2017-12-10 22:18:56.756284	2017-12-21 18:54:43.230907	0	book_cover.png	image/png	21149	2017-12-10 22:18:56.521524	1
98	In a Dry Season 86	Marfa portland put a bird on it ethical lo-fi banh mi.	38.509999999999998	\N	6	2017-12-10 22:18:57.004412	2017-12-21 18:54:43.236353	0	book_cover.png	image/png	21149	2017-12-10 22:18:56.772054	1
99	Some Buried Caesar 87	Seitan mlkshk cliche marfa.	20.75	\N	1	2017-12-10 22:18:57.253411	2017-12-21 18:54:43.242167	0	book_cover.png	image/png	21149	2017-12-10 22:18:57.013072	1
100	A Time to Kill 88	Ennui gentrify drinking chicharrones yuccie brunch bicycle rights.	26.4899999999999984	\N	2	2017-12-10 22:18:57.505917	2017-12-21 18:54:43.247803	0	book_cover.png	image/png	21149	2017-12-10 22:18:57.269075	1
101	The Yellow Meads of Asphodel 89	Typewriter kitsch ugh cardigan marfa squid tacos chicharrones.	31.5300000000000011	\N	1	2017-12-10 22:18:57.747786	2017-12-21 18:54:43.254215	0	book_cover.png	image/png	21149	2017-12-10 22:18:57.518407	1
102	No Highway 90	Pinterest goth butcher fanny pack sustainable.	47.1700000000000017	\N	7	2017-12-10 22:18:57.967338	2017-12-21 18:54:43.259909	0	book_cover.png	image/png	21149	2017-12-10 22:18:57.760488	1
103	Frequent Hearses 91	Truffaut ethical cardigan post-ironic carry.	56.3200000000000003	\N	2	2017-12-10 22:18:58.177778	2017-12-21 18:54:43.266146	0	book_cover.png	image/png	21149	2017-12-10 22:18:57.979125	1
105	The Lathe of Heaven 93	Phlogiston diy fashion axe direct trade viral bicycle rights retro small batch umami.	14.7699999999999996	\N	6	2017-12-10 22:18:58.635259	2017-12-21 18:54:43.278524	0	book_cover.png	image/png	21149	2017-12-10 22:18:58.414928	1
106	If Not Now, When? 94	Chia shabby chic literally ethical normcore whatever poutine semiotics fanny pack.	12.1400000000000006	\N	7	2017-12-10 22:18:58.874704	2017-12-21 18:54:43.283826	0	book_cover.png	image/png	21149	2017-12-10 22:18:58.647478	1
107	Of Mice and Men 95	Vinyl kale chips aesthetic post-ironic gastropub skateboard.	11.4600000000000009	\N	8	2017-12-10 22:18:59.102452	2017-12-21 18:54:43.290301	0	book_cover.png	image/png	21149	2017-12-10 22:18:58.894016	1
108	Dulce et Decorum Est 96	Semiotics tumblr skateboard tousled heirloom.	60.1400000000000006	\N	4	2017-12-10 22:18:59.333256	2017-12-21 18:54:43.296131	0	book_cover.png	image/png	21149	2017-12-10 22:18:59.115751	1
109	Down to a Sunless Sea 97	Brooklyn actually biodiesel pork belly vegan lumbersexual vice.	28.7100000000000009	\N	6	2017-12-10 22:18:59.56868	2017-12-21 18:54:43.30252	0	book_cover.png	image/png	21149	2017-12-10 22:18:59.348365	1
110	For Whom the Bell Tolls 98	Umami lumbersexual readymade vegan farm-to-table mustache thundercats hella vice.	19.5899999999999999	\N	3	2017-12-10 22:18:59.793055	2017-12-21 18:54:43.308345	0	book_cover.png	image/png	21149	2017-12-10 22:18:59.582021	1
111	The Heart Is Deceitful Above All Things 99	Ennui phlogiston health church-key organic carry blue bottle.	40.7700000000000031	\N	2	2017-12-10 22:19:00.070363	2017-12-21 18:54:43.314672	0	book_cover.png	image/png	21149	2017-12-10 22:18:59.805563	1
112	Some Buried Caesar 100	Hoodie gastropub 8-bit meh crucifix wes anderson echo fingerstache small batch.	7.41000000000000014	\N	3	2017-12-10 22:19:00.360343	2017-12-21 18:54:43.32079	0	book_cover.png	image/png	21149	2017-12-10 22:19:00.102175	1
113	Waiting for the Barbarians 101	Drinking humblebrag normcore meggings artisan kitsch five dollar toast ethical 90's.	17.9299999999999997	\N	2	2017-12-10 22:19:00.603175	2017-12-21 18:54:43.327361	0	book_cover.png	image/png	21149	2017-12-10 22:19:00.375328	1
114	Consider the Lilies 102	Bushwick banh mi blue bottle marfa twee.	50.759999999999998	\N	1	2017-12-10 22:19:00.820291	2017-12-21 18:54:43.333763	0	book_cover.png	image/png	21149	2017-12-10 22:19:00.615859	1
115	After Many a Summer Dies the Swan 103	Vegan authentic hammock normcore humblebrag marfa irony franzen 90's.	24.2300000000000004	\N	2	2017-12-10 22:19:01.043755	2017-12-21 18:54:43.33962	0	book_cover.png	image/png	21149	2017-12-10 22:19:00.83273	1
116	Mother Night 104	Umami 3 wolf moon five dollar toast slow-carb freegan.	11.4299999999999997	\N	7	2017-12-10 22:19:01.287415	2017-12-21 18:54:43.345642	0	book_cover.png	image/png	21149	2017-12-10 22:19:01.062627	1
117	Alone on a Wide, Wide Sea 105	Fashion axe forage lo-fi humblebrag fingerstache.	49.2700000000000031	\N	8	2017-12-10 22:19:01.527847	2017-12-21 18:54:43.35131	0	book_cover.png	image/png	21149	2017-12-10 22:19:01.311557	1
119	The Moon by Night 107	Cleanse wayfarers iphone whatever yolo leggings echo.	11.5899999999999999	\N	8	2017-12-10 22:19:01.985663	2017-12-21 18:54:43.363471	0	book_cover.png	image/png	21149	2017-12-10 22:19:01.763573	1
120	Specimen Days 108	Forage cray sartorial kombucha cleanse occupy listicle goth.	9.44999999999999929	\N	2	2017-12-10 22:19:02.199272	2017-12-21 18:54:43.369028	0	book_cover.png	image/png	21149	2017-12-10 22:19:01.998534	1
121	The Violent Bear It Away 109	Keffiyeh vegan pork belly whatever selvage echo typewriter cornhole.	20.1700000000000017	\N	6	2017-12-10 22:19:02.413448	2017-12-21 18:54:43.377016	0	book_cover.png	image/png	21149	2017-12-10 22:19:02.208911	1
122	The House of Mirth 110	Wayfarers chartreuse mustache yr whatever ugh bitters.	34.6899999999999977	\N	6	2017-12-10 22:19:02.632106	2017-12-21 18:54:43.38827	0	book_cover.png	image/png	21149	2017-12-10 22:19:02.425367	1
123	The Soldier's Art 111	Waistcoat kogi pinterest hashtag actually.	11.6099999999999994	\N	4	2017-12-10 22:19:02.869158	2017-12-21 18:54:43.39992	0	book_cover.png	image/png	21149	2017-12-10 22:19:02.642077	1
124	Sleep the Brave 112	Kinfolk whatever offal wolf selfies portland.	42.7899999999999991	\N	6	2017-12-10 22:19:03.100279	2017-12-21 18:54:43.407959	0	book_cover.png	image/png	21149	2017-12-10 22:19:02.881711	1
125	As I Lay Dying 113	Sriracha pitchfork migas distillery cray mumblecore poutine fingerstache blue bottle.	29.2699999999999996	\N	2	2017-12-10 22:19:03.318762	2017-12-21 18:54:43.415274	0	book_cover.png	image/png	21149	2017-12-10 22:19:03.113163	1
126	Vanity Fair 114	Chartreuse kitsch roof sustainable pour-over lomo fingerstache.	7.91000000000000014	\N	1	2017-12-10 22:19:03.551251	2017-12-21 18:54:43.423634	0	book_cover.png	image/png	21149	2017-12-10 22:19:03.331364	1
127	Things Fall Apart 115	Freegan waistcoat post-ironic flexitarian hashtag.	65.2399999999999949	\N	5	2017-12-10 22:19:03.787139	2017-12-21 18:54:43.431654	0	book_cover.png	image/png	21149	2017-12-10 22:19:03.564091	1
128	Look to Windward 116	Aesthetic meh five dollar toast jean shorts fashion axe trust fund carry.	21.7300000000000004	\N	7	2017-12-10 22:19:04.037266	2017-12-21 18:54:43.439321	0	book_cover.png	image/png	21149	2017-12-10 22:19:03.799254	1
130	To Sail Beyond the Sunset 118	Diy wolf intelligentsia humblebrag kitsch.	62.7199999999999989	\N	4	2017-12-10 22:19:04.514258	2017-12-21 18:54:43.451635	0	book_cover.png	image/png	21149	2017-12-10 22:19:04.292807	1
131	Antic Hay 119	Pbr&b chia swag trust fund.	40.8500000000000014	\N	7	2017-12-10 22:19:04.730388	2017-12-21 18:54:43.45761	0	book_cover.png	image/png	21149	2017-12-10 22:19:04.526708	1
132	In Dubious Battle 120	Gentrify roof tilde bicycle rights ethical bushwick.	12.5899999999999999	\N	3	2017-12-10 22:19:04.963983	2017-12-21 18:54:43.464096	0	book_cover.png	image/png	21149	2017-12-10 22:19:04.744275	1
133	The Moving Toyshop 121	Whatever brunch mumblecore echo.	56.6000000000000014	\N	3	2017-12-10 22:19:05.17524	2017-12-21 18:54:43.470535	0	book_cover.png	image/png	21149	2017-12-10 22:19:04.973968	1
134	Noli Me Tangere 122	Phlogiston cold-pressed freegan disrupt locavore beard pickled.	29.1900000000000013	\N	5	2017-12-10 22:19:05.403375	2017-12-21 18:54:43.476371	0	book_cover.png	image/png	21149	2017-12-10 22:19:05.187912	1
135	By Grand Central Station I Sat Down and Wept 123	Pickled lomo chia umami cleanse five dollar toast chambray celiac craft beer.	47.9299999999999997	\N	7	2017-12-10 22:19:05.62165	2017-12-21 18:54:43.483627	0	book_cover.png	image/png	21149	2017-12-10 22:19:05.413242	1
136	After Many a Summer Dies the Swan 124	Xoxo gentrify pour-over brooklyn forage roof.	18.3500000000000014	\N	3	2017-12-10 22:19:05.86875	2017-12-21 18:54:43.492538	0	book_cover.png	image/png	21149	2017-12-10 22:19:05.635435	1
137	A Many-Splendoured Thing 125	Microdosing 3 wolf moon venmo taxidermy diy drinking green juice.	66.7399999999999949	\N	6	2017-12-10 22:19:06.144859	2017-12-21 18:54:43.499772	0	book_cover.png	image/png	21149	2017-12-10 22:19:05.885533	1
138	That Hideous Strength 126	Etsy five dollar toast tousled flexitarian schlitz.	38.2000000000000028	\N	6	2017-12-10 22:19:06.365619	2017-12-21 18:54:43.505789	0	book_cover.png	image/png	21149	2017-12-10 22:19:06.160051	1
139	That Good Night 127	Organic ethical taxidermy godard.	31.6600000000000001	\N	6	2017-12-10 22:19:06.58187	2017-12-21 18:54:43.511428	0	book_cover.png	image/png	21149	2017-12-10 22:19:06.381898	1
140	Arms and the Man 128	Bushwick 8-bit hoodie letterpress gluten-free vinyl +1 jean shorts meditation.	13.5800000000000001	\N	7	2017-12-10 22:19:06.787639	2017-12-21 18:54:43.516984	0	book_cover.png	image/png	21149	2017-12-10 22:19:06.594203	1
141	The Needle's Eye 129	Cardigan jean shorts gluten-free sustainable kinfolk you probably haven't heard of them franzen venmo.	20.6700000000000017	\N	6	2017-12-10 22:19:06.999943	2017-12-21 18:54:43.522491	0	book_cover.png	image/png	21149	2017-12-10 22:19:06.800904	1
142	Cover Her Face 130	Scenester jean shorts schlitz literally.	41.3400000000000034	\N	4	2017-12-10 22:19:07.229093	2017-12-21 18:54:43.528174	0	book_cover.png	image/png	21149	2017-12-10 22:19:07.011631	1
143	The Skull Beneath the Skin 131	Artisan etsy actually tilde wes anderson.	58.1300000000000026	\N	4	2017-12-10 22:19:07.455168	2017-12-21 18:54:43.534522	0	book_cover.png	image/png	21149	2017-12-10 22:19:07.24826	1
144	I Will Fear No Evil 132	Brooklyn narwhal migas small batch authentic trust fund vinyl listicle.	55.7899999999999991	\N	8	2017-12-10 22:19:07.671366	2017-12-21 18:54:43.540263	0	book_cover.png	image/png	21149	2017-12-10 22:19:07.467116	1
145	Of Mice and Men 133	Messenger bag brunch banh mi bitters yr small batch keffiyeh godard humblebrag.	60.759999999999998	\N	6	2017-12-10 22:19:07.953315	2017-12-21 18:54:43.546587	0	book_cover.png	image/png	21149	2017-12-10 22:19:07.683137	1
146	I Sing the Body Electric 134	Literally cardigan seitan waistcoat yuccie street helvetica.	43.259999999999998	\N	4	2017-12-10 22:19:08.247163	2017-12-21 18:54:43.552372	0	book_cover.png	image/png	21149	2017-12-10 22:19:07.972606	1
147	Wildfire at Midnight 135	Wayfarers chambray lumbersexual cleanse hoodie pbr&b leggings.	24.6499999999999986	\N	7	2017-12-10 22:19:08.522469	2017-12-21 18:54:43.557905	0	book_cover.png	image/png	21149	2017-12-10 22:19:08.263391	1
148	A Passage to India 136	Scenester plaid try-hard marfa.	10.4800000000000004	\N	8	2017-12-10 22:19:08.833837	2017-12-21 18:54:43.564337	0	book_cover.png	image/png	21149	2017-12-10 22:19:08.536715	1
149	Fear and Trembling 137	Pitchfork deep v craft beer pop-up pabst.	10.4399999999999995	\N	7	2017-12-10 22:19:09.1032	2017-12-21 18:54:43.569841	0	book_cover.png	image/png	21149	2017-12-10 22:19:08.846696	1
150	The Golden Bowl 138	Blue bottle tacos ugh scenester pop-up 3 wolf moon.	43.5799999999999983	\N	4	2017-12-10 22:19:09.320107	2017-12-21 18:54:43.575362	0	book_cover.png	image/png	21149	2017-12-10 22:19:09.116676	1
151	Lilies of the Field 139	Literally letterpress tilde humblebrag selvage retro.	25.8599999999999994	\N	4	2017-12-10 22:19:09.541716	2017-12-21 18:54:43.580942	0	book_cover.png	image/png	21149	2017-12-10 22:19:09.328748	1
152	The Moving Finger 140	Gastropub hashtag next level shoreditch stumptown roof bespoke diy messenger bag.	20.370000000000001	\N	6	2017-12-10 22:19:09.808451	2017-12-21 18:54:43.58754	0	book_cover.png	image/png	21149	2017-12-10 22:19:09.5547	1
153	What's Become of Waring 141	Kogi neutra bespoke pour-over cleanse celiac distillery pabst.	46.3100000000000023	\N	6	2017-12-10 22:19:10.03684	2017-12-21 18:54:43.594	0	book_cover.png	image/png	21149	2017-12-10 22:19:09.820207	1
155	I Know Why the Caged Bird Sings 143	Celiac wolf portland plaid.	53.1700000000000017	\N	5	2017-12-10 22:19:10.570865	2017-12-21 18:54:43.605394	0	book_cover.png	image/png	21149	2017-12-10 22:19:10.339931	1
157	The Golden Apples of the Sun 145	Occupy lumbersexual forage pitchfork tofu farm-to-table raw denim.	51.759999999999998	\N	1	2017-12-10 22:19:11.006569	2017-12-21 18:54:43.618019	0	book_cover.png	image/png	21149	2017-12-10 22:19:10.80504	1
159	The Wings of the Dove 147	Next level squid wayfarers artisan sartorial +1 fingerstache authentic.	64.3499999999999943	\N	6	2017-12-10 22:19:11.461882	2017-12-21 18:54:43.637182	0	book_cover.png	image/png	21149	2017-12-10 22:19:11.242054	1
160	Ring of Bright Water 148	Disrupt wayfarers phlogiston 8-bit retro park franzen bitters venmo.	50.4200000000000017	\N	7	2017-12-10 22:19:11.687421	2017-12-21 18:54:43.643948	0	book_cover.png	image/png	21149	2017-12-10 22:19:11.475201	1
161	For a Breath I Tarry 149	Park organic readymade blue bottle synth chicharrones.	20.9299999999999997	\N	5	2017-12-10 22:19:11.902148	2017-12-21 18:54:43.649849	0	book_cover.png	image/png	21149	2017-12-10 22:19:11.697359	1
162	Tiger! Tiger! 150	Neutra bicycle rights meh viral williamsburg.	7.12000000000000011	\N	8	2017-12-10 22:19:12.121877	2017-12-21 18:54:43.656675	0	book_cover.png	image/png	21149	2017-12-10 22:19:11.910942	1
163	Have His Carcase 151	Beard artisan phlogiston selvage.	27.7800000000000011	\N	4	2017-12-10 22:19:12.339684	2017-12-21 18:54:43.662974	0	book_cover.png	image/png	21149	2017-12-10 22:19:12.131088	1
164	Clouds of Witness 152	Photo booth semiotics meh pitchfork 3 wolf moon fingerstache chambray.	34.8599999999999994	\N	7	2017-12-10 22:19:12.552618	2017-12-21 18:54:43.668778	0	book_cover.png	image/png	21149	2017-12-10 22:19:12.350305	1
165	Pale Kings and Princes 153	Sriracha truffaut scenester tofu.	41.9500000000000028	\N	2	2017-12-10 22:19:12.761138	2017-12-21 18:54:43.674442	0	book_cover.png	image/png	21149	2017-12-10 22:19:12.561924	1
166	Frequent Hearses 154	Organic twee disrupt kinfolk.	52.3500000000000014	\N	4	2017-12-10 22:19:12.98748	2017-12-21 18:54:43.68029	0	book_cover.png	image/png	21149	2017-12-10 22:19:12.769344	1
167	Of Human Bondage 155	Forage salvia wolf letterpress.	46.0600000000000023	\N	4	2017-12-10 22:19:13.221631	2017-12-21 18:54:43.68575	0	book_cover.png	image/png	21149	2017-12-10 22:19:12.999485	1
168	A Time of Gifts 156	Crucifix drinking umami banh mi vhs single-origin coffee austin banjo.	17.9899999999999984	\N	4	2017-12-10 22:19:13.444945	2017-12-21 18:54:43.692007	0	book_cover.png	image/png	21149	2017-12-10 22:19:13.233394	1
169	Fame Is the Spur 157	Irony distillery cronut ethical blog migas ramps knausgaard iphone.	23.5	\N	6	2017-12-10 22:19:13.665126	2017-12-21 18:54:43.697683	0	book_cover.png	image/png	21149	2017-12-10 22:19:13.457174	1
170	Of Human Bondage 158	Next level iphone cornhole freegan muggle magic kickstarter sustainable semiotics.	20.9100000000000001	\N	8	2017-12-10 22:19:13.882986	2017-12-21 18:54:43.70364	0	book_cover.png	image/png	21149	2017-12-10 22:19:13.677653	1
171	Vile Bodies 159	Blog kitsch chartreuse normcore.	16.2199999999999989	\N	7	2017-12-10 22:19:14.107521	2017-12-21 18:54:43.709193	0	book_cover.png	image/png	21149	2017-12-10 22:19:13.894632	1
172	As I Lay Dying 160	Deep v 8-bit ethical tousled roof ennui.	52.6099999999999994	\N	7	2017-12-10 22:19:14.342302	2017-12-21 18:54:43.714974	0	book_cover.png	image/png	21149	2017-12-10 22:19:14.121756	1
173	The Way Through the Woods 161	Actually tacos drinking austin marfa.	42.7000000000000028	\N	1	2017-12-10 22:19:14.574219	2017-12-21 18:54:43.721658	0	book_cover.png	image/png	21149	2017-12-10 22:19:14.359436	1
174	This Lime Tree Bower 162	Kombucha pork belly vhs tote bag direct trade.	66.3100000000000023	\N	7	2017-12-10 22:19:14.799976	2017-12-21 18:54:43.727386	0	book_cover.png	image/png	21149	2017-12-10 22:19:14.585865	1
175	Endless Night 163	Microdosing celiac diy shabby chic chia schlitz.	36.1499999999999986	\N	6	2017-12-10 22:19:15.021167	2017-12-21 18:54:43.733155	0	book_cover.png	image/png	21149	2017-12-10 22:19:14.816799	1
176	Cabbages and Kings 164	Truffaut cornhole vegan biodiesel tattooed hammock keytar austin.	11.25	\N	3	2017-12-10 22:19:15.238367	2017-12-21 18:54:43.738945	0	book_cover.png	image/png	21149	2017-12-10 22:19:15.033481	1
178	All the King's Men 166	Intelligentsia twee artisan neutra authentic beard seitan quinoa.	59.2899999999999991	\N	4	2017-12-10 22:19:15.694691	2017-12-21 18:54:43.750401	0	book_cover.png	image/png	21149	2017-12-10 22:19:15.478662	1
179	The Road Less Traveled 167	Occupy health mumblecore craft beer gastropub ennui.	66.4000000000000057	\N	3	2017-12-10 22:19:15.927646	2017-12-21 18:54:43.756219	0	book_cover.png	image/png	21149	2017-12-10 22:19:15.707416	1
180	Dance Dance Dance 168	Kogi humblebrag vhs blue bottle fashion axe direct trade.	67.2399999999999949	\N	2	2017-12-10 22:19:16.149586	2017-12-21 18:54:43.76218	0	book_cover.png	image/png	21149	2017-12-10 22:19:15.941089	1
181	Dance Dance Dance 169	Tacos humblebrag cronut beard shabby chic tousled next level.	37.3699999999999974	\N	2	2017-12-10 22:19:16.379264	2017-12-21 18:54:43.767949	0	book_cover.png	image/png	21149	2017-12-10 22:19:16.161192	1
182	The Wealth of Nations 170	Shabby chic pug marfa authentic lomo.	32.0399999999999991	\N	5	2017-12-10 22:19:16.617228	2017-12-21 18:54:43.773675	0	book_cover.png	image/png	21149	2017-12-10 22:19:16.395568	1
183	Waiting for the Barbarians 171	Tofu blue bottle squid pork belly polaroid mixtape.	63.6000000000000014	\N	8	2017-12-10 22:19:16.864532	2017-12-21 18:54:43.780165	0	book_cover.png	image/png	21149	2017-12-10 22:19:16.63183	1
184	Ah, Wilderness! 172	Asymmetrical normcore freegan pbr&b farm-to-table readymade craft beer kogi.	23.1600000000000001	\N	3	2017-12-10 22:19:17.088492	2017-12-21 18:54:43.786241	0	book_cover.png	image/png	21149	2017-12-10 22:19:16.87704	1
185	The Wind's Twelve Quarters 173	Artisan ethical microdosing carry fixie banh mi poutine xoxo.	62.6899999999999977	\N	3	2017-12-10 22:19:17.323139	2017-12-21 18:54:43.792493	0	book_cover.png	image/png	21149	2017-12-10 22:19:17.100953	1
186	In Dubious Battle 174	Typewriter poutine aesthetic hella.	40.9500000000000028	\N	4	2017-12-10 22:19:17.554417	2017-12-21 18:54:43.798141	0	book_cover.png	image/png	21149	2017-12-10 22:19:17.337878	1
187	The Last Enemy 175	Cornhole heirloom 8-bit thundercats.	36.1799999999999997	\N	2	2017-12-10 22:19:17.790678	2017-12-21 18:54:43.804067	0	book_cover.png	image/png	21149	2017-12-10 22:19:17.56828	1
188	A Passage to India 176	Photo booth master ennui pickled gastropub vinyl cardigan.	51.5700000000000003	\N	3	2017-12-10 22:19:18.015057	2017-12-21 18:54:43.809799	0	book_cover.png	image/png	21149	2017-12-10 22:19:17.803973	1
189	Vanity Fair 177	Roof you probably haven't heard of them iphone kogi typewriter occupy swag chicharrones.	15.5099999999999998	\N	4	2017-12-10 22:19:18.236883	2017-12-21 18:54:43.815563	0	book_cover.png	image/png	21149	2017-12-10 22:19:18.027863	1
190	A Many-Splendoured Thing 178	Wolf tumblr thundercats green juice trust fund synth leggings kombucha phlogiston.	18.7800000000000011	\N	6	2017-12-10 22:19:18.471351	2017-12-21 18:54:43.821307	0	book_cover.png	image/png	21149	2017-12-10 22:19:18.255815	1
191	That Hideous Strength 179	Direct trade master everyday mustache.	44.1099999999999994	\N	7	2017-12-10 22:19:18.686263	2017-12-21 18:54:43.82766	0	book_cover.png	image/png	21149	2017-12-10 22:19:18.480648	1
192	Where Angels Fear to Tread 180	Disrupt whatever tousled everyday 3 wolf moon jean shorts taxidermy tacos salvia.	58.759999999999998	\N	3	2017-12-10 22:19:18.912587	2017-12-21 18:54:43.833153	0	book_cover.png	image/png	21149	2017-12-10 22:19:18.702042	1
193	The Wealth of Nations 181	Retro chicharrones chartreuse aesthetic.	66.9899999999999949	\N	8	2017-12-10 22:19:19.13885	2017-12-21 18:54:43.838563	0	book_cover.png	image/png	21149	2017-12-10 22:19:18.922243	1
194	Fair Stood the Wind for France 182	Typewriter 3 wolf moon five dollar toast sartorial yr cray cardigan williamsburg.	39.8900000000000006	\N	3	2017-12-10 22:19:19.355644	2017-12-21 18:54:43.844528	0	book_cover.png	image/png	21149	2017-12-10 22:19:19.149199	1
196	The Grapes of Wrath 184	Actually loko food truck chicharrones you probably haven't heard of them master cold-pressed.	44.6099999999999994	\N	7	2017-12-10 22:19:19.805116	2017-12-21 18:54:43.856594	0	book_cover.png	image/png	21149	2017-12-10 22:19:19.588072	1
197	The Wings of the Dove 185	Thundercats carry dreamcatcher ugh.	28.8099999999999987	\N	7	2017-12-10 22:19:20.046556	2017-12-21 18:54:43.86279	0	book_cover.png	image/png	21149	2017-12-10 22:19:19.815147	1
198	The Skull Beneath the Skin 186	Tofu aesthetic pork belly chia poutine.	57.9600000000000009	\N	5	2017-12-10 22:19:20.254654	2017-12-21 18:54:43.868416	0	book_cover.png	image/png	21149	2017-12-10 22:19:20.055848	1
199	Infinite Jest 187	Selfies marfa meh pbr&b drinking kickstarter godard phlogiston.	14.9299999999999997	\N	5	2017-12-10 22:19:20.471644	2017-12-21 18:54:43.877925	0	book_cover.png	image/png	21149	2017-12-10 22:19:20.268167	1
200	The Lathe of Heaven 188	Shabby chic fingerstache godard tousled cronut kale chips offal.	39.9099999999999966	\N	6	2017-12-10 22:19:20.684685	2017-12-21 18:54:43.889513	0	book_cover.png	image/png	21149	2017-12-10 22:19:20.484003	1
201	The Glory and the Dream 189	Cardigan goth austin leggings pabst godard disrupt crucifix.	57.240000000000002	\N	5	2017-12-10 22:19:20.923754	2017-12-21 18:54:43.897926	0	book_cover.png	image/png	21149	2017-12-10 22:19:20.69341	1
202	What's Become of Waring 190	Pitchfork farm-to-table try-hard chicharrones paleo meditation gentrify.	11.7699999999999996	\N	8	2017-12-10 22:19:21.156821	2017-12-21 18:54:43.906915	0	book_cover.png	image/png	21149	2017-12-10 22:19:20.932999	1
203	Vanity Fair 191	Before they sold out next level gentrify butcher leggings helvetica single-origin coffee green juice.	51.5200000000000031	\N	6	2017-12-10 22:19:21.386629	2017-12-21 18:54:43.913377	0	book_cover.png	image/png	21149	2017-12-10 22:19:21.167531	1
204	What's Become of Waring 192	Forage gentrify cliche messenger bag keytar jean shorts intelligentsia.	32.9399999999999977	\N	2	2017-12-10 22:19:21.613016	2017-12-21 18:54:43.920492	0	book_cover.png	image/png	21149	2017-12-10 22:19:21.396523	1
205	The Millstone 193	Farm-to-table bespoke pbr&b squid migas.	42.8200000000000003	\N	8	2017-12-10 22:19:21.834091	2017-12-21 18:54:43.926557	0	book_cover.png	image/png	21149	2017-12-10 22:19:21.622157	1
206	Consider Phlebas 194	Offal tattooed loko paleo biodiesel neutra.	60.75	\N	6	2017-12-10 22:19:22.051979	2017-12-21 18:54:43.931988	0	book_cover.png	image/png	21149	2017-12-10 22:19:21.846219	1
207	All the King's Men 195	Quinoa kitsch echo +1 chambray gastropub tofu viral.	62.9299999999999997	\N	6	2017-12-10 22:19:22.272056	2017-12-21 18:54:43.937427	0	book_cover.png	image/png	21149	2017-12-10 22:19:22.061184	1
208	The Heart Is a Lonely Hunter 196	Heirloom five dollar toast 3 wolf moon wayfarers trust fund cardigan austin.	8.94999999999999929	\N	2	2017-12-10 22:19:22.496864	2017-12-21 18:54:43.943067	0	book_cover.png	image/png	21149	2017-12-10 22:19:22.282834	1
209	Infinite Jest 197	Distillery selfies brunch schlitz irony marfa banjo.	7.41000000000000014	\N	7	2017-12-10 22:19:22.707877	2017-12-21 18:54:43.948853	0	book_cover.png	image/png	21149	2017-12-10 22:19:22.509475	1
210	To Sail Beyond the Sunset 198	Health yuccie kale chips viral deep v keytar cred dreamcatcher street.	60.1599999999999966	\N	5	2017-12-10 22:19:22.927581	2017-12-21 18:54:43.954231	0	book_cover.png	image/png	21149	2017-12-10 22:19:22.725741	1
212	Wildfire at Midnight 200	Raw denim letterpress selfies stumptown readymade authentic goth locavore marfa.	54.3699999999999974	\N	2	2017-12-10 22:19:23.370948	2017-12-21 18:54:43.966599	0	book_cover.png	image/png	21149	2017-12-10 22:19:23.160794	1
213	Mr Standfast 201	Cleanse mumblecore 8-bit pour-over biodiesel cold-pressed pinterest 3 wolf moon hammock.	49.7100000000000009	\N	6	2017-12-10 22:19:23.61532	2017-12-21 18:54:43.973291	0	book_cover.png	image/png	21149	2017-12-10 22:19:23.38718	1
214	The Far-Distant Oxus 202	Mumblecore chicharrones letterpress banh mi chillwave bicycle rights.	41.1199999999999974	\N	6	2017-12-10 22:19:23.838736	2017-12-21 18:54:43.979098	0	book_cover.png	image/png	21149	2017-12-10 22:19:23.627006	1
215	Let Us Now Praise Famous Men 203	Diy stumptown ugh 90's keytar cliche.	19.8200000000000003	\N	2	2017-12-10 22:19:24.06737	2017-12-21 18:54:43.984597	0	book_cover.png	image/png	21149	2017-12-10 22:19:23.850814	1
216	O Pioneers! 204	Trust fund 3 wolf moon chia forage diy tattooed sriracha mlkshk.	16.9800000000000004	\N	5	2017-12-10 22:19:24.287639	2017-12-21 18:54:43.990552	0	book_cover.png	image/png	21149	2017-12-10 22:19:24.078941	1
217	The Last Temptation 205	Sriracha leggings sartorial organic neutra stumptown letterpress muggle magic retro.	27.3900000000000006	\N	5	2017-12-10 22:19:24.502711	2017-12-21 18:54:43.995785	0	book_cover.png	image/png	21149	2017-12-10 22:19:24.301758	1
218	The Waste Land 206	Cray craft beer schlitz banh mi retro waistcoat.	37.6899999999999977	\N	6	2017-12-10 22:19:24.712541	2017-12-21 18:54:44.001113	0	book_cover.png	image/png	21149	2017-12-10 22:19:24.512015	1
219	Pale Kings and Princes 207	Direct trade kogi gastropub art party park narwhal muggle magic.	69.730000000000004	\N	6	2017-12-10 22:19:24.921455	2017-12-21 18:54:44.006998	0	book_cover.png	image/png	21149	2017-12-10 22:19:24.723625	1
220	Dying of the Light 208	Kitsch semiotics pour-over normcore mixtape tumblr flexitarian bicycle rights.	41.3999999999999986	\N	4	2017-12-10 22:19:25.165585	2017-12-21 18:54:44.01288	0	book_cover.png	image/png	21149	2017-12-10 22:19:24.929543	1
221	Arms and the Man 209	Park gentrify helvetica quinoa vice green juice sriracha humblebrag.	59.8100000000000023	\N	8	2017-12-10 22:19:25.373675	2017-12-21 18:54:44.018647	0	book_cover.png	image/png	21149	2017-12-10 22:19:25.176557	1
222	Recalled to Life 210	Chartreuse meditation celiac pbr&b echo sriracha yolo.	10.3499999999999996	\N	4	2017-12-10 22:19:25.588924	2017-12-21 18:54:44.024511	0	book_cover.png	image/png	21149	2017-12-10 22:19:25.385328	1
223	The Skull Beneath the Skin 211	Organic bitters asymmetrical put a bird on it kickstarter cred lomo blue bottle.	64.0499999999999972	\N	6	2017-12-10 22:19:25.809976	2017-12-21 18:54:44.029817	0	book_cover.png	image/png	21149	2017-12-10 22:19:25.604527	1
224	The Golden Apples of the Sun 212	Waistcoat bicycle rights single-origin coffee chartreuse.	57.3699999999999974	\N	6	2017-12-10 22:19:26.066202	2017-12-21 18:54:44.035865	0	book_cover.png	image/png	21149	2017-12-10 22:19:25.819388	1
225	Lilies of the Field 213	Meggings drinking tote bag cronut.	56.4299999999999997	\N	7	2017-12-10 22:19:26.284632	2017-12-21 18:54:44.041326	0	book_cover.png	image/png	21149	2017-12-10 22:19:26.074252	1
226	The Line of Beauty 214	Diy vhs celiac blue bottle pinterest distillery.	34.2700000000000031	\N	8	2017-12-10 22:19:26.514639	2017-12-21 18:54:44.04741	0	book_cover.png	image/png	21149	2017-12-10 22:19:26.298014	1
227	O Pioneers! 215	Phlogiston heirloom loko bitters health cleanse single-origin coffee paleo.	68.8299999999999983	\N	3	2017-12-10 22:19:26.729006	2017-12-21 18:54:44.052751	0	book_cover.png	image/png	21149	2017-12-10 22:19:26.524016	1
228	The Heart Is a Lonely Hunter 216	Celiac pickled heirloom tote bag semiotics disrupt bushwick meditation freegan.	21.6099999999999994	\N	3	2017-12-10 22:19:26.952862	2017-12-21 18:54:44.058053	0	book_cover.png	image/png	21149	2017-12-10 22:19:26.739155	1
229	Down to a Sunless Sea 217	Godard 8-bit paleo bitters.	28.8599999999999994	\N	3	2017-12-10 22:19:27.182441	2017-12-21 18:54:44.06341	0	book_cover.png	image/png	21149	2017-12-10 22:19:26.961927	1
230	Frequent Hearses 218	Authentic cleanse health bitters austin cred.	48.4500000000000028	\N	7	2017-12-10 22:19:27.397282	2017-12-21 18:54:44.069762	0	book_cover.png	image/png	21149	2017-12-10 22:19:27.191496	1
231	All Passion Spent 219	Kogi distillery portland phlogiston locavore.	64.1700000000000017	\N	8	2017-12-10 22:19:27.61253	2017-12-21 18:54:44.0755	0	book_cover.png	image/png	21149	2017-12-10 22:19:27.406752	1
233	Alone on a Wide, Wide Sea 221	Bespoke gastropub mustache lo-fi fixie kickstarter.	28.7199999999999989	\N	4	2017-12-10 22:19:28.132177	2017-12-21 18:54:44.087178	0	book_cover.png	image/png	21149	2017-12-10 22:19:27.926899	1
234	Vanity Fair 222	8-bit farm-to-table yr cornhole sustainable skateboard locavore.	69.1700000000000017	\N	1	2017-12-10 22:19:28.340283	2017-12-21 18:54:44.093672	0	book_cover.png	image/png	21149	2017-12-10 22:19:28.141092	1
235	That Good Night 223	Selvage pbr&b helvetica everyday kombucha brooklyn art party dreamcatcher meh.	8.09999999999999964	\N	6	2017-12-10 22:19:28.574542	2017-12-21 18:54:44.099947	0	book_cover.png	image/png	21149	2017-12-10 22:19:28.355222	1
236	A Scanner Darkly 224	Farm-to-table pickled synth pbr&b five dollar toast truffaut.	43.509999999999998	\N	6	2017-12-10 22:19:28.810434	2017-12-21 18:54:44.10577	0	book_cover.png	image/png	21149	2017-12-10 22:19:28.585491	1
237	Tiger! Tiger! 225	Viral sriracha irony bushwick meggings photo booth microdosing tattooed hashtag.	35.1000000000000014	\N	2	2017-12-10 22:19:29.203555	2017-12-21 18:54:44.111575	0	book_cover.png	image/png	21149	2017-12-10 22:19:28.826279	1
238	Eyeless in Gaza 226	Put a bird on it butcher five dollar toast tattooed messenger bag before they sold out sartorial wolf.	27.370000000000001	\N	3	2017-12-10 22:19:29.496599	2017-12-21 18:54:44.117503	0	book_cover.png	image/png	21149	2017-12-10 22:19:29.217263	1
239	Blue Remembered Earth 227	Shabby chic bespoke heirloom celiac craft beer authentic put a bird on it.	54.6099999999999994	\N	5	2017-12-10 22:19:29.774391	2017-12-21 18:54:44.122721	0	book_cover.png	image/png	21149	2017-12-10 22:19:29.517038	1
240	Little Hands Clapping 228	Wolf muggle magic before they sold out shabby chic authentic forage.	27.129999999999999	\N	8	2017-12-10 22:19:30.072106	2017-12-21 18:54:44.129538	0	book_cover.png	image/png	21149	2017-12-10 22:19:29.787134	1
241	The Cricket on the Hearth 229	Sustainable cray vinyl migas.	43.8800000000000026	\N	6	2017-12-10 22:19:30.29914	2017-12-21 18:54:44.135446	0	book_cover.png	image/png	21149	2017-12-10 22:19:30.08451	1
242	Where Angels Fear to Tread 230	Muggle magic twee cardigan vinyl trust fund iphone meh.	50.9200000000000017	\N	3	2017-12-10 22:19:30.628267	2017-12-21 18:54:44.140793	0	book_cover.png	image/png	21149	2017-12-10 22:19:30.311786	1
243	A Time of Gifts 231	Iphone truffaut dreamcatcher kale chips bicycle rights migas.	12.25	\N	3	2017-12-10 22:19:30.910607	2017-12-21 18:54:44.146193	0	book_cover.png	image/png	21149	2017-12-10 22:19:30.636831	1
244	His Dark Materials 232	Waistcoat cronut neutra microdosing 90's tilde.	48.3299999999999983	\N	6	2017-12-10 22:19:31.178529	2017-12-21 18:54:44.152043	0	book_cover.png	image/png	21149	2017-12-10 22:19:30.922221	1
246	Behold the Man 234	Phlogiston sriracha banjo yolo next level jean shorts kombucha tacos.	43.0600000000000023	\N	3	2017-12-10 22:19:31.658504	2017-12-21 18:54:44.163942	0	book_cover.png	image/png	21149	2017-12-10 22:19:31.443575	1
247	From Here to Eternity 235	Small batch roof literally mumblecore vegan yr pour-over kickstarter selvage.	31.0100000000000016	\N	6	2017-12-10 22:19:31.893284	2017-12-21 18:54:44.169744	0	book_cover.png	image/png	21149	2017-12-10 22:19:31.671355	1
248	The Little Foxes 236	Offal pour-over kale chips asymmetrical gastropub tousled roof cliche.	7.28000000000000025	\N	1	2017-12-10 22:19:32.128434	2017-12-21 18:54:44.175473	0	book_cover.png	image/png	21149	2017-12-10 22:19:31.903096	1
249	Specimen Days 237	Waistcoat brunch migas mlkshk post-ironic chia.	27.4800000000000004	\N	3	2017-12-10 22:19:32.376294	2017-12-21 18:54:44.180968	0	book_cover.png	image/png	21149	2017-12-10 22:19:32.137724	1
250	Beyond the Mexique Bay 238	+1 kitsch butcher photo booth chillwave.	37.3400000000000034	\N	5	2017-12-10 22:19:32.603826	2017-12-21 18:54:44.18653	0	book_cover.png	image/png	21149	2017-12-10 22:19:32.387053	1
251	The Needle's Eye 239	Pop-up gentrify sriracha phlogiston venmo thundercats chicharrones.	7.49000000000000021	\N	2	2017-12-10 22:19:32.829702	2017-12-21 18:54:44.192654	0	book_cover.png	image/png	21149	2017-12-10 22:19:32.612204	1
252	Cover Her Face 240	Five dollar toast literally pabst farm-to-table skateboard dreamcatcher.	12.5099999999999998	\N	3	2017-12-10 22:19:33.081573	2017-12-21 18:54:44.198681	0	book_cover.png	image/png	21149	2017-12-10 22:19:32.838593	1
253	Jesting Pilate 241	Park kombucha post-ironic chillwave shoreditch kogi next level.	49.5	\N	1	2017-12-10 22:19:33.323525	2017-12-21 18:54:44.204505	0	book_cover.png	image/png	21149	2017-12-10 22:19:33.09403	1
254	Nectar in a Sieve 242	Synth thundercats brooklyn cold-pressed chartreuse.	33.4399999999999977	\N	2	2017-12-10 22:19:33.622556	2017-12-21 18:54:44.210508	0	book_cover.png	image/png	21149	2017-12-10 22:19:33.336091	1
255	Terrible Swift Sword 243	Wolf polaroid try-hard kitsch.	14.5399999999999991	\N	1	2017-12-10 22:19:33.917664	2017-12-21 18:54:44.215994	0	book_cover.png	image/png	21149	2017-12-10 22:19:33.635647	1
256	The Glory and the Dream 244	90's swag scenester twee synth diy xoxo vice mixtape.	23.2800000000000011	\N	5	2017-12-10 22:19:34.247559	2017-12-21 18:54:44.222531	0	book_cover.png	image/png	21149	2017-12-10 22:19:33.931629	1
257	In Death Ground 245	Biodiesel mumblecore banh mi kogi direct trade hella selvage.	49.0200000000000031	\N	4	2017-12-10 22:19:34.504025	2017-12-21 18:54:44.228112	0	book_cover.png	image/png	21149	2017-12-10 22:19:34.262161	1
258	The Wings of the Dove 246	Venmo pinterest sriracha schlitz.	28.1600000000000001	\N	7	2017-12-10 22:19:34.750381	2017-12-21 18:54:44.233896	0	book_cover.png	image/png	21149	2017-12-10 22:19:34.519434	1
259	Lilies of the Field 247	Letterpress slow-carb kale chips fanny pack distillery banh mi pug small batch microdosing.	54.2999999999999972	\N	1	2017-12-10 22:19:35.016117	2017-12-21 18:54:44.239428	0	book_cover.png	image/png	21149	2017-12-10 22:19:34.765372	1
260	In a Dry Season 248	Synth photo booth narwhal kale chips tattooed polaroid organic slow-carb.	57.2999999999999972	\N	1	2017-12-10 22:19:35.255266	2017-12-21 18:54:44.244808	0	book_cover.png	image/png	21149	2017-12-10 22:19:35.027659	1
261	Sleep the Brave 249	Vinyl butcher farm-to-table seitan banh mi tattooed marfa try-hard muggle magic.	16.8599999999999994	\N	1	2017-12-10 22:19:35.471656	2017-12-21 18:54:44.250098	0	book_cover.png	image/png	21149	2017-12-10 22:19:35.267576	1
262	By Grand Central Station I Sat Down and Wept 250	Williamsburg thundercats fixie dreamcatcher semiotics.	60.8100000000000023	\N	3	2017-12-10 22:19:35.706525	2017-12-21 18:54:44.257195	0	book_cover.png	image/png	21149	2017-12-10 22:19:35.484966	1
264	Stranger in a Strange Land 252	Flannel pop-up mlkshk chambray kinfolk crucifix.	45.7899999999999991	\N	6	2017-12-10 22:19:36.323734	2017-12-21 18:54:44.268253	0	book_cover.png	image/png	21149	2017-12-10 22:19:36.080195	1
265	As I Lay Dying 253	Letterpress loko listicle swag cray vinegar biodiesel.	42.9600000000000009	\N	5	2017-12-10 22:19:36.562695	2017-12-21 18:54:44.273648	0	book_cover.png	image/png	21149	2017-12-10 22:19:36.332033	1
266	Butter In a Lordly Dish 254	Seitan keffiyeh bespoke marfa plaid church-key lomo pitchfork humblebrag.	12.8699999999999992	\N	3	2017-12-10 22:19:36.800891	2017-12-21 18:54:44.279204	0	book_cover.png	image/png	21149	2017-12-10 22:19:36.574089	1
267	The Proper Study 255	Selvage craft beer ennui knausgaard freegan pickled.	7.73000000000000043	\N	3	2017-12-10 22:19:37.025361	2017-12-21 18:54:44.285344	0	book_cover.png	image/png	21149	2017-12-10 22:19:36.810611	1
268	To Your Scattered Bodies Go 256	Umami roof hammock meditation yolo.	66.6299999999999955	\N	1	2017-12-10 22:19:37.247432	2017-12-21 18:54:44.291459	0	book_cover.png	image/png	21149	2017-12-10 22:19:37.035991	1
271	Beneath the Bleeding 259	Pinterest jean shorts flexitarian meditation kitsch beard craft beer aesthetic.	15.4199999999999999	\N	3	2017-12-10 22:19:37.929279	2017-12-21 18:54:44.308858	0	book_cover.png	image/png	21149	2017-12-10 22:19:37.708897	1
272	A Passage to India 260	Kale chips chillwave crucifix everyday kinfolk sartorial banjo park.	11.3300000000000001	\N	1	2017-12-10 22:19:38.159049	2017-12-21 18:54:44.314403	0	book_cover.png	image/png	21149	2017-12-10 22:19:37.93808	1
273	The Way Through the Woods 261	Fashion axe craft beer vhs vinegar.	17.8500000000000014	\N	1	2017-12-10 22:19:38.382324	2017-12-21 18:54:44.320438	0	book_cover.png	image/png	21149	2017-12-10 22:19:38.168518	1
274	From Here to Eternity 262	Marfa godard meditation pork belly roof brunch.	67.7099999999999937	\N	8	2017-12-10 22:19:38.599467	2017-12-21 18:54:44.325751	0	book_cover.png	image/png	21149	2017-12-10 22:19:38.393139	1
275	The Little Foxes 263	Vhs disrupt kinfolk mustache brunch 8-bit forage.	49.2199999999999989	\N	3	2017-12-10 22:19:38.861431	2017-12-21 18:54:44.331848	0	book_cover.png	image/png	21149	2017-12-10 22:19:38.611514	1
276	The Daffodil Sky 264	Tousled pop-up mumblecore humblebrag neutra leggings.	42.1199999999999974	\N	2	2017-12-10 22:19:39.155731	2017-12-21 18:54:44.337362	0	book_cover.png	image/png	21149	2017-12-10 22:19:38.874147	1
277	Edna O'Brien 265	Gluten-free kombucha waistcoat diy echo church-key.	34.2100000000000009	\N	8	2017-12-10 22:19:39.370809	2017-12-21 18:54:44.343435	0	book_cover.png	image/png	21149	2017-12-10 22:19:39.16438	1
278	The Line of Beauty 266	Meggings drinking banjo try-hard cray fingerstache.	63.7100000000000009	\N	3	2017-12-10 22:19:39.584984	2017-12-21 18:54:44.349575	0	book_cover.png	image/png	21149	2017-12-10 22:19:39.380106	1
279	A Summer Bird-Cage 267	Ethical drinking leggings pickled trust fund.	21.120000000000001	\N	3	2017-12-10 22:19:39.88054	2017-12-21 18:54:44.355388	0	book_cover.png	image/png	21149	2017-12-10 22:19:39.599552	1
280	Behold the Man 268	Heirloom photo booth brunch tofu kinfolk.	34.8699999999999974	\N	8	2017-12-10 22:19:40.10894	2017-12-21 18:54:44.361355	0	book_cover.png	image/png	21149	2017-12-10 22:19:39.890483	1
281	Dulce et Decorum Est 269	3 wolf moon microdosing hoodie 90's.	11.25	\N	1	2017-12-10 22:19:40.32248	2017-12-21 18:54:44.367218	0	book_cover.png	image/png	21149	2017-12-10 22:19:40.117635	1
282	The Line of Beauty 270	Wayfarers quinoa pour-over before they sold out fashion axe craft beer hella tacos.	32.6099999999999994	\N	8	2017-12-10 22:19:40.552229	2017-12-21 18:54:44.375007	0	book_cover.png	image/png	21149	2017-12-10 22:19:40.335813	1
283	An Acceptable Time 271	Sartorial yolo butcher fanny pack chambray leggings normcore skateboard.	33.0600000000000023	\N	2	2017-12-10 22:19:40.765765	2017-12-21 18:54:44.384351	0	book_cover.png	image/png	21149	2017-12-10 22:19:40.561084	1
284	Nine Coaches Waiting 272	Letterpress stumptown cray lumbersexual xoxo everyday 8-bit semiotics tote bag.	50.3999999999999986	\N	3	2017-12-10 22:19:40.98539	2017-12-21 18:54:44.39401	0	book_cover.png	image/png	21149	2017-12-10 22:19:40.774742	1
285	The Needle's Eye 273	Pickled pabst food truck kitsch post-ironic pitchfork.	61.3100000000000023	\N	8	2017-12-10 22:19:41.244257	2017-12-21 18:54:44.402434	0	book_cover.png	image/png	21149	2017-12-10 22:19:40.994979	1
286	Far From the Madding Crowd 274	Tattooed try-hard bushwick godard.	45.7000000000000028	\N	5	2017-12-10 22:19:41.555835	2017-12-21 18:54:44.407846	0	book_cover.png	image/png	21149	2017-12-10 22:19:41.260459	1
287	Sleep the Brave 275	Meh pickled deep v chia flexitarian pork belly.	13.0800000000000001	\N	4	2017-12-10 22:19:41.836825	2017-12-21 18:54:44.414313	0	book_cover.png	image/png	21149	2017-12-10 22:19:41.569137	1
288	The Proper Study 276	Bitters godard meditation gastropub lo-fi.	26.4800000000000004	\N	7	2017-12-10 22:19:42.067873	2017-12-21 18:54:44.420556	0	book_cover.png	image/png	21149	2017-12-10 22:19:41.848228	1
289	A Farewell to Arms 277	Viral slow-carb pinterest brooklyn pork belly skateboard 90's yr.	26.870000000000001	\N	5	2017-12-10 22:19:42.285146	2017-12-21 18:54:44.425785	0	book_cover.png	image/png	21149	2017-12-10 22:19:42.081092	1
291	Beneath the Bleeding 279	Disrupt yolo banjo cliche 90's kickstarter.	12.5	\N	1	2017-12-10 22:19:42.744309	2017-12-21 18:54:44.436665	0	book_cover.png	image/png	21149	2017-12-10 22:19:42.504344	1
292	Dance Dance Dance 280	Church-key green juice kogi austin bespoke tumblr vice.	47.240000000000002	\N	1	2017-12-10 22:19:43.012244	2017-12-21 18:54:44.441981	0	book_cover.png	image/png	21149	2017-12-10 22:19:42.75796	1
293	Unweaving the Rainbow 281	Church-key pop-up vhs single-origin coffee direct trade.	17.2899999999999991	\N	3	2017-12-10 22:19:43.27259	2017-12-21 18:54:44.44799	0	book_cover.png	image/png	21149	2017-12-10 22:19:43.02536	1
294	Many Waters 282	+1 farm-to-table before they sold out locavore goth distillery vice.	55.8900000000000006	\N	5	2017-12-10 22:19:43.507806	2017-12-21 18:54:44.453458	0	book_cover.png	image/png	21149	2017-12-10 22:19:43.285418	1
295	To Say Nothing of the Dog 283	Fashion axe hoodie leggings shoreditch trust fund art party aesthetic venmo.	55.259999999999998	\N	8	2017-12-10 22:19:43.733097	2017-12-21 18:54:44.459465	0	book_cover.png	image/png	21149	2017-12-10 22:19:43.519365	1
296	Time To Murder And Create 284	Pickled iphone tofu brunch.	47.3500000000000014	\N	5	2017-12-10 22:19:43.947601	2017-12-21 18:54:44.465016	0	book_cover.png	image/png	21149	2017-12-10 22:19:43.743293	1
297	Stranger in a Strange Land 285	Migas pickled chambray leggings dreamcatcher wolf deep v intelligentsia.	32.5900000000000034	\N	7	2017-12-10 22:19:44.199394	2017-12-21 18:54:44.471643	0	book_cover.png	image/png	21149	2017-12-10 22:19:43.957161	1
298	To Say Nothing of the Dog 286	Gluten-free keffiyeh beard chia banjo portland distillery gastropub schlitz.	50.7800000000000011	\N	6	2017-12-10 22:19:44.446526	2017-12-21 18:54:44.477291	0	book_cover.png	image/png	21149	2017-12-10 22:19:44.209799	1
299	It's a Battlefield 287	Next level kale chips offal mlkshk hoodie celiac meh heirloom.	53.8999999999999986	\N	4	2017-12-10 22:19:44.661326	2017-12-21 18:54:44.483052	0	book_cover.png	image/png	21149	2017-12-10 22:19:44.45832	1
300	Specimen Days 288	Drinking microdosing kitsch put a bird on it biodiesel vhs.	28.5599999999999987	\N	6	2017-12-10 22:19:44.902803	2017-12-21 18:54:44.488632	0	book_cover.png	image/png	21149	2017-12-10 22:19:44.672967	1
301	In Dubious Battle 289	Before they sold out microdosing hoodie neutra.	50.2199999999999989	\N	4	2017-12-10 22:19:45.140405	2017-12-21 18:54:44.494681	0	book_cover.png	image/png	21149	2017-12-10 22:19:44.914856	1
302	Shall not Perish 290	Salvia park shabby chic cardigan selfies try-hard franzen.	20.9600000000000009	\N	3	2017-12-10 22:19:45.426396	2017-12-21 18:54:44.501296	0	book_cover.png	image/png	21149	2017-12-10 22:19:45.15712	1
303	The Waste Land 291	Crucifix viral austin yolo you probably haven't heard of them kickstarter.	59.8299999999999983	\N	8	2017-12-10 22:19:45.654894	2017-12-21 18:54:44.506742	0	book_cover.png	image/png	21149	2017-12-10 22:19:45.439137	1
304	Dying of the Light 292	Organic occupy poutine williamsburg.	68.1400000000000006	\N	4	2017-12-10 22:19:45.888795	2017-12-21 18:54:44.512265	0	book_cover.png	image/png	21149	2017-12-10 22:19:45.665756	1
305	Lilies of the Field 293	Polaroid flannel listicle aesthetic hashtag swag.	64.1500000000000057	\N	8	2017-12-10 22:19:46.115676	2017-12-21 18:54:44.517652	0	book_cover.png	image/png	21149	2017-12-10 22:19:45.896546	1
306	The Cricket on the Hearth 294	Kale chips cornhole truffaut lo-fi tousled.	32.9699999999999989	\N	7	2017-12-10 22:19:46.354218	2017-12-21 18:54:44.523593	0	book_cover.png	image/png	21149	2017-12-10 22:19:46.126713	1
307	Consider the Lilies 295	Asymmetrical art party beard lumbersexual 8-bit scenester.	54.4299999999999997	\N	2	2017-12-10 22:19:46.619099	2017-12-21 18:54:44.529547	0	book_cover.png	image/png	21149	2017-12-10 22:19:46.365204	1
310	Behold the Man 298	Paleo kickstarter fingerstache church-key echo gentrify.	57.4399999999999977	\N	3	2017-12-10 22:19:47.432053	2017-12-21 18:54:44.547053	0	book_cover.png	image/png	21149	2017-12-10 22:19:47.187951	1
311	Recalled to Life 299	Intelligentsia phlogiston crucifix 90's blog mixtape.	57.9399999999999977	\N	4	2017-12-10 22:19:47.668631	2017-12-21 18:54:44.552805	0	book_cover.png	image/png	21149	2017-12-10 22:19:47.440921	1
312	His Dark Materials 300	Distillery xoxo 90's next level asymmetrical jean shorts.	40.8200000000000003	\N	8	2017-12-10 22:19:47.880003	2017-12-21 18:54:44.558698	0	book_cover.png	image/png	21149	2017-12-10 22:19:47.677668	1
313	Paths of Glory 301	Flexitarian typewriter microdosing blog banh mi fanny pack swag skateboard.	48.4099999999999966	\N	7	2017-12-10 22:19:48.106294	2017-12-21 18:54:44.564341	0	book_cover.png	image/png	21149	2017-12-10 22:19:47.888671	1
314	A Confederacy of Dunces 302	Slow-carb farm-to-table heirloom bespoke iphone selfies five dollar toast.	31.1099999999999994	\N	4	2017-12-10 22:19:48.335887	2017-12-21 18:54:44.569866	0	book_cover.png	image/png	21149	2017-12-10 22:19:48.117489	1
315	Dying of the Light 303	Chartreuse schlitz letterpress wes anderson +1.	61.8500000000000014	\N	4	2017-12-10 22:19:48.562662	2017-12-21 18:54:44.576336	0	book_cover.png	image/png	21149	2017-12-10 22:19:48.345429	1
316	The World, the Flesh and the Devil 304	Chambray food truck ennui williamsburg fanny pack keffiyeh beard 8-bit typewriter.	65.7600000000000051	\N	6	2017-12-10 22:19:48.800738	2017-12-21 18:54:44.581696	0	book_cover.png	image/png	21149	2017-12-10 22:19:48.571754	1
317	If I Forget Thee Jerusalem 305	Hammock blog kombucha keytar knausgaard.	62.1400000000000006	\N	6	2017-12-10 22:19:49.026231	2017-12-21 18:54:44.588145	0	book_cover.png	image/png	21149	2017-12-10 22:19:48.810052	1
318	Where Angels Fear to Tread 306	Master whatever schlitz retro wayfarers literally knausgaard tilde disrupt.	27.4800000000000004	\N	1	2017-12-10 22:19:49.258797	2017-12-21 18:54:44.59381	0	book_cover.png	image/png	21149	2017-12-10 22:19:49.035521	1
319	Shall not Perish 307	Beard muggle magic food truck tousled normcore.	25.9899999999999984	\N	1	2017-12-10 22:19:49.483055	2017-12-21 18:54:44.599479	0	book_cover.png	image/png	21149	2017-12-10 22:19:49.267781	1
320	Vanity Fair 308	Chambray truffaut park gentrify cronut vinegar selfies keytar pitchfork.	42	\N	8	2017-12-10 22:19:49.717642	2017-12-21 18:54:44.605306	0	book_cover.png	image/png	21149	2017-12-10 22:19:49.494657	1
321	Shall not Perish 309	Pug mlkshk wolf vinyl butcher master tacos squid diy.	11.5299999999999994	\N	8	2017-12-10 22:19:49.935596	2017-12-21 18:54:44.61118	0	book_cover.png	image/png	21149	2017-12-10 22:19:49.726824	1
322	Consider Phlebas 310	Single-origin coffee chillwave meh freegan street tumblr taxidermy readymade.	47.2199999999999989	\N	2	2017-12-10 22:19:50.162357	2017-12-21 18:54:44.616686	0	book_cover.png	image/png	21149	2017-12-10 22:19:49.948081	1
323	Specimen Days 311	Trust fund bushwick food truck chambray pickled biodiesel five dollar toast vinegar letterpress.	8.71000000000000085	\N	6	2017-12-10 22:19:50.393806	2017-12-21 18:54:44.62224	0	book_cover.png	image/png	21149	2017-12-10 22:19:50.173745	1
324	Carrion Comfort 312	Put a bird on it +1 tattooed cred gluten-free distillery freegan 3 wolf moon sartorial.	58.5200000000000031	\N	1	2017-12-10 22:19:50.628796	2017-12-21 18:54:44.628704	0	book_cover.png	image/png	21149	2017-12-10 22:19:50.405396	1
325	The Wives of Bath 313	Echo meditation put a bird on it pug vinegar bushwick vice actually brunch.	55.2800000000000011	\N	1	2017-12-10 22:19:50.862645	2017-12-21 18:54:44.634439	0	book_cover.png	image/png	21149	2017-12-10 22:19:50.640785	1
326	In a Dry Season 314	Roof bushwick fanny pack wolf tofu deep v mlkshk ramps polaroid.	9.85999999999999943	\N	5	2017-12-10 22:19:51.078915	2017-12-21 18:54:44.640277	0	book_cover.png	image/png	21149	2017-12-10 22:19:50.874405	1
327	Beyond the Mexique Bay 315	Pug distillery fanny pack banh mi sartorial tilde actually normcore bespoke.	14.9600000000000009	\N	7	2017-12-10 22:19:51.312242	2017-12-21 18:54:44.646106	0	book_cover.png	image/png	21149	2017-12-10 22:19:51.092624	1
328	Fame Is the Spur 316	Tousled blog +1 shabby chic tacos flannel polaroid pickled green juice.	23.5500000000000007	\N	4	2017-12-10 22:19:51.539421	2017-12-21 18:54:44.652401	0	book_cover.png	image/png	21149	2017-12-10 22:19:51.32455	1
329	Edna O'Brien 317	Pour-over biodiesel selfies crucifix hoodie deep v try-hard hammock 3 wolf moon.	18.6799999999999997	\N	3	2017-12-10 22:19:51.751694	2017-12-21 18:54:44.657817	0	book_cover.png	image/png	21149	2017-12-10 22:19:51.552371	1
331	Everything is Illuminated 319	Wayfarers umami celiac forage stumptown vhs bespoke sriracha chambray.	43.0300000000000011	\N	6	2017-12-10 22:19:52.190682	2017-12-21 18:54:44.669242	0	book_cover.png	image/png	21149	2017-12-10 22:19:51.988872	1
332	A Monstrous Regiment of Women 320	Hammock iphone mixtape carry small batch migas kitsch vice paleo.	67.769999999999996	\N	2	2017-12-10 22:19:52.422223	2017-12-21 18:54:44.674995	0	book_cover.png	image/png	21149	2017-12-10 22:19:52.204299	1
333	Far From the Madding Crowd 321	Umami waistcoat chartreuse health typewriter.	46.8699999999999974	\N	8	2017-12-10 22:19:52.653127	2017-12-21 18:54:44.680801	0	book_cover.png	image/png	21149	2017-12-10 22:19:52.435203	1
334	By Grand Central Station I Sat Down and Wept 322	Tattooed thundercats pitchfork artisan stumptown quinoa.	65.5400000000000063	\N	4	2017-12-10 22:19:52.876346	2017-12-21 18:54:44.686575	0	book_cover.png	image/png	21149	2017-12-10 22:19:52.661966	1
335	Mother Night 323	Twee yr mlkshk echo roof franzen gastropub.	66.5699999999999932	\N	4	2017-12-10 22:19:53.111928	2017-12-21 18:54:44.692103	0	book_cover.png	image/png	21149	2017-12-10 22:19:52.886158	1
336	Fear and Trembling 324	Xoxo skateboard yr vice fixie neutra shoreditch kitsch mumblecore.	26.0399999999999991	\N	5	2017-12-10 22:19:53.345076	2017-12-21 18:54:44.69797	0	book_cover.png	image/png	21149	2017-12-10 22:19:53.121339	1
337	The Last Enemy 325	Iphone carry wes anderson pork belly street cold-pressed portland synth wayfarers.	40.3299999999999983	\N	4	2017-12-10 22:19:53.570919	2017-12-21 18:54:44.703846	0	book_cover.png	image/png	21149	2017-12-10 22:19:53.357146	1
338	The Yellow Meads of Asphodel 326	Williamsburg kogi shoreditch tofu.	14.3800000000000008	\N	6	2017-12-10 22:19:53.797989	2017-12-21 18:54:44.709727	0	book_cover.png	image/png	21149	2017-12-10 22:19:53.584299	1
339	Gone with the Wind 327	Selvage knausgaard flannel gentrify vinegar wolf swag.	41.3599999999999994	\N	3	2017-12-10 22:19:54.068942	2017-12-21 18:54:44.715713	0	book_cover.png	image/png	21149	2017-12-10 22:19:53.814516	1
340	Mr Standfast 328	Raw denim austin cray single-origin coffee green juice aesthetic normcore tote bag.	9.50999999999999979	\N	3	2017-12-10 22:19:54.306148	2017-12-21 18:54:44.730544	0	book_cover.png	image/png	21149	2017-12-10 22:19:54.081525	1
341	A Glass of Blessings 329	Ethical freegan goth farm-to-table raw denim cornhole vinegar distillery.	17.1099999999999994	\N	3	2017-12-10 22:19:54.536971	2017-12-21 18:54:44.735865	0	book_cover.png	image/png	21149	2017-12-10 22:19:54.318295	1
342	An Instant In The Wind 330	Fingerstache you probably haven't heard of them gastropub franzen cray tumblr flannel synth brunch.	66	\N	2	2017-12-10 22:19:54.751325	2017-12-21 18:54:44.74138	0	book_cover.png	image/png	21149	2017-12-10 22:19:54.550503	1
343	The Violent Bear It Away 331	Waistcoat crucifix skateboard selfies tumblr austin brunch put a bird on it.	18.1600000000000001	\N	1	2017-12-10 22:19:54.981093	2017-12-21 18:54:44.746795	0	book_cover.png	image/png	21149	2017-12-10 22:19:54.765003	1
497	The Green Bay Tree 485	Paleo literally fixie etsy deep v hoodie.	39.0600000000000023	\N	5	2017-12-10 22:20:29.951888	2017-12-21 18:54:44.752195	0	book_cover.png	image/png	21149	2017-12-10 22:20:29.743386	1
346	A Time of Gifts 334	Pour-over kinfolk etsy next level kombucha messenger bag authentic single-origin coffee.	43.8299999999999983	\N	1	2017-12-10 22:19:55.662283	2017-12-21 18:54:44.7686	0	book_cover.png	image/png	21149	2017-12-10 22:19:55.440766	1
347	Moab Is My Washpot 335	Kinfolk beard before they sold out letterpress mustache raw denim.	68.1899999999999977	\N	7	2017-12-10 22:19:55.873235	2017-12-21 18:54:44.773822	0	book_cover.png	image/png	21149	2017-12-10 22:19:55.673998	1
348	Now Sleeps the Crimson Petal 336	Raw denim put a bird on it actually blog.	50.7700000000000031	\N	3	2017-12-10 22:19:56.09604	2017-12-21 18:54:44.77911	0	book_cover.png	image/png	21149	2017-12-10 22:19:55.885973	1
349	The Soldier's Art 337	Five dollar toast fingerstache cold-pressed marfa single-origin coffee portland.	14.3100000000000005	\N	6	2017-12-10 22:19:56.327518	2017-12-21 18:54:44.784505	0	book_cover.png	image/png	21149	2017-12-10 22:19:56.112451	1
350	From Here to Eternity 338	Yolo cred aesthetic put a bird on it you probably haven't heard of them.	37.8900000000000006	\N	1	2017-12-10 22:19:56.547329	2017-12-21 18:54:44.790666	0	book_cover.png	image/png	21149	2017-12-10 22:19:56.339459	1
351	Vanity Fair 339	Diy chicharrones cardigan sriracha umami forage scenester ethical microdosing.	67.3100000000000023	\N	7	2017-12-10 22:19:56.7673	2017-12-21 18:54:44.796525	0	book_cover.png	image/png	21149	2017-12-10 22:19:56.562983	1
352	In Death Ground 340	Vhs artisan lomo thundercats fashion axe organic health you probably haven't heard of them pitchfork.	23.2399999999999984	\N	5	2017-12-10 22:19:56.987856	2017-12-21 18:54:44.802422	0	book_cover.png	image/png	21149	2017-12-10 22:19:56.779481	1
353	The Last Enemy 341	Brunch lo-fi wes anderson beard scenester viral.	50.3900000000000006	\N	8	2017-12-10 22:19:57.209407	2017-12-21 18:54:44.808525	0	book_cover.png	image/png	21149	2017-12-10 22:19:56.999178	1
354	Of Human Bondage 342	Kitsch jean shorts put a bird on it fixie brunch fashion axe slow-carb wolf.	40.1799999999999997	\N	1	2017-12-10 22:19:57.444458	2017-12-21 18:54:44.813839	0	book_cover.png	image/png	21149	2017-12-10 22:19:57.223097	1
355	Nine Coaches Waiting 343	Messenger bag tousled tacos roof 8-bit organic.	40.5300000000000011	\N	5	2017-12-10 22:19:57.680521	2017-12-21 18:54:44.819676	0	book_cover.png	image/png	21149	2017-12-10 22:19:57.458141	1
356	The Moving Toyshop 344	Intelligentsia chambray kinfolk portland yolo ramps.	45.4600000000000009	\N	5	2017-12-10 22:19:57.900445	2017-12-21 18:54:44.825527	0	book_cover.png	image/png	21149	2017-12-10 22:19:57.694663	1
357	For Whom the Bell Tolls 345	Messenger bag chia diy tofu hella cardigan.	13.4600000000000009	\N	3	2017-12-10 22:19:58.134168	2017-12-21 18:54:44.831027	0	book_cover.png	image/png	21149	2017-12-10 22:19:57.912175	1
358	If Not Now, When? 346	Chia fingerstache banjo cred.	41.8500000000000014	\N	2	2017-12-10 22:19:58.359903	2017-12-21 18:54:44.836688	0	book_cover.png	image/png	21149	2017-12-10 22:19:58.146316	1
359	The Daffodil Sky 347	Fanny pack art party salvia keytar biodiesel banjo pop-up cardigan.	46.7800000000000011	\N	6	2017-12-10 22:19:58.583304	2017-12-21 18:54:44.841919	0	book_cover.png	image/png	21149	2017-12-10 22:19:58.373239	1
360	Everything is Illuminated 348	Sustainable chicharrones knausgaard jean shorts meh.	24.5399999999999991	\N	1	2017-12-10 22:19:58.803498	2017-12-21 18:54:44.847345	0	book_cover.png	image/png	21149	2017-12-10 22:19:58.594261	1
361	Of Mice and Men 349	Muggle magic hashtag franzen brooklyn narwhal organic occupy.	20.5500000000000007	\N	6	2017-12-10 22:19:59.047477	2017-12-21 18:54:44.852832	0	book_cover.png	image/png	21149	2017-12-10 22:19:58.816646	1
362	Many Waters 350	Narwhal dreamcatcher pinterest master ramps.	64.0600000000000023	\N	7	2017-12-10 22:19:59.256865	2017-12-21 18:54:44.859651	0	book_cover.png	image/png	21149	2017-12-10 22:19:59.061104	1
363	Mother Night 351	Offal marfa retro godard occupy seitan salvia waistcoat.	18.8200000000000003	\N	5	2017-12-10 22:19:59.479511	2017-12-21 18:54:44.865138	0	book_cover.png	image/png	21149	2017-12-10 22:19:59.273356	1
364	Blue Remembered Earth 352	Next level thundercats etsy intelligentsia ugh viral dreamcatcher keytar.	15.4499999999999993	\N	6	2017-12-10 22:19:59.695407	2017-12-21 18:54:44.87161	0	book_cover.png	image/png	21149	2017-12-10 22:19:59.491448	1
365	Mr Standfast 353	3 wolf moon muggle magic art party normcore thundercats.	19.5300000000000011	\N	3	2017-12-10 22:19:59.920045	2017-12-21 18:54:44.880751	0	book_cover.png	image/png	21149	2017-12-10 22:19:59.707996	1
366	Precious Bane 354	Shabby chic bushwick slow-carb hashtag.	33.5700000000000003	\N	3	2017-12-10 22:20:00.149307	2017-12-21 18:54:44.890423	0	book_cover.png	image/png	21149	2017-12-10 22:19:59.932398	1
368	The Curious Incident of the Dog in the Night-Time 356	Bushwick chartreuse occupy +1 jean shorts post-ironic literally cronut.	37.5900000000000034	\N	3	2017-12-10 22:20:00.596726	2017-12-21 18:54:44.905862	0	book_cover.png	image/png	21149	2017-12-10 22:20:00.388106	1
369	The Mermaids Singing 357	Shoreditch salvia selvage echo.	18.8000000000000007	\N	7	2017-12-10 22:20:00.84662	2017-12-21 18:54:44.912498	0	book_cover.png	image/png	21149	2017-12-10 22:20:00.609322	1
370	All the King's Men 358	Distillery street twee park franzen cardigan.	9.72000000000000064	\N	1	2017-12-10 22:20:01.102953	2017-12-21 18:54:44.918791	0	book_cover.png	image/png	21149	2017-12-10 22:20:00.860489	1
371	Pale Kings and Princes 359	Single-origin coffee aesthetic shabby chic skateboard gentrify.	57.4600000000000009	\N	8	2017-12-10 22:20:01.349497	2017-12-21 18:54:44.924725	0	book_cover.png	image/png	21149	2017-12-10 22:20:01.120151	1
372	By Grand Central Station I Sat Down and Wept 360	Literally flexitarian letterpress blue bottle butcher flannel pork belly keytar mixtape.	50.1099999999999994	\N	8	2017-12-10 22:20:01.582717	2017-12-21 18:54:44.930671	0	book_cover.png	image/png	21149	2017-12-10 22:20:01.368666	1
373	Bury My Heart at Wounded Knee 361	Irony tote bag loko iphone green juice selvage shabby chic gluten-free.	8.89000000000000057	\N	5	2017-12-10 22:20:01.817861	2017-12-21 18:54:44.936232	0	book_cover.png	image/png	21149	2017-12-10 22:20:01.600201	1
374	Mr Standfast 362	Hashtag farm-to-table kickstarter wayfarers health.	65.25	\N	3	2017-12-10 22:20:02.053458	2017-12-21 18:54:44.941551	0	book_cover.png	image/png	21149	2017-12-10 22:20:01.831571	1
375	The Other Side of Silence 363	Meggings microdosing meh occupy bushwick ethical.	55.3999999999999986	\N	8	2017-12-10 22:20:02.285484	2017-12-21 18:54:44.947004	0	book_cover.png	image/png	21149	2017-12-10 22:20:02.072415	1
376	The Heart Is Deceitful Above All Things 364	Yr everyday franzen cold-pressed schlitz next level waistcoat.	47.2899999999999991	\N	5	2017-12-10 22:20:02.51519	2017-12-21 18:54:44.952902	0	book_cover.png	image/png	21149	2017-12-10 22:20:02.302555	1
377	A Many-Splendoured Thing 365	Humblebrag wes anderson muggle magic roof thundercats blue bottle banjo lomo blog.	54.2800000000000011	\N	4	2017-12-10 22:20:02.746393	2017-12-21 18:54:44.959158	0	book_cover.png	image/png	21149	2017-12-10 22:20:02.528604	1
378	A Scanner Darkly 366	Kinfolk green juice tilde biodiesel pop-up ugh gentrify.	35.0200000000000031	\N	3	2017-12-10 22:20:02.964947	2017-12-21 18:54:44.964953	0	book_cover.png	image/png	21149	2017-12-10 22:20:02.759881	1
379	A Glass of Blessings 367	Banjo ethical craft beer pbr&b single-origin coffee.	15.9499999999999993	\N	8	2017-12-10 22:20:03.174931	2017-12-21 18:54:44.970633	0	book_cover.png	image/png	21149	2017-12-10 22:20:02.975629	1
380	Fear and Trembling 368	Synth chartreuse small batch plaid.	26.9499999999999993	\N	8	2017-12-10 22:20:03.401285	2017-12-21 18:54:44.976448	0	book_cover.png	image/png	21149	2017-12-10 22:20:03.193468	1
381	Waiting for the Barbarians 369	Lumbersexual knausgaard iphone letterpress.	41.1300000000000026	\N	3	2017-12-10 22:20:03.621325	2017-12-21 18:54:44.982512	0	book_cover.png	image/png	21149	2017-12-10 22:20:03.410946	1
383	This Side of Paradise 371	+1 squid deep v wayfarers.	18.3099999999999987	\N	5	2017-12-10 22:20:04.043403	2017-12-21 18:54:44.994457	0	book_cover.png	image/png	21149	2017-12-10 22:20:03.841762	1
384	By Grand Central Station I Sat Down and Wept 372	Cardigan beard pop-up green juice.	52.7700000000000031	\N	1	2017-12-10 22:20:04.257022	2017-12-21 18:54:45.000095	0	book_cover.png	image/png	21149	2017-12-10 22:20:04.051931	1
385	Frequent Hearses 373	Everyday iphone microdosing 90's five dollar toast authentic.	32.009999999999998	\N	6	2017-12-10 22:20:04.487269	2017-12-21 18:54:45.005602	0	book_cover.png	image/png	21149	2017-12-10 22:20:04.265912	1
387	Fair Stood the Wind for France 375	Asymmetrical pop-up slow-carb chartreuse raw denim iphone yuccie.	23.2800000000000011	\N	8	2017-12-10 22:20:04.910039	2017-12-21 18:54:45.017337	0	book_cover.png	image/png	21149	2017-12-10 22:20:04.708966	1
388	The Stars' Tennis Balls 376	Kickstarter kogi microdosing vinegar tofu fanny pack 90's.	65.5999999999999943	\N	7	2017-12-10 22:20:05.15002	2017-12-21 18:54:45.022994	0	book_cover.png	image/png	21149	2017-12-10 22:20:04.936186	1
389	Down to a Sunless Sea 377	Hella bitters portland carry microdosing cliche waistcoat literally.	42.2800000000000011	\N	2	2017-12-10 22:20:05.363365	2017-12-21 18:54:45.028847	0	book_cover.png	image/png	21149	2017-12-10 22:20:05.159945	1
390	Consider Phlebas 378	Disrupt cliche chillwave single-origin coffee asymmetrical try-hard wolf sartorial freegan.	24.4200000000000017	\N	4	2017-12-10 22:20:05.580721	2017-12-21 18:54:45.034231	0	book_cover.png	image/png	21149	2017-12-10 22:20:05.371907	1
391	All Passion Spent 379	Mlkshk gastropub forage selfies quinoa tofu venmo.	62.1000000000000014	\N	7	2017-12-10 22:20:05.800346	2017-12-21 18:54:45.040165	0	book_cover.png	image/png	21149	2017-12-10 22:20:05.5905	1
392	The Wives of Bath 380	Post-ironic raw denim swag phlogiston etsy actually squid venmo.	22.4899999999999984	\N	8	2017-12-10 22:20:06.046391	2017-12-21 18:54:45.046138	0	book_cover.png	image/png	21149	2017-12-10 22:20:05.808621	1
393	No Longer at Ease 381	Listicle sriracha bitters typewriter diy lo-fi drinking butcher.	25.629999999999999	\N	1	2017-12-10 22:20:06.27254	2017-12-21 18:54:45.05196	0	book_cover.png	image/png	21149	2017-12-10 22:20:06.055401	1
394	I Will Fear No Evil 382	Kale chips shoreditch scenester 3 wolf moon vice hoodie godard.	33.5799999999999983	\N	3	2017-12-10 22:20:06.486751	2017-12-21 18:54:45.057809	0	book_cover.png	image/png	21149	2017-12-10 22:20:06.287298	1
395	Behold the Man 383	Meggings craft beer seitan polaroid meditation actually.	49.1000000000000014	\N	2	2017-12-10 22:20:06.714108	2017-12-21 18:54:45.063563	0	book_cover.png	image/png	21149	2017-12-10 22:20:06.502494	1
396	Fame Is the Spur 384	Diy letterpress art party flexitarian meh.	47.8699999999999974	\N	5	2017-12-10 22:20:06.938103	2017-12-21 18:54:45.06942	0	book_cover.png	image/png	21149	2017-12-10 22:20:06.72565	1
397	The Stars' Tennis Balls 385	Selvage wolf brooklyn normcore church-key yuccie literally.	10.4399999999999995	\N	8	2017-12-10 22:20:07.151159	2017-12-21 18:54:45.075343	0	book_cover.png	image/png	21149	2017-12-10 22:20:06.947727	1
398	The Wind's Twelve Quarters 386	Tote bag hella diy meh you probably haven't heard of them yuccie bespoke beard irony.	51.2899999999999991	\N	1	2017-12-10 22:20:07.369286	2017-12-21 18:54:45.081094	0	book_cover.png	image/png	21149	2017-12-10 22:20:07.159813	1
399	The Road Less Traveled 387	Ennui banh mi banjo cold-pressed chia cleanse.	58.3800000000000026	\N	2	2017-12-10 22:20:07.591791	2017-12-21 18:54:45.086226	0	book_cover.png	image/png	21149	2017-12-10 22:20:07.378515	1
400	Tirra Lirra by the River 388	Schlitz carry pickled post-ironic.	60.5499999999999972	\N	2	2017-12-10 22:20:07.822993	2017-12-21 18:54:45.092369	0	book_cover.png	image/png	21149	2017-12-10 22:20:07.605608	1
401	Fair Stood the Wind for France 389	Ugh pork belly selvage flannel blue bottle intelligentsia.	48.2999999999999972	\N	4	2017-12-10 22:20:08.04075	2017-12-21 18:54:45.098215	0	book_cover.png	image/png	21149	2017-12-10 22:20:07.836368	1
402	This Lime Tree Bower 390	Neutra swag cornhole pickled.	56.4699999999999989	\N	6	2017-12-10 22:20:08.271757	2017-12-21 18:54:45.103735	0	book_cover.png	image/png	21149	2017-12-10 22:20:08.057727	1
403	The Other Side of Silence 391	Butcher irony trust fund tacos twee.	52.8800000000000026	\N	3	2017-12-10 22:20:08.500598	2017-12-21 18:54:45.109174	0	book_cover.png	image/png	21149	2017-12-10 22:20:08.281359	1
404	The Sun Also Rises 392	Venmo intelligentsia yr street salvia cred cliche art party.	57.2700000000000031	\N	4	2017-12-10 22:20:08.726175	2017-12-21 18:54:45.114821	0	book_cover.png	image/png	21149	2017-12-10 22:20:08.509514	1
405	Oh! To be in England 393	Squid tacos pickled trust fund pitchfork cliche beard scenester.	67.0699999999999932	\N	8	2017-12-10 22:20:09.047862	2017-12-21 18:54:45.120689	0	book_cover.png	image/png	21149	2017-12-10 22:20:08.7494	1
406	A Scanner Darkly 394	Next level typewriter brooklyn loko occupy.	29.8099999999999987	\N	3	2017-12-10 22:20:09.262936	2017-12-21 18:54:45.127184	0	book_cover.png	image/png	21149	2017-12-10 22:20:09.057372	1
408	Dying of the Light 396	Salvia chambray muggle magic cleanse irony kinfolk blue bottle.	27.5899999999999999	\N	5	2017-12-10 22:20:09.711715	2017-12-21 18:54:45.138891	0	book_cover.png	image/png	21149	2017-12-10 22:20:09.496856	1
409	Precious Bane 397	Pour-over godard chambray ugh fixie.	52.0900000000000034	\N	7	2017-12-10 22:20:09.92278	2017-12-21 18:54:45.144536	0	book_cover.png	image/png	21149	2017-12-10 22:20:09.720834	1
410	Specimen Days 398	Fingerstache vegan small batch crucifix celiac mustache food truck.	40.509999999999998	\N	1	2017-12-10 22:20:10.141807	2017-12-21 18:54:45.149789	0	book_cover.png	image/png	21149	2017-12-10 22:20:09.932255	1
411	Noli Me Tangere 399	Fixie poutine 3 wolf moon kitsch.	51.4200000000000017	\N	5	2017-12-10 22:20:10.372211	2017-12-21 18:54:45.155098	0	book_cover.png	image/png	21149	2017-12-10 22:20:10.152133	1
412	His Dark Materials 400	Ethical beard kickstarter waistcoat salvia hella ugh knausgaard plaid.	45.0900000000000034	\N	2	2017-12-10 22:20:10.597678	2017-12-21 18:54:45.160667	0	book_cover.png	image/png	21149	2017-12-10 22:20:10.38159	1
413	Ring of Bright Water 401	Narwhal yuccie brooklyn beard.	44.7000000000000028	\N	8	2017-12-10 22:20:10.806974	2017-12-21 18:54:45.166666	0	book_cover.png	image/png	21149	2017-12-10 22:20:10.607218	1
414	The Grapes of Wrath 402	Williamsburg banjo narwhal sustainable church-key single-origin coffee before they sold out.	16.0399999999999991	\N	5	2017-12-10 22:20:11.021345	2017-12-21 18:54:45.172331	0	book_cover.png	image/png	21149	2017-12-10 22:20:10.817928	1
415	The Last Enemy 403	Pour-over semiotics ennui humblebrag pork belly.	13.0299999999999994	\N	1	2017-12-10 22:20:11.232032	2017-12-21 18:54:45.177949	0	book_cover.png	image/png	21149	2017-12-10 22:20:11.030483	1
416	The Moon by Night 404	Stumptown tacos kickstarter pug.	51.2899999999999991	\N	3	2017-12-10 22:20:11.446932	2017-12-21 18:54:45.183473	0	book_cover.png	image/png	21149	2017-12-10 22:20:11.245344	1
417	Alone on a Wide, Wide Sea 405	Messenger bag quinoa asymmetrical offal.	41.0200000000000031	\N	1	2017-12-10 22:20:11.655438	2017-12-21 18:54:45.189015	0	book_cover.png	image/png	21149	2017-12-10 22:20:11.455909	1
418	Vanity Fair 406	Semiotics messenger bag post-ironic forage trust fund.	28.879999999999999	\N	1	2017-12-10 22:20:11.864759	2017-12-21 18:54:45.194662	0	book_cover.png	image/png	21149	2017-12-10 22:20:11.665859	1
419	An Evil Cradling 407	Cronut aesthetic art party next level photo booth selvage vhs waistcoat gentrify.	50.5900000000000034	\N	3	2017-12-10 22:20:12.072641	2017-12-21 18:54:45.200272	0	book_cover.png	image/png	21149	2017-12-10 22:20:11.87463	1
420	A Handful of Dust 408	Knausgaard viral cold-pressed iphone echo mixtape vice single-origin coffee.	24.5899999999999999	\N	6	2017-12-10 22:20:12.299123	2017-12-21 18:54:45.206396	0	book_cover.png	image/png	21149	2017-12-10 22:20:12.082669	1
422	Tiger! Tiger! 410	Viral heirloom art party cardigan squid pinterest cliche.	68.6700000000000017	\N	1	2017-12-10 22:20:12.736154	2017-12-21 18:54:45.21855	0	book_cover.png	image/png	21149	2017-12-10 22:20:12.527464	1
424	The Little Foxes 412	Semiotics lumbersexual waistcoat cleanse.	19.0799999999999983	\N	8	2017-12-10 22:20:13.171309	2017-12-21 18:54:45.230152	0	book_cover.png	image/png	21149	2017-12-10 22:20:12.965809	1
425	To Your Scattered Bodies Go 413	Iphone ramps leggings pabst echo normcore skateboard.	30.4499999999999993	\N	7	2017-12-10 22:20:13.390804	2017-12-21 18:54:45.235665	0	book_cover.png	image/png	21149	2017-12-10 22:20:13.184482	1
426	Some Buried Caesar 414	Schlitz celiac meditation venmo whatever.	40.009999999999998	\N	6	2017-12-10 22:20:13.610318	2017-12-21 18:54:45.241262	0	book_cover.png	image/png	21149	2017-12-10 22:20:13.404231	1
427	Of Mice and Men 415	Bicycle rights skateboard gastropub cliche ugh taxidermy quinoa blue bottle park.	42.3699999999999974	\N	6	2017-12-10 22:20:13.834994	2017-12-21 18:54:45.24702	0	book_cover.png	image/png	21149	2017-12-10 22:20:13.621345	1
428	Consider Phlebas 416	Mumblecore polaroid retro cliche +1 street.	56.0799999999999983	\N	8	2017-12-10 22:20:14.055703	2017-12-21 18:54:45.252246	0	book_cover.png	image/png	21149	2017-12-10 22:20:13.846732	1
429	A Time of Gifts 417	Cardigan ramps microdosing kogi chicharrones yolo heirloom schlitz tilde.	62.6899999999999977	\N	7	2017-12-10 22:20:14.280156	2017-12-21 18:54:45.25749	0	book_cover.png	image/png	21149	2017-12-10 22:20:14.070868	1
430	Paths of Glory 418	Vinyl letterpress kale chips actually narwhal chicharrones swag gluten-free viral.	35.6000000000000014	\N	8	2017-12-10 22:20:14.509278	2017-12-21 18:54:45.262624	0	book_cover.png	image/png	21149	2017-12-10 22:20:14.294699	1
431	No Longer at Ease 419	Meggings loko diy authentic.	28.7800000000000011	\N	7	2017-12-10 22:20:14.739206	2017-12-21 18:54:45.268025	0	book_cover.png	image/png	21149	2017-12-10 22:20:14.524622	1
432	A Swiftly Tilting Planet 420	Banjo diy cred pinterest fanny pack.	25.620000000000001	\N	8	2017-12-10 22:20:14.963085	2017-12-21 18:54:45.273192	0	book_cover.png	image/png	21149	2017-12-10 22:20:14.752305	1
433	Rosemary Sutcliff 421	Cliche taxidermy offal brunch.	32.2000000000000028	\N	4	2017-12-10 22:20:15.171994	2017-12-21 18:54:45.27878	0	book_cover.png	image/png	21149	2017-12-10 22:20:14.973138	1
434	No Longer at Ease 422	Blue bottle phlogiston +1 seitan 8-bit tofu.	58.3299999999999983	\N	7	2017-12-10 22:20:15.393702	2017-12-21 18:54:45.284393	0	book_cover.png	image/png	21149	2017-12-10 22:20:15.186849	1
435	The Heart Is a Lonely Hunter 423	Bitters crucifix before they sold out 3 wolf moon yolo humblebrag hammock synth.	49.25	\N	5	2017-12-10 22:20:15.613055	2017-12-21 18:54:45.290152	0	book_cover.png	image/png	21149	2017-12-10 22:20:15.406143	1
436	Recalled to Life 424	Kombucha seitan chillwave meh readymade waistcoat chambray.	44.8200000000000003	\N	2	2017-12-10 22:20:15.839656	2017-12-21 18:54:45.296118	0	book_cover.png	image/png	21149	2017-12-10 22:20:15.626327	1
437	Jacob Have I Loved 425	Letterpress try-hard selfies neutra viral intelligentsia chillwave offal meh.	16.8200000000000003	\N	1	2017-12-10 22:20:16.062367	2017-12-21 18:54:45.301908	0	book_cover.png	image/png	21149	2017-12-10 22:20:15.853938	1
438	The Sun Also Rises 426	Distillery scenester kickstarter plaid fashion axe cliche put a bird on it.	27.9400000000000013	\N	2	2017-12-10 22:20:16.308063	2017-12-21 18:54:45.307634	0	book_cover.png	image/png	21149	2017-12-10 22:20:16.075212	1
439	Have His Carcase 427	Aesthetic fingerstache everyday salvia meggings pop-up.	51.7199999999999989	\N	5	2017-12-10 22:20:16.532935	2017-12-21 18:54:45.313677	0	book_cover.png	image/png	21149	2017-12-10 22:20:16.320713	1
440	The Daffodil Sky 428	Keffiyeh hammock cronut kinfolk roof small batch +1.	60.0700000000000003	\N	6	2017-12-10 22:20:16.760587	2017-12-21 18:54:45.319359	0	book_cover.png	image/png	21149	2017-12-10 22:20:16.550319	1
441	The Yellow Meads of Asphodel 429	Food truck fixie photo booth keffiyeh.	57.1000000000000014	\N	5	2017-12-10 22:20:16.985143	2017-12-21 18:54:45.325676	0	book_cover.png	image/png	21149	2017-12-10 22:20:16.772668	1
442	The Moving Finger 430	Pug actually single-origin coffee brooklyn keffiyeh skateboard bitters.	7.70000000000000018	\N	5	2017-12-10 22:20:17.220689	2017-12-21 18:54:45.331029	0	book_cover.png	image/png	21149	2017-12-10 22:20:16.99702	1
444	The Needle's Eye 432	Park stumptown kogi pork belly kitsch.	9.00999999999999979	\N	2	2017-12-10 22:20:17.679484	2017-12-21 18:54:45.342331	0	book_cover.png	image/png	21149	2017-12-10 22:20:17.450385	1
445	The Way of All Flesh 433	Chartreuse hammock health neutra synth before they sold out readymade sartorial.	27.6099999999999994	\N	8	2017-12-10 22:20:17.958476	2017-12-21 18:54:45.347921	0	book_cover.png	image/png	21149	2017-12-10 22:20:17.696255	1
446	Carrion Comfort 434	Cred loko cray everyday drinking goth.	12.8200000000000003	\N	6	2017-12-10 22:20:18.173087	2017-12-21 18:54:45.353159	0	book_cover.png	image/png	21149	2017-12-10 22:20:17.971076	1
447	The Parliament of Man 435	Swag offal chicharrones bitters fanny pack.	45.7100000000000009	\N	5	2017-12-10 22:20:18.393737	2017-12-21 18:54:45.358662	0	book_cover.png	image/png	21149	2017-12-10 22:20:18.185087	1
448	That Good Night 436	Franzen pitchfork swag wayfarers cornhole cliche flexitarian food truck meh.	32.3800000000000026	\N	8	2017-12-10 22:20:18.638272	2017-12-21 18:54:45.364094	0	book_cover.png	image/png	21149	2017-12-10 22:20:18.40633	1
449	The Last Enemy 437	Flannel vegan vice chartreuse flexitarian poutine twee thundercats.	53	\N	3	2017-12-10 22:20:18.884857	2017-12-21 18:54:45.370103	0	book_cover.png	image/png	21149	2017-12-10 22:20:18.655547	1
450	The Little Foxes 438	Neutra kombucha mlkshk gastropub.	69.8700000000000045	\N	6	2017-12-10 22:20:19.099165	2017-12-21 18:54:45.376913	0	book_cover.png	image/png	21149	2017-12-10 22:20:18.896341	1
451	Now Sleeps the Crimson Petal 439	Roof forage umami tacos tote bag artisan.	26.2899999999999991	\N	1	2017-12-10 22:20:19.328977	2017-12-21 18:54:45.386444	0	book_cover.png	image/png	21149	2017-12-10 22:20:19.111035	1
452	An Acceptable Time 440	Slow-carb crucifix flexitarian xoxo echo tofu.	23.4499999999999993	\N	3	2017-12-10 22:20:19.571288	2017-12-21 18:54:45.394753	0	book_cover.png	image/png	21149	2017-12-10 22:20:19.341494	1
453	Taming a Sea Horse 441	Waistcoat organic chia deep v kombucha butcher vinegar flexitarian.	12.1699999999999999	\N	6	2017-12-10 22:20:19.855705	2017-12-21 18:54:45.402666	0	book_cover.png	image/png	21149	2017-12-10 22:20:19.588039	1
454	The Millstone 442	Freegan kinfolk lumbersexual gluten-free shoreditch pop-up.	13.1199999999999992	\N	1	2017-12-10 22:20:20.072489	2017-12-21 18:54:45.409268	0	book_cover.png	image/png	21149	2017-12-10 22:20:19.868329	1
455	If I Forget Thee Jerusalem 443	Selvage narwhal leggings normcore five dollar toast.	37.0200000000000031	\N	4	2017-12-10 22:20:20.296725	2017-12-21 18:54:45.414831	0	book_cover.png	image/png	21149	2017-12-10 22:20:20.085826	1
456	This Side of Paradise 444	Try-hard gastropub plaid listicle occupy literally trust fund.	51.1700000000000017	\N	6	2017-12-10 22:20:20.564574	2017-12-21 18:54:45.421531	0	book_cover.png	image/png	21149	2017-12-10 22:20:20.311015	1
457	The Other Side of Silence 445	Twee quinoa raw denim kale chips mumblecore messenger bag ennui.	29.5	\N	1	2017-12-10 22:20:20.78019	2017-12-21 18:54:45.427779	0	book_cover.png	image/png	21149	2017-12-10 22:20:20.574389	1
458	Dance Dance Dance 446	Pickled offal distillery wolf wes anderson.	51.4299999999999997	\N	1	2017-12-10 22:20:21.00804	2017-12-21 18:54:45.433468	0	book_cover.png	image/png	21149	2017-12-10 22:20:20.789349	1
651	Infinite Jest 639	Meh cornhole cardigan authentic.	12.8399999999999999	\N	3	2017-12-10 22:21:04.917792	2017-12-21 18:54:45.438748	0	book_cover.png	image/png	21149	2017-12-10 22:21:04.707162	1
460	Recalled to Life 448	Meditation etsy neutra humblebrag tousled quinoa trust fund brunch umami.	10.8599999999999994	\N	8	2017-12-10 22:20:21.46809	2017-12-21 18:54:45.449932	0	book_cover.png	image/png	21149	2017-12-10 22:20:21.253493	1
461	Endless Night 449	Pickled listicle butcher portland.	63.9699999999999989	\N	3	2017-12-10 22:20:21.701272	2017-12-21 18:54:45.455978	0	book_cover.png	image/png	21149	2017-12-10 22:20:21.48816	1
462	The Golden Bowl 450	Tacos before they sold out quinoa narwhal.	10.0999999999999996	\N	2	2017-12-10 22:20:21.941508	2017-12-21 18:54:45.462174	0	book_cover.png	image/png	21149	2017-12-10 22:20:21.710887	1
463	The Millstone 451	Austin drinking mumblecore lo-fi intelligentsia.	61.5300000000000011	\N	7	2017-12-10 22:20:22.174804	2017-12-21 18:54:45.468912	0	book_cover.png	image/png	21149	2017-12-10 22:20:21.953982	1
464	Cover Her Face 452	Kombucha tote bag tilde gastropub cornhole vhs swag.	53.7199999999999989	\N	8	2017-12-10 22:20:22.387309	2017-12-21 18:54:45.474954	0	book_cover.png	image/png	21149	2017-12-10 22:20:22.187933	1
465	What's Become of Waring 453	Tattooed bushwick tote bag microdosing pop-up pug.	51.1099999999999994	\N	2	2017-12-10 22:20:22.622462	2017-12-21 18:54:45.480606	0	book_cover.png	image/png	21149	2017-12-10 22:20:22.399432	1
466	Look to Windward 454	Offal craft beer venmo tousled 90's.	13.1199999999999992	\N	7	2017-12-10 22:20:22.837881	2017-12-21 18:54:45.486967	0	book_cover.png	image/png	21149	2017-12-10 22:20:22.635711	1
468	Dying of the Light 456	Hella raw denim distillery gentrify bushwick ugh kale chips flannel hoodie.	51.3900000000000006	\N	1	2017-12-10 22:20:23.266705	2017-12-21 18:54:45.498825	0	book_cover.png	image/png	21149	2017-12-10 22:20:23.062126	1
469	The Stars' Tennis Balls 457	Semiotics etsy typewriter messenger bag marfa.	55.3699999999999974	\N	6	2017-12-10 22:20:23.493656	2017-12-21 18:54:45.504157	0	book_cover.png	image/png	21149	2017-12-10 22:20:23.276537	1
470	A Glass of Blessings 458	Meggings vinyl franzen carry hammock drinking pickled.	36.2199999999999989	\N	2	2017-12-10 22:20:23.71408	2017-12-21 18:54:45.509579	0	book_cover.png	image/png	21149	2017-12-10 22:20:23.50321	1
471	The Last Enemy 459	Forage migas letterpress vegan fingerstache actually cardigan pug ramps.	20.4100000000000001	\N	3	2017-12-10 22:20:23.957826	2017-12-21 18:54:45.515312	0	book_cover.png	image/png	21149	2017-12-10 22:20:23.723955	1
472	For a Breath I Tarry 460	Thundercats sriracha park actually cliche ethical tattooed messenger bag.	48.9299999999999997	\N	6	2017-12-10 22:20:24.276699	2017-12-21 18:54:45.521726	0	book_cover.png	image/png	21149	2017-12-10 22:20:23.969996	1
473	Blithe Spirit 461	Pabst iphone flannel meditation pop-up kale chips.	23.3500000000000014	\N	8	2017-12-10 22:20:24.549615	2017-12-21 18:54:45.527994	0	book_cover.png	image/png	21149	2017-12-10 22:20:24.288174	1
474	Shall not Perish 462	Raw denim keffiyeh vhs yolo literally.	21.9899999999999984	\N	1	2017-12-10 22:20:24.794979	2017-12-21 18:54:45.533996	0	book_cover.png	image/png	21149	2017-12-10 22:20:24.561587	1
475	If I Forget Thee Jerusalem 463	Marfa knausgaard art party chambray.	18.9200000000000017	\N	5	2017-12-10 22:20:25.017397	2017-12-21 18:54:45.539342	0	book_cover.png	image/png	21149	2017-12-10 22:20:24.805253	1
476	Rosemary Sutcliff 464	Mlkshk normcore tumblr chartreuse tote bag flexitarian narwhal austin.	64.5400000000000063	\N	2	2017-12-10 22:20:25.25331	2017-12-21 18:54:45.545763	0	book_cover.png	image/png	21149	2017-12-10 22:20:25.02946	1
477	Infinite Jest 465	Shabby chic lomo whatever distillery cliche tilde.	37.5300000000000011	\N	4	2017-12-10 22:20:25.48165	2017-12-21 18:54:45.551825	0	book_cover.png	image/png	21149	2017-12-10 22:20:25.263462	1
478	A Handful of Dust 466	Hashtag listicle yuccie tote bag direct trade 3 wolf moon thundercats carry plaid.	24.3299999999999983	\N	6	2017-12-10 22:20:25.700015	2017-12-21 18:54:45.557542	0	book_cover.png	image/png	21149	2017-12-10 22:20:25.495812	1
479	Nectar in a Sieve 467	+1 austin actually jean shorts sriracha pabst dreamcatcher.	33.2299999999999969	\N	3	2017-12-10 22:20:25.918823	2017-12-21 18:54:45.562838	0	book_cover.png	image/png	21149	2017-12-10 22:20:25.711836	1
480	The Mirror Crack'd from Side to Side 468	Semiotics iphone viral tattooed aesthetic schlitz brunch retro.	15.9000000000000004	\N	8	2017-12-10 22:20:26.138722	2017-12-21 18:54:45.568734	0	book_cover.png	image/png	21149	2017-12-10 22:20:25.931033	1
481	To Sail Beyond the Sunset 469	Pabst selfies next level occupy cornhole fanny pack.	38.2800000000000011	\N	4	2017-12-10 22:20:26.374767	2017-12-21 18:54:45.57413	0	book_cover.png	image/png	21149	2017-12-10 22:20:26.151131	1
482	A Monstrous Regiment of Women 470	Cleanse art party 90's banh mi ugh.	22.5300000000000011	\N	3	2017-12-10 22:20:26.607897	2017-12-21 18:54:45.580223	0	book_cover.png	image/png	21149	2017-12-10 22:20:26.390522	1
483	The Parliament of Man 471	Aesthetic retro twee small batch.	8.52999999999999936	\N	7	2017-12-10 22:20:26.834391	2017-12-21 18:54:45.585589	0	book_cover.png	image/png	21149	2017-12-10 22:20:26.616945	1
484	Now Sleeps the Crimson Petal 472	Drinking blog viral health.	58.3100000000000023	\N	5	2017-12-10 22:20:27.059519	2017-12-21 18:54:45.591416	0	book_cover.png	image/png	21149	2017-12-10 22:20:26.843773	1
485	Lilies of the Field 473	Shoreditch artisan photo booth trust fund semiotics phlogiston mixtape master.	27.1000000000000014	\N	8	2017-12-10 22:20:27.290885	2017-12-21 18:54:45.596985	0	book_cover.png	image/png	21149	2017-12-10 22:20:27.068054	1
486	Time To Murder And Create 474	Farm-to-table paleo try-hard schlitz pinterest bespoke offal disrupt neutra.	21.120000000000001	\N	7	2017-12-10 22:20:27.503964	2017-12-21 18:54:45.603801	0	book_cover.png	image/png	21149	2017-12-10 22:20:27.301625	1
487	Brandy of the Damned 475	Marfa raw denim sustainable selvage mlkshk five dollar toast typewriter tattooed pitchfork.	26.8999999999999986	\N	7	2017-12-10 22:20:27.737991	2017-12-21 18:54:45.609552	0	book_cover.png	image/png	21149	2017-12-10 22:20:27.513375	1
488	A Confederacy of Dunces 476	Wolf selvage 3 wolf moon fanny pack tofu vhs everyday drinking seitan.	16.25	\N	1	2017-12-10 22:20:27.951941	2017-12-21 18:54:45.616264	0	book_cover.png	image/png	21149	2017-12-10 22:20:27.746521	1
490	Fair Stood the Wind for France 478	Cred diy tacos chicharrones 8-bit health jean shorts farm-to-table.	43.9399999999999977	\N	7	2017-12-10 22:20:28.383035	2017-12-21 18:54:45.627423	0	book_cover.png	image/png	21149	2017-12-10 22:20:28.176948	1
491	Beneath the Bleeding 479	Everyday farm-to-table lomo chillwave stumptown craft beer cornhole plaid.	68.9300000000000068	\N	2	2017-12-10 22:20:28.605834	2017-12-21 18:54:45.632846	0	book_cover.png	image/png	21149	2017-12-10 22:20:28.393878	1
492	Recalled to Life 480	Skateboard vegan asymmetrical humblebrag craft beer lo-fi semiotics.	39.1000000000000014	\N	6	2017-12-10 22:20:28.820722	2017-12-21 18:54:45.638598	0	book_cover.png	image/png	21149	2017-12-10 22:20:28.61895	1
493	Beyond the Mexique Bay 481	Crucifix cronut hoodie marfa tacos.	9.58000000000000007	\N	3	2017-12-10 22:20:29.040971	2017-12-21 18:54:45.644794	0	book_cover.png	image/png	21149	2017-12-10 22:20:28.833615	1
494	Blood's a Rover 482	Try-hard narwhal gastropub meditation aesthetic.	55.0900000000000034	\N	2	2017-12-10 22:20:29.278423	2017-12-21 18:54:45.65042	0	book_cover.png	image/png	21149	2017-12-10 22:20:29.054593	1
495	Time To Murder And Create 483	Banjo carry literally pabst selfies vegan hammock pitchfork.	36.4099999999999966	\N	6	2017-12-10 22:20:29.497647	2017-12-21 18:54:45.656912	0	book_cover.png	image/png	21149	2017-12-10 22:20:29.296798	1
496	This Side of Paradise 484	Seitan vice keffiyeh narwhal small batch tofu gastropub blog normcore.	61.1599999999999966	\N	3	2017-12-10 22:20:29.734089	2017-12-21 18:54:45.662747	0	book_cover.png	image/png	21149	2017-12-10 22:20:29.510444	1
499	When the Green Woods Laugh 487	Retro intelligentsia listicle semiotics selfies cray.	43.0799999999999983	\N	8	2017-12-10 22:20:30.418557	2017-12-21 18:54:45.673751	0	book_cover.png	image/png	21149	2017-12-10 22:20:30.184517	1
500	Endless Night 488	Schlitz try-hard yolo actually organic.	62.7000000000000028	\N	5	2017-12-10 22:20:30.634096	2017-12-21 18:54:45.679304	0	book_cover.png	image/png	21149	2017-12-10 22:20:30.428904	1
501	Brandy of the Damned 489	Wes anderson sriracha waistcoat farm-to-table.	21.6999999999999993	\N	7	2017-12-10 22:20:30.864977	2017-12-21 18:54:45.684865	0	book_cover.png	image/png	21149	2017-12-10 22:20:30.646093	1
502	Sleep the Brave 490	Gluten-free vinyl messenger bag fingerstache flannel artisan.	24.9100000000000001	\N	1	2017-12-10 22:20:31.10017	2017-12-21 18:54:45.69044	0	book_cover.png	image/png	21149	2017-12-10 22:20:30.885946	1
503	Let Us Now Praise Famous Men 491	Chia scenester mustache hella neutra 3 wolf moon.	66.7600000000000051	\N	8	2017-12-10 22:20:31.319893	2017-12-21 18:54:45.696232	0	book_cover.png	image/png	21149	2017-12-10 22:20:31.111377	1
504	Specimen Days 492	Fashion axe letterpress skateboard normcore.	21.9299999999999997	\N	3	2017-12-10 22:20:31.529371	2017-12-21 18:54:45.701925	0	book_cover.png	image/png	21149	2017-12-10 22:20:31.329272	1
505	The Lathe of Heaven 493	Poutine slow-carb quinoa craft beer.	45.1199999999999974	\N	4	2017-12-10 22:20:31.745216	2017-12-21 18:54:45.707993	0	book_cover.png	image/png	21149	2017-12-10 22:20:31.537831	1
507	Tirra Lirra by the River 495	Xoxo bicycle rights flannel venmo trust fund pabst stumptown carry celiac.	8.33000000000000007	\N	1	2017-12-10 22:20:32.183573	2017-12-21 18:54:45.72009	0	book_cover.png	image/png	21149	2017-12-10 22:20:31.96631	1
508	The Mermaids Singing 496	Banjo scenester polaroid wolf pbr&b.	31.7899999999999991	\N	6	2017-12-10 22:20:32.395782	2017-12-21 18:54:45.735552	0	book_cover.png	image/png	21149	2017-12-10 22:20:32.193965	1
509	Things Fall Apart 497	Thundercats 3 wolf moon schlitz vhs muggle magic organic cold-pressed sustainable.	66.9699999999999989	\N	3	2017-12-10 22:20:32.608201	2017-12-21 18:54:45.74106	0	book_cover.png	image/png	21149	2017-12-10 22:20:32.408188	1
510	I Sing the Body Electric 498	Pitchfork cronut ethical kitsch etsy flexitarian.	33.3500000000000014	\N	4	2017-12-10 22:20:32.832876	2017-12-21 18:54:45.747842	0	book_cover.png	image/png	21149	2017-12-10 22:20:32.619227	1
511	No Longer at Ease 499	Photo booth leggings single-origin coffee craft beer distillery.	57.5600000000000023	\N	4	2017-12-10 22:20:33.069822	2017-12-21 18:54:45.754227	0	book_cover.png	image/png	21149	2017-12-10 22:20:32.842801	1
512	Mother Night 500	Pabst gentrify trust fund you probably haven't heard of them vice scenester kale chips drinking.	52.1700000000000017	\N	7	2017-12-10 22:20:33.2987	2017-12-21 18:54:45.760348	0	book_cover.png	image/png	21149	2017-12-10 22:20:33.079673	1
513	The Painted Veil 501	Freegan try-hard truffaut artisan kitsch waistcoat cronut.	68.5300000000000011	\N	6	2017-12-10 22:20:33.514645	2017-12-21 18:54:45.766182	0	book_cover.png	image/png	21149	2017-12-10 22:20:33.308118	1
514	Recalled to Life 502	Art party viral cleanse trust fund.	7.55999999999999961	\N	1	2017-12-10 22:20:33.744649	2017-12-21 18:54:45.771891	0	book_cover.png	image/png	21149	2017-12-10 22:20:33.52689	1
515	The Soldier's Art 503	Thundercats ugh goth kombucha.	59.3400000000000034	\N	1	2017-12-10 22:20:33.972883	2017-12-21 18:54:45.777743	0	book_cover.png	image/png	21149	2017-12-10 22:20:33.757054	1
516	This Lime Tree Bower 504	Bushwick meditation beard chartreuse typewriter green juice.	22.2300000000000004	\N	4	2017-12-10 22:20:34.188916	2017-12-21 18:54:45.783505	0	book_cover.png	image/png	21149	2017-12-10 22:20:33.982784	1
517	The Golden Bowl 505	Carry freegan church-key hammock.	36.2700000000000031	\N	3	2017-12-10 22:20:34.412238	2017-12-21 18:54:45.789283	0	book_cover.png	image/png	21149	2017-12-10 22:20:34.203575	1
518	The Last Temptation 506	Lomo direct trade salvia trust fund 3 wolf moon poutine.	30.6700000000000017	\N	6	2017-12-10 22:20:34.633583	2017-12-21 18:54:45.795572	0	book_cover.png	image/png	21149	2017-12-10 22:20:34.422184	1
519	In Dubious Battle 507	Hella cardigan carry raw denim freegan chartreuse vice.	32.6400000000000006	\N	7	2017-12-10 22:20:34.862183	2017-12-21 18:54:45.806102	0	book_cover.png	image/png	21149	2017-12-10 22:20:34.647511	1
520	The Millstone 508	Slow-carb neutra asymmetrical whatever roof actually wolf gastropub twee.	35.2800000000000011	\N	6	2017-12-10 22:20:35.080966	2017-12-21 18:54:45.816652	0	book_cover.png	image/png	21149	2017-12-10 22:20:34.872047	1
521	Arms and the Man 509	Migas blue bottle vinegar hammock try-hard bitters dreamcatcher.	44.1000000000000014	\N	1	2017-12-10 22:20:35.300821	2017-12-21 18:54:45.826601	0	book_cover.png	image/png	21149	2017-12-10 22:20:35.092486	1
523	This Side of Paradise 511	Tilde beard meh 3 wolf moon trust fund bicycle rights.	23.2800000000000011	\N	7	2017-12-10 22:20:35.744142	2017-12-21 18:54:45.847108	0	book_cover.png	image/png	21149	2017-12-10 22:20:35.531078	1
524	Some Buried Caesar 512	Hammock wolf actually stumptown taxidermy.	51.7100000000000009	\N	3	2017-12-10 22:20:35.984894	2017-12-21 18:54:45.856799	0	book_cover.png	image/png	21149	2017-12-10 22:20:35.753942	1
525	Let Us Now Praise Famous Men 513	Cray post-ironic waistcoat williamsburg.	54.0399999999999991	\N	5	2017-12-10 22:20:36.208791	2017-12-21 18:54:45.866437	0	book_cover.png	image/png	21149	2017-12-10 22:20:35.994514	1
526	The Last Enemy 514	Wayfarers forage meditation blue bottle.	50.9699999999999989	\N	6	2017-12-10 22:20:36.423434	2017-12-21 18:54:45.884134	0	book_cover.png	image/png	21149	2017-12-10 22:20:36.218004	1
527	The Skull Beneath the Skin 515	Phlogiston chambray next level jean shorts.	16.8900000000000006	\N	4	2017-12-10 22:20:36.658697	2017-12-21 18:54:45.894659	0	book_cover.png	image/png	21149	2017-12-10 22:20:36.433437	1
528	The Far-Distant Oxus 516	Twee biodiesel sustainable semiotics.	64.2000000000000028	\N	1	2017-12-10 22:20:36.889464	2017-12-21 18:54:45.903221	0	book_cover.png	image/png	21149	2017-12-10 22:20:36.672061	1
529	All the King's Men 517	Irony meh gentrify trust fund cleanse shabby chic ennui listicle butcher.	66.9599999999999937	\N	6	2017-12-10 22:20:37.13156	2017-12-21 18:54:45.909073	0	book_cover.png	image/png	21149	2017-12-10 22:20:36.899387	1
530	By Grand Central Station I Sat Down and Wept 518	Dreamcatcher kogi church-key yolo pour-over austin semiotics etsy.	60.509999999999998	\N	7	2017-12-10 22:20:37.45539	2017-12-21 18:54:45.915293	0	book_cover.png	image/png	21149	2017-12-10 22:20:37.142233	1
531	The World, the Flesh and the Devil 519	Lumbersexual retro blue bottle kombucha fingerstache cred.	24.9400000000000013	\N	4	2017-12-10 22:20:37.674345	2017-12-21 18:54:45.921214	0	book_cover.png	image/png	21149	2017-12-10 22:20:37.466533	1
532	Ah, Wilderness! 520	Small batch wayfarers truffaut hammock intelligentsia.	67.8900000000000006	\N	4	2017-12-10 22:20:37.901372	2017-12-21 18:54:45.927004	0	book_cover.png	image/png	21149	2017-12-10 22:20:37.689805	1
533	In Death Ground 521	Sustainable bespoke leggings dreamcatcher pabst pour-over.	59.7199999999999989	\N	6	2017-12-10 22:20:38.125361	2017-12-21 18:54:45.932619	0	book_cover.png	image/png	21149	2017-12-10 22:20:37.911377	1
534	Jacob Have I Loved 522	Cray bicycle rights umami heirloom.	52.75	\N	3	2017-12-10 22:20:38.348128	2017-12-21 18:54:45.941023	0	book_cover.png	image/png	21149	2017-12-10 22:20:38.135382	1
535	Clouds of Witness 523	Trust fund heirloom bicycle rights salvia flexitarian green juice you probably haven't heard of them.	40.7999999999999972	\N	8	2017-12-10 22:20:38.568636	2017-12-21 18:54:45.95032	0	book_cover.png	image/png	21149	2017-12-10 22:20:38.357042	1
536	The Road Less Traveled 524	Tacos ennui direct trade try-hard forage.	34.7100000000000009	\N	2	2017-12-10 22:20:38.783244	2017-12-21 18:54:45.960014	0	book_cover.png	image/png	21149	2017-12-10 22:20:38.577682	1
538	Butter In a Lordly Dish 526	Small batch kitsch cliche cred trust fund jean shorts cold-pressed 90's.	67.3100000000000023	\N	6	2017-12-10 22:20:39.312265	2017-12-21 18:54:45.979925	0	book_cover.png	image/png	21149	2017-12-10 22:20:39.109801	1
539	In a Glass Darkly 527	Neutra master letterpress vice flexitarian listicle.	65.730000000000004	\N	8	2017-12-10 22:20:39.543136	2017-12-21 18:54:45.989715	0	book_cover.png	image/png	21149	2017-12-10 22:20:39.32228	1
540	Eyeless in Gaza 528	Hashtag yuccie wayfarers cornhole.	16	\N	8	2017-12-10 22:20:39.766193	2017-12-21 18:54:45.999783	0	book_cover.png	image/png	21149	2017-12-10 22:20:39.552194	1
541	The House of Mirth 529	Cronut direct trade sartorial keffiyeh chambray everyday.	17.4899999999999984	\N	4	2017-12-10 22:20:39.983044	2017-12-21 18:54:46.009338	0	book_cover.png	image/png	21149	2017-12-10 22:20:39.776511	1
543	Jesting Pilate 531	Gentrify pitchfork cold-pressed pinterest hella distillery schlitz knausgaard.	43.6499999999999986	\N	4	2017-12-10 22:20:40.419483	2017-12-21 18:54:46.029607	0	book_cover.png	image/png	21149	2017-12-10 22:20:40.207488	1
544	When the Green Woods Laugh 532	Five dollar toast locavore tumblr vinyl shabby chic small batch master roof humblebrag.	66.3599999999999994	\N	1	2017-12-10 22:20:40.640731	2017-12-21 18:54:46.039928	0	book_cover.png	image/png	21149	2017-12-10 22:20:40.428734	1
545	Clouds of Witness 533	Organic portland hella cray.	12.5700000000000003	\N	3	2017-12-10 22:20:40.860612	2017-12-21 18:54:46.05064	0	book_cover.png	image/png	21149	2017-12-10 22:20:40.650791	1
546	Blue Remembered Earth 534	3 wolf moon viral trust fund whatever mixtape wolf.	37.7800000000000011	\N	6	2017-12-10 22:20:41.069386	2017-12-21 18:54:46.06083	0	book_cover.png	image/png	21149	2017-12-10 22:20:40.869736	1
547	Those Barren Leaves, Thrones, Dominations 535	Gastropub yolo umami hella blog keytar deep v raw denim food truck.	48.9200000000000017	\N	7	2017-12-10 22:20:41.288345	2017-12-21 18:54:46.070623	0	book_cover.png	image/png	21149	2017-12-10 22:20:41.078715	1
548	To a God Unknown 536	You probably haven't heard of them intelligentsia crucifix mustache wolf artisan literally.	51.759999999999998	\N	3	2017-12-10 22:20:41.501112	2017-12-21 18:54:46.079922	0	book_cover.png	image/png	21149	2017-12-10 22:20:41.297522	1
549	The Moon by Night 537	Hashtag shoreditch tote bag organic health banh mi.	64.519999999999996	\N	6	2017-12-10 22:20:41.738856	2017-12-21 18:54:46.089216	0	book_cover.png	image/png	21149	2017-12-10 22:20:41.511034	1
550	A Many-Splendoured Thing 538	Sustainable vhs trust fund williamsburg.	39.7000000000000028	\N	2	2017-12-10 22:20:42.003432	2017-12-21 18:54:46.098164	0	book_cover.png	image/png	21149	2017-12-10 22:20:41.7578	1
551	A Summer Bird-Cage 539	Phlogiston williamsburg meggings cred.	47.4299999999999997	\N	2	2017-12-10 22:20:42.217546	2017-12-21 18:54:46.107604	0	book_cover.png	image/png	21149	2017-12-10 22:20:42.014291	1
552	If Not Now, When? 540	Marfa fashion axe hella shoreditch next level microdosing disrupt plaid.	66.4899999999999949	\N	2	2017-12-10 22:20:42.434492	2017-12-21 18:54:46.117057	0	book_cover.png	image/png	21149	2017-12-10 22:20:42.227085	1
553	The Torment of Others 541	Vinyl 3 wolf moon kinfolk health waistcoat heirloom pinterest stumptown.	9.65000000000000036	\N	7	2017-12-10 22:20:42.668614	2017-12-21 18:54:46.127127	0	book_cover.png	image/png	21149	2017-12-10 22:20:42.44303	1
554	What's Become of Waring 542	Etsy whatever cliche actually poutine vice knausgaard fingerstache blog.	38.1700000000000017	\N	1	2017-12-10 22:20:42.882536	2017-12-21 18:54:46.137441	0	book_cover.png	image/png	21149	2017-12-10 22:20:42.676752	1
555	Absalom, Absalom! 543	Cornhole ennui thundercats +1 messenger bag gluten-free truffaut cronut twee.	11.4600000000000009	\N	2	2017-12-10 22:20:43.100817	2017-12-21 18:54:46.147156	0	book_cover.png	image/png	21149	2017-12-10 22:20:42.890892	1
556	A Handful of Dust 544	Hoodie actually tumblr brunch knausgaard cronut chia.	51.0399999999999991	\N	6	2017-12-10 22:20:43.323481	2017-12-21 18:54:46.157317	0	book_cover.png	image/png	21149	2017-12-10 22:20:43.10949	1
557	The Little Foxes 545	Readymade lomo 8-bit ramps wayfarers.	39.3699999999999974	\N	4	2017-12-10 22:20:43.546943	2017-12-21 18:54:46.166842	0	book_cover.png	image/png	21149	2017-12-10 22:20:43.33342	1
558	Beyond the Mexique Bay 546	Etsy williamsburg food truck swag truffaut.	63.1499999999999986	\N	3	2017-12-10 22:20:43.765523	2017-12-21 18:54:46.176269	0	book_cover.png	image/png	21149	2017-12-10 22:20:43.555878	1
559	Ego Dominus Tuus 547	Cold-pressed 8-bit 3 wolf moon tote bag cronut shoreditch.	16.0100000000000016	\N	3	2017-12-10 22:20:44.005837	2017-12-21 18:54:46.185701	0	book_cover.png	image/png	21149	2017-12-10 22:20:43.774263	1
560	The Waste Land 548	Craft beer neutra tattooed brunch five dollar toast.	18.2699999999999996	\N	2	2017-12-10 22:20:44.227818	2017-12-21 18:54:46.195434	0	book_cover.png	image/png	21149	2017-12-10 22:20:44.014342	1
561	An Evil Cradling 549	Blue bottle gluten-free roof kale chips lo-fi schlitz hoodie put a bird on it.	68.0600000000000023	\N	5	2017-12-10 22:20:44.46241	2017-12-21 18:54:46.20462	0	book_cover.png	image/png	21149	2017-12-10 22:20:44.236719	1
562	Arms and the Man 550	90's actually irony narwhal sriracha williamsburg occupy farm-to-table squid.	22.129999999999999	\N	8	2017-12-10 22:20:44.693788	2017-12-21 18:54:46.214677	0	book_cover.png	image/png	21149	2017-12-10 22:20:44.473801	1
563	Have His Carcase 551	Bushwick disrupt swag sartorial green juice literally hoodie microdosing.	65.6500000000000057	\N	8	2017-12-10 22:20:44.912135	2017-12-21 18:54:46.224893	0	book_cover.png	image/png	21149	2017-12-10 22:20:44.70343	1
564	A Time to Kill 552	Chambray park fixie cornhole microdosing iphone offal mustache.	39.7199999999999989	\N	2	2017-12-10 22:20:45.138146	2017-12-21 18:54:46.234789	0	book_cover.png	image/png	21149	2017-12-10 22:20:44.921748	1
565	An Evil Cradling 553	Paleo chia semiotics cray.	30.3299999999999983	\N	2	2017-12-10 22:20:45.388796	2017-12-21 18:54:46.246899	0	book_cover.png	image/png	21149	2017-12-10 22:20:45.147446	1
566	Wildfire at Midnight 554	Leggings fanny pack carry chillwave heirloom kogi.	59.4399999999999977	\N	7	2017-12-10 22:20:45.608639	2017-12-21 18:54:46.257757	0	book_cover.png	image/png	21149	2017-12-10 22:20:45.398504	1
567	The Skull Beneath the Skin 555	Freegan tattooed cred fixie.	33.6599999999999966	\N	7	2017-12-10 22:20:45.845327	2017-12-21 18:54:46.268308	0	book_cover.png	image/png	21149	2017-12-10 22:20:45.619166	1
568	The Moon by Night 556	Stumptown pinterest franzen raw denim.	37.8299999999999983	\N	4	2017-12-10 22:20:46.073475	2017-12-21 18:54:46.278163	0	book_cover.png	image/png	21149	2017-12-10 22:20:45.867191	1
570	The Painted Veil 558	You probably haven't heard of them kale chips deep v art party raw denim tousled literally tacos.	64.1500000000000057	\N	8	2017-12-10 22:20:46.552484	2017-12-21 18:54:46.298439	0	book_cover.png	image/png	21149	2017-12-10 22:20:46.318178	1
571	Françoise Sagan 559	Listicle farm-to-table craft beer paleo post-ironic.	67.3499999999999943	\N	1	2017-12-10 22:20:46.790359	2017-12-21 18:54:46.308665	0	book_cover.png	image/png	21149	2017-12-10 22:20:46.567218	1
572	The Doors of Perception 560	Selvage xoxo roof mustache before they sold out.	54.7800000000000011	\N	7	2017-12-10 22:20:47.011858	2017-12-21 18:54:46.319248	0	book_cover.png	image/png	21149	2017-12-10 22:20:46.803576	1
573	Where Angels Fear to Tread 561	Fanny pack asymmetrical actually meggings 8-bit loko schlitz truffaut.	23.3500000000000014	\N	8	2017-12-10 22:20:47.228514	2017-12-21 18:54:46.329655	0	book_cover.png	image/png	21149	2017-12-10 22:20:47.024574	1
574	Now Sleeps the Crimson Petal 562	Polaroid pour-over swag mumblecore mixtape thundercats.	19.0799999999999983	\N	5	2017-12-10 22:20:47.472725	2017-12-21 18:54:46.340085	0	book_cover.png	image/png	21149	2017-12-10 22:20:47.252139	1
576	Terrible Swift Sword 564	Cleanse lumbersexual salvia jean shorts roof literally selfies authentic swag.	64.1599999999999966	\N	3	2017-12-10 22:20:47.931665	2017-12-21 18:54:46.359047	0	book_cover.png	image/png	21149	2017-12-10 22:20:47.71838	1
577	Mr Standfast 565	Next level sartorial ramps 8-bit yuccie.	65.75	\N	4	2017-12-10 22:20:48.151217	2017-12-21 18:54:46.369023	0	book_cover.png	image/png	21149	2017-12-10 22:20:47.944048	1
578	The Road Less Traveled 566	Typewriter chambray 3 wolf moon asymmetrical mixtape bicycle rights.	53.9399999999999977	\N	4	2017-12-10 22:20:48.360281	2017-12-21 18:54:46.378592	0	book_cover.png	image/png	21149	2017-12-10 22:20:48.161305	1
579	Rosemary Sutcliff 567	Paleo ethical literally fashion axe kickstarter art party viral photo booth.	40.8900000000000006	\N	7	2017-12-10 22:20:48.571205	2017-12-21 18:54:46.39103	0	book_cover.png	image/png	21149	2017-12-10 22:20:48.372349	1
580	The Waste Land 568	Franzen keytar kogi fixie schlitz.	61.3200000000000003	\N	6	2017-12-10 22:20:48.800714	2017-12-21 18:54:46.40253	0	book_cover.png	image/png	21149	2017-12-10 22:20:48.580488	1
581	Fame Is the Spur 569	Ethical photo booth craft beer wolf keffiyeh pork belly.	38.1099999999999994	\N	1	2017-12-10 22:20:49.023716	2017-12-21 18:54:46.412677	0	book_cover.png	image/png	21149	2017-12-10 22:20:48.809721	1
582	The Millstone 570	Portland chillwave pour-over kinfolk synth cronut.	17.3099999999999987	\N	7	2017-12-10 22:20:49.242874	2017-12-21 18:54:46.423254	0	book_cover.png	image/png	21149	2017-12-10 22:20:49.032836	1
583	Ah, Wilderness! 571	Tattooed everyday humblebrag chicharrones 3 wolf moon gluten-free vhs keffiyeh shoreditch.	7.37999999999999989	\N	8	2017-12-10 22:20:49.480917	2017-12-21 18:54:46.434533	0	book_cover.png	image/png	21149	2017-12-10 22:20:49.252344	1
584	Gone with the Wind 572	Kombucha photo booth yolo retro poutine meggings bespoke 8-bit.	45.1199999999999974	\N	1	2017-12-10 22:20:49.703778	2017-12-21 18:54:46.446167	0	book_cover.png	image/png	21149	2017-12-10 22:20:49.492936	1
586	A Monstrous Regiment of Women 574	Poutine farm-to-table street pour-over.	25.3000000000000007	\N	6	2017-12-10 22:20:50.202487	2017-12-21 18:54:46.466364	0	book_cover.png	image/png	21149	2017-12-10 22:20:49.990149	1
587	Death Be Not Proud 575	Wayfarers farm-to-table synth blog.	60.0200000000000031	\N	1	2017-12-10 22:20:50.417409	2017-12-21 18:54:46.476544	0	book_cover.png	image/png	21149	2017-12-10 22:20:50.211811	1
588	Beneath the Bleeding 576	Hoodie semiotics vinegar hammock echo.	64.4000000000000057	\N	6	2017-12-10 22:20:50.637389	2017-12-21 18:54:46.486744	0	book_cover.png	image/png	21149	2017-12-10 22:20:50.428312	1
589	Jesting Pilate 577	Stumptown taxidermy schlitz listicle.	34.5499999999999972	\N	5	2017-12-10 22:20:50.885153	2017-12-21 18:54:46.498389	0	book_cover.png	image/png	21149	2017-12-10 22:20:50.650952	1
590	Butter In a Lordly Dish 578	Selfies gentrify shabby chic intelligentsia five dollar toast loko irony.	22.4200000000000017	\N	3	2017-12-10 22:20:51.109619	2017-12-21 18:54:46.506286	0	book_cover.png	image/png	21149	2017-12-10 22:20:50.897346	1
591	Mother Night 579	Etsy carry narwhal cardigan scenester locavore flannel 8-bit.	44.3900000000000006	\N	8	2017-12-10 22:20:51.375552	2017-12-21 18:54:46.513586	0	book_cover.png	image/png	21149	2017-12-10 22:20:51.126741	1
592	A Swiftly Tilting Planet 580	Tofu artisan dreamcatcher distillery you probably haven't heard of them paleo.	38.3100000000000023	\N	3	2017-12-10 22:20:51.589702	2017-12-21 18:54:46.521534	0	book_cover.png	image/png	21149	2017-12-10 22:20:51.384806	1
593	The Yellow Meads of Asphodel 581	Pinterest raw denim diy banjo chia wolf chambray aesthetic leggings.	37.1300000000000026	\N	8	2017-12-10 22:20:51.812804	2017-12-21 18:54:46.533248	0	book_cover.png	image/png	21149	2017-12-10 22:20:51.598332	1
594	Consider Phlebas 582	Poutine yolo freegan selfies loko vegan.	30.0799999999999983	\N	6	2017-12-10 22:20:52.047272	2017-12-21 18:54:46.543999	0	book_cover.png	image/png	21149	2017-12-10 22:20:51.82251	1
595	The Last Enemy 583	Banh mi blue bottle fixie fashion axe kitsch kale chips.	44.7700000000000031	\N	8	2017-12-10 22:20:52.2783	2017-12-21 18:54:46.554621	0	book_cover.png	image/png	21149	2017-12-10 22:20:52.060432	1
596	Dulce et Decorum Est 584	Vinegar yolo kale chips retro vice chartreuse.	69.519999999999996	\N	7	2017-12-10 22:20:52.492926	2017-12-21 18:54:46.565856	0	book_cover.png	image/png	21149	2017-12-10 22:20:52.287843	1
597	To Sail Beyond the Sunset 585	Bespoke fingerstache shabby chic chartreuse church-key fanny pack bitters raw denim.	33.8800000000000026	\N	6	2017-12-10 22:20:52.732059	2017-12-21 18:54:46.575923	0	book_cover.png	image/png	21149	2017-12-10 22:20:52.501956	1
598	Vile Bodies 586	Tilde cold-pressed plaid master tofu keytar.	58.25	\N	4	2017-12-10 22:20:52.947267	2017-12-21 18:54:46.585963	0	book_cover.png	image/png	21149	2017-12-10 22:20:52.744475	1
599	The Millstone 587	Everyday butcher chartreuse wes anderson whatever pug single-origin coffee chillwave beard.	29	\N	5	2017-12-10 22:20:53.159929	2017-12-21 18:54:46.596333	0	book_cover.png	image/png	21149	2017-12-10 22:20:52.956524	1
600	To Your Scattered Bodies Go 588	Raw denim bespoke normcore tousled williamsburg 3 wolf moon blog.	31.9899999999999984	\N	5	2017-12-10 22:20:53.390059	2017-12-21 18:54:46.607632	0	book_cover.png	image/png	21149	2017-12-10 22:20:53.169898	1
601	Ah, Wilderness! 589	Artisan xoxo jean shorts fanny pack yolo chicharrones bespoke chia.	28.9899999999999984	\N	3	2017-12-10 22:20:53.616345	2017-12-21 18:54:46.618071	0	book_cover.png	image/png	21149	2017-12-10 22:20:53.39963	1
602	No Country for Old Men 590	Fashion axe tousled irony tilde pbr&b.	18.0599999999999987	\N	4	2017-12-10 22:20:53.827761	2017-12-21 18:54:46.628524	0	book_cover.png	image/png	21149	2017-12-10 22:20:53.625315	1
604	Vanity Fair 592	Drinking listicle wayfarers sriracha schlitz echo gluten-free pug vegan.	35.1899999999999977	\N	2	2017-12-10 22:20:54.289787	2017-12-21 18:54:46.649215	0	book_cover.png	image/png	21149	2017-12-10 22:20:54.067232	1
605	Absalom, Absalom! 593	Waistcoat pabst messenger bag listicle trust fund polaroid flexitarian drinking tilde.	28.7600000000000016	\N	7	2017-12-10 22:20:54.512026	2017-12-21 18:54:46.659378	0	book_cover.png	image/png	21149	2017-12-10 22:20:54.302175	1
606	The Wings of the Dove 594	Microdosing vinegar xoxo cred meggings authentic.	46.6899999999999977	\N	7	2017-12-10 22:20:54.727486	2017-12-21 18:54:46.669992	0	book_cover.png	image/png	21149	2017-12-10 22:20:54.521279	1
607	Consider the Lilies 595	Waistcoat banh mi pitchfork helvetica meh ugh cleanse umami.	20.5599999999999987	\N	5	2017-12-10 22:20:54.934689	2017-12-21 18:54:46.679966	0	book_cover.png	image/png	21149	2017-12-10 22:20:54.73758	1
608	Paths of Glory 596	Polaroid gentrify tumblr waistcoat street kickstarter scenester food truck.	48.6300000000000026	\N	2	2017-12-10 22:20:55.156249	2017-12-21 18:54:46.68932	0	book_cover.png	image/png	21149	2017-12-10 22:20:54.945025	1
609	To Say Nothing of the Dog 597	Tumblr slow-carb bushwick hoodie.	49.5600000000000023	\N	2	2017-12-10 22:20:55.370178	2017-12-21 18:54:46.6991	0	book_cover.png	image/png	21149	2017-12-10 22:20:55.1698	1
610	The Needle's Eye 598	Authentic selfies put a bird on it banh mi twee cardigan.	60.6300000000000026	\N	3	2017-12-10 22:20:55.644775	2017-12-21 18:54:46.708566	0	book_cover.png	image/png	21149	2017-12-10 22:20:55.382796	1
611	Jesting Pilate 599	Hashtag kombucha retro brooklyn cray 90's phlogiston.	29.9800000000000004	\N	6	2017-12-10 22:20:55.873879	2017-12-21 18:54:46.718729	0	book_cover.png	image/png	21149	2017-12-10 22:20:55.661318	1
612	Stranger in a Strange Land 600	Scenester offal readymade distillery gastropub tote bag master.	31.3000000000000007	\N	8	2017-12-10 22:20:56.102102	2017-12-21 18:54:46.728172	0	book_cover.png	image/png	21149	2017-12-10 22:20:55.887329	1
614	Many Waters 602	Ethical kombucha xoxo asymmetrical carry vice.	69.269999999999996	\N	3	2017-12-10 22:20:56.555434	2017-12-21 18:54:46.748105	0	book_cover.png	image/png	21149	2017-12-10 22:20:56.336609	1
615	The Cricket on the Hearth 603	Food truck franzen jean shorts forage poutine butcher pickled five dollar toast.	19.6099999999999994	\N	2	2017-12-10 22:20:56.804448	2017-12-21 18:54:46.75839	0	book_cover.png	image/png	21149	2017-12-10 22:20:56.569894	1
616	Consider Phlebas 604	Banh mi lomo bicycle rights pug keytar tote bag.	65.9399999999999977	\N	7	2017-12-10 22:20:57.022777	2017-12-21 18:54:46.767965	0	book_cover.png	image/png	21149	2017-12-10 22:20:56.81796	1
617	Fear and Trembling 605	Sustainable you probably haven't heard of them pickled truffaut umami.	25.0899999999999999	\N	5	2017-12-10 22:20:57.248725	2017-12-21 18:54:46.778706	0	book_cover.png	image/png	21149	2017-12-10 22:20:57.035536	1
618	A Many-Splendoured Thing 606	Gluten-free crucifix humblebrag goth roof mlkshk offal retro.	66.9899999999999949	\N	6	2017-12-10 22:20:57.47281	2017-12-21 18:54:46.789364	0	book_cover.png	image/png	21149	2017-12-10 22:20:57.261229	1
619	The House of Mirth 607	Twee health listicle tofu distillery try-hard pbr&b art party +1.	68.5400000000000063	\N	7	2017-12-10 22:20:57.689733	2017-12-21 18:54:46.800297	0	book_cover.png	image/png	21149	2017-12-10 22:20:57.485513	1
620	The Moving Finger 608	Brunch austin everyday farm-to-table tote bag.	39.7100000000000009	\N	4	2017-12-10 22:20:57.933609	2017-12-21 18:54:46.811468	0	book_cover.png	image/png	21149	2017-12-10 22:20:57.702102	1
621	Brandy of the Damned 609	Vice chicharrones synth post-ironic.	56.2999999999999972	\N	2	2017-12-10 22:20:58.14492	2017-12-21 18:54:46.822566	0	book_cover.png	image/png	21149	2017-12-10 22:20:57.943328	1
622	The Violent Bear It Away 610	Tumblr hammock pbr&b crucifix vhs narwhal pickled freegan.	57.4600000000000009	\N	4	2017-12-10 22:20:58.362107	2017-12-21 18:54:46.832314	0	book_cover.png	image/png	21149	2017-12-10 22:20:58.160497	1
624	For Whom the Bell Tolls 612	Butcher semiotics godard loko truffaut mumblecore synth pickled park.	41.8800000000000026	\N	1	2017-12-10 22:20:58.803945	2017-12-21 18:54:46.85156	0	book_cover.png	image/png	21149	2017-12-10 22:20:58.600002	1
625	Specimen Days 613	Green juice mlkshk disrupt lo-fi fanny pack meditation.	10.8900000000000006	\N	8	2017-12-10 22:20:59.024029	2017-12-21 18:54:46.86102	0	book_cover.png	image/png	21149	2017-12-10 22:20:58.821475	1
626	The Other Side of Silence 614	Selfies cold-pressed loko pabst hashtag vhs.	62.1099999999999994	\N	3	2017-12-10 22:20:59.250346	2017-12-21 18:54:46.871037	0	book_cover.png	image/png	21149	2017-12-10 22:20:59.039585	1
627	Carrion Comfort 615	Meditation vice fanny pack schlitz diy slow-carb try-hard wayfarers mixtape.	7.46999999999999975	\N	5	2017-12-10 22:20:59.488895	2017-12-21 18:54:46.88191	0	book_cover.png	image/png	21149	2017-12-10 22:20:59.26098	1
628	The Last Enemy 616	Phlogiston vhs post-ironic quinoa.	9.33000000000000007	\N	7	2017-12-10 22:20:59.706027	2017-12-21 18:54:46.893235	0	book_cover.png	image/png	21149	2017-12-10 22:20:59.50167	1
629	I Know Why the Caged Bird Sings 617	Everyday humblebrag cray bushwick post-ironic drinking.	25.6700000000000017	\N	8	2017-12-10 22:20:59.915387	2017-12-21 18:54:46.903633	0	book_cover.png	image/png	21149	2017-12-10 22:20:59.716339	1
630	The Torment of Others 618	Hoodie cold-pressed beard etsy letterpress godard 90's goth.	35.6599999999999966	\N	5	2017-12-10 22:21:00.131306	2017-12-21 18:54:46.915073	0	book_cover.png	image/png	21149	2017-12-10 22:20:59.93008	1
631	To Your Scattered Bodies Go 619	Everyday ramps goth tofu cray celiac letterpress diy meggings.	67.3700000000000045	\N	4	2017-12-10 22:21:00.34529	2017-12-21 18:54:46.923076	0	book_cover.png	image/png	21149	2017-12-10 22:21:00.143631	1
632	A Handful of Dust 620	Leggings williamsburg meditation pbr&b twee goth schlitz flannel.	35.1099999999999994	\N	5	2017-12-10 22:21:00.587143	2017-12-21 18:54:46.929818	0	book_cover.png	image/png	21149	2017-12-10 22:21:00.35955	1
633	A Swiftly Tilting Planet 621	Keytar lo-fi echo deep v whatever letterpress swag farm-to-table you probably haven't heard of them.	18	\N	7	2017-12-10 22:21:00.826983	2017-12-21 18:54:46.935849	0	book_cover.png	image/png	21149	2017-12-10 22:21:00.599688	1
634	The Wind's Twelve Quarters 622	Bespoke ugh iphone post-ironic.	42.1300000000000026	\N	3	2017-12-10 22:21:01.051614	2017-12-21 18:54:46.941675	0	book_cover.png	image/png	21149	2017-12-10 22:21:00.840176	1
635	The Green Bay Tree 623	Xoxo jean shorts poutine occupy yuccie fanny pack.	10.8200000000000003	\N	8	2017-12-10 22:21:01.269958	2017-12-21 18:54:46.947221	0	book_cover.png	image/png	21149	2017-12-10 22:21:01.064562	1
636	Waiting for the Barbarians 624	Neutra occupy normcore offal tofu readymade.	66.1200000000000045	\N	4	2017-12-10 22:21:01.503774	2017-12-21 18:54:46.953341	0	book_cover.png	image/png	21149	2017-12-10 22:21:01.282122	1
637	Françoise Sagan 625	Bespoke vegan pop-up freegan tilde neutra farm-to-table pbr&b messenger bag.	22.2399999999999984	\N	2	2017-12-10 22:21:01.73404	2017-12-21 18:54:46.958969	0	book_cover.png	image/png	21149	2017-12-10 22:21:01.516087	1
638	The Parliament of Man 626	Fixie salvia authentic tumblr letterpress pinterest sriracha tote bag franzen.	61.6499999999999986	\N	7	2017-12-10 22:21:01.945514	2017-12-21 18:54:46.964681	0	book_cover.png	image/png	21149	2017-12-10 22:21:01.74708	1
639	Time To Murder And Create 627	Brunch farm-to-table readymade cliche bushwick.	35.5600000000000023	\N	7	2017-12-10 22:21:02.172249	2017-12-21 18:54:46.970719	0	book_cover.png	image/png	21149	2017-12-10 22:21:01.959999	1
640	The Stars' Tennis Balls 628	Food truck tousled ennui messenger bag.	23.7800000000000011	\N	1	2017-12-10 22:21:02.403488	2017-12-21 18:54:46.976504	0	book_cover.png	image/png	21149	2017-12-10 22:21:02.186046	1
641	Cabbages and Kings 629	Ugh offal ennui chambray pug tacos.	56.2199999999999989	\N	8	2017-12-10 22:21:02.615033	2017-12-21 18:54:46.98228	0	book_cover.png	image/png	21149	2017-12-10 22:21:02.415227	1
642	From Here to Eternity 630	Art party literally hella humblebrag gentrify poutine.	30.7600000000000016	\N	3	2017-12-10 22:21:02.843445	2017-12-21 18:54:46.988171	0	book_cover.png	image/png	21149	2017-12-10 22:21:02.628148	1
644	This Side of Paradise 632	Readymade echo pork belly migas green juice fanny pack.	8.65000000000000036	\N	8	2017-12-10 22:21:03.336812	2017-12-21 18:54:47.000167	0	book_cover.png	image/png	21149	2017-12-10 22:21:03.105871	1
645	The Torment of Others 633	Cleanse scenester banh mi venmo hoodie actually wayfarers tote bag.	35.4500000000000028	\N	2	2017-12-10 22:21:03.550766	2017-12-21 18:54:47.006812	0	book_cover.png	image/png	21149	2017-12-10 22:21:03.348557	1
646	Rosemary Sutcliff 634	Meggings craft beer +1 actually pbr&b green juice 3 wolf moon aesthetic.	46.3800000000000026	\N	4	2017-12-10 22:21:03.775636	2017-12-21 18:54:47.01305	0	book_cover.png	image/png	21149	2017-12-10 22:21:03.563904	1
647	Beyond the Mexique Bay 635	Pinterest ugh offal selfies next level thundercats.	42.7199999999999989	\N	7	2017-12-10 22:21:04.027504	2017-12-21 18:54:47.018651	0	book_cover.png	image/png	21149	2017-12-10 22:21:03.789509	1
648	The Monkey's Raincoat 636	Wolf small batch green juice ramps disrupt authentic.	30.25	\N	4	2017-12-10 22:21:04.251063	2017-12-21 18:54:47.025966	0	book_cover.png	image/png	21149	2017-12-10 22:21:04.042513	1
649	Ego Dominus Tuus 637	Mlkshk street franzen selvage church-key 90's austin beard pitchfork.	15.4800000000000004	\N	2	2017-12-10 22:21:04.471748	2017-12-21 18:54:47.031739	0	book_cover.png	image/png	21149	2017-12-10 22:21:04.264321	1
650	Taming a Sea Horse 638	Taxidermy skateboard slow-carb semiotics.	15.6500000000000004	\N	6	2017-12-10 22:21:04.694672	2017-12-21 18:54:47.037945	0	book_cover.png	image/png	21149	2017-12-10 22:21:04.483686	1
653	Look to Windward 641	Tacos banjo yuccie keytar drinking.	36.8500000000000014	\N	3	2017-12-10 22:21:05.384299	2017-12-21 18:54:47.049264	0	book_cover.png	image/png	21149	2017-12-10 22:21:05.168581	1
654	This Lime Tree Bower 642	Tousled lomo tofu kickstarter franzen forage leggings poutine.	16.5500000000000007	\N	4	2017-12-10 22:21:05.605331	2017-12-21 18:54:47.055187	0	book_cover.png	image/png	21149	2017-12-10 22:21:05.39722	1
655	Those Barren Leaves, Thrones, Dominations 643	Listicle banjo paleo food truck pour-over squid.	7.38999999999999968	\N	6	2017-12-10 22:21:05.836587	2017-12-21 18:54:47.060801	0	book_cover.png	image/png	21149	2017-12-10 22:21:05.617851	1
656	Vanity Fair 644	Tilde banh mi health bespoke.	50.3500000000000014	\N	6	2017-12-10 22:21:06.066618	2017-12-21 18:54:47.06665	0	book_cover.png	image/png	21149	2017-12-10 22:21:05.851445	1
657	To a God Unknown 645	Plaid franzen carry kogi.	57.509999999999998	\N	5	2017-12-10 22:21:06.289387	2017-12-21 18:54:47.072334	0	book_cover.png	image/png	21149	2017-12-10 22:21:06.079671	1
659	Far From the Madding Crowd 647	Distillery sartorial letterpress flexitarian ramps plaid 90's neutra slow-carb.	14.6899999999999995	\N	1	2017-12-10 22:21:06.76675	2017-12-21 18:54:47.08449	0	book_cover.png	image/png	21149	2017-12-10 22:21:06.543523	1
660	Nine Coaches Waiting 648	You probably haven't heard of them chambray synth forage.	62.1400000000000006	\N	3	2017-12-10 22:21:07.001298	2017-12-21 18:54:47.090372	0	book_cover.png	image/png	21149	2017-12-10 22:21:06.784011	1
661	A Summer Bird-Cage 649	Schlitz pour-over ramps selvage.	15.8499999999999996	\N	3	2017-12-10 22:21:07.240229	2017-12-21 18:54:47.096101	0	book_cover.png	image/png	21149	2017-12-10 22:21:07.019806	1
662	Death Be Not Proud 650	Craft beer flexitarian messenger bag skateboard hella phlogiston.	32.9299999999999997	\N	3	2017-12-10 22:21:07.471415	2017-12-21 18:54:47.101833	0	book_cover.png	image/png	21149	2017-12-10 22:21:07.257518	1
663	It's a Battlefield 651	Pbr&b distillery fashion axe typewriter meditation viral neutra gluten-free.	31.3500000000000014	\N	7	2017-12-10 22:21:07.711822	2017-12-21 18:54:47.107642	0	book_cover.png	image/png	21149	2017-12-10 22:21:07.486212	1
664	The Moon by Night 652	Locavore semiotics kale chips etsy lomo.	49.8200000000000003	\N	2	2017-12-10 22:21:07.941963	2017-12-21 18:54:47.113814	0	book_cover.png	image/png	21149	2017-12-10 22:21:07.727142	1
665	Things Fall Apart 653	Keytar whatever deep v post-ironic synth 90's chia.	16.2800000000000011	\N	8	2017-12-10 22:21:08.168401	2017-12-21 18:54:47.1197	0	book_cover.png	image/png	21149	2017-12-10 22:21:07.96291	1
666	Everything is Illuminated 654	Kogi put a bird on it green juice jean shorts church-key neutra chicharrones helvetica tumblr.	39.4200000000000017	\N	5	2017-12-10 22:21:08.378163	2017-12-21 18:54:47.131565	0	book_cover.png	image/png	21149	2017-12-10 22:21:08.180106	1
667	No Highway 655	Echo bitters pickled messenger bag offal blue bottle pabst selfies schlitz.	68.8900000000000006	\N	1	2017-12-10 22:21:08.595213	2017-12-21 18:54:47.137538	0	book_cover.png	image/png	21149	2017-12-10 22:21:08.388918	1
668	The Man Within 656	Synth asymmetrical pour-over listicle carry.	48.0600000000000023	\N	4	2017-12-10 22:21:08.852544	2017-12-21 18:54:47.143646	0	book_cover.png	image/png	21149	2017-12-10 22:21:08.605515	1
669	By Grand Central Station I Sat Down and Wept 657	Skateboard taxidermy vice kogi artisan whatever helvetica.	24.8000000000000007	\N	1	2017-12-10 22:21:09.103547	2017-12-21 18:54:47.14991	0	book_cover.png	image/png	21149	2017-12-10 22:21:08.865608	1
670	By Grand Central Station I Sat Down and Wept 658	Kickstarter hella cleanse celiac taxidermy.	38.4399999999999977	\N	8	2017-12-10 22:21:09.31218	2017-12-21 18:54:47.155676	0	book_cover.png	image/png	21149	2017-12-10 22:21:09.111445	1
671	The Soldier's Art 659	Tacos lomo next level bitters blog typewriter vegan keytar yolo.	48.1099999999999994	\N	2	2017-12-10 22:21:09.518881	2017-12-21 18:54:47.161642	0	book_cover.png	image/png	21149	2017-12-10 22:21:09.32094	1
672	The Way of All Flesh 660	Lomo 90's goth ramps gastropub irony intelligentsia.	26.3900000000000006	\N	6	2017-12-10 22:21:09.738103	2017-12-21 18:54:47.167327	0	book_cover.png	image/png	21149	2017-12-10 22:21:09.527329	1
673	Jacob Have I Loved 661	Kickstarter letterpress brooklyn flexitarian park.	56.8500000000000014	\N	2	2017-12-10 22:21:09.953083	2017-12-21 18:54:47.173135	0	book_cover.png	image/png	21149	2017-12-10 22:21:09.747847	1
674	Sleep the Brave 662	Tacos bushwick food truck franzen.	62.2999999999999972	\N	5	2017-12-10 22:21:10.167013	2017-12-21 18:54:47.178997	0	book_cover.png	image/png	21149	2017-12-10 22:21:09.961384	1
676	Consider Phlebas 664	Keffiyeh pbr&b helvetica disrupt.	24.3099999999999987	\N	3	2017-12-10 22:21:10.604457	2017-12-21 18:54:47.190698	0	book_cover.png	image/png	21149	2017-12-10 22:21:10.397604	1
677	The Cricket on the Hearth 665	Bitters typewriter meditation before they sold out street shoreditch.	45.490000000000002	\N	8	2017-12-10 22:21:10.831086	2017-12-21 18:54:47.197016	0	book_cover.png	image/png	21149	2017-12-10 22:21:10.616728	1
678	Lilies of the Field 666	Ennui scenester trust fund +1 single-origin coffee messenger bag street.	10.3900000000000006	\N	1	2017-12-10 22:21:11.057447	2017-12-21 18:54:47.202742	0	book_cover.png	image/png	21149	2017-12-10 22:21:10.84259	1
679	The Green Bay Tree 667	Cold-pressed helvetica meh jean shorts heirloom echo plaid.	23.1099999999999994	\N	1	2017-12-10 22:21:11.297315	2017-12-21 18:54:47.208761	0	book_cover.png	image/png	21149	2017-12-10 22:21:11.071193	1
680	To a God Unknown 668	Cred you probably haven't heard of them goth jean shorts forage tilde selvage franzen.	69.5100000000000051	\N	2	2017-12-10 22:21:11.509843	2017-12-21 18:54:47.214477	0	book_cover.png	image/png	21149	2017-12-10 22:21:11.309193	1
681	Now Sleeps the Crimson Petal 669	Sriracha crucifix messenger bag pabst disrupt.	65.5600000000000023	\N	8	2017-12-10 22:21:11.732038	2017-12-21 18:54:47.221211	0	book_cover.png	image/png	21149	2017-12-10 22:21:11.521971	1
682	Cover Her Face 670	Banh mi helvetica irony health.	23.879999999999999	\N	4	2017-12-10 22:21:11.960872	2017-12-21 18:54:47.226996	0	book_cover.png	image/png	21149	2017-12-10 22:21:11.744934	1
683	The Stars' Tennis Balls 671	Everyday lo-fi authentic normcore gastropub.	42.2199999999999989	\N	2	2017-12-10 22:21:12.177048	2017-12-21 18:54:47.233461	0	book_cover.png	image/png	21149	2017-12-10 22:21:11.969982	1
684	The Line of Beauty 672	Irony mumblecore selvage lo-fi church-key literally letterpress.	16.7800000000000011	\N	5	2017-12-10 22:21:12.396953	2017-12-21 18:54:47.23966	0	book_cover.png	image/png	21149	2017-12-10 22:21:12.189345	1
685	The Wives of Bath 673	Messenger bag fashion axe tote bag small batch literally art party.	15.5600000000000005	\N	1	2017-12-10 22:21:12.608982	2017-12-21 18:54:47.245611	0	book_cover.png	image/png	21149	2017-12-10 22:21:12.405566	1
686	Taming a Sea Horse 674	Kombucha cornhole kickstarter meditation plaid selfies.	9.28999999999999915	\N	3	2017-12-10 22:21:12.85059	2017-12-21 18:54:47.251448	0	book_cover.png	image/png	21149	2017-12-10 22:21:12.618282	1
687	In Death Ground 675	Vhs tousled beard 90's normcore butcher gastropub ennui.	33.3599999999999994	\N	6	2017-12-10 22:21:13.08203	2017-12-21 18:54:47.257247	0	book_cover.png	image/png	21149	2017-12-10 22:21:12.864724	1
688	Unweaving the Rainbow 676	Wes anderson asymmetrical narwhal aesthetic loko.	54.490000000000002	\N	4	2017-12-10 22:21:13.30637	2017-12-21 18:54:47.263485	0	book_cover.png	image/png	21149	2017-12-10 22:21:13.091319	1
689	The Wealth of Nations 677	Fingerstache poutine sriracha fixie franzen photo booth keytar.	13.5	\N	4	2017-12-10 22:21:13.516797	2017-12-21 18:54:47.269399	0	book_cover.png	image/png	21149	2017-12-10 22:21:13.31547	1
729	Blithe Spirit 717	Wes anderson selfies viral kitsch post-ironic lo-fi.	19.5899999999999999	\N	8	2017-12-10 22:21:22.410331	2017-12-21 18:54:47.275391	0	book_cover.png	image/png	21149	2017-12-10 22:21:22.189685	1
691	Have His Carcase 679	Artisan phlogiston bitters pour-over scenester pork belly semiotics freegan quinoa.	69.8299999999999983	\N	1	2017-12-10 22:21:13.948611	2017-12-21 18:54:47.288124	0	book_cover.png	image/png	21149	2017-12-10 22:21:13.734923	1
692	The Line of Beauty 680	Biodiesel park pop-up poutine williamsburg church-key.	58.259999999999998	\N	1	2017-12-10 22:21:14.16721	2017-12-21 18:54:47.293765	0	book_cover.png	image/png	21149	2017-12-10 22:21:13.958086	1
693	Cover Her Face 681	Hashtag next level forage kogi readymade.	65.6800000000000068	\N	3	2017-12-10 22:21:14.398925	2017-12-21 18:54:47.299652	0	book_cover.png	image/png	21149	2017-12-10 22:21:14.178382	1
694	A Scanner Darkly 682	Master microdosing hella celiac seitan.	15.6799999999999997	\N	2	2017-12-10 22:21:14.620408	2017-12-21 18:54:47.30536	0	book_cover.png	image/png	21149	2017-12-10 22:21:14.412284	1
695	Ring of Bright Water 683	Bespoke next level meh umami 8-bit beard cold-pressed.	29.4100000000000001	\N	5	2017-12-10 22:21:14.832376	2017-12-21 18:54:47.311281	0	book_cover.png	image/png	21149	2017-12-10 22:21:14.628567	1
696	To a God Unknown 684	Vinegar godard slow-carb locavore kitsch raw denim.	22.629999999999999	\N	8	2017-12-10 22:21:15.053628	2017-12-21 18:54:47.31712	0	book_cover.png	image/png	21149	2017-12-10 22:21:14.840805	1
697	Tender Is the Night 685	Kombucha leggings vinyl cornhole.	41.5399999999999991	\N	3	2017-12-10 22:21:15.277132	2017-12-21 18:54:47.322882	0	book_cover.png	image/png	21149	2017-12-10 22:21:15.064988	1
698	The Golden Bowl 686	Lomo ugh whatever pour-over fanny pack tilde aesthetic.	41.8900000000000006	\N	2	2017-12-10 22:21:15.487679	2017-12-21 18:54:47.328665	0	book_cover.png	image/png	21149	2017-12-10 22:21:15.289214	1
699	To a God Unknown 687	8-bit crucifix goth mixtape schlitz.	13.1400000000000006	\N	5	2017-12-10 22:21:15.719272	2017-12-21 18:54:47.334654	0	book_cover.png	image/png	21149	2017-12-10 22:21:15.503912	1
701	That Hideous Strength 689	Sustainable gluten-free tattooed cardigan squid bushwick.	16.9200000000000017	\N	1	2017-12-10 22:21:16.17495	2017-12-21 18:54:47.346182	0	book_cover.png	image/png	21149	2017-12-10 22:21:15.968855	1
702	Many Waters 690	Whatever forage asymmetrical small batch organic 8-bit.	18.0899999999999999	\N	3	2017-12-10 22:21:16.393675	2017-12-21 18:54:47.351763	0	book_cover.png	image/png	21149	2017-12-10 22:21:16.185646	1
703	Of Mice and Men 691	Ramps cardigan shoreditch typewriter tilde.	67.1299999999999955	\N	1	2017-12-10 22:21:16.616241	2017-12-21 18:54:47.35773	0	book_cover.png	image/png	21149	2017-12-10 22:21:16.40548	1
704	Terrible Swift Sword 692	Tumblr wayfarers goth biodiesel.	58.7700000000000031	\N	2	2017-12-10 22:21:16.835114	2017-12-21 18:54:47.363457	0	book_cover.png	image/png	21149	2017-12-10 22:21:16.628546	1
705	Fair Stood the Wind for France 693	Truffaut wes anderson messenger bag kogi meggings fashion axe.	39.2700000000000031	\N	5	2017-12-10 22:21:17.063059	2017-12-21 18:54:47.370518	0	book_cover.png	image/png	21149	2017-12-10 22:21:16.848699	1
706	Françoise Sagan 694	Vice disrupt dreamcatcher freegan.	52.8299999999999983	\N	5	2017-12-10 22:21:17.287621	2017-12-21 18:54:47.38112	0	book_cover.png	image/png	21149	2017-12-10 22:21:17.075883	1
707	Rosemary Sutcliff 695	Farm-to-table freegan gluten-free park raw denim.	34.3800000000000026	\N	5	2017-12-10 22:21:17.518801	2017-12-21 18:54:47.390182	0	book_cover.png	image/png	21149	2017-12-10 22:21:17.301813	1
708	The Last Enemy 696	8-bit pug retro tumblr kitsch.	36.9299999999999997	\N	7	2017-12-10 22:21:17.737049	2017-12-21 18:54:47.400617	0	book_cover.png	image/png	21149	2017-12-10 22:21:17.53335	1
709	An Instant In The Wind 697	Skateboard banjo microdosing jean shorts disrupt blue bottle banh mi echo.	23.3099999999999987	\N	8	2017-12-10 22:21:17.959565	2017-12-21 18:54:47.408512	0	book_cover.png	image/png	21149	2017-12-10 22:21:17.749892	1
710	No Longer at Ease 698	Yolo whatever leggings umami brooklyn green juice kombucha.	69.2999999999999972	\N	3	2017-12-10 22:21:18.189832	2017-12-21 18:54:47.415302	0	book_cover.png	image/png	21149	2017-12-10 22:21:17.969229	1
711	Nectar in a Sieve 699	Five dollar toast next level sriracha lumbersexual gastropub goth roof chicharrones wes anderson.	36.3900000000000006	\N	7	2017-12-10 22:21:18.404495	2017-12-21 18:54:47.421739	0	book_cover.png	image/png	21149	2017-12-10 22:21:18.203244	1
712	The Wind's Twelve Quarters 700	Pabst blue bottle farm-to-table cardigan everyday celiac.	27.5599999999999987	\N	4	2017-12-10 22:21:18.63191	2017-12-21 18:54:47.427813	0	book_cover.png	image/png	21149	2017-12-10 22:21:18.422127	1
713	A Farewell to Arms 701	Loko health mumblecore kickstarter ramps put a bird on it bitters taxidermy diy.	25.870000000000001	\N	1	2017-12-10 22:21:18.849812	2017-12-21 18:54:47.433713	0	book_cover.png	image/png	21149	2017-12-10 22:21:18.64454	1
714	Jesting Pilate 702	Tattooed ramps kombucha vinyl venmo 3 wolf moon seitan.	46.990000000000002	\N	3	2017-12-10 22:21:19.083072	2017-12-21 18:54:47.439975	0	book_cover.png	image/png	21149	2017-12-10 22:21:18.864501	1
715	Death Be Not Proud 703	Flexitarian carry artisan chartreuse meditation marfa gastropub locavore tattooed.	66.6200000000000045	\N	3	2017-12-10 22:21:19.296227	2017-12-21 18:54:47.44586	0	book_cover.png	image/png	21149	2017-12-10 22:21:19.095343	1
716	Surprised by Joy 704	Trust fund yr ethical meh leggings.	36.0200000000000031	\N	1	2017-12-10 22:21:19.518437	2017-12-21 18:54:47.451669	0	book_cover.png	image/png	21149	2017-12-10 22:21:19.308147	1
717	The Monkey's Raincoat 705	Waistcoat hoodie vinegar chillwave.	27.8500000000000014	\N	7	2017-12-10 22:21:19.732345	2017-12-21 18:54:47.457774	0	book_cover.png	image/png	21149	2017-12-10 22:21:19.531261	1
718	No Highway 706	Yolo roof wayfarers tilde chillwave.	42.4500000000000028	\N	2	2017-12-10 22:21:19.953998	2017-12-21 18:54:47.46361	0	book_cover.png	image/png	21149	2017-12-10 22:21:19.746967	1
720	That Good Night 708	Mustache salvia street hashtag pinterest yolo hammock blog.	40.7199999999999989	\N	3	2017-12-10 22:21:20.381235	2017-12-21 18:54:47.476663	0	book_cover.png	image/png	21149	2017-12-10 22:21:20.177866	1
721	Let Us Now Praise Famous Men 709	Cliche flannel single-origin coffee echo +1 chia whatever.	38.7000000000000028	\N	8	2017-12-10 22:21:20.59684	2017-12-21 18:54:47.483237	0	book_cover.png	image/png	21149	2017-12-10 22:21:20.394982	1
722	Behold the Man 710	Street post-ironic wes anderson migas cliche vinyl.	29.0300000000000011	\N	1	2017-12-10 22:21:20.820256	2017-12-21 18:54:47.4894	0	book_cover.png	image/png	21149	2017-12-10 22:21:20.611064	1
723	Let Us Now Praise Famous Men 711	Heirloom yuccie poutine swag tofu.	62.6300000000000026	\N	5	2017-12-10 22:21:21.058673	2017-12-21 18:54:47.49565	0	book_cover.png	image/png	21149	2017-12-10 22:21:20.835271	1
724	Mr Standfast 712	Post-ironic kombucha tousled kinfolk twee cliche beard chillwave muggle magic.	60.8200000000000003	\N	3	2017-12-10 22:21:21.281547	2017-12-21 18:54:47.501709	0	book_cover.png	image/png	21149	2017-12-10 22:21:21.070719	1
725	The Road Less Traveled 713	Hashtag distillery pop-up schlitz banh mi salvia vinyl chillwave.	36.8900000000000006	\N	8	2017-12-10 22:21:21.49752	2017-12-21 18:54:47.507662	0	book_cover.png	image/png	21149	2017-12-10 22:21:21.293638	1
726	The Glory and the Dream 714	Stumptown fingerstache cold-pressed gastropub gentrify dreamcatcher.	38.5600000000000023	\N	3	2017-12-10 22:21:21.721852	2017-12-21 18:54:47.513557	0	book_cover.png	image/png	21149	2017-12-10 22:21:21.511102	1
727	Dying of the Light 715	Organic wayfarers cornhole hammock helvetica truffaut park microdosing.	9.4399999999999995	\N	5	2017-12-10 22:21:21.942005	2017-12-21 18:54:47.519522	0	book_cover.png	image/png	21149	2017-12-10 22:21:21.7343	1
728	A Summer Bird-Cage 716	Cronut photo booth gluten-free keytar godard.	7.49000000000000021	\N	4	2017-12-10 22:21:22.176755	2017-12-21 18:54:47.52531	0	book_cover.png	image/png	21149	2017-12-10 22:21:21.954549	1
731	The Skull Beneath the Skin 719	Tilde 8-bit dreamcatcher pork belly phlogiston keffiyeh five dollar toast.	22.4699999999999989	\N	5	2017-12-10 22:21:22.869087	2017-12-21 18:54:47.53723	0	book_cover.png	image/png	21149	2017-12-10 22:21:22.655633	1
732	Beneath the Bleeding 720	Offal phlogiston wes anderson cliche chillwave fixie.	56.2100000000000009	\N	5	2017-12-10 22:21:23.090448	2017-12-21 18:54:47.543363	0	book_cover.png	image/png	21149	2017-12-10 22:21:22.885186	1
733	If Not Now, When? 721	Try-hard jean shorts kombucha green juice flexitarian chicharrones brooklyn pickled next level.	41.2899999999999991	\N	2	2017-12-10 22:21:23.339593	2017-12-21 18:54:47.549535	0	book_cover.png	image/png	21149	2017-12-10 22:21:23.105691	1
734	Cabbages and Kings 722	Pbr&b shoreditch meditation tilde raw denim.	47.6300000000000026	\N	2	2017-12-10 22:21:23.563181	2017-12-21 18:54:47.555642	0	book_cover.png	image/png	21149	2017-12-10 22:21:23.356592	1
735	A Monstrous Regiment of Women 723	Typewriter tattooed gluten-free distillery blog xoxo.	24.5700000000000003	\N	2	2017-12-10 22:21:23.799103	2017-12-21 18:54:47.562188	0	book_cover.png	image/png	21149	2017-12-10 22:21:23.581019	1
736	Nectar in a Sieve 724	Put a bird on it semiotics iphone +1 hoodie skateboard readymade.	68.4899999999999949	\N	8	2017-12-10 22:21:24.025736	2017-12-21 18:54:47.56808	0	book_cover.png	image/png	21149	2017-12-10 22:21:23.811602	1
737	An Instant In The Wind 725	Biodiesel heirloom taxidermy pitchfork retro pour-over before they sold out.	26.1999999999999993	\N	7	2017-12-10 22:21:24.255187	2017-12-21 18:54:47.574152	0	book_cover.png	image/png	21149	2017-12-10 22:21:24.041524	1
738	The Grapes of Wrath 726	Wes anderson yuccie small batch drinking sriracha pork belly yolo.	69.019999999999996	\N	4	2017-12-10 22:21:24.46671	2017-12-21 18:54:47.58032	0	book_cover.png	image/png	21149	2017-12-10 22:21:24.266509	1
739	Vanity Fair 727	Whatever mustache twee cronut phlogiston green juice gentrify intelligentsia.	45.4399999999999977	\N	5	2017-12-10 22:21:24.691041	2017-12-21 18:54:47.587419	0	book_cover.png	image/png	21149	2017-12-10 22:21:24.476667	1
740	Jacob Have I Loved 728	Chartreuse cliche offal lomo vhs tote bag photo booth.	21.3399999999999999	\N	4	2017-12-10 22:21:24.964521	2017-12-21 18:54:47.594171	0	book_cover.png	image/png	21149	2017-12-10 22:21:24.702729	1
741	Where Angels Fear to Tread 729	Williamsburg brooklyn intelligentsia humblebrag mustache.	12.75	\N	7	2017-12-10 22:21:25.187554	2017-12-21 18:54:47.601712	0	book_cover.png	image/png	21149	2017-12-10 22:21:24.974187	1
742	The Monkey's Raincoat 730	Five dollar toast chartreuse church-key 90's offal pop-up echo.	55.6099999999999994	\N	8	2017-12-10 22:21:25.416358	2017-12-21 18:54:47.610516	0	book_cover.png	image/png	21149	2017-12-10 22:21:25.197763	1
744	A Scanner Darkly 732	Occupy food truck ugh tattooed tousled tacos microdosing.	25.8299999999999983	\N	5	2017-12-10 22:21:25.84852	2017-12-21 18:54:47.62418	0	book_cover.png	image/png	21149	2017-12-10 22:21:25.64277	1
745	Quo Vadis 733	90's distillery mumblecore celiac normcore brooklyn.	8.80000000000000071	\N	3	2017-12-10 22:21:26.050762	2017-12-21 18:54:47.630602	0	book_cover.png	image/png	21149	2017-12-10 22:21:25.857276	1
746	Dying of the Light 734	Vegan distillery pitchfork slow-carb wayfarers ethical quinoa.	25.120000000000001	\N	7	2017-12-10 22:21:26.280799	2017-12-21 18:54:47.637575	0	book_cover.png	image/png	21149	2017-12-10 22:21:26.061728	1
747	Wildfire at Midnight 735	Cred +1 beard cardigan.	44.509999999999998	\N	1	2017-12-10 22:21:26.528129	2017-12-21 18:54:47.644107	0	book_cover.png	image/png	21149	2017-12-10 22:21:26.312064	1
748	The Stars' Tennis Balls 736	Street mumblecore try-hard yolo flexitarian vegan.	7.79000000000000004	\N	5	2017-12-10 22:21:26.769723	2017-12-21 18:54:47.65127	0	book_cover.png	image/png	21149	2017-12-10 22:21:26.541125	1
749	Sleep the Brave 737	Lo-fi diy artisan +1 keytar salvia meggings raw denim.	66.1099999999999994	\N	6	2017-12-10 22:21:26.98788	2017-12-21 18:54:47.657622	0	book_cover.png	image/png	21149	2017-12-10 22:21:26.782183	1
750	The Widening Gyre 738	Loko pbr&b pug flexitarian bicycle rights semiotics asymmetrical.	66.5699999999999932	\N	5	2017-12-10 22:21:27.202736	2017-12-21 18:54:47.664011	0	book_cover.png	image/png	21149	2017-12-10 22:21:27.000102	1
751	In Death Ground 739	Readymade beard tousled slow-carb chartreuse.	56.2299999999999969	\N	2	2017-12-10 22:21:27.435672	2017-12-21 18:54:47.671858	0	book_cover.png	image/png	21149	2017-12-10 22:21:27.215302	1
752	Number the Stars 740	Crucifix vhs knausgaard drinking shoreditch godard brooklyn messenger bag.	9.58999999999999986	\N	3	2017-12-10 22:21:27.658603	2017-12-21 18:54:47.678976	0	book_cover.png	image/png	21149	2017-12-10 22:21:27.445796	1
753	Dance Dance Dance 741	Organic lomo echo intelligentsia tumblr hoodie heirloom drinking letterpress.	47.009999999999998	\N	7	2017-12-10 22:21:27.887567	2017-12-21 18:54:47.686325	0	book_cover.png	image/png	21149	2017-12-10 22:21:27.666936	1
754	East of Eden 742	Taxidermy pbr&b brooklyn venmo franzen.	58.4799999999999969	\N	7	2017-12-10 22:21:28.112793	2017-12-21 18:54:47.694407	0	book_cover.png	image/png	21149	2017-12-10 22:21:27.899403	1
755	Death Be Not Proud 743	Keffiyeh microdosing selfies mixtape deep v blue bottle offal lomo.	34.2899999999999991	\N	8	2017-12-10 22:21:28.337068	2017-12-21 18:54:47.70199	0	book_cover.png	image/png	21149	2017-12-10 22:21:28.127887	1
756	Many Waters 744	Ennui pinterest tacos ramps pbr&b pork belly messenger bag kinfolk cray.	39	\N	5	2017-12-10 22:21:28.551349	2017-12-21 18:54:47.709026	0	book_cover.png	image/png	21149	2017-12-10 22:21:28.348433	1
757	The Far-Distant Oxus 745	Art party aesthetic xoxo fingerstache.	22.9499999999999993	\N	6	2017-12-10 22:21:28.813184	2017-12-21 18:54:47.716969	0	book_cover.png	image/png	21149	2017-12-10 22:21:28.562326	1
758	Fair Stood the Wind for France 746	Freegan chicharrones fanny pack crucifix offal irony before they sold out shabby chic taxidermy.	29.8200000000000003	\N	5	2017-12-10 22:21:29.045125	2017-12-21 18:54:47.725514	0	book_cover.png	image/png	21149	2017-12-10 22:21:28.826725	1
759	The Daffodil Sky 747	8-bit butcher vhs cliche.	25.2100000000000009	\N	7	2017-12-10 22:21:29.269034	2017-12-21 18:54:47.733232	0	book_cover.png	image/png	21149	2017-12-10 22:21:29.057748	1
760	All the King's Men 748	Lumbersexual plaid hella locavore park.	20.0899999999999999	\N	2	2017-12-10 22:21:29.495135	2017-12-21 18:54:47.741447	0	book_cover.png	image/png	21149	2017-12-10 22:21:29.285013	1
761	This Side of Paradise 749	Deep v raw denim offal schlitz ennui helvetica.	61.8800000000000026	\N	2	2017-12-10 22:21:29.718107	2017-12-21 18:54:47.749211	0	book_cover.png	image/png	21149	2017-12-10 22:21:29.504818	1
762	Consider the Lilies 750	Five dollar toast slow-carb loko austin hammock 3 wolf moon.	15.5099999999999998	\N	8	2017-12-10 22:21:29.936094	2017-12-21 18:54:47.75668	0	book_cover.png	image/png	21149	2017-12-10 22:21:29.725161	1
763	Jacob Have I Loved 751	Stumptown chia ethical pinterest yr banh mi blue bottle.	28.5199999999999996	\N	4	2017-12-10 22:21:30.165829	2017-12-21 18:54:47.764108	0	book_cover.png	image/png	21149	2017-12-10 22:21:29.948513	1
765	In Death Ground 753	Readymade fixie franzen dreamcatcher.	17.5500000000000007	\N	8	2017-12-10 22:21:30.632259	2017-12-21 18:54:47.778599	0	book_cover.png	image/png	21149	2017-12-10 22:21:30.428309	1
766	Blue Remembered Earth 754	Art party tilde pug bitters kogi pickled typewriter distillery.	55.4299999999999997	\N	4	2017-12-10 22:21:30.851792	2017-12-21 18:54:47.785629	0	book_cover.png	image/png	21149	2017-12-10 22:21:30.647573	1
767	A Catskill Eagle 755	Small batch taxidermy church-key yr put a bird on it mixtape schlitz slow-carb blue bottle.	69.3199999999999932	\N	8	2017-12-10 22:21:31.115784	2017-12-21 18:54:47.792496	0	book_cover.png	image/png	21149	2017-12-10 22:21:30.864695	1
769	The Green Bay Tree 757	8-bit xoxo pop-up godard marfa.	16.8599999999999994	\N	1	2017-12-10 22:21:31.563046	2017-12-21 18:54:47.806136	0	book_cover.png	image/png	21149	2017-12-10 22:21:31.343892	1
770	The Line of Beauty 758	Pork belly church-key hella goth viral butcher whatever cronut.	14.8300000000000001	\N	7	2017-12-10 22:21:31.82065	2017-12-21 18:54:47.812664	0	book_cover.png	image/png	21149	2017-12-10 22:21:31.574279	1
771	Recalled to Life 759	Forage hashtag scenester pitchfork iphone diy heirloom yr direct trade.	67.8900000000000006	\N	2	2017-12-10 22:21:32.181518	2017-12-21 18:54:47.819315	0	book_cover.png	image/png	21149	2017-12-10 22:21:31.828568	1
772	A Many-Splendoured Thing 760	Vinegar venmo 3 wolf moon carry ethical pop-up squid jean shorts.	33.1599999999999966	\N	7	2017-12-10 22:21:32.45893	2017-12-21 18:54:47.825632	0	book_cover.png	image/png	21149	2017-12-10 22:21:32.19381	1
773	All the King's Men 761	Hashtag listicle semiotics lomo bitters.	18.879999999999999	\N	4	2017-12-10 22:21:32.672613	2017-12-21 18:54:47.831943	0	book_cover.png	image/png	21149	2017-12-10 22:21:32.469357	1
774	Now Sleeps the Crimson Petal 762	Taxidermy before they sold out umami bushwick kinfolk messenger bag knausgaard.	27.1999999999999993	\N	3	2017-12-10 22:21:32.900608	2017-12-21 18:54:47.837952	0	book_cover.png	image/png	21149	2017-12-10 22:21:32.686162	1
775	Wildfire at Midnight 763	Bitters chia ennui hashtag.	39.0799999999999983	\N	3	2017-12-10 22:21:33.121582	2017-12-21 18:54:47.845339	0	book_cover.png	image/png	21149	2017-12-10 22:21:32.912642	1
776	Lilies of the Field 764	Vinegar flannel asymmetrical heirloom letterpress iphone.	60.7999999999999972	\N	4	2017-12-10 22:21:33.345918	2017-12-21 18:54:47.852294	0	book_cover.png	image/png	21149	2017-12-10 22:21:33.131209	1
777	Brandy of the Damned 765	Typewriter kombucha synth leggings salvia portland pitchfork.	67.7900000000000063	\N	8	2017-12-10 22:21:33.561115	2017-12-21 18:54:47.858608	0	book_cover.png	image/png	21149	2017-12-10 22:21:33.356021	1
778	A Passage to India 766	Aesthetic kinfolk fashion axe goth cornhole jean shorts selvage +1 locavore.	47.4699999999999989	\N	4	2017-12-10 22:21:33.774712	2017-12-21 18:54:47.864081	0	book_cover.png	image/png	21149	2017-12-10 22:21:33.573558	1
779	I Sing the Body Electric 767	Polaroid organic kinfolk banjo lomo goth.	17.5199999999999996	\N	8	2017-12-10 22:21:34.00073	2017-12-21 18:54:47.870254	0	book_cover.png	image/png	21149	2017-12-10 22:21:33.791151	1
780	Little Hands Clapping 768	Meh intelligentsia bitters retro sustainable narwhal.	14.9399999999999995	\N	1	2017-12-10 22:21:34.220832	2017-12-21 18:54:47.880789	0	book_cover.png	image/png	21149	2017-12-10 22:21:34.012497	1
781	A Handful of Dust 769	Wayfarers trust fund sustainable kombucha.	33.8999999999999986	\N	1	2017-12-10 22:21:34.448921	2017-12-21 18:54:47.890889	0	book_cover.png	image/png	21149	2017-12-10 22:21:34.236219	1
782	The Daffodil Sky 770	8-bit shabby chic mlkshk vice.	64.5	\N	8	2017-12-10 22:21:34.677197	2017-12-21 18:54:47.902795	0	book_cover.png	image/png	21149	2017-12-10 22:21:34.458148	1
784	The Waste Land 772	Portland keffiyeh mumblecore cliche pork belly disrupt.	7.45999999999999996	\N	4	2017-12-10 22:21:35.11877	2017-12-21 18:54:47.915802	0	book_cover.png	image/png	21149	2017-12-10 22:21:34.91105	1
785	Shall not Perish 773	Aesthetic normcore keffiyeh bitters wayfarers narwhal before they sold out poutine goth.	9.00999999999999979	\N	7	2017-12-10 22:21:35.341513	2017-12-21 18:54:47.921969	0	book_cover.png	image/png	21149	2017-12-10 22:21:35.12745	1
786	Some Buried Caesar 774	3 wolf moon food truck bespoke put a bird on it kickstarter blog stumptown 90's.	26.1600000000000001	\N	8	2017-12-10 22:21:35.567901	2017-12-21 18:54:47.929997	0	book_cover.png	image/png	21149	2017-12-10 22:21:35.353081	1
787	If I Forget Thee Jerusalem 775	Vice slow-carb bitters iphone whatever tumblr beard gastropub hashtag.	13.1999999999999993	\N	6	2017-12-10 22:21:35.800978	2017-12-21 18:54:47.938714	0	book_cover.png	image/png	21149	2017-12-10 22:21:35.582709	1
788	Precious Bane 776	Pour-over kinfolk post-ironic portland 8-bit 90's.	22.7399999999999984	\N	8	2017-12-10 22:21:36.02811	2017-12-21 18:54:47.944691	0	book_cover.png	image/png	21149	2017-12-10 22:21:35.810659	1
789	Where Angels Fear to Tread 777	+1 selvage tacos phlogiston goth art party church-key.	34.3100000000000023	\N	7	2017-12-10 22:21:36.256039	2017-12-21 18:54:47.950307	0	book_cover.png	image/png	21149	2017-12-10 22:21:36.040385	1
790	Those Barren Leaves, Thrones, Dominations 778	Listicle cred farm-to-table plaid roof kombucha lomo umami.	20.7300000000000004	\N	8	2017-12-10 22:21:36.480141	2017-12-21 18:54:47.957393	0	book_cover.png	image/png	21149	2017-12-10 22:21:36.26645	1
791	A Swiftly Tilting Planet 779	Brunch bespoke bitters messenger bag meggings twee pork belly fixie cold-pressed.	58.9500000000000028	\N	7	2017-12-10 22:21:36.71892	2017-12-21 18:54:47.963259	0	book_cover.png	image/png	21149	2017-12-10 22:21:36.488997	1
792	Nine Coaches Waiting 780	Hammock lomo direct trade portland migas hella 8-bit mixtape dreamcatcher.	55.3299999999999983	\N	7	2017-12-10 22:21:36.955819	2017-12-21 18:54:47.970916	0	book_cover.png	image/png	21149	2017-12-10 22:21:36.733261	1
793	This Lime Tree Bower 781	Chia williamsburg park irony kitsch semiotics meh food truck.	31.4899999999999984	\N	8	2017-12-10 22:21:37.183443	2017-12-21 18:54:47.976931	0	book_cover.png	image/png	21149	2017-12-10 22:21:36.965243	1
794	If I Forget Thee Jerusalem 782	Cardigan salvia vegan goth.	57.9399999999999977	\N	7	2017-12-10 22:21:37.409821	2017-12-21 18:54:47.985129	0	book_cover.png	image/png	21149	2017-12-10 22:21:37.1931	1
795	Now Sleeps the Crimson Petal 783	Next level fanny pack ethical kitsch hella meh.	60.2299999999999969	\N	3	2017-12-10 22:21:37.636131	2017-12-21 18:54:47.991417	0	book_cover.png	image/png	21149	2017-12-10 22:21:37.418465	1
796	Everything is Illuminated 784	Humblebrag biodiesel umami pug photo booth helvetica seitan meggings.	44.8800000000000026	\N	6	2017-12-10 22:21:37.867972	2017-12-21 18:54:47.998336	0	book_cover.png	image/png	21149	2017-12-10 22:21:37.645288	1
797	Look Homeward, Angel 785	Humblebrag beard master vinegar tofu ethical health bushwick.	66.0100000000000051	\N	2	2017-12-10 22:21:38.08803	2017-12-21 18:54:48.00528	0	book_cover.png	image/png	21149	2017-12-10 22:21:37.878543	1
799	In Death Ground 787	Messenger bag disrupt godard forage.	39.0799999999999983	\N	2	2017-12-10 22:21:38.557271	2017-12-21 18:54:48.017191	0	book_cover.png	image/png	21149	2017-12-10 22:21:38.321219	1
800	The Proper Study 788	Sustainable seitan forage pork belly tilde yolo.	58.1499999999999986	\N	2	2017-12-10 22:21:38.842871	2017-12-21 18:54:48.023145	0	book_cover.png	image/png	21149	2017-12-10 22:21:38.568029	1
801	Waiting for the Barbarians 789	Five dollar toast tilde blue bottle venmo quinoa mustache chartreuse trust fund.	40.0499999999999972	\N	1	2017-12-10 22:21:39.114318	2017-12-21 18:54:48.029725	0	book_cover.png	image/png	21149	2017-12-10 22:21:38.854867	1
802	Butter In a Lordly Dish 790	Cliche stumptown distillery green juice normcore twee.	53.8800000000000026	\N	7	2017-12-10 22:21:39.330079	2017-12-21 18:54:48.037778	0	book_cover.png	image/png	21149	2017-12-10 22:21:39.123767	1
803	Fair Stood the Wind for France 791	Food truck migas disrupt gentrify swag yr salvia tumblr.	26.4499999999999993	\N	7	2017-12-10 22:21:39.553169	2017-12-21 18:54:48.044241	0	book_cover.png	image/png	21149	2017-12-10 22:21:39.340375	1
804	If Not Now, When? 792	Banjo diy kale chips chia.	43.2700000000000031	\N	3	2017-12-10 22:21:39.769001	2017-12-21 18:54:48.050723	0	book_cover.png	image/png	21149	2017-12-10 22:21:39.562368	1
805	Pale Kings and Princes 793	Next level five dollar toast kombucha hella mumblecore iphone.	12.2899999999999991	\N	7	2017-12-10 22:21:39.979607	2017-12-21 18:54:48.057226	0	book_cover.png	image/png	21149	2017-12-10 22:21:39.783025	1
807	To a God Unknown 795	Listicle wolf sustainable pop-up freegan slow-carb.	38.3699999999999974	\N	4	2017-12-10 22:21:40.411962	2017-12-21 18:54:48.069825	0	book_cover.png	image/png	21149	2017-12-10 22:21:40.208576	1
808	Far From the Madding Crowd 796	Umami migas marfa put a bird on it small batch raw denim vinyl wayfarers.	47.0499999999999972	\N	1	2017-12-10 22:21:40.62493	2017-12-21 18:54:48.07631	0	book_cover.png	image/png	21149	2017-12-10 22:21:40.421159	1
809	Look to Windward 797	Mlkshk tattooed fingerstache blog ethical next level listicle viral.	68.519999999999996	\N	6	2017-12-10 22:21:40.830108	2017-12-21 18:54:48.083271	0	book_cover.png	image/png	21149	2017-12-10 22:21:40.634954	1
810	East of Eden 798	Etsy post-ironic skateboard crucifix direct trade lomo fanny pack.	50.5799999999999983	\N	5	2017-12-10 22:21:41.044003	2017-12-21 18:54:48.090607	0	book_cover.png	image/png	21149	2017-12-10 22:21:40.839033	1
811	It's a Battlefield 799	Muggle magic carry wes anderson narwhal pop-up.	64.7000000000000028	\N	6	2017-12-10 22:21:41.254216	2017-12-21 18:54:48.097729	0	book_cover.png	image/png	21149	2017-12-10 22:21:41.053358	1
812	Dulce et Decorum Est 800	Chia marfa freegan retro kickstarter swag cold-pressed.	61.6300000000000026	\N	2	2017-12-10 22:21:41.474166	2017-12-21 18:54:48.129603	0	book_cover.png	image/png	21149	2017-12-10 22:21:41.26346	1
813	In Death Ground 801	Dreamcatcher banjo locavore fanny pack stumptown flexitarian muggle magic microdosing.	46.759999999999998	\N	8	2017-12-10 22:21:41.687787	2017-12-21 18:54:48.135251	0	book_cover.png	image/png	21149	2017-12-10 22:21:41.483405	1
815	All Passion Spent 803	Trust fund austin twee banh mi muggle magic leggings next level occupy.	43.8299999999999983	\N	7	2017-12-10 22:21:42.132523	2017-12-21 18:54:48.146747	0	book_cover.png	image/png	21149	2017-12-10 22:21:41.91694	1
816	The Daffodil Sky 804	Chia swag truffaut paleo slow-carb knausgaard sriracha.	23.0899999999999999	\N	3	2017-12-10 22:21:42.340544	2017-12-21 18:54:48.152756	0	book_cover.png	image/png	21149	2017-12-10 22:21:42.140933	1
817	To Say Nothing of the Dog 805	Small batch fanny pack fingerstache butcher.	26.6999999999999993	\N	8	2017-12-10 22:21:42.570207	2017-12-21 18:54:48.159072	0	book_cover.png	image/png	21149	2017-12-10 22:21:42.349612	1
818	Sleep the Brave 806	Dreamcatcher mustache meggings godard kitsch diy try-hard chambray.	59.9200000000000017	\N	3	2017-12-10 22:21:42.79219	2017-12-21 18:54:48.164586	0	book_cover.png	image/png	21149	2017-12-10 22:21:42.57892	1
819	Specimen Days 807	Hammock xoxo locavore vegan selvage wolf.	50.3200000000000003	\N	7	2017-12-10 22:21:43.013925	2017-12-21 18:54:48.170141	0	book_cover.png	image/png	21149	2017-12-10 22:21:42.805978	1
820	As I Lay Dying 808	Put a bird on it pabst you probably haven't heard of them wolf disrupt.	63.509999999999998	\N	5	2017-12-10 22:21:43.24119	2017-12-21 18:54:48.175517	0	book_cover.png	image/png	21149	2017-12-10 22:21:43.029406	1
821	For Whom the Bell Tolls 809	Yolo cray sriracha small batch.	38.7299999999999969	\N	3	2017-12-10 22:21:43.460032	2017-12-21 18:54:48.181229	0	book_cover.png	image/png	21149	2017-12-10 22:21:43.251342	1
822	Arms and the Man 810	Waistcoat letterpress vinegar retro pabst post-ironic quinoa narwhal.	27.379999999999999	\N	6	2017-12-10 22:21:43.684435	2017-12-21 18:54:48.186752	0	book_cover.png	image/png	21149	2017-12-10 22:21:43.471886	1
823	In Dubious Battle 811	90's street fixie ugh marfa artisan.	24.8000000000000007	\N	8	2017-12-10 22:21:43.905658	2017-12-21 18:54:48.192351	0	book_cover.png	image/png	21149	2017-12-10 22:21:43.693968	1
824	The World, the Flesh and the Devil 812	Hashtag blue bottle hoodie jean shorts everyday venmo post-ironic.	51.240000000000002	\N	4	2017-12-10 22:21:44.143055	2017-12-21 18:54:48.198218	0	book_cover.png	image/png	21149	2017-12-10 22:21:43.916776	1
825	Look to Windward 813	You probably haven't heard of them diy drinking authentic keffiyeh waistcoat literally.	42.8299999999999983	\N	6	2017-12-10 22:21:44.361906	2017-12-21 18:54:48.204054	0	book_cover.png	image/png	21149	2017-12-10 22:21:44.154691	1
826	Absalom, Absalom! 814	Pork belly jean shorts craft beer xoxo banjo.	57.2199999999999989	\N	6	2017-12-10 22:21:44.577582	2017-12-21 18:54:48.209635	0	book_cover.png	image/png	21149	2017-12-10 22:21:44.373451	1
827	Ring of Bright Water 815	Diy kinfolk vice swag church-key keytar.	55.3900000000000006	\N	2	2017-12-10 22:21:44.791785	2017-12-21 18:54:48.215666	0	book_cover.png	image/png	21149	2017-12-10 22:21:44.588834	1
828	A Confederacy of Dunces 816	Hella synth authentic sartorial.	8.98000000000000043	\N	8	2017-12-10 22:21:45.033793	2017-12-21 18:54:48.221952	0	book_cover.png	image/png	21149	2017-12-10 22:21:44.803286	1
829	Oh! To be in England 817	Narwhal xoxo portland tote bag vinegar.	22.8000000000000007	\N	7	2017-12-10 22:21:45.250913	2017-12-21 18:54:48.227668	0	book_cover.png	image/png	21149	2017-12-10 22:21:45.042622	1
830	I Sing the Body Electric 818	Muggle magic pbr&b flannel quinoa asymmetrical actually yolo tousled.	48.4200000000000017	\N	1	2017-12-10 22:21:45.472423	2017-12-21 18:54:48.23346	0	book_cover.png	image/png	21149	2017-12-10 22:21:45.259701	1
831	Blithe Spirit 819	Kombucha knausgaard yr gastropub chartreuse five dollar toast phlogiston.	42.0300000000000011	\N	6	2017-12-10 22:21:45.688041	2017-12-21 18:54:48.239535	0	book_cover.png	image/png	21149	2017-12-10 22:21:45.482236	1
832	The Millstone 820	Kale chips poutine next level kinfolk meditation beard kombucha.	63.7199999999999989	\N	7	2017-12-10 22:21:45.907053	2017-12-21 18:54:48.245153	0	book_cover.png	image/png	21149	2017-12-10 22:21:45.698207	1
833	A Handful of Dust 821	Carry mustache ramps messenger bag hashtag gentrify umami slow-carb thundercats.	18.2100000000000009	\N	2	2017-12-10 22:21:46.153316	2017-12-21 18:54:48.250702	0	book_cover.png	image/png	21149	2017-12-10 22:21:45.916558	1
834	The Millstone 822	Dreamcatcher banjo pickled pitchfork authentic put a bird on it.	37.8599999999999994	\N	1	2017-12-10 22:21:46.374569	2017-12-21 18:54:48.256003	0	book_cover.png	image/png	21149	2017-12-10 22:21:46.165512	1
835	Oh! To be in England 823	Banh mi biodiesel mustache small batch banjo keffiyeh.	17.2899999999999991	\N	3	2017-12-10 22:21:46.601933	2017-12-21 18:54:48.263032	0	book_cover.png	image/png	21149	2017-12-10 22:21:46.386404	1
837	Eyeless in Gaza 825	+1 next level small batch fingerstache chicharrones literally iphone church-key carry.	30.9699999999999989	\N	4	2017-12-10 22:21:47.069526	2017-12-21 18:54:48.275026	0	book_cover.png	image/png	21149	2017-12-10 22:21:46.847714	1
838	The Heart Is Deceitful Above All Things 826	Truffaut austin banh mi disrupt five dollar toast stumptown church-key.	62.3500000000000014	\N	5	2017-12-10 22:21:47.320764	2017-12-21 18:54:48.280595	0	book_cover.png	image/png	21149	2017-12-10 22:21:47.094911	1
839	An Acceptable Time 827	Synth diy pork belly carry banh mi skateboard bespoke portland hella.	18.9800000000000004	\N	5	2017-12-10 22:21:47.549006	2017-12-21 18:54:48.286684	0	book_cover.png	image/png	21149	2017-12-10 22:21:47.336494	1
840	Dance Dance Dance 828	Muggle magic yolo artisan disrupt stumptown.	29.8200000000000003	\N	6	2017-12-10 22:21:47.796494	2017-12-21 18:54:48.291964	0	book_cover.png	image/png	21149	2017-12-10 22:21:47.569107	1
841	The Man Within 829	Fashion axe listicle diy tote bag 90's.	68	\N	5	2017-12-10 22:21:48.024632	2017-12-21 18:54:48.297373	0	book_cover.png	image/png	21149	2017-12-10 22:21:47.813461	1
842	Butter In a Lordly Dish 830	Green juice letterpress kale chips meh salvia.	36.7899999999999991	\N	2	2017-12-10 22:21:48.265364	2017-12-21 18:54:48.303067	0	book_cover.png	image/png	21149	2017-12-10 22:21:48.041203	1
843	Brandy of the Damned 831	Kickstarter cornhole next level direct trade.	44.0300000000000011	\N	8	2017-12-10 22:21:48.484331	2017-12-21 18:54:48.30885	0	book_cover.png	image/png	21149	2017-12-10 22:21:48.281682	1
845	Everything is Illuminated 833	You probably haven't heard of them keytar normcore scenester vhs cred bespoke pop-up venmo.	56.2299999999999969	\N	8	2017-12-10 22:21:48.9825	2017-12-21 18:54:48.320351	0	book_cover.png	image/png	21149	2017-12-10 22:21:48.720193	1
846	Vanity Fair 834	Retro mixtape tote bag cornhole tacos.	62.9600000000000009	\N	6	2017-12-10 22:21:49.19728	2017-12-21 18:54:48.326166	0	book_cover.png	image/png	21149	2017-12-10 22:21:48.992956	1
847	Nectar in a Sieve 835	Austin kogi tacos umami waistcoat distillery pitchfork art party +1.	67.0600000000000023	\N	5	2017-12-10 22:21:49.421549	2017-12-21 18:54:48.332027	0	book_cover.png	image/png	21149	2017-12-10 22:21:49.207829	1
848	As I Lay Dying 836	Offal you probably haven't heard of them heirloom artisan authentic semiotics.	48.6499999999999986	\N	2	2017-12-10 22:21:49.638966	2017-12-21 18:54:48.337478	0	book_cover.png	image/png	21149	2017-12-10 22:21:49.431742	1
850	Brandy of the Damned 838	90's diy try-hard drinking you probably haven't heard of them.	56.7100000000000009	\N	2	2017-12-10 22:21:50.098797	2017-12-21 18:54:48.349415	0	book_cover.png	image/png	21149	2017-12-10 22:21:49.858475	1
851	The Little Foxes 839	Bushwick single-origin coffee flexitarian blog locavore.	46.009999999999998	\N	7	2017-12-10 22:21:50.33252	2017-12-21 18:54:48.355423	0	book_cover.png	image/png	21149	2017-12-10 22:21:50.115111	1
852	The Parliament of Man 840	Jean shorts intelligentsia photo booth selfies etsy.	22.0300000000000011	\N	8	2017-12-10 22:21:50.541301	2017-12-21 18:54:48.361136	0	book_cover.png	image/png	21149	2017-12-10 22:21:50.341553	1
853	To Say Nothing of the Dog 841	Pour-over sustainable chillwave narwhal hammock hashtag vinegar xoxo five dollar toast.	36.6700000000000017	\N	1	2017-12-10 22:21:50.748549	2017-12-21 18:54:48.367007	0	book_cover.png	image/png	21149	2017-12-10 22:21:50.55003	1
854	Blithe Spirit 842	Pug migas knausgaard goth pbr&b occupy fanny pack mixtape bicycle rights.	51.5600000000000023	\N	1	2017-12-10 22:21:50.977614	2017-12-21 18:54:48.373043	0	book_cover.png	image/png	21149	2017-12-10 22:21:50.756274	1
855	Paths of Glory 843	Fashion axe cray chartreuse hoodie try-hard.	16.5199999999999996	\N	3	2017-12-10 22:21:51.207405	2017-12-21 18:54:48.381269	0	book_cover.png	image/png	21149	2017-12-10 22:21:50.99042	1
856	Of Human Bondage 844	Chartreuse irony plaid mustache lumbersexual pour-over +1.	50.9699999999999989	\N	4	2017-12-10 22:21:51.408696	2017-12-21 18:54:48.390546	0	book_cover.png	image/png	21149	2017-12-10 22:21:51.216062	1
857	The Wings of the Dove 845	Godard yr vegan kinfolk chia locavore blue bottle organic.	16.3599999999999994	\N	1	2017-12-10 22:21:51.621065	2017-12-21 18:54:48.398636	0	book_cover.png	image/png	21149	2017-12-10 22:21:51.420796	1
858	Wildfire at Midnight 846	Heirloom wolf vice selfies slow-carb pbr&b xoxo lumbersexual.	62.7100000000000009	\N	2	2017-12-10 22:21:51.835596	2017-12-21 18:54:48.405941	0	book_cover.png	image/png	21149	2017-12-10 22:21:51.632125	1
859	The Cricket on the Hearth 847	Humblebrag kombucha schlitz typewriter migas diy salvia.	21.7100000000000009	\N	5	2017-12-10 22:21:52.042624	2017-12-21 18:54:48.412356	0	book_cover.png	image/png	21149	2017-12-10 22:21:51.846958	1
860	Infinite Jest 848	+1 schlitz vinyl put a bird on it meh polaroid twee.	34.0499999999999972	\N	5	2017-12-10 22:21:52.239768	2017-12-21 18:54:48.417971	0	book_cover.png	image/png	21149	2017-12-10 22:21:52.051097	1
861	The Road Less Traveled 849	Marfa yuccie tilde intelligentsia bespoke.	44.5499999999999972	\N	7	2017-12-10 22:21:52.482497	2017-12-21 18:54:48.424411	0	book_cover.png	image/png	21149	2017-12-10 22:21:52.253263	1
862	The Way Through the Woods 850	Chia loko blog vice craft beer wolf sartorial pork belly.	42.8200000000000003	\N	5	2017-12-10 22:21:52.698759	2017-12-21 18:54:48.430597	0	book_cover.png	image/png	21149	2017-12-10 22:21:52.493953	1
863	Tiger! Tiger! 851	Hoodie put a bird on it semiotics ennui tacos echo vice food truck phlogiston.	57.759999999999998	\N	8	2017-12-10 22:21:52.915015	2017-12-21 18:54:48.436472	0	book_cover.png	image/png	21149	2017-12-10 22:21:52.710318	1
864	Number the Stars 852	Goth small batch hoodie cray bushwick.	66.7600000000000051	\N	6	2017-12-10 22:21:53.122761	2017-12-21 18:54:48.44221	0	book_cover.png	image/png	21149	2017-12-10 22:21:52.929731	1
865	The Wind's Twelve Quarters 853	Actually cleanse tilde pour-over food truck wayfarers.	32.3500000000000014	\N	3	2017-12-10 22:21:53.345278	2017-12-21 18:54:48.447665	0	book_cover.png	image/png	21149	2017-12-10 22:21:53.130981	1
866	The Mermaids Singing 854	Food truck pitchfork thundercats keffiyeh.	14.5999999999999996	\N	3	2017-12-10 22:21:53.560267	2017-12-21 18:54:48.453213	0	book_cover.png	image/png	21149	2017-12-10 22:21:53.356256	1
867	This Side of Paradise 855	Salvia vinegar banh mi vice wolf bitters microdosing chambray.	68.9000000000000057	\N	2	2017-12-10 22:21:53.77234	2017-12-21 18:54:48.459406	0	book_cover.png	image/png	21149	2017-12-10 22:21:53.570916	1
868	No Country for Old Men 856	Jean shorts typewriter poutine kickstarter.	67.1800000000000068	\N	7	2017-12-10 22:21:53.990351	2017-12-21 18:54:48.465484	0	book_cover.png	image/png	21149	2017-12-10 22:21:53.780766	1
869	An Instant In The Wind 857	Keffiyeh actually williamsburg pbr&b brunch vice.	50.3999999999999986	\N	1	2017-12-10 22:21:54.204661	2017-12-21 18:54:48.471339	0	book_cover.png	image/png	21149	2017-12-10 22:21:54.001336	1
871	The Widening Gyre 859	Master thundercats jean shorts plaid iphone keffiyeh shoreditch pickled celiac.	32.5	\N	2	2017-12-10 22:21:54.634738	2017-12-21 18:54:48.483054	0	book_cover.png	image/png	21149	2017-12-10 22:21:54.422718	1
872	After Many a Summer Dies the Swan 860	Loko vhs offal jean shorts trust fund yuccie kombucha narwhal meh.	19.7399999999999984	\N	6	2017-12-10 22:21:54.849192	2017-12-21 18:54:48.488844	0	book_cover.png	image/png	21149	2017-12-10 22:21:54.645764	1
873	Now Sleeps the Crimson Petal 861	Roof artisan bespoke keffiyeh cred brunch 3 wolf moon chicharrones crucifix.	58.5799999999999983	\N	5	2017-12-10 22:21:55.054346	2017-12-21 18:54:48.494409	0	book_cover.png	image/png	21149	2017-12-10 22:21:54.857321	1
874	An Acceptable Time 862	Microdosing literally gastropub mumblecore twee.	19.8900000000000006	\N	3	2017-12-10 22:21:55.277649	2017-12-21 18:54:48.499926	0	book_cover.png	image/png	21149	2017-12-10 22:21:55.06537	1
875	Specimen Days 863	Quinoa irony meh 3 wolf moon literally lumbersexual five dollar toast synth shabby chic.	69.1200000000000045	\N	7	2017-12-10 22:21:55.498009	2017-12-21 18:54:48.505353	0	book_cover.png	image/png	21149	2017-12-10 22:21:55.286256	1
876	Tiger! Tiger! 864	Mixtape meh brunch tattooed godard twee diy phlogiston bespoke.	30.7300000000000004	\N	8	2017-12-10 22:21:55.706545	2017-12-21 18:54:48.510946	0	book_cover.png	image/png	21149	2017-12-10 22:21:55.510505	1
877	Beneath the Bleeding 865	Lomo shabby chic disrupt beard pour-over humblebrag.	53.2899999999999991	\N	7	2017-12-10 22:21:55.915903	2017-12-21 18:54:48.516422	0	book_cover.png	image/png	21149	2017-12-10 22:21:55.715856	1
878	Jacob Have I Loved 866	Cronut organic chartreuse diy squid farm-to-table sustainable pop-up.	7.26999999999999957	\N	3	2017-12-10 22:21:56.116442	2017-12-21 18:54:48.522067	0	book_cover.png	image/png	21149	2017-12-10 22:21:55.923936	1
879	The Last Enemy 867	Pbr&b hammock austin disrupt.	33.8999999999999986	\N	3	2017-12-10 22:21:56.33708	2017-12-21 18:54:48.528616	0	book_cover.png	image/png	21149	2017-12-10 22:21:56.127204	1
880	By Grand Central Station I Sat Down and Wept 868	Gentrify five dollar toast +1 cliche 90's stumptown pickled.	12.3599999999999994	\N	6	2017-12-10 22:21:56.569672	2017-12-21 18:54:48.534962	0	book_cover.png	image/png	21149	2017-12-10 22:21:56.349027	1
881	When the Green Woods Laugh 869	Narwhal portland 3 wolf moon artisan listicle mustache leggings.	41.740000000000002	\N	3	2017-12-10 22:21:56.783445	2017-12-21 18:54:48.54094	0	book_cover.png	image/png	21149	2017-12-10 22:21:56.580856	1
883	The Daffodil Sky 871	Lomo cleanse 8-bit organic brunch.	36.6700000000000017	\N	5	2017-12-10 22:21:57.212979	2017-12-21 18:54:48.5528	0	book_cover.png	image/png	21149	2017-12-10 22:21:57.005482	1
884	Those Barren Leaves, Thrones, Dominations 872	Actually occupy 90's franzen vinegar distillery waistcoat slow-carb.	54.1799999999999997	\N	8	2017-12-10 22:21:57.433723	2017-12-21 18:54:48.558591	0	book_cover.png	image/png	21149	2017-12-10 22:21:57.224183	1
885	That Hideous Strength 873	Sartorial street franzen kogi etsy forage direct trade chicharrones wes anderson.	51.1400000000000006	\N	6	2017-12-10 22:21:57.640442	2017-12-21 18:54:48.564149	0	book_cover.png	image/png	21149	2017-12-10 22:21:57.44194	1
886	Mother Night 874	Master yr flannel beard vinegar waistcoat.	42.6499999999999986	\N	6	2017-12-10 22:21:57.87759	2017-12-21 18:54:48.569608	0	book_cover.png	image/png	21149	2017-12-10 22:21:57.650245	1
887	To a God Unknown 875	Cardigan waistcoat goth five dollar toast hashtag.	58.2899999999999991	\N	2	2017-12-10 22:21:58.092582	2017-12-21 18:54:48.575774	0	book_cover.png	image/png	21149	2017-12-10 22:21:57.885441	1
888	The Moon by Night 876	Pabst trust fund yuccie venmo pop-up selfies biodiesel kogi.	39.1300000000000026	\N	5	2017-12-10 22:21:58.301537	2017-12-21 18:54:48.581738	0	book_cover.png	image/png	21149	2017-12-10 22:21:58.103487	1
889	The Line of Beauty 877	Actually ramps pop-up mlkshk.	60.2899999999999991	\N	1	2017-12-10 22:21:58.530187	2017-12-21 18:54:48.588455	0	book_cover.png	image/png	21149	2017-12-10 22:21:58.313885	1
890	The Stars' Tennis Balls 878	Cliche polaroid cornhole wayfarers banh mi cred.	38.1199999999999974	\N	8	2017-12-10 22:21:58.750827	2017-12-21 18:54:48.594014	0	book_cover.png	image/png	21149	2017-12-10 22:21:58.538182	1
891	Down to a Sunless Sea 879	Forage kickstarter kombucha sartorial.	51.1099999999999994	\N	4	2017-12-10 22:21:58.962694	2017-12-21 18:54:48.599492	0	book_cover.png	image/png	21149	2017-12-10 22:21:58.76187	1
893	Let Us Now Praise Famous Men 881	Ugh 8-bit offal taxidermy meggings blue bottle williamsburg.	28.4499999999999993	\N	3	2017-12-10 22:21:59.366044	2017-12-21 18:54:48.610425	0	book_cover.png	image/png	21149	2017-12-10 22:21:59.171143	1
894	Moab Is My Washpot 882	Chartreuse art party chia marfa.	15.0800000000000001	\N	6	2017-12-10 22:21:59.57022	2017-12-21 18:54:48.616329	0	book_cover.png	image/png	21149	2017-12-10 22:21:59.376909	1
895	The Road Less Traveled 883	Tofu beard migas direct trade fingerstache deep v cliche gentrify intelligentsia.	15.1899999999999995	\N	3	2017-12-10 22:21:59.801445	2017-12-21 18:54:48.623037	0	book_cover.png	image/png	21149	2017-12-10 22:21:59.598651	1
896	Gone with the Wind 884	Single-origin coffee intelligentsia leggings 8-bit locavore ugh.	18.8200000000000003	\N	5	2017-12-10 22:22:00.011063	2017-12-21 18:54:48.628573	0	book_cover.png	image/png	21149	2017-12-10 22:21:59.812228	1
897	The Heart Is a Lonely Hunter 885	Flannel intelligentsia seitan actually venmo raw denim vice portland cornhole.	18.2899999999999991	\N	2	2017-12-10 22:22:00.226754	2017-12-21 18:54:48.635149	0	book_cover.png	image/png	21149	2017-12-10 22:22:00.023492	1
898	Now Sleeps the Crimson Petal 886	Williamsburg tofu pork belly viral mixtape intelligentsia.	16.3999999999999986	\N	5	2017-12-10 22:22:00.438633	2017-12-21 18:54:48.641418	0	book_cover.png	image/png	21149	2017-12-10 22:22:00.234915	1
899	Look to Windward 887	Echo marfa pinterest deep v.	27.2100000000000009	\N	6	2017-12-10 22:22:00.654745	2017-12-21 18:54:48.647599	0	book_cover.png	image/png	21149	2017-12-10 22:22:00.450595	1
900	No Longer at Ease 888	Vegan pour-over lomo chambray 90's mixtape leggings meh mustache.	67.2900000000000063	\N	6	2017-12-10 22:22:00.869137	2017-12-21 18:54:48.653157	0	book_cover.png	image/png	21149	2017-12-10 22:22:00.665537	1
901	In a Dry Season 889	Lomo godard helvetica scenester mumblecore.	17.379999999999999	\N	2	2017-12-10 22:22:01.081196	2017-12-21 18:54:48.658704	0	book_cover.png	image/png	21149	2017-12-10 22:22:00.88352	1
902	Look Homeward, Angel 890	Yr microdosing celiac flexitarian vhs.	39.2999999999999972	\N	4	2017-12-10 22:22:01.293474	2017-12-21 18:54:48.665189	0	book_cover.png	image/png	21149	2017-12-10 22:22:01.092102	1
903	Dance Dance Dance 891	Actually loko poutine try-hard microdosing heirloom thundercats.	27.6799999999999997	\N	7	2017-12-10 22:22:01.496701	2017-12-21 18:54:48.670901	0	book_cover.png	image/png	21149	2017-12-10 22:22:01.303145	1
904	Butter In a Lordly Dish 892	Vinyl vinegar raw denim locavore polaroid squid leggings.	68.6400000000000006	\N	8	2017-12-10 22:22:01.711033	2017-12-21 18:54:48.676602	0	book_cover.png	image/png	21149	2017-12-10 22:22:01.511156	1
905	Beyond the Mexique Bay 893	Street vegan thundercats brooklyn flexitarian vice brunch.	48.4399999999999977	\N	4	2017-12-10 22:22:01.93142	2017-12-21 18:54:48.682075	0	book_cover.png	image/png	21149	2017-12-10 22:22:01.721927	1
906	An Acceptable Time 894	Craft beer paleo kinfolk fixie leggings direct trade bitters.	61.4500000000000028	\N	8	2017-12-10 22:22:02.151002	2017-12-21 18:54:48.687562	0	book_cover.png	image/png	21149	2017-12-10 22:22:01.945042	1
907	Beneath the Bleeding 895	Selvage listicle retro microdosing mumblecore thundercats swag.	30.3900000000000006	\N	5	2017-12-10 22:22:02.363546	2017-12-21 18:54:48.693218	0	book_cover.png	image/png	21149	2017-12-10 22:22:02.159838	1
908	The Other Side of Silence 896	Iphone echo sriracha leggings raw denim.	45.5600000000000023	\N	3	2017-12-10 22:22:02.571911	2017-12-21 18:54:48.699746	0	book_cover.png	image/png	21149	2017-12-10 22:22:02.371531	1
909	East of Eden 897	Wolf marfa next level xoxo.	23.0300000000000011	\N	6	2017-12-10 22:22:02.81042	2017-12-21 18:54:48.705732	0	book_cover.png	image/png	21149	2017-12-10 22:22:02.588194	1
911	For a Breath I Tarry 899	Photo booth skateboard banh mi roof five dollar toast single-origin coffee chicharrones.	37.7700000000000031	\N	2	2017-12-10 22:22:03.245394	2017-12-21 18:54:48.717401	0	book_cover.png	image/png	21149	2017-12-10 22:22:03.04422	1
912	Absalom, Absalom! 900	Ethical whatever artisan 8-bit godard listicle wolf waistcoat.	14.9800000000000004	\N	2	2017-12-10 22:22:03.465251	2017-12-21 18:54:48.723261	0	book_cover.png	image/png	21149	2017-12-10 22:22:03.26268	1
913	All Passion Spent 901	Hammock chambray five dollar toast post-ironic seitan loko.	54.8800000000000026	\N	3	2017-12-10 22:22:03.70592	2017-12-21 18:54:48.728735	0	book_cover.png	image/png	21149	2017-12-10 22:22:03.477079	1
914	The Curious Incident of the Dog in the Night-Time 902	Beard skateboard marfa chartreuse.	34.6700000000000017	\N	7	2017-12-10 22:22:03.918864	2017-12-21 18:54:48.73534	0	book_cover.png	image/png	21149	2017-12-10 22:22:03.717741	1
915	The Mermaids Singing 903	Thundercats selvage freegan tofu five dollar toast.	9.40000000000000036	\N	5	2017-12-10 22:22:04.163201	2017-12-21 18:54:48.74135	0	book_cover.png	image/png	21149	2017-12-10 22:22:03.931751	1
916	The Monkey's Raincoat 904	Brooklyn kitsch vinegar portland mixtape.	35.6400000000000006	\N	3	2017-12-10 22:22:04.384331	2017-12-21 18:54:48.746823	0	book_cover.png	image/png	21149	2017-12-10 22:22:04.179525	1
917	An Evil Cradling 905	Chambray occupy semiotics deep v.	59.759999999999998	\N	2	2017-12-10 22:22:04.596305	2017-12-21 18:54:48.752225	0	book_cover.png	image/png	21149	2017-12-10 22:22:04.39507	1
918	Many Waters 906	Banjo photo booth austin direct trade.	62.740000000000002	\N	1	2017-12-10 22:22:04.828533	2017-12-21 18:54:48.757662	0	book_cover.png	image/png	21149	2017-12-10 22:22:04.611852	1
919	I Will Fear No Evil 907	Try-hard brunch mustache retro sartorial williamsburg selfies next level thundercats.	27.8399999999999999	\N	6	2017-12-10 22:22:05.058282	2017-12-21 18:54:48.763303	0	book_cover.png	image/png	21149	2017-12-10 22:22:04.843934	1
920	All the King's Men 908	Cliche synth lomo sartorial forage.	59.509999999999998	\N	2	2017-12-10 22:22:05.286602	2017-12-21 18:54:48.770489	0	book_cover.png	image/png	21149	2017-12-10 22:22:05.070191	1
923	The Soldier's Art 911	Listicle mlkshk cliche microdosing portland.	14.0199999999999996	\N	5	2017-12-10 22:22:05.968085	2017-12-21 18:54:48.788542	0	book_cover.png	image/png	21149	2017-12-10 22:22:05.763477	1
924	The Doors of Perception 912	Mumblecore locavore echo sustainable pug single-origin coffee shoreditch cleanse.	51.5399999999999991	\N	4	2017-12-10 22:22:06.189589	2017-12-21 18:54:48.794974	0	book_cover.png	image/png	21149	2017-12-10 22:22:05.986501	1
925	The Skull Beneath the Skin 913	Flannel jean shorts portland butcher.	35.3999999999999986	\N	7	2017-12-10 22:22:06.415829	2017-12-21 18:54:48.800877	0	book_cover.png	image/png	21149	2017-12-10 22:22:06.206006	1
926	Frequent Hearses 914	Chicharrones sustainable deep v goth.	51.5900000000000034	\N	1	2017-12-10 22:22:06.646125	2017-12-21 18:54:48.807661	0	book_cover.png	image/png	21149	2017-12-10 22:22:06.433729	1
927	The Way of All Flesh 915	Cleanse schlitz occupy salvia polaroid microdosing pour-over ugh.	52.5700000000000003	\N	5	2017-12-10 22:22:06.856908	2017-12-21 18:54:48.814063	0	book_cover.png	image/png	21149	2017-12-10 22:22:06.66064	1
928	When the Green Woods Laugh 916	Freegan ethical viral drinking williamsburg messenger bag ennui master.	32.25	\N	3	2017-12-10 22:22:07.063034	2017-12-21 18:54:48.819946	0	book_cover.png	image/png	21149	2017-12-10 22:22:06.868669	1
929	Ah, Wilderness! 917	3 wolf moon narwhal shabby chic church-key blog.	8.66000000000000014	\N	8	2017-12-10 22:22:07.300816	2017-12-21 18:54:48.825883	0	book_cover.png	image/png	21149	2017-12-10 22:22:07.083096	1
930	The Mermaids Singing 918	Vegan keytar poutine dreamcatcher ennui actually distillery heirloom mustache.	8.41000000000000014	\N	8	2017-12-10 22:22:07.542696	2017-12-21 18:54:48.832549	0	book_cover.png	image/png	21149	2017-12-10 22:22:07.312159	1
931	Sleep the Brave 919	Viral hella muggle magic five dollar toast keytar stumptown.	11.4100000000000001	\N	8	2017-12-10 22:22:07.768177	2017-12-21 18:54:48.837973	0	book_cover.png	image/png	21149	2017-12-10 22:22:07.561013	1
932	Ah, Wilderness! 920	Food truck pabst street goth lumbersexual.	33.0399999999999991	\N	3	2017-12-10 22:22:07.981497	2017-12-21 18:54:48.843614	0	book_cover.png	image/png	21149	2017-12-10 22:22:07.777931	1
933	Those Barren Leaves, Thrones, Dominations 921	Organic tacos stumptown kickstarter artisan cleanse bushwick aesthetic tote bag.	40.1599999999999966	\N	3	2017-12-10 22:22:08.20364	2017-12-21 18:54:48.849152	0	book_cover.png	image/png	21149	2017-12-10 22:22:07.99761	1
934	From Here to Eternity 922	Wes anderson cronut cold-pressed photo booth goth squid trust fund.	54.0600000000000023	\N	4	2017-12-10 22:22:08.426826	2017-12-21 18:54:48.855248	0	book_cover.png	image/png	21149	2017-12-10 22:22:08.219495	1
935	The Man Within 923	Mlkshk crucifix health sartorial freegan humblebrag locavore fashion axe distillery.	20.7899999999999991	\N	3	2017-12-10 22:22:08.664762	2017-12-21 18:54:48.861245	0	book_cover.png	image/png	21149	2017-12-10 22:22:08.440083	1
936	A Summer Bird-Cage 924	Wayfarers yolo butcher keytar before they sold out.	31.1700000000000017	\N	2	2017-12-10 22:22:08.943239	2017-12-21 18:54:48.866739	0	book_cover.png	image/png	21149	2017-12-10 22:22:08.676378	1
937	Brandy of the Damned 925	Tattooed chillwave before they sold out ugh occupy literally.	57.2899999999999991	\N	4	2017-12-10 22:22:09.161907	2017-12-21 18:54:48.873611	0	book_cover.png	image/png	21149	2017-12-10 22:22:08.95234	1
938	The Millstone 926	Cray five dollar toast etsy crucifix jean shorts.	68.4300000000000068	\N	2	2017-12-10 22:22:09.375836	2017-12-21 18:54:48.883686	0	book_cover.png	image/png	21149	2017-12-10 22:22:09.175378	1
939	Look to Windward 927	Hammock franzen distillery food truck cred.	7.46999999999999975	\N	5	2017-12-10 22:22:09.590572	2017-12-21 18:54:48.891669	0	book_cover.png	image/png	21149	2017-12-10 22:22:09.388307	1
940	A Swiftly Tilting Planet 928	Quinoa echo tilde synth gastropub mlkshk crucifix.	67.5600000000000023	\N	1	2017-12-10 22:22:09.814456	2017-12-21 18:54:48.901091	0	book_cover.png	image/png	21149	2017-12-10 22:22:09.601042	1
941	The Painted Veil 929	Mustache actually tote bag helvetica distillery gluten-free goth.	45.6300000000000026	\N	4	2017-12-10 22:22:10.03285	2017-12-21 18:54:48.907749	0	book_cover.png	image/png	21149	2017-12-10 22:22:09.826973	1
942	Dance Dance Dance 930	Marfa master helvetica ramps banjo keytar raw denim hella shabby chic.	12.9499999999999993	\N	7	2017-12-10 22:22:10.258877	2017-12-21 18:54:48.914525	0	book_cover.png	image/png	21149	2017-12-10 22:22:10.041666	1
943	Unweaving the Rainbow 931	Cronut banjo schlitz marfa synth aesthetic.	56.6199999999999974	\N	7	2017-12-10 22:22:10.486844	2017-12-21 18:54:48.920694	0	book_cover.png	image/png	21149	2017-12-10 22:22:10.271188	1
945	East of Eden 933	Microdosing tofu asymmetrical post-ironic wayfarers.	59.5	\N	6	2017-12-10 22:22:10.926752	2017-12-21 18:54:48.932541	0	book_cover.png	image/png	21149	2017-12-10 22:22:10.704706	1
946	Frequent Hearses 934	Small batch godard dreamcatcher swag chartreuse stumptown.	11.0899999999999999	\N	1	2017-12-10 22:22:11.140253	2017-12-21 18:54:48.944735	0	book_cover.png	image/png	21149	2017-12-10 22:22:10.938847	1
947	The Lathe of Heaven 935	Selfies forage vhs biodiesel distillery keytar farm-to-table scenester tattooed.	19.370000000000001	\N	5	2017-12-10 22:22:11.365484	2017-12-21 18:54:48.952303	0	book_cover.png	image/png	21149	2017-12-10 22:22:11.155012	1
948	The Curious Incident of the Dog in the Night-Time 936	Swag messenger bag pinterest wayfarers.	57.7199999999999989	\N	1	2017-12-10 22:22:11.584656	2017-12-21 18:54:48.958143	0	book_cover.png	image/png	21149	2017-12-10 22:22:11.378203	1
949	Fame Is the Spur 937	Small batch swag tousled williamsburg freegan shoreditch.	41.3599999999999994	\N	1	2017-12-10 22:22:11.798353	2017-12-21 18:54:48.964723	0	book_cover.png	image/png	21149	2017-12-10 22:22:11.594291	1
950	Oh! To be in England 938	Microdosing hella shoreditch marfa skateboard slow-carb sartorial mumblecore.	49.3100000000000023	\N	4	2017-12-10 22:22:12.024324	2017-12-21 18:54:48.970697	0	book_cover.png	image/png	21149	2017-12-10 22:22:11.810892	1
951	Ring of Bright Water 939	Everyday asymmetrical knausgaard tousled keytar chambray kickstarter.	67.9200000000000017	\N	3	2017-12-10 22:22:12.236539	2017-12-21 18:54:48.976044	0	book_cover.png	image/png	21149	2017-12-10 22:22:12.036805	1
952	A Confederacy of Dunces 940	Butcher celiac sartorial loko messenger bag twee kombucha 8-bit.	22.370000000000001	\N	8	2017-12-10 22:22:12.444605	2017-12-21 18:54:48.981959	0	book_cover.png	image/png	21149	2017-12-10 22:22:12.244749	1
953	Time To Murder And Create 941	Offal literally vegan gluten-free farm-to-table meh.	68.1400000000000006	\N	7	2017-12-10 22:22:12.682333	2017-12-21 18:54:48.987346	0	book_cover.png	image/png	21149	2017-12-10 22:22:12.456094	1
954	Stranger in a Strange Land 942	Trust fund cleanse messenger bag wolf asymmetrical fanny pack chambray phlogiston.	66.1500000000000057	\N	7	2017-12-10 22:22:12.914284	2017-12-21 18:54:48.993246	0	book_cover.png	image/png	21149	2017-12-10 22:22:12.691004	1
955	Down to a Sunless Sea 943	Synth paleo organic bespoke tousled sriracha iphone meditation.	11.0399999999999991	\N	4	2017-12-10 22:22:13.127625	2017-12-21 18:54:48.999545	0	book_cover.png	image/png	21149	2017-12-10 22:22:12.926691	1
956	Shall not Perish 944	Cardigan kinfolk organic goth cold-pressed vhs schlitz yolo ugh.	66.0699999999999932	\N	4	2017-12-10 22:22:13.351834	2017-12-21 18:54:49.005697	0	book_cover.png	image/png	21149	2017-12-10 22:22:13.140061	1
957	An Acceptable Time 945	Etsy gentrify cold-pressed 8-bit brunch banh mi locavore church-key.	29.5199999999999996	\N	8	2017-12-10 22:22:13.57578	2017-12-21 18:54:49.01199	0	book_cover.png	image/png	21149	2017-12-10 22:22:13.360736	1
958	East of Eden 946	Stumptown synth biodiesel chicharrones cornhole street ugh meh disrupt.	42.4099999999999966	\N	8	2017-12-10 22:22:13.795748	2017-12-21 18:54:49.01817	0	book_cover.png	image/png	21149	2017-12-10 22:22:13.586898	1
960	The Widening Gyre 948	Fanny pack schlitz wolf organic.	10.2799999999999994	\N	7	2017-12-10 22:22:14.228469	2017-12-21 18:54:49.029192	0	book_cover.png	image/png	21149	2017-12-10 22:22:14.024815	1
961	Nine Coaches Waiting 949	Diy jean shorts sartorial kickstarter slow-carb you probably haven't heard of them shabby chic deep v skateboard.	29.1900000000000013	\N	3	2017-12-10 22:22:14.452277	2017-12-21 18:54:49.034566	0	book_cover.png	image/png	21149	2017-12-10 22:22:14.243252	1
962	Time of our Darkness 950	Salvia banjo polaroid tumblr.	54.1599999999999966	\N	5	2017-12-10 22:22:14.684776	2017-12-21 18:54:49.040188	0	book_cover.png	image/png	21149	2017-12-10 22:22:14.461325	1
963	Such, Such Were the Joys 951	Intelligentsia listicle literally disrupt.	38.9799999999999969	\N	1	2017-12-10 22:22:14.903807	2017-12-21 18:54:49.046201	0	book_cover.png	image/png	21149	2017-12-10 22:22:14.704364	1
964	The Wives of Bath 952	Roof xoxo offal brooklyn forage.	17.9200000000000017	\N	2	2017-12-10 22:22:15.128209	2017-12-21 18:54:49.052219	0	book_cover.png	image/png	21149	2017-12-10 22:22:14.912437	1
965	The Wealth of Nations 953	Fashion axe readymade meditation chartreuse kitsch literally photo booth.	61.1400000000000006	\N	4	2017-12-10 22:22:15.343942	2017-12-21 18:54:49.058027	0	book_cover.png	image/png	21149	2017-12-10 22:22:15.140002	1
966	All Passion Spent 954	Wayfarers selfies farm-to-table cronut mumblecore kitsch crucifix umami raw denim.	43.6400000000000006	\N	7	2017-12-10 22:22:15.546964	2017-12-21 18:54:49.06402	0	book_cover.png	image/png	21149	2017-12-10 22:22:15.353883	1
967	A Catskill Eagle 955	Authentic green juice kitsch skateboard organic yuccie flexitarian humblebrag banh mi.	55.75	\N	4	2017-12-10 22:22:15.775176	2017-12-21 18:54:49.069901	0	book_cover.png	image/png	21149	2017-12-10 22:22:15.555626	1
968	Unweaving the Rainbow 956	Kitsch hashtag chillwave meditation +1 schlitz banh mi everyday.	55.5700000000000003	\N	3	2017-12-10 22:22:15.987571	2017-12-21 18:54:49.075672	0	book_cover.png	image/png	21149	2017-12-10 22:22:15.787303	1
969	A Swiftly Tilting Planet 957	Blue bottle synth selvage tumblr try-hard flannel kinfolk tofu raw denim.	66.0600000000000023	\N	4	2017-12-10 22:22:16.188468	2017-12-21 18:54:49.08137	0	book_cover.png	image/png	21149	2017-12-10 22:22:15.996754	1
970	What's Become of Waring 958	Salvia narwhal loko cred portland twee.	47.9500000000000028	\N	6	2017-12-10 22:22:16.399814	2017-12-21 18:54:49.086956	0	book_cover.png	image/png	21149	2017-12-10 22:22:16.197316	1
971	The Moving Finger 959	8-bit banjo synth mustache tacos stumptown artisan.	62.8699999999999974	\N	1	2017-12-10 22:22:16.615336	2017-12-21 18:54:49.092811	0	book_cover.png	image/png	21149	2017-12-10 22:22:16.411284	1
972	An Evil Cradling 960	Marfa readymade five dollar toast iphone.	49.4299999999999997	\N	8	2017-12-10 22:22:16.827275	2017-12-21 18:54:49.098708	0	book_cover.png	image/png	21149	2017-12-10 22:22:16.626403	1
973	Look to Windward 961	Tote bag five dollar toast post-ironic wolf.	23.7699999999999996	\N	2	2017-12-10 22:22:17.03988	2017-12-21 18:54:49.103969	0	book_cover.png	image/png	21149	2017-12-10 22:22:16.8412	1
975	The Moving Finger 963	Paleo trust fund blog literally you probably haven't heard of them artisan fanny pack.	21.620000000000001	\N	8	2017-12-10 22:22:17.464598	2017-12-21 18:54:49.116887	0	book_cover.png	image/png	21149	2017-12-10 22:22:17.262935	1
976	The Golden Apples of the Sun 964	Blog banjo narwhal fingerstache photo booth.	58.9699999999999989	\N	2	2017-12-10 22:22:17.677478	2017-12-21 18:54:49.122697	0	book_cover.png	image/png	21149	2017-12-10 22:22:17.478927	1
977	Mother Night 965	Tote bag sustainable vegan vhs.	52.5	\N	3	2017-12-10 22:22:17.891925	2017-12-21 18:54:49.128302	0	book_cover.png	image/png	21149	2017-12-10 22:22:17.687079	1
978	No Country for Old Men 966	Put a bird on it banjo plaid tacos whatever cleanse ennui gentrify.	18.4200000000000017	\N	1	2017-12-10 22:22:18.111844	2017-12-21 18:54:49.134927	0	book_cover.png	image/png	21149	2017-12-10 22:22:17.903328	1
979	Moab Is My Washpot 967	Pitchfork cred shoreditch sartorial.	63.8400000000000034	\N	2	2017-12-10 22:22:18.341869	2017-12-21 18:54:49.140648	0	book_cover.png	image/png	21149	2017-12-10 22:22:18.12042	1
980	Those Barren Leaves, Thrones, Dominations 968	Mlkshk hella mumblecore wolf.	19.5399999999999991	\N	5	2017-12-10 22:22:18.551715	2017-12-21 18:54:49.146546	0	book_cover.png	image/png	21149	2017-12-10 22:22:18.357259	1
981	From Here to Eternity 969	Pour-over chia letterpress umami lo-fi poutine kickstarter cardigan loko.	14.2300000000000004	\N	5	2017-12-10 22:22:18.769358	2017-12-21 18:54:49.151775	0	book_cover.png	image/png	21149	2017-12-10 22:22:18.565578	1
982	Dulce et Decorum Est 970	Austin chillwave neutra organic shabby chic.	53.4399999999999977	\N	2	2017-12-10 22:22:18.981851	2017-12-21 18:54:49.157168	0	book_cover.png	image/png	21149	2017-12-10 22:22:18.777779	1
983	When the Green Woods Laugh 971	Green juice yolo diy semiotics muggle magic vice fingerstache sartorial.	10.6799999999999997	\N	8	2017-12-10 22:22:19.192353	2017-12-21 18:54:49.162623	0	book_cover.png	image/png	21149	2017-12-10 22:22:18.993807	1
984	Rosemary Sutcliff 972	Marfa master brooklyn polaroid xoxo pug shoreditch wes anderson cardigan.	46.0700000000000003	\N	6	2017-12-10 22:22:19.412649	2017-12-21 18:54:49.168095	0	book_cover.png	image/png	21149	2017-12-10 22:22:19.200992	1
985	The Waste Land 973	Gluten-free meditation etsy normcore hella roof meggings diy authentic.	27.3299999999999983	\N	3	2017-12-10 22:22:19.652187	2017-12-21 18:54:49.173554	0	book_cover.png	image/png	21149	2017-12-10 22:22:19.427584	1
986	By Grand Central Station I Sat Down and Wept 974	Kogi quinoa taxidermy stumptown fanny pack sartorial xoxo carry.	49.6799999999999997	\N	6	2017-12-10 22:22:19.870643	2017-12-21 18:54:49.179015	0	book_cover.png	image/png	21149	2017-12-10 22:22:19.668446	1
987	Arms and the Man 975	Seitan jean shorts five dollar toast cred portland.	30.1999999999999993	\N	2	2017-12-10 22:22:20.11321	2017-12-21 18:54:49.184302	0	book_cover.png	image/png	21149	2017-12-10 22:22:19.884356	1
988	East of Eden 976	Ennui hashtag ugh deep v seitan.	52.5499999999999972	\N	4	2017-12-10 22:22:20.354454	2017-12-21 18:54:49.190144	0	book_cover.png	image/png	21149	2017-12-10 22:22:20.132566	1
989	In Dubious Battle 977	Dreamcatcher pitchfork humblebrag knausgaard food truck.	64.2900000000000063	\N	2	2017-12-10 22:22:20.599043	2017-12-21 18:54:49.196008	0	book_cover.png	image/png	21149	2017-12-10 22:22:20.368664	1
991	No Highway 979	Freegan gluten-free health narwhal umami synth.	29.0199999999999996	\N	6	2017-12-10 22:22:21.07282	2017-12-21 18:54:49.209366	0	book_cover.png	image/png	21149	2017-12-10 22:22:20.82897	1
992	Everything is Illuminated 980	Distillery banh mi goth tattooed street cred.	16.0500000000000007	\N	6	2017-12-10 22:22:21.295223	2017-12-21 18:54:49.215162	0	book_cover.png	image/png	21149	2017-12-10 22:22:21.085492	1
993	When the Green Woods Laugh 981	Irony chicharrones organic gluten-free selfies chia.	45.0600000000000023	\N	8	2017-12-10 22:22:21.522459	2017-12-21 18:54:49.220863	0	book_cover.png	image/png	21149	2017-12-10 22:22:21.314199	1
994	Terrible Swift Sword 982	Etsy offal park tilde pabst godard mustache disrupt.	9.30000000000000071	\N	4	2017-12-10 22:22:21.748096	2017-12-21 18:54:49.226272	0	book_cover.png	image/png	21149	2017-12-10 22:22:21.538313	1
995	The Wings of the Dove 983	Tofu hammock church-key selvage fixie truffaut chicharrones kombucha asymmetrical.	20.1900000000000013	\N	8	2017-12-10 22:22:22.003441	2017-12-21 18:54:49.231728	0	book_cover.png	image/png	21149	2017-12-10 22:22:21.767071	1
996	Far From the Madding Crowd 984	Tote bag normcore pbr&b bespoke vegan cornhole viral.	41.1499999999999986	\N	8	2017-12-10 22:22:22.220194	2017-12-21 18:54:49.237278	0	book_cover.png	image/png	21149	2017-12-10 22:22:22.014498	1
1	The Needle's Eye	Pitchfork wes anderson salvia vegan 3 wolf moon scenester umami.	39.990000000000002	\N	1	2017-12-10 22:18:34.819196	2017-12-21 18:54:42.605546	0	book_cover.png	image/png	21149	2017-12-10 22:18:34.375993	1
2	Time To Murder And Create	Gluten-free yr keytar knausgaard vhs pour-over blue bottle tattooed.	59.990000000000002	\N	2	2017-12-10 22:18:35.251835	2017-12-21 18:54:42.613132	0	book_cover.png	image/png	21149	2017-12-10 22:18:35.041817	1
21	What's Become of Waring 9	Direct trade humblebrag fingerstache yr you probably haven't heard of them poutine meh vinyl organic.	18.6700000000000017	\N	7	2017-12-10 22:18:39.567733	2017-12-21 18:54:42.751136	0	book_cover.png	image/png	21149	2017-12-10 22:18:39.222621	1
41	Terrible Swift Sword 29	Asymmetrical health muggle magic lomo jean shorts echo kogi before they sold out.	69.9399999999999977	\N	6	2017-12-10 22:18:44.262945	2017-12-21 18:54:42.899858	0	book_cover.png	image/png	21149	2017-12-10 22:18:44.045258	1
44	In Dubious Battle 32	Meggings fashion axe hella shoreditch crucifix banh mi muggle magic sartorial neutra.	69.5799999999999983	\N	6	2017-12-10 22:18:44.963689	2017-12-21 18:54:42.923828	0	book_cover.png	image/png	21149	2017-12-10 22:18:44.745583	1
65	Ring of Bright Water 53	Xoxo cardigan tote bag meh austin photo booth church-key yuccie.	34.259999999999998	\N	1	2017-12-10 22:18:49.710215	2017-12-21 18:54:43.049478	0	book_cover.png	image/png	21149	2017-12-10 22:18:49.490306	1
80	Vile Bodies 68	Wayfarers taxidermy intelligentsia tattooed try-hard vinyl listicle marfa.	23.5500000000000007	\N	8	2017-12-10 22:18:52.912662	2017-12-21 18:54:43.136724	0	book_cover.png	image/png	21149	2017-12-10 22:18:52.715459	1
83	A Catskill Eagle 71	Pop-up carry yuccie flannel tousled bespoke direct trade craft beer dreamcatcher.	22.9200000000000017	\N	8	2017-12-10 22:18:53.570141	2017-12-21 18:54:43.153413	0	book_cover.png	image/png	21149	2017-12-10 22:18:53.364629	1
104	Vanity Fair 92	Keffiyeh knausgaard keytar mixtape tote bag shoreditch normcore cray.	55.7700000000000031	\N	1	2017-12-10 22:18:58.401438	2017-12-21 18:54:43.272504	0	book_cover.png	image/png	21149	2017-12-10 22:18:58.190266	1
118	Bury My Heart at Wounded Knee 106	Trust fund disrupt mixtape austin.	63.3400000000000034	\N	3	2017-12-10 22:19:01.751371	2017-12-21 18:54:43.3567	0	book_cover.png	image/png	21149	2017-12-10 22:19:01.539444	1
129	The Widening Gyre 117	Helvetica single-origin coffee gastropub cred 3 wolf moon letterpress drinking biodiesel sartorial.	37.0600000000000023	\N	3	2017-12-10 22:19:04.276607	2017-12-21 18:54:43.445358	0	book_cover.png	image/png	21149	2017-12-10 22:19:04.050463	1
154	The Yellow Meads of Asphodel 142	Paleo marfa asymmetrical wayfarers crucifix literally beard everyday heirloom.	12.1199999999999992	\N	4	2017-12-10 22:19:10.319987	2017-12-21 18:54:43.599837	0	book_cover.png	image/png	21149	2017-12-10 22:19:10.053222	1
156	Specimen Days 144	Yolo shoreditch sustainable messenger bag sartorial vhs pop-up meditation.	24.379999999999999	\N	1	2017-12-10 22:19:10.793714	2017-12-21 18:54:43.610968	0	book_cover.png	image/png	21149	2017-12-10 22:19:10.582647	1
158	The Sun Also Rises 146	Selfies xoxo fanny pack farm-to-table tacos neutra cleanse pug diy.	57.4099999999999966	\N	8	2017-12-10 22:19:11.231739	2017-12-21 18:54:43.631466	0	book_cover.png	image/png	21149	2017-12-10 22:19:11.017051	1
177	The Violent Bear It Away 165	Vice raw denim selvage fixie art party biodiesel intelligentsia loko.	23.2100000000000009	\N	7	2017-12-10 22:19:15.461228	2017-12-21 18:54:43.744767	0	book_cover.png	image/png	21149	2017-12-10 22:19:15.2505	1
195	Rosemary Sutcliff 183	Raw denim tofu kogi irony chillwave crucifix park you probably haven't heard of them ramps.	58.5700000000000003	\N	3	2017-12-10 22:19:19.578516	2017-12-21 18:54:43.850102	0	book_cover.png	image/png	21149	2017-12-10 22:19:19.367845	1
211	The Cricket on the Hearth 199	Gentrify keffiyeh photo booth food truck asymmetrical vinegar actually art party ennui.	38.3800000000000026	\N	2	2017-12-10 22:19:23.148737	2017-12-21 18:54:43.959704	0	book_cover.png	image/png	21149	2017-12-10 22:19:22.938613	1
232	Nine Coaches Waiting 220	Intelligentsia typewriter yr austin tattooed carry trust fund flannel.	66.3100000000000023	\N	4	2017-12-10 22:19:27.917783	2017-12-21 18:54:44.080965	0	book_cover.png	image/png	21149	2017-12-10 22:19:27.662944	1
245	The Curious Incident of the Dog in the Night-Time 233	Bitters sustainable keytar +1 dreamcatcher waistcoat aesthetic yr 3 wolf moon.	61.9600000000000009	\N	3	2017-12-10 22:19:31.434257	2017-12-21 18:54:44.158023	0	book_cover.png	image/png	21149	2017-12-10 22:19:31.190441	1
263	By Grand Central Station I Sat Down and Wept 251	Truffaut umami craft beer wes anderson neutra whatever crucifix fingerstache single-origin coffee.	61.0399999999999991	\N	1	2017-12-10 22:19:36.068983	2017-12-21 18:54:44.262839	0	book_cover.png	image/png	21149	2017-12-10 22:19:35.716014	1
998	That Good Night 986	Farm-to-table fixie banh mi bicycle rights salvia lumbersexual intelligentsia.	47.8100000000000023	\N	1	2017-12-10 22:22:22.664308	2017-12-21 18:54:49.248322	0	book_cover.png	image/png	21149	2017-12-10 22:22:22.464206	1
999	All the King's Men 987	Poutine gluten-free kombucha kogi letterpress gentrify chartreuse cold-pressed blog.	34.3500000000000014	\N	7	2017-12-10 22:22:22.869794	2017-12-21 18:54:49.253933	0	book_cover.png	image/png	21149	2017-12-10 22:22:22.674239	1
1000	I Know Why the Caged Bird Sings 988	Vhs ugh direct trade squid ennui crucifix banh mi gentrify distillery.	69.0799999999999983	\N	7	2017-12-10 22:22:23.083359	2017-12-21 18:54:49.259366	0	book_cover.png	image/png	21149	2017-12-10 22:22:22.885586	1
1001	Tiger! Tiger! 989	Wayfarers echo irony distillery gentrify gluten-free.	62.4600000000000009	\N	4	2017-12-10 22:22:23.296374	2017-12-21 18:54:49.264955	0	book_cover.png	image/png	21149	2017-12-10 22:22:23.094123	1
1002	I Sing the Body Electric 990	Cleanse forage intelligentsia health +1.	62.0300000000000011	\N	1	2017-12-10 22:22:23.517932	2017-12-21 18:54:49.270327	0	book_cover.png	image/png	21149	2017-12-10 22:22:23.311247	1
1003	The Yellow Meads of Asphodel 991	Wayfarers everyday blue bottle brooklyn freegan.	42.1099999999999994	\N	5	2017-12-10 22:22:23.751356	2017-12-21 18:54:49.275735	0	book_cover.png	image/png	21149	2017-12-10 22:22:23.534603	1
1004	Fear and Trembling 992	Xoxo sustainable bespoke keffiyeh.	18.7199999999999989	\N	5	2017-12-10 22:22:23.969099	2017-12-21 18:54:49.281178	0	book_cover.png	image/png	21149	2017-12-10 22:22:23.762149	1
1005	Blithe Spirit 993	8-bit williamsburg fanny pack banh mi.	31.5799999999999983	\N	5	2017-12-10 22:22:24.182426	2017-12-21 18:54:49.286545	0	book_cover.png	image/png	21149	2017-12-10 22:22:23.983937	1
1006	To Sail Beyond the Sunset 994	Keffiyeh salvia keytar banh mi try-hard blog bicycle rights.	19.5700000000000003	\N	4	2017-12-10 22:22:24.396285	2017-12-21 18:54:49.291896	0	book_cover.png	image/png	21149	2017-12-10 22:22:24.19457	1
1007	An Instant In The Wind 995	Intelligentsia meditation knausgaard irony.	41.2000000000000028	\N	1	2017-12-10 22:22:24.621882	2017-12-21 18:54:49.297229	0	book_cover.png	image/png	21149	2017-12-10 22:22:24.412419	1
1009	By Grand Central Station I Sat Down and Wept 997	Sriracha keytar sartorial godard 3 wolf moon occupy fanny pack franzen williamsburg.	36.9200000000000017	\N	6	2017-12-10 22:22:25.06304	2017-12-21 18:54:49.307997	0	book_cover.png	image/png	21149	2017-12-10 22:22:24.8612	1
1010	The Yellow Meads of Asphodel 998	Five dollar toast mustache helvetica kinfolk hashtag meggings scenester.	17.5700000000000003	\N	1	2017-12-10 22:22:25.279286	2017-12-21 18:54:49.313581	0	book_cover.png	image/png	21149	2017-12-10 22:22:25.07946	1
1011	The Proper Study 999	Banjo wayfarers hella fixie fingerstache five dollar toast bicycle rights.	14.9100000000000001	\N	2	2017-12-10 22:22:25.498023	2017-12-21 18:54:49.319495	0	book_cover.png	image/png	21149	2017-12-10 22:22:25.291241	1
269	The Soldier's Art 257	Migas retro selvage stumptown wolf pinterest kickstarter authentic.	15.4000000000000004	\N	7	2017-12-10 22:19:37.47664	2017-12-21 18:54:44.297381	0	book_cover.png	image/png	21149	2017-12-10 22:19:37.257668	1
270	Carrion Comfort 258	Narwhal small batch wes anderson messenger bag hashtag crucifix letterpress.	25.629999999999999	\N	3	2017-12-10 22:19:37.69816	2017-12-21 18:54:44.303082	0	book_cover.png	image/png	21149	2017-12-10 22:19:37.487173	1
290	The Wealth of Nations 278	Locavore quinoa 3 wolf moon portland kitsch etsy 8-bit health truffaut.	43.7800000000000011	\N	4	2017-12-10 22:19:42.495928	2017-12-21 18:54:44.431254	0	book_cover.png	image/png	21149	2017-12-10 22:19:42.294848	1
308	Vanity Fair 296	Twee scenester mixtape pork belly beard shoreditch keytar.	42.5399999999999991	\N	1	2017-12-10 22:19:46.907302	2017-12-21 18:54:44.535703	0	book_cover.png	image/png	21149	2017-12-10 22:19:46.632733	1
309	The Wind's Twelve Quarters 297	Gastropub helvetica tote bag ugh waistcoat artisan sartorial you probably haven't heard of them.	40.0600000000000023	\N	3	2017-12-10 22:19:47.174538	2017-12-21 18:54:44.54146	0	book_cover.png	image/png	21149	2017-12-10 22:19:46.922099	1
330	The Cricket on the Hearth 318	Seitan try-hard fixie aesthetic gentrify xoxo pitchfork yuccie venmo.	30.1400000000000006	\N	7	2017-12-10 22:19:51.973529	2017-12-21 18:54:44.663588	0	book_cover.png	image/png	21149	2017-12-10 22:19:51.763973	1
344	Little Hands Clapping 332	Kickstarter occupy offal shoreditch hashtag poutine humblebrag.	22.7899999999999991	\N	7	2017-12-10 22:19:55.205737	2017-12-21 18:54:44.757572	0	book_cover.png	image/png	21149	2017-12-10 22:19:54.993722	1
345	Little Hands Clapping 333	Direct trade umami put a bird on it roof vinyl humblebrag williamsburg migas.	35.4099999999999966	\N	3	2017-12-10 22:19:55.428649	2017-12-21 18:54:44.763053	0	book_cover.png	image/png	21149	2017-12-10 22:19:55.216059	1
367	No Country for Old Men 355	Small batch keytar deep v ennui pabst park raw denim mixtape.	63.6599999999999966	\N	4	2017-12-10 22:20:00.374855	2017-12-21 18:54:44.898959	0	book_cover.png	image/png	21149	2017-12-10 22:20:00.161638	1
382	The Green Bay Tree 370	Waistcoat pop-up vice whatever semiotics health single-origin coffee.	41.0700000000000003	\N	7	2017-12-10 22:20:03.833218	2017-12-21 18:54:44.988586	0	book_cover.png	image/png	21149	2017-12-10 22:20:03.631985	1
386	The Way of All Flesh 374	Kombucha venmo 90's post-ironic try-hard flannel banjo schlitz fashion axe.	7.15000000000000036	\N	7	2017-12-10 22:20:04.699283	2017-12-21 18:54:45.01154	0	book_cover.png	image/png	21149	2017-12-10 22:20:04.499645	1
407	Blood's a Rover 395	Listicle tousled wes anderson venmo authentic ramps banh mi viral.	54.6499999999999986	\N	4	2017-12-10 22:20:09.487341	2017-12-21 18:54:45.132661	0	book_cover.png	image/png	21149	2017-12-10 22:20:09.274962	1
421	Let Us Now Praise Famous Men 409	Echo venmo chambray quinoa semiotics food truck.	57.0900000000000034	\N	8	2017-12-10 22:20:12.516802	2017-12-21 18:54:45.212325	0	book_cover.png	image/png	21149	2017-12-10 22:20:12.308546	1
423	That Good Night 411	Jean shorts next level master hoodie meggings scenester synth cred normcore.	65.519999999999996	\N	1	2017-12-10 22:20:12.952502	2017-12-21 18:54:45.224824	0	book_cover.png	image/png	21149	2017-12-10 22:20:12.746293	1
443	Down to a Sunless Sea 431	Before they sold out dreamcatcher celiac pinterest retro shabby chic chillwave squid 3 wolf moon.	53.509999999999998	\N	4	2017-12-10 22:20:17.438451	2017-12-21 18:54:45.336571	0	book_cover.png	image/png	21149	2017-12-10 22:20:17.234038	1
459	Blood's a Rover 447	Williamsburg small batch seitan fingerstache 90's pinterest helvetica etsy cliche.	61.6400000000000006	\N	7	2017-12-10 22:20:21.236709	2017-12-21 18:54:45.444396	0	book_cover.png	image/png	21149	2017-12-10 22:20:21.020562	1
467	Eyeless in Gaza 455	Banjo shabby chic wes anderson wayfarers williamsburg scenester biodiesel fashion axe jean shorts.	44.2899999999999991	\N	2	2017-12-10 22:20:23.052912	2017-12-21 18:54:45.493258	0	book_cover.png	image/png	21149	2017-12-10 22:20:22.846403	1
489	Number the Stars 477	Next level 8-bit venmo fashion axe quinoa yuccie tacos asymmetrical photo booth.	21.0199999999999996	\N	4	2017-12-10 22:20:28.167993	2017-12-21 18:54:45.621751	0	book_cover.png	image/png	21149	2017-12-10 22:20:27.961637	1
498	Far From the Madding Crowd 486	Gluten-free health polaroid franzen church-key.	61.7299999999999969	\N	3	2017-12-10 22:20:30.174319	2017-12-21 18:54:45.668206	0	book_cover.png	image/png	21149	2017-12-10 22:20:29.961139	1
506	No Highway 494	Before they sold out yuccie celiac twee pickled flannel pabst carry street.	11.8200000000000003	\N	5	2017-12-10 22:20:31.95713	2017-12-21 18:54:45.713598	0	book_cover.png	image/png	21149	2017-12-10 22:20:31.753875	1
522	Stranger in a Strange Land 510	Locavore seitan mixtape green juice banh mi bicycle rights.	21.2600000000000016	\N	6	2017-12-10 22:20:35.522299	2017-12-21 18:54:45.8372	0	book_cover.png	image/png	21149	2017-12-10 22:20:35.31006	1
537	Have His Carcase 525	Wes anderson street wolf leggings cray pbr&b salvia.	49.5399999999999991	\N	6	2017-12-10 22:20:39.099844	2017-12-21 18:54:45.970165	0	book_cover.png	image/png	21149	2017-12-10 22:20:38.792363	1
542	Blue Remembered Earth 530	Ethical you probably haven't heard of them aesthetic pour-over shabby chic chicharrones bushwick scenester.	22.7600000000000016	\N	1	2017-12-10 22:20:40.198227	2017-12-21 18:54:46.019677	0	book_cover.png	image/png	21149	2017-12-10 22:20:39.992698	1
569	The Far-Distant Oxus 557	Tofu pickled aesthetic drinking pour-over literally freegan skateboard.	69.7000000000000028	\N	6	2017-12-10 22:20:46.304514	2017-12-21 18:54:46.288525	0	book_cover.png	image/png	21149	2017-12-10 22:20:46.086912	1
575	The Yellow Meads of Asphodel 563	Green juice diy jean shorts 3 wolf moon kogi intelligentsia.	67.019999999999996	\N	7	2017-12-10 22:20:47.704818	2017-12-21 18:54:46.349927	0	book_cover.png	image/png	21149	2017-12-10 22:20:47.484838	1
585	The Sun Also Rises 573	Quinoa mumblecore tacos kitsch flexitarian williamsburg tousled sartorial drinking.	14.7100000000000009	\N	2	2017-12-10 22:20:49.97268	2017-12-21 18:54:46.455612	0	book_cover.png	image/png	21149	2017-12-10 22:20:49.712826	1
603	The Mermaids Singing 591	Microdosing bicycle rights pork belly pour-over vinyl viral food truck mumblecore yolo.	18.6000000000000014	\N	8	2017-12-10 22:20:54.050666	2017-12-21 18:54:46.638653	0	book_cover.png	image/png	21149	2017-12-10 22:20:53.839027	1
613	No Country for Old Men 601	Lomo fanny pack selfies echo cray pickled diy microdosing stumptown.	66.5699999999999932	\N	3	2017-12-10 22:20:56.321257	2017-12-21 18:54:46.737696	0	book_cover.png	image/png	21149	2017-12-10 22:20:56.115183	1
623	The Stars' Tennis Balls 611	Deep v fingerstache banh mi listicle meggings lo-fi lumbersexual.	36.3200000000000003	\N	2	2017-12-10 22:20:58.589743	2017-12-21 18:54:46.841959	0	book_cover.png	image/png	21149	2017-12-10 22:20:58.377749	1
643	The Curious Incident of the Dog in the Night-Time 631	Waistcoat biodiesel wes anderson sriracha seitan loko.	9.40000000000000036	\N	7	2017-12-10 22:21:03.093588	2017-12-21 18:54:46.994131	0	book_cover.png	image/png	21149	2017-12-10 22:21:02.856884	1
652	The Violent Bear It Away 640	Art party farm-to-table health meh readymade kitsch trust fund normcore sustainable.	63.5300000000000011	\N	6	2017-12-10 22:21:05.155309	2017-12-21 18:54:47.043649	0	book_cover.png	image/png	21149	2017-12-10 22:21:04.931352	1
658	Shall not Perish 646	Cray mixtape yolo hashtag locavore asymmetrical pop-up.	44.1700000000000017	\N	8	2017-12-10 22:21:06.527969	2017-12-21 18:54:47.078266	0	book_cover.png	image/png	21149	2017-12-10 22:21:06.305567	1
675	In Dubious Battle 663	Bicycle rights master biodiesel roof selvage vice dreamcatcher waistcoat.	21.6799999999999997	\N	8	2017-12-10 22:21:10.386136	2017-12-21 18:54:47.184882	0	book_cover.png	image/png	21149	2017-12-10 22:21:10.176361	1
690	The Sun Also Rises 678	Yuccie bicycle rights waistcoat small batch you probably haven't heard of them forage gentrify flexitarian.	50.1300000000000026	\N	2	2017-12-10 22:21:13.725518	2017-12-21 18:54:47.281816	0	book_cover.png	image/png	21149	2017-12-10 22:21:13.525251	1
700	The Waste Land 688	Knausgaard cold-pressed you probably haven't heard of them artisan wayfarers mixtape chicharrones.	56.7999999999999972	\N	8	2017-12-10 22:21:15.956643	2017-12-21 18:54:47.340283	0	book_cover.png	image/png	21149	2017-12-10 22:21:15.732161	1
719	Brandy of the Damned 707	Pabst chillwave 3 wolf moon chambray polaroid dreamcatcher godard.	65.5600000000000023	\N	5	2017-12-10 22:21:20.162968	2017-12-21 18:54:47.46932	0	book_cover.png	image/png	21149	2017-12-10 22:21:19.966307	1
730	A Farewell to Arms 718	Tilde pickled everyday kinfolk dreamcatcher cliche authentic cleanse.	39.0200000000000031	\N	8	2017-12-10 22:21:22.637553	2017-12-21 18:54:47.531299	0	book_cover.png	image/png	21149	2017-12-10 22:21:22.428852	1
743	Tiger! Tiger! 731	Selfies yr letterpress yuccie 8-bit heirloom thundercats hammock hella.	7.79000000000000004	\N	6	2017-12-10 22:21:25.633109	2017-12-21 18:54:47.617317	0	book_cover.png	image/png	21149	2017-12-10 22:21:25.427155	1
764	No Longer at Ease 752	8-bit pickled cleanse muggle magic neutra.	40.7700000000000031	\N	4	2017-12-10 22:21:30.414867	2017-12-21 18:54:47.771018	0	book_cover.png	image/png	21149	2017-12-10 22:21:30.181921	1
768	A Handful of Dust 756	Master squid organic letterpress meditation.	50.990000000000002	\N	6	2017-12-10 22:21:31.336333	2017-12-21 18:54:47.799549	0	book_cover.png	image/png	21149	2017-12-10 22:21:31.123874	1
783	When the Green Woods Laugh 771	Humblebrag vinegar leggings cronut.	44.6300000000000026	\N	8	2017-12-10 22:21:34.898853	2017-12-21 18:54:47.909488	0	book_cover.png	image/png	21149	2017-12-10 22:21:34.686265	1
798	The Green Bay Tree 786	Artisan biodiesel thundercats raw denim hashtag bicycle rights keytar vinegar.	46.740000000000002	\N	5	2017-12-10 22:21:38.311923	2017-12-21 18:54:48.01127	0	book_cover.png	image/png	21149	2017-12-10 22:21:38.100828	1
806	Françoise Sagan 794	Church-key vinegar chia scenester swag twee sartorial echo.	10.4100000000000001	\N	3	2017-12-10 22:21:40.198647	2017-12-21 18:54:48.06348	0	book_cover.png	image/png	21149	2017-12-10 22:21:39.989296	1
814	The Violent Bear It Away 802	Truffaut actually squid kale chips humblebrag irony hashtag pinterest xoxo.	19.4100000000000001	\N	4	2017-12-10 22:21:41.907522	2017-12-21 18:54:48.1405	0	book_cover.png	image/png	21149	2017-12-10 22:21:41.6985	1
836	Let Us Now Praise Famous Men 824	Post-ironic pop-up vinyl kale chips kinfolk portland.	68.5999999999999943	\N	3	2017-12-10 22:21:46.834047	2017-12-21 18:54:48.268603	0	book_cover.png	image/png	21149	2017-12-10 22:21:46.614332	1
844	In a Dry Season 832	Narwhal post-ironic gentrify tofu bicycle rights.	20.629999999999999	\N	2	2017-12-10 22:21:48.708222	2017-12-21 18:54:48.314357	0	book_cover.png	image/png	21149	2017-12-10 22:21:48.498722	1
849	The Road Less Traveled 837	Kinfolk heirloom jean shorts roof food truck squid cold-pressed trust fund.	50.9500000000000028	\N	1	2017-12-10 22:21:49.848816	2017-12-21 18:54:48.343632	0	book_cover.png	image/png	21149	2017-12-10 22:21:49.648922	1
870	Eyeless in Gaza 858	Vinegar pabst heirloom austin tattooed mustache etsy fanny pack neutra.	21.5599999999999987	\N	4	2017-12-10 22:21:54.408526	2017-12-21 18:54:48.477323	0	book_cover.png	image/png	21149	2017-12-10 22:21:54.21266	1
882	Terrible Swift Sword 870	Typewriter hella mumblecore post-ironic bushwick poutine.	36.8800000000000026	\N	8	2017-12-10 22:21:56.997184	2017-12-21 18:54:48.547095	0	book_cover.png	image/png	21149	2017-12-10 22:21:56.795245	1
892	Little Hands Clapping 880	Bicycle rights kogi tousled +1 fashion axe cliche gluten-free seitan.	24.6700000000000017	\N	5	2017-12-10 22:21:59.16317	2017-12-21 18:54:48.604905	0	book_cover.png	image/png	21149	2017-12-10 22:21:58.972425	1
910	An Acceptable Time 898	Typewriter pinterest fanny pack pop-up wes anderson offal lomo pickled.	17.379999999999999	\N	4	2017-12-10 22:22:03.033057	2017-12-21 18:54:48.711331	0	book_cover.png	image/png	21149	2017-12-10 22:22:02.818355	1
921	No Highway 909	Squid mixtape typewriter pickled wes anderson pork belly knausgaard.	14.1899999999999995	\N	6	2017-12-10 22:22:05.508896	2017-12-21 18:54:48.776283	0	book_cover.png	image/png	21149	2017-12-10 22:22:05.299298	1
922	The Golden Apples of the Sun 910	Bushwick before they sold out kale chips freegan yr microdosing blog.	40.9200000000000017	\N	3	2017-12-10 22:22:05.751505	2017-12-21 18:54:48.782602	0	book_cover.png	image/png	21149	2017-12-10 22:22:05.519609	1
944	The Mirror Crack'd from Side to Side 932	Helvetica gentrify iphone paleo drinking brunch.	32.2299999999999969	\N	7	2017-12-10 22:22:10.694831	2017-12-21 18:54:48.926669	0	book_cover.png	image/png	21149	2017-12-10 22:22:10.497187	1
959	The Moving Toyshop 947	Plaid forage five dollar toast truffaut wes anderson post-ironic.	40.3100000000000023	\N	8	2017-12-10 22:22:14.012699	2017-12-21 18:54:49.023505	0	book_cover.png	image/png	21149	2017-12-10 22:22:13.809576	1
974	Great Work of Time 962	Celiac pinterest chicharrones iphone cronut drinking.	18.2899999999999991	\N	1	2017-12-10 22:22:17.254214	2017-12-21 18:54:49.11005	0	book_cover.png	image/png	21149	2017-12-10 22:22:17.054009	1
990	For Whom the Bell Tolls 978	3 wolf moon kickstarter kale chips meditation dreamcatcher phlogiston pop-up.	47.740000000000002	\N	7	2017-12-10 22:22:20.811971	2017-12-21 18:54:49.203435	0	book_cover.png	image/png	21149	2017-12-10 22:22:20.611076	1
997	Bury My Heart at Wounded Knee 985	Listicle fashion axe ramps cronut.	13.4900000000000002	\N	1	2017-12-10 22:22:22.444582	2017-12-21 18:54:49.242792	0	book_cover.png	image/png	21149	2017-12-10 22:22:22.237086	1
1008	Specimen Days 996	Phlogiston pitchfork twee asymmetrical pop-up fingerstache aesthetic ethical salvia.	11.3900000000000006	\N	8	2017-12-10 22:22:24.849686	2017-12-21 18:54:49.302506	0	book_cover.png	image/png	21149	2017-12-10 22:22:24.63691	1
1012	meditation	Thundercats listicle messenger bag leggings art party ramps kitsch franzen.	92.1299999999999955	\N	9	2017-12-21 18:54:49.836941	2017-12-21 18:54:49.836941	0	book_cover.png	image/png	21149	2017-12-21 18:54:49.658549	2
1013	YOLO	Roof austin fixie jean shorts.	35.5	\N	9	2017-12-21 18:54:50.018943	2017-12-21 18:54:50.018943	0	book_cover.png	image/png	21149	2017-12-21 18:54:49.8467	2
1014	umami	Vegan cred vhs migas umami brooklyn banjo park.	43.1099999999999994	\N	9	2017-12-21 18:54:50.186203	2017-12-21 18:54:50.186203	0	book_cover.png	image/png	21149	2017-12-21 18:54:50.027703	2
1015	readymade	Listicle forage chia butcher gastropub mustache tousled neutra stumptown.	54.4699999999999989	\N	9	2017-12-21 18:54:50.353665	2017-12-21 18:54:50.353665	0	book_cover.png	image/png	21149	2017-12-21 18:54:50.19536	2
1016	iPhone	Authentic skateboard vice slow-carb five dollar toast.	95.8900000000000006	\N	9	2017-12-21 18:54:50.531366	2017-12-21 18:54:50.531366	0	book_cover.png	image/png	21149	2017-12-21 18:54:50.36168	2
1017	chartreuse	Church-key raw denim cornhole squid yolo mixtape pug.	98.25	\N	10	2017-12-21 18:54:50.705617	2017-12-21 18:54:50.705617	0	book_cover.png	image/png	21149	2017-12-21 18:54:50.539803	2
1018	bushwick	Williamsburg meggings cliche humblebrag banjo.	53.1000000000000014	\N	10	2017-12-21 18:54:50.897164	2017-12-21 18:54:50.897164	0	book_cover.png	image/png	21149	2017-12-21 18:54:50.71409	2
1019	skateboard	Wolf ramps tacos humblebrag hashtag.	82.6599999999999966	\N	10	2017-12-21 18:54:51.080924	2017-12-21 18:54:51.080924	0	book_cover.png	image/png	21149	2017-12-21 18:54:50.906137	2
1020	90's	Cliche bicycle rights banjo 8-bit five dollar toast.	10.7699999999999996	\N	10	2017-12-21 18:54:51.262546	2017-12-21 18:54:51.262546	0	book_cover.png	image/png	21149	2017-12-21 18:54:51.089805	2
1021	plaid	Roof scenester distillery vinegar asymmetrical literally squid.	79.0699999999999932	\N	10	2017-12-21 18:54:51.436793	2017-12-21 18:54:51.436793	0	book_cover.png	image/png	21149	2017-12-21 18:54:51.270982	2
1022	stumptown	Marfa plaid ramps cold-pressed tote bag squid hammock next level paleo.	33.5399999999999991	\N	11	2017-12-21 18:54:51.602769	2017-12-21 18:54:51.602769	0	book_cover.png	image/png	21149	2017-12-21 18:54:51.445201	3
1023	artisan	Fingerstache messenger bag chillwave before they sold out distillery.	91.9500000000000028	\N	11	2017-12-21 18:54:51.771077	2017-12-21 18:54:51.771077	0	book_cover.png	image/png	21149	2017-12-21 18:54:51.611309	3
1024	cold-pressed	Poutine +1 butcher cred readymade cronut.	37.0300000000000011	\N	11	2017-12-21 18:54:51.949322	2017-12-21 18:54:51.949322	0	book_cover.png	image/png	21149	2017-12-21 18:54:51.779945	3
1025	post-ironic	Skateboard bespoke tilde green juice tote bag gentrify butcher.	49.6700000000000017	\N	11	2017-12-21 18:54:52.117212	2017-12-21 18:54:52.117212	0	book_cover.png	image/png	21149	2017-12-21 18:54:51.957323	3
1026	cronut	Mixtape cleanse flexitarian direct trade.	11.6199999999999992	\N	11	2017-12-21 18:54:52.286756	2017-12-21 18:54:52.286756	0	book_cover.png	image/png	21149	2017-12-21 18:54:52.129065	3
1027	mlkshk	Blog plaid chartreuse marfa jean shorts church-key waistcoat vegan knausgaard.	40.490000000000002	\N	12	2017-12-21 18:54:52.465572	2017-12-21 18:54:52.465572	0	book_cover.png	image/png	21149	2017-12-21 18:54:52.295352	3
1028	loko	Tacos muggle magic food truck heirloom meggings cronut flexitarian.	29.3399999999999999	\N	12	2017-12-21 18:54:52.635072	2017-12-21 18:54:52.635072	0	book_cover.png	image/png	21149	2017-12-21 18:54:52.474806	3
1029	portland	Freegan bushwick pabst yuccie.	85.3599999999999994	\N	12	2017-12-21 18:54:52.800544	2017-12-21 18:54:52.800544	0	book_cover.png	image/png	21149	2017-12-21 18:54:52.643371	3
1030	church-key	Keytar leggings thundercats gastropub.	17.3099999999999987	\N	12	2017-12-21 18:54:52.982898	2017-12-21 18:54:52.982898	0	book_cover.png	image/png	21149	2017-12-21 18:54:52.808699	3
1031	disrupt	Meh bespoke chartreuse leggings actually vhs.	47.7199999999999989	\N	12	2017-12-21 18:54:53.151289	2017-12-21 18:54:53.151289	0	book_cover.png	image/png	21149	2017-12-21 18:54:52.992238	3
1032	chillwave	Distillery kitsch sustainable flexitarian stumptown kombucha.	50.9099999999999966	\N	13	2017-12-21 18:54:53.318311	2017-12-21 18:54:53.318311	0	book_cover.png	image/png	21149	2017-12-21 18:54:53.159686	4
1033	lomo	Sartorial post-ironic portland stumptown aesthetic muggle magic.	13.4600000000000009	\N	13	2017-12-21 18:54:53.492926	2017-12-21 18:54:53.492926	0	book_cover.png	image/png	21149	2017-12-21 18:54:53.326719	4
1034	locavore	Lumbersexual waistcoat goth brunch crucifix mumblecore mustache heirloom schlitz.	40.9500000000000028	\N	13	2017-12-21 18:54:53.657955	2017-12-21 18:54:53.657955	0	book_cover.png	image/png	21149	2017-12-21 18:54:53.502715	4
1035	beard	Muggle magic kombucha polaroid banjo pickled.	80.7099999999999937	\N	13	2017-12-21 18:54:53.826094	2017-12-21 18:54:53.826094	0	book_cover.png	image/png	21149	2017-12-21 18:54:53.667297	4
1036	carry	Hoodie vhs typewriter pork belly mumblecore forage small batch cold-pressed meggings.	92.2399999999999949	\N	13	2017-12-21 18:54:53.999321	2017-12-21 18:54:53.999321	0	book_cover.png	image/png	21149	2017-12-21 18:54:53.834735	4
1037	chambray	Tofu celiac single-origin coffee vinegar trust fund brunch.	45.8200000000000003	\N	14	2017-12-21 18:54:54.161888	2017-12-21 18:54:54.161888	0	book_cover.png	image/png	21149	2017-12-21 18:54:54.008149	4
1038	forage	Blog photo booth bushwick ramps.	55.4299999999999997	\N	14	2017-12-21 18:54:54.336184	2017-12-21 18:54:54.336184	0	book_cover.png	image/png	21149	2017-12-21 18:54:54.170752	4
1039	cleanse	Hashtag aesthetic loko letterpress lumbersexual vice vinegar xoxo kickstarter.	34.0300000000000011	\N	14	2017-12-21 18:54:54.510431	2017-12-21 18:54:54.510431	0	book_cover.png	image/png	21149	2017-12-21 18:54:54.344527	4
1040	street	Chia bushwick williamsburg skateboard.	76.4699999999999989	\N	14	2017-12-21 18:54:54.681914	2017-12-21 18:54:54.681914	0	book_cover.png	image/png	21149	2017-12-21 18:54:54.520573	4
1041	pug	Tattooed direct trade venmo bespoke.	78.7600000000000051	\N	14	2017-12-21 18:54:54.854677	2017-12-21 18:54:54.854677	0	book_cover.png	image/png	21149	2017-12-21 18:54:54.697283	4
1042	blog	Distillery tacos fashion axe lomo williamsburg vice vhs tote bag.	66.7099999999999937	\N	15	2017-12-21 18:54:55.035055	2017-12-21 18:54:55.035055	0	book_cover.png	image/png	21149	2017-12-21 18:54:54.862849	5
1043	salvia	Hoodie selvage truffaut church-key.	76.25	\N	15	2017-12-21 18:54:55.205078	2017-12-21 18:54:55.205078	0	book_cover.png	image/png	21149	2017-12-21 18:54:55.044619	5
1044	lo-fi	Godard kickstarter you probably haven't heard of them irony cardigan truffaut.	49.3100000000000023	\N	15	2017-12-21 18:54:55.375567	2017-12-21 18:54:55.375567	0	book_cover.png	image/png	21149	2017-12-21 18:54:55.213973	5
1045	kombucha	Meggings +1 retro yr kombucha hammock deep v.	5.00999999999999979	\N	15	2017-12-21 18:54:55.553967	2017-12-21 18:54:55.553967	0	book_cover.png	image/png	21149	2017-12-21 18:54:55.391257	5
1046	tilde	Poutine chia migas jean shorts artisan schlitz lumbersexual.	47.7000000000000028	\N	15	2017-12-21 18:54:55.722445	2017-12-21 18:54:55.722445	0	book_cover.png	image/png	21149	2017-12-21 18:54:55.564276	5
1047	keffiyeh	Kale chips actually you probably haven't heard of them dreamcatcher.	47.6300000000000026	\N	16	2017-12-21 18:54:55.890129	2017-12-21 18:54:55.890129	0	book_cover.png	image/png	21149	2017-12-21 18:54:55.731582	5
1048	kogi	Cardigan etsy cornhole cred listicle beard muggle magic cronut pop-up.	18.8099999999999987	\N	16	2017-12-21 18:54:56.065176	2017-12-21 18:54:56.065176	0	book_cover.png	image/png	21149	2017-12-21 18:54:55.907345	5
1049	cornhole	Knausgaard yr blog beard.	59.7000000000000028	\N	16	2017-12-21 18:54:56.232145	2017-12-21 18:54:56.232145	0	book_cover.png	image/png	21149	2017-12-21 18:54:56.074582	5
1050	selfies	Craft beer xoxo chia diy offal blue bottle chambray normcore irony.	31.120000000000001	\N	16	2017-12-21 18:54:56.407724	2017-12-21 18:54:56.407724	0	book_cover.png	image/png	21149	2017-12-21 18:54:56.241222	5
1051	bitters	Yolo park vegan ethical craft beer.	75.0400000000000063	\N	16	2017-12-21 18:54:56.58014	2017-12-21 18:54:56.58014	0	book_cover.png	image/png	21149	2017-12-21 18:54:56.41823	5
1052	whatever	Art party pug everyday twee umami single-origin coffee try-hard normcore banjo.	16.8099999999999987	\N	17	2017-12-21 18:54:56.746614	2017-12-21 18:54:56.746614	0	book_cover.png	image/png	21149	2017-12-21 18:54:56.589232	6
1053	butcher	Fingerstache heirloom cray farm-to-table skateboard kitsch phlogiston health sartorial.	51.1899999999999977	\N	17	2017-12-21 18:54:56.925174	2017-12-21 18:54:56.925174	0	book_cover.png	image/png	21149	2017-12-21 18:54:56.756846	6
1054	DIY	Paleo blue bottle wolf bespoke.	50.9799999999999969	\N	17	2017-12-21 18:54:57.11394	2017-12-21 18:54:57.11394	0	book_cover.png	image/png	21149	2017-12-21 18:54:56.936956	6
1055	keytar	Gluten-free tumblr hashtag pitchfork health blue bottle chia art party retro.	98.8299999999999983	\N	17	2017-12-21 18:54:57.283635	2017-12-21 18:54:57.283635	0	book_cover.png	image/png	21149	2017-12-21 18:54:57.123675	6
1056	polaroid	Messenger bag tilde humblebrag viral mixtape pug salvia next level raw denim.	87.5499999999999972	\N	17	2017-12-21 18:54:57.467088	2017-12-21 18:54:57.467088	0	book_cover.png	image/png	21149	2017-12-21 18:54:57.293451	6
1057	actually	Tacos twee street retro master roof next level meggings chillwave.	62.3599999999999994	\N	18	2017-12-21 18:54:57.635757	2017-12-21 18:54:57.635757	0	book_cover.png	image/png	21149	2017-12-21 18:54:57.476465	6
1058	quinoa	Raw denim ugh gentrify waistcoat sustainable selfies.	54.5200000000000031	\N	18	2017-12-21 18:54:57.80234	2017-12-21 18:54:57.80234	0	book_cover.png	image/png	21149	2017-12-21 18:54:57.645502	6
1059	scenester	Try-hard pinterest quinoa church-key tofu bicycle rights direct trade.	40.9600000000000009	\N	18	2017-12-21 18:54:57.983187	2017-12-21 18:54:57.983187	0	book_cover.png	image/png	21149	2017-12-21 18:54:57.811607	6
1060	synth	Beard leggings synth intelligentsia readymade butcher church-key distillery sriracha.	15.8100000000000005	\N	18	2017-12-21 18:54:58.150651	2017-12-21 18:54:58.150651	0	book_cover.png	image/png	21149	2017-12-21 18:54:57.993421	6
1061	tumblr	Retro tacos pabst viral ethical brooklyn kombucha cornhole poutine.	18.9499999999999993	\N	18	2017-12-21 18:54:58.324592	2017-12-21 18:54:58.324592	0	book_cover.png	image/png	21149	2017-12-21 18:54:58.16085	6
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CURRENT_USER
--

SELECT pg_catalog.setval('items_id_seq', 1061, true);


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY messages (id, content, user_id, chatroom_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CURRENT_USER
--

SELECT pg_catalog.setval('messages_id_seq', 1, false);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY order_items (id, item_id, order_id, created_at, updated_at, quantity, price) FROM stdin;
1	141	1	2017-12-10 22:22:25.656803	2017-12-21 18:54:41.648099	3	20.67
2	734	2	2017-12-10 22:22:25.672759	2017-12-21 18:54:41.655786	1	47.63
3	387	3	2017-12-10 22:22:25.684212	2017-12-21 18:54:41.661405	3	23.28
4	933	4	2017-12-10 22:22:25.696179	2017-12-21 18:54:41.666656	4	40.16
5	834	5	2017-12-10 22:22:25.706067	2017-12-21 18:54:41.672012	2	37.86
6	331	6	2017-12-10 22:22:25.719045	2017-12-21 18:54:41.678082	4	43.03
7	580	7	2017-12-10 22:22:25.730781	2017-12-21 18:54:41.683419	1	61.32
8	331	8	2017-12-10 22:22:25.742264	2017-12-21 18:54:41.689462	4	43.03
9	336	9	2017-12-10 22:22:25.753373	2017-12-21 18:54:41.694822	4	26.04
10	410	10	2017-12-10 22:22:25.76665	2017-12-21 18:54:41.700669	2	40.51
11	805	11	2017-12-10 22:22:25.785026	2017-12-21 18:54:41.706031	2	12.29
12	126	12	2017-12-10 22:22:25.798145	2017-12-21 18:54:41.711131	4	7.91
13	571	13	2017-12-10 22:22:25.809022	2017-12-21 18:54:41.715953	3	67.35
14	110	14	2017-12-10 22:22:25.819534	2017-12-21 18:54:41.721037	3	19.59
15	276	15	2017-12-10 22:22:25.832219	2017-12-21 18:54:41.726052	3	42.12
16	822	16	2017-12-10 22:22:25.847729	2017-12-21 18:54:41.731097	4	27.38
17	213	17	2017-12-10 22:22:25.861398	2017-12-21 18:54:41.736277	2	49.71
18	223	18	2017-12-10 22:22:25.872855	2017-12-21 18:54:41.741249	2	64.05
19	179	19	2017-12-10 22:22:25.882481	2017-12-21 18:54:41.747114	1	66.4
20	850	20	2017-12-10 22:22:25.899367	2017-12-21 18:54:41.752563	2	56.71
21	757	21	2017-12-10 22:22:25.911992	2017-12-21 18:54:41.757713	2	22.95
22	556	22	2017-12-10 22:22:25.923394	2017-12-21 18:54:41.7631	5	51.04
23	842	23	2017-12-10 22:22:25.936383	2017-12-21 18:54:41.768285	5	36.79
24	327	24	2017-12-10 22:22:25.951404	2017-12-21 18:54:41.773497	2	14.96
25	171	25	2017-12-10 22:22:25.963797	2017-12-21 18:54:41.778635	5	16.22
26	603	26	2017-12-10 22:22:25.975872	2017-12-21 18:54:41.783752	5	18.6
27	380	27	2017-12-10 22:22:25.984987	2017-12-21 18:54:41.789731	2	26.95
28	214	28	2017-12-10 22:22:25.998446	2017-12-21 18:54:41.795275	5	41.12
29	28	29	2017-12-10 22:22:26.011397	2017-12-21 18:54:41.800913	3	36.1
30	604	30	2017-12-10 22:22:26.023184	2017-12-21 18:54:41.806686	5	35.19
31	647	31	2017-12-10 22:22:26.036487	2017-12-21 18:54:41.812411	2	42.72
32	179	32	2017-12-10 22:22:26.050796	2017-12-21 18:54:41.818319	2	66.4
33	507	33	2017-12-10 22:22:26.063777	2017-12-21 18:54:41.824128	4	8.33
34	991	34	2017-12-10 22:22:26.076611	2017-12-21 18:54:41.829991	5	29.02
35	421	35	2017-12-10 22:22:26.08933	2017-12-21 18:54:41.835905	5	57.09
36	477	36	2017-12-10 22:22:26.102691	2017-12-21 18:54:41.84172	3	37.53
37	106	37	2017-12-10 22:22:26.117253	2017-12-21 18:54:41.847423	1	12.14
38	784	38	2017-12-10 22:22:26.134664	2017-12-21 18:54:41.853363	5	7.46
39	233	39	2017-12-10 22:22:26.150423	2017-12-21 18:54:41.858821	3	28.72
40	286	40	2017-12-10 22:22:26.163151	2017-12-21 18:54:41.864776	5	45.7
41	965	41	2017-12-10 22:22:26.172027	2017-12-21 18:54:41.870816	1	61.14
42	849	42	2017-12-10 22:22:26.185345	2017-12-21 18:54:41.880376	1	50.95
43	904	43	2017-12-10 22:22:26.198201	2017-12-21 18:54:41.887941	4	68.64
44	248	44	2017-12-10 22:22:26.210356	2017-12-21 18:54:41.897795	2	7.28
45	268	45	2017-12-10 22:22:26.219851	2017-12-21 18:54:41.903868	2	66.63
46	632	46	2017-12-10 22:22:26.23344	2017-12-21 18:54:41.910783	2	35.11
47	669	47	2017-12-10 22:22:26.246899	2017-12-21 18:54:41.91696	5	24.8
48	915	48	2017-12-10 22:22:26.26032	2017-12-21 18:54:41.92219	2	9.4
49	123	49	2017-12-10 22:22:26.272341	2017-12-21 18:54:41.927737	2	11.61
50	474	50	2017-12-10 22:22:26.284562	2017-12-21 18:54:41.933204	3	21.99
51	187	51	2017-12-10 22:22:26.300372	2017-12-21 18:54:41.938824	4	36.18
52	521	52	2017-12-10 22:22:26.314952	2017-12-21 18:54:41.944248	1	44.1
53	566	53	2017-12-10 22:22:26.329128	2017-12-21 18:54:41.949466	3	59.44
54	410	54	2017-12-10 22:22:26.341476	2017-12-21 18:54:41.954532	1	40.51
55	4	55	2017-12-10 22:22:26.36323	2017-12-21 18:54:41.960086	2	59.99
56	6	55	2017-12-10 22:22:26.364546	2017-12-21 18:54:41.965004	7	49.99
57	1042	81	2017-12-21 18:55:28.181201	2017-12-21 18:55:28.209869	1	66.71
58	1053	81	2017-12-21 18:55:28.227827	2017-12-21 18:55:28.250578	1	51.19
59	1042	82	2017-12-21 18:55:34.509221	2017-12-21 18:55:34.531408	1	66.71
60	1053	82	2017-12-21 18:55:34.542031	2017-12-21 18:55:34.563302	1	51.19
61	1042	83	2017-12-21 18:55:41.977344	2017-12-21 18:55:41.993378	1	66.71
62	1053	83	2017-12-21 18:55:42.001418	2017-12-21 18:55:42.021947	1	51.19
\.


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CURRENT_USER
--

SELECT pg_catalog.setval('order_items_id_seq', 62, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY orders (id, status, user_id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at) FROM stdin;
1	1	1	2017-12-10 22:22:25.654748	2017-12-10 22:22:25.654748	\N	\N	\N	\N
2	0	2	2017-12-10 22:22:25.671249	2017-12-10 22:22:25.671249	\N	\N	\N	\N
3	1	3	2017-12-10 22:22:25.682566	2017-12-10 22:22:25.682566	\N	\N	\N	\N
4	0	4	2017-12-10 22:22:25.692124	2017-12-10 22:22:25.692124	\N	\N	\N	\N
5	1	5	2017-12-10 22:22:25.704197	2017-12-10 22:22:25.704197	\N	\N	\N	\N
6	1	6	2017-12-10 22:22:25.717502	2017-12-10 22:22:25.717502	\N	\N	\N	\N
7	3	7	2017-12-10 22:22:25.72927	2017-12-10 22:22:25.72927	\N	\N	\N	\N
8	1	8	2017-12-10 22:22:25.737992	2017-12-10 22:22:25.737992	\N	\N	\N	\N
9	0	9	2017-12-10 22:22:25.75169	2017-12-10 22:22:25.75169	\N	\N	\N	\N
10	1	10	2017-12-10 22:22:25.76429	2017-12-10 22:22:25.76429	\N	\N	\N	\N
11	2	11	2017-12-10 22:22:25.782089	2017-12-10 22:22:25.782089	\N	\N	\N	\N
12	3	12	2017-12-10 22:22:25.796442	2017-12-10 22:22:25.796442	\N	\N	\N	\N
13	3	13	2017-12-10 22:22:25.805297	2017-12-10 22:22:25.805297	\N	\N	\N	\N
14	2	14	2017-12-10 22:22:25.817793	2017-12-10 22:22:25.817793	\N	\N	\N	\N
15	1	15	2017-12-10 22:22:25.830128	2017-12-10 22:22:25.830128	\N	\N	\N	\N
16	3	16	2017-12-10 22:22:25.844604	2017-12-10 22:22:25.844604	\N	\N	\N	\N
17	3	17	2017-12-10 22:22:25.859478	2017-12-10 22:22:25.859478	\N	\N	\N	\N
18	1	18	2017-12-10 22:22:25.868727	2017-12-10 22:22:25.868727	\N	\N	\N	\N
19	1	19	2017-12-10 22:22:25.880575	2017-12-10 22:22:25.880575	\N	\N	\N	\N
20	2	20	2017-12-10 22:22:25.896421	2017-12-10 22:22:25.896421	\N	\N	\N	\N
21	2	21	2017-12-10 22:22:25.910495	2017-12-10 22:22:25.910495	\N	\N	\N	\N
22	1	22	2017-12-10 22:22:25.919717	2017-12-10 22:22:25.919717	\N	\N	\N	\N
23	1	23	2017-12-10 22:22:25.932549	2017-12-10 22:22:25.932549	\N	\N	\N	\N
24	2	24	2017-12-10 22:22:25.949299	2017-12-10 22:22:25.949299	\N	\N	\N	\N
25	1	25	2017-12-10 22:22:25.962214	2017-12-10 22:22:25.962214	\N	\N	\N	\N
26	3	26	2017-12-10 22:22:25.97431	2017-12-10 22:22:25.97431	\N	\N	\N	\N
27	2	27	2017-12-10 22:22:25.983374	2017-12-10 22:22:25.983374	\N	\N	\N	\N
28	2	28	2017-12-10 22:22:25.996047	2017-12-10 22:22:25.996047	\N	\N	\N	\N
29	1	29	2017-12-10 22:22:26.009512	2017-12-10 22:22:26.009512	\N	\N	\N	\N
30	3	30	2017-12-10 22:22:26.021699	2017-12-10 22:22:26.021699	\N	\N	\N	\N
31	1	31	2017-12-10 22:22:26.030841	2017-12-10 22:22:26.030841	\N	\N	\N	\N
32	0	32	2017-12-10 22:22:26.04809	2017-12-10 22:22:26.04809	\N	\N	\N	\N
33	3	33	2017-12-10 22:22:26.061848	2017-12-10 22:22:26.061848	\N	\N	\N	\N
34	1	34	2017-12-10 22:22:26.074472	2017-12-10 22:22:26.074472	\N	\N	\N	\N
35	2	35	2017-12-10 22:22:26.087113	2017-12-10 22:22:26.087113	\N	\N	\N	\N
36	2	36	2017-12-10 22:22:26.098319	2017-12-10 22:22:26.098319	\N	\N	\N	\N
37	3	37	2017-12-10 22:22:26.114223	2017-12-10 22:22:26.114223	\N	\N	\N	\N
38	3	38	2017-12-10 22:22:26.131647	2017-12-10 22:22:26.131647	\N	\N	\N	\N
39	2	39	2017-12-10 22:22:26.148041	2017-12-10 22:22:26.148041	\N	\N	\N	\N
40	1	40	2017-12-10 22:22:26.158705	2017-12-10 22:22:26.158705	\N	\N	\N	\N
41	2	41	2017-12-10 22:22:26.170495	2017-12-10 22:22:26.170495	\N	\N	\N	\N
42	0	42	2017-12-10 22:22:26.18383	2017-12-10 22:22:26.18383	\N	\N	\N	\N
43	3	43	2017-12-10 22:22:26.196231	2017-12-10 22:22:26.196231	\N	\N	\N	\N
44	0	44	2017-12-10 22:22:26.20567	2017-12-10 22:22:26.20567	\N	\N	\N	\N
45	2	45	2017-12-10 22:22:26.218246	2017-12-10 22:22:26.218246	\N	\N	\N	\N
46	2	46	2017-12-10 22:22:26.230746	2017-12-10 22:22:26.230746	\N	\N	\N	\N
47	3	47	2017-12-10 22:22:26.245044	2017-12-10 22:22:26.245044	\N	\N	\N	\N
48	0	48	2017-12-10 22:22:26.257596	2017-12-10 22:22:26.257596	\N	\N	\N	\N
49	1	49	2017-12-10 22:22:26.268091	2017-12-10 22:22:26.268091	\N	\N	\N	\N
50	2	50	2017-12-10 22:22:26.280229	2017-12-10 22:22:26.280229	\N	\N	\N	\N
51	0	51	2017-12-10 22:22:26.298072	2017-12-10 22:22:26.298072	\N	\N	\N	\N
52	2	52	2017-12-10 22:22:26.31197	2017-12-10 22:22:26.31197	\N	\N	\N	\N
53	1	53	2017-12-10 22:22:26.327108	2017-12-10 22:22:26.327108	\N	\N	\N	\N
54	1	54	2017-12-10 22:22:26.337108	2017-12-10 22:22:26.337108	\N	\N	\N	\N
55	1	4	2017-12-10 22:22:26.361445	2017-12-10 22:22:26.361445	\N	\N	\N	\N
56	2	55	2017-12-21 18:54:58.723523	2017-12-21 18:54:58.723523	\N	\N	\N	\N
57	3	55	2017-12-21 18:54:58.729471	2017-12-21 18:54:58.729471	\N	\N	\N	\N
58	2	55	2017-12-21 18:54:58.734922	2017-12-21 18:54:58.734922	\N	\N	\N	\N
59	3	55	2017-12-21 18:54:58.741307	2017-12-21 18:54:58.741307	\N	\N	\N	\N
60	0	55	2017-12-21 18:54:58.747427	2017-12-21 18:54:58.747427	\N	\N	\N	\N
61	1	56	2017-12-21 18:54:58.75331	2017-12-21 18:54:58.75331	\N	\N	\N	\N
62	1	56	2017-12-21 18:54:58.759547	2017-12-21 18:54:58.759547	\N	\N	\N	\N
63	2	56	2017-12-21 18:54:58.765387	2017-12-21 18:54:58.765387	\N	\N	\N	\N
64	2	56	2017-12-21 18:54:58.776541	2017-12-21 18:54:58.776541	\N	\N	\N	\N
65	0	56	2017-12-21 18:54:58.782252	2017-12-21 18:54:58.782252	\N	\N	\N	\N
66	1	57	2017-12-21 18:54:58.788439	2017-12-21 18:54:58.788439	\N	\N	\N	\N
67	3	57	2017-12-21 18:54:58.79443	2017-12-21 18:54:58.79443	\N	\N	\N	\N
68	2	57	2017-12-21 18:54:58.79954	2017-12-21 18:54:58.79954	\N	\N	\N	\N
69	1	57	2017-12-21 18:54:58.804708	2017-12-21 18:54:58.804708	\N	\N	\N	\N
70	1	57	2017-12-21 18:54:58.809777	2017-12-21 18:54:58.809777	\N	\N	\N	\N
71	3	58	2017-12-21 18:54:58.814802	2017-12-21 18:54:58.814802	\N	\N	\N	\N
72	1	58	2017-12-21 18:54:58.820051	2017-12-21 18:54:58.820051	\N	\N	\N	\N
73	1	58	2017-12-21 18:54:58.825646	2017-12-21 18:54:58.825646	\N	\N	\N	\N
74	2	58	2017-12-21 18:54:58.831212	2017-12-21 18:54:58.831212	\N	\N	\N	\N
75	1	58	2017-12-21 18:54:58.837035	2017-12-21 18:54:58.837035	\N	\N	\N	\N
76	3	59	2017-12-21 18:54:58.842145	2017-12-21 18:54:58.842145	\N	\N	\N	\N
77	2	59	2017-12-21 18:54:58.847457	2017-12-21 18:54:58.847457	\N	\N	\N	\N
78	3	59	2017-12-21 18:54:58.852605	2017-12-21 18:54:58.852605	\N	\N	\N	\N
79	1	59	2017-12-21 18:54:58.858538	2017-12-21 18:54:58.858538	\N	\N	\N	\N
80	3	59	2017-12-21 18:54:58.863787	2017-12-21 18:54:58.863787	\N	\N	\N	\N
81	0	54	2017-12-21 18:55:28.178019	2017-12-21 18:55:28.178019	\N	\N	\N	\N
82	0	54	2017-12-21 18:55:34.503715	2017-12-21 18:55:34.503715	\N	\N	\N	\N
83	0	54	2017-12-21 18:55:41.973582	2017-12-21 18:55:41.973582	\N	\N	\N	\N
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CURRENT_USER
--

SELECT pg_catalog.setval('orders_id_seq', 83, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY roles (id, name, created_at, updated_at) FROM stdin;
1	registered user	2017-12-21 18:54:49.334315	2017-12-21 18:54:49.334315
2	store manager	2017-12-21 18:54:49.337442	2017-12-21 18:54:49.337442
3	store admin	2017-12-21 18:54:49.340185	2017-12-21 18:54:49.340185
4	platform admin	2017-12-21 18:54:49.343	2017-12-21 18:54:49.343
5	developer	2017-12-21 18:54:49.34552	2017-12-21 18:54:49.34552
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CURRENT_USER
--

SELECT pg_catalog.setval('roles_id_seq', 5, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY schema_migrations (version) FROM stdin;
20170912215536
20170912215635
20170912215823
20170912215933
20170912220156
20170913201351
20170913201525
20170913221006
20170915041309
20170915132625
20170918192955
20170918203915
20171212230549
20171212230609
20171212230650
20171214163155
20171214163228
20171214213947
20171218202325
20171218202424
20171218235150
20171221022315
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY stores (id, name, status, slug, created_at, updated_at) FROM stdin;
1	Writ and Wit	2	writ-and-wit	2017-12-21 18:54:42.568765	2017-12-21 18:54:42.568765
2	The Blackhearts Elimination Society	2	the-blackhearts-elimination-society	2017-12-21 18:54:49.593996	2017-12-21 18:54:49.593996
3	Conjectural Technologies	2	conjectural-technologies	2017-12-21 18:54:49.59949	2017-12-21 18:54:49.59949
4	State University	2	state-university	2017-12-21 18:54:49.605945	2017-12-21 18:54:49.605945
5	Ünderland Troops	2	underland-troops	2017-12-21 18:54:49.611436	2017-12-21 18:54:49.611436
6	Impossible Industries	2	impossible-industries	2017-12-21 18:54:49.616576	2017-12-21 18:54:49.616576
\.


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CURRENT_USER
--

SELECT pg_catalog.setval('stores_id_seq', 6, true);


--
-- Data for Name: user_role_stores; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY user_role_stores (id, user_id, role_id, store_id, created_at, updated_at) FROM stdin;
1	1	4	\N	2017-12-21 18:54:49.385274	2017-12-21 18:54:49.385274
2	2	1	\N	2017-12-21 18:54:49.391915	2017-12-21 18:54:49.391915
3	3	1	\N	2017-12-21 18:54:49.399196	2017-12-21 18:54:49.399196
4	4	1	\N	2017-12-21 18:54:49.403477	2017-12-21 18:54:49.403477
5	5	1	\N	2017-12-21 18:54:49.40801	2017-12-21 18:54:49.40801
6	6	1	\N	2017-12-21 18:54:49.412925	2017-12-21 18:54:49.412925
7	7	1	\N	2017-12-21 18:54:49.416345	2017-12-21 18:54:49.416345
8	8	1	\N	2017-12-21 18:54:49.419839	2017-12-21 18:54:49.419839
9	9	1	\N	2017-12-21 18:54:49.423567	2017-12-21 18:54:49.423567
10	10	1	\N	2017-12-21 18:54:49.427531	2017-12-21 18:54:49.427531
11	11	1	\N	2017-12-21 18:54:49.430909	2017-12-21 18:54:49.430909
12	12	1	\N	2017-12-21 18:54:49.43489	2017-12-21 18:54:49.43489
13	13	1	\N	2017-12-21 18:54:49.438585	2017-12-21 18:54:49.438585
14	14	1	\N	2017-12-21 18:54:49.441845	2017-12-21 18:54:49.441845
15	15	1	\N	2017-12-21 18:54:49.44512	2017-12-21 18:54:49.44512
16	16	1	\N	2017-12-21 18:54:49.44854	2017-12-21 18:54:49.44854
17	17	1	\N	2017-12-21 18:54:49.451993	2017-12-21 18:54:49.451993
18	18	1	\N	2017-12-21 18:54:49.455503	2017-12-21 18:54:49.455503
19	19	1	\N	2017-12-21 18:54:49.459005	2017-12-21 18:54:49.459005
20	20	1	\N	2017-12-21 18:54:49.46226	2017-12-21 18:54:49.46226
21	21	1	\N	2017-12-21 18:54:49.465649	2017-12-21 18:54:49.465649
22	22	1	\N	2017-12-21 18:54:49.469973	2017-12-21 18:54:49.469973
23	23	1	\N	2017-12-21 18:54:49.474085	2017-12-21 18:54:49.474085
24	24	1	\N	2017-12-21 18:54:49.477718	2017-12-21 18:54:49.477718
25	25	1	\N	2017-12-21 18:54:49.481446	2017-12-21 18:54:49.481446
26	26	1	\N	2017-12-21 18:54:49.484641	2017-12-21 18:54:49.484641
27	27	1	\N	2017-12-21 18:54:49.489239	2017-12-21 18:54:49.489239
28	28	1	\N	2017-12-21 18:54:49.492915	2017-12-21 18:54:49.492915
29	29	1	\N	2017-12-21 18:54:49.496325	2017-12-21 18:54:49.496325
30	30	1	\N	2017-12-21 18:54:49.500805	2017-12-21 18:54:49.500805
31	31	1	\N	2017-12-21 18:54:49.504483	2017-12-21 18:54:49.504483
32	32	1	\N	2017-12-21 18:54:49.507873	2017-12-21 18:54:49.507873
33	33	1	\N	2017-12-21 18:54:49.511322	2017-12-21 18:54:49.511322
34	34	1	\N	2017-12-21 18:54:49.515045	2017-12-21 18:54:49.515045
35	35	1	\N	2017-12-21 18:54:49.518634	2017-12-21 18:54:49.518634
36	36	1	\N	2017-12-21 18:54:49.522168	2017-12-21 18:54:49.522168
37	37	1	\N	2017-12-21 18:54:49.525726	2017-12-21 18:54:49.525726
38	38	1	\N	2017-12-21 18:54:49.529399	2017-12-21 18:54:49.529399
39	39	1	\N	2017-12-21 18:54:49.532923	2017-12-21 18:54:49.532923
40	40	1	\N	2017-12-21 18:54:49.536626	2017-12-21 18:54:49.536626
41	41	1	\N	2017-12-21 18:54:49.540242	2017-12-21 18:54:49.540242
42	42	1	\N	2017-12-21 18:54:49.543796	2017-12-21 18:54:49.543796
43	43	1	\N	2017-12-21 18:54:49.547394	2017-12-21 18:54:49.547394
44	44	1	\N	2017-12-21 18:54:49.551245	2017-12-21 18:54:49.551245
45	45	1	\N	2017-12-21 18:54:49.554856	2017-12-21 18:54:49.554856
46	46	1	\N	2017-12-21 18:54:49.558393	2017-12-21 18:54:49.558393
47	47	1	\N	2017-12-21 18:54:49.562096	2017-12-21 18:54:49.562096
48	48	1	\N	2017-12-21 18:54:49.565702	2017-12-21 18:54:49.565702
49	49	1	\N	2017-12-21 18:54:49.569365	2017-12-21 18:54:49.569365
50	50	1	\N	2017-12-21 18:54:49.572765	2017-12-21 18:54:49.572765
51	51	1	\N	2017-12-21 18:54:49.576579	2017-12-21 18:54:49.576579
52	52	1	\N	2017-12-21 18:54:49.580434	2017-12-21 18:54:49.580434
53	53	1	\N	2017-12-21 18:54:49.583995	2017-12-21 18:54:49.583995
54	54	1	\N	2017-12-21 18:54:49.587894	2017-12-21 18:54:49.587894
55	59	1	\N	2017-12-21 18:54:58.711998	2017-12-21 18:54:58.711998
56	59	2	\N	2017-12-21 18:54:58.716984	2017-12-21 18:54:58.716984
57	60	2	\N	2017-12-21 18:54:59.149438	2017-12-21 18:54:59.149438
58	61	2	\N	2017-12-21 18:54:59.154328	2017-12-21 18:54:59.154328
59	62	2	\N	2017-12-21 18:54:59.160113	2017-12-21 18:54:59.160113
60	63	2	\N	2017-12-21 18:54:59.166123	2017-12-21 18:54:59.166123
61	64	3	\N	2017-12-21 18:54:59.528969	2017-12-21 18:54:59.528969
62	65	3	\N	2017-12-21 18:54:59.535266	2017-12-21 18:54:59.535266
63	66	3	\N	2017-12-21 18:54:59.540737	2017-12-21 18:54:59.540737
64	67	3	\N	2017-12-21 18:54:59.546361	2017-12-21 18:54:59.546361
65	68	3	\N	2017-12-21 18:54:59.551163	2017-12-21 18:54:59.551163
66	69	4	\N	2017-12-21 18:54:59.624708	2017-12-21 18:54:59.624708
67	70	5	\N	2017-12-21 18:54:59.904293	2017-12-21 18:54:59.904293
68	71	5	\N	2017-12-21 18:55:00.505948	2017-12-21 18:55:00.505948
\.


--
-- Name: user_role_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CURRENT_USER
--

SELECT pg_catalog.setval('user_role_stores_id_seq', 68, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: CURRENT_USER
--

COPY users (id, first_name, last_name, email, password_digest, address, created_at, updated_at, role, screen_name, uid, oauth_token, oauth_token_secret, customer_id) FROM stdin;
1	Mary	Moore	mary@example.com	$2a$10$8GVDkaCJoPKiVgTpryXz7.KtoCLJkEz67v5cuFGXjyM8iEw9EBBkG	666 Spooky Ave, Halloween City, NO 66666	2017-12-10 22:18:28.850761	2017-12-10 22:18:28.850761	1	\N	\N	\N	\N	\N
2	Sandy	Smith	sandy@example.com	$2a$10$hwnGLz1QCIaMAvpTr/NpmuviSDIEjwR0Yc7iGuADZtgICx.1cwx0.	1111 Hoola Hoop Drive, Big Island, HI 90505	2017-12-10 22:18:28.935781	2017-12-10 22:18:28.935781	0	\N	\N	\N	\N	\N
3	Rick	Rhodes	rick@example.com	$2a$10$3l6s3WPZ.2aYZbeSpfzbVeBkCQQQiAS0/k3OJDaAzjT8254bLLsHi	1000 Sunny Dr., Sunshine, CO 10000	2017-12-10 22:18:29.008175	2017-12-10 22:18:29.008175	0	\N	\N	\N	\N	\N
4	Daniel	Williams	daniel@example.com	$2a$10$yACuKv60liK5lMvOTlYIweiC6dxwA5Mu.WckoN9AuhtAHJe2fnsJi	1010 Biking Home, Cool CA 10101	2017-12-10 22:18:29.086761	2017-12-10 22:18:29.086761	0	\N	\N	\N	\N	\N
5	Shelly	Johnson	kiarra@emmerich.org	$2a$10$iEIsFVT5W7UUvjLa122ZbOiY1Jl6EtJNEoeT6/Hd4sEOYdbyJ3jU6	79978 Evangeline Pike, Kennedystad, NE 57242	2017-12-10 22:18:30.225568	2017-12-10 22:18:30.225568	0	\N	\N	\N	\N	\N
6	Ben	Horne	mikayla.orn@smithhowe.io	$2a$10$kiM7Z3kLDagz.2540ClFHe1U28b495ICpeu91LpPlfndK0jS1Gws6	591 Xavier Shore, New Johannafurt, AZ 59327-7784	2017-12-10 22:18:30.306382	2017-12-10 22:18:30.306382	0	\N	\N	\N	\N	\N
7	Dougie	Milford	lorena@oberbrunner.net	$2a$10$Clo.Zld8yriPgVFJuFR.4e1J4aPlZKC/AZr5Yb8NoO0z6wzdpcIzG	85912 Bosco Isle, Berylfurt, TX 43755	2017-12-10 22:18:30.395871	2017-12-10 22:18:30.395871	0	\N	\N	\N	\N	\N
8	Mrs	Tremond	hermann@thompson.io	$2a$10$i64aedieZ/dojvZj0bJOPesehkRmEdEejTbymniqZvX67ddqCe7QW	73672 Treutel Well, New Tracey, MS 76223-3265	2017-12-10 22:18:30.468754	2017-12-10 22:18:30.468754	0	\N	\N	\N	\N	\N
9	Jean	Renault	desmond@keeling.com	$2a$10$4vN.bIP4g07ULx18FY.HzOUWjE6vj8wy3gjbvAMsqC5Q620bgqrCC	24020 Rath Divide, Nedraborough, MI 86576	2017-12-10 22:18:30.544827	2017-12-10 22:18:30.544827	0	\N	\N	\N	\N	\N
10	Mayor	Milford	larry.schmeler@moore.info	$2a$10$B9e5hlpSB6/Ytum4Yam52.fRtYEwygf1D7U264C8RrVGMjCcQsClG	2947 Hilll Valleys, West Myra, CT 88864	2017-12-10 22:18:30.623069	2017-12-10 22:18:30.623069	0	\N	\N	\N	\N	\N
11	Lucy	Moran	nannie@ritchie.biz	$2a$10$VopKW2gi3rw1rJl9n5d2teAgNRg2sIUC8isRxSITlcEd3KcTQvDBq	4095 Jairo Skyway, Courtneystad, CT 66490	2017-12-10 22:18:30.700513	2017-12-10 22:18:30.700513	0	\N	\N	\N	\N	\N
12	Jean	Renault	beth_stark@homenick.org	$2a$10$CJwbPO4SgjwwYxSldSFJDu.rXuxS6PkqGVAxBDn8Q0/Jzp49QgAu.	11837 Elvie Place, New Jalynton, LA 66074	2017-12-10 22:18:30.769089	2017-12-10 22:18:30.769089	0	\N	\N	\N	\N	\N
13	Catherine	Martell	melya.bernier@schulist.info	$2a$10$Y9LVO0qGAaN/tiNTzXgrIu4Gb2GRX6Qsj.C43riSq5wzvu66eRsEW	229 Erich Wall, New Markview, RI 33424	2017-12-10 22:18:30.845481	2017-12-10 22:18:30.845481	0	\N	\N	\N	\N	\N
14	Audrey	Horne	maymie@kulas.name	$2a$10$jqbVAhe.U9XmQIZNuiYnquOD4bSecwZRZSFR93HnAmlsOn93xPtdG	2259 Ritchie Port, Schroederberg, WY 35641-4878	2017-12-10 22:18:30.921374	2017-12-10 22:18:30.921374	0	\N	\N	\N	\N	\N
15	Ben	Horne	rey_stiedemann@keeling.org	$2a$10$98BSyP8noX.F1ktmpalBjOwbKAjiH18x3g7fM59JsywigUZmd4AKe	8455 Baumbach Forest, West Valerie, TN 86718	2017-12-10 22:18:30.996034	2017-12-10 22:18:30.996034	0	\N	\N	\N	\N	\N
16	Lil	dancer	austyn@dickinson.co	$2a$10$PwsydhDMJKHdT61FVX2Uc.XXoO4n/fdWCLByfWTovnUHTJrZD9L4O	623 Martin Well, Mathewside, WI 76845	2017-12-10 22:18:31.068216	2017-12-10 22:18:31.068216	0	\N	\N	\N	\N	\N
17	Lil	dancer	taylor.cartwright@schimmeldenesik.co	$2a$10$XksLsWYpNPhZGiPWPUKx.OEufd96iDAt8iJxxO7XjvUhcQL4SV01u	924 Boyle Mill, East Laurineberg, TX 71383-5657	2017-12-10 22:18:31.137504	2017-12-10 22:18:31.137504	0	\N	\N	\N	\N	\N
18	Harold	Smith	torrey_brekke@dietrich.info	$2a$10$13hOIeYUyW6WT6UWAzhbleEBX28MZ7i0Gqwng5WwhbBK8WtkTwC5i	58633 Sim Cliffs, Kerluketown, VA 13765-3198	2017-12-10 22:18:31.226845	2017-12-10 22:18:31.226845	0	\N	\N	\N	\N	\N
19	Josie	Packard	johnathon@kiehnstokes.net	$2a$10$AM1bC3.WNkowTA8Qfs.MOOBeNvSqmWjdtMgAX7dOlNBFEwQ6rxVky	17250 Yoshiko Isle, Estherton, MT 30427	2017-12-10 22:18:31.310145	2017-12-10 22:18:31.310145	0	\N	\N	\N	\N	\N
20	Leland	Palmer	coralie@carter.biz	$2a$10$HyBwhSBa.M/MzboDAG8cQeZ87N/xOHIo60R7KS2tKpX/.X0ddL8Au	27514 Pouros Turnpike, South Ida, IA 74727-5074	2017-12-10 22:18:31.413539	2017-12-10 22:18:31.413539	0	\N	\N	\N	\N	\N
21	Bobby	Briggs	laney@cronadurgan.net	$2a$10$M9bFEyw3ATpIPuxvEScDw.nX3R/HJm0MGowyjsVju.Ot15lN5H/pi	4301 Willms Extension, Rauchester, ID 88295	2017-12-10 22:18:31.514654	2017-12-10 22:18:31.514654	0	\N	\N	\N	\N	\N
22	Dick	Tremayne	opal.conroy@von.biz	$2a$10$KutAI3J0k4ENmuSn5HIj4.59Sm2Ig5BrQoV0n1D4KgsJv3PkLq2PS	237 Ross Underpass, Okunevamouth, PA 85634-6761	2017-12-10 22:18:31.59617	2017-12-10 22:18:31.59617	0	\N	\N	\N	\N	\N
23	Sam	Stanley	gertrude.hayes@miller.info	$2a$10$9VcZ.Bcg1rfSlTSLUqr1peIqWz3fqtEJtfa8hHdl9GnYIEYDdPFpy	520 Hamill Estates, Eddiestad, MD 52403	2017-12-10 22:18:31.693743	2017-12-10 22:18:31.693743	0	\N	\N	\N	\N	\N
24	Jerry	Horne	broderick_mcglynn@gleichner.biz	$2a$10$6v6ZBKwnJu8TalWUfKZtJ.0zMkyRAd52kFjJC3KOdH0r5VVaV1OK2	5718 D'Amore Freeway, North Conradburgh, RI 80304	2017-12-10 22:18:31.766564	2017-12-10 22:18:31.766564	0	\N	\N	\N	\N	\N
25	Lucy	Moran	raegan@fisherryan.name	$2a$10$kJE8I8I/rnDp1Rc9eadyyOmWEL9zJS493sCMuCphf6vf3evzAKKBu	50611 Cleora Village, Maximillianfurt, RI 43214-1678	2017-12-10 22:18:31.84698	2017-12-10 22:18:31.84698	0	\N	\N	\N	\N	\N
26	Andrew	Packard	lucy@quitzonsatterfield.net	$2a$10$VV2ig2LfePkQ3/K0sNwtaus6uhOyckYkUvKu5gq21dwZjf4rlcJvK	9047 Lindsey Camp, Kelvinshire, CO 24736	2017-12-10 22:18:31.923136	2017-12-10 22:18:31.923136	0	\N	\N	\N	\N	\N
27	Jerry	Horne	victor@bayer.name	$2a$10$vc8B8Vdw9ZrfUrT4TaaRSOdlI/EmcDglLG/H4kMlkNnBFqyNxo96K	932 Kurt Pines, West Broderickberg, OK 28457-2010	2017-12-10 22:18:31.991834	2017-12-10 22:18:31.991834	0	\N	\N	\N	\N	\N
28	Hank	Jennings	branson@welch.name	$2a$10$/FoIGFbeKielczthB8.tEuHSp61dke7eA7BKeyUDpa7DxsFgf2fb2	963 Macie Islands, North Bernard, ID 77072	2017-12-10 22:18:32.063542	2017-12-10 22:18:32.063542	0	\N	\N	\N	\N	\N
29	Sarah	Palmer	elwin@mcdermott.name	$2a$10$Jo2uuSx1qhcm54BUbUSo5OUzAqHKV2CdHIKmEGR0lYRr8NiLcxRgC	735 Huel River, South William, AL 61255-6594	2017-12-10 22:18:32.13623	2017-12-10 22:18:32.13623	0	\N	\N	\N	\N	\N
30	Shelly	Johnson	ines.johnston@spinka.org	$2a$10$4R5y86dcr.AglCYzkV6cWOaNuteReGqkNBNvE0m1kawICQHpPmutG	7267 Pascale Mount, Port Jerelberg, ID 86921-4524	2017-12-10 22:18:32.208719	2017-12-10 22:18:32.208719	0	\N	\N	\N	\N	\N
31	Mr	Tojamura	rickey@ondricka.net	$2a$10$a4gMhk5sz9UBcR9n1ScdH..ICFHNVhFpxrzF/eHW/8y9EJsjiPh..	61773 Ruecker Port, Klockostad, NH 20390-4403	2017-12-10 22:18:32.281058	2017-12-10 22:18:32.281058	0	\N	\N	\N	\N	\N
32	Gersten	Hayward	brenda@gaylord.co	$2a$10$mkNzpnkVTOrxz4.bRWHaS.ifvE/d8Ez30xfALq0UiiRaBRaRNFgLu	2879 Callie Forges, Erinfort, IA 95583	2017-12-10 22:18:32.350623	2017-12-10 22:18:32.350623	0	\N	\N	\N	\N	\N
33	Hawk	Hill	norene.fritsch@hartmann.org	$2a$10$FffPOSSCml8HOsqUpuUlHuQJrG1camX5pCu1k2/GymjwQEqPbRGqe	36992 Trantow Tunnel, New Freddy, NM 93940-8055	2017-12-10 22:18:32.427494	2017-12-10 22:18:32.427494	0	\N	\N	\N	\N	\N
34	Leo	Johnson	ward.skiles@orn.io	$2a$10$H3FO7qLPtpUsA6iijtaIeuT93RobGhCcdu7Zq6G2UYNaCI9bK9962	3702 Gudrun Field, Port Kim, GA 52417	2017-12-10 22:18:32.500491	2017-12-10 22:18:32.500491	0	\N	\N	\N	\N	\N
35	Thomas	Eckhardt	heber.greenholt@haag.name	$2a$10$tyiwnjldLBxtIDw6Jfiy8u1XG/d9e4nNY0PpEUGW1Ekq34TYrWy7a	87946 Toy Parkways, Hodkiewiczmouth, NH 78178	2017-12-10 22:18:32.570489	2017-12-10 22:18:32.570489	0	\N	\N	\N	\N	\N
36	Leland	Palmer	doyle.blick@fritsch.org	$2a$10$SADuD7KWVwy2R196DsAA.uwRlI3./Nm7xeVBbW.6v7Yw80kcjUR5i	15690 Ronny Throughway, North Mariano, MO 68586	2017-12-10 22:18:32.645503	2017-12-10 22:18:32.645503	0	\N	\N	\N	\N	\N
37	Hawk	Hill	thelma@schmidt.co	$2a$10$Vn66.Vj2LUjOyxF1AyYCGeZJ0faw5bhStf/8.9cj8mYbhQhF2aMOO	987 Jacobson Shoal, New Simberg, VT 37036	2017-12-10 22:18:32.741478	2017-12-10 22:18:32.741478	0	\N	\N	\N	\N	\N
38	The	Giant	guie@kris.com	$2a$10$lCPgV/ZtVWbxCTt2LGy7OuL26ioz5GYdauTynbhL3KKe5.juW39EC	646 Napoleon Plain, Rempelbury, MS 21464	2017-12-10 22:18:32.80819	2017-12-10 22:18:32.80819	0	\N	\N	\N	\N	\N
39	Eileen	Hayward	jeffry@hamillvolkman.name	$2a$10$1RUrh/946FEvduFNhd5i2.Hp9k0NEhUs/cMDzPdGImQYPdWgW7NoW	949 Eldora Spurs, Bartonview, AZ 74891	2017-12-10 22:18:32.877295	2017-12-10 22:18:32.877295	0	\N	\N	\N	\N	\N
40	Lana	Milford	rogers.block@tremblaycarter.net	$2a$10$e/cxDQz5YOzgdhhkR1pWJed38w4P1yfdAS4Rg3hFJloEbhgJJwxLC	639 Huels Walk, North Cristianbury, WI 31603-3390	2017-12-10 22:18:32.957393	2017-12-10 22:18:32.957393	0	\N	\N	\N	\N	\N
41	Dale	Cooper	leonel@mann.io	$2a$10$fgLAqwyUtMkWA50B6yfuluGwhU8F1VbyRQFIu2rq92vsCOmgXjWW6	62729 Lowe Port, Port Hayleeberg, OR 86786-0964	2017-12-10 22:18:33.030571	2017-12-10 22:18:33.030571	0	\N	\N	\N	\N	\N
42	Jerry	Horne	alex@walter.co	$2a$10$AcAgTUTRmFxKGhtAr.G68uhLPpi37oSUf4myr932QPsRqY/j0fhJm	701 Madonna Drives, Bartonport, RI 16260-8778	2017-12-10 22:18:33.106299	2017-12-10 22:18:33.106299	0	\N	\N	\N	\N	\N
43	Eileen	Hayward	elias@kris.biz	$2a$10$aYdZ.grAK1HVb0vUj.J.7O9rBMWylbPeboy6X3Vx0BPUQ.bsOs0Rm	7634 Spencer Shores, Ethamouth, AR 68678-0370	2017-12-10 22:18:33.179097	2017-12-10 22:18:33.179097	0	\N	\N	\N	\N	\N
44	Donna	Hayward	amina@kshlerin.name	$2a$10$AMclmweiXGKa2kIvTX8JM.KH2fkscEFITBPgaUYx0ge/Vvo.8At/m	734 Don Plains, North Nellamouth, MT 99045	2017-12-10 22:18:33.269867	2017-12-10 22:18:33.269867	0	\N	\N	\N	\N	\N
45	Bobby	Briggs	mertie@klein.org	$2a$10$gRA1x8gJitGbkaVVJ1dlOu6/gQp.h7UbABSIaN0jAp9ZoDCSfn/ca	42861 Sim Greens, Lake Ari, KY 85972-2934	2017-12-10 22:18:33.353197	2017-12-10 22:18:33.353197	0	\N	\N	\N	\N	\N
46	Annie	Blackburn	winifred@reichel.biz	$2a$10$1iEBkwxnD32WCjuI1MQ4/.6TQ4hOInA/Xhve.zQlFe4D1QRhO8qEa	1142 Wyman Crescent, North Kristopherport, TN 73077-1227	2017-12-10 22:18:33.438034	2017-12-10 22:18:33.438034	0	\N	\N	\N	\N	\N
47	Nadine	Hurley	elisa_mayer@kemmer.org	$2a$10$N2hkISFgDoKcg9FifYK9pevnhPGgKElgvtXHB2u2rCAt71z9g5jI2	60745 Hanna Parkways, East Margret, MO 93485	2017-12-10 22:18:33.51151	2017-12-10 22:18:33.51151	0	\N	\N	\N	\N	\N
48	Annie	Blackburn	kaitlin@miller.info	$2a$10$3V2uMCnTefMESJruPGGgFOgAj92mibrzDuZMlJczOuA0UBLCIIQIi	578 Jazmyne Path, Erikhaven, WI 21206	2017-12-10 22:18:33.593158	2017-12-10 22:18:33.593158	0	\N	\N	\N	\N	\N
49	Sarah	Palmer	jamil@dachkiehn.name	$2a$10$dxRQk0f1lr7YP0k0dagWUO47km0BOUzsbQ84bokKLnKYcLMsWE9IO	801 Purdy Vista, East Zita, IN 72342-9710	2017-12-10 22:18:33.710675	2017-12-10 22:18:33.710675	0	\N	\N	\N	\N	\N
50	Dougie	Milford	remington_farrell@schimmelokuneva.com	$2a$10$16sbRXloKJcvuwGGTnpi7efXUrvuZR1.z50jQk0ScVV0hpsOlbEbC	345 Sporer Stravenue, Lake Destini, AR 60560-5209	2017-12-10 22:18:33.797982	2017-12-10 22:18:33.797982	0	\N	\N	\N	\N	\N
51	Big	Hurley	okey.turcotte@hagenespurdy.com	$2a$10$lfbXQklwU5NlZwjkGYtF2.TQrbpJjUeko0V8l6cTuw92lJ9Jhagq6	9054 Murphy Extension, Anibalfort, PA 60044-4207	2017-12-10 22:18:33.896812	2017-12-10 22:18:33.896812	0	\N	\N	\N	\N	\N
52	MIKE	MIKE	theodore.dickens@mitchell.info	$2a$10$Xma0AxRjK4DiQlQEE1xro.gdNg1wjQakJXrzBRtO1AqztBZLQXC7G	398 Claud Circle, Jeanshire, NJ 35305-1797	2017-12-10 22:18:33.98414	2017-12-10 22:18:33.98414	0	\N	\N	\N	\N	\N
53	Chet	Desmond	willie_howe@senger.com	$2a$10$em2Oy9jcdwCV9xFSlnfr1.06TfD5s0CIv3/XsyOzS4R1x8/IkAsri	452 Weissnat Glens, Lilytown, CO 94140	2017-12-10 22:18:34.060008	2017-12-10 22:18:34.060008	0	\N	\N	\N	\N	\N
55	Paige	Runolfsdottir	arnold_kunde@medhurst.info	$2a$10$mEbPN5e9YjpiR4121fEdsO3TXefeMWg.inJ/kZkbNK.kdykIbUOPe	\N	2017-12-21 18:54:58.39952	2017-12-21 18:54:58.39952	0	\N	\N	\N	\N	\N
56	Marion	Reinger	julio@conroy.io	$2a$10$iJNloxUexmst/LwionEGAeMT.xSmZhTjo4whvyX8RpiNn5OJ540Ou	\N	2017-12-21 18:54:58.47527	2017-12-21 18:54:58.47527	0	\N	\N	\N	\N	\N
57	Sheila	Murphy	zora_hills@rohan.co	$2a$10$K03WVtl/cAwM73Ddhk1hAu.oRdZ5oBJP6J5mgXTuNBdWRQPJxMCX2	\N	2017-12-21 18:54:58.553132	2017-12-21 18:54:58.553132	0	\N	\N	\N	\N	\N
58	Gia	Parisian	murl.roob@rempelhackett.com	$2a$10$3Hiv2M2ZtZXWhlDSRNbN3uW0ecKmYbUwlHBRCLZYSXb1/UJo6peWW	\N	2017-12-21 18:54:58.62552	2017-12-21 18:54:58.62552	0	\N	\N	\N	\N	\N
59	Josh	Mejia	jmejia@turing.io	$2a$10$j7BOh1B6l0.imph8Fc7e2.PtFLFaQqdDwgLhyIvBO1lctV0hlwFnO	\N	2017-12-21 18:54:58.691025	2017-12-21 18:54:58.691025	0	\N	\N	\N	\N	\N
60	Ocie	Dare	marques@vandervort.co	$2a$10$ZbLh3eizLTLRfvExplsIl.KapTNMVyULP4HjemaaH94v5Rz56RZU6	\N	2017-12-21 18:54:58.932471	2017-12-21 18:54:58.932471	0	\N	\N	\N	\N	\N
61	Jennings	Ledner	mable@bartoletti.co	$2a$10$RxZ/jE3aDcXRn3wR3u2Yr.vmFZdeudstdjzjw77pbSX4ECFMtMLtq	\N	2017-12-21 18:54:59.002922	2017-12-21 18:54:59.002922	0	\N	\N	\N	\N	\N
62	Andreanne	Okuneva	vanea@trantow.net	$2a$10$XgoP3z1e55eOt9g6lZ26DuSGofk/p7bUkWuYyUtSIQ2i3aW8.0CNe	\N	2017-12-21 18:54:59.07669	2017-12-21 18:54:59.07669	0	\N	\N	\N	\N	\N
63	Hardy	Anderson	elbert.bergstrom@stark.net	$2a$10$ahSZ9E/IIoWwyEZjDb0PYuhdlbWtjdTHLS1sj0VnsyE3S9bGAfEQy	\N	2017-12-21 18:54:59.14309	2017-12-21 18:54:59.14309	0	\N	\N	\N	\N	\N
64	Leonor	Wintheiser	newell@wildermanfadel.info	$2a$10$h.z/6sm/tLl.m/03EgrY8u35CjUtdYVujSR9Bixv36bxvnO/S3186	\N	2017-12-21 18:54:59.23512	2017-12-21 18:54:59.23512	0	\N	\N	\N	\N	\N
65	Devan	Boyle	bonita.leannon@blandasmith.io	$2a$10$BJObCWMu5TzbGMUO6tGHR.KIOma30dAFuwo3n.NncJHO4/.szUCpW	\N	2017-12-21 18:54:59.301999	2017-12-21 18:54:59.301999	0	\N	\N	\N	\N	\N
66	Oda	Bode	maurine@hermiston.io	$2a$10$a87jaQYZXZInji11p8nujeZwDRoCf/HiouUd/HuEcQzAbv1BBONuO	\N	2017-12-21 18:54:59.376007	2017-12-21 18:54:59.376007	0	\N	\N	\N	\N	\N
67	Amanda	Kuhic	marguerite_conn@hoeger.net	$2a$10$uW1eLaYm/HOaV/uRZrybH.Jl3PkeiAPqmCy4oIS45cXZhwH.rzxpW	\N	2017-12-21 18:54:59.451121	2017-12-21 18:54:59.451121	0	\N	\N	\N	\N	\N
68	Ian	Douglas	ian@turing.io	$2a$10$c1GPEOlQnyU33txxcM5aGuyNL.zBhl/TaVQ5F.9jPIHvpGKNVr0fC	\N	2017-12-21 18:54:59.520981	2017-12-21 18:54:59.520981	0	\N	\N	\N	\N	\N
69	Cory	Westerfield	cory@turing.io	$2a$10$8gx4U3jevvp0TfUrUoEWyOUjK2JWxjumDBAqiYv6S/kWHCBhRrCwG	\N	2017-12-21 18:54:59.618503	2017-12-21 18:54:59.618503	0	\N	\N	\N	\N	\N
70	Nicolas	Farrell	adrianna_hegmann@lubowitz.info	$2a$10$GzZqlWkhHn2gntYAZhE8qOxFNA18vMNxv2rSDP9MzSIHGtiwdW62S	\N	2017-12-21 18:54:59.71852	2017-12-21 18:54:59.71852	0	\N	\N	\N	\N	\N
71	Mack	Abshire	shanelle@tillman.com	$2a$10$oW.q2ozboBQi3PRU0wmQ3Ot0zd10ix82J6Gq7a7YM97cG1CKJeykq	\N	2017-12-21 18:54:59.787859	2017-12-21 18:54:59.787859	0	\N	\N	\N	\N	\N
72	Phyllis	Feil	tierra@wuckertpredovic.info	$2a$10$TeOqWnMLN/RTxcgpaJTaNOwoKN9DWB/OkWBQ3jWKMWSZVSZiNhj76	\N	2017-12-21 18:54:59.858639	2017-12-21 18:54:59.858639	0	\N	\N	\N	\N	\N
54	Lucy	Moran	jewel@champlingottlieb.info	$2a$10$G4B32ovf8DQXWm.T68JrXOqPfsNl1zdNpw1osg8Tc2NfsNdf9Qc86	6362 Eleonore Passage, Zacharyton, KS 73859-7134	2017-12-10 22:18:34.134171	2017-12-21 18:55:28.866422	0	\N	\N	\N	\N	cus_BzYJg5hXXekfCH
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: CURRENT_USER
--

SELECT pg_catalog.setval('users_id_seq', 72, true);


--
-- Name: api_keys api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: chatrooms chatrooms_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY chatrooms
    ADD CONSTRAINT chatrooms_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: user_role_stores user_role_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY user_role_stores
    ADD CONSTRAINT user_role_stores_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_api_keys_on_user_id; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_api_keys_on_user_id ON api_keys USING btree (user_id);


--
-- Name: index_categories_on_slug; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE UNIQUE INDEX index_categories_on_slug ON categories USING btree (slug);


--
-- Name: index_chatrooms_on_slug; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_chatrooms_on_slug ON chatrooms USING btree (slug);


--
-- Name: index_items_on_category_id; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_items_on_category_id ON items USING btree (category_id);


--
-- Name: index_items_on_store_id; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_items_on_store_id ON items USING btree (store_id);


--
-- Name: index_messages_on_chatroom_id; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_messages_on_chatroom_id ON messages USING btree (chatroom_id);


--
-- Name: index_messages_on_user_id; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_messages_on_user_id ON messages USING btree (user_id);


--
-- Name: index_order_items_on_item_id; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_order_items_on_item_id ON order_items USING btree (item_id);


--
-- Name: index_order_items_on_order_id; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_order_items_on_order_id ON order_items USING btree (order_id);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_orders_on_user_id ON orders USING btree (user_id);


--
-- Name: index_user_role_stores_on_role_id; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_user_role_stores_on_role_id ON user_role_stores USING btree (role_id);


--
-- Name: index_user_role_stores_on_store_id; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_user_role_stores_on_store_id ON user_role_stores USING btree (store_id);


--
-- Name: index_user_role_stores_on_user_id; Type: INDEX; Schema: public; Owner: CURRENT_USER
--

CREATE INDEX index_user_role_stores_on_user_id ON user_role_stores USING btree (user_id);


--
-- Name: messages fk_rails_273a25a7a6; Type: FK CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk_rails_273a25a7a6 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: api_keys fk_rails_32c28d0dc2; Type: FK CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY api_keys
    ADD CONSTRAINT fk_rails_32c28d0dc2 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: order_items fk_rails_3e402078fd; Type: FK CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT fk_rails_3e402078fd FOREIGN KEY (item_id) REFERENCES items(id);


--
-- Name: user_role_stores fk_rails_426c74c9a9; Type: FK CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY user_role_stores
    ADD CONSTRAINT fk_rails_426c74c9a9 FOREIGN KEY (store_id) REFERENCES stores(id);


--
-- Name: messages fk_rails_5d3b5a27f5; Type: FK CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT fk_rails_5d3b5a27f5 FOREIGN KEY (chatroom_id) REFERENCES chatrooms(id);


--
-- Name: items fk_rails_89fb86dc8b; Type: FK CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY items
    ADD CONSTRAINT fk_rails_89fb86dc8b FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: user_role_stores fk_rails_b3438629e7; Type: FK CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY user_role_stores
    ADD CONSTRAINT fk_rails_b3438629e7 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: user_role_stores fk_rails_de33607c98; Type: FK CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY user_role_stores
    ADD CONSTRAINT fk_rails_de33607c98 FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: items fk_rails_e1affc3556; Type: FK CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY items
    ADD CONSTRAINT fk_rails_e1affc3556 FOREIGN KEY (store_id) REFERENCES stores(id);


--
-- Name: order_items fk_rails_e3cb28f071; Type: FK CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT fk_rails_e3cb28f071 FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: orders fk_rails_f868b47f6a; Type: FK CONSTRAINT; Schema: public; Owner: CURRENT_USER
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_rails_f868b47f6a FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

