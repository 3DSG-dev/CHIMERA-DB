--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.13
-- Dumped by pg_dump version 9.6.13

-- Started on 2021-05-05 02:32:46 CEST

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
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 31472)
-- Name: AccessList; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."AccessList" (
    "Database" character varying(255) NOT NULL,
    "User" character varying(255) NOT NULL
);


ALTER TABLE "public"."AccessList" OWNER TO "postgres";

--
-- TOC entry 2148 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE "AccessList"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "public"."AccessList" IS 'Specifica l''accesso degli utenti ai diversi database';


--
-- TOC entry 2149 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN "AccessList"."Database"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."AccessList"."Database" IS 'Nome dell''origine di dati
';


--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN "AccessList"."User"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."AccessList"."User" IS 'Utente';


--
-- TOC entry 186 (class 1259 OID 31478)
-- Name: DatabaseList; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."DatabaseList" (
    "Name" character varying(255) NOT NULL,
    "Enabled" boolean DEFAULT true NOT NULL,
    "DbName" character varying(255) NOT NULL
);


ALTER TABLE "public"."DatabaseList" OWNER TO "postgres";

--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN "DatabaseList"."Name"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."DatabaseList"."Name" IS 'Nome dell''origine di dati';


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN "DatabaseList"."Enabled"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."DatabaseList"."Enabled" IS 'Indica se il DB è abilitato';


--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 186
-- Name: COLUMN "DatabaseList"."DbName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."DatabaseList"."DbName" IS 'Titolo del db
';


--
-- TOC entry 187 (class 1259 OID 31485)
-- Name: Utenti; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."Utenti" (
    "User" character varying(255) NOT NULL,
    "Password" character varying NOT NULL,
    "FullName" character varying(255) NOT NULL,
    "Gruppi" character varying NOT NULL
);


ALTER TABLE "public"."Utenti" OWNER TO "postgres";

--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE "Utenti"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "public"."Utenti" IS 'Tabella accessi e permessi';


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN "Utenti"."User"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."Utenti"."User" IS 'Nome utente';


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN "Utenti"."Password"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."Utenti"."Password" IS 'Password dell''account';


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN "Utenti"."FullName"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."Utenti"."FullName" IS 'Nome e cognome reale';


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN "Utenti"."Gruppi"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "public"."Utenti"."Gruppi" IS 'gruppi, separati da virgole e senza spazi';


--
-- TOC entry 2016 (class 2606 OID 31492)
-- Name: AccessList AccessList-primaryKey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."AccessList"
    ADD CONSTRAINT "AccessList-primaryKey" PRIMARY KEY ("Database", "User");


--
-- TOC entry 2018 (class 2606 OID 31494)
-- Name: DatabaseList DatabaseList-primarykey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."DatabaseList"
    ADD CONSTRAINT "DatabaseList-primarykey" PRIMARY KEY ("Name");


--
-- TOC entry 2020 (class 2606 OID 31496)
-- Name: Utenti Utenti-key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."Utenti"
    ADD CONSTRAINT "Utenti-key" PRIMARY KEY ("User");


--
-- TOC entry 2021 (class 2606 OID 31497)
-- Name: AccessList AccessList-refDatabaseList; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."AccessList"
    ADD CONSTRAINT "AccessList-refDatabaseList" FOREIGN KEY ("Database") REFERENCES "public"."DatabaseList"("Name") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2022 (class 2606 OID 31502)
-- Name: AccessList AccessList-refUtenti; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."AccessList"
    ADD CONSTRAINT "AccessList-refUtenti" FOREIGN KEY ("User") REFERENCES "public"."Utenti"("User") ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2021-05-05 02:32:46 CEST

--
-- PostgreSQL database dump complete
--

