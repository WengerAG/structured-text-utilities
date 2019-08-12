UNIT UTILITIES_TIME;

// This unit 'UTILITIES_TIME' contains some common time and date functions and types which are missing in standard library.
// Please check Git repository for updates from time to time.

INTERFACE
	USES UTILITIES_STRING;
	
	FUNCTION TIME_TO_PARTS;
	FUNCTION TIME_OF_DAY_TO_PARTS;
	FUNCTION DATE_TO_PARTS;
	FUNCTION DATE_AND_TIME_TO_PARTS;
	
	
	TYPE
		// Contains all parts of a positive duration (days, hours, minutes, seconds, etc.).
		TIME_PARTS : STRUCT
			day : USINT; // numeric day (e.g. 1)
			hour : USINT; // numeric hour (e.g. 21)
			minute : USINT; // numeric minute of hour (e.g. 34)
			second : USINT; // numeric second of minute (e.g. 56)
			millisecond : UINT; // numeric millisecond of second (e.g. 789)
			iso8601 : STRING[18]; // duration in ISO 8601 representation (e.g. 'P1DT21H34M56.789S')
		END_STRUCT
		
		// Contains all parts of a local date (year, month, day, etc.).
		DATE_PARTS : STRUCT
			year : UINT; // numeric year (e.g. 2019)
			year_of_century : USINT; // numeric year of century (e.g. 19)
			month : USINT; // numeric month of year (e.g. 10)
			day : USINT; // numeric day of month (e.g. 31)
			day_of_year : UINT; // numeric day of year (e.g. 304)
			day_of_week : USINT; // numeric day of week (Monday = 1 <-> Sunday = 7; e.g. 4)
			week_of_year : USINT; // numeric week of year (e.g. 44)
			iso8601 : STRING[10]; // date in ISO 8601 representation (e.g. '2019-10-31')
		END_STRUCT
		
		// Contains all parts of a local time (hours, minutes, seconds, etc.).
		TIME_OF_DAY_PARTS : STRUCT
			hour : USINT; // numeric hour of day (e.g. 21)
			minute : USINT; // numeric minute of hour (e.g. 34)
			second : USINT; // numeric second of minute (e.g. 56)
			millisecond : UINT; // numeric millisecond of second (e.g. 789)
			iso8601 : STRING[12]; // time of day in ISO 8601 representation (e.g. '21:34:56.789')
		END_STRUCT
		
		// Contains all parts of a local date (year, month, day, etc.) and time (hours, minutes, seconds, etc.).
		DATE_AND_TIME_PARTS : STRUCT
			year : UINT; // numeric year (e.g. 2019)
			year_of_century : USINT; // numeric year of century (e.g. 19)
			month : USINT; // numeric month of year (e.g. 10)
			day : USINT; // numeric day of month (e.g. 31)
			day_of_year : UINT; // numeric day of year (e.g. 304)
			day_of_week : USINT; // numeric day of week (Monday = 1 <-> Sunday = 7; e.g. 4)
			week_of_year : USINT; // numeric week of year (e.g. 44)
			hour : USINT; // numeric hour of day (e.g. 21)
			minute : USINT; // numeric minute of hour (e.g. 34)
			second : USINT; // numeric second of minute (e.g. 56)
			millisecond : UINT; // numeric millisecond of second (e.g. 789)
			iso8601 : STRING[23]; // date and time in ISO 8601 representation (e.g. '2019-10-31T21:34:56.789')
		END_STRUCT
	END_TYPE
END_INTERFACE


