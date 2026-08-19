
-- saving the query into a table
create table
	Country_list(
		Country_name varchar(225)
	);
insert into Country_list(
	Country_name		
)

select distinct
	Country_name
from
	access_to_basic_services;
    
-- check for country that has the lowest pct of people with access to managed drinking water services

select 
	Country_name,
    Time_period,
    Pct_managed_drinking_water_services as pct_access_water
from
	access_to_basic_services
where
	Time_period = 2020;