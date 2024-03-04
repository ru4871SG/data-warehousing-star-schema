-- =======================================
-- GROUPING SETS QUERY
-- =======================================

-- Create a Function to run GROUPING SETS query using the columns: stationid, trucktype, and total waste collected.

CREATE OR REPLACE FUNCTION get_grouping_sets()
RETURNS TABLE("Stationid" integer, "TruckType" character(6), "TotalWasteCollected" numeric(7,2)) AS $$
BEGIN
    RETURN QUERY 
    SELECT DS."Stationid",
        DT."TruckType",
        SUM(FT."Wastecollected") as "TotalWasteCollected"
    FROM 
        public."FactTrips" FT
    JOIN 
        public."DimStation" DS ON FT."Stationid" = DS."Stationid"
    JOIN 
        public."DimTruck" DT ON FT."Truckid" = DT."Truckid"
    GROUP BY GROUPING SETS 
        (
            (DS."Stationid"),
            (DT."TruckType")
        );
END; $$ 
LANGUAGE plpgsql;