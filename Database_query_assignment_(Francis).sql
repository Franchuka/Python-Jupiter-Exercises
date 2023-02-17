CREATE TABLE teacher_list(
                 id bigserial,
                 school_name varchar,
                 last_name varchar,
                 first_name varchar,
                 hire_date date,
                 salary numeric);

INSERT INTO teacher_list(school_name, last_name, 
                         first_name,hire_date, salary)
                         
VALUES ('Aladumo private school', 'alan', 'john', '2012-10-12', 20000),
       ('Aladumo private school', 'adam', 'peters', '2009-06-22', 35000),
       ('Aladumo private school', 'aisha', 'fatir', '2015-06-22', 45000),
       ('brittlebrow private school', 'danny', 'peters', '2011-06-22', 15000),
       ('brittlebrow private school', 'pete', 'peters', '2012-06-22', 5000),
       ('cadmus private school', 'john', 'snow', '2013-06-22', 35000),
       ('cadmus private school', 'peter', 'parker', '2014-06-22', 30000),
       ('crovus private school', 'louis', 'lane','2015-06-22', 50000),
       ('crovus private school', 'kent', 'clark', '2004-06-22', 15000),
       ('crovus private school', 'wayne', 'bruce', '2005-06-22', 12000),
       ('eagle private school', 'stark', 'tony','2006-06-22', 11000),
       ('eagle private school', 'banner', 'bruce', '2007-06-22', 32000),
       ('Havard private school', 'thor', 'loki', '2008-06-22', 22000),
       ('Havard private school', 'silver', 'surfer', '2009-06-22', 38000),
       ('Havard private school', 'dead','pool', '2010-06-22', 35000),
       ('Havard private school', 'cena', 'john', '2011-06-22', 35000),
       ('postgres private school', 'peter', 'sabinus', '2012-06-22', 20000),
       ('progress private school', 'rey', 'mysterio', '2013-06-22', 25000),
       ('progress private school', 'hulk', 'hogan', '2014-06-22', 45000),
       ('Oxford private school', 'seth', 'rollins','2015-06-22', 45000),
       ('Oxford private school', 'uzumaki', 'naruto','2016-06-22', 35000),
       ('Towergate private school', 'sakura', 'chan', '2017-06-22', 35000), 
       ('Towergate private school', 'jirayai', 'sensei', '2018-06-22', 35000);

--Question 1
SELECT * 
FROM teacher_list 
ORDER BY 
        school_name, 
        last_name;
        
--Question 2
SELECT 
      last_name||' '||first_name
FROM  teacher_list
WHERE 
      last_name LIKE 's%' 
AND
      salary > 40000
      
--Question 3
SELECT 
        last_name,
        first_name, 
        hire_date, 
        salary
FROM 
        teacher_list
WHERE 
        hire_date > '2010-01-01'
ORDER BY 
        salary DESC 