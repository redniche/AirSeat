--�����߰�
CREATE SEQUENCE AIRPORT_SEQ_ID INCREMENT BY 1;
DECLARE
    L_INPUT VARCHAR2(4000) := '����,���,��õ,����,û��,����,�뱸,����,���,����,����,����,��õ,����,����';
	L_COUNT BINARY_INTEGER;
	L_ARRAY DBMS_UTILITY.LNAME_ARRAY;
BEGIN
	DBMS_UTILITY.COMMA_TO_TABLE(LIST => REGEXP_REPLACE(L_INPUT, '(^|,)', '\1x'), TABLEN => L_COUNT, TAB => L_ARRAY);
	DBMS_OUTPUT.PUT_LINE(L_COUNT);
	FOR I IN 1 .. L_COUNT
	LOOP
		DBMS_OUTPUT.PUT_LINE('AIRPORT_ID ' || TO_CHAR(I) || ' of array contains: ' || SUBSTR(L_ARRAY(I), 2));
		INSERT INTO AIRPORT VALUES
			(SUBSTR(L_ARRAY(I), 2));
		COMMIT;
	END LOOP;
END;
DROP SEQUENCE AIRCRAFT_SEQ_ID; 
DROP SEQUENCE SEAT_SEQ_ID; 
--�װ��� �߰�
CREATE SEQUENCE AIRCRAFT_SEQ_ID INCREMENT BY 1;
CREATE SEQUENCE SEAT_SEQ_ID INCREMENT BY 1;
DECLARE
    T_INPUT VARCHAR2(20) := 'CS_AIRCRAFT_';
    T_COUNT BINARY_INTEGER := 3;
BEGIN
	DBMS_OUTPUT.PUT_LINE(T_COUNT);
	FOR I IN 1 .. T_COUNT
	LOOP
		DBMS_OUTPUT.PUT_LINE('AIRCRAFT_ID ' || TO_CHAR(I) || ' of array contains: ' || CONCAT(T_INPUT, TO_CHAR(I)));
		INSERT INTO AIRCRAFT VALUES
			(CONCAT(T_INPUT, TO_CHAR(AIRCRAFT_SEQ_ID.NEXTVAL)));
		COMMIT;
	END LOOP;
END;


DROP SEQUENCE SEAT_SEQ_ID2; 
CREATE SEQUENCE SEAT_SEQ_ID2 INCREMENT BY 1;
DECLARE
    T_INPUT NUMBER := 4;
BEGIN
        DECLARE
            
            SB_INPUT VARCHAR2(20) := 'A,B,D,E';
            SB_COUNT BINARY_INTEGER;
            SB_ARRAY DBMS_UTILITY.LNAME_ARRAY;
        BEGIN
            DBMS_UTILITY.COMMA_TO_TABLE(LIST => REGEXP_REPLACE(SB_INPUT, '(^|,)', '\1x'), TABLEN => SB_COUNT, TAB => SB_ARRAY);
            DBMS_OUTPUT.PUT_LINE(SB_COUNT);
            FOR I IN 1 .. SB_COUNT
            LOOP
                FOR J IN 1 .. 3
                LOOP
                    DBMS_OUTPUT.PUT_LINE('SEAT_ID' || TO_CHAR(I) ||','|| TO_CHAR(J) || ' of array contains: ' || SUBSTR(SB_ARRAY(I), 2));
                    INSERT INTO SEAT VALUES
                        (SEAT_SEQ_ID2.NEXTVAL, T_INPUT, SUBSTR(SB_ARRAY(I), 2), TO_CHAR(J), 1, 0);
                    COMMIT;
                END LOOP;
            END LOOP;
        END;
        --�Ϲݼ� �߰�
        DECLARE
            S_INPUT VARCHAR2(20) := 'A,B,C,D,E,F';
            S_COUNT BINARY_INTEGER;
            S_ARRAY DBMS_UTILITY.LNAME_ARRAY;
        BEGIN
            DBMS_UTILITY.COMMA_TO_TABLE(LIST => REGEXP_REPLACE(S_INPUT, '(^|,)', '\1x'), TABLEN => S_COUNT, TAB => S_ARRAY);
            DBMS_OUTPUT.PUT_LINE(S_COUNT);
            FOR I IN 1 .. S_COUNT
            LOOP
                FOR J IN 1 .. 20
                LOOP
                    DBMS_OUTPUT.PUT_LINE('SEAT_ID' || TO_CHAR(I) ||','|| TO_CHAR(J) || ' of array contains: ' || SUBSTR(S_ARRAY(I), 2));
                    INSERT INTO SEAT VALUES
                        (SEAT_SEQ_ID2.NEXTVAL, T_INPUT, SUBSTR(S_ARRAY(I), 2), TO_CHAR(J), 0, 0);
                    COMMIT;
                END LOOP;
            END LOOP;
        END; 
END;


