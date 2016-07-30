--TODO data.Origin is a number, "should be" a IATA of an airport from airports table, but those table have only strings
--TODO see same TODO-action in HW1
select data.uniquecarrier as Carrier, sum(data.Cancelled) as Cancelled_Flights,
collect_set(airports.city) as Cities
from data
join airports on (data.Dest = airports.iata)
where data.Cancelled = 1
group by data.uniquecarrier
order by Cancelled_Flights desc;