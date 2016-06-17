----------- Adding static DMDII member related data ------------------
insert into dmdii_area_of_expertise (id, name, description, link)
	values (1, 'Computers', 'expertise in computers', 'www.computers.com');
insert into dmdii_area_of_expertise (id, name, description, link)
	values (2, 'Manufacturing', 'expertise in manufacturing', 'www.manufacturing.com');

insert into dmdii_contact_type (id, type)
	values (1, 'primary point of contact');
insert into dmdii_contact_type (id, type)
	values (2, 'secondary point of contact');
insert into dmdii_contact_type (id, type)
	values (3, 'executive lead');

insert into dmdii_rnd_focus (id, name, description)
	values (1, 'Jet engines', 'Jet engines description');
insert into dmdii_rnd_focus (id, name, description)
	values (2, 'Software', 'Software description');

insert into dmdii_skill (id, tag_name, tag_link)
	values (1, 'tag1', 'taglink1');
insert into dmdii_skill (id, tag_name, tag_link)
	values (2, 'tag2', 'taglink2');


--------- Associating dmdii members and their additional data ----------------
insert into dmdii_member_area_of_expertise (organization_dmdii_member_id, dmdii_area_of_expertise_id)
	values (1,1);
insert into dmdii_member_area_of_expertise (organization_dmdii_member_id, dmdii_area_of_expertise_id)
	values (1,2);
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
-- R&D focus
insert into dmdii_member_rnd_focus (organization_dmdii_member_id, dmdii_rnd_focus_id)
	values (1, 1);
insert into dmdii_member_rnd_focus (organization_dmdii_member_id, dmdii_rnd_focus_id)
	values (1, 2);
-- Skills
insert into dmdii_member_skill (organization_dmdii_member_id, dmdii_skill_id)
	values (1, 1);
insert into dmdii_member_skill (organization_dmdii_member_id, dmdii_skill_id)
	values (1, 2);

