UNIT UTILITIES_MATH;

// This unit 'UTILITIES_MATH' contains some common mathematic functions and types which are missing in standard library.
// Please check Git repository for updates from time to time.

INTERFACE
	USES UTILITIES_ARRAY, UTILITIES_STRING;
	
	FUNCTION CALCULATE_STATISTICS_OF_LREAL_ARRAY;
	FUNCTION CALCULATE_STATISTICS_OF_REAL_ARRAY;
	FUNCTION CALCULATE_STATISTICS_OF_DINT_ARRAY;
	FUNCTION CALCULATE_STATISTICS_OF_UDINT_ARRAY;
	FUNCTION CALCULATE_STATISTICS_OF_INT_ARRAY;
	FUNCTION CALCULATE_STATISTICS_OF_UINT_ARRAY;
	FUNCTION CALCULATE_STATISTICS_OF_SINT_ARRAY;
	FUNCTION CALCULATE_STATISTICS_OF_USINT_ARRAY;
	
	FUNCTION ROUND_LREAL;
	FUNCTION ROUND_REAL;
	
	
	TYPE
		// Contains statistics information of an array of floating values.
		FLOAT_ARRAY_STATISTICS : STRUCT
			count : UDINT; // count of values
			sum : LREAL; // sum of all values
			min_val : LREAL; // minimal value
			max_val : LREAL; // maximal value
			med_val : LREAL; // median value
			avg_val : LREAL; // average value
			sum_sqr : LREAL; // sum of squares
			std_dev : LREAL; // standard deviation
		END_STRUCT
		
		// Contains statistics information of an array of integral values.
		INTEGRAL_ARRAY_STATISTICS : STRUCT
			count : UDINT; // count of values
			sum : DINT; // sum of all values
			min_val : DINT; // minimal value
			max_val : DINT; // maximal value
			med_val : DINT; // (lower) median value
			avg_val : LREAL; // average value
			sum_sqr : LREAL; // sum of squares
			std_dev : LREAL; // standard deviation
		END_STRUCT
		
		// Contains statistics information of an array of unsigned integral values.
		UNSIGNED_INTEGRAL_ARRAY_STATISTICS : STRUCT
			count : UDINT; // count of values
			sum : UDINT; // sum of all values
			min_val : UDINT; // minimal value
			max_val : UDINT; // maximal value
			med_val : UDINT; // (lower) median value
			avg_val : LREAL; // average value
			sum_sqr : LREAL; // sum of squares
			std_dev : LREAL; // standard deviation
		END_STRUCT
	END_TYPE
	
	
	VAR_GLOBAL CONSTANT
		Pi : LREAL := 3.1415926535897932384; // ratio of a circle's circumference to its diameter
		Phi : LREAL := 1.6180339887498948482; // golden ratio
		Euler : LREAL := 2.7182818284590452354; // base of the natural logarithm
	END_VAR
END_INTERFACE


