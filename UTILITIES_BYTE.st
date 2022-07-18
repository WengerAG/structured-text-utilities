UNIT UTILITIES_BYTE;

// This unit 'UTILITIES_BYTE' contains some common byte functions and types which are missing in standard library.
// Please check Git repository for updates from time to time.

INTERFACE
	USES UTILITIES_ARRAY;
	
	FUNCTION BYTES_TO_STRING;
	FUNCTION STRING_TO_BYTES;
	
	
	TYPE
		BINARY_ENCODING : (
			BASE64,    // Base 64 Encoding as specified by RFC 4648
			BASE64_URL // Base 64 URL Encoding as specified by RFC 4648
		);
	END_TYPE
	
	
	VAR_GLOBAL CONSTANT
		// This ARRAY is a lookup table that translates 6-bit positive integer index values into their "Base64 Alphabet" equivalents AS specified in "Table 1: The Base64 Alphabet" OF RFC 2045 (AND RFC 4648).
		toBase64 : ARRAY[0..63] OF BYTE := [
			 65,  66,  67,  68,  69,  70,  71,  72,  73,  74,  75,  76,  77, // 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
			 78,  79,  80,  81,  82,  83,  84,  85,  86,  87,  88,  89,  90, // 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
			 97,  98,  99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, // 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
			110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, // 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
			 48,  49,  50,  51,  52,  53,  54,  55,  56,  57,  43,  47       // '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
		];
		// This ARRAY is a lookup table for "URL and Filename safe Base64" as specified in Table 2 OF the RFC 4648, WITH the '+' AND '/' changed TO '-' AND '_'. This table is used when BASE64_URL is specified.
		toBase64URL : ARRAY[0..63] OF BYTE := [
			 65,  66,  67,  68,  69,  70,  71,  72,  73,  74,  75,  76,  77, // 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
			 78,  79,  80,  81,  82,  83,  84,  85,  86,  87,  88,  89,  90, // 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
			 97,  98,  99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, // 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
			110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, // 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
			 48,  49,  50,  51,  52,  53,  54,  55,  56,  57,  45,  95       // '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '-', '_'
		]; 
	END_VAR
END_INTERFACE


