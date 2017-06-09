--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

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

--
-- Name: feeds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE feeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;


ALTER TABLE feeds_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: feeds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE feeds (
    id integer DEFAULT nextval('feeds_id_seq'::regclass) NOT NULL,
    feed_title character varying(300),
    feed_link character varying(300),
    feed_description character varying(2000)
);


ALTER TABLE feeds OWNER TO postgres;

--
-- Data for Name: feeds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY feeds (id, feed_title, feed_link, feed_description) FROM stdin;
1	Will you buy the OnePlus 5 given that it looks like this?	http://www.androidauthority.com/will-oneplus-5-design-stop-buyers-778734/	The look of the new OnePlus 5 has been confirmed, but is it's design similarities to other smartphones going to put buyers of their purchase?
2	The Adonit Switch is the ultimate designer’s tool	http://www.androidauthority.com/adonit-switch-stylus-pen-776255/	If you use a stylus but also scribble notes the old -fashioned way, the Adonit Switch 2-in-1 Stylus &#038; Pen is the perfect stylish addition to your desk.
3	A monthy after the US launch, Sony Xperia L1 arrives to Europe	http://www.androidauthority.com/sony-xperia-l1-specs-price-release-date-771379/	The budget-priced Sony Xperia L1 smartphone that was first announced in March is now on sale in the US on Amazon and Best Buy for $199.99.
4	Virtual Everything – the problem with smart assistants	http://www.androidauthority.com/smart-assistants-problems-issues-776340/	Smart assistants are appearing everywhere this year, but should we be so quick to embrace these new hardware and software products?
5	New SuperSU beta supports Android O on Nexus 5X and 6P, Pixel XL	http://www.androidauthority.com/supersu-android-o-778764/	The superuser management tool SuperSU now works with the third Android O developer preview on the Nexus 5X, Nexus 6P and Pixel XL.
6	Hit mobile title Guns of Boom has been downloaded 5 million times since May 18	http://www.androidauthority.com/guns-of-boom-android-778766/	The free-to-play, Team Fortress 2-like shooter has enjoyed significant success over the past three weeks.
7	ZTE’s Max XL sets its sights on Sprint after “successful launch” on Boost	http://www.androidauthority.com/zte-max-xl-sprint-778594/	ZTE is prepping Sprint customers for the summer months ahead with its launch of the Max XL, Warp Connect hotspot, and Sprint Phone Connect 4.
8	Chrome Beta 60 offers new search widget, context menu, and more	http://www.androidauthority.com/chrome-beta-60-released-new-search-widget-context-menu-778735/	Google has released the Chrome Beta 60 for Android, which features a few minor changes, and one much-appreciated new addition.
9	Android O Developer Preview 3 adds useful-but-annoying notification for background apps	http://www.androidauthority.com/android-o-developer-preview-3-useful-annoying-notification-apps-background-778701/	The notification lets you know which background apps are running on your device...but it doesn't go away.
10	This is when the Pixel and Nexus phones will stop receiving phone and online support	http://www.androidauthority.com/pixel-nexus-online-telephone-support-778730/	Google has updated its Android versions help page to outline when it will stop supporting its devices.
\.


--
-- Name: feeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('feeds_id_seq', 10, true);


--
-- Name: feeds feeds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY feeds
    ADD CONSTRAINT feeds_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

