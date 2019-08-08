UNIT UTILITIES_ARRAY;

// This unit 'UTILITIES_ARRAY' contains some common array functions and types which are missing in standard library.
// Please check Git repository for updates from time to time.

INTERFACE
	USES UTILITIES_STRING;
	
	FUNCTION SORT_LREAL_ARRAY;
	FUNCTION SORT_REAL_ARRAY;
	
	FUNCTION SORT_DINT_ARRAY;
	FUNCTION SORT_UDINT_ARRAY;
	FUNCTION SORT_INT_ARRAY;
	FUNCTION SORT_UINT_ARRAY;
	FUNCTION SORT_SINT_ARRAY;
	FUNCTION SORT_USINT_ARRAY;
	
	FUNCTION SORT_STRING_ARRAY;
	
	FUNCTION REVERSE_LREAL_ARRAY;
	FUNCTION REVERSE_REAL_ARRAY;
	
	FUNCTION REVERSE_DINT_ARRAY;
	FUNCTION REVERSE_UDINT_ARRAY;
	FUNCTION REVERSE_INT_ARRAY;
	FUNCTION REVERSE_UINT_ARRAY;
	FUNCTION REVERSE_SINT_ARRAY;
	FUNCTION REVERSE_USINT_ARRAY;
	
	FUNCTION REVERSE_STRING_ARRAY;
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
		
		FOR i := i_start TO i_end DO
			FOR j := i+1 TO i_end DO
				IF data[j] < data[i] THEN
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
		
		FOR i := i_start TO i_end DO
			FOR j := i+1 TO i_end DO
				IF data[j] < data[i] THEN
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
		
		FOR i := i_start TO i_end DO
			FOR j := i+1 TO i_end DO
				IF data[j] < data[i] THEN
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
		
		FOR i := i_start TO i_end DO
			FOR j := i+1 TO i_end DO
				IF data[j] < data[i] THEN
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
		
		FOR i := i_start TO i_end DO
			FOR j := i+1 TO i_end DO
				IF data[j] < data[i] THEN
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
		
		FOR i := i_start TO i_end DO
			FOR j := i+1 TO i_end DO
				IF data[j] < data[i] THEN
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
		
		FOR i := i_start TO i_end DO
			FOR j := i+1 TO i_end DO
				IF data[j] < data[i] THEN
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
		
		FOR i := i_start TO i_end DO
			FOR j := i+1 TO i_end DO
				IF data[j] < data[i] THEN
					temp := data[i];
					data[i] := data[j];
					data[j] := temp;
				END_IF;
			END_FOR;
		END_FOR;
	END_FUNCTION
	
	
	FUNCTION SORT_STRING_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF STRING;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
			temp : STRING;
		END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		
		FOR i:=i_start TO i_end DO
			FOR j:=i+1 TO i_end DO
				IF COMPARE_STRINGS(data[j], data[i]) < 0 THEN
					temp := data[i];
					data[i] := data[j];
					data[j] := temp;
				END_IF;
			END_FOR;
		END_FOR;
	END_FUNCTION
	
	
	FUNCTION REVERSE_LREAL_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF LREAL;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
			i_center : DINT;
			temp : LREAL;
		END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		i_center := i_start + (i_end - i_start) / 2;
		
		FOR i := i_start TO i_center DO
			j := i_end - (i - i_start);
			temp := data[i];
			data[i] := data[j];
			data[j] := temp;
		END_FOR;
	END_FUNCTION
	
	FUNCTION REVERSE_REAL_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF REAL;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
			i_center : DINT;
			temp : REAL;
		END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		i_center := i_start + (i_end - i_start) / 2;
		
		FOR i := i_start TO i_center DO
			j := i_end - (i - i_start);
			temp := data[i];
			data[i] := data[j];
			data[j] := temp;
		END_FOR;
	END_FUNCTION
	
	
	FUNCTION REVERSE_DINT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF DINT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
			i_center : DINT;
			temp : DINT;
		END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		i_center := i_start + (i_end - i_start) / 2;
		
		FOR i := i_start TO i_center DO
			j := i_end - (i - i_start);
			temp := data[i];
			data[i] := data[j];
			data[j] := temp;
		END_FOR;
	END_FUNCTION
	
	FUNCTION REVERSE_UDINT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF UDINT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
			i_center : DINT;
			temp : UDINT;
		END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		i_center := i_start + (i_end - i_start) / 2;
		
		FOR i := i_start TO i_center DO
			j := i_end - (i - i_start);
			temp := data[i];
			data[i] := data[j];
			data[j] := temp;
		END_FOR;
	END_FUNCTION
	
	FUNCTION REVERSE_INT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF INT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
			i_center : DINT;
			temp : INT;
		END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		i_center := i_start + (i_end - i_start) / 2;
		
		FOR i := i_start TO i_center DO
			j := i_end - (i - i_start);
			temp := data[i];
			data[i] := data[j];
			data[j] := temp;
		END_FOR;
	END_FUNCTION
	
	FUNCTION REVERSE_UINT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF UINT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
			i_center : DINT;
			temp : UINT;
		END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		i_center := i_start + (i_end - i_start) / 2;
		
		FOR i := i_start TO i_center DO
			j := i_end - (i - i_start);
			temp := data[i];
			data[i] := data[j];
			data[j] := temp;
		END_FOR;
	END_FUNCTION
	
	FUNCTION REVERSE_SINT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF SINT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
			i_center : DINT;
			temp : SINT;
		END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		i_center := i_start + (i_end - i_start) / 2;
		
		FOR i := i_start TO i_center DO
			j := i_end - (i - i_start);
			temp := data[i];
			data[i] := data[j];
			data[j] := temp;
		END_FOR;
	END_FUNCTION
	
	FUNCTION REVERSE_USINT_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF USINT;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
			i_center : DINT;
			temp : USINT;
		END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		i_center := i_start + (i_end - i_start) / 2;
		
		FOR i := i_start TO i_center DO
			j := i_end - (i - i_start);
			temp := data[i];
			data[i] := data[j];
			data[j] := temp;
		END_FOR;
	END_FUNCTION
	
	
	FUNCTION REVERSE_STRING_ARRAY : VOID
		VAR_IN_OUT
			data : ARRAY[..] OF STRING;
		END_VAR
		
		VAR_TEMP
			i, j : DINT;
			i_start : DINT;
			i_end : DINT;
			i_center : DINT;
			temp : STRING;
		END_VAR
		
		i_start := _firstIndexOf(data);
		i_end := _lastIndexOf(data);
		i_center := i_start + (i_end - i_start) / 2;
		
		FOR i := i_start TO i_center DO
			j := i_end - (i - i_start);
			temp := data[i];
			data[i] := data[j];
			data[j] := temp;
		END_FOR;
	END_FUNCTION
END_IMPLEMENTATION
