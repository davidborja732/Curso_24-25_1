/*Script de los ejemplos de subconsultas*/
create DATABASE subconsultas;
use subconsultas;
create table libros1(
  codigo numeric(5),
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio numeric(5,2)
 );

insert into libros1 values(1,'Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
insert into libros1 values(2,'Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
insert into libros1 values(3,'Aprenda PHP','Mario Molina','Siglo XXI',40.00);
insert into libros1 values(4,'El aleph','Borges','Emece',10.00);
insert into libros1 values(5,'Ilusiones','Richard Bach','Planeta',15.00);
insert into libros1 values(6,'Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
insert into libros1 values(7,'Martin Fierro','Jose Hernandez','Planeta',20.00);
insert into libros1 values(8,'Martin Fierro','Jose Hernandez','Emece',30.00); insert into libros1 values(9,'Uno','Richard Bach','Planeta',10.00);


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
 insert into libros2 values(105,'Antolog a','Borges',1,20);
 insert into libros2 values(106,'Cervantes y el quijote','Borges',3,25);

create table facturas(
  numero numeric(5) not null,
  fecha date,
  cliente varchar(30),
  primary key(numero)
 );

 create table detalles(
  numerofactura numeric(5) not null,
  numeroitem numeric(3) not null, 
  articulo varchar(30),
  precio numeric(5,2),
  cantidad numeric(4),
  primary key(numerofactura,numeroitem),
   constraint FK_detalles_numerofactura
   foreign key (numerofactura)
   references facturas(numero)
   on delete cascade
 );
 
 insert into facturas values(1200,'15/01/2007','Juan Lopez');
 insert into facturas values(1201,'15/01/2007','Luis Torres');
 insert into facturas values(1202,'15/01/2007','Ana Garcia');
 insert into facturas values(1300,'20/01/2007','Juan Lopez');
 
 insert into detalles values(1200,1,'lapiz',1,100);
 insert into detalles values(1200,2,'goma',0.5,150);
 insert into detalles values(1201,1,'regla',1.5,80);
 insert into detalles values(1201,2,'goma',0.5,200);
 insert into detalles values(1201,3,'cuaderno',4,90);
 insert into detalles values(1202,1,'lapiz',1,200);
 insert into detalles values(1202,2,'escuadra',2,100);
 insert into detalles values(1300,1,'lapiz',1,300);
 
 create table socios(
  numero numeric(4),
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key (numero)
 );
 
 create table inscritos (
  numerosocio numeric(4) not null,
  deporte varchar(20) not null,
  cuotas numeric(2) default 0,
  constraint CK_inscritos_cuotas
   check (cuotas>=0 and cuotas<=10),
  primary key(numerosocio,deporte),
  constraint FK_inscriptos_socio
   foreign key (numerosocio)
   references socios(numero)
   on delete cascade
 );
 insert into socios values(1,'23333333','Alberto Paredes','Colon 111');
 insert into socios values(2,'24444444','Carlos Conte','Sarmiento 755');
 insert into socios values(3,'25555555','Fabian Fuentes','Caseros 987');
 insert into socios values(4,'26666666','Hector Lopez','Sucre 344');

 insert into inscritos values(1,'tenis',1);
 insert into inscritos values(1,'basquet',2);
 insert into inscritos values(1,'natacion',1);
 insert into inscritos values(2,'tenis',9);
 insert into inscritos values(2,'natacion',1);
 insert into inscritos values(2,'basquet',default);
 insert into inscritos values(2,'futbol',2);
 insert into inscritos values(3,'tenis',8);
 insert into inscritos values(3,'basquet',9);
 insert into inscritos values(3,'natacion',0);
 insert into inscritos values(4,'basquet',10);
 