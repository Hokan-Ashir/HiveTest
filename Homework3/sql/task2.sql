add jar hdfs://sandbox.hortonworks.com:8020/user/maria_dev/Homework3-1.0-SNAPSHOT.jar;

create temporary function extract_user_agent as 'ru.hokan.ExtractUserAgentData';

drop table if exists tempExtracted;
create table tempExtracted as
select count(extracted) as cnt, extracted as BrowserName, extraction.City as city
from (
  select extract_user_agent(UserAgent)["Browser"] as extracted, City from data
  ) as extraction
 group by city, extracted
order by cnt desc, city;

drop table if exists cityToValue;
create table cityToValue as
select max(cnt) as value, city from tempExtracted
group by city;

select result.value, result.BrowserName, cities.name from
(select cityToValue.value, cityToValue.city, tempExtracted.BrowserName
from
cityToValue
join
tempExtracted
on (cityToValue.value = tempExtracted.cnt
   and cityToValue.city = tempExtracted.city)) as result
join
cities
on result.city = cities.code;