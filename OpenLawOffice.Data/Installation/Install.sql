--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.4
-- Dumped by pg_dump version 9.2.4
-- Started on 2014-06-21 14:26:45

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 211 (class 3079 OID 11727)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 211
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 168 (class 1259 OID 118747)
-- Name: ProfileData; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "ProfileData" (
    "pId" uuid NOT NULL,
    "Profile" uuid NOT NULL,
    "Name" character varying(255) NOT NULL,
    "ValueString" text,
    "ValueBinary" bytea
);


ALTER TABLE public."ProfileData" OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 118753)
-- Name: Profiles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Profiles" (
    "pId" uuid NOT NULL,
    "Username" character varying(255) NOT NULL,
    "ApplicationName" character varying(255) NOT NULL,
    "IsAnonymous" boolean,
    "LastActivityDate" timestamp with time zone,
    "LastUpdatedDate" timestamp with time zone
);


ALTER TABLE public."Profiles" OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 118759)
-- Name: Roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Roles" (
    "Rolename" character varying(255) NOT NULL,
    "ApplicationName" character varying(255) NOT NULL
);


ALTER TABLE public."Roles" OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 118765)
-- Name: Sessions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Sessions" (
    "SessionId" character varying(80) NOT NULL,
    "ApplicationName" character varying(255) NOT NULL,
    "Created" timestamp with time zone NOT NULL,
    "Expires" timestamp with time zone NOT NULL,
    "Timeout" integer NOT NULL,
    "Locked" boolean NOT NULL,
    "LockId" integer NOT NULL,
    "LockDate" timestamp with time zone NOT NULL,
    "Data" text,
    "Flags" integer NOT NULL
);


ALTER TABLE public."Sessions" OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 118771)
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "Users" (
    "pId" uuid NOT NULL,
    "Username" character varying(255) NOT NULL,
    "ApplicationName" character varying(255) NOT NULL,
    "Email" character varying(128),
    "Comment" character varying(128),
    "Password" character varying(255) NOT NULL,
    "PasswordQuestion" character varying(255),
    "PasswordAnswer" character varying(255),
    "IsApproved" boolean,
    "LastActivityDate" timestamp with time zone,
    "LastLoginDate" timestamp with time zone,
    "LastPasswordChangedDate" timestamp with time zone,
    "CreationDate" timestamp with time zone,
    "IsOnLine" boolean,
    "IsLockedOut" boolean,
    "LastLockedOutDate" timestamp with time zone,
    "FailedPasswordAttemptCount" integer,
    "FailedPasswordAttemptWindowStart" timestamp with time zone,
    "FailedPasswordAnswerAttemptCount" integer,
    "FailedPasswordAnswerAttemptWindowStart" timestamp with time zone
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 118777)
-- Name: UsersInRoles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "UsersInRoles" (
    "Username" character varying(255) NOT NULL,
    "Rolename" character varying(255) NOT NULL,
    "ApplicationName" character varying(255) NOT NULL
);


ALTER TABLE public."UsersInRoles" OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 118783)
-- Name: core; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE core (
    created_by_user_pid uuid NOT NULL,
    modified_by_user_pid uuid NOT NULL,
    disabled_by_user_pid uuid,
    utc_created timestamp without time zone NOT NULL,
    utc_modified timestamp without time zone NOT NULL,
    utc_disabled timestamp without time zone
);


