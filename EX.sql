--
-------------ex6------------------------
--
--CREATE OR REPLACE PACKAGE types_package
--AS
--  TYPE list_of_orders
--    IS TABLE OF online_store_CG.game_id%type;
--END;
--/
--CREATE OR REPLACE PROCEDURE get_game_types (game_indexes OUT types_package.list_of_orders, publisher_id_check IN online_store_cg.publisher_id%type )
--IS 
--BEGIN
--    SELECT game_id
--       BULK COLLECT INTO game_indexes
--       FROM games_cg
--     WHERE publisher_id = publisher_id_check;
--END;
--/
--DECLARE
--  list_order_indexes types_package.list_of_orders;
--BEGIN
--  get_game_types(list_order_indexes, 2);     
--  DBMS_OUTPUT.put_line ('Comenzile catre banca de sange cu id 2 sunt:');
--   FOR indx IN list_order_indexes.FIRST .. list_order_indexes.LAST
--   LOOP
--      DBMS_OUTPUT.put_line (list_order_indexes (indx));
--   END LOOP;
--END;
--/
--
--
----------------ex 7-----------------
--DECLARE
--    CURSOR c IS 
--        SELECT users_cg.nickname as nickname
--            FROM users_CG
--            join invoices_cg
--            on users_CG.user_id = invoices_cg.user_id
--            JOIN online_store_CG
--            on invoices_CG.registration_id = online_store_CG.registration_id
--            JOIN games_CG
--            on online_store_CG.game_id = games_CG.game_id
--            group by users_CG.nickname;
--BEGIN
--    FOR i in c LOOP
--      DBMS_OUTPUT.PUT_LINE(i.nickname);
--    END LOOP;
--END;
--/
--
--
-----------------ex8---------------------------
--
-- CREATE OR REPLACE FUNCTION price_by_location (locationId number)
-- RETURN number IS
--    total number(2):=0;
--BEGIN 
--    SELECT SUM(online_store_cg.price) into total
--    FROM games_CG 
--    JOIN online_store_cg
--    on online_store_cg.game_id = games_cg.game_id
--    JOIN publishers_cg 
--    on games_cg.publisher_id = publishers_cg.publisher_id  
--    where locationID = publishers_cg.location_id;
--    RETURN total;
--    
--EXCEPTION  
--   WHEN no_data_found THEN  
--        if locationId is null then
--             raise_application_error(-10403, 'locationId argument is null');
--        else
--             raise_application_error(-10403, 'locationId argument is invalid');
--      end if;  
--   WHEN others THEN  
--      dbms_output.put_line('Eroare!');    
--END;
--/
--
--
--DECLARE 
--    c number(2);
--BEGIN
--    c := price_by_location(2);
--    dbms_output.put_line('The price for games produces on location number 2 that are available in online store: ' || c);
--END;
--/
--
-------------ex9---------------------------

 
 CREATE OR REPLACE FUNCTION price_by_location (locationId number, userId number)
 RETURN number IS
    total number(2):=0;
BEGIN 
    SELECT SUM(online_store_cg.price) into total
    FROM users_cg
    JOIN invoices_cg 
    on invoices_cg.user_id = users_cg.user_id
    JOIN online_store_cg
    on online_store_cg.registration_id = invoices_cg.registration_id
    JOIN publishers_cg 
    on online_store_cg.publisher_id = publishers_cg.publisher_id
    JOIN locations_CG
    on locations_cg.location_id = publishers_cg.publisher_id
    where locationID = locations_cg.location_id and userId = users_cg.user_id;
    RETURN total;
    
EXCEPTION  
   WHEN no_data_found THEN  
        if locationId is null then
             raise_application_error(-10403, 'locationId argument is null');
        else  
             raise_application_error(-10403, 'locationId argument is invalid');        
        end if;
        if userId is null then
             raise_application_error(-10403, 'userId argument is null');
        else  
             raise_application_error(-10403, 'userId argument is invalid');        
        end if;
   WHEN others THEN  
      dbms_output.put_line('Eroare!');    
END;
/


DECLARE 
    c number(2);
BEGIN
    c := price_by_location(2,1);
    dbms_output.put_line('The price for games buyed by user 1' || chr(10) || 'produced on location number 2 that are available ' || chr(10) || 'in online store: ' || c);
END;
/