IMPLEMENTATION
	// Calculates statistics of given array containing LREAL values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_STATISTICS_OF_LREAL_ARRAY : FLOAT_ARRAY_STATISTICS
		VAR_IN_OUT
			data : ARRAY[..] OF LREAL;
		END_VAR
		
		VAR_TEMP
			i : DINT;
			i_start : DINT;
			i_end : DINT;
			out : FLOAT_ARRAY_STATISTICS;
		END_VAR
		
		// sort array
		SORT_LREAL_ARRAY(data);
		
		// get bounds and calculate size
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		out.count := DINT_TO_UDINT(i_end - i_start + 1);
		
		// determine min and max values
		out.min_val := data[i_start];
		out.max_val := data[i_end];
		
		// calculate sum of all values
		FOR i := i_start TO i_end DO
			out.sum := out.sum + data[i];
		END_FOR;
		
		// calculate average (mean) value
		out.avg_val := out.sum / out.count;
		
		// calculate sum of all squares (to mean)
		FOR i := i_start TO i_end DO
			out.sum_sqr := out.sum_sqr + (data[i] - out.avg_val) ** 2;
		END_FOR;
		
		// calculate standard deviation
		out.std_dev := SQRT(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + TRUNC((out.count -1) / 2); // index of (lower) median
		IF (out.count MOD 2) = 1 THEN
			out.med_val := data[i];
		ELSE
			out.med_val := (data[i] + data[i + 1]) / 2;
		END_IF;
		
		CALCULATE_STATISTICS_OF_LREAL_ARRAY := out;
	END_FUNCTION
	
	// Calculates statistics of given array containing REAL values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_STATISTICS_OF_REAL_ARRAY : FLOAT_ARRAY_STATISTICS
		VAR_IN_OUT
			data : ARRAY[..] OF REAL;
		END_VAR
		
		VAR_TEMP
			i : DINT;
			i_start : DINT;
			i_end : DINT;
			out : FLOAT_ARRAY_STATISTICS;
		END_VAR
		
		// sort array
		SORT_REAL_ARRAY(data);
		
		// get bounds and calculate size
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		out.count := DINT_TO_UDINT(i_end - i_start + 1);
		
		// determine min and max values
		out.min_val := data[i_start];
		out.max_val := data[i_end];
		
		// calculate sum of all values
		FOR i := i_start TO i_end DO
			out.sum := out.sum + data[i];
		END_FOR;
		
		// calculate average (mean) value
		out.avg_val := out.sum / out.count;
		
		// calculate sum of all squares (to mean)
		FOR i := i_start TO i_end DO
			out.sum_sqr := out.sum_sqr + (data[i] - out.avg_val) ** 2;
		END_FOR;
		
		// calculate standard deviation
		out.std_dev := SQRT(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + TRUNC((out.count -1) / 2); // index of (lower) median
		IF (out.count MOD 2) = 1 THEN
			out.med_val := data[i];
		ELSE
			out.med_val := (data[i] + data[i + 1]) / 2;
		END_IF;
		
		CALCULATE_STATISTICS_OF_REAL_ARRAY := out;
	END_FUNCTION
	
	// Calculates statistics of given array containing DINT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_STATISTICS_OF_DINT_ARRAY : INTEGRAL_ARRAY_STATISTICS
		VAR_IN_OUT
			data : ARRAY[..] OF DINT;
		END_VAR
		
		VAR_TEMP
			i : DINT;
			i_start : DINT;
			i_end : DINT;
			out : INTEGRAL_ARRAY_STATISTICS;
		END_VAR
		
		// sort source array
		SORT_DINT_ARRAY(data);
		
		// get bounds and calculate size
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		out.count := DINT_TO_UDINT(i_end - i_start + 1);
		
		// determine min and max values
		out.min_val := data[i_start];
		out.max_val := data[i_end];
		
		// calculate sum of all values
		FOR i := i_start TO i_end DO
			out.sum := out.sum + data[i];
		END_FOR;
		
		// calculate average (mean) value
		out.avg_val := DINT_TO_LREAL(out.sum) / out.count;
		
		// calculate sum of all squares (to mean)
		FOR i := i_start TO i_end DO
			out.sum_sqr := out.sum_sqr + (data[i] - out.avg_val) ** 2;
		END_FOR;
		
		// calculate standard deviation
		out.std_dev := SQRT(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + TRUNC((out.count -1) / 2); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_STATISTICS_OF_DINT_ARRAY := out;
	END_FUNCTION
	
	// Calculates statistics of given array containing UDINT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_STATISTICS_OF_UDINT_ARRAY : UNSIGNED_INTEGRAL_ARRAY_STATISTICS
		VAR_IN_OUT
			data : ARRAY[..] OF UDINT;
		END_VAR
		
		VAR_TEMP
			i : DINT;
			i_start : DINT;
			i_end : DINT;
			out : UNSIGNED_INTEGRAL_ARRAY_STATISTICS;
		END_VAR
		
		// sort source array
		SORT_UDINT_ARRAY(data);
		
		// get bounds and calculate size
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		out.count := DINT_TO_UDINT(i_end - i_start + 1);
		
		// determine min and max values
		out.min_val := data[i_start];
		out.max_val := data[i_end];
		
		// calculate sum of all values
		FOR i := i_start TO i_end DO
			out.sum := out.sum + data[i];
		END_FOR;
		
		// calculate average (mean) value
		out.avg_val := UDINT_TO_LREAL(out.sum) / out.count;
		
		// calculate sum of all squares (to mean)
		FOR i := i_start TO i_end DO
			out.sum_sqr := out.sum_sqr + (data[i] - out.avg_val) ** 2;
		END_FOR;
		
		// calculate standard deviation
		out.std_dev := SQRT(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + TRUNC((out.count -1) / 2); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_STATISTICS_OF_UDINT_ARRAY := out;
	END_FUNCTION
	
	// Calculates statistics of given array containing INT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_STATISTICS_OF_INT_ARRAY : INTEGRAL_ARRAY_STATISTICS
		VAR_IN_OUT
			data : ARRAY[..] OF INT;
		END_VAR
		
		VAR_TEMP
			i : DINT;
			i_start : DINT;
			i_end : DINT;
			out : INTEGRAL_ARRAY_STATISTICS;
		END_VAR
		
		// sort source array
		SORT_INT_ARRAY(data);
		
		// get bounds and calculate size
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		out.count := DINT_TO_UDINT(i_end - i_start + 1);
		
		// determine min and max values
		out.min_val := data[i_start];
		out.max_val := data[i_end];
		
		// calculate sum of all values
		FOR i := i_start TO i_end DO
			out.sum := out.sum + data[i];
		END_FOR;
		
		// calculate average (mean) value
		out.avg_val := DINT_TO_LREAL(out.sum) / out.count;
		
		// calculate sum of all squares (to mean)
		FOR i := i_start TO i_end DO
			out.sum_sqr := out.sum_sqr + (data[i] - out.avg_val) ** 2;
		END_FOR;
		
		// calculate standard deviation
		out.std_dev := SQRT(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + TRUNC((out.count -1) / 2); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_STATISTICS_OF_INT_ARRAY := out;
	END_FUNCTION
	
	// Calculates statistics of given array containing UINT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_STATISTICS_OF_UINT_ARRAY : UNSIGNED_INTEGRAL_ARRAY_STATISTICS
		VAR_IN_OUT
			data : ARRAY[..] OF UINT;
		END_VAR
		
		VAR_TEMP
			i : DINT;
			i_start : DINT;
			i_end : DINT;
			out : UNSIGNED_INTEGRAL_ARRAY_STATISTICS;
		END_VAR
		
		// sort source array
		SORT_UINT_ARRAY(data);
		
		// get bounds and calculate size
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		out.count := DINT_TO_UDINT(i_end - i_start + 1);
		
		// determine min and max values
		out.min_val := data[i_start];
		out.max_val := data[i_end];
		
		// calculate sum of all values
		FOR i := i_start TO i_end DO
			out.sum := out.sum + data[i];
		END_FOR;
		
		// calculate average (mean) value
		out.avg_val := UDINT_TO_LREAL(out.sum) / out.count;
		
		// calculate sum of all squares (to mean)
		FOR i := i_start TO i_end DO
			out.sum_sqr := out.sum_sqr + (data[i] - out.avg_val) ** 2;
		END_FOR;
		
		// calculate standard deviation
		out.std_dev := SQRT(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + TRUNC((out.count -1) / 2); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_STATISTICS_OF_UINT_ARRAY := out;
	END_FUNCTION
	
	// Calculates statistics of given array containing SINT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_STATISTICS_OF_SINT_ARRAY : INTEGRAL_ARRAY_STATISTICS
		VAR_IN_OUT
			data : ARRAY[..] OF SINT;
		END_VAR
		
		VAR_TEMP
			i : DINT;
			i_start : DINT;
			i_end : DINT;
			out : INTEGRAL_ARRAY_STATISTICS;
		END_VAR
		
		// sort source array
		SORT_SINT_ARRAY(data);
		
		// get bounds and calculate size
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		out.count := DINT_TO_UDINT(i_end - i_start + 1);
		
		// determine min and max values
		out.min_val := data[i_start];
		out.max_val := data[i_end];
		
		// calculate sum of all values
		FOR i := i_start TO i_end DO
			out.sum := out.sum + data[i];
		END_FOR;
		
		// calculate average (mean) value
		out.avg_val := DINT_TO_LREAL(out.sum) / out.count;
		
		// calculate sum of all squares (to mean)
		FOR i := i_start TO i_end DO
			out.sum_sqr := out.sum_sqr + (data[i] - out.avg_val) ** 2;
		END_FOR;
		
		// calculate standard deviation
		out.std_dev := SQRT(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + TRUNC((out.count -1) / 2); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_STATISTICS_OF_SINT_ARRAY := out;
	END_FUNCTION
	
	// Calculates statistics of given array containing USINT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_STATISTICS_OF_USINT_ARRAY : UNSIGNED_INTEGRAL_ARRAY_STATISTICS
		VAR_IN_OUT
			data : ARRAY[..] OF USINT;
		END_VAR
		
		VAR_TEMP
			i : DINT;
			i_start : DINT;
			i_end : DINT;
			out : UNSIGNED_INTEGRAL_ARRAY_STATISTICS;
		END_VAR
		
		// sort source array
		SORT_USINT_ARRAY(data);
		
		// get bounds and calculate size
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		out.count := DINT_TO_UDINT(i_end - i_start + 1);
		
		// determine min and max values
		out.min_val := data[i_start];
		out.max_val := data[i_end];
		
		// calculate sum of all values
		FOR i := i_start TO i_end DO
			out.sum := out.sum + data[i];
		END_FOR;
		
		// calculate average (mean) value
		out.avg_val := UDINT_TO_LREAL(out.sum) / out.count;
		
		// calculate sum of all squares (to mean)
		FOR i := i_start TO i_end DO
			out.sum_sqr := out.sum_sqr + (data[i] - out.avg_val) ** 2;
		END_FOR;
		
		// calculate standard deviation
		out.std_dev := SQRT(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + TRUNC((out.count -1) / 2); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_STATISTICS_OF_USINT_ARRAY := out;
	END_FUNCTION
	
	
	// Returns a rounded LREAL value with given precision.
	// Examples: ROUND_LREAL(1.2323, 3) => 1.232 / ROUND_LREAL(9.8765, 2) => 9.88
	FUNCTION ROUND_LREAL : LREAL
		VAR_INPUT
			in : LREAL;
			precision : USINT;
		END_VAR
		
		VAR_TEMP
			str : STRING;
			i_exp_delimiter : INT;
			i_exp_value : INT;
			i_decimal_point : INT;
			i_digit_to_round : INT;
			out : LREAL;
		END_VAR
		
		str := LREAL_TO_STRING(in);
		
		i_exp_delimiter := FIND(str, 'e');
		IF i_exp_delimiter > 0 THEN
			i_exp_value := STRING_TO_INT(MID(str, LEN(str) - i_exp_delimiter, i_exp_delimiter + 1));
		END_IF;
		IF i_exp_value < 0 THEN
			str := CONCAT3(
				PAD_STRING_RIGHT('0.', INT_TO_USINT(i_exp_value * -1 + 1), '0'),
				LEFT(str, 1),
				MID(str, i_exp_delimiter - 3, 3)
			);
		END_IF;
		
		i_decimal_point := FIND(str, '.');
		out := STRING_TO_LREAL(LEFT(str, i_decimal_point + precision));
		
		i_digit_to_round := i_decimal_point + precision + 1;
		IF i_digit_to_round <= LEN(str) AND str[i_digit_to_round] >= 53 THEN
			IF in >= 0 THEN
				out := out + EXPD(-precision);
			ELSE
				out := out - EXPD(-precision);
			END_IF;
		END_IF;
		
		ROUND_LREAL := out;
	END_FUNCTION
	
	// Returns a rounded REAL value with given precision.
	// Examples: ROUND_REAL(1.2323, 3) => 1.232 / ROUND_REAL(9.8765, 2) => 9.88
	FUNCTION ROUND_REAL : REAL
		VAR_INPUT
			in : REAL;
			precision : USINT;
		END_VAR
		
		VAR_TEMP
			str : STRING;
			i_exp_delimiter : INT;
			i_exp_value : INT;
			i_decimal_point : INT;
			i_digit_to_round : INT;
			out : REAL;
		END_VAR
		
		str := REAL_TO_STRING(in);
		
		i_exp_delimiter := FIND(str, 'e');
		IF i_exp_delimiter > 0 THEN
			i_exp_value := STRING_TO_INT(MID(str, LEN(str) - i_exp_delimiter, i_exp_delimiter + 1));
		END_IF;
		IF i_exp_value < 0 THEN
			str := CONCAT3(
				PAD_STRING_RIGHT('0.', INT_TO_USINT(i_exp_value * -1 + 1), '0'),
				LEFT(str, 1),
				MID(str, i_exp_delimiter - 3, 3)
			);
		END_IF;
		
		i_decimal_point := FIND(str, '.');
		out := STRING_TO_REAL(LEFT(str, i_decimal_point + precision));
		
		i_digit_to_round := i_decimal_point + precision + 1;
		IF i_digit_to_round <= LEN(str) AND str[i_digit_to_round] >= 53 THEN
			IF in >= 0 THEN
				out := out + EXPD(-precision);
			ELSE
				out := out - EXPD(-precision);
			END_IF;
		END_IF;
		
		ROUND_REAL := out;
	END_FUNCTION
END_IMPLEMENTATION