ALTER TABLE public.core OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 118786)
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contact (
    id integer NOT NULL,
    is_organization boolean NOT NULL,
    is_our_employee boolean NOT NULL,
    nickname text,
    generation text,
    display_name_prefix text,
    surname text,
    middle_name text,
    given_name text,
    initials text,
    display_name text NOT NULL,
    email1_display_name text,
    email1_email_address text,
    email2_display_name text,
    email2_email_address text,
    email3_display_name text,
    email3_email_address text,
    fax1_display_name text,
    fax1_fax_number text,
    fax2_display_name text,
    fax2_fax_number text,
    fax3_display_name text,
    fax3_fax_number text,
    address1_display_name text,
    address1_address_street text,
    address1_address_city text,
    address1_address_state_or_province text,
    address1_address_postal_code text,
    address1_address_country text,
    address1_address_country_code text,
    address1_address_post_office_box text,
    address2_display_name text,
    address2_address_street text,
    address2_address_city text,
    address2_address_state_or_province text,
    address2_address_postal_code text,
    address2_address_country text,
    address2_address_country_code text,
    address2_address_post_office_box text,
    address3_display_name text,
    address3_address_street text,
    address3_address_city text,
    address3_address_state_or_province text,
    address3_address_postal_code text,
    address3_address_country text,
    address3_address_country_code text,
    address3_address_post_office_box text,
    telephone1_display_name text,
    telephone1_telephone_number text,
    telephone2_display_name text,
    telephone2_telephone_number text,
    telephone3_display_name text,
    telephone3_telephone_number text,
    telephone4_display_name text,
    telephone4_telephone_number text,
    telephone5_display_name text,
    telephone5_telephone_number text,
    telephone6_display_name text,
    telephone6_telephone_number text,
    telephone7_display_name text,
    telephone7_telephone_number text,
    telephone8_display_name text,
    telephone8_telephone_number text,
    telephone9_display_name text,
    telephone9_telephone_number text,
    telephone10_display_name text,
    telephone10_telephone_number text,
    birthday timestamp without time zone,
    wedding timestamp without time zone,
    title text,
    company_name text,
    department_name text,
    office_location text,
    manager_name text,
    assistant_name text,
    profession text,
    spouse_name text,
    language text,
    instant_messaging_address text,
    personal_home_page text,
    business_home_page text,
    gender text,
    referred_by_name text
)
INHERITS (core);


ALTER TABLE public.contact OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 118792)
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_id_seq OWNER TO postgres;

--
-- TOC entry 2240 (class 0 OID 0)
-- Dependencies: 176
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contact_id_seq OWNED BY contact.id;


--
-- TOC entry 177 (class 1259 OID 118794)
-- Name: document; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE document (
    id uuid NOT NULL,
    title text NOT NULL,
    date timestamp without time zone
)
INHERITS (core);


ALTER TABLE public.document OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 118800)
-- Name: document_matter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE document_matter (
    id uuid NOT NULL,
    document_id uuid NOT NULL,
    matter_id uuid NOT NULL
)
INHERITS (core);


ALTER TABLE public.document_matter OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 118803)
-- Name: document_task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE document_task (
    id uuid NOT NULL,
    document_id uuid NOT NULL,
    task_id bigint NOT NULL
)
INHERITS (core);


ALTER TABLE public.document_task OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 118806)
-- Name: elmah_error_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE elmah_error_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elmah_error_sequence OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 118808)
-- Name: elmah_error; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE elmah_error (
    errorid character(36) NOT NULL,
    application character varying(60) NOT NULL,
    host character varying(50) NOT NULL,
    type character varying(100) NOT NULL,
    source character varying(60) NOT NULL,
    message character varying(500) NOT NULL,
    "User" character varying(50) NOT NULL,
    statuscode integer NOT NULL,
    timeutc timestamp without time zone NOT NULL,
    sequence integer DEFAULT nextval('elmah_error_sequence'::regclass) NOT NULL,
    allxml text NOT NULL
);


ALTER TABLE public.elmah_error OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 118815)
-- Name: event; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event (
    id uuid NOT NULL,
    title text NOT NULL,
    allday boolean NOT NULL,
    start timestamp without time zone NOT NULL,
    "end" timestamp without time zone,
    location text,
    description text
)
INHERITS (core);


ALTER TABLE public.event OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 118821)
-- Name: event_assigned_contact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_assigned_contact (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    contact_id integer NOT NULL,
    role text NOT NULL
)
INHERITS (core);


ALTER TABLE public.event_assigned_contact OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 118827)
-- Name: event_matter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_matter (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    matter_id uuid NOT NULL
)
INHERITS (core);


ALTER TABLE public.event_matter OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 118830)
-- Name: event_note; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_note (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    note_id uuid NOT NULL
)
INHERITS (core);


ALTER TABLE public.event_note OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 118833)
-- Name: event_responsible_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_responsible_user (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    user_pid uuid NOT NULL,
    responsibility text NOT NULL
)
INHERITS (core);


ALTER TABLE public.event_responsible_user OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 118839)
-- Name: event_tag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_tag (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    tag_category_id integer,
    tag text NOT NULL
)
INHERITS (core);


ALTER TABLE public.event_tag OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 118845)
-- Name: event_task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE event_task (
    id uuid NOT NULL,
    event_id uuid NOT NULL,
    task_id bigint NOT NULL
)
INHERITS (core);


ALTER TABLE public.event_task OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 118848)
-- Name: matter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE matter (
    id uuid NOT NULL,
    title text NOT NULL,
    active boolean NOT NULL,
    parent_id uuid,
    synopsis text NOT NULL
)
INHERITS (core);


