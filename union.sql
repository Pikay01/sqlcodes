select
	loc.Country_name,
    eco.Time_period,
    ifnull(eco.Pct_unemployment, 19.5) as pct_unemployment_inputed
from
	united_nations.geographic_location as loc
left join
	united_nations.economic_indicators as eco
    on eco.Country_name = loc.Country_name
where
	Region like '%Central and Southern Asia%'

union
select
	loc.Country_name,
    eco.Time_period,
    ifnull(eco.Pct_unemployment, 19.5) as pct_unemployment_inputed
from
	united_nations.geographic_location as loc
left join
	united_nations.economic_indicators as eco
    on eco.Country_name = loc.Country_name
where
	Region like '%Easthern and South-Eastern Asia%'

union

select
	loc.Country_name,
    eco.Time_period,
    ifnull(eco.Pct_unemployment, 19.5) as pct_unemployment_inputed
from
	united_nations.geographic_location as loc
left join
	united_nations.economic_indicators as eco
    on eco.Country_name = loc.Country_name
where
	Region like '%Europe and Northern America%'

union

select
	loc.Country_name,
    eco.Time_period,
    ifnull(eco.Pct_unemployment, 19.5) as pct_unemployment_inputed
from
	united_nations.geographic_location as loc
left join
	united_nations.economic_indicators as eco
    on eco.Country_name = loc.Country_name
where
	Region like '%Latin America and the Caribbean%'
    
union
select
	loc.Country_name,
    eco.Time_period,
    ifnull(eco.Pct_unemployment, 19.5) as pct_unemployment_inputed
from
	united_nations.geographic_location as loc
left join
	united_nations.economic_indicators as eco
    on eco.Country_name = loc.Country_name
where
	Region like '%Northern Africa and western Asia%'
    
union
select
	loc.Country_name,
    eco.Time_period,
    ifnull(eco.Pct_unemployment, 19.5) as pct_unemployment_inputed
from
	united_nations.geographic_location as loc
left join
	united_nations.economic_indicators as eco
    on eco.Country_name = loc.Country_name
where
	Region like '%Oceania%'

union
select
	loc.Country_name,
    eco.Time_period,
    ifnull(eco.Pct_unemployment, 19.5) as pct_unemployment_inputed
from
	united_nations.geographic_location as loc
left join
	united_nations.economic_indicators as eco
    on eco.Country_name = loc.Country_name
where
	Region like '%Sub-Saharan Africa%';
