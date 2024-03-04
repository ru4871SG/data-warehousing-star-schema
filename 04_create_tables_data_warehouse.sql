-- =======================================
-- CREATE TABLES FOR DATA WAREHOUSE
-- =======================================

CREATE TABLE IF NOT EXISTS public."DimDate"
(
    "Dateid" integer NOT NULL,
    date date,
    "Year" integer,
    "Quarter" integer,
    "QuarterName" character(2),
    "Month" integer,
    "Monthname" character(9),
    "Day" integer,
    "Weekday" integer,
    "WeekdayName" character(9),
    CONSTRAINT "DimDate_pkey" PRIMARY KEY ("Dateid")
);

CREATE TABLE IF NOT EXISTS public."DimStation"
(
    "Stationid" integer NOT NULL,
    "City" character(14),
    CONSTRAINT "DimStation_pkey" PRIMARY KEY ("Stationid")
);

CREATE TABLE IF NOT EXISTS public."DimTruck"
(
    "Truckid" integer NOT NULL,
    "TruckType" character(6),
    CONSTRAINT "DimTruck_pkey" PRIMARY KEY ("Truckid")
);

CREATE TABLE IF NOT EXISTS public."FactTrips"
(
    "Tripid" integer NOT NULL,
    "Dateid" integer,
    "Stationid" integer,
    "Truckid" integer,
    "Wastecollected" numeric(5, 2),
    CONSTRAINT "FactTrips_pkey" PRIMARY KEY ("Tripid")
);


ALTER TABLE IF EXISTS public."FactTrips"
    ADD FOREIGN KEY ("Dateid")
    REFERENCES public."DimDate" ("Dateid") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."FactTrips"
    ADD FOREIGN KEY ("Truckid")
    REFERENCES public."DimTruck" ("Truckid") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS public."FactTrips"
    ADD FOREIGN KEY ("Stationid")
    REFERENCES public."DimStation" ("Stationid") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;