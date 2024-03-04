-- =======================================
-- CREATE TABLES FOR STAGING AREA
-- =======================================

CREATE TABLE IF NOT EXISTS public."Staging_DimDate"
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
    CONSTRAINT "Staging_DimDate_pkey" PRIMARY KEY ("Dateid")
);

CREATE TABLE IF NOT EXISTS public."Staging_DimStation"
(
    "Stationid" integer NOT NULL,
    "City" character(14),
    CONSTRAINT "Staging_DimStation_pkey" PRIMARY KEY ("Stationid")
);

CREATE TABLE IF NOT EXISTS public."Staging_DimTruck"
(
    "Truckid" integer NOT NULL,
    "TruckType" character(6),
    CONSTRAINT "Staging_DimTruck_pkey" PRIMARY KEY ("Truckid")
);

CREATE TABLE IF NOT EXISTS public."Staging_FactTrips"
(
    "Tripid" integer NOT NULL,
    "Dateid" integer,
    "Stationid" integer,
    "Truckid" integer,
    "Wastecollected" numeric(5, 2),
    CONSTRAINT "Staging_FactTrips_pkey" PRIMARY KEY ("Tripid")
);