-- =======================================
-- MATERIALIZED VIEW
-- =======================================

-- Create a Materialized View using the columns: city, stationid, trucktype, and max waste collected.

CREATE MATERIALIZED VIEW public.max_waste_stats AS
SELECT DS."City",
    DS."Stationid",
    DT."TruckType",
    MAX(FT."Wastecollected") as "MaxWasteCollected"
FROM 
    public."FactTrips" FT
JOIN 
    public."DimStation" DS ON FT."Stationid" = DS."Stationid"
JOIN 
    public."DimTruck" DT ON FT."Truckid" = DT."Truckid"
GROUP BY 
    DS."City",
    DS."Stationid",
    DT."TruckType";