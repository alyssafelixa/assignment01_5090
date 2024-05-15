-- Active: 1708533345757@@127.0.0.1@5432@alyssafelix
CREATE SCHEMA indego;

CREATE TABLE indego.trips_2021_q3(
trip_id TEXT,
duration INTEGER,
start_time TIMESTAMP,
end_time TIMESTAMP,
start_station TEXT,
start_lat FLOAT,
start_lon FLOAT,
end_station TEXT,
end_lat FLOAT,
end_lon FLOAT,
bike_id TEXT,
plan_duration INTEGER,
trip_route_category TEXT,
passholder_type TEXT,
bike_type TEXT
);

copy indego.trips_2021_q3
from '/Users/alyssafelix/Documents/GitHub/assignment01/indego-trips-2021-q3/indego-trips-2021-q3.csv'
with (format csv, header true); 

CREATE TABLE indego.trips_2022_q3(
trip_id TEXT,
duration INTEGER,
start_time TIMESTAMP,
end_time TIMESTAMP,
start_station TEXT,
start_lat FLOAT,
start_lon FLOAT,
end_station TEXT,
end_lat FLOAT,
end_lon FLOAT,
bike_id TEXT,
plan_duration INTEGER,
trip_route_category TEXT,
passholder_type TEXT,
bike_type TEXT
);

copy indego.trips_2022_q3
from '/Users/alyssafelix/Documents/GitHub/assignment01/indego-trips-2022-q3.csv'
with (format csv, header true);

CREATE TABLE indego.station_statuses (
    id SERIAL PRIMARY KEY,
    name TEXT,
    geog GEOGRAPHY(Point, 4326)
);

ogr2ogr -f "PostgreSQL" -nln "stations" -lco "OVERWRITE=yes" -lco "GEOM_TYPE=geography" -lco "GEOMETRY_NAME=the_geog" PG:"host=localhost port=5432 dbname=alyssafelix user=postgres password=ilovecoffee" "/Users/alyssafelix/Documents/GitHub/assignment01/stationstatuses.geoJSON"



