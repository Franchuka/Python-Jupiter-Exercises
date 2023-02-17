 --Question_1
 
 CREATE TABLE animal_infos(
                id bigserial,
                animal_name varchar, 
                family varchar,
                number numeric);
                
 CREATE TABLE animal_characteristic(
                id bigserial,
                color varchar,
                weight numeric,
                age numeric,
                date_brought date );
--Question_2  

INSERT INTO animal_infos(animal_name, family, number)

VALUES ('Lion', 'Mammal', 4),
       ('Monkey','Primates', 20),
       ('Cobra', 'Reptile', 5),
       ('Peacock', 'Avian', 15),
       ('Zebra', 'Mammal', 10);
       
INSERT INTO animal_characteristic(color, weight, age, date_brought)

VALUES ('Yellow', '79', '10', '2019-10-12'),
       ('Brown', '30', '4', '2019-05-02'),
       ('Blue', '20', '10', '2018-11-25'),
       ('Black and White', '50', '8', '2017-10-21');