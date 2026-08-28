create table united_nations.Geographic_location (
Country_name varchar(37) primary key,
Sub_region varchar(25),
Region varchar(32),
Land_area numeric(10, 2)
);


insert into united_nations.Geographic_location (Country_name, Sub_region, Region, Land_area)
select 
	Country_name,
    Sub_region,
    Region,
    avg(Land_area)
from 
	united_nations.access_to_basic_services
group by
	Country_name, 
    Sub_region,
    Region;
    
create table united_nations.Basic_Services (
	Country_name varchar(37),
	Time_period integer,
	Pct_managed_drinking_water_services numeric(5,2),
	Pct_managed_sanitation_services numeric(5, 2),
	primary key (Country_name, Time_period),
	foreign key (Country_name) references Geographic_location (Country_name)
);

insert into Basic_Services (Country_name, Time_period, Pct_managed_drinking_water_services, Pct_managed_sanitation_services)
select 
	Country_name,
    Time_period,
    Pct_managed_drinking_water_services,
    Pct_managed_sanitation_services
from 
	united_nations.access_to_basic_services;
    

create table united_nations.Economic_indicators (
	Country_name varchar(37),
	Time_period integer,
    Est_gdp_in_billions numeric(10, 2),
	Est_population_in_millions numeric(11,2),
    Pct_unemployment numeric(5, 2),
	primary key (Country_name, Time_period),
	foreign key (Country_name) references Geographic_location (Country_name)
);


insert into  Economic_indicators (Country_name, Time_period, Est_gdp_in_billions, Est_population_in_millions, Pct_unemployment)
select 
	Country_name,
    Time_period,
    Est_gdp_in_billions,
    Est_population_in_millions,
    Pct_unemployment
from 
	united_nations.access_to_basic_services;
    
    
