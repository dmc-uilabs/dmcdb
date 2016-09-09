select * from organization_dmdii_member dmdii, organization_user orgu, users 
where 
users.user_name = 'joeengineer'
and users.user_id=orgu.user_id 
and orgu.organization_id = dmdii.organization_id 
and dmdii.expire_date >= now() 