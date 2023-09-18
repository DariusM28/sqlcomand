#--------------------------VER TABLAS Y BASES DE DATOS---------
show databases;
show tables;
show columns from people; #muestra el tipo de dato de cada fila

#--------------------------OBTENER ALGUNOS CONJUNTOS DE DATOS------------
# el DISTINCT elimina los registros duplicados ejemplo
Select DISTINCT city from people;

# el LIMIT es el limite de registros a mostrar
select *from people LIMIT 3 ;

# la palabra OFFSET tomo un conjunto de registros desde y su limite
select *from people  limit 2 OFFSET 3;
 select *from people  limit 4,2;# LA , el numero , especifica cuantos registros se necesitan "desde 4, solo 2 registos 
 
 #------------------------------ORDENAR DATOS-------------------
 #ORDER BY refiere a ordenar la columna
 select *from people  ORDER BY frstname; #ordnea acendente una coluna en este caso es frstname
 
 # ORDER BY COLUM1, COLUM2 ; permite ordenar multiples columnas
 select *from people 
 ORDER BY frstname,edad;
	# o tambien
 select *from people 
 ORDER BY edad,frstname;
 
 # ORDER BY ASC - DESC
 select *from people 
 ORDER BY edad ASC;#ASENDENTE DE 1 A N
 select *from people 
 ORDER BY edad DESC;#ASENDENTE DE N A 1
 #--------------------------------------WHERE--------------------------
 
 #selecion todo de la table WHERE (cuando) una condicion
 select *from people WHERE Idpeople <=2;# menor o igual que 2
 select *from people WHERE Idpeople >=2;# mayor o igual que 2
 # operadores = ,!=,>,<,<=,>= y BETWEEN (DETERMINA UN GANGO)
 select *from people where Idpeople BETWEEN 3 AND 5 ;
 select *from people  limit 3 OFFSET 2; # O TAMBIEN PUDES HACER ESTO
 
 # CON CONDICIONALES 
 select *from people where Idpeople BETWEEN  3 AND Idpeople = 5 ;
 select *from people WHERE frstname = 'Luis'and city ='chicago' ; 
 select *from people WHERE city ='new york';
 
 #----------------- operadores logicos AND, OR, IN, NOT
 
 # AND puede hacerse como rangos de edad 
  select *from people WHERE edad>=18 and edad<=40 order by edad asc ; 
  #OR  pide un valor o otro
  select *from people where edad =15 OR edad = 18; #como en edad no hay 15 retorna el 18
   select *from people ;
  # AND Y OR
  select *from people where  city='new york' AND ( edad=35 OR edad=25);
 # IN es multiples condiciones de OR
  select *from people where edad IN (35,25,45);
 # NOT IN  seleciona lo contrario que esta en el IN
  select *from people where edad NOT IN (35,25,45);
  
  #--------------------------------------PERSONALIZAR COLUMNAS--------------------------
  
  #CONCAT concatena dos o mas registros
   select  concat(frstname,' , ',lastname)from people;
   #SA es un alias para titular la nueva tabal
   select  concat(frstname,' , ',lastname)AS nombres from people;
   
   #--------------------------------------OPERADORES ARITMETICOS--------------------------
   select nom1,nom2,salario+500 as newSalario from salarios; #añade 500 mas a los registros salrio
   select nom1,nom2,salario from salarios;
 
   #ejemplo de como usar la suma multiplicacion 
   select concat(firstname,' ',lastname)as fullname, salary*12+experience*500 as total from staff order by total;
  
   #--------------------------------------FUNCIONES--------------------------
   
   #FUNCION UPPER combierte las letras a mayusculas
    select frstname,UPPER(lastname)as nomMayusculas from people ;
    #FUNCION LOWER combierte las letras a minusculas
    select frstname,LOWER(lastname)as nomMayusculas from people ;
    
    #FUNCION SQRT saca la raiz cuadrada de un registro
    select salario , SQRT(salario)as raizcua from salarios;
     #FUNCION AVG saca un promedio de una columna
     select AVG (salario)AS PROMEDIO_DE_SALARIOS from salarios;
      #FUNCION SUM suma los datos de una columna
     select SUM(salario)AS SUMA_DE_SALARIOS from salarios;
    # sacar un promedio del primer semestre
    SELECT AVG(score) from sam_grades  where semester=1;
    
      #--------------------------------------SUBCONSULTAS--------------------------
      #SON CONSULSTAS DENTRO DE OTRA CONSULATA
      SELECT nom1, salario  from salarios where salario >(#selecione nombre y salariio cuando salario sea mayor 
       select avg (salario)from salarios)#al promedio de salarios
       order by salario desc;#ordenar salario de forma desendente
       
       
   # select *from foods where fatpercentage< (select avg(fatpercenatge) from foods);
   
    #--------------------------------------OPERADOR LIKE--------------------------
    SELECT *FROM salarios where nom1 LIKE 'f%'; #cuando el nombre inicie con f 
    
	SELECT *FROM salarios where nom1 LIKE '%a'; #cuando el nombre finalice con a
     select nom1,nom2,salario from salarios;

#select *from desserts where name like '%Chocolate%';

#FUNCION MIN retorna un valor minimo
select MIN(salario)as salario from salarios;# muestra el valor mas pequeño del los registros


    #--------------------------------------COMBINACION DE TABLAS--------------------------
