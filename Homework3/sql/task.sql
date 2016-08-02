-- beeline -u jdbc:hive2://sandbox.hortonworks.com:10000/homework3 -n hive -p hive -f /opt/task.sql

add jar hdfs://sandbox.hortonworks.com:8020/user/maria_dev/Homework3-1.0-SNAPSHOT.jar;

create temporary function extract_user_agent as 'ru.hokan.ExtractUserAgentData';

drop table if exists tempExtracted;
create table tempExtracted as
select count(extracted) as cnt, extracted as OSName, extraction.City as city
from (
  select extract_user_agent(UserAgent)["OS name"] as extracted, City from data
  ) as extraction
 group by city, extracted
order by cnt desc, city;

drop table if exists cityToValue;
create table cityToValue as
select max(cnt) as value, city from tempExtracted
group by city;

drop table if exists tempOSName;
create table tempOSName as
select result.value, result.OSName as OSName, cities.name as city from
(select cityToValue.value, cityToValue.city, tempExtracted.OSName
from
cityToValue
join
tempExtracted
on (cityToValue.value = tempExtracted.cnt and cityToValue.city = tempExtracted.city)) as result
join
cities
on result.city = cities.code;

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

drop table if exists tempBrowserName;
create table tempBrowserName as
select result.value, result.BrowserName as BrowserName, cities.name as city from
(select cityToValue.value, cityToValue.city, tempExtracted.BrowserName
from
cityToValue
join
tempExtracted
on (cityToValue.value = tempExtracted.cnt and cityToValue.city = tempExtracted.city)) as result
join
cities
on result.city = cities.code;

drop table if exists tempExtracted;
create table tempExtracted as
select count(extracted) as cnt, extracted as DeviceTypeName, extraction.City as city
from (
  select extract_user_agent(UserAgent)["DeviceType"] as extracted, City from data
  ) as extraction
 group by city, extracted
order by cnt desc, city;

drop table if exists cityToValue;
create table cityToValue as
select max(cnt) as value, city from tempExtracted
group by city;

drop table if exists tempDeviceTypeName;
create table tempDeviceTypeName as
select result.value, result.DeviceTypeName as DeviceTypeName, cities.name as city from
(select cityToValue.value, cityToValue.city, tempExtracted.DeviceTypeName
from
cityToValue
join
tempExtracted
on (cityToValue.value = tempExtracted.cnt and cityToValue.city = tempExtracted.city)) as result
join
cities
on result.city = cities.code;

select tempDeviceTypeName.DeviceTypeName, tempBrowserName.BrowserName, tempOSName.OSName, tempDeviceTypeName.city from
tempDeviceTypeName
join
tempBrowserName
on tempDeviceTypeName.city = tempBrowserName.city
join
tempOSName
on
tempOSName.city =  tempBrowserName.city;