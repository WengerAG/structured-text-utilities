UNIT UTILITIES_STRING;

// This unit 'UTILITIES_STRING' contains some common string functions and types which are missing in standard library.
// Please check Git repository for updates from time to time.

INTERFACE
	FUNCTION CONCAT3;
	FUNCTION CONCAT4;
	FUNCTION CONCAT5;
	FUNCTION CONCAT6;
	FUNCTION CONCAT7;
	FUNCTION CONCAT8;
	FUNCTION CONCAT9;
	
	FUNCTION STRING_STARTSWITH;
	FUNCTION STRING_ENDSWITH;
	
	FUNCTION COMPARE_STRINGS;
	
	FUNCTION PAD_STRING_LEFT;
	FUNCTION PAD_STRING_RIGHT;
	
	FUNCTION ENCODE_STRING;
	FUNCTION DECODE_STRING;
	
	FUNCTION USINT_TO_STRING;
	FUNCTION SINT_TO_STRING;
	FUNCTION UINT_TO_STRING;
	FUNCTION INT_TO_STRING;
	
	FUNCTION STRING_TO_USINT;
	FUNCTION STRING_TO_SINT;
	FUNCTION STRING_TO_UINT;
	FUNCTION STRING_TO_INT;
	
	
	TYPE
		STRING_ENCODING : (
			ASCII,    // 7-Bit US-ASCII (American Standard Code FOR Information Interchange)
			ISO8859_1 // 8-Bit ISO 8859-1 (Latin-1; Western-Europe)
		);
	END_TYPE
END_INTERFACE


