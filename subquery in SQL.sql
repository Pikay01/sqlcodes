select
	Country_name,
    round(Land_area /  (select
							sum(Land_area)
						from
							geographic_location
						where
							Sub_region = g.Sub_region) * 100) as pct_regional_land

from
	Geographic_location as g;
    
    
select
	geoloc.Country_name,
    geoloc.Land_area,
    geoloc.Sub_region,
    (geoloc.Land_area / land_per_region.TotalLandArea) * 100 as PctOfRegionLand
from
	geographic_location as geoloc
join 
	(select
		Sub_region,
		sum(Land_area) as TotalLandArea
	from
		geographic_location
	group by
		Sub_region) as land_per_region;

select
	Country_name,
    Pct_unemployment,
    avg(Est_gdp_in_billions) as Avg_GDP,
    avg(Est_population_in_millions) as Avg_Population
from
	(select
		Country_name,
        Pct_unemployment,
		Est_gdp_in_billions,
		Est_population_in_millions
	from
		economic_indicators
	where
		Pct_unemployment > 5
		and Time_period = 2020) as FilteredCountries
group by
	Country_name;
    

select
	econ.Country_name,
    econ.Time_period,
    econ.Est_gdp_in_billions,
    service.Pct_managed_drinking_water_services
    
from
	economic_indicators as econ
inner join
	basic_services as service
on
	econ.Country_name = service.Country_name
    and econ.Time_period = service.Time_period
where
	econ.Time_period = 2020
    and service.Pct_managed_drinking_water_services < 90
    and econ.Est_gdp_in_billions > (select
										avg(Est_gdp_in_billions)
									from
										economic_indicators
									where 
										Time_period = 2020);