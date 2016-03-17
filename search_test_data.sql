--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gforge
--

COPY users (user_id, user_name, email, user_pw, realname, status, shell, unix_pw, unix_status, unix_uid, unix_box, add_date, confirm_hash, mail_siteupdates, mail_va, authorized_keys, email_new, people_view_skills, people_resume, timezone, language, block_ratings, jabber_address, jabber_only, address, phone, fax, title, firstname, lastname, address2, ccode, theme_id, type_id, unix_gid, gateway_id, about_me, export_control, image, last_activity) FROM stdin;
300	acmeUser	\N		password	acmeUser	A	/bin/bash		N	0	shell	0	\N	0	0	\N	\N	0		GMT	1	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	US	\N	1	0	0	\N	f	\N	\N
\.

--
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: gforge
--

COPY organization (organization_id, accountid, name, location, description, division, industry, naics_code, rd_focus, customers, awards, tech_expertise, tools_software_equip_mach, post_collaboration, collaboration_interest, past_projects, upcoming_project_interests, addressid, email, phone, website, social_media_linkedin, social_media_twitter, social_medial_inthenews, perfered_comm_method, category_tier, date_joining, reason_joining, feature_image, logo_image, follow, favorates_count, is_owner, owner) FROM stdin;
1	1	GE Global Research	Niskayuna	GE Global Research is the research and development division of General Electric	\N	R&S	\N	\N	\N	\N	jet engines, software	predix	\N	\N	\N	\N	100	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	100	\N	\N	\N	\N	testUser
75	1075	ACME Incorporated	USA	ACME Machines and Equipment	ACME	industry	\N	\N	ACME customers	ACME awards	machines	electronics, java	\N	\N	\N	\N	1075	\N	\N	\N	\N	\N	\N	\N	30	\N	\N	1075	\N	\N	\N	false	acmeUser
\.

--
-- Data for Name: organization_user; Type: TABLE DATA; Schema: public; Owner: gforge
--
COPY organization_user (id, user_id, organization_id) FROM stdin;
2	300	75
3	550	1
\.

--
-- Data for Name: common_address; Type: TABLE DATA; Schema: public; Owner: gforge
--
COPY common_address (id, street_address1, street_address2, city, state, country, zip) FROM stdin;
1075	1000 Main Street	\N	New York	NY	USA	10001
100	1 Research Circle	\N	Niskayuna	NY	USA	12065
\.



--
-- Data for Name: common_image; Type: TABLE DATA; Schema: public; Owner: gforge
--
COPY common_image (id, caption, thumbnail, large_image) FROM stdin;
1075	ACME 	ACME	\N
100	GE Global Research	GE Global Research	\N
\.

