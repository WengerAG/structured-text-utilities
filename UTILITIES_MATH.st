UNIT UTILITIES_MATH;

// This unit 'UTILITIES_MATH' contains some common mathematic functions and types which are missing in standard library.
// Please check Git repository for updates from time to time.

INTERFACE
	FUNCTION SORT_LREAL_ARRAY;
	FUNCTION SORT_REAL_ARRAY;
	FUNCTION SORT_DINT_ARRAY;
	FUNCTION SORT_UDINT_ARRAY;
	FUNCTION SORT_INT_ARRAY;
	FUNCTION SORT_UINT_ARRAY;
	FUNCTION SORT_SINT_ARRAY;
	FUNCTION SORT_USINT_ARRAY;
	
	FUNCTION CALCULATE_LREAL_ARRAY_STATISTICS;
	FUNCTION CALCULATE_REAL_ARRAY_STATISTICS;
	FUNCTION CALCULATE_DINT_ARRAY_STATISTICS;
	FUNCTION CALCULATE_UDINT_ARRAY_STATISTICS;
	FUNCTION CALCULATE_INT_ARRAY_STATISTICS;
	FUNCTION CALCULATE_UINT_ARRAY_STATISTICS;
	FUNCTION CALCULATE_SINT_ARRAY_STATISTICS;
	FUNCTION CALCULATE_USINT_ARRAY_STATISTICS;


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
	FUNCTION SORT_LREAL_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF LREAL;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
            temp : LREAL;
        END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		
		FOR i:=i_start TO i_end DO
			FOR j:=i+1 TO i_end DO
				IF(data[j] < data[i]) THEN
					temp := data[i];
					data[i] := data[j];
					data[j] := temp;
				END_IF;
			END_FOR;
		END_FOR;
	END_FUNCTION

	FUNCTION SORT_REAL_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF REAL;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
            temp : REAL;
        END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		
		FOR i:=i_start TO i_end DO
			FOR j:=i+1 TO i_end DO
				IF(data[j] < data[i]) THEN
					temp := data[i];
					data[i] := data[j];
					data[j] := temp;
				END_IF;
			END_FOR;
		END_FOR;
	END_FUNCTION

	FUNCTION SORT_DINT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF DINT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
            temp : DINT;
        END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		
		FOR i:=i_start TO i_end DO
			FOR j:=i+1 TO i_end DO
				IF(data[j] < data[i]) THEN
					temp := data[i];
					data[i] := data[j];
					data[j] := temp;
				END_IF;
			END_FOR;
		END_FOR;
	END_FUNCTION

	FUNCTION SORT_UDINT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF UDINT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
            temp : UDINT;
        END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		
		FOR i:=i_start TO i_end DO
			FOR j:=i+1 TO i_end DO
				IF(data[j] < data[i]) THEN
					temp := data[i];
					data[i] := data[j];
					data[j] := temp;
				END_IF;
			END_FOR;
		END_FOR;
	END_FUNCTION

	FUNCTION SORT_INT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF INT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
            temp : INT;
        END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		
		FOR i:=i_start TO i_end DO
			FOR j:=i+1 TO i_end DO
				IF(data[j] < data[i]) THEN
					temp := data[i];
					data[i] := data[j];
					data[j] := temp;
				END_IF;
			END_FOR;
		END_FOR;
	END_FUNCTION

	FUNCTION SORT_UINT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF UINT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
            temp : UINT;
        END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		
		FOR i:=i_start TO i_end DO
			FOR j:=i+1 TO i_end DO
				IF(data[j] < data[i]) THEN
					temp := data[i];
					data[i] := data[j];
					data[j] := temp;
				END_IF;
			END_FOR;
		END_FOR;
	END_FUNCTION

	FUNCTION SORT_SINT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF SINT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
            temp : SINT;
        END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		
		FOR i:=i_start TO i_end DO
			FOR j:=i+1 TO i_end DO
				IF(data[j] < data[i]) THEN
					temp := data[i];
					data[i] := data[j];
					data[j] := temp;
				END_IF;
			END_FOR;
		END_FOR;
	END_FUNCTION

	FUNCTION SORT_USINT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF USINT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
            temp : USINT;
        END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		
		FOR i:=i_start TO i_end DO
			FOR j:=i+1 TO i_end DO
				IF(data[j] < data[i]) THEN
					temp := data[i];
					data[i] := data[j];
					data[j] := temp;
				END_IF;
			END_FOR;
		END_FOR;
	END_FUNCTION

	// Calculates statistics of given array containing LREAL values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_LREAL_ARRAY_STATISTICS : FLOAT_ARRAY_STATISTICS
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
		out.std_dev := sqrt(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + LREAL_TO_DINT(out.count / 2 - 0.5); // index of (lower) median
		IF (out.count MOD 2) = 1 THEN
			out.med_val := data[i];
		ELSE
			out.med_val := (data[i] + data[i + 1]) / 2;
		END_IF;
		
		CALCULATE_LREAL_ARRAY_STATISTICS := out;
	END_FUNCTION

	// Calculates statistics of given array containing REAL values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_REAL_ARRAY_STATISTICS : FLOAT_ARRAY_STATISTICS
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
		out.std_dev := sqrt(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + LREAL_TO_DINT(out.count / 2 - 0.5); // index of (lower) median
		IF (out.count MOD 2) = 1 THEN
			out.med_val := data[i];
		ELSE
			out.med_val := (data[i] + data[i + 1]) / 2;
		END_IF;
		
		CALCULATE_REAL_ARRAY_STATISTICS := out;
	END_FUNCTION

	// Calculates statistics of given array containing DINT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_DINT_ARRAY_STATISTICS : INTEGRAL_ARRAY_STATISTICS
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
		out.std_dev := sqrt(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + LREAL_TO_DINT(out.count / 2 - 0.5); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_DINT_ARRAY_STATISTICS := out;
	END_FUNCTION
	
	// Calculates statistics of given array containing UDINT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_UDINT_ARRAY_STATISTICS : UNSIGNED_INTEGRAL_ARRAY_STATISTICS
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
		out.std_dev := sqrt(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + LREAL_TO_DINT(out.count / 2 - 0.5); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_UDINT_ARRAY_STATISTICS := out;
	END_FUNCTION

	// Calculates statistics of given array containing INT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_INT_ARRAY_STATISTICS : INTEGRAL_ARRAY_STATISTICS
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
		out.std_dev := sqrt(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + LREAL_TO_DINT(out.count / 2 - 0.5); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_INT_ARRAY_STATISTICS := out;
	END_FUNCTION
	
	// Calculates statistics of given array containing UINT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_UINT_ARRAY_STATISTICS : UNSIGNED_INTEGRAL_ARRAY_STATISTICS
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
		out.std_dev := sqrt(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + LREAL_TO_DINT(out.count / 2 - 0.5); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_UINT_ARRAY_STATISTICS := out;
	END_FUNCTION

	// Calculates statistics of given array containing SINT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_SINT_ARRAY_STATISTICS : INTEGRAL_ARRAY_STATISTICS
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
		out.std_dev := sqrt(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + LREAL_TO_DINT(out.count / 2 - 0.5); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_SINT_ARRAY_STATISTICS := out;
	END_FUNCTION
	
	// Calculates statistics of given array containing USINT values.
	// ATTENTION: due to limitations of ST given array will be sorted. If order should be prevented, array MUST be copied first.
	FUNCTION CALCULATE_USINT_ARRAY_STATISTICS : UNSIGNED_INTEGRAL_ARRAY_STATISTICS
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
		out.std_dev := sqrt(out.sum_sqr / out.count);
		
		// calculate median value
		i := i_start + LREAL_TO_DINT(out.count / 2 - 0.5); // index of (lower) median
		out.med_val := data[i];
		
		CALCULATE_USINT_ARRAY_STATISTICS := out;
	END_FUNCTION
END_IMPLEMENTATION