ALTER TABLE public.matter OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 118854)
-- Name: matter_contact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE matter_contact (
    id integer NOT NULL,
    matter_id uuid NOT NULL,
    contact_id integer NOT NULL,
    role text NOT NULL
)
INHERITS (core);


ALTER TABLE public.matter_contact OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 118860)
-- Name: matter_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE matter_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matter_contact_id_seq OWNER TO postgres;

--
-- TOC entry 2241 (class 0 OID 0)
-- Dependencies: 191
-- Name: matter_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE matter_contact_id_seq OWNED BY matter_contact.id;


--
-- TOC entry 192 (class 1259 OID 118862)
-- Name: matter_tag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE matter_tag (
    id uuid NOT NULL,
    matter_id uuid NOT NULL,
    tag_category_id integer,
    tag text NOT NULL
)
INHERITS (core);


ALTER TABLE public.matter_tag OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 118868)
-- Name: note; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE note (
    id uuid NOT NULL,
    title text NOT NULL,
    body text NOT NULL
)
INHERITS (core);


ALTER TABLE public.note OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 118874)
-- Name: note_matter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE note_matter (
    id uuid NOT NULL,
    note_id uuid NOT NULL,
    matter_id uuid NOT NULL
)
INHERITS (core);


ALTER TABLE public.note_matter OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 118877)
-- Name: note_task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE note_task (
    id uuid NOT NULL,
    note_id uuid NOT NULL,
    task_id bigint NOT NULL
)
INHERITS (core);


ALTER TABLE public.note_task OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 118880)
-- Name: responsible_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE responsible_user (
    id integer NOT NULL,
    matter_id uuid NOT NULL,
    user_pid uuid NOT NULL,
    responsibility text NOT NULL
)
INHERITS (core);


ALTER TABLE public.responsible_user OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 118886)
-- Name: responsible_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE responsible_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.responsible_user_id_seq OWNER TO postgres;

--
-- TOC entry 2242 (class 0 OID 0)
-- Dependencies: 197
-- Name: responsible_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE responsible_user_id_seq OWNED BY responsible_user.id;


--
-- TOC entry 198 (class 1259 OID 118888)
-- Name: tag_category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tag_category (
    id integer NOT NULL,
    name text NOT NULL
)
INHERITS (core);


ALTER TABLE public.tag_category OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 118894)
-- Name: tag_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tag_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_category_id_seq OWNER TO postgres;

--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 199
-- Name: tag_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tag_category_id_seq OWNED BY tag_category.id;


--
-- TOC entry 200 (class 1259 OID 118896)
-- Name: tag_filter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tag_filter (
    id bigint NOT NULL,
    user_pid uuid NOT NULL,
    category text,
    tag text NOT NULL
)
INHERITS (core);


ALTER TABLE public.tag_filter OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 118902)
-- Name: tag_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tag_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_filter_id_seq OWNER TO postgres;

--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 201
-- Name: tag_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tag_filter_id_seq OWNED BY tag_filter.id;


--
-- TOC entry 202 (class 1259 OID 118904)
-- Name: task; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task (
    id bigint NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    projected_start timestamp without time zone,
    due_date timestamp without time zone,
    projected_end timestamp without time zone,
    actual_end timestamp without time zone,
    parent_id bigint,
    is_grouping_task boolean NOT NULL,
    sequential_predecessor_id bigint,
    active boolean NOT NULL
)
INHERITS (core);


ALTER TABLE public.task OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 118910)
-- Name: task_assigned_contact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task_assigned_contact (
    id uuid NOT NULL,
    task_id bigint NOT NULL,
    contact_id integer NOT NULL,
    assignment_type smallint DEFAULT 1 NOT NULL
)
INHERITS (core);


ALTER TABLE public.task_assigned_contact OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 118914)
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO postgres;

--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 204
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE task_id_seq OWNED BY task.id;


--
-- TOC entry 205 (class 1259 OID 118916)
-- Name: task_matter; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task_matter (
    id uuid NOT NULL,
    task_id bigint NOT NULL,
    matter_id uuid NOT NULL
)
INHERITS (core);


ALTER TABLE public.task_matter OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 118919)
-- Name: task_responsible_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task_responsible_user (
    id uuid NOT NULL,
    task_id bigint NOT NULL,
    user_pid uuid NOT NULL,
    responsibility text NOT NULL
)
INHERITS (core);


ALTER TABLE public.task_responsible_user OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 118925)
-- Name: task_tag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task_tag (
    id uuid NOT NULL,
    task_id bigint NOT NULL,
    tag_category_id integer,
    tag text NOT NULL
)
INHERITS (core);


