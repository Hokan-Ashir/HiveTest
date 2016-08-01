select data.uniquecarrier as Carrier, sum(data.Cancelled) as Cancelled_Flights,
collect_set(airports.city) as Cities
from data
join airports on (data.Origin = airports.iata)
where data.Cancelled = 1
group by data.uniquecarrier
order by Cancelled_Flights desc;