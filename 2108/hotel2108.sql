--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 11.8

-- Started on 2020-08-21 11:21:31

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

SET default_with_oids = false;

--
-- TOC entry 203 (class 1259 OID 16606)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16604)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 205 (class 1259 OID 16616)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16614)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 201 (class 1259 OID 16598)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16596)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 207 (class 1259 OID 16624)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16634)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16632)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- TOC entry 206 (class 1259 OID 16622)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- TOC entry 211 (class 1259 OID 16642)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16640)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- TOC entry 213 (class 1259 OID 16702)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16700)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 199 (class 1259 OID 16588)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16586)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 197 (class 1259 OID 16577)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16575)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 214 (class 1259 OID 16792)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17102)
-- Name: main_app_adminprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_app_adminprofile (
    id integer NOT NULL,
    admin_type character varying(20) NOT NULL,
    phone character varying(10) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.main_app_adminprofile OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17100)
-- Name: main_app_adminprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_app_adminprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_adminprofile_id_seq OWNER TO postgres;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 227
-- Name: main_app_adminprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_app_adminprofile_id_seq OWNED BY public.main_app_adminprofile.id;


--
-- TOC entry 216 (class 1259 OID 17046)
-- Name: main_app_bills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_app_bills (
    bill_id integer NOT NULL,
    bill_type character varying(20) NOT NULL,
    amount double precision NOT NULL,
    date timestamp with time zone NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.main_app_bills OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17044)
-- Name: main_app_bills_bill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_app_bills_bill_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_bills_bill_id_seq OWNER TO postgres;

--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 215
-- Name: main_app_bills_bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_app_bills_bill_id_seq OWNED BY public.main_app_bills.bill_id;


--
-- TOC entry 218 (class 1259 OID 17054)
-- Name: main_app_bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_app_bookings (
    booking_id integer NOT NULL,
    customer_id integer NOT NULL,
    room_id integer NOT NULL,
    amount double precision NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL
);


ALTER TABLE public.main_app_bookings OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17052)
-- Name: main_app_bookings_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_app_bookings_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_bookings_booking_id_seq OWNER TO postgres;

--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 217
-- Name: main_app_bookings_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_app_bookings_booking_id_seq OWNED BY public.main_app_bookings.booking_id;


--
-- TOC entry 220 (class 1259 OID 17062)
-- Name: main_app_menuitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_app_menuitems (
    id integer NOT NULL,
    item_name character varying(50) NOT NULL,
    item_description text NOT NULL,
    item_price integer NOT NULL,
    item_available boolean NOT NULL
);


ALTER TABLE public.main_app_menuitems OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17060)
-- Name: main_app_menuitems_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_app_menuitems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_menuitems_id_seq OWNER TO postgres;

--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 219
-- Name: main_app_menuitems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_app_menuitems_id_seq OWNED BY public.main_app_menuitems.id;


--
-- TOC entry 222 (class 1259 OID 17073)
-- Name: main_app_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_app_orders (
    order_id integer NOT NULL,
    name character varying(50) NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE public.main_app_orders OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17071)
-- Name: main_app_orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_app_orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 221
-- Name: main_app_orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_app_orders_order_id_seq OWNED BY public.main_app_orders.order_id;


--
-- TOC entry 224 (class 1259 OID 17081)
-- Name: main_app_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_app_rooms (
    room_id integer NOT NULL,
    room_type character varying(50) NOT NULL,
    accomodations integer NOT NULL,
    price double precision NOT NULL,
    available character varying(3) NOT NULL
);


ALTER TABLE public.main_app_rooms OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17079)
-- Name: main_app_rooms_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_app_rooms_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_rooms_room_id_seq OWNER TO postgres;

--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 223
-- Name: main_app_rooms_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_app_rooms_room_id_seq OWNED BY public.main_app_rooms.room_id;


--
-- TOC entry 226 (class 1259 OID 17089)
-- Name: main_app_userprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_app_userprofile (
    id integer NOT NULL,
    phone character varying(10) NOT NULL,
    address text NOT NULL,
    aadhaar_number character varying(12) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.main_app_userprofile OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17087)
-- Name: main_app_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_app_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_app_userprofile_id_seq OWNER TO postgres;

--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 225
-- Name: main_app_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_app_userprofile_id_seq OWNED BY public.main_app_userprofile.id;