--
----------------------ex10------------------------
--
--CREATE OR REPLACE TRIGGER user_hours_updated 
--BEFORE DELETE OR INSERT OR UPDATE ON users_CG 
--DECLARE 
--   diff number; 
--BEGIN 
--   dbms_output.put_line('Hours played changed'); 
--END; 
--/ 
--
--
--UPDATE users_CG 
--SET hours_played = 1000
--WHERE user_id = '1';
--
--
--
--
----------------------ex11------------------------
--
--CREATE OR REPLACE TRIGGER display_price_changes 
--BEFORE DELETE OR INSERT OR UPDATE ON online_store_cg 
--FOR EACH ROW 
--DECLARE 
--   price_diff number; 
--BEGIN 
--   price_diff := :NEW.price  - :OLD.price; 
--   dbms_output.put_line('Old price: ' || :OLD.price); 
--   dbms_output.put_line('New price: ' || :NEW.price); 
--   dbms_output.put_line('Price difference: ' || price_diff); 
--END; 
--/ 
--
--
--UPDATE online_store_cg 
--SET price = 120
--WHERE game_id = '14';
--
--
-------------ex12--------------
--
--CREATE or REPLACE TRIGGER safety  
--BEFORE DROP or ALTER on SCHEMA
--BEGIN   
--   dbms_output.put_line('You must disable Trigger "safety" to drop or alter tables!');   
--   ROLLBACK;
--END;
--/
--
--DROP TABLE users_cg;
--
--SELECT * FROM users_cg;


-------------ex13---------------------
------package specification
CREATE OR REPLACE PACKAGE sgbd_package AS 
   PROCEDURE get_game_types(game_indexes OUT types_package.list_of_orders, publisher_id_check IN online_store_cg.publisher_id%type ); 
   CURSOR c;
   FUNCTION price_by_location (locationId number)
   FUNCTION price_by_location (locationId number, userId number);
END sgbd_package; 
/ 
------package body

CREATE OR REPLACE PACKAGE sgbd_package AS 
   PROCEDURE get_game_types (game_indexes OUT types_package.list_of_orders, publisher_id_check IN online_store_cg.publisher_id%type )
    IS 
    BEGIN
    SELECT game_id
       BULK COLLECT INTO game_indexes
       FROM games_cg
     WHERE publisher_id = publisher_id_check;
    END;

    CURSOR c IS 
        SELECT users_cg.nickname as nickname
            FROM users_CG
            join invoices_cg
            on users_CG.user_id = invoices_cg.user_id
            JOIN online_store_CG
            on invoices_CG.registration_id = online_store_CG.registration_id
            JOIN games_CG
            on online_store_CG.game_id = games_CG.game_id
            group by users_CG.nickname;
    BEGIN
        FOR i in c LOOP
          DBMS_OUTPUT.PUT_LINE(i.nickname);
        END LOOP;
    END;

   FUNCTION price_by_location (locationId number)
        RETURN number IS
            total number(2):=0;
        BEGIN 
            SELECT SUM(online_store_cg.price) into total
            FROM games_CG 
            JOIN online_store_cg
            on online_store_cg.game_id = games_cg.game_id
            JOIN publishers_cg 
            on games_cg.publisher_id = publishers_cg.publisher_id  
            where locationID = publishers_cg.location_id;
            RETURN total;
            
        EXCEPTION  
           WHEN no_data_found THEN  
                if locationId is null then
                     raise_application_error(-10403, 'locationId argument is null');
                else
                     raise_application_error(-10403, 'locationId argument is invalid');
              end if;  
           WHEN others THEN  
              dbms_output.put_line('Eroare!');    
   END;
   
   PROCEDURE price_by_location (locationId number, userId number)
   RETURN number IS
    total number(2):=0;
    BEGIN 
        SELECT SUM(online_store_cg.price) into total
        FROM users_cg
        JOIN invoices_cg 
        on invoices_cg.user_id = users_cg.user_id
        JOIN online_store_cg
        on online_store_cg.registration_id = invoices_cg.registration_id
        JOIN publishers_cg 
        on online_store_cg.publisher_id = publishers_cg.publisher_id
        JOIN locations_CG
        on locations_cg.location_id = publishers_cg.publisher_id
        where locationID = locations_cg.location_id and userId = users_cg.user_id;
        RETURN total;
        
    EXCEPTION  
       WHEN no_data_found THEN  
            if locationId is null then
                 raise_application_error(-10403, 'locationId argument is null');
            else  
                 raise_application_error(-10403, 'locationId argument is invalid');        
            end if;
            if userId is null then
                 raise_application_error(-10403, 'userId argument is null');
            else  
                 raise_application_error(-10403, 'userId argument is invalid');        
            end if;
       WHEN others THEN  
          dbms_output.put_line('Eroare!');    
    END;
    
END sgbd_package; 
/
