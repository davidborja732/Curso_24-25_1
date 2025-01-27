/*Tablas para el ejemplo de combinaciones o join*/
create table editoriales2(
  codigo numeric(3),
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros2 (
  codigo numeric(5),
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial numeric(3),
  precio numeric(5,2),
  primary key(codigo),
 constraint FK_libros2_editorial
   foreign key (codigoeditorial)
   references editoriales2(codigo)
 );

 insert into editoriales2 values(1,'Planeta');
 insert into editoriales2 values(2,'Emece');
 insert into editoriales2 values(3,'Paidos');
 insert into editoriales2 values(4,'Siglo XXI');

 insert into libros2 values(100,'Uno','Richard Bach',1,15);
 insert into libros2 values(101,'Ilusiones','Richard Bach',1,18);
 insert into libros2 values(102,'Aprenda PHP','Mario Molina',4,20);
 insert into libros2 values(103,'El aleph','Borges',2,40);
 insert into libros2 values(104,'Puente al infinito','Richard Bach',2,10);
 insert into libros2 values(105,'Antología','Borges',1,20);
 insert into libros2 values(106,'Cervantes y el quijote','Borges',3,25);

/*Tablas para el ejemplo de combinación externa izquierda*/

 create table libros3(
  codigo numeric(5),
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial numeric(3)
 );
 create table editoriales3(
  codigo numeric(3),
  nombre varchar(20)
);
 
 alter table editoriales3
  add constraint UQ_editoriales_codigo
  unique (codigo);

 alter table libros3
  add constraint UQ_libros_codigo
  unique (codigo);

 insert into editoriales3 values(1,'Planeta');
 insert into editoriales3 values(2,'Emece');
 insert into editoriales3 values(3,'Siglo XXI');
 insert into editoriales3 values(null,'Sudamericana');
 insert into editoriales3 values(null,'Norma');

 insert into libros values (100,'El aleph','Borges',1);
 insert into libros values (200,'Martin Fierro','Jose Hernandez',1);
 insert into libros values (300,'Aprenda PHP','Mario Molina',2);
 insert into libros values (400,'Java en 10 minutos',default,4);
 insert into libros values (500,'El quijote de la mancha','Cervantes',null);

/*Tablas para el ejemplo de combinación externa derecha*/
 create table libros4(
  codigo numeric(5),
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial numeric(3)
 );
 create table editoriales4(
  codigo numeric(3),
  nombre varchar(20)
);

 alter table libros4
  add constraint PK_libros
  primary key(codigo);

 alter table editoriales4
  add constraint PK_editoriales
  primary key(codigo);

 insert into editoriales4 values(1,'Planeta');
 insert into editoriales4 values(2,'Emece');
 insert into editoriales4 values(3,'Siglo XXI');
 insert into editoriales4 values(4,'Norma');

 insert into libros4 values(100,'El aleph','Borges',1);
 insert into libros4 values(101,'Martin Fierro','Jose Hernandez',1);
 insert into libros4 values(102,'Aprenda PHP','Mario Molina',2);
 insert into libros4 values(103,'Java en 10 minutos',null,4);
 insert into libros4 values(104,'El anillo del hechicero','Carol Gaskin',4);

/*Tablas para el ejemplo de combinación externa completa*/

 create table libros5(
  codigo numeric(5),
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial numeric(3)
 );
 create table editoriales5(
  codigo numeric(3),
  nombre varchar(20)
 );
 
 alter table libros5
  add constraint UQ_libros_codigo
  unique (codigo);

 alter table editoriales5
  add constraint UQ_editoriales_codigo
  unique (codigo);  

 insert into editoriales5 values(1,'Alfaragua');
 insert into editoriales5 values(2,'Emece');
 insert into editoriales5 values(3,'Siglo XXI');
 insert into editoriales5 values(4,'Norma');
 insert into editoriales5 values(null,'Sudamericana');
 
 insert into libros5 values(100,'El aleph','Borges',null);
 insert into libros5 values(101,'Martin Fierro','Jose Hernandez',1);
 insert into libros5 values(102,'Aprenda PHP','Mario Molina',2);
 insert into libros5 values(103,'Java en 10 minutos',default,4);
 insert into libros5 values(104,'El anillo del hechicero','Carol Gaskin',1);


/*Ejemplo de combinaciones cruzadas*/
create table comidas(
  codigo numeric(2),
  nombre varchar(30),
  precio numeric(4,2)
 );

 create table postres(
  codigo numeric(2),
  nombre varchar(30),
  precio numeric(4,2)
 );

 insert into comidas values(1,'ravioles',5);
 insert into comidas values(2,'tallarines',4);
 insert into comidas values(3,'milanesa',7);
 insert into comidas values(4,'cuarto de pollo',6);

 insert into postres values(1,'flan',2.5);
 insert into postres values(2,'porcion torta',3.5):

/*Tablas para el ejemplo de autocombinación*/
create table comidas2(
  codigo numeric(2),
  nombre varchar(30),
  precio numeric(4,2),
  rubro char(6),-- 'plato'=plato principal', 'postre'=postre
  primary key(codigo)
 );

 insert into comidas2 values(1,'raviolis',5,'plato');
 insert into comidas2 values(2,'tallarines',4,'plato');
 insert into comidas2 values(3,'milanesa',7,'plato');
 insert into comidas2 values(4,'cuarto de pollo',6,'plato');
 insert into comidas2 values(5,'flan',2.5,'postre');
 insert into comidas2 values(6,'porcion torta',3.5,'postre');

/*Tablas para el ejemplo de combinaciones y funciones de agregado*/ 

create table libros6(
  codigo numeric(5),
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial numeric(3),
  precio numeric(5,2),
  primary key(codigo)
 );

 create table editoriales6(
  codigo numeric(3),
  nombre varchar(20),
  primary key (codigo)
);

 insert into editoriales6 values(1,'Planeta');
 insert into editoriales6 values(2,'Emece');
 insert into editoriales6 values(3,'Siglo XXI');

 insert into libros6 values(100,'El aleph','Borges',1,20);
 insert into libros6 values(200,'Martin Fierro','Jose Hernandez',1,30);
 insert into libros6 values(300,'Aprenda PHP','Mario Molina',3,50);
 insert into libros6 values(400,'Uno','Richard Bach',3,15);
 insert into libros6 values(500,'Java en 10 minutos',default,4,45);

/*Tablas para el ejemplo de las consultas con más de 2 tablas*/

 create table libros7(
  codigo numeric(5),
  titulo varchar(40),
  codigoautor numeric(4) not null,
  codigoeditorial numeric(3),
  primary key(codigo)
 );

 create table autores7(
  codigo numeric(4),
  nombre varchar(20),
  primary key (codigo)
 );

 create table editoriales7(
  codigo numeric(3),
  nombre varchar(20),
  primary key (codigo)
 );
 
 insert into editoriales7 values(1,'Planeta');
 insert into editoriales7 values(2,'Emece');
 insert into editoriales7 values(3,'Siglo XXI');
 insert into editoriales7 values(4,'Norma');
 
 insert into autores7 values (1,'Richard Bach');
 insert into autores7 values (2,'Borges');
 insert into autores7 values (3,'Jose Hernandez');
 insert into autores7 values (4,'Mario Molina');
 insert into autores7 values (5,'Paenza');
 
 insert into libros7 values(100,'El aleph',2,2);
 insert into libros7 values(101,'Martin Fierro',3,1);
 insert into libros7 values(102,'Aprenda PHP',4,3);
 insert into libros7 values(103,'Uno',1,1);
 insert into libros7 values(104,'Java en 10 minutos',0,3);
 insert into libros7 values(105,'Matematica estas ahi',10,null);
 insert into libros7 values(106,'Java de la A a la Z',4,0);