--
-- TOC entry 2788 (class 2604 OID 16609)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2789 (class 2604 OID 16619)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2787 (class 2604 OID 16601)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2790 (class 2604 OID 16627)
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- TOC entry 2791 (class 2604 OID 16637)
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- TOC entry 2792 (class 2604 OID 16645)
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 2793 (class 2604 OID 16705)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2786 (class 2604 OID 16591)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2785 (class 2604 OID 16580)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2801 (class 2604 OID 17105)
-- Name: main_app_adminprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_adminprofile ALTER COLUMN id SET DEFAULT nextval('public.main_app_adminprofile_id_seq'::regclass);


--
-- TOC entry 2795 (class 2604 OID 17049)
-- Name: main_app_bills bill_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_bills ALTER COLUMN bill_id SET DEFAULT nextval('public.main_app_bills_bill_id_seq'::regclass);


--
-- TOC entry 2796 (class 2604 OID 17057)
-- Name: main_app_bookings booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_bookings ALTER COLUMN booking_id SET DEFAULT nextval('public.main_app_bookings_booking_id_seq'::regclass);


--
-- TOC entry 2797 (class 2604 OID 17065)
-- Name: main_app_menuitems id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_menuitems ALTER COLUMN id SET DEFAULT nextval('public.main_app_menuitems_id_seq'::regclass);


--
-- TOC entry 2798 (class 2604 OID 17076)
-- Name: main_app_orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_orders ALTER COLUMN order_id SET DEFAULT nextval('public.main_app_orders_order_id_seq'::regclass);


--
-- TOC entry 2799 (class 2604 OID 17084)
-- Name: main_app_rooms room_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_rooms ALTER COLUMN room_id SET DEFAULT nextval('public.main_app_rooms_room_id_seq'::regclass);


--
-- TOC entry 2800 (class 2604 OID 17092)
-- Name: main_app_userprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_userprofile ALTER COLUMN id SET DEFAULT nextval('public.main_app_userprofile_id_seq'::regclass);