IMPLEMENTATION
	FUNCTION CONCAT3 : STRING[254]
		VAR_INPUT
			in1 : STRING[254];
			in2 : STRING[254];
			in3 : STRING[254];
		END_VAR
		
		CONCAT3 := CONCAT(CONCAT(in1, in2), in3);
	END_FUNCTION
	
	FUNCTION CONCAT4 : STRING[254]
		VAR_INPUT
			in1 : STRING[254];
			in2 : STRING[254];
			in3 : STRING[254];
			in4 : STRING[254];
		END_VAR
		
		CONCAT4 := CONCAT(CONCAT(CONCAT(in1, in2), in3), in4);
	END_FUNCTION
	
	FUNCTION CONCAT5 : STRING[254]
		VAR_INPUT
			in1 : STRING[254];
			in2 : STRING[254];
			in3 : STRING[254];
			in4 : STRING[254];
			in5 : STRING[254];
		END_VAR
		
		CONCAT5 := CONCAT(CONCAT(CONCAT(CONCAT(in1, in2), in3), in4), in5);
	END_FUNCTION
	
	FUNCTION CONCAT6 : STRING[254]
		VAR_INPUT
			in1 : STRING[254];
			in2 : STRING[254];
			in3 : STRING[254];
			in4 : STRING[254];
			in5 : STRING[254];
			in6 : STRING[254];
		END_VAR
		
		CONCAT6 := CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(in1, in2), in3), in4), in5), in6);
	END_FUNCTION
	
	FUNCTION CONCAT7 : STRING[254]
		VAR_INPUT
			in1 : STRING[254];
			in2 : STRING[254];
			in3 : STRING[254];
			in4 : STRING[254];
			in5 : STRING[254];
			in6 : STRING[254];
			in7 : STRING[254];
		END_VAR
		
		CONCAT7 := CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(in1, in2), in3), in4), in5), in6), in7);
	END_FUNCTION
	
	FUNCTION CONCAT8 : STRING[254]
		VAR_INPUT
			in1 : STRING[254];
			in2 : STRING[254];
			in3 : STRING[254];
			in4 : STRING[254];
			in5 : STRING[254];
			in6 : STRING[254];
			in7 : STRING[254];
			in8 : STRING[254];
		END_VAR
		
		CONCAT8 := CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(in1, in2), in3), in4), in5), in6), in7), in8);
	END_FUNCTION
	
	FUNCTION CONCAT9 : STRING[254]
		VAR_INPUT
			in1 : STRING[254];
			in2 : STRING[254];
			in3 : STRING[254];
			in4 : STRING[254];
			in5 : STRING[254];
			in6 : STRING[254];
			in7 : STRING[254];
			in8 : STRING[254];
			in9 : STRING[254];
		END_VAR
		
		CONCAT9 := CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(in1, in2), in3), in4), in5), in6), in7), in8), in9);
	END_FUNCTION
	
	
	// Returns TRUE if given string in first parameter starts with given string in second parameter.
	// This function is case-sensitive.
	FUNCTION STRING_STARTSWITH : BOOL
		VAR_INPUT
			in1 : STRING[254];
			in2 : STRING[254];
		END_VAR
		
		VAR_TEMP
			in1_len : INT;
			in2_len : INT;
		END_VAR
		
		in1_len := LEN(in1);
		in2_len := LEN(in2);
		
		IF in1_len < in2_len THEN
			STRING_STARTSWITH := FALSE;
		ELSE
			STRING_STARTSWITH := LEFT(in1, in2_len) = in2;
		END_IF;
	END_FUNCTION
	
	// Returns TRUE if given string in first parameter ends with given string in second parameter.
	// This function is case-sensitive.
	FUNCTION STRING_ENDSWITH : BOOL
		VAR_INPUT
			in1 : STRING[254];
			in2 : STRING[254];
		END_VAR
		
		VAR_TEMP
			in1_len : INT;
			in2_len : INT;
		END_VAR
		
		in1_len := LEN(in1);
		in2_len := LEN(in2);
		
		IF in1_len < in2_len THEN
			STRING_ENDSWITH := FALSE;
		ELSE
			STRING_ENDSWITH := RIGHT(in1, in2_len) = in2;
		END_IF;
	END_FUNCTION
	
	
	// Compares two strings lexicographically (based on the ISO 8859-1 / Latin 1 representation).
	// Returns 0 if the both strings are equal, a negative value if string 1 is less than the string 2 or a positive value if string 1 is greater than string 2.
	// This function is case-sensitive.
	FUNCTION COMPARE_STRINGS : INT
		VAR_INPUT
			in1 : STRING[254];
			in2 : STRING[254];
		END_VAR
		
		VAR_TEMP
			in1_len : INT;
			in2_len : INT;
			i : DINT;
			i_end : INT;
		END_VAR
		
		in1_len := LEN(in1);
		in2_len := LEN(in2);
		
		i_end := MIN(in1_len, in2_len);
		
		FOR i := 0 TO i_end DO
			IF in1[i] <> in2[i] THEN
				COMPARE_STRINGS := BYTE_TO_INT(in1[i]) - BYTE_TO_INT(in2[i]);
				RETURN;
			END_IF;
		END_FOR;
		
		COMPARE_STRINGS := in1_len - in2_len;
	END_FUNCTION
	
	
	// Pads given string to specified length with given padding (from the left).
	// If original string's length is already equal or greater than required length, it will be returned unchanged.
	FUNCTION PAD_STRING_LEFT : STRING[254]
		VAR_INPUT
			in : STRING[254];
			length_req : USINT;
			padding : STRING;
		END_VAR
		
		VAR_TEMP
			in_len : INT;
			out : STRING[254];
			out_len : INT;
		END_VAR
		
		in_len := LEN(in);
		
		IF in_len >= length_req THEN
			PAD_STRING_LEFT := in;
			RETURN;
		END_IF;
		
		out := in;
		out_len := LEN(out);
		
		WHILE out_len < length_req DO
			out := CONCAT(padding, out);
			out_len := LEN(out);
		END_WHILE;
		
		IF out_len > length_req THEN
			out := RIGHT(out, length_req);
		END_IF;
		
		PAD_STRING_LEFT := out;
	END_FUNCTION
	
	// Pads given string to specified length with given padding (from the right).
	// If original string's length is already equal or greater than required length, it will be returned unchanged.
	FUNCTION PAD_STRING_RIGHT : STRING[254]
		VAR_INPUT
			in : STRING[254];
			length_req : USINT;
			padding : STRING;
		END_VAR
		
		VAR_TEMP
			in_len : INT;
			out : STRING[254];
			out_len : INT;
		END_VAR
		
		in_len := LEN(in);
		
		IF in_len >= length_req THEN
			PAD_STRING_RIGHT := in;
			RETURN;
		END_IF;
		
		out := in;
		out_len := LEN(out);
		
		WHILE out_len < length_req DO
			out := CONCAT(out, padding);
			out_len := LEN(out);
		END_WHILE;
		
		IF out_len > length_req THEN
			out := LEFT(out, length_req);
		END_IF;
		
		PAD_STRING_RIGHT := out;
	END_FUNCTION
	
	
	// Encodes given string into given BYTE array using given encoding.
	// If target array is too small, given string will be cut. If target array is too large, remaining bytes will be set to NULL (0).
	FUNCTION ENCODE_STRING : VOID
		VAR_INPUT
			in : STRING[254];
			encoding : STRING_ENCODING;
		END_VAR
		
		VAR_IN_OUT
			out : ARRAY[..] OF BYTE;
		END_VAR
		
		VAR_TEMP
			in_len : INT;
			out_len : DINT;
			out_start : DINT;
			out_end : DINT;
			i : DINT;
		END_VAR
		
		in_len := LEN(in);
		
		out_start := _firstIndexOf(out);
		out_end := _lastIndexOf(out);
		out_len := out_end - out_start + 1;
		
		FOR i := 1 TO out_len DO
			IF i > in_len THEN
				out[out_start + i - 1] := 0; // NULL
			ELSIF encoding = ASCII AND in[i] > 127 THEN
				out[out_start + i - 1] := 63; // Questionmark '?'
			ELSE	
				out[out_start + i - 1] := in[i];
			END_IF;
		END_FOR;
	END_FUNCTION
	
	// Decodes given BYTE array to a string using given encoding. Decoding stops on first NULL (0; if present).
	// If source array is bigger than 254 bytes, returned string will be cut to string's max. length of 254.
	FUNCTION DECODE_STRING : STRING[254]
		VAR_INPUT
			in : ARRAY[..] OF BYTE;
			encoding : STRING_ENCODING;
		END_VAR
		
		VAR_TEMP
			out : STRING[254];
			in_start : DINT;
			in_end : DINT;
			i_in : DINT;
			i_out : DINT;
		END_VAR
		
		in_start := _firstIndexOf(in);
		in_end := _lastIndexOf(in);
		
		FOR i_in := in_start TO in_end DO
			i_out := i_in - in_start + 1;
			
			IF in[i_in] = 0 OR i_out > 254 THEN
				DECODE_STRING := LEFT(out, DINT_TO_INT(i_out -1));
				RETURN;
			ELSIF encoding = ASCII AND in[i_in] > 127 THEN
				out[i_out] := 63; // Questionmark '?'
			ELSE	
				out[i_out] := in[i_in];
			END_IF;
		END_FOR;
		
		DECODE_STRING := LEFT(out, DINT_TO_INT(i_out));
	END_FUNCTION
	
	
	FUNCTION USINT_TO_STRING : STRING[3]
		VAR_INPUT
			in : USINT;
		END_VAR
		
		USINT_TO_STRING := UDINT_TO_STRING(USINT_TO_UDINT(in));
	END_FUNCTION
	
	FUNCTION SINT_TO_STRING : STRING[4]
		VAR_INPUT
			in : SINT;
		END_VAR
		
		SINT_TO_STRING := DINT_TO_STRING(SINT_TO_DINT(in));
	END_FUNCTION
	
	FUNCTION UINT_TO_STRING : STRING[5]
		VAR_INPUT
			in : UINT;
		END_VAR
		
		UINT_TO_STRING := UDINT_TO_STRING(UINT_TO_UDINT(in));
	END_FUNCTION
	
	FUNCTION INT_TO_STRING : STRING[6]
		VAR_INPUT
			in : INT;
		END_VAR
		
		INT_TO_STRING := DINT_TO_STRING(INT_TO_DINT(in));
	END_FUNCTION
	
	
	FUNCTION STRING_TO_USINT : USINT
		VAR_INPUT
			in : STRING[3];
		END_VAR
		
		STRING_TO_USINT := UDINT_TO_USINT(STRING_TO_UDINT(in));
	END_FUNCTION
	
	FUNCTION STRING_TO_SINT : SINT
		VAR_INPUT
			in : STRING[4];
		END_VAR
		
		STRING_TO_SINT := DINT_TO_SINT(STRING_TO_DINT(in));
	END_FUNCTION
	
	FUNCTION STRING_TO_UINT : UINT
		VAR_INPUT
			in : STRING[5];
		END_VAR
		
		STRING_TO_UINT := UDINT_TO_UINT(STRING_TO_UDINT(in));
	END_FUNCTION
	
	FUNCTION STRING_TO_INT : INT
		VAR_INPUT
			in : STRING[6];
		END_VAR
		
		STRING_TO_INT := DINT_TO_INT(STRING_TO_DINT(in));
	END_FUNCTION
END_IMPLEMENTATION
