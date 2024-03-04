-- =======================================
-- ROLLUP QUERY
-- =======================================

-- Create a Function to run ROLLUP query using the columns: year, city, stationid, and total waste collected.

CREATE OR REPLACE FUNCTION get_rollup_query()
RETURNS TABLE("Year" integer, "City" character(14), "Stationid" integer, "TotalWasteCollected" numeric(7,2)) AS $$
BEGIN
    RETURN QUERY 
    SELECT DD."Year",
        DS."City",
        DS."Stationid",
        SUM(FT."Wastecollected") as "TotalWasteCollected"
    FROM 
        public."FactTrips" FT
    JOIN 
        public."DimDate" DD ON FT."Dateid" = DD."Dateid"
    JOIN 
        public."DimStation" DS ON FT."Stationid" = DS."Stationid"
    GROUP BY ROLLUP (DD."Year", DS."City", DS."Stationid");
END; $$ 
LANGUAGE plpgsql;