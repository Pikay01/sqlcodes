use united_nations;

select
	distinct Country_name,
    Time_period,
    Est_population_in_millions,
    concat(
		substring(upper(ifnull(Country_name,'UNKNOWN')),1,4),
		substring(ifnull(Time_period,'UNKNOWN'),1,4),
		substring(ifnull(Est_population_in_millions,'UNKNOWN'),-7)
    ) as Country_id
from
	united_nations.access_to_basic_services;
    
    
select
	case
		when Country_name in ('Angola', 'Botswana', 'Comoros', 'Democratic Republic of Congo', 'Eswatini', 
		'Lesotho', 'Madagascar', 'Malawi', 'Mauritius', 'Mozambique', 'Namibia', 'Seychelles', 'Sounth Africa',
		'united Republic Tanzania', 'Zambia', 'Zimbabwe')
		then 'SADC'
        when Country_name in ('Algeria', 'Lybia', 'Mauritania', 'Morocco', 'Tunisia')
        then 'UMA'
        when Country_name in ('Congo', 'Burkina Faso', 'Cabo Verde', "Cote d'Ivoire", 'Gambia', 'Ghana', 'Guinea',
        'Guinea-Bissau', 'Liberia', 'Mali', 'Niger', 'Nigeria', 'Senegal', 'Sierra Leone', 'Togo')
        then 'ECOWAS'
		else 'Not Classified'
	end as Regional_economic_community,
    min(Pct_managed_drinking_water_services) as min_pct_managed_drinking_water_services,
    avg(Pct_managed_drinking_water_services) as avg_pct_managed_drinking_water_services,
    max(Pct_managed_drinking_water_services) as max_pct_managed_drinking_water_services
from
	united_nations.access_to_basic_services
where
	Region like '%Africa%'
group by
		case
			when Country_name in ('Angola', 'Botswana', 'Comoros', 'Democratic Republic of Congo', 'Eswatini', 
			'Lesotho', 'Madagascar', 'Malawi', 'Mauritius', 'Mozambique', 'Namibia', 'Seychelles', 'Sounth Africa',
			'united Republic Tanzania', 'Zambia', 'Zimbabwe')
			then 'SADC'
			when Country_name in ('Algeria', 'Lybia', 'Mauritania', 'Morocco', 'Tunisia')
			then 'UMA'
			when Country_name in ('Congo', 'Burkina Faso', 'Cabo Verde', "Cote d'Ivoire", 'Gambia', 'Ghana', 'Guinea',
			'Guinea-Bissau', 'Liberia', 'Mali', 'Niger', 'Nigeria', 'Senegal', 'Sierra Leone', 'Togo')
			then 'ECOWAS'
			else 'Not Classified'
		end;
        
select
	Region,
    Pct_unemployment,
    if( (Region = 'Central and Southern Asia') and (Pct_unemployment is null), 19.59, 
        if( (Region = 'Easthern and South-Eastern Asia') and (Pct_unemployment is null), 22.64, 
			if( (Region = 'Europe and Northern America') and (Pct_unemployment is null), 24.43, 
				if( (Region = 'Latin America and the Caribbean') and (Pct_unemployment is null), 24.23,
					if( (Region = 'Northern Africa and western Asia') and (Pct_unemployment is null), 17.84,
						if( (Region = 'Oceania') and (Pct_unemployment is null), 4.90,
							if( (Region = 'Sub-Saharan Africa') and (Pct_unemployment is null), 33.65, 
                            Pct_unemployment)
						)
					)
				)
			)
		)
	) as New_pct_unemployment

from
	united_nations.access_to_basic_services;
    
select distinct
	Country_name,
    Time_period,
    (Est_gdp_in_billions / Est_population_in_millions) * 1000 as GDP_per_capita,
    (Est_gdp_in_billions / Est_population_in_millions) * (1000 / 365.25) as GDP_per_capita_per_day,
    if(Time_period < 2017, 1.90, 2.50) as Poverty_line,
    case
		when ((Est_gdp_in_billions / Est_population_in_millions) * (1000 / 365.25)) < if(Time_period < 2017, 1.90, 2.50)
        then 'Low'
        when ((Est_gdp_in_billions / Est_population_in_millions) * (1000 / 365.25)) > if(Time_period < 2017, 1.90, 2.50)
        then 'High'
        else 'Medium'
	end as Income_group
from
	united_nations.access_to_basic_services
where
	Est_gdp_in_billions is not null;
    
    