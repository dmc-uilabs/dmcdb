-- insert into organization_dmdii_type_category (id, category) 
-- 	values (1, 'Industry');
-- insert into organization_dmdii_type_category (id, category) 
-- 	values (2, 'Academic');
-- insert into organization_dmdii_type_category (id, category) 
-- 	values (3, 'Government');


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
select * from common_address;

-- insert into common_address (id, street_address1, street_address2, city, state, country, zip)
-- 	values (1, '123 street st.', 'Apt 20', 'Ann Arbor', 'MI', 'USA', '48108');
-- insert into organization (organization_id, name, description, addressid, email, phone, website, date_joining, reason_joining, logo_image)
-- 	values (14, 'Test Organiztion', 'this is a test organization', 1, 'test@email.com', '2944567834', 'www.google.com', '05/04/2016', 'reason for joining here', 'link-to-company-logo.png');
-- insert into organization_dmdii_type (id, tier, organization_dmdii_type_category_id)
-- 	values (1, 1, 1);
-- insert into organization_dmdii_member (id, organization_id, dmdii_type_id) 
-- 	values (1, 14, 1);
-- areas of expertise
insert into dmdii_member_area_of_expertise (id, organization_dmdii_member_id, dmdii_area_of_expertise_id)
	values (1,1,1);
insert into dmdii_member_area_of_expertise (id, organization_dmdii_member_id, dmdii_area_of_expertise_id)
	values (2,1,2);
-- awards
insert into dmdii_member_award (id, organization_dmdii_member_id, name, description, link)
	values (1, 1, 'Award 1', 'Award 1 description', 'link-to-award');
insert into dmdii_member_award (id, organization_dmdii_member_id, name, description, link)
	values (2, 1, 'Award 1', 'Award 1 description', 'link-to-award');
-- contacts
insert into dmdii_member_contact (id, organization_dmdii_member_id, dmdii_contact_type_id, first_name, last_name, email)
	values (1, 1, 1, 'Steve', 'Stevens', 'sstevens@email.com');
insert into dmdii_member_contact (id, organization_dmdii_member_id, dmdii_contact_type_id, first_name, last_name, email)
	values (2, 1, 2, 'William', 'Williams', 'wwilliams@email.com');
-- customers
insert into dmdii_member_customer (id, organization_dmdii_member_id, name, link)
	values (1, 1, 'Google', 'www.google.com');
insert into dmdii_member_customer (id, organization_dmdii_member_id, name, link)
	values (2, 1, 'Microsoft', 'www.microsoft.com');
-- finance
insert into dmdii_member_finance (id, organization_dmdii_member_id, name, asset_url)
	values (1, 1, 'finance asset 1', 'asset-url-1');
insert into dmdii_member_finance (id, organization_dmdii_member_id, name, asset_url)
	values (2, 1, 'finance asset 2', 'asset-url-2');
-- institute involvement
insert into dmdii_member_institute_involvement (id, organization_dmdii_member_id, static_line_item, date, user_id)
	values (1, 1, 'involvement 1', '02/12/2016', 1);
insert into dmdii_member_institute_involvement (id, organization_dmdii_member_id, static_line_item, date, user_id)
	values (2, 1, 'involvement 2', '04/12/2016', 1);
-- R&D focus
insert into dmdii_member_rnd_focus (id, organization_dmdii_member_id, dmdii_rnd_focus_id)
	values (1, 1, 1);
insert into dmdii_member_rnd_focus (id, organization_dmdii_member_id, dmdii_rnd_focus_id)
	values (2, 1, 2);
-- Skills
insert into dmdii_member_skill (id, organization_dmdii_member_id, dmdii_skill_id)
	values (1, 1, 1);
insert into dmdii_member_skill (id, organization_dmdii_member_id, dmdii_skill_id)
	values (2, 1, 2);



-- insert into organization (organization_id, name, description, addressid, email, phone, website, date_joining, reason_joining, logo_image)
-- 	values (2, 'Test Organiztion', 'this is a test organization', 2, 'test@email.com', '2944567834', 'www.google.com', '05/04/2016', 'reason for joining here', 'link-to-company-logo.png');
-- insert into organization_dmdii_type (id, tier, organization_dmdii_type_category_id)
-- 	values (2, 1, 1);
-- insert into organization_dmdii_member (id, organization_id, dmdii_type_id) 
-- 	values (2, 2, 2);









-- insert into organization (organization_id, name, description, addressid, email, phone, website, date_joining, reason_joining, logo_image)
-- 	values (3, 'Test Organiztion', 'this is a test organization', 3, 'test@email.com', '2944567834', 'www.google.com', '05/04/2016', 'reason for joining here', 'link-to-company-logo.png');