IMPLEMENTATION
	// Converts internal TIME type to TIME_PARTS structure.
	FUNCTION TIME_TO_PARTS : TIME_PARTS
		VAR_INPUT
			in : TIME;
		END_VAR
		
		VAR_TEMP
			milliseconds : UDINT;
			seconds : UDINT;
			minutes : UDINT;
			hours : UDINT;
			days : UDINT;
			out : TIME_PARTS;
		END_VAR
		
		milliseconds := TIME_TO_UDINT(in);
		out.millisecond := UDINT_TO_UINT(milliseconds MOD 1000);
		
		seconds := (milliseconds - out.millisecond) / 1000;
		out.second := UDINT_TO_USINT(seconds MOD 60);
		
		minutes := (seconds - out.second) / 60;
		out.minute := UDINT_TO_USINT(minutes MOD 60);
		
		hours := (minutes - out.minute) / 60;
		out.hour := UDINT_TO_USINT(hours MOD 24);

		days := (hours - out.hour) / 24;
		out.day := UDINT_TO_USINT(days);
		
		out.iso8601 := 'P';
		
		IF out.day <> 0 THEN
			out.iso8601 := CONCAT3(out.iso8601, USINT_TO_STRING(out.day), 'D');
		END_IF;

		out.iso8601 := CONCAT(out.iso8601, 'T');

		IF out.hour <> 0 THEN
			out.iso8601 := CONCAT3(out.iso8601, USINT_TO_STRING(out.hour), 'H');
		END_IF;

		IF out.minute <> 0 THEN
			out.iso8601 := CONCAT3(out.iso8601, USINT_TO_STRING(out.minute), 'M');
		END_IF;

		IF out.second <> 0 OR out.millisecond <> 0 THEN
			out.iso8601 := CONCAT(out.iso8601, USINT_TO_STRING(out.second));
			
			IF out.millisecond >= 100 THEN
				out.iso8601 := CONCAT3(out.iso8601, '.', UINT_TO_STRING(out.millisecond));
			ELSIF out.millisecond >= 10 THEN
				out.iso8601 := CONCAT3(out.iso8601, '.0', UINT_TO_STRING(out.millisecond));
			ELSE
				out.iso8601 := CONCAT3(out.iso8601, '.00', UINT_TO_STRING(out.millisecond));
			END_IF;

			out.iso8601 := CONCAT(out.iso8601, 'S');
		END_IF;

		TIME_TO_PARTS := out;
	END_FUNCTION
	
	// Converts internal TIME_OF_DAY type to TIME_OF_DAY_PARTS structure.
	FUNCTION TIME_OF_DAY_TO_PARTS : TIME_OF_DAY_PARTS
		VAR_INPUT
			in : TIME_OF_DAY;
		END_VAR
		
		VAR_TEMP
			in_array : ARRAY[0..3] OF BYTE; // Array for marshalling
			milliseconds : UDINT;
			seconds : UDINT;
			minutes : UDINT;
			hours : UDINT;
			out : TIME_OF_DAY_PARTS;
		END_VAR
		
		in_array := ANYTYPE_TO_LITTLEBYTEARRAY(in, 0);
		milliseconds := LITTLEBYTEARRAY_TO_ANYTYPE(in_array, 0);
		out.millisecond := UDINT_TO_UINT(milliseconds MOD 1000);
		
		seconds := (milliseconds - out.millisecond) / 1000;
		out.second := UDINT_TO_USINT(seconds MOD 60);
		
		minutes := (seconds - out.second) / 60;
		out.minute := UDINT_TO_USINT(minutes MOD 60);
		
		hours := (minutes - out.minute) / 60;
		out.hour := UDINT_TO_USINT(hours MOD 24);
		
		IF out.hour >= 10 THEN
			out.iso8601 := CONCAT(USINT_TO_STRING(out.hour), ':');
		ELSE
			out.iso8601 := CONCAT3('0', USINT_TO_STRING(out.hour), ':');
		END_IF;
		
		IF out.minute >= 10 THEN
			out.iso8601 := CONCAT3(out.iso8601, USINT_TO_STRING(out.minute), ':');
		ELSE
			out.iso8601 := CONCAT4(out.iso8601, '0', USINT_TO_STRING(out.minute), ':');
		END_IF;
		
		IF out.second >= 10 THEN
			out.iso8601 := CONCAT3(out.iso8601, USINT_TO_STRING(out.second), '.');
		ELSE
			out.iso8601 := CONCAT4(out.iso8601, '0', USINT_TO_STRING(out.second), '.');
		END_IF;
		
		IF out.millisecond >= 100 THEN
			out.iso8601 := CONCAT(out.iso8601, UINT_TO_STRING(out.millisecond));
		ELSIF out.millisecond >= 10 THEN
			out.iso8601 := CONCAT3(out.iso8601, '0', UINT_TO_STRING(out.millisecond));
		ELSE
			out.iso8601 := CONCAT3(out.iso8601, '00', UINT_TO_STRING(out.millisecond));
		END_IF;

		TIME_OF_DAY_TO_PARTS := out;
	END_FUNCTION
	
	// Converts internal DATE type to DATE_PARTS structure.
	FUNCTION DATE_TO_PARTS : DATE_PARTS
		VAR_INPUT
			in : DATE;
		END_VAR
		
		VAR_TEMP
			in_array : ARRAY[0..3] OF BYTE; // Array for marshalling
			days_since_1992 : UDINT;
			anchor_in_calendar_week : DINT;
			start_of_year : DINT;
			start_of_year_before : DINT;
			days_of_year_left : UDINT;
			days_of_year : UINT;
			days_of_month_left : UDINT;
			days_of_month : UDINT;
			year_is_leap : BOOL;
			year : UINT;
			month : SINT;
			out : DATE_PARTS;
		END_VAR
		
		in_array := ANYTYPE_TO_LITTLEBYTEARRAY(in, 0);
		days_since_1992 := LITTLEBYTEARRAY_TO_ANYTYPE(in_array, 0);
		days_since_1992 := days_since_1992 -1; // 1992-01-01 is encoded as 1, not 0 :-/
		
		start_of_year := 0;
		start_of_year_before := -365;
		days_of_year_left := days_since_1992;
		
		FOR year := 1992 TO 2200 DO
			IF year MOD 4 = 0 AND (year = 2000 OR year MOD 100 <> 0) THEN
				year_is_leap := TRUE;
				days_of_year := 366;
			ELSE
				year_is_leap := FALSE;
				days_of_year := 365;
			END_IF;
			
			IF days_of_year_left >= days_of_year THEN
				days_of_year_left := days_of_year_left - days_of_year;
			ELSE
				days_of_month_left := days_of_year_left;
				
				FOR month := 1 TO 12 DO
					CASE month OF
						1, 3, 5, 7, 8, 10, 12: days_of_month := 31;
						4, 6, 9, 11: days_of_month := 30;
						2: IF year_is_leap THEN days_of_month := 29; ELSE days_of_month := 28; END_IF;
					END_CASE;
					
					IF days_of_month_left >= days_of_month THEN
						days_of_month_left := days_of_month_left - days_of_month;
					ELSE
						out.year := year;
						out.year_of_century := UINT_TO_USINT(year MOD 100);
						out.month := SINT_TO_USINT(month);
						out.day := UDINT_TO_USINT(days_of_month_left + 1);
						out.day_of_year := UDINT_TO_UINT(days_of_year_left + 1);
						
						EXIT;
					END_IF;
				END_FOR;
				
				EXIT;
			END_IF;
			
			start_of_year_before := start_of_year;
			start_of_year := start_of_year + days_of_year;
		END_FOR;
		
		out.day_of_week := UDINT_TO_USINT((days_since_1992 MOD 7 + 2) MOD 7 + 1);
		
		anchor_in_calendar_week := UDINT_TO_DINT(days_since_1992) - out.day_of_week + 4;
		IF anchor_in_calendar_week < start_of_year THEN
			out.week_of_year := DINT_TO_USINT((anchor_in_calendar_week - (start_of_year_before + 3) + ((start_of_year_before + 3) MOD 7 + 2) MOD 7 + 1 - 4) / 7 + 1);
		ELSE
			out.week_of_year := DINT_TO_USINT((anchor_in_calendar_week - (start_of_year + 3) + ((start_of_year + 3) MOD 7 + 2) MOD 7 + 1 - 4) / 7 + 1);
		END_IF;
		
		out.iso8601 := CONCAT(UINT_TO_STRING(out.year), '-');
		
		IF out.month >= 10 THEN
			out.iso8601 := CONCAT3(out.iso8601, USINT_TO_STRING(out.month), '-');
		ELSE
			out.iso8601 := CONCAT4(out.iso8601, '0', USINT_TO_STRING(out.month), '-');
		END_IF;
		
		IF out.day >= 10 THEN
			out.iso8601 := CONCAT(out.iso8601, USINT_TO_STRING(out.day));
		ELSE
			out.iso8601 := CONCAT3(out.iso8601, '0', USINT_TO_STRING(out.day));
		END_IF;
		
		DATE_TO_PARTS := out;
	END_FUNCTION
	
	// Converts internal DATE_AND_TIME type to DATE_AND_TIME_PARTS structure.
	FUNCTION DATE_AND_TIME_TO_PARTS : DATE_AND_TIME_PARTS
		VAR_INPUT
			in : DATE_AND_TIME;
		END_VAR
		
		VAR_TEMP
			dat_parts : DATE_PARTS;
			tod_parts : TIME_OF_DAY_PARTS;
			out : DATE_AND_TIME_PARTS;
		END_VAR
		
		dat_parts := DATE_TO_PARTS(DT_TO_DATE(in));
		tod_parts := TIME_OF_DAY_TO_PARTS(DT_TO_TOD(in));
		
		out.year := dat_parts.year;
		out.year_of_century := dat_parts.year_of_century;
		out.month := dat_parts.month;
		out.day := dat_parts.day;
		out.day_of_year := dat_parts.day_of_year;
		out.day_of_week := dat_parts.day_of_week;
		out.week_of_year := dat_parts.week_of_year;
		
		out.hour := tod_parts.hour;
		out.minute := tod_parts.minute;
		out.second := tod_parts.second;
		out.millisecond := tod_parts.millisecond;
		
		out.iso8601 := CONCAT3(dat_parts.iso8601, 'T', tod_parts.iso8601);
		
		DATE_AND_TIME_TO_PARTS := out;
	END_FUNCTION
END_IMPLEMENTATION
