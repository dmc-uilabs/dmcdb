--------- Associating dmdii members and their additional data ----------------
insert into dmdii_member_area_of_expertise (organization_dmdii_member_id, dmdii_area_of_expertise_id)
	values (1,1);
insert into dmdii_member_area_of_expertise (organization_dmdii_member_id, dmdii_area_of_expertise_id)
	values (1,2);
insert into dmdii_member_desired_area_of_expertise (organization_dmdii_member_id, dmdii_area_of_expertise_id)
	values (1,15);
insert into dmdii_member_desired_area_of_expertise (organization_dmdii_member_id, dmdii_area_of_expertise_id)
	values (1,29);
-- awards
insert into dmdii_member_award (organization_dmdii_member_id, name, description, link)
	values (1, 'Award 1', 'Award 1 description', 'link-to-award');
insert into dmdii_member_award (organization_dmdii_member_id, name, description, link)
	values (1, 'Award 1', 'Award 1 description', 'link-to-award');
-- contacts
insert into dmdii_member_contact (organization_dmdii_member_id, dmdii_contact_type_id, first_name, last_name, email)
	values (1, 1, 'Steve', 'Stevens', 'sstevens@email.com');
insert into dmdii_member_contact (organization_dmdii_member_id, dmdii_contact_type_id, first_name, last_name, email)
	values (1, 2, 'William', 'Williams', 'wwilliams@email.com');
-- customers
insert into dmdii_member_customer (organization_dmdii_member_id, name, link)
	values (1, 'Google', 'www.google.com');
insert into dmdii_member_customer (organization_dmdii_member_id, name, link)
	values (1, 'Microsoft', 'www.microsoft.com');
-- finance
insert into dmdii_member_finance (organization_dmdii_member_id, name, asset_url)
	values (1, 'finance asset 1', 'asset-url-1');
insert into dmdii_member_finance (organization_dmdii_member_id, name, asset_url)
	values (1, 'finance asset 2', 'asset-url-2');
-- institute involvement
insert into dmdii_member_institute_involvement (organization_dmdii_member_id, static_line_item, date)
	values (1, 'involvement 1', '02/12/2016');
insert into dmdii_member_institute_involvement (organization_dmdii_member_id, static_line_item, date)
	values (1, 'involvement 2', '04/12/2016');
-- Skills
insert into dmdii_member_skill (organization_dmdii_member_id, dmdii_skill_id)
	values (1, 1);
insert into dmdii_member_skill (organization_dmdii_member_id, dmdii_skill_id)
	values (1, 2);

-- Events
insert into dmdii_member_events (event_title, event_description, event_location, event_date)
	values ('Event 1', 'This is the description of event 1', '1161 Oak Valley Drive, Ann Arbor, MI', '2016-07-25');
insert into dmdii_member_events (event_title, event_description, event_location, event_date)
	values ('Event 2', 'This is the description of event 2', '1161 Oak Valley Drive, Ann Arbor, MI', '2016-08-30');
insert into dmdii_member_events (event_title, event_description, event_location, event_date)
	values ('Event 3', 'This is the description of event 3', '1161 Oak Valley Drive, Ann Arbor, MI', '2016-11-13');

-- News
insert into dmdii_member_news (news_title, news_content, date_posted)
	values ('News 1', 'This is the body of news 1', '2016-05-24');
insert into dmdii_member_news (news_title, news_content, date_posted)
	values ('News 2', 'This is the body of news 2', '2016-05-28');
insert into dmdii_member_news (news_title, news_content, date_posted)
	values ('News 3', 'This is the body of news 3', '2016-06-12');
