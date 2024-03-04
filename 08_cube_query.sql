-- =======================================
-- CUBE QUERY
-- =======================================

-- Create a Function to run CUBE query using the columns: year, city, stationid, and average waste collected.

CREATE OR REPLACE FUNCTION get_cube_query()
RETURNS TABLE("Year" integer, "City" character(14), "Stationid" integer, "AverageWasteCollected" numeric(2,16)) AS $$
BEGIN
    RETURN QUERY 
    SELECT DD."Year",
        DS."City",
        DS."Stationid",
        AVG(FT."Wastecollected") as "AverageWasteCollected"
    FROM 
        public."FactTrips" FT
    JOIN 
        public."DimDate" DD ON FT."Dateid" = DD."Dateid"
    JOIN 
        public."DimStation" DS ON FT."Stationid" = DS."Stationid"
    GROUP BY CUBE (DD."Year", DS."City", DS."Stationid");
END; $$ 
LANGUAGE plpgsql;