IMPLEMENTATION
	// Converts given BYTE array to a string using given encoding.
	// If source array is bigger than 252 bytes, returned string will be cut to string's max. length of 252.
	FUNCTION BYTES_TO_STRING : STRING[252]
		VAR_INPUT
			in : ARRAY[..] OF BYTE;
			encoding : BINARY_ENCODING;
		END_VAR
		
		VAR_TEMP
			out : STRING[252];
			in_start : DINT;
			in_end : DINT;
			in_byte1: BYTE;
			in_byte2: BYTE;
			in_byte3: BYTE;
			out_byte1: USINT;
			out_byte2: USINT;
			out_byte3: USINT;
			out_byte4: USINT;
			alphabet : ARRAY[0..63] OF BYTE;
			i_in : DINT;
			i_out : DINT := 1;
		END_VAR
		
		in_start := _firstIndexOf(in);
		in_end := _lastIndexOf(in);
		
		// select alphabet by given parameter (enum)
		IF encoding = BASE64 THEN
			alphabet := toBase64;
		ELSIF encoding = BASE64_URL THEN
			alphabet := toBase64URL;
		END_IF;
		
		// convert 3 bytes from source to 4 bytes encoded output
		FOR i_in := in_start TO in_end BY 3 DO
			// read 3 bytes from source
			in_byte1 := in[i_in];
			IF (i_in + 1) <= in_end THEN
				in_byte2 := in[i_in + 1];
			ELSE
				in_byte2 := 0;
			END_IF;
			IF (i_in + 2) <= in_end THEN
				in_byte3 := in[i_in + 2];
			ELSE
				in_byte3 := 0;
			END_IF;
			
			// calculate 4 result bytes
			out_byte1 := BYTE_TO_USINT(                                 SHR(in_byte1 & 2#11111100, 2)); //                           first 6 bits of byte 1 
			out_byte2 := BYTE_TO_USINT(SHL(in_byte1 & 2#00000011, 4) OR SHR(in_byte2 & 2#11110000, 4)); // last 2 bits of byte 1 and first 4 bits of byte 2
			out_byte3 := BYTE_TO_USINT(SHL(in_byte2 & 2#00001111, 2) OR SHR(in_byte3 & 2#11000000, 6)); // last 4 bits of byte 2 and first 2 bits of byte 3
			out_byte4 := BYTE_TO_USINT(    in_byte3 & 2#00111111                                     ); // last 6 bits of byte 3
			
			// convert result bytes using selected alphabet
			out[i_out    ] := alphabet[out_byte1];
			out[i_out + 1] := alphabet[out_byte2];
			out[i_out + 2] := alphabet[out_byte3];
			out[i_out + 3] := alphabet[out_byte4];
			
			// apply padding (if required)
			IF (i_in + 1) > in_end THEN
				out[i_out + 2] := 61; // padding character '='
			END_IF;
			IF (i_in + 2) > in_end THEN
				out[i_out + 3] := 61; // padding character '='
			END_IF;
			
			i_out := i_out + 4;
			IF i_out >= 252 THEN
				EXIT;
			END_IF;
		END_FOR;
		
		BYTES_TO_STRING := out;
	END_FUNCTION
	
	// Converts given string into given BYTE array using given encoding.
	// If target array is too small, given string will be cut. If target array is too large, remaining bytes will be set to NULL (0).
	FUNCTION STRING_TO_BYTES : VOID
		VAR_INPUT
			in : STRING[254];
			encoding : BINARY_ENCODING;
		END_VAR
		
		VAR_IN_OUT
			out : ARRAY[..] OF BYTE;
		END_VAR
		
		VAR_TEMP
			in_len : INT;
			out_len : DINT;
			out_start : DINT;
			out_end : DINT;
			in_char1: BYTE;
			in_char2: BYTE;
			in_char3: BYTE;
			in_char4: BYTE;
			in_byte1: USINT;
			in_byte2: USINT;
			in_byte3: USINT;
			in_byte4: USINT;
			out_byte1: BYTE;
			out_byte2: BYTE;
			out_byte3: BYTE;
			alphabet : ARRAY[0..63] OF BYTE;
			i_in : DINT;
			i_out : DINT;
		END_VAR
		
		in_len := LEN(in);
		
		out_start := _firstIndexOf(out);
		out_end := _lastIndexOf(out);
		out_len := out_end - out_start + 1;
		
		// select alphabet by given parameter (enum)
		IF encoding = BASE64 THEN
			alphabet := toBase64;
		ELSIF encoding = BASE64_URL THEN
			alphabet := toBase64URL;
		END_IF;
		
		// convert 4 bytes from source to 3 bytes decoded output
		i_out := out_start;
		FOR i_in := 1 TO in_len BY 4 DO
			// read 4 bytes from source
			in_char1 := in[i_in + 0];
			in_char2 := in[i_in + 1];
			IF (i_in + 2) <= in_len THEN
				in_char3 := in[i_in + 2];
			ELSE
				in_char3 := 61; // padding character '='
			END_IF;
			IF (i_in + 3) <= in_len THEN
				in_char4 := in[i_in + 3];
			ELSE
				in_char4 := 61; // padding character '='
			END_IF;
			
			// convert source bytes using selected alphabet
			in_byte1 := DINT_TO_USINT(GET_FIRST_INDEX_OF_BYTE_IN_ARRAY(in_char1, alphabet));
			in_byte2 := DINT_TO_USINT(GET_FIRST_INDEX_OF_BYTE_IN_ARRAY(in_char2, alphabet));
			IF in_char3 = 61 THEN
				in_byte3 := 0;
			ELSE
				in_byte3 := DINT_TO_USINT(GET_FIRST_INDEX_OF_BYTE_IN_ARRAY(in_char3, alphabet));
			END_IF;
			IF in_char4 = 61 THEN
				in_byte4 := 0;
			ELSE
				in_byte4 := DINT_TO_USINT(GET_FIRST_INDEX_OF_BYTE_IN_ARRAY(in_char4, alphabet));
			END_IF;
			
			// calculate 3 result bytes
			out_byte1 := SHL(USINT_TO_BYTE(in_byte1)             , 2) OR SHR(USINT_TO_BYTE(in_byte2) & 2#00110000, 4); // last 6 bits from byte 1 and first 2 bits from byte 2
			out_byte2 := SHL(USINT_TO_BYTE(in_byte2) & 2#00001111, 4) OR SHR(USINT_TO_BYTE(in_byte3) & 2#00111100, 2); // last 4 bits from byte 2 and first 4 bits from byte 3
			out_byte3 := SHL(USINT_TO_BYTE(in_byte3) & 2#00000011, 6) OR     USINT_TO_BYTE(in_byte4)                 ; // last 2 bits from byte 3 and first 6 bits from byte 4
			
			// write result bytes to output
			IF (i_out + 0) <= out_end THEN
				out[i_out + 0] := out_byte1;
			ELSE
				RETURN;
			END_IF;
			IF (i_out + 1) <= out_end THEN
				out[i_out + 1] := out_byte2;
			ELSE
				RETURN;
			END_IF;
			IF (i_out + 2) <= out_end THEN
				out[i_out + 2] := out_byte3;
			ELSE
				RETURN;
			END_IF;
			
			i_out := i_out + 3;
		END_FOR;
		
		// set remaining positions to NULL (0)
		FOR i_out := i_out TO out_end DO
			out[i_out] := 0;
		END_FOR;
	END_FUNCTION
END_IMPLEMENTATION