ALTER TABLE public.task_tag OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 118931)
-- Name: task_time; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE task_time (
    id uuid NOT NULL,
    task_id bigint NOT NULL,
    time_id uuid NOT NULL
)
INHERITS (core);


ALTER TABLE public.task_time OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 118934)
-- Name: time; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "time" (
    id uuid NOT NULL,
    start timestamp without time zone NOT NULL,
    stop timestamp without time zone,
    worker_contact_id integer NOT NULL,
    details text
)
INHERITS (core);


ALTER TABLE public."time" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 118940)
-- Name: version; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE version (
    id uuid NOT NULL,
    document_id uuid NOT NULL,
    version_number integer NOT NULL,
    mime text NOT NULL,
    filename text NOT NULL,
    extension text NOT NULL,
    size bigint NOT NULL,
    md5 text NOT NULL
)
INHERITS (core);


ALTER TABLE public.version OWNER TO postgres;

--
-- TOC entry 2093 (class 2604 OID 118946)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contact ALTER COLUMN id SET DEFAULT nextval('contact_id_seq'::regclass);


--
-- TOC entry 2095 (class 2604 OID 118947)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matter_contact ALTER COLUMN id SET DEFAULT nextval('matter_contact_id_seq'::regclass);


--
-- TOC entry 2096 (class 2604 OID 118948)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY responsible_user ALTER COLUMN id SET DEFAULT nextval('responsible_user_id_seq'::regclass);


