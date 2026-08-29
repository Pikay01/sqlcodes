select
	*

from
	united_nations.geographic_location as geo
left join
	united_nations.economic_indicators as econ
    on geo.Country_name = econ.Country_name
left join
	united_nations.basic_services as svc
    on geo.Country_name = svc.Country_name
    and econ.Time_period = svc.Time_period;