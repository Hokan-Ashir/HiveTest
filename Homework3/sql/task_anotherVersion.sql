add jar hdfs://sandbox.hortonworks.com:8020/user/maria_dev/Homework3-1.0-SNAPSHOT.jar;

create temporary function extract_user_agent as 'ru.hokan.ExtractUserAgentData';

drop table osExtracted;

create table osExtracted as
select result.city,
collect_set(concat(result.extracted, concat(concat(' (', result.cnt), ')'))) as os
from (
select count(extract_user_agent(UserAgent)["OS name"]) as cnt,
extract_user_agent(UserAgent)["OS name"] as extracted,
City from data
group by city, extract_user_agent(UserAgent)["OS name"]
  order by cnt desc
  ) as result
group by result.city;

drop table browserExtracted;

create table browserExtracted as
select result.city,
collect_set(concat(result.extracted, concat(concat(' (', result.cnt), ')'))) as browser
from (
select count(extract_user_agent(UserAgent)["Browser"]) as cnt,
extract_user_agent(UserAgent)["Browser"] as extracted,
City from data
group by city, extract_user_agent(UserAgent)["Browser"]
  order by cnt desc
  ) as result
group by result.city;

drop table deviceTypeExtracted;

create table deviceTypeExtracted as
select result.city,
collect_set(concat(result.extracted, concat(concat(' (', result.cnt), ')'))) as deviceType
from (
select count(extract_user_agent(UserAgent)["DeviceType"]) as cnt,
extract_user_agent(UserAgent)["DeviceType"] as extracted,
City from data
group by city, extract_user_agent(UserAgent)["DeviceType"]
  order by cnt desc
  ) as result
group by result.city;

select cities.name, osExtracted.os, browserExtracted.browser, deviceTypeExtracted.deviceType
from osExtracted, browserExtracted, deviceTypeExtracted, cities
where osExtracted.city = browserExtracted.city
and browserExtracted.city = deviceTypeExtracted.city
and deviceTypeExtracted.city = cities.code;