--
-- TOC entry 2097 (class 2604 OID 118949)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tag_category ALTER COLUMN id SET DEFAULT nextval('tag_category_id_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 118950)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tag_filter ALTER COLUMN id SET DEFAULT nextval('tag_filter_id_seq'::regclass);


--
-- TOC entry 2099 (class 2604 OID 118951)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task ALTER COLUMN id SET DEFAULT nextval('task_id_seq'::regclass);


--
-- TOC entry 2171 (class 2606 OID 118953)
-- Name: UQ_task_matter_Task_Matter; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task_matter
    ADD CONSTRAINT "UQ_task_matter_Task_Matter" UNIQUE (task_id, matter_id);


--
-- TOC entry 2115 (class 2606 OID 118955)
-- Name: Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("pId");


--
-- TOC entry 2123 (class 2606 OID 118957)
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- TOC entry 2127 (class 2606 OID 118959)
-- Name: document_matter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document_matter
    ADD CONSTRAINT document_matter_pkey PRIMARY KEY (id);


--
-- TOC entry 2125 (class 2606 OID 118961)
-- Name: document_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document
    ADD CONSTRAINT document_pkey PRIMARY KEY (id);


--
-- TOC entry 2129 (class 2606 OID 118963)
-- Name: document_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY document_task
    ADD CONSTRAINT document_task_pkey PRIMARY KEY (id);


--
-- TOC entry 2136 (class 2606 OID 118965)
-- Name: event_assigned_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_assigned_contact
    ADD CONSTRAINT event_assigned_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 2138 (class 2606 OID 118967)
-- Name: event_matter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_matter
    ADD CONSTRAINT event_matter_pkey PRIMARY KEY (id);


--
-- TOC entry 2140 (class 2606 OID 118969)
-- Name: event_note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_note
    ADD CONSTRAINT event_note_pkey PRIMARY KEY (id);


--
-- TOC entry 2134 (class 2606 OID 118971)
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- TOC entry 2142 (class 2606 OID 118973)
-- Name: event_responsible_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_responsible_user
    ADD CONSTRAINT event_responsible_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2144 (class 2606 OID 118975)
-- Name: event_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_tag
    ADD CONSTRAINT event_tag_pkey PRIMARY KEY (id);


--
-- TOC entry 2146 (class 2606 OID 118977)
-- Name: event_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY event_task
    ADD CONSTRAINT event_task_pkey PRIMARY KEY (id);


--
-- TOC entry 2150 (class 2606 OID 118979)
-- Name: matter_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY matter_contact
    ADD CONSTRAINT matter_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 2148 (class 2606 OID 118981)
-- Name: matter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY matter
    ADD CONSTRAINT matter_pkey PRIMARY KEY (id);


--
-- TOC entry 2152 (class 2606 OID 118983)
-- Name: matter_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY matter_tag
    ADD CONSTRAINT matter_tag_pkey PRIMARY KEY (id);


--
-- TOC entry 2156 (class 2606 OID 118985)
-- Name: note_matter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY note_matter
    ADD CONSTRAINT note_matter_pkey PRIMARY KEY (id);


--
-- TOC entry 2154 (class 2606 OID 118987)
-- Name: note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- TOC entry 2158 (class 2606 OID 118989)
-- Name: note_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY note_task
    ADD CONSTRAINT note_task_pkey PRIMARY KEY (id);


--
-- TOC entry 2132 (class 2606 OID 118991)
-- Name: pk_elmah_error; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY elmah_error
    ADD CONSTRAINT pk_elmah_error PRIMARY KEY (errorid);


--
-- TOC entry 2102 (class 2606 OID 118993)
-- Name: profiledata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ProfileData"
    ADD CONSTRAINT profiledata_pkey PRIMARY KEY ("pId");


--
-- TOC entry 2104 (class 2606 OID 118995)
-- Name: profiledata_profile_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ProfileData"
    ADD CONSTRAINT profiledata_profile_name_unique UNIQUE ("Profile", "Name");


--
-- TOC entry 2107 (class 2606 OID 118997)
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Profiles"
    ADD CONSTRAINT profiles_pkey PRIMARY KEY ("pId");


--
-- TOC entry 2109 (class 2606 OID 118999)
-- Name: profiles_username_application_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Profiles"
    ADD CONSTRAINT profiles_username_application_unique UNIQUE ("Username", "ApplicationName");


--
-- TOC entry 2160 (class 2606 OID 119001)
-- Name: responsible_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY responsible_user
    ADD CONSTRAINT responsible_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2111 (class 2606 OID 119003)
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Roles"
    ADD CONSTRAINT roles_pkey PRIMARY KEY ("Rolename", "ApplicationName");


--
-- TOC entry 2113 (class 2606 OID 119005)
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT sessions_pkey PRIMARY KEY ("SessionId", "ApplicationName");


--
-- TOC entry 2162 (class 2606 OID 119007)
-- Name: tag_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tag_category
    ADD CONSTRAINT tag_category_pkey PRIMARY KEY (id);


--
-- TOC entry 2165 (class 2606 OID 119009)
-- Name: tag_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tag_filter
    ADD CONSTRAINT tag_filter_pkey PRIMARY KEY (id);


--
-- TOC entry 2169 (class 2606 OID 119011)
-- Name: task_assigned_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task_assigned_contact
    ADD CONSTRAINT task_assigned_contact_pkey PRIMARY KEY (id);


--
-- TOC entry 2173 (class 2606 OID 119013)
-- Name: task_matter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task_matter
    ADD CONSTRAINT task_matter_pkey PRIMARY KEY (id);


--
-- TOC entry 2167 (class 2606 OID 119015)
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- TOC entry 2175 (class 2606 OID 119017)
-- Name: task_responsible_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task_responsible_user
    ADD CONSTRAINT task_responsible_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2177 (class 2606 OID 119019)
-- Name: task_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task_tag
    ADD CONSTRAINT task_tag_pkey PRIMARY KEY (id);


--
-- TOC entry 2179 (class 2606 OID 119021)
-- Name: task_time_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY task_time
    ADD CONSTRAINT task_time_pkey PRIMARY KEY (id);


--
-- TOC entry 2181 (class 2606 OID 119023)
-- Name: time_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "time"
    ADD CONSTRAINT time_pkey PRIMARY KEY (id);


--
-- TOC entry 2119 (class 2606 OID 119025)
-- Name: users_username_application_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT users_username_application_unique UNIQUE ("Username", "ApplicationName");


--
-- TOC entry 2121 (class 2606 OID 119027)
-- Name: usersinroles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "UsersInRoles"
    ADD CONSTRAINT usersinroles_pkey PRIMARY KEY ("Username", "Rolename", "ApplicationName");


--
-- TOC entry 2183 (class 2606 OID 119029)
-- Name: version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY version
    ADD CONSTRAINT version_pkey PRIMARY KEY (id);


--
-- TOC entry 2130 (class 1259 OID 119030)
-- Name: ix_elmah_error_app_time_seq; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ix_elmah_error_app_time_seq ON elmah_error USING btree (application, timeutc DESC, sequence DESC);


--
-- TOC entry 2105 (class 1259 OID 119031)
-- Name: profiles_isanonymous_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX profiles_isanonymous_index ON "Profiles" USING btree ("IsAnonymous");


--
-- TOC entry 2163 (class 1259 OID 119032)
-- Name: uidx_tagcategory_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX uidx_tagcategory_name ON tag_category USING btree (name);


--
-- TOC entry 2116 (class 1259 OID 119033)
-- Name: users_email_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX users_email_index ON "Users" USING btree ("Email");


--
-- TOC entry 2117 (class 1259 OID 119034)
-- Name: users_islockedout_index; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX users_islockedout_index ON "Users" USING btree ("IsLockedOut");


--
-- TOC entry 2188 (class 2606 OID 119035)
-- Name: FK_core_user_CreatedByUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core
    ADD CONSTRAINT "FK_core_user_CreatedByUserId" FOREIGN KEY (created_by_user_pid) REFERENCES "Users"("pId");


--
-- TOC entry 2189 (class 2606 OID 119040)
-- Name: FK_core_user_DisabledByUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core
    ADD CONSTRAINT "FK_core_user_DisabledByUserId" FOREIGN KEY (disabled_by_user_pid) REFERENCES "Users"("pId");


--
-- TOC entry 2190 (class 2606 OID 119045)
-- Name: FK_core_user_ModifiedByUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core
    ADD CONSTRAINT "FK_core_user_ModifiedByUserId" FOREIGN KEY (modified_by_user_pid) REFERENCES "Users"("pId");


--
-- TOC entry 2191 (class 2606 OID 119050)
-- Name: FK_document_matter_document_DocumentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document_matter
    ADD CONSTRAINT "FK_document_matter_document_DocumentId" FOREIGN KEY (document_id) REFERENCES document(id);


--
-- TOC entry 2192 (class 2606 OID 119055)
-- Name: FK_document_matter_matter_MatterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document_matter
    ADD CONSTRAINT "FK_document_matter_matter_MatterId" FOREIGN KEY (matter_id) REFERENCES matter(id);


--
-- TOC entry 2193 (class 2606 OID 119060)
-- Name: FK_document_task_document_DocumentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document_task
    ADD CONSTRAINT "FK_document_task_document_DocumentId" FOREIGN KEY (document_id) REFERENCES document(id);


--
-- TOC entry 2194 (class 2606 OID 119065)
-- Name: FK_document_task_matter_MatterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY document_task
    ADD CONSTRAINT "FK_document_task_matter_MatterId" FOREIGN KEY (task_id) REFERENCES task(id);


--
-- TOC entry 2195 (class 2606 OID 119070)
-- Name: FK_event_assigned_contact_contact_ContactId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_assigned_contact
    ADD CONSTRAINT "FK_event_assigned_contact_contact_ContactId" FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2196 (class 2606 OID 119075)
-- Name: FK_event_assigned_contact_event_EventId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_assigned_contact
    ADD CONSTRAINT "FK_event_assigned_contact_event_EventId" FOREIGN KEY (event_id) REFERENCES event(id);


--
-- TOC entry 2197 (class 2606 OID 119080)
-- Name: FK_event_matter_event_EventId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_matter
    ADD CONSTRAINT "FK_event_matter_event_EventId" FOREIGN KEY (event_id) REFERENCES event(id);


--
-- TOC entry 2198 (class 2606 OID 119085)
-- Name: FK_event_matter_matter_MatterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_matter
    ADD CONSTRAINT "FK_event_matter_matter_MatterId" FOREIGN KEY (matter_id) REFERENCES matter(id);


--
-- TOC entry 2199 (class 2606 OID 119090)
-- Name: FK_event_note_event_EventId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_note
    ADD CONSTRAINT "FK_event_note_event_EventId" FOREIGN KEY (event_id) REFERENCES event(id);


--
-- TOC entry 2200 (class 2606 OID 119095)
-- Name: FK_event_note_note_NoteId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_note
    ADD CONSTRAINT "FK_event_note_note_NoteId" FOREIGN KEY (note_id) REFERENCES note(id);


--
-- TOC entry 2201 (class 2606 OID 119100)
-- Name: FK_event_responsible_user_task_TaskId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_responsible_user
    ADD CONSTRAINT "FK_event_responsible_user_task_TaskId" FOREIGN KEY (event_id) REFERENCES event(id);


--
-- TOC entry 2202 (class 2606 OID 119105)
-- Name: FK_event_responsible_user_user_MatterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_responsible_user
    ADD CONSTRAINT "FK_event_responsible_user_user_MatterId" FOREIGN KEY (user_pid) REFERENCES "Users"("pId");


--
-- TOC entry 2203 (class 2606 OID 119110)
-- Name: FK_event_tag_event_EventId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_tag
    ADD CONSTRAINT "FK_event_tag_event_EventId" FOREIGN KEY (event_id) REFERENCES event(id);


--
-- TOC entry 2204 (class 2606 OID 119115)
-- Name: FK_event_tag_tag_category_TagCategoryId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_tag
    ADD CONSTRAINT "FK_event_tag_tag_category_TagCategoryId" FOREIGN KEY (tag_category_id) REFERENCES tag_category(id);


--
-- TOC entry 2205 (class 2606 OID 119120)
-- Name: FK_event_task_event_EventId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_task
    ADD CONSTRAINT "FK_event_task_event_EventId" FOREIGN KEY (event_id) REFERENCES event(id);


--
-- TOC entry 2206 (class 2606 OID 119125)
-- Name: FK_event_task_task_TaskId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY event_task
    ADD CONSTRAINT "FK_event_task_task_TaskId" FOREIGN KEY (task_id) REFERENCES task(id);


--
-- TOC entry 2208 (class 2606 OID 119130)
-- Name: FK_matter_contact_matter_MatterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matter_contact
    ADD CONSTRAINT "FK_matter_contact_matter_MatterId" FOREIGN KEY (matter_id) REFERENCES matter(id);


--
-- TOC entry 2209 (class 2606 OID 119135)
-- Name: FK_matter_contact_user_ContactId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matter_contact
    ADD CONSTRAINT "FK_matter_contact_user_ContactId" FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2207 (class 2606 OID 119140)
-- Name: FK_matter_matter_ParentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matter
    ADD CONSTRAINT "FK_matter_matter_ParentId" FOREIGN KEY (parent_id) REFERENCES matter(id);


--
-- TOC entry 2210 (class 2606 OID 119145)
-- Name: FK_matter_tag_matter_MatterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matter_tag
    ADD CONSTRAINT "FK_matter_tag_matter_MatterId" FOREIGN KEY (matter_id) REFERENCES matter(id);


--
-- TOC entry 2211 (class 2606 OID 119150)
-- Name: FK_matter_tag_tag_category_TagCategoryId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY matter_tag
    ADD CONSTRAINT "FK_matter_tag_tag_category_TagCategoryId" FOREIGN KEY (tag_category_id) REFERENCES tag_category(id);


--
-- TOC entry 2212 (class 2606 OID 119155)
-- Name: FK_note_matter_matter_MatterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY note_matter
    ADD CONSTRAINT "FK_note_matter_matter_MatterId" FOREIGN KEY (matter_id) REFERENCES matter(id);


--
-- TOC entry 2213 (class 2606 OID 119160)
-- Name: FK_note_matter_note_NoteId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY note_matter
    ADD CONSTRAINT "FK_note_matter_note_NoteId" FOREIGN KEY (note_id) REFERENCES note(id);


--
-- TOC entry 2214 (class 2606 OID 119165)
-- Name: FK_note_task_note_NoteId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY note_task
    ADD CONSTRAINT "FK_note_task_note_NoteId" FOREIGN KEY (note_id) REFERENCES note(id);


--
-- TOC entry 2215 (class 2606 OID 119170)
-- Name: FK_note_task_task_TaskId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY note_task
    ADD CONSTRAINT "FK_note_task_task_TaskId" FOREIGN KEY (task_id) REFERENCES task(id);


--
-- TOC entry 2216 (class 2606 OID 119175)
-- Name: FK_responsible_user_matter_MatterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY responsible_user
    ADD CONSTRAINT "FK_responsible_user_matter_MatterId" FOREIGN KEY (matter_id) REFERENCES matter(id);


--
-- TOC entry 2217 (class 2606 OID 119180)
-- Name: FK_responsible_user_user_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY responsible_user
    ADD CONSTRAINT "FK_responsible_user_user_UserId" FOREIGN KEY (user_pid) REFERENCES "Users"("pId");


--
-- TOC entry 2218 (class 2606 OID 119185)
-- Name: FK_tag_filter_user_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tag_filter
    ADD CONSTRAINT "FK_tag_filter_user_UserId" FOREIGN KEY (user_pid) REFERENCES "Users"("pId");


--
-- TOC entry 2221 (class 2606 OID 119190)
-- Name: FK_task_assigned_contact_contact_ContactId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_assigned_contact
    ADD CONSTRAINT "FK_task_assigned_contact_contact_ContactId" FOREIGN KEY (contact_id) REFERENCES contact(id);


--
-- TOC entry 2222 (class 2606 OID 119195)
-- Name: FK_task_assigned_contact_task_TaskId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_assigned_contact
    ADD CONSTRAINT "FK_task_assigned_contact_task_TaskId" FOREIGN KEY (task_id) REFERENCES task(id);


--
-- TOC entry 2223 (class 2606 OID 119200)
-- Name: FK_task_matter_matter_MatterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_matter
    ADD CONSTRAINT "FK_task_matter_matter_MatterId" FOREIGN KEY (matter_id) REFERENCES matter(id);


--
-- TOC entry 2224 (class 2606 OID 119205)
-- Name: FK_task_matter_task_TaskId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_matter
    ADD CONSTRAINT "FK_task_matter_task_TaskId" FOREIGN KEY (task_id) REFERENCES task(id);


--
-- TOC entry 2225 (class 2606 OID 119210)
-- Name: FK_task_responsible_user_task_TaskId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_responsible_user
    ADD CONSTRAINT "FK_task_responsible_user_task_TaskId" FOREIGN KEY (task_id) REFERENCES task(id);


--
-- TOC entry 2226 (class 2606 OID 119215)
-- Name: FK_task_responsible_user_user_MatterId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_responsible_user
    ADD CONSTRAINT "FK_task_responsible_user_user_MatterId" FOREIGN KEY (user_pid) REFERENCES "Users"("pId");


--
-- TOC entry 2227 (class 2606 OID 119220)
-- Name: FK_task_tag_tag_category_TagCategoryId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_tag
    ADD CONSTRAINT "FK_task_tag_tag_category_TagCategoryId" FOREIGN KEY (tag_category_id) REFERENCES tag_category(id);


--
-- TOC entry 2228 (class 2606 OID 119225)
-- Name: FK_task_tag_task_TaskId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_tag
    ADD CONSTRAINT "FK_task_tag_task_TaskId" FOREIGN KEY (task_id) REFERENCES task(id);


--
-- TOC entry 2219 (class 2606 OID 119230)
-- Name: FK_task_task_ParentId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task
    ADD CONSTRAINT "FK_task_task_ParentId" FOREIGN KEY (parent_id) REFERENCES task(id);


--
-- TOC entry 2220 (class 2606 OID 119235)
-- Name: FK_task_task_SequentialPredecessorId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task
    ADD CONSTRAINT "FK_task_task_SequentialPredecessorId" FOREIGN KEY (sequential_predecessor_id) REFERENCES task(id);


--
-- TOC entry 2229 (class 2606 OID 119240)
-- Name: FK_task_time_task_TaskId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_time
    ADD CONSTRAINT "FK_task_time_task_TaskId" FOREIGN KEY (task_id) REFERENCES task(id);


--
-- TOC entry 2230 (class 2606 OID 119245)
-- Name: FK_task_time_user_TimeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY task_time
    ADD CONSTRAINT "FK_task_time_user_TimeId" FOREIGN KEY (time_id) REFERENCES "time"(id);


--
-- TOC entry 2231 (class 2606 OID 119319)
-- Name: FK_time_user_WorkerContactId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "time"
    ADD CONSTRAINT "FK_time_user_WorkerContactId" FOREIGN KEY (worker_contact_id) REFERENCES contact(id);


--
-- TOC entry 2184 (class 2606 OID 119255)
-- Name: profiledata_profile_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ProfileData"
    ADD CONSTRAINT profiledata_profile_fkey FOREIGN KEY ("Profile") REFERENCES "Profiles"("pId") ON DELETE CASCADE;


--
-- TOC entry 2185 (class 2606 OID 119260)
-- Name: profiles_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Profiles"
    ADD CONSTRAINT profiles_username_fkey FOREIGN KEY ("Username", "ApplicationName") REFERENCES "Users"("Username", "ApplicationName") ON DELETE CASCADE;


--
-- TOC entry 2186 (class 2606 OID 119265)
-- Name: usersinroles_rolename_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "UsersInRoles"
    ADD CONSTRAINT usersinroles_rolename_fkey FOREIGN KEY ("Rolename", "ApplicationName") REFERENCES "Roles"("Rolename", "ApplicationName") ON DELETE CASCADE;


--
-- TOC entry 2187 (class 2606 OID 119270)
-- Name: usersinroles_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "UsersInRoles"
    ADD CONSTRAINT usersinroles_username_fkey FOREIGN KEY ("Username", "ApplicationName") REFERENCES "Users"("Username", "ApplicationName") ON DELETE CASCADE;


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-06-21 14:26:47

--
-- PostgreSQL database dump complete
--

