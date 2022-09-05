--1--
SELECT  bird_id
FROM birds
WHERE bird_name = 'Great Blue Heron';

SELECT food_id
FROM birds_food
WHERE bird_id IN (SELECT bird_id FROM birds WHERE bird_name = 'Great Blue Heron');

SELECT bird_name,f.food_name
FROM birds b
INNER JOIN birds_food bf ON b.bird_id = bf.bird_id
INNER JOIN food f ON f.food_id = bf.food_id 
WHERE f.food_id IN (SELECT bf.food_id
                  FROM birds_food
                  WHERE bf.bird_id IN (SELECT b.bird_id
                                    FROM birds
                                    WHERE b.bird_name = 'Great Blue Heron'));

--2--
select food_id
FROM food
WHERE food_name = 'Fish';

SELECT bird_id
FROM birds_food
WHERE food_id IN (select food_id FROM food WHERE food_name = 'Fish');

SELECT bird_id, bird_name
FROM birds
WHERE bird_id IN (SELECT bird_id
                  FROM birds_food
                  WHERE food_id IN (select food_id
                                    FROM food
                                    WHERE food_name = 'Fish'));
                                    
--3--
SELECT migration_id
FROM migration
WHERE migration_location='South America';

SELECT bird_id
FROM birds_migration
WHERE migration_id IN (SELECT migration_id
                        FROM migration
                        WHERE migration_location='South America');
                        
SELECT bird_id, bird_name
FROM birds
WHERE bird_id IN (SELECT bird_id
                  FROM birds_migration
                  WHERE migration_id IN (SELECT migration_id
                                         FROM migration
                                         WHERE migration_location='South America'));
                                         
                                         
--4--
SELECT food_id
FROM food
WHERE food_name = 'Fish';

SELECT bird_id
FROM birds_food
WHERE food_id IN (SELECT food_id
                  FROM food
                  WHERE food_name = 'Fish');

SELECT bird_id, bird_name
FROM birds
WHERE wingspan < 30
AND bird_id IN (SELECT bird_id
                FROM birds_food
                WHERE food_id IN (SELECT food_id
                                  FROM food
                                  WHERE food_name = 'Fish'));
                                  
--5--
SELECT bird_id
FROM birds_food
WHERE food_id IN (SELECT food_id
                  FROM food
                  WHERE food_name = 'Fish');

SELECT b.bird_name,
f.food_name,
n.nest_name
FROM birds b
INNER JOIN birds_food bf ON bf.bird_id = b.bird_id
INNER JOIN food f ON f.food_id = bf.food_id
INNER JOIN birds_nests bn ON bn.bird_id = b.bird_id
INNER JOIN nests n ON n.nest_id = bn.nest_id
ORDER BY b.bird_id;
--WHERE b.bird_id IN (SELECT bf.bird_id
 --                 FROM birds_food
  --                WHERE bf.food_id IN (SELECT f.food_id
   --                                 FROM food
     --                               WHERE f.food_name = 'Fish'))
--AND b.nest_builder = 'B';

SELECT nest_id
FROM birds_nests
WHERE bird_id IN (SELECT bird_id
                  FROM birds_food
                  WHERE food_id IN (SELECT food_id
                                    FROM food
                                    WHERE food_name = 'Fish'));
                                    
SELECT b.bird_name,
f.food_name,
n.nest_name
FROM birds b
INNER JOIN birds_nests bn ON b.bird_id = bn.bird_id
INNER JOIN nests n ON n.nest_id = bn.nest_id
INNER JOIN birds_food bf ON b.bird_id = bf.bird_id
INNER JOIN food f ON f.food_id = bf.food_id 
WHERE f.food_name = 'Fish' AND n.nest_name = 'Platform Nest';