SELECT salarios.idTABLE, salarios.nom1, salarios.salario, people.edad from salarios,people 
where salarios.idTABLE= people.Idpeople;
#SELECIONAR tabla1.campo,tabla1.campo,tabla2.campo DE tabla1,tabla2 CUANDO tabla1.campo= tabla2.campo;

#ejercicio 
#SELECT students.id,students.firstname,students.lastname,teachers.lastname as teacher From students , teachers
#WHERE students.teacherid = teachers.id order by students.id;

 #--------------------------------------TIPOS DE COMBINACIONES--------------------------
#INNER JOIN interseccion de conjuntos

select productname, price, categories.categoryname as categoryname FROM products inner join categories
on  products.categoryid = categories.id;
 #leftjoin 
 #SELECT tabla1.campo, tabla2.campo FROM tabla1 LEFT OUTER JOIN tabla2 ON  tabla1.campo = tabla2.campo
#right join
# #SELECT tabla1.campo, tabla2.campo FROM tabla1 RIGHT OUTER JOIN tabla2 ON  tabla1.campo = tabla2.campo


 #--------------------------------------OPERACIONES DE UNION--------------------------
 # UNION combina los conjuntos resultantes de dos o mas declaraciones select
  
  select Idpeople,frstname from people
  UNION
  SELECT idTABLE,nom1 FROM salarios;

#select *from norwaychess union select *from tatsteel order by rating desc;
# UNION ALL selecciona todas la filas de cada tabla y las combina en una sola
 select Idpeople,frstname from people
  UNION ALL
  SELECT idTABLE,nom1 FROM salarios;
  
 #--------------------------------------INSERT--------------------------
 # INSERTE EN TABLA (CAMPO1, CAMPO2, CAMPO3) VALORES (VALOR1, VALOR 2, VALOR3);
 #INSERT INTO TABLE1 (NOMBRE,EDAD) VALUES('JULIO',45);
 insert into people(frstname,lastname,city)values('josue','matias','california');
/* INSERT INTO garage(id,make,model,prodyear)values(6,'Mercedes-Benz','G 63',2020),(7,'Porsche','Panamera',2020);
 Select *from garage; */

  #--------------------------------------UPDATE--------------------------
 # CAMBIAR DE LA TABLA COLOCAR CAMPO1= VALOR, CAMPO2 = VALOR CUANDO CAMPO= 1
 UPDATE people SET frstname='chepe',lastname='matius' where idpeople = 7;
 
  #--------------------------------------DELETE--------------------------
  # ELIMINAR DE LA TABLA CUANDO ID = 1
 DELETE FROM people WHERE Idpeople = 3;
  select Idpeople,frstname from people;
  # Eliminar un registro
  DELETE frstname FROM people WHERE Idpeople=4;
 
 #DELETE FROM products WHERE ExpireDate <1;
# select *from products
 
   #--------------------------------------create table--------------------------
   create table leaderboard(
   place int not null,
   nickname varchar(20)not null,
   rating int not null
   );
   insert into leaderboard(place,nickname,rating)values(1,'Predator',9500),(2,'JohnWar',9300),(3,'NightWarrior',8900);
   select *from leaderboard;
 
  #--------------------------------------AGREGAR NUEVO CAMPO A UNA TABLA--------------------------
  # ALTERAR TALBA TABL AÑADIR CAMPO TIPODEDATO;
  ALTER TABLE leaderboard ADD edad int;
   select *from leaderboard;
   
   alter table Cities Add attractivePlace varchar(128);
   update Cities set AttractivePlace='Belem Tower'where Name='Lisbon';
   update Cities set AttractivePlace='Plaza Mayor'where Name='Madrid';
   update Cities set AttractivePlace='Eiffel Tower'where Name='Paris';
   select*from cities;
   # borrar una columna 
   ALTER TABLE leaderboard DROP COLUMN edad;
    select *from leaderboard;
  
  #eliminar una tabla 
  DROP TABLE leaderboard;
  
  #------------------------RENOMBRAR UN CAMPO
	ALTER TABLE people RENAME frstname TO nombre ;
    
#--------------------------------------VISTAS--------------------------    
# Es una tabla virtual que esta basada en el conjunto resultante de una declaracion SQL
/*
CREATE VIEW nombre_vista AS SELECT columnanombre(s)FROM TABLE_NOMBRE WHERE CONDICION;

*/
  
  CREATE VIEW S_y_N AS SELECT nom1,salario FROM salarios;#cremaos la vista s_Y_N salarios_Y_nombres
  select *from S_y_N;
  
  
  CREATE VIEW vista as Select acc_id,status from users ;
  select*from vista;
  
  /*ACTUALIZAR UN VISTA*/
  
  #CREATE OR REPLACE VIEW nombre_vista AS campo1,campo2,campo3 FROM TABLE WHERE CONDICION
  CREATE OR REPLACE VIEW vista AS SELECT nom1,nom2,salario From salarios;
    select*from vista;
    
    
  insert into Animals (name,type,country_id)values('Slim','Giraffe',1);
  
  Select name,type, Countries.country From Animals inner join Countries
  on Animals.country_id = Countries.id order by Countries.id ;
    
    
    
    
    
    
    
    
    
    
  
