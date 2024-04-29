-- EJERCICIO #1
SELECT 
    location_id,
    street_address,
    city,   
    state_province,
    country_name
FROM 
    locations 
NATURAL JOIN 
    countries;

-- LOCATION_ID  ADDRESS_ID	                CITY                    STATE_PROVINCE      COUNTRY_NAME
-- 1000	        1297 Via Cola di Rie        Roma		                                Italy
-- 1100	        93091 Calle della Testa	    Venice		                                Italy
-- 1200	        2017 Shinjuku-ku	        Tokyo	                Tokyo Prefecture    Japan
-- 1300	        9450 Kamiya-cho	            Hiroshima		                            Japan
-- 1400	        2014 Jabberwocky Rd	        Southlake	            Texas	            United States of America
-- 1500	        2011 Interiors Blvd	        South San Francisco	    California	        United States of America
-- 1600	        2007 Zagora St	            South Brunswick	        New Jersey	        United States of America
-- 1700	        2004 Charade Rd	            Seattle	                Washington	        United States of America
-- 1800	        147 Spadina Ave	            Toronto	                Ontario	            Canada
-- 1900	        6092 Boxwood St	            Whitehorse	            Yukon	            Canada
-- 2000	        40-5-12 Laogianggen	        Beijing		                                China

-- EJERCICIO #2
SELECT 
    first_name,
    last_name,
    department_id,
    department_name
FROM 
    employees
JOIN 
    departments
USING 
    (department_id);

-- FIRST_NAME	LAST_NAME	DEPARTMENT_ID	DEPARTMENT_NAME 
-- Steven	    King    	90          	Executive
-- Neena	    Kochhar	    90	            Executive
-- Lex	        De Haan	    90	            Executive
-- Alexander	Hunold	    60	            IT
-- Bruce	    Ernst	    60	            IT
-- David	    Austin	    60	            IT
-- Valli	    Pataballa	60	            IT
-- Diana	    Lorentz	    60	            IT
-- Nancy	    Greenberg	100	            Finance
-- Daniel	    Faviet	    100	            Finance
-- John	        Chen	    100	            Finance
-- Ismael	    Sciarra	    100	            Finance

-- EJERCICIO #3
SELECT 
    e.first_name,
    e.last_name,
    e.job_id,
    e.department_id,
    d.department_name
FROM 
    employees e
JOIN 
    departments d
ON 
    e.department_id = d.department_id
JOIN 
    locations l
ON 
    d.location_id = l.location_id
;

-- FIRST_NAME	LAST_NAME	JOB_ID	DEPARTMENT_ID	DEPARTMENT_NAME
-- Steven	    King	    AD_PRES	90	            Executive
-- Neena	    Kochhar	    AD_VP	90	            Executive
-- Lex	        De Haan	    AD_VP	90	            Executive
-- Alexander	Hunold	    IT_PROG	60	            IT
-- Bruce	    Ernst	    IT_PROG	60	            IT