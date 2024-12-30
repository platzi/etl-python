-- Ejercicio 1
SELECT * 
FROM actor
WHERE first_name LIKE 'A%'  -- Filtra actores cuyo primer nombre empieza con 'A'
;

-- Ejercicio 2
SELECT actor_id, 
       first_name, 
       last_name, 
       CONCAT(first_name, ' ', last_name) AS full_name
FROM actor
WHERE first_name LIKE 'A%';
       
-- Ejercicio 3    
SELECT actor_id, 
       first_name, 
       last_name, 
       CONCAT(first_name, ' ', last_name) AS full_name,  -- Concatenación de 'first_name' y 'last_name'
       CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length  -- Longitud de 'full_name'
FROM actor
WHERE first_name LIKE 'A%' -- Filtra actores cuyo primer nombre empieza con 'A'
;

-- Ejercicio 4
SELECT 
    actor_id,
    UPPER(first_name) AS first_name,
    UPPER(last_name) AS last_name,
    CONCAT(first_name, ' ', last_name) AS full_name, 
    CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length 
FROM actor
WHERE first_name LIKE 'A%' -- Asegura que el filtro también se aplique si es necesario
;

-- Ejercicio 5
SELECT 
    actor_id,
    UPPER(first_name) AS first_name,
    UPPER(last_name) AS last_name,
    CONCAT(first_name, ' ', last_name) AS full_name, 
    CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length 
FROM actor
WHERE first_name LIKE 'A%' 
HAVING name_length > 10;

-- Ejercicio 6
SELECT 
    actor_id,
    UPPER(first_name) AS first_name,
    UPPER(last_name) AS last_name,
    CONCAT(first_name, ' ', last_name) AS full_name, 
    CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length,
    YEAR(last_update) AS registration_year
FROM actor
WHERE first_name LIKE 'A%' 
HAVING name_length > 10;

-- Ejercicio 7
SELECT 
    last_name,
    COUNT(actor_id) AS total_actors
FROM actor
WHERE first_name LIKE 'A%' 
AND CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) > 10
GROUP BY last_name;

-- Ejercicio 8
SELECT 
    actor_id,
    UPPER(first_name) AS first_name,
    UPPER(last_name) AS last_name,
    last_update,
    CONCAT(first_name, ' ', last_name) AS full_name, 
    CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length,
    YEAR(last_update) AS registration_year,
    CASE 
        WHEN COUNT(*) OVER (PARTITION BY CONCAT(first_name, ' ', last_name)) = 1 THEN 'TRUE'
        ELSE 'FALSE'
    END AS is_unique_name
FROM actor
WHERE first_name LIKE 'A%' 
AND CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) > 10;

-- Ejercicio 9
SELECT 
    actor_id,
    UPPER(first_name) AS first_name,
    UPPER(last_name) AS last_name,
    last_update,
    CONCAT(first_name, ' ', last_name) AS full_name, 
    CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length,
    YEAR(last_update) AS registration_year,
    CASE 
        WHEN COUNT(*) OVER (PARTITION BY CONCAT(first_name, ' ', last_name)) = 1 THEN 'TRUE'
        ELSE 'FALSE'
    END AS is_unique_name,
    CASE 
        WHEN actor_id > 10 THEN 'Active'
        ELSE 'Inactive'
    END AS actor_status
FROM actor
WHERE first_name LIKE 'A%' 
AND CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) > 10;

-- Ejercicio 10
SELECT 
    actor_id,
    UPPER(first_name) AS first_name,
    UPPER(last_name) AS last_name,
    CONCAT(first_name, ' ', last_name) AS full_name, 
    CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length,
    YEAR(last_update) AS registration_year,
    CASE 
        WHEN COUNT(*) OVER (PARTITION BY CONCAT(first_name, ' ', last_name)) = 1 THEN 'TRUE'
        ELSE 'FALSE'
    END AS is_unique_name,
    CASE 
        WHEN actor_id > 10 THEN 'Active'
        ELSE 'Inactive'
    END AS actor_status
FROM actor
WHERE first_name LIKE 'A%' 
AND CHAR_LENGTH(CONCAT(first_name, ' ', last_name)) > 10;
