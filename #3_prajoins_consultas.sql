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

--EJERCICIO #4
SELECT 
    e.employee_id AS 'Emp_Id',
    e.last_name AS 'Employee',
    m.employee_id AS 'Mgr_Id',
    m.last_name AS 'Manager'
FROM 
    employees e
JOIN 
    employees m
ON 
    e.manager_id = m.employee_id;

-- EMP_ID	EMPLOYEE	MGR_ID	MANAGER
-- 101	    Kochhar	    100	    King
-- 102	    De Haan	    100	    King
-- 103	    Hunold	    102	    De Haan
-- 104	    Ernst	    103	    Hunold
-- 105	    Austin	    103	    Hunold

-- EJERCICIO #5
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date
FROM 
    employees e
JOIN 
    employees davies
ON 
    davies.last_name = 'Jones'
WHERE 
    davies.hire_date < e.hire_date;

-- FIRST_NAME	LAST_NAME	HIRE_DATE
-- Alana	    Walsh	    1987-09-21
-- Kevin	    Feeney	    1987-09-22
-- Donald	    OConnell	1987-09-23
-- Douglas	    Grant	    1987-09-24
-- Jennifer	    Whalen	    1987-09-25
-- Michael	    Hartstein	1987-09-26

-- EJERCICIO #6
SELECT 
    department_name AS 'Department Name',
    COUNT(*) AS 'No of Employees'
FROM 
    departments
INNER JOIN 
    employees
ON 
    employees.department_id = departments.department_id
GROUP BY 
    departments.department_id, department_name
ORDER BY 
    department_name;

-- DEPARTMENT NAME	    NO OF EMPLOYEES
-- Accounting	        2
-- Administration	    1
-- Executive	        3
-- Finance	            6
-- Human Resources	    1
-- IT	                5
-- Marketing	        2
-- Public Relations	    1
-- Purchasing	        6
-- Sales	            34
-- Shipping	            45

-- EJERCICIO #7
SELECT 
    employee_id,
    job_title,
    (julianday(end_date) - julianday(start_date)) AS Days
FROM 
    job_history
NATURAL JOIN 
    jobs
WHERE 
    department_id = 90;


-- EMPLOYEE_ID	JOB_TITLE	                DAYS
-- 200	        Administration Assistant	2100.0
-- 200	        Public Accountant	        1644.0

-- EJERCICIO #8
SELECT 
    d.department_id,
    d.department_name,
    d.manager_id,
    e.first_name
FROM 
    departments d
INNER JOIN 
    employees e
ON 
    d.manager_id = e.employee_id;

-- DEPARTMENT_ID	DEPARTMENT_NAME	    MANAGER_ID	FIRST_NAME
-- 10	            Administration	    200	        Jennifer
-- 20	            Marketing	        201	        Michael
-- 30	            Purchasing	        114	        Den
-- 40	            Human Resources	    203	        Susan
-- 50	            Shipping	        121	        Adam
-- 60	            IT	                103	        Alexander
-- 70	            Public Relations	204	        Hermann
-- 80	            Sales	            145	        John
-- 90	            Executive	        100	        Steven
-- 100	            Finance	            108	        Nancy
-- 110	            Accounting	        205	        Shelley

-- EJERCICIO #9
SELECT 
    d.department_name,
    e.first_name,
    l.city
FROM 
    departments d
JOIN 
    employees e
ON 
    d.manager_id = e.employee_id
JOIN 
    locations l 
USING (location_id);

-- DEPARTMENT_NAME	    FIRST_NAME	CITY
-- Administration	    Jennifer	Seattle
-- Marketing	        Michael	    Toronto
-- Purchasing	        Den	        Seattle
-- Human Resources	    Susan   	London
-- Shipping	            Adam	    South San Francisco
-- IT	                Alexander	Southlake
-- Public Relations	    Hermann 	Munich
-- Sales	            John	    Oxford
-- Executive	        Steven	    Seattle
-- Finance	            Nancy   	Seattle
-- Accounting	        Shelley 	Seattle

-- EJERCICIO #10
SELECT 
    job_title,
    AVG(salary) AS Avg_Salary
FROM 
    employees
NATURAL JOIN 
    jobs
GROUP BY 
    job_title;

-- JOB_TITLE	                    AVG_SALARY
-- Accountant	                    7920.0
-- Accounting Manager	            12000.0
-- Administration Assistant	        4400.0
-- Administration Vice President	17000.0
-- Finance Manager	                12000.0

-- EJERCICIO #11
SELECT 
    j.JOB_TITLE ,
    e.first_name,
    (e.salary - j.min_salary) AS 'Salary - Min_Salary'
FROM 
    employees e
JOIN 
    jobs j
ON 
    e.job_id = j.job_id;

-- JOB_TITLE	                    FIRST_NAME	SALARY - MIN_SALARY
-- President	                    Steven      4000.0
-- Administration Vice President	Neena	    2000.0
-- Administration Vice President	Lex	        2000.0
-- Programmer	                    Alexander	5000.0
-- Programmer	                    Bruce	    2000.0
-- Programmer	                    David	    800.0

-- EJERCICIO #12
SELECT 
    jh.*
FROM 
    job_history jh
JOIN 
    employees e
ON 
    jh.employee_id = e.employee_id
WHERE 
    e.salary > 10000;

