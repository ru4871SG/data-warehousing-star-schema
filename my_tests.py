from data_quality_checks import check_for_nulls
from data_quality_checks import check_for_min_max
from data_quality_checks import check_for_valid_values
from data_quality_checks import check_for_duplicates


test1={
	"testname":"Check for nulls",
	"test":check_for_nulls,
	"column": "\"Dateid\"",
	"table": "Staging_DimDate"
}

test2={
	"testname":"Check for duplicates",
	"test":check_for_duplicates,
	"column": "\"Dateid\"",
	"table": "Staging_DimDate"
}

test3={
	"testname":"Check for min and max",
	"test":check_for_min_max,
	"column": "\"Quarter\"",
	"table": "Staging_DimDate",
	"minimum":1,
	"maximum":4
}

test4={
    "testname":"Check for valid values",
    "test":check_for_valid_values,
    "column": "\"QuarterName\"",
    "table": "Staging_DimDate",
    "valid_values":{'Q1','Q2','Q3','Q4'}
}

test5={
	"testname":"Check for min and max",
	"test":check_for_min_max,
	"column": "\"Month\"",
	"table": "Staging_DimDate",
	"minimum":1,
	"maximum":12
}

test6={
	"testname":"Check for min and max",
	"test":check_for_min_max,
	"column": "\"Weekday\"",
	"table": "Staging_DimDate",
	"minimum":1,
	"maximum":7
}

test7={
	"testname":"Check for nulls",
	"test":check_for_nulls,
	"column": "\"Stationid\"",
	"table": "Staging_DimStation"
}

test8={
	"testname":"Check for duplicates",
	"test":check_for_duplicates,
	"column": "\"Stationid\"",
	"table": "Staging_DimStation"
}

test9={
	"testname":"Check for nulls",
	"test":check_for_nulls,
	"column": "\"Truckid\"",
	"table": "Staging_DimTruck"
}

test10={
	"testname":"Check for duplicates",
	"test":check_for_duplicates,
	"column": "\"Truckid\"",
	"table": "Staging_DimTruck"
}

test11={
	"testname":"Check for nulls",
	"test":check_for_nulls,
	"column": "\"Tripid\"",
	"table": "Staging_FactTrips"
}

test12={
	"testname":"Check for duplicates",
	"test":check_for_duplicates,
	"column": "\"Tripid\"",
	"table": "Staging_FactTrips"
}
