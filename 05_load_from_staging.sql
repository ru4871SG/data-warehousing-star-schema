-- =======================================
-- LOAD DATA FROM STAGING AREA INTO DATA WAREHOUSE
-- =======================================

INSERT INTO public."DimDate" 
SELECT * FROM public."Staging_DimDate";

INSERT INTO public."DimStation" 
SELECT * FROM public."Staging_DimStation";

INSERT INTO public."DimTruck" 
SELECT * FROM public."Staging_DimTruck";

INSERT INTO public."FactTrips" 
SELECT * FROM public."Staging_FactTrips";