-- EMPLOYEE_ID	START_DATE	END_DATE	JOB_ID	    DEPARTMENT_ID
-- 102	        1993-01-13	1998-07-24	IT_PROG	    60
-- 101	        1989-09-21	1993-10-27	AC_ACCOUNT	110
-- 101	        1993-10-28	1997-03-15	AC_MGR	    110
-- 201	        1996-02-17	1999-12-19	MK_REP  	20
-- 114          1998-03-24	1999-12-31	ST_CLERK	50

-- EJERCICIO #13
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    e.salary,
    ((julianday('now') - julianday(e.hire_date)) / 365) AS Experience
FROM 
    departments d
JOIN 
    employees e
ON 
    d.manager_id = e.employee_id
WHERE 
    ((julianday('now') - julianday(e.hire_date)) / 365) > 15;

-- FIRST_NAME	LAST_NAME	HIRE_DATE	SALARY	EXPERIENCE
-- Jennifer	    Whalen	    1987-09-25	4400.0	36.62130626797906
-- Michael	    Hartstein	1987-09-26	13000.0	36.61856654195166
-- Den      	Raphaely	1987-07-01	11000.0	36.85692270633522
-- Susan    	Mavris	    1987-09-28	6500.0	36.613087089896865
-- Adam	        Fripp	    1987-07-08	8200.0	36.83774462414344
-- Alexander	Hunold	    1987-06-20	9000.0	36.88705969263659
-- Hermann  	Baer	    1987-09-29	10000.0	36.610347363869465
-- John	        Russell	    1987-08-01	14000.0	36.7719911994859
-- Steven	    King	    1987-06-17	24000.0	36.89527887071878
-- Nancy	    Greenberg	1987-06-25	12000.0	36.873361062499605
-- Shelley	    Higgins	    1987-09-30	12000.0	36.60760763784207

-- PORPUESTAS DE AJUSTE A UN ESCEARIO FAMILIAR

-- Ejercicio 1: Localización de eventos familiares
--  Contexto: Ubicación de lugares donde se han celebrado eventos familiares importantes como cumpleaños, aniversarios o reuniones.
--  Consulta: Seleccionar la dirección y la ciudad de lugares donde se han celebrado eventos recientes.
-- Ejercicio 2: Asignación de tareas domésticas
--  Contexto: Distribución de tareas domésticas por persona.
--  Consulta: Listar qué miembro de la familia es responsable de qué tarea en la casa, mostrando también el departamento (área de la casa) asignado.
-- Ejercicio 3: Seguimiento de ubicaciones de eventos familiares
--  Contexto: Asignar ubicaciones a eventos familiares, como reuniones, celebraciones, etc.
--  Consulta: Mostrar quién organizó el evento, en qué parte de la casa fue, y detalles adicionales.
-- Ejercicio 4: Jerarquía familiar
--  Contexto: Estructura familiar, mostrando la relación entre los miembros (padres e hijos).
--  Consulta: Quién es el padre/madre y quiénes son los hijos en la estructura familiar.
-- Ejercicio 5: Historial laboral dentro del hogar
--  Contexto: Quién ha asumido ciertas responsabilidades en el hogar con el tiempo.
--  Consulta: Seleccionar miembros de la familia que han asumido responsabilidades después de otros miembros.
-- Ejercicio 6: Conteo de actividades por persona
--  Contexto: Contabilizar cuántas actividades diferentes ha organizado o participado cada miembro de la familia.
--  Consulta: Cuántas actividades ha organizado cada persona y ordenar por el nombre del miembro.
-- Ejercicio 7: Duración de proyectos familiares
--  Contexto: Duración de proyectos o tareas específicas realizadas por la familia.
--  Consulta: Calcular cuántos días duró cada proyecto o tarea importante.
-- Ejercicio 8: Administradores de tareas familiares
--  Contexto: Quién es responsable de la administración o supervisión de áreas específicas en el hogar.
--  Consulta: Mostrar el responsable de cada área del hogar.
-- Ejercicio 9: Administradores de eventos por ubicación
--  Contexto: Quién está a cargo de organizar eventos en diferentes lugares del hogar.
--  Consulta: Listar quién organiza los eventos en cada área de la casa y en qué ciudad (en caso de tener varias propiedades).
-- Ejercicio 10: Salario de bolsillo por responsabilidades
--  Contexto: Calculo de "salario" o asignación de bolsillo basado en las responsabilidades de cada miembro de la familia.
--  Consulta: Promedio de dinero asignado por tipo de responsabilidad.
-- Ejercicio 11: Comparación de asignaciones
--  Contexto: Comparar la asignación de dinero de cada miembro con el mínimo establecido para esa tarea.
--  Consulta: Mostrar la diferencia entre la asignación recibida y el mínimo establecido.
-- Ejercicio 12: Historial de asignaciones mayores
--  Contexto: Seguimiento de las asignaciones más significativas o que superan un cierto umbral.
--  Consulta: Mostrar historial de tareas o responsabilidades que tuvieron una alta asignación.
-- Ejercicio 13: Experiencia en tareas
--  Contexto: Años de experiencia de cada miembro en ciertas tareas o responsabilidades en el hogar.
--  Consulta: Mostrar cuántos años ha estado cada persona a cargo de ciertas tareas importantes.