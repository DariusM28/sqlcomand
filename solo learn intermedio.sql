#-----------------------------STRING----------------
# LOWER Y UPPER
# LOWER: brinda la cadena de cada dato en minusculas
Select lower(nom1)as snombres from salarios ;
#UPPER: brinda los nombres en mayusculas
SELECT upper(nom1)AS nombres from salarios;

# SUBSTRING : debuleve sieros letras Substring (tabla,desdeque caracter,cuantos caracteres)
SELECT substring(nom1,2,1)as n from salarios;
#REPLACE : REMPLAZA UN UNA CADENA REPLACE(TABLA,DATO,REMPLAZO)
SELECT frstname,edad, replace(city,'new york','NY')from people;

#funciones 
select concat(substring(frstname,1,1),':',upper(lastname))as nombre from people;

# CONUT(*) : CUENTA CUANTOS VALORES SE REPITE
# el group by : se utiliza el group para agruparlo los valores de city
select city,count(*)as cuantos from people
group by city  order by city desc;

Select nickname, max(score)as best from Scores
group by nickname order by best desc;

#----------------------------CASE---------------------------
/*
CASE: ES UNA CONDICINAL ; THEN: EL LO QUE SE HACE O SE CATEGORIZA
END : FINALIZA EL CAZO WHEN : COMO SE CUMPLA LA CONDICION
*/
SELECT frstname,lastname ,
CASE
	WHEN edad >=30 THEN 'RAGO  DE 30'
END AS CATEGORIA
FROM people;  
# MULTIPLES CASOS
SELECT frstname,lastname ,
CASE
	WHEN edad >=30 AND edad <=39 THEN 'RANGO  DE 30'#caso de un rango de 30a 39
    WHEN edad >=40 AND edad <=49 THEN 'RANGO  DE 40'#caso de un rango de 40 a 49
END AS CATEGORIA
FROM people;  
#ELSE O ESCEPCION : SI NO SE CUMPLE NINGUNA UNO POR DEFECTO
SELECT frstname,lastname ,
CASE
	WHEN edad >=30 AND edad <=39 THEN 'RANGO  DE 30'#caso de un rango de 30a 39
    WHEN edad >=40 AND edad <=49 THEN 'RANGO  DE 40'#caso de un rango de 40 a 49
	ELSE 'SIN RANGO'
END AS CATEGORIA
FROM people; 
/*
select firstname, lastname, salary,
case
	when salary >=0 AND salary <=1500 then salary *0.1
	when salary >=1501 AND salary <=2000 then salary *0.2
    else salary *0.3
end as tax
from Employees
ordery by lastname asc;
*/
# ejercicio
/*
insert into Employees 
(firstname, lastname, salary)
values
('Wang','Lee',1900)
('Greta','Wu',1200);

select id,firstname,lastname,salary from Employees
order by id desc;

*/
#--------------------foreign key-------------------------
CREATE TABLE PhoneNumbers (
  id int NOT NULL AUTO_INCREMENT,
  customer_id int NOT NULL,
  number varchar(55),
type varchar(55),
  PRIMARY KEY (id),
  FOREIGN KEY (customer_id) REFERENCES Customers(id)
);
#modificar un campo para que reciba valores unicos
ALTER table NOMBRETABLA
ADD UNIQUE (CAMPO);
/*
SELECT Books.name, Books.year, Authors.name as author 
from Books, Authors
where Books.author_id= Authors.id
order by author, year asc;

*/

/*
select A.name, count(B.id)as books from Books As B Right Join
Authors As A on B.author_id=A.id group by A.name order by
books desc;

Select name, year From Books where year>1900
union
select name, 2022 from new order by name asc


*/