--
-- TOC entry 3006 (class 0 OID 16606)
-- Dependencies: 203
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3008 (class 0 OID 16616)
-- Dependencies: 205
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3004 (class 0 OID 16598)
-- Dependencies: 201
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (25, 'Can add login', 7, 'add_login');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (26, 'Can change login', 7, 'change_login');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (27, 'Can delete login', 7, 'delete_login');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (28, 'Can view login', 7, 'view_login');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (29, 'Can add admin', 8, 'add_admin');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (30, 'Can change admin', 8, 'change_admin');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (31, 'Can delete admin', 8, 'delete_admin');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (32, 'Can view admin', 8, 'view_admin');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (33, 'Can add bills', 9, 'add_bills');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (34, 'Can change bills', 9, 'change_bills');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (35, 'Can delete bills', 9, 'delete_bills');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (36, 'Can view bills', 9, 'view_bills');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (37, 'Can add bookings', 10, 'add_bookings');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (38, 'Can change bookings', 10, 'change_bookings');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (39, 'Can delete bookings', 10, 'delete_bookings');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (40, 'Can view bookings', 10, 'view_bookings');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (41, 'Can add customer', 11, 'add_customer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (42, 'Can change customer', 11, 'change_customer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (43, 'Can delete customer', 11, 'delete_customer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (44, 'Can view customer', 11, 'view_customer');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (45, 'Can add orders', 12, 'add_orders');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (46, 'Can change orders', 12, 'change_orders');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (47, 'Can delete orders', 12, 'delete_orders');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (48, 'Can view orders', 12, 'view_orders');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (49, 'Can add rooms', 13, 'add_rooms');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (50, 'Can change rooms', 13, 'change_rooms');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (51, 'Can delete rooms', 13, 'delete_rooms');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (52, 'Can view rooms', 13, 'view_rooms');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (53, 'Can add menu items', 14, 'add_menuitems');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (54, 'Can change menu items', 14, 'change_menuitems');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (55, 'Can delete menu items', 14, 'delete_menuitems');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (56, 'Can view menu items', 14, 'view_menuitems');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (57, 'Can add user profile', 15, 'add_userprofile');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (58, 'Can change user profile', 15, 'change_userprofile');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (59, 'Can delete user profile', 15, 'delete_userprofile');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (60, 'Can view user profile', 15, 'view_userprofile');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (61, 'Can add admin profile', 16, 'add_adminprofile');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (62, 'Can change admin profile', 16, 'change_adminprofile');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (63, 'Can delete admin profile', 16, 'delete_adminprofile');
INSERT INTO public.auth_permission (id, name, content_type_id, codename) VALUES (64, 'Can view admin profile', 16, 'view_adminprofile');


--
-- TOC entry 3010 (class 0 OID 16624)
-- Dependencies: 207
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (2, 'pbkdf2_sha256$150000$LkeTMLmrDN43$F7tPNwoaioB7gdP2zVKfTOWWMZjfHummgPHJcnJsPh8=', NULL, false, 'chef1', 'Praveen', 'Pandey', 'ppandey@gmail.com', false, true, '2020-08-20 14:49:11+05:30');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (3, 'pbkdf2_sha256$150000$y3tfqSDoBFLX$ZgQ5YIKnORA/1oxgPR0AQGxE7S3QQyOE75TozE50V2k=', NULL, false, 'chef2', 'Manoj', 'Raj', 'mraj@gmail.com', false, true, '2020-08-20 14:50:26+05:30');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (4, 'pbkdf2_sha256$150000$l6c4pyWGalsr$s61mLZl7FeSCK+FZjfI7NgmnRjYdtVE+zXAwF8R4cMo=', NULL, false, 'recep1', 'Jyoti', 'Singh', 'js@gmail.com', false, true, '2020-08-20 14:52:00+05:30');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (5, 'pbkdf2_sha256$150000$5iUed041CxNT$/+p9Gurw9+wtYqhF+KTZhBIPbMXI3SBmIjuCG8ciYhs=', NULL, false, 'recep2', 'Anand', 'Sharma', 'asharma@yahoo.com', false, true, '2020-08-20 14:52:52+05:30');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (6, 'pbkdf2_sha256$150000$DvjUJ1YOJ0WA$mAjlhYju4sSxcSwHUNWQZsBTC7qJJFufkFm+MBl9mhg=', NULL, false, 'owner', 'Raj', 'Singhania', 'rsnia@gmail.com', false, true, '2020-08-20 14:55:27+05:30');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (7, 'pbkdf2_sha256$150000$wxSg70UyKDpu$pepvMaVLikqtIAa2DjMpJWSSKJUYV3Y9js+GLgr44Ig=', NULL, false, 'roomservice1', 'Henry', 'Costa', 'hcosta@gmail.com', false, true, '2020-08-20 14:57:55+05:30');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (8, 'pbkdf2_sha256$150000$021tg5jOcBqG$k5bqzqDBLLgSRVagutGVjNAO0/dfOgtL7tudunt2dPA=', NULL, false, 'roomservice2', 'Shiv', 'Jain', 'sjain@yahoo.com', false, true, '2020-08-20 14:59:05+05:30');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (9, 'pbkdf2_sha256$150000$Ke9OVxl48M9e$ef0Asm2k+uvlxENVYIlzBYIy2+T/94FC9ng8YGmWTGI=', NULL, false, 'laundry1', 'Ramesh', 'J', 'rj12@gmail.com', false, true, '2020-08-20 15:01:08+05:30');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (10, 'pbkdf2_sha256$150000$YszoOjp6NFKh$GDewRPQcQxBbsfPn9BRkWEZkkejcT5dN+xNz4LiuKZY=', NULL, false, 'laundry2', 'Suresh', 'Shekar', 'sshekar@gmail.com', false, true, '2020-08-20 15:02:18+05:30');
INSERT INTO public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES (1, 'pbkdf2_sha256$150000$sMxI1nqncgzQ$zlZCGisFGq15PceFvjFzocTZXwmDmrMlymolh4jKUjw=', '2020-08-20 18:34:25.322211+05:30', true, 'backend', '', '', '', true, true, '2020-08-20 14:36:04+05:30');


--
-- TOC entry 3012 (class 0 OID 16634)
-- Dependencies: 209
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3014 (class 0 OID 16642)
-- Dependencies: 211
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3016 (class 0 OID 16702)
-- Dependencies: 213
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (1, '2020-08-20 14:49:12.017161+05:30', '2', 'chef1', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (2, '2020-08-20 14:49:47.92102+05:30', '2', 'chef1', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (3, '2020-08-20 14:50:26.931647+05:30', '3', 'chef2', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (4, '2020-08-20 14:50:46.838489+05:30', '3', 'chef2', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (5, '2020-08-20 14:52:01.331639+05:30', '4', 'recep1', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (6, '2020-08-20 14:52:19.316697+05:30', '4', 'recep1', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (7, '2020-08-20 14:52:52.709213+05:30', '5', 'recep2', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (8, '2020-08-20 14:53:13.189636+05:30', '5', 'recep2', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (9, '2020-08-20 14:55:28.068109+05:30', '6', 'owner', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (10, '2020-08-20 14:55:51.077114+05:30', '6', 'owner', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (11, '2020-08-20 14:57:56.224817+05:30', '7', 'roomservice1', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (12, '2020-08-20 14:58:43.168603+05:30', '7', 'roomservice1', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (13, '2020-08-20 14:59:06.103015+05:30', '8', 'roomservice2', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (14, '2020-08-20 14:59:42.406538+05:30', '8', 'roomservice2', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (15, '2020-08-20 15:01:08.894131+05:30', '9', 'laundry1', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (16, '2020-08-20 15:01:28.574994+05:30', '9', 'laundry1', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (17, '2020-08-20 15:02:18.952274+05:30', '10', 'laundry2', 1, '[{"added": {}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (18, '2020-08-20 15:02:53.515845+05:30', '10', 'laundry2', 2, '[{"changed": {"fields": ["first_name", "last_name", "email"]}}]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (19, '2020-08-20 15:06:32.425958+05:30', '1', 'AdminProfile object (1)', 1, '[{"added": {}}]', 16, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (20, '2020-08-20 15:06:55.285373+05:30', '2', 'AdminProfile object (2)', 1, '[{"added": {}}]', 16, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (21, '2020-08-20 15:07:15.080095+05:30', '3', 'AdminProfile object (3)', 1, '[{"added": {}}]', 16, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (22, '2020-08-20 15:07:32.938007+05:30', '4', 'AdminProfile object (4)', 1, '[{"added": {}}]', 16, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (23, '2020-08-20 15:08:04.029594+05:30', '5', 'AdminProfile object (5)', 1, '[{"added": {}}]', 16, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (24, '2020-08-20 15:08:31.891635+05:30', '6', 'AdminProfile object (6)', 1, '[{"added": {}}]', 16, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (25, '2020-08-20 15:09:08.098478+05:30', '7', 'AdminProfile object (7)', 1, '[{"added": {}}]', 16, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (26, '2020-08-20 15:09:49.62239+05:30', '8', 'AdminProfile object (8)', 1, '[{"added": {}}]', 16, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (27, '2020-08-20 15:10:11.826751+05:30', '9', 'AdminProfile object (9)', 1, '[{"added": {}}]', 16, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (28, '2020-08-20 15:13:40.801072+05:30', '10', 'laundry2', 2, '[]', 4, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) VALUES (29, '2020-08-20 15:14:12.488284+05:30', '1', 'backend', 2, '[{"changed": {"fields": ["username"]}}]', 4, 1);


--
-- TOC entry 3002 (class 0 OID 16588)
-- Dependencies: 199
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (7, 'main_app', 'login');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (8, 'main_app', 'admin');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (9, 'main_app', 'bills');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (10, 'main_app', 'bookings');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (11, 'main_app', 'customer');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (12, 'main_app', 'orders');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (13, 'main_app', 'rooms');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (14, 'main_app', 'menuitems');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (15, 'main_app', 'userprofile');
INSERT INTO public.django_content_type (id, app_label, model) VALUES (16, 'main_app', 'adminprofile');


--
-- TOC entry 3000 (class 0 OID 16577)
-- Dependencies: 197
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2020-08-06 17:00:44.545972+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2020-08-06 17:00:44.957058+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2020-08-06 17:00:45.529191+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-08-06 17:00:45.838744+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2020-08-06 17:00:45.864835+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2020-08-06 17:00:45.937129+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2020-08-06 17:00:45.955935+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2020-08-06 17:00:45.986438+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2020-08-06 17:00:46.010947+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2020-08-06 17:00:46.046053+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2020-08-06 17:00:46.052857+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2020-08-06 17:00:46.081269+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2020-08-06 17:00:46.139908+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2020-08-06 17:00:46.170808+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2020-08-06 17:00:46.200933+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (16, 'auth', '0011_update_proxy_permissions', '2020-08-06 17:00:46.23412+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (17, 'main_app', '0001_initial', '2020-08-06 17:00:46.369205+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (18, 'main_app', '0002_admin_bills_bookings_customer_orders_rooms', '2020-08-06 17:00:46.704325+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (19, 'sessions', '0001_initial', '2020-08-06 17:00:46.908472+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (20, 'main_app', '0003_delete_login', '2020-08-20 11:53:40.751461+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (21, 'main_app', '0004_auto_20200820_1241', '2020-08-20 12:41:47.295932+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (22, 'main_app', '0005_adminprofile_bills_bookings_menuitems_orders_rooms_userprofile', '2020-08-20 12:52:33.156131+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (23, 'main_app', '0006_auto_20200820_1443', '2020-08-20 14:43:23.652684+05:30');
INSERT INTO public.django_migrations (id, app, name, applied) VALUES (24, 'main_app', '0007_auto_20200820_1505', '2020-08-20 15:05:59.946816+05:30');


--
-- TOC entry 3017 (class 0 OID 16792)
-- Dependencies: 214
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('uq3wqsh2l843hxuffr59ylb65tln0boq', 'ZWI3ODUyODU1ODk3NzE2MThlZjAzYmUwNDBlN2FjNGY0NTM2MmFiZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNDAwMzJlNDJlZmE4YTVkNjk5YmZkMDI5N2YwNzdiNjBlN2M3OTFmIn0=', '2020-09-03 15:20:16.277249+05:30');
INSERT INTO public.django_session (session_key, session_data, expire_date) VALUES ('hriee0mr6q8c2l2ae6iq4ismtvlz6tp6', 'ZWI3ODUyODU1ODk3NzE2MThlZjAzYmUwNDBlN2FjNGY0NTM2MmFiZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNDAwMzJlNDJlZmE4YTVkNjk5YmZkMDI5N2YwNzdiNjBlN2M3OTFmIn0=', '2020-09-03 18:34:25.3272+05:30');


--
-- TOC entry 3031 (class 0 OID 17102)
-- Dependencies: 228
-- Data for Name: main_app_adminprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.main_app_adminprofile (id, admin_type, phone, user_id) VALUES (1, 'Chef', '9876543210', 2);
INSERT INTO public.main_app_adminprofile (id, admin_type, phone, user_id) VALUES (2, 'Chef', '9988776655', 3);
INSERT INTO public.main_app_adminprofile (id, admin_type, phone, user_id) VALUES (3, 'Laundry', '9998887776', 9);
INSERT INTO public.main_app_adminprofile (id, admin_type, phone, user_id) VALUES (4, 'Laundry', '9999888877', 10);
INSERT INTO public.main_app_adminprofile (id, admin_type, phone, user_id) VALUES (5, 'Owner', '9999988888', 6);
INSERT INTO public.main_app_adminprofile (id, admin_type, phone, user_id) VALUES (6, 'Receptionist', '9876501234', 4);
INSERT INTO public.main_app_adminprofile (id, admin_type, phone, user_id) VALUES (7, 'Receptionist', '9801762354', 5);
INSERT INTO public.main_app_adminprofile (id, admin_type, phone, user_id) VALUES (8, 'Room Service', '9988001177', 7);
INSERT INTO public.main_app_adminprofile (id, admin_type, phone, user_id) VALUES (9, 'Room Service', '9898010169', 8);


--
-- TOC entry 3019 (class 0 OID 17046)
-- Dependencies: 216
-- Data for Name: main_app_bills; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3021 (class 0 OID 17054)
-- Dependencies: 218
-- Data for Name: main_app_bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3023 (class 0 OID 17062)
-- Dependencies: 220
-- Data for Name: main_app_menuitems; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3025 (class 0 OID 17073)
-- Dependencies: 222
-- Data for Name: main_app_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3027 (class 0 OID 17081)
-- Dependencies: 224
-- Data for Name: main_app_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3029 (class 0 OID 17089)
-- Dependencies: 226
-- Data for Name: main_app_userprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 202
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 200
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);


--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 10, true);


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 212
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 29, true);


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 198
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 196
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 227
-- Name: main_app_adminprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_app_adminprofile_id_seq', 9, true);


--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 215
-- Name: main_app_bills_bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_app_bills_bill_id_seq', 1, false);


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 217
-- Name: main_app_bookings_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_app_bookings_booking_id_seq', 1, false);


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 219
-- Name: main_app_menuitems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_app_menuitems_id_seq', 1, false);


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 221
-- Name: main_app_orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_app_orders_order_id_seq', 1, false);


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 223
-- Name: main_app_rooms_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_app_rooms_room_id_seq', 1, false);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 225
-- Name: main_app_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_app_userprofile_id_seq', 1, false);


--
-- TOC entry 2815 (class 2606 OID 16731)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2820 (class 2606 OID 16668)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2823 (class 2606 OID 16621)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 16611)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 16654)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2812 (class 2606 OID 16603)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 16639)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 16683)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 2825 (class 2606 OID 16629)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 16647)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 16697)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 2828 (class 2606 OID 16725)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 2843 (class 2606 OID 16711)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 16595)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2807 (class 2606 OID 16593)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 16585)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 16799)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2864 (class 2606 OID 17107)
-- Name: main_app_adminprofile main_app_adminprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_adminprofile
    ADD CONSTRAINT main_app_adminprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 17109)
-- Name: main_app_adminprofile main_app_adminprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_adminprofile
    ADD CONSTRAINT main_app_adminprofile_user_id_key UNIQUE (user_id);


--
-- TOC entry 2850 (class 2606 OID 17051)
-- Name: main_app_bills main_app_bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_bills
    ADD CONSTRAINT main_app_bills_pkey PRIMARY KEY (bill_id);


--
-- TOC entry 2852 (class 2606 OID 17059)
-- Name: main_app_bookings main_app_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_bookings
    ADD CONSTRAINT main_app_bookings_pkey PRIMARY KEY (booking_id);


--
-- TOC entry 2854 (class 2606 OID 17070)
-- Name: main_app_menuitems main_app_menuitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_menuitems
    ADD CONSTRAINT main_app_menuitems_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 17078)
-- Name: main_app_orders main_app_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_orders
    ADD CONSTRAINT main_app_orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 2858 (class 2606 OID 17086)
-- Name: main_app_rooms main_app_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_rooms
    ADD CONSTRAINT main_app_rooms_pkey PRIMARY KEY (room_id);


--
-- TOC entry 2860 (class 2606 OID 17097)
-- Name: main_app_userprofile main_app_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_userprofile
    ADD CONSTRAINT main_app_userprofile_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 17099)
-- Name: main_app_userprofile main_app_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_userprofile
    ADD CONSTRAINT main_app_userprofile_user_id_key UNIQUE (user_id);


--
-- TOC entry 2813 (class 1259 OID 16732)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2818 (class 1259 OID 16669)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2821 (class 1259 OID 16670)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2808 (class 1259 OID 16655)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2829 (class 1259 OID 16685)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 2832 (class 1259 OID 16684)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 2835 (class 1259 OID 16699)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 2838 (class 1259 OID 16698)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 2826 (class 1259 OID 16726)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 2841 (class 1259 OID 16722)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2844 (class 1259 OID 16723)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2845 (class 1259 OID 16801)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2848 (class 1259 OID 16800)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2869 (class 2606 OID 16662)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2868 (class 2606 OID 16657)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2867 (class 2606 OID 16648)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2871 (class 2606 OID 16677)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2870 (class 2606 OID 16672)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2873 (class 2606 OID 16691)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2872 (class 2606 OID 16686)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2874 (class 2606 OID 16712)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2875 (class 2606 OID 16717)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2877 (class 2606 OID 17115)
-- Name: main_app_adminprofile main_app_adminprofile_user_id_522a2c0c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_adminprofile
    ADD CONSTRAINT main_app_adminprofile_user_id_522a2c0c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2876 (class 2606 OID 17110)
-- Name: main_app_userprofile main_app_userprofile_user_id_131f3a5f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_app_userprofile
    ADD CONSTRAINT main_app_userprofile_user_id_131f3a5f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2020-08-21 11:21:32

--
-- PostgreSQL database dump complete
--

