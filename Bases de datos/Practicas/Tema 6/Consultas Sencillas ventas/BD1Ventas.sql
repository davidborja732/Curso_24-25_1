DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas;
USE ventas;


CREATE TABLE categorias (
	id_categoria int primary key,
	descripcion varchar(75)
);

CREATE TABLE clientes (
	id_cliente int primary key,
	nombre varchar(25),
	apellidos varchar(25) ,
	direccion varchar(50) ,
	ciudad varchar(30) ,
	provincia varchar(15) ,
	cod_postal varchar(10) ,
	codigo_area int default 0,
	telefono varchar(9) 
);

CREATE TABLE empleados (
	id_empleado int primary key,
	nombre varchar(25) ,
	apellidos varchar(25),
	direccion varchar(50) ,
	ciudad varchar(30)  ,
	provincia varchar(10) ,
	cod_postal varchar(10) ,
	codigo_area int default 0,
	telefono varchar(8) 
);

CREATE TABLE pedidos (
	numero_pedido int primary key ,
	fecha_pedido date,
	fecha_envio date ,
	id_cliente int ,
	id_empleado int  ,
	precio_total numeric(7,2),
	constraint pedidos_fk_cliente foreign key (id_cliente) references clientes(id_cliente),
	constraint pedidos_fk_empleado foreign key (id_empleado) references empleados(id_empleado)
);

CREATE TABLE productos (
	numero_producto int primary key ,
	nombre varchar(50),
	descripcion varchar(100) ,
	precio_venta numeric(6,2) default 0,
	stock int default 0,
	id_categoria int default 0,
	constraint productos_fk_categoria foreign key (id_categoria) references categorias(id_categoria)
);

CREATE TABLE detalles_pedidos (
	numero_pedido int ,
	numero_producto int ,
	precio numeric(6,2) default 0,
	cantidad int default 0,
	constraint detalle_pedido_pk primary key(numero_pedido, numero_producto),
	constraint detalle_pedido_fk_pedido foreign key (numero_pedido) references pedidos(numero_pedido),
	constraint detalle_pedido_fk_producto foreign key (numero_producto) references productos(numero_producto)
);

CREATE TABLE pedidos_historico (
	numero_pedido int primary key,
	fecha_pedido date,
	fecha_envio date ,
	id_cliente int ,
	id_empleado int  ,
	precio_total numeric(5,2)
);

CREATE TABLE detalles_pedidos_historico(
	numero_pedido int ,
	numero_producto int ,
	precio numeric(5,2) default 0,
	cantidad int default 0,
	constraint detalle_pedido_fk_h_pedido foreign key (numero_pedido) references pedidos_historico(numero_pedido)
);

CREATE TABLE proveedores (
	id_prov int primary key,
	nombre varchar(25)  ,
	direccion varchar(50)  ,
	ciudad varchar(30)  ,
	provincia varchar(15)  ,
	cod_postal varchar(10)  ,
	telefono varchar(15)  ,
	fax varchar(15)  ,
	pag_web varchar(150)  ,
	email varchar(50) 
);


CREATE TABLE productos_proveedores (
	numero_producto int,
	id_prov int,
	precio_por_mayor numeric(6,2) ,
	dias_envio int,
	
	constraint prod_prov_fk_prod foreign key (numero_producto) references productos(numero_producto),
	constraint prod_prov_fk_vend foreign key (id_prov) references proveedores(id_prov)
	
);

-- alter session set nls_date_format='YYYY-MM-DD';

-- Inserción en CATEGORIAS

INSERT INTO categorias VALUES (1, 'Accesorios');
INSERT INTO categorias VALUES (2, 'Bicicletas');
INSERT INTO categorias VALUES (3, 'Ropa');
INSERT INTO categorias VALUES (4, 'Componentes');
INSERT INTO categorias VALUES (5, '**** para el coche');
INSERT INTO categorias VALUES (6, 'Ruedas');
INSERT INTO categorias VALUES (7, 'Scooters');


-- Inserción en CLIENTES

INSERT INTO clientes
  VALUES (1001, 'Susana', 'Viescas', 'Ronda Noreste, num 383', 
   'Robledo', 'MADRID', '28052', 425, '555-2686');
INSERT INTO clientes
  VALUES (1002, 'Guillermo', 'Torres', 'Calle del Rio 122', 
   'Daganzo', 'MADRID', '28019', 425, '555-2681');
INSERT INTO clientes
  VALUES (1003, 'German', 'Higueras', 'Ruta 2, apartado 203B', 
   'Acebeda (La)', 'MADRID', '28002', 253, '555-2676');
INSERT INTO clientes
  VALUES (1004, 'Roberto', 'Blanes', 'Avenida del Monte 672', 
   'Hontanar', 'TOLEDO', '45201', 713, '555-2491');
INSERT INTO clientes
  VALUES (1005, 'Daniel', 'Manzanares', 'Camino Viejo 4110', 
   'Robledo', 'MADRID', '28052', 425, '555-2506');
INSERT INTO clientes
  VALUES (1006, 'Juan', 'Viescas', 'Ronda Noreste, num 383', 
   'Robledo', 'MADRID', '28052', 425, '555-2511');
INSERT INTO clientes
  VALUES (1007, 'Maria', 'Salgado', 'Avenida Pirineos 901',  
   'O Pereiro', 'ORENSE', '32208', 503, '555-2526');
INSERT INTO clientes
  VALUES (1008, 'Nicolas', 'Pelayo', 'Valle Oeste 233', 
   'Santa Ana', 'CACERES', '10199', 619, '555-2541');
INSERT INTO clientes
  VALUES (1009, 'Andres', 'Cervera', 'Avenida Amanecer 507
Apt. 2A', 
   'Somosierra', 'MADRID', '28105', 206, '555-2601');
INSERT INTO clientes
  VALUES (1010, 'Angel', 'Sanchez', 'Carretera del Rio 667', 
   'Ajofrin', 'TOLEDO', '45710', 512, '555-2571');
INSERT INTO clientes
  VALUES (1011, 'Ana', 'Higueras', 'Ruta 2, apartado 203B', 
   'Venturada', 'MADRID', '28072', 425, '555-2631');
INSERT INTO clientes
  VALUES (1012, 'Lisa', 'Colomer', 'Calle Zurita 13', 
   'Belmonte', 'MADRID', '28006', 425, '555-2556');
INSERT INTO clientes
  VALUES (1013, 'Raquel', 'Pelayo', ' Buena Vista 21', 
   'Santa Ana', 'CACERES', '10199', 619, '555-2546');
INSERT INTO clientes
  VALUES (1014, 'Samuel', 'Abadia', 'Avda de los Alpes 60', 
   'Plasencia', 'CACERES', '10263', 760, '555-2611');
INSERT INTO clientes
  VALUES (1015, 'Daniel', 'Gil', 'Calle del Mar 26', 
   'Santa Ana', 'CACERES', '10926', 530, '555-2616');
INSERT INTO clientes
  VALUES (1016, 'Jaime', 'Vives', 'Serrano 101', 'Seiro', 
   'ORENSE', '32301', 503, '555-2636');
INSERT INTO clientes
  VALUES (1017, 'Manuela', 'Seidel', 'Coso 68', 
   'Mundil', 'ORENSE', '32501', 541, '555-2641');
INSERT INTO clientes
  VALUES (1018, 'David', 'Sanz', 'Calle de Vallejuelo 31', 
   'Fresnedoso', 'CACERES', '10538', 510, '555-2646');
INSERT INTO clientes
  VALUES (1019, 'Zacarias', 'Escudero', 'Calle de kioto 123', 
   'Garvin', 'CACERES', '10209', 818, '555-2721');
INSERT INTO clientes
  VALUES (1020, 'Joaquin', 'Bou', 'Tamesis 24', 
   'Belmonte', 'MADRID', '28006', 425, '555-2726');
INSERT INTO clientes
  VALUES (1021, 'Estella', 'Punset', 'Paseo Rosales 250', 
   'Dosbarrios', 'TOLEDO', '45260', 972, '555-9938');
INSERT INTO clientes
  VALUES (1022, 'Camilo', 'Viescas', 'Carretera Cuatro Vientos 45', 
   'Ladrillar', 'CACERES', '10809', 562, '555-0037');
INSERT INTO clientes
  VALUES (1023, 'Julia', 'Sandoval', 'Calle del Huracan 23', 
   'Somosierra', 'MADRID', '28837', 206, '555-9936');
INSERT INTO clientes
  VALUES (1024, 'Marcos', 'Rosales', 'Calle abogados 32', 
   'Escalonilla', 'TOLEDO', '45915', 915, '555-2286');
INSERT INTO clientes
  VALUES (1025, 'Maria', 'Pelayo', 'Carretera de Castellon 44', 
   'Escalonilla', 'TOLEDO', '45915', 915, '555-2291');
INSERT INTO clientes
  VALUES (1026, 'Luis', 'Donoso', 'Avda del Oeste 45', 
   'San Roman', 'TOLEDO', '45284', 210, '555-2311');
INSERT INTO clientes
  VALUES (1027, 'Lucas', 'Pelayo', 'Avda del Sur 87', 
   'O Pereiro', 'ORENSE', '32208', 503, '555-2316');
INSERT INTO clientes
  VALUES (1028, 'Javier', 'Tirado', 'Calle Mayor 42', 
   'Robledo', 'MADRID', '28052', 425, '555-9999');

--Inserción en EMPLEADOS

INSERT INTO empleados
  VALUES (701, 'Ana', 'Pelayo', 'Mapache 16', 
   'Acebeda (La)', 'MADRID', '28002', 253, '555-2591');
INSERT INTO empleados
  VALUES (702, 'Maria', 'Torres', 'Calle del Rio 122', 
   'Daganzo', 'MADRID', '28019', 425, '555-2516');
INSERT INTO empleados
  VALUES (703, 'Mateo', 'Berges', 'Castillo 90', 
   'Tielmes', 'MADRID', '28413', 253, '555-2581');
INSERT INTO empleados
  VALUES (704, 'Carol', 'Viescas', 'Calle bahia 22', 
   'Horcajuelo', 'MADRID', '28033', 425, '555-2576');
INSERT INTO empleados
  VALUES (705, 'Pedro', 'Donoso', 'Avda del Oeste 45', 
   'San Roman', 'TOLEDO', '45284', 210, '5552311');
INSERT INTO empleados
  VALUES (706, 'David', 'Viescas', 'Cortes 16', 
   'Robledo', 'MADRID', '28052', 425, '555-2661');
INSERT INTO empleados
  VALUES (707, 'Catalina', 'Pelayo', 'Calle del Pez 5 Apt. 2A', 
   'Somosierra', 'MADRID', '28105', 206, '555-2697');
INSERT INTO empleados
  VALUES (708, 'Susana', 'Maestre', 'Av Independencia 5', 
   'Belmonte', 'MADRID', '28006', 425, '555-2301');
INSERT INTO empleados
  VALUES (709, 'Domingo', 'Dumbo', 'Calle Principal 1', 
   'Navalcan', 'TOLEDO', '45055', 515, '555-9998');


-- Inserción en PEDIDOS.

INSERT INTO pedidos
  VALUES (1, '2007-09-01', '2007-09-04', 1018, 707, 
   12751.85);
INSERT INTO pedidos
  VALUES (2, '2007-09-01', '2007-09-03', 1001, 703, 
   816);
INSERT INTO pedidos
  VALUES (3, '2007-09-01', '2007-09-04', 1002, 707, 
   11912.45);
INSERT INTO pedidos
  VALUES (4, '2007-09-01', '2007-09-03', 1009, 703, 
   6601.73);
INSERT INTO pedidos
  VALUES (5, '2007-09-01', '2007-09-01', 1024, 708, 
   5544.75);
INSERT INTO pedidos
  VALUES (6, '2007-09-01', '2007-09-05', 1014, 702, 
   9820.29);
INSERT INTO pedidos
  VALUES (7, '2007-09-01', '2007-09-04', 1001, 708, 
   467.85);
INSERT INTO pedidos
  VALUES (8, '2007-09-01', '2007-09-01', 1003, 703, 
   1492.6);
INSERT INTO pedidos
  VALUES (9, '2007-09-01', '2007-09-04', 1007, 708, 
   69);
INSERT INTO pedidos
  VALUES (10, '2007-09-01', '2007-09-04', 1012, 701, 
   2607);
INSERT INTO pedidos
  VALUES (11, '2007-09-02', '2007-09-04', 1020, 706, 
   11070.65);
INSERT INTO pedidos
  VALUES (12, '2007-09-02', '2007-09-05', 1024, 706, 
   72);
INSERT INTO pedidos
  VALUES (13, '2007-09-02', '2007-09-02', 1024, 704, 
   7545);
INSERT INTO pedidos
  VALUES (14, '2007-09-02', '2007-09-03', 1013, 704, 
   6819.9);
INSERT INTO pedidos
  VALUES (15, '2007-09-02', '2007-09-06', 1004, 701, 
   2974.25);
INSERT INTO pedidos
  VALUES (16, '2007-09-02', '2007-09-06', 1001, 707, 
   2007.54);
INSERT INTO pedidos
  VALUES (17, '2007-09-02', '2007-09-03', 1014, 702, 
   4834.98);
INSERT INTO pedidos
  VALUES (18, '2007-09-02', '2007-09-03', 1016, 708, 
   807.8);
INSERT INTO pedidos
  VALUES (19, '2007-09-02', '2007-09-06', 1027, 707, 
   15278.98);
INSERT INTO pedidos
  VALUES (20, '2007-09-02', '2007-09-02', 1011, 706, 
   4699.98);
INSERT INTO pedidos
  VALUES (21, '2007-09-03', '2007-09-03', 1014, 702, 
   709.97);
INSERT INTO pedidos
  VALUES (22, '2007-09-03', '2007-09-07', 1026, 702, 
   6456.16);
INSERT INTO pedidos
  VALUES (23, '2007-09-03', '2007-09-04', 1017, 705, 
   16331.91);
INSERT INTO pedidos
  VALUES (24, '2007-09-03', '2007-09-05', 1010, 705, 
   864.85);
INSERT INTO pedidos
  VALUES (25, '2007-09-03', '2007-09-04', 1017, 708, 
   10142.15);
INSERT INTO pedidos
  VALUES (26, '2007-09-04', '2007-09-08', 1013, 707, 
   7266.93);
INSERT INTO pedidos
  VALUES (27, '2007-09-04', '2007-09-05', 1014, 703, 
   8002.75);
INSERT INTO pedidos
  VALUES (28, '2007-09-04', '2007-09-08', 1004, 703, 
   335.68);
INSERT INTO pedidos
  VALUES (29, '2007-09-04', '2007-09-08', 1015, 707, 
   664);
INSERT INTO pedidos
  VALUES (30, '2007-09-04', '2007-09-08', 1010, 708, 
   7268.98);
INSERT INTO pedidos
  VALUES (31, '2007-09-05', '2007-09-09', 1014, 701, 
   162.96);
INSERT INTO pedidos
  VALUES (32, '2007-09-05', '2007-09-09', 1012, 704, 
   8743.63);
INSERT INTO pedidos
  VALUES (33, '2007-09-05', '2007-09-06', 1024, 704, 
   2369.53);
INSERT INTO pedidos
  VALUES (34, '2007-09-06', '2007-09-07', 1010, 705, 
   411.28);
INSERT INTO pedidos
  VALUES (35, '2007-09-06', '2007-09-06', 1012, 701, 
   5095.15);
INSERT INTO pedidos
  VALUES (36, '2007-09-06', '2007-09-07', 1007, 705, 
   7.45);
INSERT INTO pedidos
  VALUES (37, '2007-09-07', '2007-09-11', 1027, 702, 
   1718.78);
INSERT INTO pedidos
  VALUES (38, '2007-09-07', '2007-09-11', 1017, 702, 
   700);
INSERT INTO pedidos
  VALUES (39, '2007-09-07', '2007-09-10', 1004, 704, 
   20221.75);
INSERT INTO pedidos
  VALUES (40, '2007-09-07', '2007-09-07', 1017, 703, 
   1018.15);
INSERT INTO pedidos
  VALUES (41, '2007-09-07', '2007-09-07', 1008, 706, 
   1723.42);
INSERT INTO pedidos
  VALUES (42, '2007-09-07', '2007-09-10', 1012, 704, 
   6174);
INSERT INTO pedidos
  VALUES (43, '2007-09-07', '2007-09-11', 1020, 705, 
   7140.68);
INSERT INTO pedidos
  VALUES (44, '2007-09-07', '2007-09-08', 1005, 701, 
   2365.2);
INSERT INTO pedidos
  VALUES (45, '2007-09-08', '2007-09-08', 1008, 708, 
   17889.25);
INSERT INTO pedidos
  VALUES (46, '2007-09-08', '2007-09-09', 1018, 707, 
   78);
INSERT INTO pedidos
  VALUES (47, '2007-09-08', '2007-09-10', 1023, 708, 
   5820);
INSERT INTO pedidos
  VALUES (48, '2007-09-08', '2007-09-11', 1004, 707, 
   1397.88);
INSERT INTO pedidos
  VALUES (49, '2007-09-08', '2007-09-08', 1015, 704, 
   1254.5);
INSERT INTO pedidos
  VALUES (50, '2007-09-08', '2007-09-12', 1002, 704, 
   477.94);
INSERT INTO pedidos
  VALUES (51, '2007-09-08', '2007-09-08', 1018, 707, 
   1200);
INSERT INTO pedidos
  VALUES (52, '2007-09-09', '2007-09-11', 1001, 701, 
   261.9);
INSERT INTO pedidos
  VALUES (53, '2007-09-09', '2007-09-09', 1004, 706, 
   19615);
INSERT INTO pedidos
  VALUES (54, '2007-09-09', '2007-09-09', 1007, 707, 
   72);
INSERT INTO pedidos
  VALUES (55, '2007-09-09', '2007-09-11', 1001, 707, 
   36);
INSERT INTO pedidos
  VALUES (56, '2007-09-09', '2007-09-12', 1014, 702, 
   3380.8);
INSERT INTO pedidos
  VALUES (57, '2007-09-09', '2007-09-10', 1009, 703, 
   4214.7);
INSERT INTO pedidos
  VALUES (58, '2007-09-09', '2007-09-13', 1006, 701, 
   3172.5);
INSERT INTO pedidos
  VALUES (59, '2007-09-09', '2007-09-09', 1004, 704, 
   15504.6);
INSERT INTO pedidos
  VALUES (60, '2007-09-09', '2007-09-13', 1013, 708, 
   10135.5);
INSERT INTO pedidos
  VALUES (61, '2007-09-09', '2007-09-10', 1009, 706, 
   4372.25);
INSERT INTO pedidos
  VALUES (62, '2007-09-10', '2007-09-13', 1003, 703, 
   1335.5);
INSERT INTO pedidos
  VALUES (63, '2007-09-10', '2007-09-13', 1023, 708, 
   7032);
INSERT INTO pedidos
  VALUES (64, '2007-09-10', '2007-09-14', 1027, 708, 
   8453.5);
INSERT INTO pedidos
  VALUES (65, '2007-09-10', '2007-09-13', 1021, 703, 
   13550.1);
INSERT INTO pedidos
  VALUES (66, '2007-09-10', '2007-09-11', 1026, 703, 
   14541.75);
INSERT INTO pedidos
  VALUES (67, '2007-09-10', '2007-09-11', 1025, 702, 
   877);
INSERT INTO pedidos
  VALUES (68, '2007-09-11', '2007-09-12', 1027, 702, 
   273.54);
INSERT INTO pedidos
  VALUES (69, '2007-09-11', '2007-09-13', 1021, 705, 
   3034.25);
INSERT INTO pedidos
  VALUES (70, '2007-09-12', '2007-09-16', 1016, 706, 
   595.2);
INSERT INTO pedidos
  VALUES (71, '2007-09-12', '2007-09-14', 1016, 708, 
   1849.8);
INSERT INTO pedidos
  VALUES (72, '2007-09-12', '2007-09-16', 1003, 708, 
   1484.13);
INSERT INTO pedidos
  VALUES (73, '2007-09-12', '2007-09-15', 1005, 705, 
   7159.38);
INSERT INTO pedidos
  VALUES (74, '2007-09-12', '2007-09-13', 1002, 703, 
   14103.5);
INSERT INTO pedidos
  VALUES (75, '2007-09-12', '2007-09-14', 1014, 706, 
   6691.7);
INSERT INTO pedidos
  VALUES (76, '2007-09-12', '2007-09-15', 1012, 703, 
   868.15);
INSERT INTO pedidos
  VALUES (77, '2007-09-12', '2007-09-13', 1008, 706, 
   2157.9);
INSERT INTO pedidos
  VALUES (78, '2007-09-13', '2007-09-16', 1007, 701, 
   13498.95);
INSERT INTO pedidos
  VALUES (79, '2007-09-13', '2007-09-17', 1006, 703, 
   7507);
INSERT INTO pedidos
  VALUES (80, '2007-09-13', '2007-09-16', 1025, 708, 
   14394.43);
INSERT INTO pedidos
  VALUES (81, '2007-09-13', '2007-09-13', 1006, 705, 
   1018.5);
INSERT INTO pedidos
  VALUES (82, '2007-09-13', '2007-09-16', 1005, 701, 
   12861.28);
INSERT INTO pedidos
  VALUES (83, '2007-09-13', '2007-09-16', 1021, 708, 
   639);
INSERT INTO pedidos
  VALUES (84, '2007-09-13', '2007-09-13', 1022, 707, 
   1278.96);
INSERT INTO pedidos
  VALUES (85, '2007-09-13', '2007-09-15', 1015, 705, 
   1807.6);
INSERT INTO pedidos
  VALUES (86, '2007-09-13', '2007-09-16', 1009, 701, 
   9285.45);
INSERT INTO pedidos
  VALUES (87, '2007-09-13', '2007-09-14', 1002, 704, 
   6121);
INSERT INTO pedidos
  VALUES (88, '2007-09-14', '2007-09-17', 1026, 707, 
   960.3);
INSERT INTO pedidos
  VALUES (89, '2007-09-14', '2007-09-17', 1003, 703, 
   642.04);
INSERT INTO pedidos
  VALUES (90, '2007-09-14', '2007-09-15', 1017, 706, 
   57);
INSERT INTO pedidos
  VALUES (91, '2007-09-14', '2007-09-18', 1010, 703, 
   14834.25);
INSERT INTO pedidos
  VALUES (92, '2007-09-14', '2007-09-17', 1011, 704, 
   4433.95);
INSERT INTO pedidos
  VALUES (93, '2007-09-14', '2007-09-17', 1023, 707, 
   75);
INSERT INTO pedidos
  VALUES (94, '2007-09-14', '2007-09-14', 1010, 701, 
   4134.35);
INSERT INTO pedidos
  VALUES (95, '2007-09-15', '2007-09-19', 1021, 704, 
   9959.15);
INSERT INTO pedidos
  VALUES (96, '2007-09-15', '2007-09-16', 1025, 703, 
   5574);
INSERT INTO pedidos
  VALUES (97, '2007-09-15', '2007-09-18', 1026, 703, 
   2584.95);
INSERT INTO pedidos
  VALUES (98, '2007-09-15', '2007-09-16', 1009, 706, 
   4857);
INSERT INTO pedidos
  VALUES (99, '2007-09-15', '2007-09-18', 1002, 703, 
   5078);
INSERT INTO pedidos
  VALUES (100, '2007-09-15', '2007-09-16', 1002, 707, 
   3844.68);
INSERT INTO pedidos
  VALUES (101, '2007-09-15', '2007-09-18', 1023, 707, 
   1389.64);
INSERT INTO pedidos
  VALUES (102, '2007-09-15', '2007-09-17', 1010, 705, 
   4869.81);
INSERT INTO pedidos
  VALUES (103, '2007-09-15', '2007-09-16', 1025, 702, 
   9373.54);
INSERT INTO pedidos
  VALUES (104, '2007-09-15', '2007-09-15', 1017, 708, 
   4699.98);
INSERT INTO pedidos
  VALUES (105, '2007-09-16', '2007-09-18', 1005, 704, 
   9345.15);
INSERT INTO pedidos
  VALUES (106, '2007-09-16', '2007-09-20', 1020, 708, 
   128);
INSERT INTO pedidos
  VALUES (107, '2007-09-16', '2007-09-20', 1001, 703, 
   1240.4);
INSERT INTO pedidos
  VALUES (108, '2007-09-16', '2007-09-19', 1004, 701, 
   88);
INSERT INTO pedidos
  VALUES (109, '2007-09-16', '2007-09-16', 1013, 703, 
   700);
INSERT INTO pedidos
  VALUES (110, '2007-09-17', '2007-09-19', 1015, 708, 
   641.96);
INSERT INTO pedidos
  VALUES (111, '2007-09-17', '2007-09-21', 1021, 707, 
   11811.15);
INSERT INTO pedidos
  VALUES (112, '2007-09-18', '2007-09-19', 1009, 703, 
   414);
INSERT INTO pedidos
  VALUES (113, '2007-09-18', '2007-09-22', 1010, 702, 
   5744.1);
INSERT INTO pedidos
  VALUES (114, '2007-09-18', '2007-09-22', 1011, 706, 
   353.25);
INSERT INTO pedidos
  VALUES (115, '2007-09-19', '2007-09-21', 1003, 704, 
   799);
INSERT INTO pedidos
  VALUES (116, '2007-09-19', '2007-09-21', 1004, 701, 
   4477.65);
INSERT INTO pedidos
  VALUES (117, '2007-09-20', '2007-09-22', 1005, 705, 
   10579);
INSERT INTO pedidos
  VALUES (118, '2007-09-20', '2007-09-22', 1021, 708, 
   110.58);
INSERT INTO pedidos
  VALUES (119, '2007-09-20', '2007-09-20', 1013, 701, 
   17607);
INSERT INTO pedidos
  VALUES (120, '2007-09-20', '2007-09-21', 1024, 702, 
   3904.25);
INSERT INTO pedidos
  VALUES (121, '2007-09-20', '2007-09-21', 1025, 701, 
   2737.83);
INSERT INTO pedidos
  VALUES (122, '2007-09-20', '2007-09-24', 1009, 707, 
   4633.98);
INSERT INTO pedidos
  VALUES (123, '2007-09-20', '2007-09-22', 1004, 704, 
   4134.23);
INSERT INTO pedidos
  VALUES (124, '2007-09-21', '2007-09-23', 1007, 705, 
   7094.58);
INSERT INTO pedidos
  VALUES (125, '2007-09-21', '2007-09-21', 1011, 707, 
   3951.9);
INSERT INTO pedidos
  VALUES (126, '2007-09-22', '2007-09-24', 1016, 708, 
   2417.89);
INSERT INTO pedidos
  VALUES (127, '2007-09-22', '2007-09-25', 1009, 705, 
   8383.15);
INSERT INTO pedidos
  VALUES (128, '2007-09-22', '2007-09-26', 1022, 708, 
   377.33);
INSERT INTO pedidos
  VALUES (129, '2007-09-22', '2007-09-22', 1007, 708, 
   69);
INSERT INTO pedidos
  VALUES (130, '2007-09-22', '2007-09-24', 1011, 705, 
   10388.68);
INSERT INTO pedidos
  VALUES (131, '2007-09-22', '2007-09-22', 1014, 706, 
   7164);
INSERT INTO pedidos
  VALUES (132, '2007-09-22', '2007-09-25', 1007, 705, 
   3316.65);
INSERT INTO pedidos
  VALUES (133, '2007-09-22', '2007-09-22', 1027, 706, 
   66);
INSERT INTO pedidos
  VALUES (134, '2007-09-22', '2007-09-24', 1003, 703, 
   2291.58);
INSERT INTO pedidos
  VALUES (135, '2007-09-23', '2007-09-26', 1005, 701, 
   4404.15);
INSERT INTO pedidos
  VALUES (136, '2007-09-23', '2007-09-26', 1008, 707, 
   11845.5);
INSERT INTO pedidos
  VALUES (137, '2007-09-23', '2007-09-23', 1001, 706, 
   1235.65);
INSERT INTO pedidos
  VALUES (138, '2007-09-24', '2007-09-27', 1001, 702, 
   1122.7);
INSERT INTO pedidos
  VALUES (139, '2007-09-24', '2007-09-26', 1024, 704, 
   128);
INSERT INTO pedidos
  VALUES (140, '2007-09-24', '2007-09-24', 1002, 706, 
   16779.75);
INSERT INTO pedidos
  VALUES (141, '2007-09-24', '2007-09-27', 1014, 706, 
   3696.04);
INSERT INTO pedidos
  VALUES (142, '2007-09-25', '2007-09-29', 1018, 702, 
   3624);
INSERT INTO pedidos
  VALUES (143, '2007-09-25', '2007-09-28', 1021, 706, 
   180);
INSERT INTO pedidos
  VALUES (144, '2007-09-25', '2007-09-29', 1018, 704, 
   7846.5);
INSERT INTO pedidos
  VALUES (145, '2007-09-26', '2007-09-30', 1027, 701, 
   4260);
INSERT INTO pedidos
  VALUES (146, '2007-09-26', '2007-09-26', 1021, 708, 
   358);
INSERT INTO pedidos
  VALUES (147, '2007-09-26', '2007-09-26', 1026, 708, 
   4178.73);
INSERT INTO pedidos
  VALUES (148, '2007-09-26', '2007-09-30', 1027, 704, 
   8742.55);
INSERT INTO pedidos
  VALUES (149, '2007-09-27', '2007-09-28', 1004, 707, 
   5298);
INSERT INTO pedidos
  VALUES (150, '2007-09-27', '2007-09-27', 1024, 701, 
   10572.75);
INSERT INTO pedidos
  VALUES (151, '2007-09-27', '2007-09-28', 1001, 707, 
   276);
INSERT INTO pedidos
  VALUES (152, '2007-09-28', '2007-10-02', 1017, 704, 
   6067.4);
INSERT INTO pedidos
  VALUES (153, '2007-09-29', '2007-09-30', 1003, 702, 
   1328.95);
INSERT INTO pedidos
  VALUES (154, '2007-09-29', '2007-10-02', 1001, 703, 
   1360.05);
INSERT INTO pedidos
  VALUES (155, '2007-09-29', '2007-10-03', 1004, 703, 
   1044);
INSERT INTO pedidos
  VALUES (156, '2007-09-29', '2007-09-30', 1004, 703, 
   9004.75);
INSERT INTO pedidos
  VALUES (157, '2007-09-29', '2007-10-01', 1010, 707, 
   16926.1);
INSERT INTO pedidos
  VALUES (158, '2007-09-29', '2007-10-03', 1021, 705, 
   320.1);
INSERT INTO pedidos
  VALUES (159, '2007-09-29', '2007-10-03', 1005, 707, 
   1104.6);
INSERT INTO pedidos
  VALUES (160, '2007-09-30', '2007-09-30', 1021, 706, 
   11569.25);
INSERT INTO pedidos
  VALUES (161, '2007-09-30', '2007-09-30', 1011, 707, 
   3088);
INSERT INTO pedidos
  VALUES (162, '2007-09-30', '2007-10-01', 1021, 704, 
   8024.5);
INSERT INTO pedidos
  VALUES (163, '2007-09-30', '2007-09-30', 1004, 707, 
   8359.59);
INSERT INTO pedidos
  VALUES (164, '2007-10-01', '2007-10-04', 1021, 707, 
   7318.65);
INSERT INTO pedidos
  VALUES (165, '2007-10-02', '2007-10-02', 1017, 702, 
   21674.63);
INSERT INTO pedidos
  VALUES (166, '2007-10-03', '2007-10-06', 1022, 706, 
   1904.69);
INSERT INTO pedidos
  VALUES (167, '2007-10-03', '2007-10-03', 1017, 706, 
   7386.94);
INSERT INTO pedidos
  VALUES (168, '2007-10-03', '2007-10-05', 1027, 706, 
   1882.65);
INSERT INTO pedidos
  VALUES (169, '2007-10-03', '2007-10-06', 1025, 708, 
   2181.92);
INSERT INTO pedidos
  VALUES (170, '2007-10-04', '2007-10-04', 1004, 704, 
   5309.75);
INSERT INTO pedidos
  VALUES (171, '2007-10-04', '2007-10-05', 1026, 707, 
   664);
INSERT INTO pedidos
  VALUES (172, '2007-10-04', '2007-10-07', 1018, 704, 
   5891);
INSERT INTO pedidos
  VALUES (173, '2007-10-04', '2007-10-04', 1015, 704, 
   472.98);
INSERT INTO pedidos
  VALUES (174, '2007-10-04', '2007-10-08', 1006, 703, 
   7149);
INSERT INTO pedidos
  VALUES (175, '2007-10-04', '2007-10-07', 1013, 706, 
   15909.66);
INSERT INTO pedidos
  VALUES (176, '2007-10-04', '2007-10-04', 1025, 701, 
   1671.53);
INSERT INTO pedidos
  VALUES (177, '2007-10-04', '2007-10-08', 1008, 706, 
   5755);
INSERT INTO pedidos
  VALUES (178, '2007-10-04', '2007-10-07', 1022, 702, 
   927.25);
INSERT INTO pedidos
  VALUES (179, '2007-10-04', '2007-10-08', 1017, 708, 
   10745.71);
INSERT INTO pedidos
  VALUES (180, '2007-10-05', '2007-10-08', 1015, 708, 
   760);
INSERT INTO pedidos
  VALUES (181, '2007-10-05', '2007-10-05', 1017, 708, 
   5759.58);
INSERT INTO pedidos
  VALUES (182, '2007-10-05', '2007-10-06', 1002, 702, 
   11539.75);
INSERT INTO pedidos
  VALUES (183, '2007-10-05', '2007-10-05', 1020, 708, 
   4517.19);
INSERT INTO pedidos
  VALUES (184, '2007-10-05', '2007-10-09', 1023, 707, 
   14414.5);
INSERT INTO pedidos
  VALUES (185, '2007-10-05', '2007-10-09', 1017, 702, 
   5938);
INSERT INTO pedidos
  VALUES (186, '2007-10-05', '2007-10-05', 1002, 704, 
   321.38);
INSERT INTO pedidos
  VALUES (187, '2007-10-06', '2007-10-07', 1022, 702, 
   624.68);
INSERT INTO pedidos
  VALUES (188, '2007-10-06', '2007-10-07', 1002, 706, 
   7362);
INSERT INTO pedidos
  VALUES (189, '2007-10-06', '2007-10-07', 1012, 702, 
   808.26);
INSERT INTO pedidos
  VALUES (190, '2007-10-06', '2007-10-10', 1024, 708, 
   197.88);
INSERT INTO pedidos
  VALUES (191, '2007-10-06', '2007-10-07', 1015, 701, 
   1552.43);
INSERT INTO pedidos
  VALUES (192, '2007-10-06', '2007-10-09', 1022, 702, 
   1293.14);
INSERT INTO pedidos
  VALUES (193, '2007-10-06', '2007-10-06', 1025, 708, 
   6137.9);
INSERT INTO pedidos
  VALUES (194, '2007-10-06', '2007-10-08', 1017, 708, 
   4406.79);
INSERT INTO pedidos
  VALUES (195, '2007-10-07', '2007-10-10', 1025, 703, 
   700);
INSERT INTO pedidos
  VALUES (196, '2007-10-07', '2007-10-11', 1009, 707, 
   3421.48);
INSERT INTO pedidos
  VALUES (197, '2007-10-07', '2007-10-10', 1002, 703, 
   179);
INSERT INTO pedidos
  VALUES (198, '2007-10-07', '2007-10-09', 1002, 703, 
   0);
INSERT INTO pedidos
  VALUES (199, '2007-10-07', '2007-10-09', 1008, 707, 
   1002.2);
INSERT INTO pedidos
  VALUES (200, '2007-10-07', '2007-10-08', 1026, 706, 
   7551.98);
INSERT INTO pedidos
  VALUES (201, '2007-10-07', '2007-10-08', 1018, 701, 
   43.38);
INSERT INTO pedidos
  VALUES (202, '2007-10-07', '2007-10-09', 1020, 705, 
   525);
INSERT INTO pedidos
  VALUES (203, '2007-10-08', '2007-10-08', 1023, 708, 
   6057.45);
INSERT INTO pedidos
  VALUES (204, '2007-10-08', '2007-10-08', 1026, 701, 
   334.65);
INSERT INTO pedidos
  VALUES (205, '2007-10-08', '2007-10-12', 1006, 706, 
   17794.64);
INSERT INTO pedidos
  VALUES (206, '2007-10-08', '2007-10-12', 1021, 704, 
   4247.8);
INSERT INTO pedidos
  VALUES (207, '2007-10-08', '2007-10-10', 1015, 704, 
   647.8);
INSERT INTO pedidos
  VALUES (208, '2007-10-09', '2007-10-11', 1019, 704, 
   1828.75);
INSERT INTO pedidos
  VALUES (209, '2007-10-10', '2007-10-11', 1002, 703, 
   289);
INSERT INTO pedidos
  VALUES (210, '2007-10-10', '2007-10-12', 1024, 701, 
   12508.28);
INSERT INTO pedidos
  VALUES (211, '2007-10-10', '2007-10-13', 1014, 701, 
   3079.75);
INSERT INTO pedidos
  VALUES (212, '2007-10-10', '2007-10-11', 1007, 704, 
   150);
INSERT INTO pedidos
  VALUES (213, '2007-10-11', '2007-10-12', 1001, 707, 
   492.96);
INSERT INTO pedidos
  VALUES (214, '2007-10-11', '2007-10-11', 1021, 703, 
   1470.32);
INSERT INTO pedidos
  VALUES (215, '2007-10-11', '2007-10-11', 1002, 708, 
   6297.58);
INSERT INTO pedidos
  VALUES (216, '2007-10-11', '2007-10-11', 1016, 707, 
   0);
INSERT INTO pedidos
  VALUES (217, '2007-10-12', '2007-10-14', 1020, 703, 
   9687);
INSERT INTO pedidos
  VALUES (218, '2007-10-12', '2007-10-15', 1014, 707, 
   7183.4);
INSERT INTO pedidos
  VALUES (219, '2007-10-12', '2007-10-13', 1018, 706, 
   3300.64);
INSERT INTO pedidos
  VALUES (220, '2007-10-12', '2007-10-14', 1014, 705, 
   14137.66);
INSERT INTO pedidos
  VALUES (221, '2007-10-12', '2007-10-14', 1008, 705, 
   2633.21);
INSERT INTO pedidos
  VALUES (222, '2007-10-12', '2007-10-16', 1007, 703, 
   8749.95);
INSERT INTO pedidos
  VALUES (223, '2007-10-12', '2007-10-15', 1025, 708, 
   17005);
INSERT INTO pedidos
  VALUES (224, '2007-10-12', '2007-10-15', 1011, 705, 
   6775.06);
INSERT INTO pedidos
  VALUES (225, '2007-10-13', '2007-10-13', 1017, 704, 
   5140.2);
INSERT INTO pedidos
  VALUES (226, '2007-10-13', '2007-10-15', 1023, 705, 
   510);
INSERT INTO pedidos
  VALUES (227, '2007-10-14', '2007-10-17', 1006, 704, 
   11126.18);
INSERT INTO pedidos
  VALUES (228, '2007-10-15', '2007-10-15', 1017, 701, 
   45);
INSERT INTO pedidos
  VALUES (229, '2007-10-15', '2007-10-18', 1024, 707, 
   3686);
INSERT INTO pedidos
  VALUES (230, '2007-10-15', '2007-10-19', 1008, 708, 
   727.5);
INSERT INTO pedidos
  VALUES (231, '2007-10-15', '2007-10-17', 1016, 706, 
   1544.78);
INSERT INTO pedidos
  VALUES (232, '2007-10-15', '2007-10-16', 1017, 703, 
   1676.15);
INSERT INTO pedidos
  VALUES (233, '2007-10-16', '2007-10-18', 1014, 708, 
   4001.58);
INSERT INTO pedidos
  VALUES (234, '2007-10-16', '2007-10-19', 1010, 702, 
   402);
INSERT INTO pedidos
  VALUES (235, '2007-10-16', '2007-10-19', 1015, 705, 
   657);
INSERT INTO pedidos
  VALUES (236, '2007-10-17', '2007-10-19', 1021, 704, 
   1678.33);
INSERT INTO pedidos
  VALUES (237, '2007-10-17', '2007-10-19', 1027, 702, 
   4732.33);
INSERT INTO pedidos
  VALUES (238, '2007-10-17', '2007-10-20', 1005, 705, 
   4654.65);
INSERT INTO pedidos
  VALUES (239, '2007-10-17', '2007-10-18', 1012, 703, 
   11239.65);
INSERT INTO pedidos
  VALUES (240, '2007-10-18', '2007-10-18', 1022, 701, 
   1151.16);
INSERT INTO pedidos
  VALUES (241, '2007-10-18', '2007-10-18', 1008, 705, 
   915.9);
INSERT INTO pedidos
  VALUES (242, '2007-10-18', '2007-10-20', 1010, 705, 
   10778.95);
INSERT INTO pedidos
  VALUES (243, '2007-10-18', '2007-10-21', 1020, 708, 
   6729);
INSERT INTO pedidos
  VALUES (244, '2007-10-18', '2007-10-21', 1014, 708, 
   9603);
INSERT INTO pedidos
  VALUES (245, '2007-10-18', '2007-10-19', 1015, 704, 
   1639.77);
INSERT INTO pedidos
  VALUES (246, '2007-10-19', '2007-10-22', 1004, 703, 
   6480.14);
INSERT INTO pedidos
  VALUES (247, '2007-10-19', '2007-10-22', 1005, 702, 
   3010.9);
INSERT INTO pedidos
  VALUES (248, '2007-10-19', '2007-10-20', 1021, 705, 
   5978);
INSERT INTO pedidos
  VALUES (249, '2007-10-19', '2007-10-22', 1016, 703, 
   7313.3);
INSERT INTO pedidos
  VALUES (250, '2007-10-19', '2007-10-21', 1023, 707, 
   1867.8);
INSERT INTO pedidos
  VALUES (251, '2007-10-19', '2007-10-22', 1005, 705, 
   10205.8);
INSERT INTO pedidos
  VALUES (252, '2007-10-19', '2007-10-20', 1010, 702, 
   4853.95);
INSERT INTO pedidos
  VALUES (253, '2007-10-20', '2007-10-20', 1024, 706, 
   7032);
INSERT INTO pedidos
  VALUES (254, '2007-10-21', '2007-10-25', 1002, 703, 
   1493.75);
INSERT INTO pedidos
  VALUES (255, '2007-10-21', '2007-10-21', 1008, 707, 
   28);
INSERT INTO pedidos
  VALUES (256, '2007-10-21', '2007-10-21', 1016, 705, 
   18384.75);
INSERT INTO pedidos
  VALUES (257, '2007-10-21', '2007-10-21', 1007, 708, 
   8275.45);
INSERT INTO pedidos
  VALUES (258, '2007-10-22', '2007-10-22', 1016, 705, 
   12279.65);
INSERT INTO pedidos
  VALUES (259, '2007-10-22', '2007-10-22', 1009, 702, 
   960.3);
INSERT INTO pedidos
  VALUES (260, '2007-10-22', '2007-10-22', 1006, 701, 
   4716.15);
INSERT INTO pedidos
  VALUES (261, '2007-10-22', '2007-10-26', 1020, 708, 
   1291.99);
INSERT INTO pedidos
  VALUES (262, '2007-10-22', '2007-10-24', 1020, 707, 
   162.96);
INSERT INTO pedidos
  VALUES (263, '2007-10-22', '2007-10-25', 1011, 705, 
   15781.1);
INSERT INTO pedidos
  VALUES (264, '2007-10-22', '2007-10-22', 1002, 702, 
   266.75);
INSERT INTO pedidos
  VALUES (265, '2007-10-22', '2007-10-25', 1014, 702, 
   8652.58);
INSERT INTO pedidos
  VALUES (266, '2007-10-22', '2007-10-26', 1021, 708, 
   7814);
INSERT INTO pedidos
  VALUES (267, '2007-10-22', '2007-10-23', 1004, 706, 
   4376);
INSERT INTO pedidos
  VALUES (268, '2007-10-23', '2007-10-24', 1021, 704, 
   15715.64);
INSERT INTO pedidos
  VALUES (269, '2007-10-23', '2007-10-24', 1016, 706, 
   4243.5);
INSERT INTO pedidos
  VALUES (270, '2007-10-23', '2007-10-26', 1007, 703, 
   1406.98);
INSERT INTO pedidos
  VALUES (271, '2007-10-24', '2007-10-24', 1010, 702, 
   3021);
INSERT INTO pedidos
  VALUES (272, '2007-10-24', '2007-10-26', 1005, 701, 
   8306.3);
INSERT INTO pedidos
  VALUES (273, '2007-10-24', '2007-10-24', 1024, 704, 
   5811.15);
INSERT INTO pedidos
  VALUES (274, '2007-10-24', '2007-10-26', 1004, 703, 
   537);
INSERT INTO pedidos
  VALUES (275, '2007-10-24', '2007-10-28', 1009, 701, 
   14.9);
INSERT INTO pedidos
  VALUES (276, '2007-10-24', '2007-10-24', 1018, 702, 
   14804);
INSERT INTO pedidos
  VALUES (277, '2007-10-24', '2007-10-24', 1012, 701, 
   333.8);
INSERT INTO pedidos
  VALUES (278, '2007-10-24', '2007-10-25', 1024, 707, 
   2506.98);
INSERT INTO pedidos
  VALUES (279, '2007-10-25', '2007-10-29', 1017, 706, 
   8635.25);
INSERT INTO pedidos
  VALUES (280, '2007-10-25', '2007-10-27', 1016, 702, 
   6127.5);
INSERT INTO pedidos
  VALUES (281, '2007-10-25', '2007-10-27', 1006, 708, 
   13621.75);
INSERT INTO pedidos
  VALUES (282, '2007-10-26', '2007-10-28', 1005, 702, 
   3142.75);
INSERT INTO pedidos
  VALUES (283, '2007-10-26', '2007-10-27', 1015, 702, 
   895.75);
INSERT INTO pedidos
  VALUES (284, '2007-10-26', '2007-10-30', 1016, 701, 
   13837.68);
INSERT INTO pedidos
  VALUES (285, '2007-10-26', '2007-10-27', 1024, 705, 
   1836);
INSERT INTO pedidos
  VALUES (286, '2007-10-26', '2007-10-27', 1019, 705, 
   5956);
INSERT INTO pedidos
  VALUES (287, '2007-10-26', '2007-10-29', 1018, 708, 
   197.9);
INSERT INTO pedidos
  VALUES (288, '2007-10-26', '2007-10-30', 1027, 704, 
   383.15);
INSERT INTO pedidos
  VALUES (289, '2007-10-27', '2007-10-31', 1002, 708, 
   1123.8);
INSERT INTO pedidos
  VALUES (290, '2007-10-28', '2007-10-28', 1018, 706, 
   2625);
INSERT INTO pedidos
  VALUES (291, '2007-10-28', '2007-12-01', 1025, 705, 
   5341.8);
INSERT INTO pedidos
  VALUES (292, '2007-10-28', '2007-10-28', 1013, 708, 
   2858.5);
INSERT INTO pedidos
  VALUES (293, '2007-10-28', '2007-10-29', 1025, 706, 
   4787.45);
INSERT INTO pedidos
  VALUES (294, '2007-10-29', '2007-10-30', 1017, 706, 
   5338.79);
INSERT INTO pedidos
  VALUES (295, '2007-10-29', '2007-10-29', 1012, 701, 
   6983.88);
INSERT INTO pedidos
  VALUES (296, '2007-10-29', '2007-10-29', 1014, 707, 
   2454);
INSERT INTO pedidos
  VALUES (297, '2007-10-29', '2007-11-01', 1008, 701, 
   1876.25);
INSERT INTO pedidos
  VALUES (298, '2007-10-29', '2007-11-01', 1005, 701, 
   7484);
INSERT INTO pedidos
  VALUES (299, '2007-10-30', '2007-11-03', 1021, 704, 
   402.95);
INSERT INTO pedidos
  VALUES (300, '2007-10-30', '2007-10-30', 1011, 706, 
   15969.5);
INSERT INTO pedidos
  VALUES (301, '2007-10-30', '2007-11-03', 1025, 704, 
   3798.75);
INSERT INTO pedidos
  VALUES (302, '2007-10-30', '2007-11-01', 1007, 702, 
   5880.15);
INSERT INTO pedidos
  VALUES (303, '2007-10-31', '2007-11-03', 1011, 705, 
   2105.68);
INSERT INTO pedidos
  VALUES (304, '2007-10-31', '2007-11-04', 1015, 701, 
   923.8);
INSERT INTO pedidos
  VALUES (305, '2007-10-31', '2007-11-04', 1013, 708, 
   0);
INSERT INTO pedidos
  VALUES (306, '2007-10-31', '2007-11-02', 1026, 701, 
   4940.58);
INSERT INTO pedidos
  VALUES (307, '2007-10-31', '2007-11-01', 1013, 704, 
   5785);
INSERT INTO pedidos
  VALUES (308, '2007-10-31', '2007-11-01', 1002, 701, 
   5441.88);
INSERT INTO pedidos
  VALUES (309, '2007-10-31', '2007-11-03', 1020, 707, 
   1295.9);
INSERT INTO pedidos
  VALUES (310, '2007-10-31', '2007-11-02', 1025, 703, 
   13709.9);
INSERT INTO pedidos
  VALUES (311, '2007-11-01', '2007-11-03', 1003, 708, 
   1072.7);
INSERT INTO pedidos
  VALUES (312, '2007-11-01', '2007-11-01', 1003, 707, 
   1019.54);
INSERT INTO pedidos
  VALUES (313, '2007-11-01', '2007-11-01', 1024, 701, 
   6112.04);
INSERT INTO pedidos
  VALUES (314, '2007-11-01', '2007-11-03', 1007, 706, 
   432.75);
INSERT INTO pedidos
  VALUES (315, '2007-11-01', '2007-11-05', 1024, 702, 
   8799.15);
INSERT INTO pedidos
  VALUES (316, '2007-11-01', '2007-11-05', 1018, 705, 
   966.12);
INSERT INTO pedidos
  VALUES (317, '2007-11-01', '2007-11-01', 1012, 703, 
   4141.12);
INSERT INTO pedidos
  VALUES (318, '2007-11-01', '2007-11-02', 1024, 703, 
   3695.7);
INSERT INTO pedidos
  VALUES (319, '2007-11-02', '2007-11-03', 1005, 701, 
   3064);
INSERT INTO pedidos
  VALUES (320, '2007-11-02', '2007-11-06', 1001, 707, 
   220);
INSERT INTO pedidos
  VALUES (321, '2007-11-02', '2007-11-04', 1011, 701, 
   6824.15);
INSERT INTO pedidos
  VALUES (322, '2007-11-02', '2007-11-03', 1001, 701, 
   660);
INSERT INTO pedidos
  VALUES (323, '2007-11-02', '2007-11-04', 1011, 706, 
   5577.25);
INSERT INTO pedidos
  VALUES (324, '2007-11-02', '2007-11-03', 1016, 704, 
   50);
INSERT INTO pedidos
  VALUES (325, '2007-11-02', '2007-11-03', 1002, 706, 
   6780.39);
INSERT INTO pedidos
  VALUES (326, '2007-11-02', '2007-11-06', 1024, 704, 
   242.5);
INSERT INTO pedidos
  VALUES (327, '2007-11-02', '2007-11-02', 1012, 703, 
   2942.05);
INSERT INTO pedidos
  VALUES (328, '2007-11-02', '2007-11-05', 1009, 702, 
   960.3);
INSERT INTO pedidos
  VALUES (329, '2007-11-03', '2007-11-05', 1004, 708, 
   11384.54);
INSERT INTO pedidos
  VALUES (330, '2007-11-03', '2007-11-06', 1021, 708, 
   949.55);
INSERT INTO pedidos
  VALUES (331, '2007-11-03', '2007-11-05', 1018, 702, 
   12105.31);
INSERT INTO pedidos
  VALUES (332, '2007-11-04', '2007-11-04', 1006, 704, 
   4831);
INSERT INTO pedidos
  VALUES (333, '2007-11-04', '2007-11-06', 1003, 708, 
   1854.66);
INSERT INTO pedidos
  VALUES (334, '2007-11-04', '2007-11-08', 1009, 707, 
   4173.33);
INSERT INTO pedidos
  VALUES (335, '2007-11-04', '2007-11-05', 1020, 703, 
   13055.5);
INSERT INTO pedidos
  VALUES (336, '2007-11-05', '2007-11-06', 1020, 703, 
   15047.75);
INSERT INTO pedidos
  VALUES (337, '2007-11-05', '2007-11-06', 1011, 706, 
   3142.85);
INSERT INTO pedidos
  VALUES (338, '2007-11-05', '2007-11-05', 1009, 708, 
   8173.25);
INSERT INTO pedidos
  VALUES (339, '2007-11-05', '2007-11-09', 1005, 705, 
   14842.5);
INSERT INTO pedidos
  VALUES (340, '2007-11-05', '2007-11-09', 1026, 707, 
   4020.55);
INSERT INTO pedidos
  VALUES (341, '2007-11-06', '2007-11-07', 1022, 704, 
   81);
INSERT INTO pedidos
  VALUES (342, '2007-11-07', '2007-11-09', 1013, 702, 
   4589.5);
INSERT INTO pedidos
  VALUES (343, '2007-11-07', '2007-11-10', 1025, 708, 
   8323.5);
INSERT INTO pedidos
  VALUES (344, '2007-11-07', '2007-11-11', 1005, 702, 
   7060.28);
INSERT INTO pedidos
  VALUES (345, '2007-11-07', '2007-11-10', 1008, 701, 
   5809);
INSERT INTO pedidos
  VALUES (346, '2007-11-07', '2007-11-11', 1001, 702, 
   1253.7);
INSERT INTO pedidos
  VALUES (347, '2007-11-08', '2007-11-08', 1020, 705, 
   7254);
INSERT INTO pedidos
  VALUES (348, '2007-11-08', '2007-11-10', 1015, 703, 
   1724.07);
INSERT INTO pedidos
  VALUES (349, '2007-11-08', '2007-11-09', 1001, 703, 
   725.8);
INSERT INTO pedidos
  VALUES (350, '2007-11-08', '2007-11-10', 1019, 703, 
   3079.75);
INSERT INTO pedidos
  VALUES (351, '2007-11-09', '2007-11-13', 1012, 704, 
   8363.06);
INSERT INTO pedidos
  VALUES (352, '2007-11-09', '2007-11-10', 1020, 706, 
   523.05);
INSERT INTO pedidos
  VALUES (353, '2007-11-09', '2007-11-13', 1026, 704, 
   16167.68);
INSERT INTO pedidos
  VALUES (354, '2007-11-10', '2007-11-11', 1021, 706, 
   5003.45);
INSERT INTO pedidos
  VALUES (355, '2007-11-10', '2007-11-11', 1014, 702, 
   7710);
INSERT INTO pedidos
  VALUES (356, '2007-11-10', '2007-11-14', 1018, 702, 
   2189);
INSERT INTO pedidos
  VALUES (357, '2007-11-10', '2007-11-12', 1003, 705, 
   1350.85);
INSERT INTO pedidos
  VALUES (358, '2007-11-10', '2007-11-14', 1012, 701, 
   11468.8);
INSERT INTO pedidos
  VALUES (359, '2007-11-11', '2007-11-12', 1024, 707, 
   17772.3);
INSERT INTO pedidos
  VALUES (360, '2007-11-11', '2007-11-13', 1013, 707, 
   17692.85);
INSERT INTO pedidos
  VALUES (361, '2007-11-11', '2007-11-12', 1016, 706, 
   0);
INSERT INTO pedidos
  VALUES (362, '2007-11-11', '2007-11-12', 1012, 701, 
   16241.6);
INSERT INTO pedidos
  VALUES (363, '2007-11-11', '2007-11-12', 1010, 706, 
   11173.5);
INSERT INTO pedidos
  VALUES (364, '2007-11-11', '2007-11-14', 1010, 705, 
   571);
INSERT INTO pedidos
  VALUES (365, '2007-11-11', '2007-11-12', 1011, 705, 
   267.3);
INSERT INTO pedidos
  VALUES (366, '2007-11-11', '2007-11-12', 1004, 708, 
   9126.31);
INSERT INTO pedidos
  VALUES (367, '2007-11-11', '2007-11-11', 1011, 703, 
   13222.6);
INSERT INTO pedidos
  VALUES (368, '2007-11-12', '2007-11-13', 1017, 708, 
   5277.24);
INSERT INTO pedidos
  VALUES (369, '2007-11-12', '2007-11-13', 1003, 707, 
   108);
INSERT INTO pedidos
  VALUES (370, '2007-11-12', '2007-11-12', 1025, 708, 
   2951.65);
INSERT INTO pedidos
  VALUES (371, '2007-11-12', '2007-12-15', 1009, 701, 
   816.74);
INSERT INTO pedidos
  VALUES (372, '2007-11-12', '2007-11-14', 1025, 707, 
   9125.21);
INSERT INTO pedidos
  VALUES (373, '2007-11-12', '2007-11-15', 1014, 701, 
   9835.5);
INSERT INTO pedidos
  VALUES (374, '2007-11-12', '2007-11-12', 1005, 701, 
   6428.24);
INSERT INTO pedidos
  VALUES (375, '2007-11-13', '2007-11-15', 1004, 704, 
   4392.9);
INSERT INTO pedidos
  VALUES (376, '2007-11-13', '2007-11-13', 1015, 704, 
   1715.49);
INSERT INTO pedidos
  VALUES (377, '2007-11-13', '2007-11-17', 1019, 705, 
   2227.8);
INSERT INTO pedidos
  VALUES (378, '2007-11-13', '2007-11-14', 1014, 707, 
   8562.73);
INSERT INTO pedidos
  VALUES (379, '2007-11-13', '2007-11-17', 1025, 706, 
   11509.5);
INSERT INTO pedidos
  VALUES (380, '2007-11-13', '2007-11-16', 1023, 704, 
   207);
INSERT INTO pedidos
  VALUES (381, '2007-11-14', '2007-11-16', 1012, 701, 
   5449.24);
INSERT INTO pedidos
  VALUES (382, '2007-11-15', '2007-11-15', 1017, 705, 
   559.8);
INSERT INTO pedidos
  VALUES (383, '2007-11-16', '2007-11-19', 1017, 702, 
   12039.75);
INSERT INTO pedidos
  VALUES (384, '2007-11-16', '2007-11-16', 1021, 708, 
   3248.75);
INSERT INTO pedidos
  VALUES (385, '2007-11-17', '2007-11-20', 1019, 701, 
   13850.94);
INSERT INTO pedidos
  VALUES (386, '2007-11-17', '2007-11-17', 1021, 705, 
   8210.88);
INSERT INTO pedidos
  VALUES (387, '2007-11-17', '2007-12-21', 1010, 708, 
   16587.5);
INSERT INTO pedidos
  VALUES (388, '2007-11-17', '2007-11-21', 1008, 705, 
   4654.98);
INSERT INTO pedidos
  VALUES (389, '2007-11-17', '2007-11-20', 1005, 706, 
   1447.3);
INSERT INTO pedidos
  VALUES (390, '2007-11-17', '2007-11-20', 1016, 708, 
   13641.5);
INSERT INTO pedidos
  VALUES (391, '2007-11-17', '2007-11-17', 1024, 702, 
   5478.55);
INSERT INTO pedidos
  VALUES (392, '2007-11-17', '2007-11-21', 1006, 708, 
   9156.33);
INSERT INTO pedidos
  VALUES (393, '2007-11-18', '2007-11-20', 1011, 704, 
   3687);
INSERT INTO pedidos
  VALUES (394, '2007-11-18', '2007-11-21', 1001, 702, 
   130.97);
INSERT INTO pedidos
  VALUES (395, '2007-11-19', '2007-11-23', 1014, 703, 
   3079.75);
INSERT INTO pedidos
  VALUES (396, '2007-11-19', '2007-11-20', 1019, 706, 
   495.78);
INSERT INTO pedidos
  VALUES (397, '2007-11-19', '2007-11-19', 1020, 701, 
   500);
INSERT INTO pedidos
  VALUES (398, '2007-11-20', '2007-11-22', 1004, 708, 
   14283);
INSERT INTO pedidos
  VALUES (399, '2007-11-20', '2007-11-23', 1007, 704, 
   18260.95);
INSERT INTO pedidos
  VALUES (400, '2007-11-20', '2007-11-24', 1026, 705, 
   7251.75);
INSERT INTO pedidos
  VALUES (401, '2007-11-20', '2007-11-21', 1003, 702, 
   1014.9);
INSERT INTO pedidos
  VALUES (402, '2007-11-20', '2007-11-22', 1017, 704, 
   2779);
INSERT INTO pedidos
  VALUES (403, '2007-11-20', '2007-11-20', 1006, 702, 
   19676.05);
INSERT INTO pedidos
  VALUES (404, '2007-11-20', '2007-11-21', 1019, 708, 
   8730);
INSERT INTO pedidos
  VALUES (405, '2007-11-20', '2007-11-23', 1023, 702, 
   6988.65);
INSERT INTO pedidos
  VALUES (406, '2007-11-21', '2007-11-25', 1012, 706, 
   7209.6);
INSERT INTO pedidos
  VALUES (407, '2007-11-22', '2007-11-25', 1001, 701, 
   188.68);
INSERT INTO pedidos
  VALUES (408, '2007-11-23', '2007-11-27', 1001, 703, 
   261.9);
INSERT INTO pedidos
  VALUES (409, '2007-11-23', '2007-11-24', 1024, 704, 
   5956);
INSERT INTO pedidos
  VALUES (410, '2007-11-23', '2007-11-24', 1008, 702, 
   2698);
INSERT INTO pedidos
  VALUES (411, '2007-11-24', '2007-11-25', 1002, 708, 
   6984);
INSERT INTO pedidos
  VALUES (412, '2007-11-24', '2007-11-27', 1026, 708, 
   1178.58);
INSERT INTO pedidos
  VALUES (413, '2007-11-24', '2007-11-25', 1001, 708, 
   402);
INSERT INTO pedidos
  VALUES (414, '2007-11-24', '2007-11-28', 1020, 703, 
   16345.65);
INSERT INTO pedidos
  VALUES (415, '2007-11-24', '2007-11-27', 1013, 705, 
   4851.3);
INSERT INTO pedidos
  VALUES (416, '2007-11-24', '2007-11-25', 1024, 705, 
   4618.33);
INSERT INTO pedidos
  VALUES (417, '2007-11-24', '2007-11-27', 1017, 703, 
   166);
INSERT INTO pedidos
  VALUES (418, '2007-11-24', '2007-11-24', 1012, 705, 
   2443.08);
INSERT INTO pedidos
  VALUES (419, '2007-11-25', '2007-11-25', 1006, 708, 
   8002.5);
INSERT INTO pedidos
  VALUES (420, '2007-11-25', '2007-11-25', 1024, 704, 
   3505.5);
INSERT INTO pedidos
  VALUES (421, '2007-11-25', '2007-11-28', 1022, 704, 
   441.75);
INSERT INTO pedidos
  VALUES (422, '2007-11-25', '2007-11-26', 1027, 707, 
   5901);
INSERT INTO pedidos
  VALUES (423, '2007-11-25', '2007-11-29', 1010, 708, 
   2010.02);
INSERT INTO pedidos
  VALUES (424, '2007-11-25', '2007-11-27', 1025, 706, 
   39);
INSERT INTO pedidos
  VALUES (425, '2007-11-26', '2007-11-30', 1001, 707, 
   286);
INSERT INTO pedidos
  VALUES (426, '2007-11-26', '2007-11-29', 1001, 707, 
   1294);
INSERT INTO pedidos
  VALUES (427, '2007-11-26', '2007-11-29', 1020, 702, 
   767.8);
INSERT INTO pedidos
  VALUES (428, '2007-11-26', '2007-11-27', 1024, 703, 
   2340.35);
INSERT INTO pedidos
  VALUES (429, '2007-11-26', '2007-11-29', 1016, 701, 
   567);
INSERT INTO pedidos
  VALUES (430, '2007-11-26', '2007-11-30', 1009, 707, 
   102);
INSERT INTO pedidos
  VALUES (431, '2007-11-27', '2007-11-30', 1016, 705, 
   2344.25);
INSERT INTO pedidos
  VALUES (432, '2007-11-27', '2007-11-30', 1022, 702, 
   1204.12);
INSERT INTO pedidos
  VALUES (433, '2007-11-27', '2007-11-27', 1017, 708, 
   10291.25);
INSERT INTO pedidos
  VALUES (434, '2007-11-27', '2007-11-29', 1012, 703, 
   9343.79);
INSERT INTO pedidos
  VALUES (435, '2007-11-27', '2007-11-29', 1016, 706, 
   47);
INSERT INTO pedidos
  VALUES (436, '2007-11-27', '2007-11-30', 1014, 703, 
   180.2);
INSERT INTO pedidos
  VALUES (437, '2007-11-27', '2007-11-29', 1002, 705, 
   5832.95);
INSERT INTO pedidos
  VALUES (438, '2007-11-27', '2007-12-01', 1020, 708, 
   1026.4);
INSERT INTO pedidos
  VALUES (439, '2007-11-28', '2007-12-02', 1025, 703, 
   6457);
INSERT INTO pedidos
  VALUES (440, '2007-11-28', '2007-11-29', 1027, 708, 
   1695);
INSERT INTO pedidos
  VALUES (441, '2007-11-28', '2007-11-28', 1010, 701, 
   19325.05);
INSERT INTO pedidos
  VALUES (442, '2007-11-28', '2007-12-01', 1002, 705, 
   662);
INSERT INTO pedidos
  VALUES (443, '2007-11-29', '2007-12-02', 1001, 704, 
   2123.95);
INSERT INTO pedidos
  VALUES (444, '2007-11-29', '2007-11-30', 1002, 706, 
   2135.47);
INSERT INTO pedidos
  VALUES (445, '2007-11-29', '2007-11-30', 1007, 705, 
   12313);
INSERT INTO pedidos
  VALUES (446, '2007-11-29', '2007-12-03', 1010, 708, 
   87.98);
INSERT INTO pedidos
  VALUES (447, '2007-11-29', '2007-11-30', 1018, 702, 
   6020.94);
INSERT INTO pedidos
  VALUES (448, '2007-11-29', '2007-12-01', 1001, 701, 
   301.9);
INSERT INTO pedidos
  VALUES (449, '2007-11-29', '2007-11-29', 1025, 707, 
   16673.05);
INSERT INTO pedidos
  VALUES (450, '2007-11-30', '2007-12-04', 1004, 705, 
   4232.75);
INSERT INTO pedidos
  VALUES (451, '2007-11-30', '2007-12-02', 1003, 706, 
   220);
INSERT INTO pedidos
  VALUES (452, '2007-11-30', '2007-12-02', 1001, 702, 
   1018.5);
INSERT INTO pedidos
  VALUES (453, '2007-11-30', '2007-12-04', 1027, 708, 
   1854.5);
INSERT INTO pedidos
  VALUES (454, '2007-11-30', '2007-12-02', 1010, 703, 
   1248.96);
INSERT INTO pedidos
  VALUES (455, '2007-11-30', '2007-12-01', 1005, 702, 
   1705.78);
INSERT INTO pedidos
  VALUES (456, '2007-12-01', '2007-12-02', 1015, 705, 
   375);
INSERT INTO pedidos
  VALUES (457, '2007-12-01', '2007-12-05', 1019, 701, 
   2811);
INSERT INTO pedidos
  VALUES (458, '2007-12-02', '2007-12-02', 1003, 702, 
   654.95);
INSERT INTO pedidos
  VALUES (459, '2007-12-02', '2007-12-03', 1007, 707, 
   1682.62);
INSERT INTO pedidos
  VALUES (460, '2007-12-03', '2007-12-05', 1013, 704, 
   1905);
INSERT INTO pedidos
  VALUES (461, '2007-12-03', '2007-12-07', 1021, 703, 
   2852.86);
INSERT INTO pedidos
  VALUES (462, '2007-12-03', '2007-12-03', 1004, 705, 
   254.25);
INSERT INTO pedidos
  VALUES (463, '2007-12-04', '2007-12-07', 1015, 705, 
   477.24);
INSERT INTO pedidos
  VALUES (464, '2007-12-04', '2007-12-07', 1020, 705, 
   5346);
INSERT INTO pedidos
  VALUES (465, '2007-12-04', '2007-12-04', 1012, 706, 
   10361.04);
INSERT INTO pedidos
  VALUES (466, '2007-12-05', '2007-12-06', 1026, 704, 
   6257.99);
INSERT INTO pedidos
  VALUES (467, '2007-12-05', '2007-12-05', 1013, 706, 
   9826);
INSERT INTO pedidos
  VALUES (468, '2007-12-05', '2007-12-06', 1010, 708, 
   6546.06);
INSERT INTO pedidos
  VALUES (469, '2007-12-05', '2007-12-05', 1011, 708, 
   8792.99);
INSERT INTO pedidos
  VALUES (470, '2007-12-05', '2007-12-08', 1014, 703, 
   709.32);
INSERT INTO pedidos
  VALUES (471, '2007-12-05', '2007-12-07', 1025, 701, 
   130.95);
INSERT INTO pedidos
  VALUES (472, '2007-12-05', '2007-12-09', 1023, 707, 
   7648);
INSERT INTO pedidos
  VALUES (473, '2007-12-05', '2007-12-08', 1016, 702, 
   1832.18);
INSERT INTO pedidos
  VALUES (474, '2007-12-05', '2007-12-08', 1006, 703, 
   842.12);
INSERT INTO pedidos
  VALUES (475, '2007-12-06', '2007-12-10', 1001, 702, 
   1109.45);
INSERT INTO pedidos
  VALUES (476, '2007-12-06', '2007-12-10', 1014, 705, 
   1201);
INSERT INTO pedidos
  VALUES (477, '2007-12-06', '2007-12-06', 1009, 708, 
   6594.19);
INSERT INTO pedidos
  VALUES (478, '2007-12-06', '2007-12-10', 1004, 707, 
   1352.5);
INSERT INTO pedidos
  VALUES (479, '2007-12-06', '2007-12-09', 1024, 705, 
   7708);
INSERT INTO pedidos
  VALUES (480, '2007-12-06', '2007-12-06', 1011, 703, 
   4265);
INSERT INTO pedidos
  VALUES (481, '2007-12-07', '2007-12-10', 1009, 702, 
   637.96);
INSERT INTO pedidos
  VALUES (482, '2007-12-07', '2007-12-07', 1011, 705, 
   207);
INSERT INTO pedidos
  VALUES (483, '2007-12-07', '2007-12-08', 1005, 704, 
   4814.7);
INSERT INTO pedidos
  VALUES (484, '2007-12-08', '2007-12-09', 1021, 707, 
   0);
INSERT INTO pedidos
  VALUES (485, '2007-12-08', '2007-12-10', 1003, 707, 
   2107.74);
INSERT INTO pedidos
  VALUES (486, '2007-12-08', '2007-12-09', 1022, 705, 
   956);
INSERT INTO pedidos
  VALUES (487, '2007-12-08', '2007-12-10', 1009, 704, 
   3241);
INSERT INTO pedidos
  VALUES (488, '2007-12-08', '2007-12-10', 1025, 703, 
   171);
INSERT INTO pedidos
  VALUES (489, '2007-12-08', '2007-12-08', 1005, 701, 
   710.3);
INSERT INTO pedidos
  VALUES (490, '2007-12-08', '2007-12-10', 1009, 702, 
   2781.9);
INSERT INTO pedidos
  VALUES (491, '2007-12-08', '2007-12-09', 1007, 708, 
   5643.35);
INSERT INTO pedidos
  VALUES (492, '2007-12-09', '2007-12-11', 1008, 702, 
   3035.62);
INSERT INTO pedidos
  VALUES (493, '2007-12-09', '2007-12-13', 1005, 708, 
   3861.9);
INSERT INTO pedidos
  VALUES (494, '2007-12-09', '2007-12-13', 1012, 701, 
   108);
INSERT INTO pedidos
  VALUES (495, '2007-12-09', '2007-12-10', 1012, 702, 
   6843.49);
INSERT INTO pedidos
  VALUES (496, '2007-12-10', '2007-12-10', 1014, 701, 
   1949.85);
INSERT INTO pedidos
  VALUES (497, '2007-12-10', '2007-12-11', 1002, 701, 
   1882.55);
INSERT INTO pedidos
  VALUES (498, '2007-12-10', '2007-12-12', 1018, 708, 
   7862.98);
INSERT INTO pedidos
  VALUES (499, '2007-12-10', '2007-12-14', 1016, 704, 
   16909.14);
INSERT INTO pedidos
  VALUES (500, '2007-12-10', '2007-12-10', 1007, 705, 
   3037);
INSERT INTO pedidos
  VALUES (501, '2007-12-11', '2007-12-14', 1001, 702, 
   548.95);
INSERT INTO pedidos
  VALUES (502, '2007-12-11', '2007-12-14', 1025, 707, 
   10964.75);
INSERT INTO pedidos
  VALUES (503, '2007-12-11', '2007-12-13', 1026, 706, 
   3638.05);
INSERT INTO pedidos
  VALUES (504, '2007-12-11', '2007-12-14', 1004, 707, 
   189);
INSERT INTO pedidos
  VALUES (505, '2007-12-11', '2007-12-15', 1006, 707, 
   7268.98);
INSERT INTO pedidos
  VALUES (506, '2007-12-11', '2007-12-13', 1016, 704, 
   6195);
INSERT INTO pedidos
  VALUES (507, '2007-12-11', '2007-12-11', 1017, 705, 
   1252.71);
INSERT INTO pedidos
  VALUES (508, '2007-12-11', '2007-12-14', 1012, 704, 
   16688.85);
INSERT INTO pedidos
  VALUES (509, '2007-12-12', '2007-12-13', 1010, 701, 
   6058.15);
INSERT INTO pedidos
  VALUES (510, '2007-12-12', '2007-12-13', 1015, 703, 
   973.9);
INSERT INTO pedidos
  VALUES (511, '2007-12-12', '2007-12-12', 1026, 706, 
   9576.65);
INSERT INTO pedidos
  VALUES (512, '2007-12-12', '2007-12-14', 1027, 708, 
   291);
INSERT INTO pedidos
  VALUES (513, '2007-12-12', '2007-12-15', 1012, 707, 
   9682.48);
INSERT INTO pedidos
  VALUES (514, '2007-12-12', '2007-12-14', 1025, 705, 
   8441.25);
INSERT INTO pedidos
  VALUES (515, '2007-12-12', '2007-12-15', 1003, 705, 
   1191);
INSERT INTO pedidos
  VALUES (516, '2007-12-12', '2007-12-16', 1021, 703, 
   3845.58);
INSERT INTO pedidos
  VALUES (517, '2007-12-13', '2007-12-15', 1007, 706, 
   1210.41);
INSERT INTO pedidos
  VALUES (518, '2007-12-13', '2007-12-14', 1007, 704, 
   194.05);
INSERT INTO pedidos
  VALUES (519, '2007-12-13', '2007-12-15', 1018, 701, 
   424.33);
INSERT INTO pedidos
  VALUES (520, '2007-12-13', '2007-12-17', 1027, 704, 
   2949.88);
INSERT INTO pedidos
  VALUES (521, '2007-12-13', '2007-12-17', 1009, 708, 
   2466);
INSERT INTO pedidos
  VALUES (522, '2007-12-13', '2007-12-17', 1009, 708, 
   4.99);
INSERT INTO pedidos
  VALUES (523, '2007-12-14', '2007-12-16', 1003, 704, 
   0);
INSERT INTO pedidos
  VALUES (524, '2007-12-15', '2007-12-19', 1002, 701, 
   136);
INSERT INTO pedidos
  VALUES (525, '2007-12-15', '2007-12-18', 1019, 705, 
   560.04);
INSERT INTO pedidos
  VALUES (526, '2007-12-15', '2007-12-18', 1011, 705, 
   228.05);
INSERT INTO pedidos
  VALUES (527, '2007-12-15', '2007-12-19', 1009, 707, 
   49);
INSERT INTO pedidos
  VALUES (528, '2007-12-16', '2007-12-17', 1026, 701, 
   5646);
INSERT INTO pedidos
  VALUES (529, '2007-12-16', '2007-12-18', 1013, 703, 
   7951.3);
INSERT INTO pedidos
  VALUES (530, '2007-12-16', '2007-12-18', 1009, 701, 
   14227.36);
INSERT INTO pedidos
  VALUES (531, '2007-12-16', '2007-12-16', 1012, 707, 
   5428.3);
INSERT INTO pedidos
  VALUES (532, '2007-12-17', '2007-12-18', 1027, 706, 
   7190.05);
INSERT INTO pedidos
  VALUES (533, '2007-12-17', '2007-12-20', 1017, 702, 
   15235.23);
INSERT INTO pedidos
  VALUES (534, '2007-12-17', '2007-12-17', 1017, 706, 
   570.9);
INSERT INTO pedidos
  VALUES (535, '2007-12-17', '2007-12-18', 1020, 703, 
   6234.63);
INSERT INTO pedidos
  VALUES (536, '2007-12-17', '2007-12-20', 1020, 702, 
   1719.87);
INSERT INTO pedidos
  VALUES (537, '2007-12-17', '2007-12-20', 1003, 703, 
   1004.05);
INSERT INTO pedidos
  VALUES (538, '2007-12-18', '2007-12-19', 1008, 703, 
   9710.88);
INSERT INTO pedidos
  VALUES (539, '2007-12-19', '2007-12-23', 1008, 701, 
   9069.75);
INSERT INTO pedidos
  VALUES (540, '2007-12-19', '2007-12-23', 1007, 707, 
   7422.5);
INSERT INTO pedidos
  VALUES (541, '2007-12-20', '2007-12-22', 1006, 701, 
   17369.98);
INSERT INTO pedidos
  VALUES (542, '2007-12-21', '2007-12-24', 1008, 704, 
   3897.9);
INSERT INTO pedidos
  VALUES (543, '2007-12-21', '2007-12-24', 1005, 707, 
   334.65);
INSERT INTO pedidos
  VALUES (544, '2007-12-21', '2007-12-21', 1009, 704, 
   7996.25);
INSERT INTO pedidos
  VALUES (545, '2007-12-21', '2007-12-25', 1010, 707, 
   10489.65);
INSERT INTO pedidos
  VALUES (546, '2007-12-21', '2007-12-21', 1013, 702, 
   407.25);
INSERT INTO pedidos
  VALUES (547, '2007-12-21', '2007-12-21', 1011, 708, 
   2271.25);
INSERT INTO pedidos
  VALUES (548, '2007-12-21', '2007-12-23', 1004, 707, 
   6109.4);
INSERT INTO pedidos
  VALUES (549, '2007-12-21', '2007-12-21', 1024, 703, 
   140.65);
INSERT INTO pedidos
  VALUES (550, '2007-12-22', '2007-12-24', 1003, 706, 
   797);
INSERT INTO pedidos
  VALUES (551, '2007-12-23', '2007-12-27', 1010, 705, 
   1696.03);
INSERT INTO pedidos
  VALUES (552, '2007-12-23', '2007-12-26', 1023, 705, 
   17551.2);
INSERT INTO pedidos
  VALUES (553, '2007-12-23', '2007-12-27', 1002, 705, 
   6317);
INSERT INTO pedidos
  VALUES (554, '2007-12-23', '2007-12-24', 1002, 701, 
   6872.2);
INSERT INTO pedidos
  VALUES (555, '2007-12-23', '2007-12-26', 1003, 703, 
   1658.25);
INSERT INTO pedidos
  VALUES (556, '2007-12-23', '2007-12-27', 1019, 701, 
   6504.03);
INSERT INTO pedidos
  VALUES (557, '2007-12-23', '2007-12-23', 1026, 702, 
   8430.09);
INSERT INTO pedidos
  VALUES (558, '2007-12-24', '2007-12-25', 1009, 708, 
   10842.85);
INSERT INTO pedidos
  VALUES (559, '2007-12-24', '2007-12-26', 1011, 706, 
   5559.78);
INSERT INTO pedidos
  VALUES (560, '2007-12-24', '2007-12-28', 1016, 707, 
   6769.96);
INSERT INTO pedidos
  VALUES (561, '2007-12-24', '2007-12-27', 1025, 704, 
   3600);
INSERT INTO pedidos
  VALUES (562, '2007-12-24', '2007-12-27', 1006, 705, 
   147);
INSERT INTO pedidos
  VALUES (563, '2007-12-24', '2007-12-25', 1020, 704, 
   4783.5);
INSERT INTO pedidos
  VALUES (564, '2007-12-24', '2007-12-26', 1001, 706, 
   214);
INSERT INTO pedidos
  VALUES (565, '2007-12-25', '2007-12-27', 1014, 705, 
   2429);
INSERT INTO pedidos
  VALUES (566, '2007-12-25', '2007-12-26', 1007, 706, 
   985.21);
INSERT INTO pedidos
  VALUES (567, '2007-12-25', '2007-12-27', 1001, 703, 
   882.5);
INSERT INTO pedidos
  VALUES (568, '2007-12-25', '2007-12-26', 1024, 704, 
   197.88);
INSERT INTO pedidos
  VALUES (569, '2007-12-25', '2007-12-27', 1004, 707, 
   6354.5);
INSERT INTO pedidos
  VALUES (570, '2007-12-25', '2007-12-29', 1022, 707, 
   742.19);
INSERT INTO pedidos
  VALUES (571, '2007-12-26', '2008-01-29', 1019, 704, 
   2423.8);
INSERT INTO pedidos
  VALUES (572, '2007-12-26', '2007-12-26', 1003, 703, 
   1397.36);
INSERT INTO pedidos
  VALUES (573, '2007-12-26', '2007-12-28', 1019, 701, 
   10102.95);
INSERT INTO pedidos
  VALUES (574, '2007-12-26', '2007-12-26', 1003, 704, 
   160.05);
INSERT INTO pedidos
  VALUES (575, '2007-12-26', '2007-12-30', 1027, 707, 
   12368.54);
INSERT INTO pedidos
  VALUES (576, '2007-12-27', '2007-12-27', 1005, 705, 
   56);
INSERT INTO pedidos
  VALUES (577, '2007-12-27', '2007-12-27', 1014, 706, 
   678.25);
INSERT INTO pedidos
  VALUES (578, '2007-12-27', '2007-12-28', 1026, 708, 
   1861.62);
INSERT INTO pedidos
  VALUES (579, '2007-12-27', '2007-12-31', 1012, 707, 
   15391);
INSERT INTO pedidos
  VALUES (580, '2007-12-27', '2007-12-27', 1011, 705, 
   1112.5);
INSERT INTO pedidos
  VALUES (581, '2007-12-28', '2007-12-28', 1003, 704, 
   1268.98);
INSERT INTO pedidos
  VALUES (582, '2007-12-28', '2007-12-31', 1004, 703, 
   3727.95);
INSERT INTO pedidos
  VALUES (583, '2007-12-28', '2007-12-28', 1003, 702, 
   1345.22);
INSERT INTO pedidos
  VALUES (584, '2007-12-29', '2007-12-31', 1004, 707, 
   5508.48);
INSERT INTO pedidos
  VALUES (585, '2007-12-29', '2007-12-29', 1009, 704, 
   1865.04);
INSERT INTO pedidos
  VALUES (586, '2007-12-29', '2007-12-30', 1023, 707, 
   1270);
INSERT INTO pedidos
  VALUES (587, '2007-12-29', '2008-01-02', 1001, 701, 
   264);
INSERT INTO pedidos
  VALUES (588, '2007-12-29', '2007-12-29', 1003, 701, 
   1271.13);
INSERT INTO pedidos
  VALUES (589, '2007-12-29', '2007-12-29', 1013, 708, 
   1169.82);
INSERT INTO pedidos
  VALUES (590, '2007-12-29', '2008-01-02', 1018, 708, 
   16509.1);
INSERT INTO pedidos
  VALUES (591, '2007-12-30', '2008-01-02', 1023, 702, 
   2991.5);
INSERT INTO pedidos
  VALUES (592, '2007-12-30', '2008-01-01', 1005, 707, 
   14408.5);
INSERT INTO pedidos
  VALUES (593, '2007-12-30', '2008-01-02', 1026, 701, 
   270);
INSERT INTO pedidos
  VALUES (594, '2007-12-30', '2007-12-30', 1017, 706, 
   6142.35);
INSERT INTO pedidos
  VALUES (595, '2007-12-31', '2008-01-03', 1015, 703, 
   273.54);
INSERT INTO pedidos
  VALUES (596, '2007-12-31', '2008-01-04', 1001, 702, 
   1793.45);
INSERT INTO pedidos
  VALUES (597, '2007-12-31', '2007-12-31', 1006, 707, 
   18502.66);
INSERT INTO pedidos
  VALUES (598, '2007-12-31', '2008-01-01', 1013, 701, 
   7688.4);
INSERT INTO pedidos
  VALUES (599, '2008-01-01', '2008-01-01', 1011, 703, 
   5367);
INSERT INTO pedidos
  VALUES (600, '2008-01-01', '2008-01-05', 1006, 704, 
   7952.14);
INSERT INTO pedidos
  VALUES (601, '2008-01-01', '2008-01-02', 1011, 706, 
   136.8);
INSERT INTO pedidos
  VALUES (602, '2008-01-01', '2008-01-05', 1025, 708, 
   8002.5);
INSERT INTO pedidos
  VALUES (603, '2008-01-01', '2008-01-03', 1015, 707, 
   1168.83);
INSERT INTO pedidos
  VALUES (604, '2008-01-01', '2008-01-02', 1006, 702, 
   7287.9);
INSERT INTO pedidos
  VALUES (605, '2008-01-01', '2008-01-02', 1020, 701, 
   7739.15);
INSERT INTO pedidos
  VALUES (606, '2008-01-02', '2008-01-03', 1007, 702, 
   7855.5);
INSERT INTO pedidos
  VALUES (607, '2008-01-02', '2008-01-05', 1012, 704, 
   7062);
INSERT INTO pedidos
  VALUES (608, '2008-01-02', '2008-01-06', 1001, 706, 
   633.05);
INSERT INTO pedidos
  VALUES (609, '2008-01-02', '2008-01-06', 1017, 705, 
   5036.65);
INSERT INTO pedidos
  VALUES (610, '2008-01-02', '2008-01-02', 1020, 704, 
   14975.45);
INSERT INTO pedidos
  VALUES (611, '2008-01-02', '2008-01-04', 1005, 706, 
   6176.98);
INSERT INTO pedidos
  VALUES (612, '2008-01-02', '2008-01-03', 1005, 705, 
   6286.14);
INSERT INTO pedidos
  VALUES (613, '2008-01-03', '2008-01-05', 1015, 706, 
   110);
INSERT INTO pedidos
  VALUES (614, '2008-01-04', '2008-01-05', 1004, 704, 
   2774.1);
INSERT INTO pedidos
  VALUES (615, '2008-01-05', '2008-01-06', 1027, 707, 
   9788);
INSERT INTO pedidos
  VALUES (616, '2008-01-05', '2008-01-06', 1022, 705, 
   856);
INSERT INTO pedidos
  VALUES (617, '2008-01-05', '2008-01-05', 1012, 702, 
   11589);
INSERT INTO pedidos
  VALUES (618, '2008-01-05', '2008-01-09', 1026, 707, 
   12288.75);
INSERT INTO pedidos
  VALUES (619, '2008-01-05', '2008-01-06', 1008, 707, 
   225);
INSERT INTO pedidos
  VALUES (620, '2008-01-05', '2008-01-07', 1023, 702, 
   8927.12);
INSERT INTO pedidos
  VALUES (621, '2008-01-05', '2008-01-08', 1007, 707, 
   135);
INSERT INTO pedidos
  VALUES (622, '2008-01-06', '2008-01-06', 1002, 707, 
   6984.24);
INSERT INTO pedidos
  VALUES (623, '2008-01-06', '2008-01-08', 1007, 708, 
   259.5);
INSERT INTO pedidos
  VALUES (624, '2008-01-06', '2008-01-09', 1014, 701, 
   538);
INSERT INTO pedidos
  VALUES (625, '2008-01-06', '2008-01-08', 1006, 708, 
   7205.33);
INSERT INTO pedidos
  VALUES (626, '2008-01-06', '2008-01-10', 1023, 702, 
   6612);
INSERT INTO pedidos
  VALUES (627, '2008-01-06', '2008-01-08', 1027, 705, 
   1308);
INSERT INTO pedidos
  VALUES (628, '2008-01-06', '2008-01-07', 1026, 704, 
   1047.6);
INSERT INTO pedidos
  VALUES (629, '2008-01-07', '2008-01-11', 1014, 704, 
   0);
INSERT INTO pedidos
  VALUES (630, '2008-01-07', '2008-01-09', 1026, 702, 
   13851.14);
INSERT INTO pedidos
  VALUES (631, '2008-01-07', '2008-01-07', 1012, 707, 
   5863.83);
INSERT INTO pedidos
  VALUES (632, '2008-01-07', '2008-01-11', 1001, 706, 
   0);
INSERT INTO pedidos
  VALUES (633, '2008-01-07', '2008-01-09', 1021, 705, 
   4989.15);
INSERT INTO pedidos
  VALUES (634, '2008-01-07', '2008-01-11', 1002, 703, 
   3591.33);
INSERT INTO pedidos
  VALUES (635, '2008-01-07', '2008-01-10', 1002, 703, 
   1970);
INSERT INTO pedidos
  VALUES (636, '2008-01-07', '2008-01-10', 1002, 703, 
   10146.71);
INSERT INTO pedidos
  VALUES (637, '2008-01-07', '2008-01-10', 1008, 702, 
   17024.25);
INSERT INTO pedidos
  VALUES (638, '2008-01-07', '2008-01-09', 1003, 705, 
   340.65);
INSERT INTO pedidos
  VALUES (639, '2008-01-08', '2008-01-10', 1019, 705, 
   8523.6);
INSERT INTO pedidos
  VALUES (640, '2008-01-08', '2008-01-11', 1008, 706, 
   1529.95);
INSERT INTO pedidos
  VALUES (641, '2008-01-08', '2008-01-11', 1012, 701, 
   10991);
INSERT INTO pedidos
  VALUES (642, '2008-01-08', '2008-01-10', 1012, 708, 
   2990);
INSERT INTO pedidos
  VALUES (643, '2008-01-08', '2008-01-11', 1011, 701, 
   5588.31);
INSERT INTO pedidos
  VALUES (644, '2008-01-08', '2008-01-09', 1021, 706, 
   431.88);
INSERT INTO pedidos
  VALUES (645, '2008-01-08', '2008-01-12', 1024, 703, 
   339.6);
INSERT INTO pedidos
  VALUES (646, '2008-01-08', '2008-01-09', 1017, 705, 
   664);
INSERT INTO pedidos
  VALUES (647, '2008-01-09', '2008-01-13', 1014, 703, 
   161.5);
INSERT INTO pedidos
  VALUES (648, '2008-01-09', '2008-01-10', 1015, 701, 
   132);
INSERT INTO pedidos
  VALUES (649, '2008-01-09', '2008-01-13', 1001, 707, 
   686.76);
INSERT INTO pedidos
  VALUES (650, '2008-01-09', '2008-01-09', 1005, 706, 
   6662.1);
INSERT INTO pedidos
  VALUES (651, '2008-01-09', '2008-01-12', 1025, 704, 
   3601.5);
INSERT INTO pedidos
  VALUES (652, '2008-01-10', '2008-01-10', 1024, 701, 
   2020.6);
INSERT INTO pedidos
  VALUES (653, '2008-01-10', '2008-01-13', 1015, 701, 
   373.45);
INSERT INTO pedidos
  VALUES (654, '2008-01-10', '2008-01-14', 1024, 704, 
   10560.78);
INSERT INTO pedidos
  VALUES (655, '2008-01-10', '2008-01-14', 1007, 701, 
   7215.5);
INSERT INTO pedidos
  VALUES (656, '2008-01-10', '2008-01-10', 1024, 707, 
   609.65);
INSERT INTO pedidos
  VALUES (657, '2008-01-10', '2008-01-13', 1001, 706, 
   773);
INSERT INTO pedidos
  VALUES (658, '2008-01-10', '2008-01-10', 1010, 701, 
   5801);
INSERT INTO pedidos
  VALUES (659, '2008-01-10', '2008-01-12', 1023, 705, 
   2851.05);
INSERT INTO pedidos
  VALUES (660, '2008-01-11', '2008-01-14', 1027, 702, 
   2937.55);
INSERT INTO pedidos
  VALUES (661, '2008-01-11', '2008-01-15', 1011, 706, 
   5453.2);
INSERT INTO pedidos
  VALUES (662, '2008-01-11', '2008-01-13', 1006, 706, 
   6383.4);
INSERT INTO pedidos
  VALUES (663, '2008-01-11', '2008-01-14', 1025, 707, 
   5242);
INSERT INTO pedidos
  VALUES (664, '2008-01-11', '2008-01-11', 1015, 707, 
   276);
INSERT INTO pedidos
  VALUES (665, '2008-01-11', '2008-01-11', 1020, 704, 
   8042);
INSERT INTO pedidos
  VALUES (666, '2008-01-11', '2008-01-13', 1012, 707, 
   5564);
INSERT INTO pedidos
  VALUES (667, '2008-01-11', '2008-01-14', 1009, 708, 
   1360.63);
INSERT INTO pedidos
  VALUES (668, '2008-01-11', '2008-01-14', 1018, 708, 
   7313.4);
INSERT INTO pedidos
  VALUES (669, '2008-01-11', '2008-01-14', 1017, 708, 
   7919);
INSERT INTO pedidos
  VALUES (670, '2008-01-12', '2008-01-16', 1021, 701, 
   1593.25);
INSERT INTO pedidos
  VALUES (671, '2008-01-12', '2008-01-12', 1008, 707, 
   14898.15);
INSERT INTO pedidos
  VALUES (672, '2008-01-12', '2008-01-15', 1005, 707, 
   6834.98);
INSERT INTO pedidos
  VALUES (673, '2008-01-12', '2008-01-12', 1026, 708, 
   3508.49);
INSERT INTO pedidos
  VALUES (674, '2008-01-12', '2008-01-12', 1016, 705, 
   2618.25);
INSERT INTO pedidos
  VALUES (675, '2008-01-12', '2008-01-13', 1016, 702, 
   6602.25);
INSERT INTO pedidos
  VALUES (676, '2008-01-12', '2008-01-15', 1002, 701, 
   6253.9);
INSERT INTO pedidos
  VALUES (677, '2008-01-13', '2008-01-16', 1005, 708, 
   5893.45);
INSERT INTO pedidos
  VALUES (678, '2008-01-13', '2008-01-16', 1013, 704, 
   7207.75);
INSERT INTO pedidos
  VALUES (679, '2008-01-13', '2008-01-14', 1026, 707, 
   15778.29);
INSERT INTO pedidos
  VALUES (680, '2008-01-13', '2008-01-16', 1013, 703, 
   1716.8);
INSERT INTO pedidos
  VALUES (681, '2008-01-13', '2008-01-14', 1015, 702, 
   1409.25);
INSERT INTO pedidos
  VALUES (682, '2008-01-13', '2008-01-15', 1018, 704, 
   7312.5);
INSERT INTO pedidos
  VALUES (683, '2008-01-13', '2008-01-13', 1018, 702, 
   375);
INSERT INTO pedidos
  VALUES (684, '2008-01-14', '2008-01-17', 1027, 708, 
   13458.2);
INSERT INTO pedidos
  VALUES (685, '2008-01-14', '2008-01-15', 1005, 704, 
   15372.8);
INSERT INTO pedidos
  VALUES (686, '2008-01-14', '2008-01-18', 1026, 701, 
   7311);
INSERT INTO pedidos
  VALUES (687, '2008-01-14', '2008-01-16', 1021, 705, 
   5490);
INSERT INTO pedidos
  VALUES (688, '2008-01-14', '2008-01-18', 1002, 702, 
   6739.79);
INSERT INTO pedidos
  VALUES (689, '2008-01-14', '2008-01-15', 1015, 705, 
   0);
INSERT INTO pedidos
  VALUES (690, '2008-01-14', '2008-01-14', 1016, 702, 
   6582);
INSERT INTO pedidos
  VALUES (691, '2008-01-14', '2008-01-18', 1004, 707, 
   14516.47);
INSERT INTO pedidos
  VALUES (692, '2008-01-15', '2008-01-18', 1019, 701, 
   296.9);
INSERT INTO pedidos
  VALUES (693, '2008-01-15', '2008-01-18', 1002, 705, 
   9937);
INSERT INTO pedidos
  VALUES (694, '2008-01-15', '2008-01-16', 1019, 708, 
   2457.5);
INSERT INTO pedidos
  VALUES (695, '2008-01-15', '2008-01-17', 1010, 708, 
   7122);
INSERT INTO pedidos
  VALUES (696, '2008-01-15', '2008-01-16', 1002, 708, 
   15105.78);
INSERT INTO pedidos
  VALUES (697, '2008-01-15', '2008-01-15', 1005, 704, 
   3687);
INSERT INTO pedidos
  VALUES (698, '2008-01-16', '2008-01-17', 1022, 705, 
   1279.98);
INSERT INTO pedidos
  VALUES (699, '2008-01-17', '2008-01-18', 1013, 701, 
   503.95);
INSERT INTO pedidos
  VALUES (700, '2008-01-17', '2008-01-17', 1013, 707, 
   3658);
INSERT INTO pedidos
  VALUES (701, '2008-01-17', '2008-01-19', 1001, 707, 
   917.85);
INSERT INTO pedidos
  VALUES (702, '2008-01-17', '2008-01-20', 1020, 704, 
   6966.96);
INSERT INTO pedidos
  VALUES (703, '2008-01-17', '2008-01-19', 1007, 704, 
   570);
INSERT INTO pedidos
  VALUES (704, '2008-01-17', '2008-01-21', 1024, 704, 
   1466.75);
INSERT INTO pedidos
  VALUES (705, '2008-01-17', '2008-01-20', 1015, 706, 
   650.1);
INSERT INTO pedidos
  VALUES (706, '2008-01-17', '2008-01-17', 1016, 703, 
   2326.68);
INSERT INTO pedidos
  VALUES (707, '2008-01-17', '2008-01-18', 1002, 707, 
   556);
INSERT INTO pedidos
  VALUES (708, '2008-01-18', '2008-01-21', 1009, 708, 
   4828.7);
INSERT INTO pedidos
  VALUES (709, '2008-01-18', '2008-01-18', 1018, 702, 
   1633.05);
INSERT INTO pedidos
  VALUES (710, '2008-01-19', '2008-01-21', 1007, 702, 
   7317);
INSERT INTO pedidos
  VALUES (711, '2008-01-19', '2008-01-21', 1019, 704, 
   6070.3);
INSERT INTO pedidos
  VALUES (712, '2008-01-19', '2008-01-22', 1024, 705, 
   4244.9);
INSERT INTO pedidos
  VALUES (713, '2008-01-19', '2008-01-23', 1007, 701, 
   808.98);
INSERT INTO pedidos
  VALUES (714, '2008-01-19', '2008-01-23', 1019, 707, 
   12895.04);
INSERT INTO pedidos
  VALUES (715, '2008-01-19', '2008-01-23', 1020, 707, 
   3330.33);
INSERT INTO pedidos
  VALUES (716, '2008-01-20', '2008-01-24', 1016, 701, 
   846);
INSERT INTO pedidos
  VALUES (717, '2008-01-20', '2008-01-20', 1008, 701, 
   4689.65);
INSERT INTO pedidos
  VALUES (718, '2008-01-20', '2008-01-21', 1010, 705, 
   976.95);
INSERT INTO pedidos
  VALUES (719, '2008-01-20', '2008-01-23', 1027, 703, 
   1833.24);
INSERT INTO pedidos
  VALUES (720, '2008-01-21', '2008-01-25', 1010, 707, 
   836.22);
INSERT INTO pedidos
  VALUES (721, '2008-01-21', '2008-01-22', 1015, 705, 
   1755.6);
INSERT INTO pedidos
  VALUES (722, '2008-01-21', '2008-01-22', 1006, 703, 
   13914.65);
INSERT INTO pedidos
  VALUES (723, '2008-01-21', '2008-01-24', 1001, 707, 
   1276.1);
INSERT INTO pedidos
  VALUES (724, '2008-01-22', '2008-01-22', 1017, 704, 
   5397);
INSERT INTO pedidos
  VALUES (725, '2008-01-22', '2008-01-24', 1009, 702, 
   6086.75);
INSERT INTO pedidos
  VALUES (726, '2008-01-22', '2008-01-26', 1015, 703, 
   1123.97);
INSERT INTO pedidos
  VALUES (727, '2008-01-22', '2008-01-23', 1017, 706, 
   8463.64);
INSERT INTO pedidos
  VALUES (728, '2008-01-22', '2008-01-24', 1008, 706, 
   220);
INSERT INTO pedidos
  VALUES (729, '2008-01-22', '2008-01-24', 1021, 704, 
   8022.75);
INSERT INTO pedidos
  VALUES (730, '2008-01-22', '2008-01-24', 1023, 706, 
   5377.95);
INSERT INTO pedidos
  VALUES (731, '2008-01-22', '2008-01-26', 1014, 702, 
   7145.5);
INSERT INTO pedidos
  VALUES (732, '2008-01-23', '2008-01-25', 1001, 707, 
   933);
INSERT INTO pedidos
  VALUES (733, '2008-01-23', '2008-01-24', 1011, 706, 
   1070.8);
INSERT INTO pedidos
  VALUES (734, '2008-01-24', '2008-01-26', 1016, 706, 
   4800);
INSERT INTO pedidos
  VALUES (735, '2008-01-24', '2008-01-24', 1027, 708, 
   3625.5);
INSERT INTO pedidos
  VALUES (736, '2008-01-24', '2008-01-28', 1003, 708, 
   1274.55);
INSERT INTO pedidos
  VALUES (737, '2008-01-24', '2008-01-27', 1020, 708, 
   261.9);
INSERT INTO pedidos
  VALUES (738, '2008-01-24', '2008-01-26', 1017, 704, 
   12380.14);
INSERT INTO pedidos
  VALUES (739, '2008-01-24', '2008-01-25', 1022, 703, 
   606.25);
INSERT INTO pedidos
  VALUES (740, '2008-01-25', '2008-01-26', 1011, 708, 
   17533.9);
INSERT INTO pedidos
  VALUES (741, '2008-01-25', '2008-01-25', 1024, 707, 
   8267.7);
INSERT INTO pedidos
  VALUES (742, '2008-01-25', '2008-01-28', 1013, 706, 
   1591.82);
INSERT INTO pedidos
  VALUES (743, '2008-01-25', '2008-01-27', 1008, 708, 
   12275.5);
INSERT INTO pedidos
  VALUES (744, '2008-01-25', '2008-01-28', 1027, 703, 
   15390.5);
INSERT INTO pedidos
  VALUES (745, '2008-01-25', '2008-01-29', 1027, 706, 
   11156.88);
INSERT INTO pedidos
  VALUES (746, '2008-01-25', '2008-01-29', 1013, 702, 
   5496.92);
INSERT INTO pedidos
  VALUES (747, '2008-01-25', '2008-01-28', 1016, 703, 
   8395.15);
INSERT INTO pedidos
  VALUES (748, '2008-01-25', '2008-01-28', 1021, 703, 
   1663.62);
INSERT INTO pedidos
  VALUES (749, '2008-01-25', '2008-01-29', 1021, 702, 
   200);
INSERT INTO pedidos
  VALUES (750, '2008-01-26', '2008-01-30', 1018, 708, 
   3640.11);
INSERT INTO pedidos
  VALUES (751, '2008-01-26', '2008-01-30', 1025, 707, 
   7610.25);
INSERT INTO pedidos
  VALUES (752, '2008-01-27', '2008-01-31', 1005, 702, 
   8002.5);
INSERT INTO pedidos
  VALUES (753, '2008-01-27', '2008-01-29', 1013, 701, 
   0);
INSERT INTO pedidos
  VALUES (754, '2008-01-27', '2008-01-31', 1014, 708, 
   498);
INSERT INTO pedidos
  VALUES (755, '2008-01-28', '2008-01-31', 1010, 708, 
   6820.1);
INSERT INTO pedidos
  VALUES (756, '2008-01-28', '2008-01-28', 1005, 706, 
   1800);
INSERT INTO pedidos
  VALUES (757, '2008-01-28', '2008-01-30', 1014, 702, 
   13619.8);
INSERT INTO pedidos
  VALUES (758, '2008-01-28', '2008-01-30', 1020, 708, 
   168.78);
INSERT INTO pedidos
  VALUES (759, '2008-01-28', '2008-01-28', 1016, 703, 
   467.14);
INSERT INTO pedidos
  VALUES (760, '2008-01-28', '2008-01-31', 1014, 707, 
   11683.9);
INSERT INTO pedidos
  VALUES (761, '2008-01-29', '2008-01-30', 1016, 708, 
   2989.63);
INSERT INTO pedidos
  VALUES (762, '2008-01-29', '2008-02-02', 1013, 705, 
   19689.3);
INSERT INTO pedidos
  VALUES (763, '2008-01-29', '2008-02-01', 1009, 701, 
   3765);
INSERT INTO pedidos
  VALUES (764, '2008-01-29', '2008-01-29', 1003, 702, 
   403.35);
INSERT INTO pedidos
  VALUES (765, '2008-01-29', '2008-01-31', 1016, 703, 
   5465.05);
INSERT INTO pedidos
  VALUES (766, '2008-01-29', '2008-01-30', 1026, 707, 
   5985);
INSERT INTO pedidos
  VALUES (767, '2008-01-30', '2008-01-31', 1017, 706, 
   6173.15);
INSERT INTO pedidos
  VALUES (768, '2008-01-30', '2008-02-03', 1003, 706, 
   135);
INSERT INTO pedidos
  VALUES (769, '2008-01-30', '2008-02-01', 1020, 705, 
   17759.66);
INSERT INTO pedidos
  VALUES (770, '2008-01-30', '2008-01-30', 1019, 702, 
   144);
INSERT INTO pedidos
  VALUES (771, '2008-01-30', '2008-02-01', 1017, 707, 
   7022);
INSERT INTO pedidos
  VALUES (772, '2008-01-30', '2008-01-31', 1024, 704, 
   11468);
INSERT INTO pedidos
  VALUES (773, '2008-01-30', '2008-02-02', 1019, 705, 
   401.58);
INSERT INTO pedidos
  VALUES (774, '2008-01-31', '2008-02-02', 1013, 704, 
   2891);
INSERT INTO pedidos
  VALUES (775, '2008-01-31', '2008-01-31', 1010, 704, 
   813.74);
INSERT INTO pedidos
  VALUES (776, '2008-01-31', '2008-01-31', 1006, 708, 
   15371.5);
INSERT INTO pedidos
  VALUES (777, '2008-01-31', '2008-02-02', 1026, 708, 
   2019);
INSERT INTO pedidos
  VALUES (778, '2008-01-31', '2008-01-31', 1025, 707, 
   1314.18);
INSERT INTO pedidos
  VALUES (779, '2008-01-31', '2008-01-31', 1004, 705, 
   1388.75);
INSERT INTO pedidos
  VALUES (780, '2008-01-31', '2008-01-31', 1003, 701, 
   2008.69);
INSERT INTO pedidos
  VALUES (781, '2008-01-31', '2008-02-04', 1021, 704, 
   4994.3);
INSERT INTO pedidos
  VALUES (782, '2008-01-31', '2008-02-03', 1016, 702, 
   848.75);
INSERT INTO pedidos
  VALUES (783, '2008-01-31', '2008-02-04', 1013, 704, 
   7058.67);
INSERT INTO pedidos
  VALUES (784, '2008-02-01', '2008-02-04', 1018, 707, 
   6545.8);
INSERT INTO pedidos
  VALUES (785, '2008-02-01', '2008-02-05', 1027, 706, 
   7660.8);
INSERT INTO pedidos
  VALUES (786, '2008-02-01', '2008-02-01', 1015, 704, 
   1216);
INSERT INTO pedidos
  VALUES (787, '2008-02-01', '2008-02-03', 1009, 707, 
   13876.7);
INSERT INTO pedidos
  VALUES (788, '2008-02-01', '2008-02-01', 1026, 704, 
   4332);
INSERT INTO pedidos
  VALUES (789, '2008-02-01', '2008-02-05', 1021, 707, 
   4951.98);
INSERT INTO pedidos
  VALUES (790, '2008-02-01', '2008-02-01', 1004, 707, 
   6214.54);
INSERT INTO pedidos
  VALUES (791, '2008-02-01', '2008-02-02', 1017, 706, 
   3934.5);
INSERT INTO pedidos
  VALUES (792, '2008-02-02', '2008-02-05', 1027, 707, 
   5026.98);
INSERT INTO pedidos
  VALUES (793, '2008-02-02', '2008-02-03', 1026, 706, 
   619.7);
INSERT INTO pedidos
  VALUES (794, '2008-02-02', '2008-02-04', 1016, 703, 
   6845);
INSERT INTO pedidos
  VALUES (795, '2008-02-03', '2008-02-05', 1024, 707, 
   1754.98);
INSERT INTO pedidos
  VALUES (796, '2008-02-03', '2008-03-07', 1007, 703, 
   5695.5);
INSERT INTO pedidos
  VALUES (797, '2008-02-03', '2008-02-06', 1018, 705, 
   10544.8);
INSERT INTO pedidos
  VALUES (798, '2008-02-03', '2008-02-04', 1003, 702, 
   576.55);
INSERT INTO pedidos
  VALUES (799, '2008-02-04', '2008-02-05', 1010, 704, 
   2970.12);
INSERT INTO pedidos
  VALUES (800, '2008-02-04', '2008-02-07', 1027, 707, 
   3441.9);
INSERT INTO pedidos
  VALUES (801, '2008-02-04', '2008-02-08', 1002, 707, 
   6486.12);
INSERT INTO pedidos
  VALUES (802, '2008-02-04', '2008-02-04', 1021, 707, 
   67);
INSERT INTO pedidos
  VALUES (803, '2008-02-05', '2008-02-08', 1004, 704, 
   1342.1);
INSERT INTO pedidos
  VALUES (804, '2008-02-05', '2008-02-05', 1014, 708, 
   8316.1);
INSERT INTO pedidos
  VALUES (805, '2008-02-05', '2008-02-05', 1009, 702, 
   7493.85);
INSERT INTO pedidos
  VALUES (806, '2008-02-05', '2008-02-07', 1019, 707, 
   5759.6);
INSERT INTO pedidos
  VALUES (807, '2008-02-06', '2008-02-07', 1016, 705, 
   8591.79);
INSERT INTO pedidos
  VALUES (808, '2008-02-06', '2008-02-07', 1004, 704, 
   544);
INSERT INTO pedidos
  VALUES (809, '2008-02-07', '2008-02-11', 1004, 701, 
   2762.15);
INSERT INTO pedidos
  VALUES (810, '2008-02-07', '2008-02-07', 1022, 705, 
   409.97);
INSERT INTO pedidos
  VALUES (811, '2008-02-07', '2008-02-11', 1008, 707, 
   1123.26);
INSERT INTO pedidos
  VALUES (812, '2008-02-07', '2008-02-07', 1005, 707, 
   6260.4);
INSERT INTO pedidos
  VALUES (813, '2008-02-08', '2008-02-08', 1013, 705, 
   14345.1);
INSERT INTO pedidos
  VALUES (814, '2008-02-08', '2008-02-08', 1013, 706, 
   33);
INSERT INTO pedidos
  VALUES (815, '2008-02-08', '2008-02-12', 1007, 702, 
   11197.55);
INSERT INTO pedidos
  VALUES (816, '2008-02-08', '2008-02-11', 1011, 701, 
   0);
INSERT INTO pedidos
  VALUES (817, '2008-02-08', '2008-02-08', 1001, 705, 
   1530.9);
INSERT INTO pedidos
  VALUES (818, '2008-02-08', '2008-02-10', 1023, 704, 
   3483.9);
INSERT INTO pedidos
  VALUES (819, '2008-02-08', '2008-02-12', 1013, 707, 
   9208.3);
INSERT INTO pedidos
  VALUES (820, '2008-02-08', '2008-02-09', 1019, 704, 
   401.58);
INSERT INTO pedidos
  VALUES (821, '2008-02-08', '2008-02-12', 1023, 708, 
   3688);
INSERT INTO pedidos
  VALUES (822, '2008-02-08', '2008-02-09', 1004, 701, 
   2095.06);
INSERT INTO pedidos
  VALUES (823, '2008-02-09', '2008-02-10', 1003, 703, 
   68);
INSERT INTO pedidos
  VALUES (824, '2008-02-09', '2008-02-10', 1006, 701, 
   6217.7);
INSERT INTO pedidos
  VALUES (825, '2008-02-09', '2008-02-09', 1025, 708, 
   1979.58);
INSERT INTO pedidos
  VALUES (826, '2008-02-09', '2008-02-09', 1005, 707, 
   5973.81);
INSERT INTO pedidos
  VALUES (827, '2008-02-10', '2008-02-14', 1013, 706, 
   1159.9);
INSERT INTO pedidos
  VALUES (828, '2008-02-10', '2008-02-10', 1014, 701, 
   6333.35);
INSERT INTO pedidos
  VALUES (829, '2008-02-10', '2008-02-11', 1027, 701, 
   3607.15);
INSERT INTO pedidos
  VALUES (830, '2008-02-11', '2008-02-13', 1020, 703, 
   4516.65);
INSERT INTO pedidos
  VALUES (831, '2008-02-11', '2008-02-14', 1012, 705, 
   5014);
INSERT INTO pedidos
  VALUES (832, '2008-02-11', '2008-02-15', 1012, 707, 
   175);
INSERT INTO pedidos
  VALUES (833, '2008-02-11', '2008-02-15', 1007, 706, 
   2801.4);
INSERT INTO pedidos
  VALUES (834, '2008-02-11', '2008-02-11', 1021, 704, 
   1901.82);
INSERT INTO pedidos
  VALUES (835, '2008-02-11', '2008-02-13', 1012, 703, 
   7398.19);
INSERT INTO pedidos
  VALUES (836, '2008-02-11', '2008-02-14', 1007, 708, 
   4563.66);
INSERT INTO pedidos
  VALUES (837, '2008-02-11', '2008-02-13', 1012, 701, 
   17096.25);
INSERT INTO pedidos
  VALUES (838, '2008-02-11', '2008-02-13', 1014, 706, 
   13591);
INSERT INTO pedidos
  VALUES (839, '2008-02-12', '2008-02-12', 1012, 702, 
   7438);
INSERT INTO pedidos
  VALUES (840, '2008-02-12', '2008-02-12', 1001, 701, 
   995);
INSERT INTO pedidos
  VALUES (841, '2008-02-12', '2008-02-16', 1017, 707, 
   11499.24);
INSERT INTO pedidos
  VALUES (842, '2008-02-12', '2008-02-14', 1013, 707, 
   3127.5);
INSERT INTO pedidos
  VALUES (843, '2008-02-12', '2008-02-14', 1008, 705, 
   2607);
INSERT INTO pedidos
  VALUES (844, '2008-02-12', '2008-02-14', 1014, 708, 
   7274.75);
INSERT INTO pedidos
  VALUES (845, '2008-02-12', '2008-02-15', 1020, 701, 
   716);
INSERT INTO pedidos
  VALUES (846, '2008-02-13', '2008-02-17', 1012, 704, 
   1167.88);
INSERT INTO pedidos
  VALUES (847, '2008-02-13', '2008-02-15', 1027, 706, 
   14221);
INSERT INTO pedidos
  VALUES (848, '2008-02-13', '2008-02-16', 1014, 706, 
   2902);
INSERT INTO pedidos
  VALUES (849, '2008-02-13', '2008-02-15', 1026, 708, 
   7123.68);
INSERT INTO pedidos
  VALUES (850, '2008-02-13', '2008-02-13', 1003, 701, 
   846.75);
INSERT INTO pedidos
  VALUES (851, '2008-02-13', '2008-02-13', 1001, 702, 
   1502.4);
INSERT INTO pedidos
  VALUES (852, '2008-02-13', '2008-02-16', 1002, 707, 
   15152.85);
INSERT INTO pedidos
  VALUES (853, '2008-02-13', '2008-02-16', 1023, 708, 
   13971.65);
INSERT INTO pedidos
  VALUES (854, '2008-02-13', '2008-02-16', 1004, 706, 
   8730);
INSERT INTO pedidos
  VALUES (855, '2008-02-14', '2008-02-15', 1001, 704, 
   117);
INSERT INTO pedidos
  VALUES (856, '2008-02-14', '2008-02-14', 1026, 703, 
   3635.3);
INSERT INTO pedidos
  VALUES (857, '2008-02-14', '2008-02-14', 1017, 708, 
   139);
INSERT INTO pedidos
  VALUES (858, '2008-02-15', '2008-02-19', 1023, 701, 
   2346.5);
INSERT INTO pedidos
  VALUES (859, '2008-02-16', '2008-02-16', 1016, 703, 
   2773.24);
INSERT INTO pedidos
  VALUES (860, '2008-02-16', '2008-02-19', 1003, 703, 
   585.65);
INSERT INTO pedidos
  VALUES (861, '2008-02-16', '2008-02-16', 1026, 708, 
   7129.64);
INSERT INTO pedidos
  VALUES (862, '2008-02-16', '2008-02-20', 1010, 702, 
   10818);
INSERT INTO pedidos
  VALUES (863, '2008-02-16', '2008-02-17', 1025, 704, 
   5820);
INSERT INTO pedidos
  VALUES (864, '2008-02-16', '2008-02-16', 1008, 707, 
   9204.8);
INSERT INTO pedidos
  VALUES (865, '2008-02-16', '2008-02-20', 1024, 703, 
   11540.5);
INSERT INTO pedidos
  VALUES (866, '2008-02-16', '2008-02-17', 1022, 706, 
   674.15);
INSERT INTO pedidos
  VALUES (867, '2008-02-16', '2008-02-20', 1017, 708, 
   3751.21);
INSERT INTO pedidos
  VALUES (868, '2008-02-16', '2008-02-18', 1021, 702, 
   1231.9);
INSERT INTO pedidos
  VALUES (869, '2008-02-17', '2008-02-19', 1024, 708, 
   2732);
INSERT INTO pedidos
  VALUES (870, '2008-02-17', '2008-02-20', 1005, 704, 
   17137.93);
INSERT INTO pedidos
  VALUES (871, '2008-02-17', '2008-03-19', 1021, 708, 
   6386.96);
INSERT INTO pedidos
  VALUES (872, '2008-02-17', '2008-02-21', 1017, 702, 
   13953.96);
INSERT INTO pedidos
  VALUES (873, '2008-02-17', '2008-02-18', 1020, 702, 
   7168.95);
INSERT INTO pedidos
  VALUES (874, '2008-02-18', '2008-02-21', 1005, 702, 
   5255.78);
INSERT INTO pedidos
  VALUES (875, '2008-02-18', '2008-02-22', 1017, 702, 
   551);
INSERT INTO pedidos
  VALUES (876, '2008-02-18', '2008-02-18', 1005, 708, 
   911.5);
INSERT INTO pedidos
  VALUES (877, '2008-02-18', '2008-02-18', 1017, 708, 
   138);
INSERT INTO pedidos
  VALUES (878, '2008-02-18', '2008-02-21', 1008, 706, 
   6296.85);
INSERT INTO pedidos
  VALUES (879, '2008-02-18', '2008-03-19', 1013, 705, 
   15745.14);
INSERT INTO pedidos
  VALUES (880, '2008-02-18', '2008-02-22', 1006, 704, 
   4876);
INSERT INTO pedidos
  VALUES (881, '2008-02-18', '2008-02-20', 1016, 707, 
   2784.31);
INSERT INTO pedidos
  VALUES (882, '2008-02-18', '2008-02-22', 1008, 707, 
   4215.2);
INSERT INTO pedidos
  VALUES (883, '2008-02-19', '2008-02-22', 1011, 704, 
   7646);
INSERT INTO pedidos
  VALUES (884, '2008-02-19', '2008-02-22', 1027, 704, 
   2400);
INSERT INTO pedidos
  VALUES (885, '2008-02-20', '2008-02-23', 1009, 701, 
   173);
INSERT INTO pedidos
  VALUES (886, '2008-02-20', '2008-02-21', 1027, 708, 
   2487.02);
INSERT INTO pedidos
  VALUES (887, '2008-02-20', '2008-02-23', 1001, 705, 
   1493.6);
INSERT INTO pedidos
  VALUES (888, '2008-02-20', '2008-02-23', 1007, 707, 
   7724.78);
INSERT INTO pedidos
  VALUES (889, '2008-02-20', '2008-02-24', 1023, 702, 
   136);
INSERT INTO pedidos
  VALUES (890, '2008-02-20', '2008-02-24', 1022, 705, 
   332);
INSERT INTO pedidos
  VALUES (891, '2008-02-20', '2008-02-21', 1006, 706, 
   9913.5);
INSERT INTO pedidos
  VALUES (892, '2008-02-21', '2008-02-22', 1010, 703, 
   156);
INSERT INTO pedidos
  VALUES (893, '2008-02-21', '2008-02-25', 1022, 705, 
   550.15);
INSERT INTO pedidos
  VALUES (894, '2008-02-21', '2008-02-23', 1024, 704, 
   3932);
INSERT INTO pedidos
  VALUES (895, '2008-02-21', '2008-02-21', 1011, 705, 
   16062.35);
INSERT INTO pedidos
  VALUES (896, '2008-02-21', '2008-02-24', 1025, 702, 
   6634);
INSERT INTO pedidos
  VALUES (897, '2008-02-21', '2008-02-24', 1027, 701, 
   1808.64);
INSERT INTO pedidos
  VALUES (898, '2008-02-21', '2008-02-24', 1001, 708, 
   727.5);
INSERT INTO pedidos
  VALUES (899, '2008-02-21', '2008-02-25', 1009, 705, 
   5071.7);
INSERT INTO pedidos
  VALUES (900, '2008-02-22', '2008-02-24', 1020, 701, 
   6576.8);
INSERT INTO pedidos
  VALUES (901, '2008-02-22', '2008-02-24', 1013, 707, 
   3177);
INSERT INTO pedidos
  VALUES (902, '2008-02-22', '2008-02-23', 1006, 702, 
   7597.7);
INSERT INTO pedidos
  VALUES (903, '2008-02-22', '2008-02-23', 1021, 707, 
   5224.46);
INSERT INTO pedidos
  VALUES (904, '2008-02-22', '2008-03-26', 1009, 708, 
   7673);
INSERT INTO pedidos
  VALUES (905, '2008-02-22', '2008-02-24', 1024, 704, 
   4369.56);
INSERT INTO pedidos
  VALUES (906, '2008-02-22', '2008-02-22', 1012, 707, 
   3396);
INSERT INTO pedidos
  VALUES (907, '2008-02-23', '2008-02-23', 1014, 702, 
   615.24);
INSERT INTO pedidos
  VALUES (908, '2008-02-23', '2008-02-24', 1025, 705, 
   1459.95);
INSERT INTO pedidos
  VALUES (909, '2008-02-24', '2008-02-24', 1024, 705, 
   7947.15);
INSERT INTO pedidos
  VALUES (910, '2008-02-24', '2008-02-27', 1019, 702, 
   10665.9);
INSERT INTO pedidos
  VALUES (911, '2008-02-24', '2008-02-26', 1023, 702, 
   705.75);
INSERT INTO pedidos
  VALUES (912, '2008-02-24', '2008-02-28', 1025, 706, 
   7097);
INSERT INTO pedidos
  VALUES (913, '2008-02-24', '2008-02-25', 1025, 707, 
   2540.65);
INSERT INTO pedidos
  VALUES (914, '2008-02-24', '2008-02-24', 1022, 707, 
   55);
INSERT INTO pedidos
  VALUES (915, '2008-02-24', '2008-02-25', 1016, 705, 
   28);
INSERT INTO pedidos
  VALUES (916, '2008-02-24', '2008-02-24', 1025, 705, 
   1813.28);
INSERT INTO pedidos
  VALUES (917, '2008-02-24', '2008-02-26', 1013, 703, 
   5808.05);
INSERT INTO pedidos
  VALUES (918, '2008-02-25', '2008-02-28', 1025, 703, 
   660);
INSERT INTO pedidos
  VALUES (919, '2008-02-25', '2008-02-27', 1014, 707, 
   7496.37);
INSERT INTO pedidos
  VALUES (920, '2008-02-26', '2008-02-29', 1008, 708, 
   36.15);
INSERT INTO pedidos
  VALUES (921, '2008-02-26', '2008-02-26', 1018, 702, 
   6582);
INSERT INTO pedidos
  VALUES (922, '2008-02-26', '2008-02-27', 1004, 706, 
   6475.58);
INSERT INTO pedidos
  VALUES (923, '2008-02-26', '2008-02-29', 1009, 707, 
   1229.3);
INSERT INTO pedidos
  VALUES (924, '2008-02-26', '2008-02-29', 1002, 704, 
   3775);
INSERT INTO pedidos
  VALUES (925, '2008-02-26', '2008-02-26', 1025, 702, 
   2907.63);
INSERT INTO pedidos
  VALUES (926, '2008-02-26', '2008-02-27', 1005, 701, 
   8638.13);
INSERT INTO pedidos
  VALUES (927, '2008-02-27', '2008-02-28', 1007, 704, 
   1452.61);
INSERT INTO pedidos
  VALUES (928, '2008-02-27', '2008-03-01', 1017, 706, 
   1444.08);
INSERT INTO pedidos
  VALUES (929, '2008-02-27', '2008-02-27', 1020, 705, 
   4700.25);
INSERT INTO pedidos
  VALUES (930, '2008-02-27', '2008-02-29', 1023, 701, 
   15);
INSERT INTO pedidos
  VALUES (931, '2008-02-27', '2008-02-27', 1001, 707, 
   225);
INSERT INTO pedidos
  VALUES (932, '2008-02-27', '2008-02-27', 1012, 704, 
   1470);
INSERT INTO pedidos
  VALUES (933, '2008-02-27', '2008-02-27', 1026, 705, 
   7032);
INSERT INTO pedidos
  VALUES (934, '2008-02-27', '2008-02-28', 1021, 705, 
   915.04);
INSERT INTO pedidos
  VALUES (935, '2008-02-27', '2008-03-01', 1020, 702, 
   5510);
INSERT INTO pedidos
  VALUES (936, '2008-02-28', '2008-02-29', 1025, 704, 
   6190);
INSERT INTO pedidos
  VALUES (937, '2008-02-28', '2008-03-03', 1014, 706, 
   7500.5);
INSERT INTO pedidos
  VALUES (938, '2008-02-28', '2008-02-28', 1011, 705, 
   6463.54);
INSERT INTO pedidos
  VALUES (939, '2008-02-28', '2008-02-28', 1021, 701, 
   1906.5);
INSERT INTO pedidos
  VALUES (940, '2008-02-28', '2008-03-03', 1007, 702, 
   12273.89);
INSERT INTO pedidos
  VALUES (941, '2008-02-28', '2008-02-28', 1019, 702, 
   7395.75);
INSERT INTO pedidos
  VALUES (942, '2008-02-28', '2008-02-29', 1002, 706, 
   3878.5);
INSERT INTO pedidos
  VALUES (943, '2008-02-28', '2008-02-29', 1026, 707, 
   2059.5);
INSERT INTO pedidos
  VALUES (944, '2008-02-28', '2008-03-02', 1020, 702, 
   7768.9);


--Inserción en PRODUCTOS

INSERT INTO productos
  VALUES (1, 'Trek 9000 Mountain Bike', NULL, 1200, 
   6, 2);
INSERT INTO productos
  VALUES (2, 'Eagle FS-3 Mountain Bike', NULL, 1800, 
   8, 2);
INSERT INTO productos
  VALUES (3, 'Dog Ear Cyclecomputer', NULL, 75, 20, 
   1);
INSERT INTO productos
  VALUES (4, 'Victoria Pro All Weather Llantas', NULL, 
   54.95, 20, 4);
INSERT INTO productos
  VALUES (5, 'Dog Ear Helmet Mount Espejos', NULL, 
   7.45, 12, 1);
INSERT INTO productos
  VALUES (6, 'Viscount Mountain Bike', NULL, 635, 5, 
   2);
INSERT INTO productos
  VALUES (7, 'Viscount C-500 Wireless Bike Computer', 
   NULL, 49, 30, 1);
INSERT INTO productos
  VALUES (8, 'Kryptonite Advanced 2000 U-Lock', NULL, 
   50, 20, 1);
INSERT INTO productos
  VALUES (9, 'Nikoma Lok-Tight U-Lock', NULL, 33, 12, 
   1);
INSERT INTO productos
  VALUES (10, 'Viscount Microshell Casco', NULL, 36, 
   20, 1);
INSERT INTO productos
  VALUES (11, 'GT RTS-2 Mountain Bike', NULL, 1650, 
   5, 2);
INSERT INTO productos
  VALUES (12, 'Shinoman 105 SC Frenos', NULL, 23.5, 
   16, 4);
INSERT INTO productos
  VALUES (13, 'Shinoman Dura-Ace Auriculares', NULL, 67.5, 
   20, 4);
INSERT INTO productos
  VALUES (14, 'Eagle SA-120 Pedales sin clip', NULL, 
   139.95, 20, 4);
INSERT INTO productos
  VALUES (15, 'ProFormance clip para pedal 2G', NULL, 4.99, 
   40, 4);
INSERT INTO productos
  VALUES (16, 'ProFormance ATB Pedal todo-terreno', 
   NULL, 28, 40, 4);
INSERT INTO productos
  VALUES (17, 'Shinoman Deluxe TX-30 Pedal', NULL, 
   45, 60, 4);
INSERT INTO productos
  VALUES (18, 'Viscount CardioSport Sport Watch', NULL, 
   179, 12, 1);
INSERT INTO productos
  VALUES (19, 'Viscount Tru-Beat pulsometro', 
   NULL, 47, 20, 1);
INSERT INTO productos
  VALUES (20, 'Dog Ear Monster guantes', NULL, 
   15, 30, 1);
INSERT INTO productos
  VALUES (21, 'Dog Ear Aero-Flow Hinchador', NULL, 
   55, 25, 1);
INSERT INTO productos
  VALUES (22, 'Pro-Sport ''Dillo Gafas de sol', NULL, 82, 
   18, 1);
INSERT INTO productos
  VALUES (23, 'Ultra-Pro Rain maillot', NULL, 85, 30, 
   3);
INSERT INTO productos
  VALUES (24, 'StaDry Cycling culote', NULL, 69, 22, 
   3);
INSERT INTO productos
  VALUES (25, 'King Cobra Casco', NULL, 139, 30, 1);
INSERT INTO productos
  VALUES (26, 'Glide-O-Matic Cycling Casco', NULL, 
   125, 24, 1);
INSERT INTO productos
  VALUES (27, 'X-Pro All Weather Llantas', NULL, 24, 
   20, 6);
INSERT INTO productos
  VALUES (28, 'Turbo Twin Llantas', NULL, 29, 18, 6);
INSERT INTO productos
  VALUES (29, 'Ultra-2K Competition Llanta', NULL, 34, 
   22, 6);
INSERT INTO productos
  VALUES (30, 'Clear Shade 85-T Gafas', NULL, 45, 
   14, 1);
INSERT INTO productos
  VALUES (31, 'True Grip Competition Guantes', NULL, 
   22, 20, 1);
INSERT INTO productos
  VALUES (32, 'Kool-Breeze Rocket Top Jersey', NULL, 
   32, 12, 3);
INSERT INTO productos
  VALUES (33, 'Wonder Wool Cycle Calcetines', NULL, 19, 
   30, 3);
INSERT INTO productos
  VALUES (34, 'TransPort Bicycle Parrilla', NULL, 27, 14, 
   1);
INSERT INTO productos
  VALUES (35, 'HP Deluxe Alforjas', NULL, 39, 10, 1);
INSERT INTO productos
  VALUES (36, 'Cosmic Elite Road Warrior Ruedas', NULL, 
   165, 22, 4);
INSERT INTO productos
  VALUES (37, 'AeroFlo ATB Ruedas', NULL, 189, 40, 
   4);
INSERT INTO productos
  VALUES (38, 'Cycle-Doc Pro Repair Stand', NULL, 166, 
   12, 1);
INSERT INTO productos
  VALUES (39, 'Road Warrior soporte para maletero', NULL, 175, 
   6, 5);
INSERT INTO productos
  VALUES (40, 'Ultimate Export 2G baca para bibileta', NULL, 
   180, 8, 5);

-- Inserción en DETALLES_PEDIDOS

INSERT INTO detalles_pedidos
  VALUES (1, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (1, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (1, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (1, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (1, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (1, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (1, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (2, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (2, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (3, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (3, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (3, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (3, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (3, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (3, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (3, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (3, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (4, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (4, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (4, 17, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (4, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (4, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (5, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (5, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (5, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (6, 2, 1746, 5);
INSERT INTO detalles_pedidos
  VALUES (6, 7, 49, 2);
INSERT INTO detalles_pedidos
  VALUES (6, 12, 22.8, 6);
INSERT INTO detalles_pedidos
  VALUES (6, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (6, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (6, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (6, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (7, 14, 139.95, 3);
INSERT INTO detalles_pedidos
  VALUES (7, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (8, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (8, 22, 82, 3);
INSERT INTO detalles_pedidos
  VALUES (8, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (8, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (8, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (9, 24, 69, 1);
INSERT INTO detalles_pedidos
  VALUES (10, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (10, 24, 69, 3);
INSERT INTO detalles_pedidos
  VALUES (11, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (11, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (11, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (11, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (11, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (11, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (11, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (11, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (12, 10, 36, 2);
INSERT INTO detalles_pedidos
  VALUES (13, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (13, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (13, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (13, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (14, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (14, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (14, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (15, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (15, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (15, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (15, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (15, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (16, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (16, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (16, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (16, 24, 69, 4);
INSERT INTO detalles_pedidos
  VALUES (16, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (16, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (16, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (17, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (17, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (17, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (17, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (17, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (17, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (18, 12, 22.8, 6);
INSERT INTO detalles_pedidos
  VALUES (18, 20, 15, 4);
INSERT INTO detalles_pedidos
  VALUES (18, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (18, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (19, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (19, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (19, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (19, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (19, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (19, 30, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (19, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (19, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (20, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (20, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (21, 3, 75, 3);
INSERT INTO detalles_pedidos
  VALUES (21, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (21, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (22, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (22, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (22, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (22, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (22, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (23, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (23, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (23, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (23, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (23, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (23, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (23, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (23, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (24, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (24, 14, 139.95, 3);
INSERT INTO detalles_pedidos
  VALUES (24, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (24, 24, 69, 1);
INSERT INTO detalles_pedidos
  VALUES (24, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (24, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (25, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (25, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (25, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (25, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (25, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (26, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (26, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (26, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (26, 24, 69, 1);
INSERT INTO detalles_pedidos
  VALUES (26, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (26, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (27, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (27, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (27, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (27, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (27, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (27, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (28, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (28, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (29, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (30, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (30, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (30, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (30, 29, 34, 4);
INSERT INTO detalles_pedidos
  VALUES (30, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (31, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (32, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (32, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (32, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (32, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (32, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (32, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (33, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (33, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (33, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (33, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (33, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (33, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (34, 8, 48.5, 5);
INSERT INTO detalles_pedidos
  VALUES (34, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (35, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (35, 14, 139.95, 1);
INSERT INTO detalles_pedidos
  VALUES (35, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (36, 5, 7.45, 1);
INSERT INTO detalles_pedidos
  VALUES (37, 8, 50, 3);
INSERT INTO detalles_pedidos
  VALUES (37, 18, 173.63, 6);
INSERT INTO detalles_pedidos
  VALUES (37, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (37, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (38, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (39, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (39, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (39, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (39, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (39, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (39, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (39, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (39, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (40, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (40, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (40, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (41, 10, 36, 4);
INSERT INTO detalles_pedidos
  VALUES (41, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (41, 22, 79.54, 5);
INSERT INTO detalles_pedidos
  VALUES (41, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (41, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (41, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (42, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (42, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (42, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (42, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (42, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (43, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (43, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (43, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (43, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (43, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (43, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (43, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (44, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (44, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (44, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (44, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (44, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (44, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (45, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (45, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (45, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (45, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (45, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (45, 30, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (45, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (45, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (46, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (47, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (48, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (48, 20, 14.55, 6);
INSERT INTO detalles_pedidos
  VALUES (48, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (49, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (49, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (49, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (49, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (49, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (50, 5, 7.45, 2);
INSERT INTO detalles_pedidos
  VALUES (50, 15, 4.84, 6);
INSERT INTO detalles_pedidos
  VALUES (50, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (50, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (51, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (52, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (53, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (53, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (53, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (53, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (53, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (53, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (53, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (54, 10, 36, 2);
INSERT INTO detalles_pedidos
  VALUES (55, 10, 36, 1);
INSERT INTO detalles_pedidos
  VALUES (56, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (56, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (56, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (56, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (57, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (57, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (57, 20, 14.55, 5);
INSERT INTO detalles_pedidos
  VALUES (57, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (57, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (57, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (58, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (58, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (58, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (58, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (58, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (58, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (59, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (59, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (59, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (59, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (59, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (59, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (59, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (60, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (60, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (60, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (60, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (60, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (60, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (60, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (61, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (61, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (61, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (61, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (61, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (62, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (62, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (62, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (62, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (62, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (63, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (63, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (64, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (64, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (64, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (64, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (64, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (64, 28, 29, 3);
INSERT INTO detalles_pedidos
  VALUES (64, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (64, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (65, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (65, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (65, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (65, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (66, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (66, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (66, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (66, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (66, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (66, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (66, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (66, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (67, 10, 36, 4);
INSERT INTO detalles_pedidos
  VALUES (67, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (67, 22, 82, 4);
INSERT INTO detalles_pedidos
  VALUES (67, 28, 29, 3);
INSERT INTO detalles_pedidos
  VALUES (67, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (67, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (68, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (69, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (69, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (69, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (69, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (70, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (70, 22, 82, 3);
INSERT INTO detalles_pedidos
  VALUES (70, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (71, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (71, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (71, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (72, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (72, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (72, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (72, 32, 32, 4);
INSERT INTO detalles_pedidos
  VALUES (72, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (73, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (73, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (73, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (73, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (73, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (73, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (74, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (74, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (74, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (74, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (74, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (74, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (74, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (74, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (75, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (75, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (75, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (75, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (75, 24, 69, 4);
INSERT INTO detalles_pedidos
  VALUES (75, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (75, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (75, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (76, 18, 173.63, 5);
INSERT INTO detalles_pedidos
  VALUES (77, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (77, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (77, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (77, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (77, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (77, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (78, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (78, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (78, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (78, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (79, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (79, 7, 49, 2);
INSERT INTO detalles_pedidos
  VALUES (79, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (79, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (79, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (79, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (80, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (80, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (80, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (80, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (80, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (80, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (80, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (81, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (82, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (82, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (82, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (82, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (82, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (82, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (82, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (83, 10, 36, 4);
INSERT INTO detalles_pedidos
  VALUES (83, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (84, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (84, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (84, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (84, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (85, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (85, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (85, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (85, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (85, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (86, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (86, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (86, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (86, 18, 179, 3);
INSERT INTO detalles_pedidos
  VALUES (86, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (86, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (86, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (87, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (87, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (87, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (88, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (89, 15, 4.84, 6);
INSERT INTO detalles_pedidos
  VALUES (89, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (89, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (90, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (91, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (91, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (91, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (91, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (91, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (91, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (91, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (92, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (92, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (92, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (93, 3, 75, 1);
INSERT INTO detalles_pedidos
  VALUES (94, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (94, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (94, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (94, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (94, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (94, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (95, 5, 7.23, 5);
INSERT INTO detalles_pedidos
  VALUES (95, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (95, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (95, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (95, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (96, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (96, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (96, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (96, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (97, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (97, 14, 139.95, 1);
INSERT INTO detalles_pedidos
  VALUES (97, 30, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (98, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (98, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (99, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (99, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (100, 3, 75, 3);
INSERT INTO detalles_pedidos
  VALUES (100, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (100, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (100, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (100, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (101, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (101, 15, 4.99, 4);
INSERT INTO detalles_pedidos
  VALUES (101, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (101, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (102, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (102, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (102, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (102, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (102, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (103, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (103, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (103, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (103, 24, 69, 3);
INSERT INTO detalles_pedidos
  VALUES (103, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (103, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (103, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (104, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (104, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (105, 2, 1746, 5);
INSERT INTO detalles_pedidos
  VALUES (105, 8, 50, 3);
INSERT INTO detalles_pedidos
  VALUES (105, 14, 139.95, 1);
INSERT INTO detalles_pedidos
  VALUES (105, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (105, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (105, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (106, 32, 32, 4);
INSERT INTO detalles_pedidos
  VALUES (107, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (107, 22, 82, 3);
INSERT INTO detalles_pedidos
  VALUES (107, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (107, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (107, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (108, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (109, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (110, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (110, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (110, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (110, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (111, 2, 1746, 6);
INSERT INTO detalles_pedidos
  VALUES (111, 8, 50, 4);
INSERT INTO detalles_pedidos
  VALUES (111, 14, 139.95, 3);
INSERT INTO detalles_pedidos
  VALUES (111, 20, 14.55, 6);
INSERT INTO detalles_pedidos
  VALUES (111, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (111, 32, 32, 4);
INSERT INTO detalles_pedidos
  VALUES (112, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (112, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (113, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (113, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (113, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (114, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (114, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (115, 8, 50, 4);
INSERT INTO detalles_pedidos
  VALUES (115, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (115, 24, 69, 3);
INSERT INTO detalles_pedidos
  VALUES (115, 32, 32, 4);
INSERT INTO detalles_pedidos
  VALUES (115, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (116, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (116, 12, 23.5, 2);
INSERT INTO detalles_pedidos
  VALUES (116, 20, 15, 2);
INSERT INTO detalles_pedidos
  VALUES (116, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (116, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (117, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (117, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (117, 18, 179, 4);
INSERT INTO detalles_pedidos
  VALUES (117, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (117, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (117, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (118, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (119, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (119, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (119, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (119, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (119, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (119, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (119, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (120, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (120, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (120, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (120, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (120, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (121, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (121, 14, 139.95, 1);
INSERT INTO detalles_pedidos
  VALUES (121, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (122, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (122, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (122, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (122, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (122, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (123, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (123, 12, 23.5, 2);
INSERT INTO detalles_pedidos
  VALUES (123, 18, 179, 1);
INSERT INTO detalles_pedidos
  VALUES (123, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (123, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (123, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (124, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (124, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (125, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (125, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (125, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (126, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (126, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (126, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (126, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (126, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (126, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (126, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (127, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (127, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (127, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (127, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (127, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (127, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (128, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (128, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (129, 24, 69, 1);
INSERT INTO detalles_pedidos
  VALUES (130, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (130, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (130, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (130, 18, 179, 2);
INSERT INTO detalles_pedidos
  VALUES (130, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (130, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (130, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (131, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (131, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (131, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (132, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (132, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (133, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (134, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (134, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (134, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (134, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (134, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (135, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (135, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (135, 22, 82, 1);
INSERT INTO detalles_pedidos
  VALUES (135, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (135, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (136, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (136, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (136, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (136, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (136, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (137, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (137, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (137, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (137, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (138, 10, 36, 4);
INSERT INTO detalles_pedidos
  VALUES (138, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (138, 22, 79.54, 5);
INSERT INTO detalles_pedidos
  VALUES (138, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (138, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (138, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (139, 32, 32, 4);
INSERT INTO detalles_pedidos
  VALUES (140, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (140, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (140, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (140, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (140, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (140, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (140, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (141, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (141, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (141, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (141, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (141, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (141, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (142, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (142, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (143, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (143, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (144, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (144, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (144, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (145, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (145, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (146, 18, 179, 2);
INSERT INTO detalles_pedidos
  VALUES (147, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (147, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (147, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (148, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (148, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (148, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (148, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (148, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (148, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (148, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (148, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (149, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (149, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (150, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (150, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (150, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (150, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (151, 24, 69, 4);
INSERT INTO detalles_pedidos
  VALUES (152, 2, 1800, 3);
INSERT INTO detalles_pedidos
  VALUES (152, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (152, 12, 23.5, 4);
INSERT INTO detalles_pedidos
  VALUES (152, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (152, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (152, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (152, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (153, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (153, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (153, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (153, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (153, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (154, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (154, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (155, 10, 36, 4);
INSERT INTO detalles_pedidos
  VALUES (155, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (155, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (155, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (156, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (156, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (156, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (156, 24, 69, 3);
INSERT INTO detalles_pedidos
  VALUES (156, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (156, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (156, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (157, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (157, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (157, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (157, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (158, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (159, 10, 34.92, 5);
INSERT INTO detalles_pedidos
  VALUES (159, 20, 15, 2);
INSERT INTO detalles_pedidos
  VALUES (159, 30, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (159, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (160, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (160, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (160, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (160, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (160, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (160, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (160, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (160, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (161, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (161, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (161, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (162, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (162, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (163, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (163, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (163, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (163, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (163, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (163, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (164, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (164, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (165, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (165, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (165, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (165, 20, 14.55, 6);
INSERT INTO detalles_pedidos
  VALUES (165, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (165, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (165, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (165, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (166, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (166, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (166, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (166, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (166, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (167, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (167, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (167, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (167, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (167, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (168, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (168, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (168, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (168, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (168, 29, 34, 4);
INSERT INTO detalles_pedidos
  VALUES (168, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (169, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (169, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (169, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (169, 24, 69, 2);
INSERT INTO detalles_pedidos
  VALUES (169, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (169, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (169, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (170, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (170, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (170, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (170, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (170, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (170, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (171, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (172, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (172, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (172, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (172, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (173, 22, 82, 3);
INSERT INTO detalles_pedidos
  VALUES (173, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (174, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (174, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (175, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (175, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (175, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (175, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (175, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (175, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (175, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (175, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (176, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (176, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (176, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (176, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (177, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (177, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (177, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (177, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (177, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (178, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (178, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (178, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (178, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (179, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (179, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (179, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (179, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (179, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (179, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (179, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (179, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (180, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (180, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (181, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (181, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (181, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (181, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (182, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (182, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (182, 18, 179, 4);
INSERT INTO detalles_pedidos
  VALUES (182, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (182, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (182, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (183, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (183, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (183, 12, 22.8, 5);
INSERT INTO detalles_pedidos
  VALUES (183, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (183, 22, 82, 4);
INSERT INTO detalles_pedidos
  VALUES (183, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (183, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (183, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (184, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (184, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (184, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (184, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (184, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (184, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (184, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (184, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (185, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (185, 18, 179, 2);
INSERT INTO detalles_pedidos
  VALUES (185, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (185, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (186, 5, 7.23, 6);
INSERT INTO detalles_pedidos
  VALUES (186, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (187, 22, 79.54, 5);
INSERT INTO detalles_pedidos
  VALUES (187, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (188, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (188, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (189, 5, 7.23, 5);
INSERT INTO detalles_pedidos
  VALUES (189, 15, 4.99, 4);
INSERT INTO detalles_pedidos
  VALUES (189, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (189, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (190, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (191, 8, 48.5, 5);
INSERT INTO detalles_pedidos
  VALUES (191, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (191, 18, 179, 1);
INSERT INTO detalles_pedidos
  VALUES (191, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (191, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (191, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (192, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (192, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (192, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (192, 32, 32, 4);
INSERT INTO detalles_pedidos
  VALUES (192, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (193, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (193, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (193, 20, 15, 4);
INSERT INTO detalles_pedidos
  VALUES (193, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (193, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (193, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (193, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (194, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (194, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (194, 31, 21.34, 6);
INSERT INTO detalles_pedidos
  VALUES (195, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (196, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (196, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (196, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (196, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (196, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (196, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (197, 18, 179, 1);
INSERT INTO detalles_pedidos
  VALUES (199, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (199, 15, 4.84, 5);
INSERT INTO detalles_pedidos
  VALUES (199, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (199, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (199, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (199, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (200, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (200, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (200, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (200, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (200, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (200, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (201, 5, 7.23, 6);
INSERT INTO detalles_pedidos
  VALUES (202, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (203, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (203, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (203, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (203, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (203, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (203, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (204, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (205, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (205, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (205, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (205, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (205, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (205, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (205, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (206, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (206, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (206, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (207, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (207, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (208, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (208, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (208, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (208, 24, 69, 1);
INSERT INTO detalles_pedidos
  VALUES (208, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (208, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (208, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (209, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (209, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (210, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (210, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (210, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (210, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (210, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (210, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (210, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (211, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (212, 3, 75, 2);
INSERT INTO detalles_pedidos
  VALUES (213, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (213, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (214, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (214, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (214, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (215, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (215, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (215, 18, 179, 3);
INSERT INTO detalles_pedidos
  VALUES (215, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (215, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (215, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (217, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (217, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (217, 30, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (217, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (218, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (218, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (218, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (218, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (218, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (218, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (219, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (219, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (219, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (219, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (219, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (219, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (220, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (220, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (220, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (220, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (220, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (220, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (220, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (221, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (221, 14, 139.95, 3);
INSERT INTO detalles_pedidos
  VALUES (221, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (221, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (221, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (222, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (222, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (222, 24, 69, 1);
INSERT INTO detalles_pedidos
  VALUES (222, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (223, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (223, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (223, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (223, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (224, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (224, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (224, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (224, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (224, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (225, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (225, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (225, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (225, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (225, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (225, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (226, 20, 15, 4);
INSERT INTO detalles_pedidos
  VALUES (226, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (226, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (227, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (227, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (227, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (227, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (227, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (227, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (227, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (227, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (228, 17, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (229, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (229, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (230, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (231, 8, 50, 4);
INSERT INTO detalles_pedidos
  VALUES (231, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (231, 18, 179, 2);
INSERT INTO detalles_pedidos
  VALUES (231, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (231, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (231, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (232, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (232, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (232, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (232, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (232, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (232, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (233, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (233, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (234, 10, 36, 2);
INSERT INTO detalles_pedidos
  VALUES (234, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (235, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (235, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (235, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (235, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (236, 5, 7.45, 4);
INSERT INTO detalles_pedidos
  VALUES (236, 10, 34.92, 6);
INSERT INTO detalles_pedidos
  VALUES (236, 15, 4.99, 4);
INSERT INTO detalles_pedidos
  VALUES (236, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (236, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (236, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (236, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (236, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (237, 2, 1800, 2);
INSERT INTO detalles_pedidos
  VALUES (237, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (237, 12, 22.8, 6);
INSERT INTO detalles_pedidos
  VALUES (237, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (237, 22, 82, 4);
INSERT INTO detalles_pedidos
  VALUES (237, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (237, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (238, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (238, 24, 69, 2);
INSERT INTO detalles_pedidos
  VALUES (238, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (239, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (239, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (239, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (239, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (239, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (239, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (239, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (240, 5, 7.23, 6);
INSERT INTO detalles_pedidos
  VALUES (240, 18, 173.63, 6);
INSERT INTO detalles_pedidos
  VALUES (240, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (241, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (241, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (241, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (242, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (242, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (242, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (242, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (242, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (242, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (242, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (242, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (243, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (243, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (243, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (243, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (243, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (243, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (243, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (244, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (245, 10, 34.92, 6);
INSERT INTO detalles_pedidos
  VALUES (245, 18, 179, 4);
INSERT INTO detalles_pedidos
  VALUES (245, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (245, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (246, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (246, 15, 4.99, 1);
INSERT INTO detalles_pedidos
  VALUES (246, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (246, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (246, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (246, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (247, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (247, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (247, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (247, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (247, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (248, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (248, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (248, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (248, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (248, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (248, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (249, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (249, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (249, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (249, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (249, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (249, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (250, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (250, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (250, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (251, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (251, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (251, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (251, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (251, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (251, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (251, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (252, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (252, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (252, 14, 139.95, 1);
INSERT INTO detalles_pedidos
  VALUES (252, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (252, 24, 69, 3);
INSERT INTO detalles_pedidos
  VALUES (252, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (252, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (252, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (253, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (253, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (254, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (254, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (254, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (255, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (256, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (256, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (256, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (256, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (256, 24, 69, 2);
INSERT INTO detalles_pedidos
  VALUES (256, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (256, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (256, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (257, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (257, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (257, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (257, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (257, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (257, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (258, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (258, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (258, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (258, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (258, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (258, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (258, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (258, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (259, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (260, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (260, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (260, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (260, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (260, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (261, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (261, 15, 4.99, 1);
INSERT INTO detalles_pedidos
  VALUES (261, 28, 29, 3);
INSERT INTO detalles_pedidos
  VALUES (262, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (263, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (263, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (263, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (263, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (264, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (265, 2, 1800, 4);
INSERT INTO detalles_pedidos
  VALUES (265, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (265, 12, 23.5, 2);
INSERT INTO detalles_pedidos
  VALUES (265, 17, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (265, 22, 82, 4);
INSERT INTO detalles_pedidos
  VALUES (265, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (265, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (265, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (266, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (266, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (266, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (266, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (266, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (267, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (267, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (267, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (268, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (268, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (268, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (268, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (268, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (268, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (268, 32, 32, 4);
INSERT INTO detalles_pedidos
  VALUES (268, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (269, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (269, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (269, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (269, 18, 179, 1);
INSERT INTO detalles_pedidos
  VALUES (269, 28, 29, 3);
INSERT INTO detalles_pedidos
  VALUES (269, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (269, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (270, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (270, 15, 4.99, 2);
INSERT INTO detalles_pedidos
  VALUES (270, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (270, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (271, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (271, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (271, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (271, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (271, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (272, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (272, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (272, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (272, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (273, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (273, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (273, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (273, 30, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (273, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (274, 18, 179, 3);
INSERT INTO detalles_pedidos
  VALUES (275, 5, 7.45, 2);
INSERT INTO detalles_pedidos
  VALUES (276, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (276, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (276, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (276, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (276, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (277, 12, 23.5, 1);
INSERT INTO detalles_pedidos
  VALUES (277, 20, 14.55, 6);
INSERT INTO detalles_pedidos
  VALUES (277, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (277, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (278, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (278, 24, 69, 3);
INSERT INTO detalles_pedidos
  VALUES (278, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (279, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (279, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (279, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (279, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (280, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (280, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (280, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (281, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (281, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (281, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (281, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (281, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (281, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (281, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (282, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (282, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (282, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (283, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (283, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (284, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (284, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (284, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (284, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (284, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (284, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (284, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (284, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (285, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (285, 17, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (285, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (285, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (286, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (286, 29, 34, 4);
INSERT INTO detalles_pedidos
  VALUES (287, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (287, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (288, 8, 48.5, 5);
INSERT INTO detalles_pedidos
  VALUES (288, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (289, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (289, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (289, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (289, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (290, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (290, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (290, 30, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (291, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (291, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (291, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (292, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (292, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (292, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (292, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (292, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (292, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (293, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (293, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (293, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (293, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (293, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (293, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (294, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (294, 15, 4.84, 6);
INSERT INTO detalles_pedidos
  VALUES (294, 20, 15, 4);
INSERT INTO detalles_pedidos
  VALUES (294, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (294, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (294, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (294, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (295, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (295, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (295, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (295, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (295, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (296, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (296, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (297, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (297, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (298, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (298, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (299, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (299, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (300, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (300, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (300, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (300, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (300, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (300, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (301, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (301, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (301, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (302, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (302, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (302, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (303, 8, 48.5, 5);
INSERT INTO detalles_pedidos
  VALUES (303, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (303, 18, 179, 4);
INSERT INTO detalles_pedidos
  VALUES (303, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (303, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (303, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (304, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (304, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (304, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (304, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (304, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (306, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (306, 20, 15, 2);
INSERT INTO detalles_pedidos
  VALUES (306, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (307, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (307, 7, 49, 2);
INSERT INTO detalles_pedidos
  VALUES (307, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (307, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (307, 30, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (307, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (308, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (308, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (308, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (308, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (309, 5, 7.23, 5);
INSERT INTO detalles_pedidos
  VALUES (309, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (309, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (309, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (309, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (310, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (310, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (310, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (310, 24, 69, 2);
INSERT INTO detalles_pedidos
  VALUES (310, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (310, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (310, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (311, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (311, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (311, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (311, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (312, 15, 4.99, 4);
INSERT INTO detalles_pedidos
  VALUES (312, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (312, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (312, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (312, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (313, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (313, 15, 4.84, 6);
INSERT INTO detalles_pedidos
  VALUES (313, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (313, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (314, 20, 14.55, 5);
INSERT INTO detalles_pedidos
  VALUES (314, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (315, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (315, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (315, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (315, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (315, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (315, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (316, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (317, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (317, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (317, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (317, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (317, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (318, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (319, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (319, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (320, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (321, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (321, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (321, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (321, 24, 69, 1);
INSERT INTO detalles_pedidos
  VALUES (321, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (321, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (322, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (323, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (323, 12, 23.5, 4);
INSERT INTO detalles_pedidos
  VALUES (323, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (323, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (323, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (323, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (323, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (324, 8, 50, 1);
INSERT INTO detalles_pedidos
  VALUES (325, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (325, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (325, 12, 23.5, 1);
INSERT INTO detalles_pedidos
  VALUES (325, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (325, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (325, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (325, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (325, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (326, 8, 48.5, 5);
INSERT INTO detalles_pedidos
  VALUES (327, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (327, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (327, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (327, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (327, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (328, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (329, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (329, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (329, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (329, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (329, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (329, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (329, 31, 21.34, 6);
INSERT INTO detalles_pedidos
  VALUES (329, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (330, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (330, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (330, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (330, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (331, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (331, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (331, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (331, 20, 14.55, 5);
INSERT INTO detalles_pedidos
  VALUES (331, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (331, 30, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (331, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (331, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (332, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (332, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (332, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (332, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (333, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (333, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (333, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (333, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (333, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (334, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (334, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (334, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (334, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (334, 30, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (334, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (335, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (335, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (335, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (335, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (336, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (336, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (336, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (336, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (336, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (336, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (336, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (336, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (337, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (337, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (337, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (337, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (338, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (338, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (338, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (338, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (338, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (339, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (339, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (339, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (339, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (339, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (339, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (339, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (340, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (340, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (340, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (341, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (342, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (342, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (342, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (343, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (343, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (343, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (344, 5, 7.23, 6);
INSERT INTO detalles_pedidos
  VALUES (344, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (344, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (344, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (344, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (345, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (345, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (345, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (345, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (345, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (346, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (346, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (346, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (346, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (346, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (347, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (347, 24, 69, 4);
INSERT INTO detalles_pedidos
  VALUES (347, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (348, 7, 49, 2);
INSERT INTO detalles_pedidos
  VALUES (348, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (348, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (348, 30, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (348, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (349, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (349, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (350, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (351, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (351, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (351, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (351, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (351, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (351, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (352, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (352, 22, 82, 3);
INSERT INTO detalles_pedidos
  VALUES (352, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (353, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (353, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (353, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (353, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (353, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (353, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (353, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (353, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (354, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (354, 7, 49, 2);
INSERT INTO detalles_pedidos
  VALUES (354, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (354, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (354, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (354, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (355, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (355, 12, 22.8, 5);
INSERT INTO detalles_pedidos
  VALUES (355, 20, 15, 2);
INSERT INTO detalles_pedidos
  VALUES (355, 28, 29, 3);
INSERT INTO detalles_pedidos
  VALUES (355, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (356, 2, 1800, 1);
INSERT INTO detalles_pedidos
  VALUES (356, 12, 23.5, 2);
INSERT INTO detalles_pedidos
  VALUES (356, 22, 82, 3);
INSERT INTO detalles_pedidos
  VALUES (356, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (357, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (357, 12, 22.8, 5);
INSERT INTO detalles_pedidos
  VALUES (357, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (357, 22, 82, 4);
INSERT INTO detalles_pedidos
  VALUES (357, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (357, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (357, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (358, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (358, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (358, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (358, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (358, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (358, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (358, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (358, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (359, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (359, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (359, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (359, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (359, 30, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (359, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (359, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (360, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (360, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (360, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (360, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (360, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (360, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (360, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (362, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (362, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (362, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (362, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (362, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (362, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (362, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (363, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (363, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (363, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (363, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (363, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (363, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (363, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (363, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (364, 3, 75, 3);
INSERT INTO detalles_pedidos
  VALUES (364, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (364, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (365, 20, 14.55, 6);
INSERT INTO detalles_pedidos
  VALUES (365, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (366, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (366, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (366, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (366, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (366, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (366, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (366, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (367, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (367, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (367, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (367, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (367, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (367, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (368, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (368, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (369, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (370, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (370, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (370, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (370, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (370, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (371, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (371, 22, 79.54, 5);
INSERT INTO detalles_pedidos
  VALUES (371, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (372, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (372, 8, 48.5, 5);
INSERT INTO detalles_pedidos
  VALUES (372, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (372, 18, 173.63, 6);
INSERT INTO detalles_pedidos
  VALUES (372, 28, 29, 3);
INSERT INTO detalles_pedidos
  VALUES (372, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (372, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (373, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (373, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (373, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (373, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (373, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (373, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (373, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (373, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (374, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (374, 12, 23.5, 4);
INSERT INTO detalles_pedidos
  VALUES (374, 22, 82, 4);
INSERT INTO detalles_pedidos
  VALUES (374, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (375, 2, 1800, 2);
INSERT INTO detalles_pedidos
  VALUES (375, 8, 50, 4);
INSERT INTO detalles_pedidos
  VALUES (375, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (375, 20, 15, 4);
INSERT INTO detalles_pedidos
  VALUES (375, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (375, 32, 32, 4);
INSERT INTO detalles_pedidos
  VALUES (376, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (376, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (376, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (376, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (376, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (377, 8, 50, 4);
INSERT INTO detalles_pedidos
  VALUES (377, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (377, 20, 14.55, 6);
INSERT INTO detalles_pedidos
  VALUES (377, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (377, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (377, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (378, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (378, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (378, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (378, 18, 173.63, 5);
INSERT INTO detalles_pedidos
  VALUES (378, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (378, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (378, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (379, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (379, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (379, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (379, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (380, 24, 69, 3);
INSERT INTO detalles_pedidos
  VALUES (381, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (381, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (381, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (381, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (381, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (381, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (381, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (382, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (383, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (383, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (383, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (383, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (383, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (383, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (383, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (383, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (384, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (384, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (385, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (385, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (385, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (385, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (385, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (385, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (385, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (385, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (386, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (386, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (386, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (386, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (386, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (387, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (387, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (387, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (387, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (387, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (387, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (387, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (387, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (388, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (388, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (388, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (388, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (388, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (389, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (389, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (389, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (389, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (390, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (390, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (390, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (390, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (390, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (390, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (390, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (390, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (391, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (391, 12, 23.5, 2);
INSERT INTO detalles_pedidos
  VALUES (391, 18, 179, 1);
INSERT INTO detalles_pedidos
  VALUES (391, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (391, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (391, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (392, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (392, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (392, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (392, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (393, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (393, 28, 29, 3);
INSERT INTO detalles_pedidos
  VALUES (394, 15, 4.99, 3);
INSERT INTO detalles_pedidos
  VALUES (394, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (395, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (396, 5, 7.45, 4);
INSERT INTO detalles_pedidos
  VALUES (396, 15, 4.99, 2);
INSERT INTO detalles_pedidos
  VALUES (396, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (396, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (397, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (398, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (398, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (398, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (398, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (398, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (398, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (398, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (398, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (399, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (399, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (399, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (399, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (399, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (399, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (399, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (399, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (400, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (400, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (400, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (400, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (400, 30, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (400, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (401, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (401, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (401, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (401, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (402, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (402, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (402, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (402, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (402, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (403, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (403, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (403, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (403, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (403, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (403, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (403, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (403, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (404, 2, 1746, 5);
INSERT INTO detalles_pedidos
  VALUES (405, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (405, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (405, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (405, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (406, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (406, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (406, 22, 79.54, 5);
INSERT INTO detalles_pedidos
  VALUES (406, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (406, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (407, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (407, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (408, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (409, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (409, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (409, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (410, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (410, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (410, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (411, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (412, 10, 36, 4);
INSERT INTO detalles_pedidos
  VALUES (412, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (412, 22, 82, 1);
INSERT INTO detalles_pedidos
  VALUES (412, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (412, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (412, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (413, 22, 82, 3);
INSERT INTO detalles_pedidos
  VALUES (413, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (414, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (414, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (414, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (414, 20, 14.55, 5);
INSERT INTO detalles_pedidos
  VALUES (414, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (414, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (414, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (414, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (415, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (415, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (415, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (416, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (416, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (416, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (416, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (416, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (416, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (417, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (418, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (418, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (418, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (418, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (419, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (420, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (420, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (420, 22, 79.54, 5);
INSERT INTO detalles_pedidos
  VALUES (420, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (420, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (421, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (421, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (422, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (422, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (423, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (423, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (423, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (423, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (423, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (423, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (424, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (425, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (425, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (425, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (426, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (426, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (426, 30, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (426, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (427, 5, 7.45, 4);
INSERT INTO detalles_pedidos
  VALUES (427, 18, 179, 4);
INSERT INTO detalles_pedidos
  VALUES (427, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (428, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (428, 15, 4.84, 5);
INSERT INTO detalles_pedidos
  VALUES (428, 20, 15, 1);
INSERT INTO detalles_pedidos
  VALUES (428, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (428, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (428, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (428, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (429, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (430, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (431, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (431, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (431, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (431, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (431, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (431, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (432, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (432, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (432, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (432, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (433, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (433, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (433, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (433, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (433, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (433, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (433, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (434, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (434, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (434, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (434, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (434, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (434, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (434, 31, 21.34, 6);
INSERT INTO detalles_pedidos
  VALUES (434, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (435, 12, 23.5, 2);
INSERT INTO detalles_pedidos
  VALUES (436, 15, 4.84, 5);
INSERT INTO detalles_pedidos
  VALUES (436, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (437, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (437, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (437, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (437, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (437, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (438, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (438, 12, 23.5, 2);
INSERT INTO detalles_pedidos
  VALUES (438, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (438, 22, 82, 4);
INSERT INTO detalles_pedidos
  VALUES (438, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (438, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (438, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (439, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (439, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (439, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (440, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (440, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (441, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (441, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (441, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (441, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (441, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (441, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (441, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (442, 12, 23.5, 4);
INSERT INTO detalles_pedidos
  VALUES (442, 20, 15, 1);
INSERT INTO detalles_pedidos
  VALUES (442, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (442, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (443, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (443, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (443, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (443, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (443, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (444, 8, 50, 4);
INSERT INTO detalles_pedidos
  VALUES (444, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (444, 18, 179, 3);
INSERT INTO detalles_pedidos
  VALUES (444, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (444, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (444, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (445, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (445, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (445, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (445, 29, 34, 4);
INSERT INTO detalles_pedidos
  VALUES (445, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (446, 15, 4.99, 2);
INSERT INTO detalles_pedidos
  VALUES (446, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (447, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (447, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (447, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (447, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (447, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (448, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (448, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (449, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (449, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (449, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (449, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (449, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (449, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (449, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (449, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (450, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (450, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (450, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (450, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (450, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (450, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (450, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (451, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (452, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (453, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (453, 7, 49, 2);
INSERT INTO detalles_pedidos
  VALUES (453, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (453, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (453, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (453, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (454, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (454, 15, 4.99, 4);
INSERT INTO detalles_pedidos
  VALUES (454, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (455, 18, 173.63, 6);
INSERT INTO detalles_pedidos
  VALUES (455, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (456, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (457, 2, 1800, 1);
INSERT INTO detalles_pedidos
  VALUES (457, 10, 36, 2);
INSERT INTO detalles_pedidos
  VALUES (457, 18, 179, 2);
INSERT INTO detalles_pedidos
  VALUES (457, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (457, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (458, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (458, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (458, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (458, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (459, 8, 48.5, 5);
INSERT INTO detalles_pedidos
  VALUES (459, 18, 179, 2);
INSERT INTO detalles_pedidos
  VALUES (459, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (459, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (460, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (461, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (461, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (461, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (461, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (461, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (462, 10, 36, 1);
INSERT INTO detalles_pedidos
  VALUES (462, 30, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (463, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (463, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (464, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (464, 24, 69, 3);
INSERT INTO detalles_pedidos
  VALUES (464, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (465, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (465, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (465, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (465, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (465, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (465, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (465, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (465, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (466, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (466, 15, 4.99, 1);
INSERT INTO detalles_pedidos
  VALUES (466, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (466, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (466, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (466, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (467, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (467, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (467, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (468, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (468, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (468, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (468, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (468, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (469, 2, 1746, 5);
INSERT INTO detalles_pedidos
  VALUES (469, 15, 4.99, 1);
INSERT INTO detalles_pedidos
  VALUES (469, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (470, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (470, 15, 4.99, 3);
INSERT INTO detalles_pedidos
  VALUES (470, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (470, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (471, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (472, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (472, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (473, 10, 34.92, 5);
INSERT INTO detalles_pedidos
  VALUES (473, 15, 4.99, 2);
INSERT INTO detalles_pedidos
  VALUES (473, 20, 15, 1);
INSERT INTO detalles_pedidos
  VALUES (473, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (473, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (473, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (473, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (474, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (474, 15, 4.99, 3);
INSERT INTO detalles_pedidos
  VALUES (474, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (474, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (474, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (474, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (475, 20, 14.55, 6);
INSERT INTO detalles_pedidos
  VALUES (475, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (475, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (475, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (475, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (476, 18, 179, 3);
INSERT INTO detalles_pedidos
  VALUES (476, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (477, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (477, 7, 49, 2);
INSERT INTO detalles_pedidos
  VALUES (477, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (477, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (477, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (477, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (478, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (478, 14, 139.95, 3);
INSERT INTO detalles_pedidos
  VALUES (478, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (478, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (478, 29, 34, 4);
INSERT INTO detalles_pedidos
  VALUES (478, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (478, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (479, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (479, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (479, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (479, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (479, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (479, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (480, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (480, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (480, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (480, 30, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (480, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (481, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (481, 15, 4.99, 4);
INSERT INTO detalles_pedidos
  VALUES (481, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (481, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (482, 24, 69, 3);
INSERT INTO detalles_pedidos
  VALUES (483, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (483, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (483, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (483, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (485, 10, 34.92, 5);
INSERT INTO detalles_pedidos
  VALUES (485, 15, 4.99, 1);
INSERT INTO detalles_pedidos
  VALUES (485, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (485, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (485, 30, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (485, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (485, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (486, 5, 7.45, 4);
INSERT INTO detalles_pedidos
  VALUES (486, 10, 36, 1);
INSERT INTO detalles_pedidos
  VALUES (486, 15, 4.84, 5);
INSERT INTO detalles_pedidos
  VALUES (486, 20, 15, 1);
INSERT INTO detalles_pedidos
  VALUES (486, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (486, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (486, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (486, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (487, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (487, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (487, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (487, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (488, 10, 36, 1);
INSERT INTO detalles_pedidos
  VALUES (488, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (489, 5, 7.23, 5);
INSERT INTO detalles_pedidos
  VALUES (489, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (490, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (490, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (490, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (491, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (491, 7, 49, 2);
INSERT INTO detalles_pedidos
  VALUES (491, 22, 79.54, 5);
INSERT INTO detalles_pedidos
  VALUES (491, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (491, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (491, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (492, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (492, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (492, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (492, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (492, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (492, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (493, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (493, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (494, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (495, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (495, 15, 4.99, 1);
INSERT INTO detalles_pedidos
  VALUES (495, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (495, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (495, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (495, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (496, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (496, 14, 139.95, 3);
INSERT INTO detalles_pedidos
  VALUES (496, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (497, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (497, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (497, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (497, 24, 69, 2);
INSERT INTO detalles_pedidos
  VALUES (497, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (497, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (497, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (498, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (498, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (498, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (498, 22, 82, 1);
INSERT INTO detalles_pedidos
  VALUES (498, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (498, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (498, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (499, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (499, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (499, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (499, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (500, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (500, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (500, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (500, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (501, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (501, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (501, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (501, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (502, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (502, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (502, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (502, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (503, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (503, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (503, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (503, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (503, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (504, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (505, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (505, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (505, 20, 14.55, 6);
INSERT INTO detalles_pedidos
  VALUES (505, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (505, 30, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (505, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (505, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (506, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (506, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (507, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (507, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (507, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (507, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (508, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (508, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (508, 30, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (508, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (509, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (509, 18, 173.63, 5);
INSERT INTO detalles_pedidos
  VALUES (509, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (509, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (510, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (510, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (510, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (510, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (511, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (511, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (511, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (511, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (512, 8, 48.5, 6);
INSERT INTO detalles_pedidos
  VALUES (513, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (513, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (513, 15, 4.99, 2);
INSERT INTO detalles_pedidos
  VALUES (513, 20, 14.55, 5);
INSERT INTO detalles_pedidos
  VALUES (513, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (513, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (513, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (513, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (514, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (514, 10, 36, 3);
INSERT INTO detalles_pedidos
  VALUES (514, 18, 179, 4);
INSERT INTO detalles_pedidos
  VALUES (514, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (514, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (515, 10, 36, 4);
INSERT INTO detalles_pedidos
  VALUES (515, 18, 179, 4);
INSERT INTO detalles_pedidos
  VALUES (515, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (515, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (516, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (516, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (516, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (517, 5, 7.45, 1);
INSERT INTO detalles_pedidos
  VALUES (517, 10, 36, 2);
INSERT INTO detalles_pedidos
  VALUES (517, 15, 4.99, 2);
INSERT INTO detalles_pedidos
  VALUES (517, 20, 15, 4);
INSERT INTO detalles_pedidos
  VALUES (517, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (517, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (517, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (518, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (518, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (519, 5, 7.23, 6);
INSERT INTO detalles_pedidos
  VALUES (519, 15, 4.99, 3);
INSERT INTO detalles_pedidos
  VALUES (519, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (519, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (520, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (520, 12, 22.8, 5);
INSERT INTO detalles_pedidos
  VALUES (520, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (520, 22, 82, 1);
INSERT INTO detalles_pedidos
  VALUES (520, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (520, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (520, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (521, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (521, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (522, 15, 4.99, 1);
INSERT INTO detalles_pedidos
  VALUES (524, 29, 34, 4);
INSERT INTO detalles_pedidos
  VALUES (525, 3, 75, 2);
INSERT INTO detalles_pedidos
  VALUES (525, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (525, 15, 4.84, 6);
INSERT INTO detalles_pedidos
  VALUES (525, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (525, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (525, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (526, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (526, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (527, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (528, 2, 1800, 3);
INSERT INTO detalles_pedidos
  VALUES (528, 22, 82, 3);
INSERT INTO detalles_pedidos
  VALUES (529, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (529, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (529, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (529, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (529, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (530, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (530, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (530, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (530, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (530, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (530, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (530, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (531, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (531, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (531, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (531, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (531, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (531, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (532, 5, 7.23, 5);
INSERT INTO detalles_pedidos
  VALUES (532, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (532, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (532, 29, 34, 4);
INSERT INTO detalles_pedidos
  VALUES (532, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (533, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (533, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (533, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (533, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (533, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (533, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (533, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (534, 5, 7.45, 2);
INSERT INTO detalles_pedidos
  VALUES (534, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (535, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (535, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (535, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (536, 10, 36, 4);
INSERT INTO detalles_pedidos
  VALUES (536, 15, 4.99, 3);
INSERT INTO detalles_pedidos
  VALUES (536, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (536, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (536, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (536, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (536, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (537, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (537, 17, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (537, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (537, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (538, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (538, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (538, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (538, 20, 15, 2);
INSERT INTO detalles_pedidos
  VALUES (538, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (538, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (538, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (538, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (539, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (539, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (539, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (539, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (539, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (539, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (539, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (539, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (540, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (540, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (540, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (540, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (540, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (541, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (541, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (541, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (541, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (542, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (542, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (542, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (543, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (544, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (544, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (544, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (544, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (544, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (544, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (544, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (545, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (545, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (545, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (545, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (545, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (545, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (545, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (546, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (546, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (547, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (547, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (547, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (547, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (547, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (548, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (548, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (548, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (548, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (548, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (548, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (549, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (550, 10, 36, 1);
INSERT INTO detalles_pedidos
  VALUES (550, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (550, 22, 82, 1);
INSERT INTO detalles_pedidos
  VALUES (550, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (550, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (550, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (551, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (551, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (551, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (551, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (551, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (551, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (552, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (552, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (552, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (552, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (552, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (552, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (552, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (553, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (553, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (553, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (553, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (554, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (554, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (554, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (554, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (554, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (555, 3, 72.75, 5);
INSERT INTO detalles_pedidos
  VALUES (555, 8, 50, 3);
INSERT INTO detalles_pedidos
  VALUES (555, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (555, 18, 179, 2);
INSERT INTO detalles_pedidos
  VALUES (555, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (555, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (555, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (556, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (556, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (556, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (556, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (556, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (557, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (557, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (557, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (557, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (557, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (557, 31, 21.34, 6);
INSERT INTO detalles_pedidos
  VALUES (557, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (558, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (558, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (558, 20, 15, 1);
INSERT INTO detalles_pedidos
  VALUES (558, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (558, 30, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (558, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (558, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (559, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (559, 8, 50, 4);
INSERT INTO detalles_pedidos
  VALUES (559, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (559, 18, 179, 4);
INSERT INTO detalles_pedidos
  VALUES (559, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (559, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (559, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (560, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (560, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (560, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (560, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (560, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (560, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (561, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (562, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (563, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (563, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (563, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (563, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (563, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (563, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (564, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (564, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (565, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (565, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (566, 10, 34.92, 5);
INSERT INTO detalles_pedidos
  VALUES (566, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (566, 22, 82, 3);
INSERT INTO detalles_pedidos
  VALUES (566, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (566, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (566, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (567, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (567, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (568, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (569, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (569, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (569, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (569, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (569, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (569, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (570, 15, 4.84, 6);
INSERT INTO detalles_pedidos
  VALUES (570, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (570, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (571, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (571, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (571, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (572, 15, 4.99, 4);
INSERT INTO detalles_pedidos
  VALUES (572, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (572, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (572, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (572, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (573, 5, 7.45, 2);
INSERT INTO detalles_pedidos
  VALUES (573, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (573, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (573, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (573, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (574, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (575, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (575, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (575, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (575, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (575, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (575, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (575, 31, 21.34, 6);
INSERT INTO detalles_pedidos
  VALUES (575, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (576, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (577, 12, 23.5, 1);
INSERT INTO detalles_pedidos
  VALUES (577, 20, 14.55, 5);
INSERT INTO detalles_pedidos
  VALUES (577, 28, 29, 3);
INSERT INTO detalles_pedidos
  VALUES (577, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (578, 8, 48.5, 5);
INSERT INTO detalles_pedidos
  VALUES (578, 18, 179, 3);
INSERT INTO detalles_pedidos
  VALUES (578, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (578, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (579, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (579, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (579, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (579, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (579, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (579, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (579, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (580, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (580, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (581, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (581, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (581, 30, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (581, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (581, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (582, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (582, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (582, 14, 139.95, 1);
INSERT INTO detalles_pedidos
  VALUES (582, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (582, 24, 69, 4);
INSERT INTO detalles_pedidos
  VALUES (582, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (582, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (582, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (583, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (583, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (583, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (583, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (583, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (584, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (584, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (584, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (584, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (585, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (585, 18, 179, 3);
INSERT INTO detalles_pedidos
  VALUES (585, 31, 21.34, 6);
INSERT INTO detalles_pedidos
  VALUES (586, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (587, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (587, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (588, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (588, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (588, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (588, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (589, 10, 34.92, 6);
INSERT INTO detalles_pedidos
  VALUES (589, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (590, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (590, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (590, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (590, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (590, 30, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (590, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (590, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (591, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (591, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (591, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (591, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (591, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (592, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (592, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (592, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (592, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (592, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (592, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (593, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (594, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (594, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (594, 18, 173.63, 5);
INSERT INTO detalles_pedidos
  VALUES (594, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (594, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (595, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (596, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (596, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (596, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (596, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (596, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (597, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (597, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (597, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (597, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (597, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (597, 30, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (597, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (597, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (598, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (598, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (598, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (598, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (598, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (598, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (598, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (599, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (599, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (599, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (600, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (600, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (600, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (600, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (600, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (600, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (600, 31, 21.34, 6);
INSERT INTO detalles_pedidos
  VALUES (600, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (601, 12, 22.8, 6);
INSERT INTO detalles_pedidos
  VALUES (602, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (603, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (603, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (603, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (603, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (604, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (604, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (604, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (605, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (605, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (605, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (605, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (605, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (605, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (606, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (606, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (606, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (607, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (607, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (608, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (608, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (608, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (608, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (609, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (609, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (609, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (609, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (609, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (610, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (610, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (610, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (610, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (610, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (610, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (610, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (611, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (611, 15, 4.99, 2);
INSERT INTO detalles_pedidos
  VALUES (611, 20, 15, 1);
INSERT INTO detalles_pedidos
  VALUES (611, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (611, 30, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (611, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (611, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (612, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (612, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (612, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (612, 24, 69, 4);
INSERT INTO detalles_pedidos
  VALUES (612, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (612, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (612, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (613, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (614, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (614, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (614, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (615, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (615, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (615, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (615, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (615, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (615, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (615, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (615, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (616, 18, 179, 2);
INSERT INTO detalles_pedidos
  VALUES (616, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (617, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (617, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (617, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (617, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (617, 24, 69, 4);
INSERT INTO detalles_pedidos
  VALUES (617, 29, 34, 4);
INSERT INTO detalles_pedidos
  VALUES (617, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (617, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (618, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (618, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (618, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (618, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (619, 3, 75, 3);
INSERT INTO detalles_pedidos
  VALUES (620, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (620, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (620, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (620, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (620, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (620, 28, 29, 3);
INSERT INTO detalles_pedidos
  VALUES (620, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (620, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (621, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (622, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (622, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (622, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (622, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (622, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (623, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (623, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (624, 12, 23.5, 2);
INSERT INTO detalles_pedidos
  VALUES (624, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (624, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (624, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (625, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (625, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (625, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (625, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (625, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (625, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (626, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (626, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (626, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (627, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (627, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (628, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (630, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (630, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (630, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (630, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (631, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (631, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (631, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (631, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (631, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (631, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (633, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (633, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (634, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (634, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (634, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (634, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (635, 8, 48.5, 5);
INSERT INTO detalles_pedidos
  VALUES (635, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (635, 20, 15, 4);
INSERT INTO detalles_pedidos
  VALUES (635, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (635, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (635, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (636, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (636, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (636, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (636, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (636, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (636, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (636, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (636, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (637, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (637, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (637, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (637, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (637, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (637, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (637, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (637, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (638, 8, 50, 4);
INSERT INTO detalles_pedidos
  VALUES (638, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (639, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (639, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (639, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (639, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (639, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (639, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (640, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (640, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (640, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (641, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (641, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (641, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (641, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (642, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (642, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (642, 17, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (642, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (642, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (643, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (643, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (643, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (643, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (644, 3, 75, 2);
INSERT INTO detalles_pedidos
  VALUES (644, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (644, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (645, 10, 34.92, 5);
INSERT INTO detalles_pedidos
  VALUES (645, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (646, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (647, 3, 75, 1);
INSERT INTO detalles_pedidos
  VALUES (647, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (647, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (648, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (649, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (649, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (649, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (650, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (650, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (650, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (651, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (651, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (651, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (651, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (651, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (651, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (652, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (652, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (652, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (652, 24, 69, 4);
INSERT INTO detalles_pedidos
  VALUES (652, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (652, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (652, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (653, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (653, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (654, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (654, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (654, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (654, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (654, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (654, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (654, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (655, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (655, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (655, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (655, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (655, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (656, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (656, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (656, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (656, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (657, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (657, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (657, 30, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (657, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (658, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (658, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (658, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (658, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (658, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (659, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (659, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (659, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (660, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (660, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (660, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (660, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (660, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (660, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (661, 2, 1800, 3);
INSERT INTO detalles_pedidos
  VALUES (661, 15, 4.84, 5);
INSERT INTO detalles_pedidos
  VALUES (661, 28, 29, 1);
INSERT INTO detalles_pedidos
  VALUES (662, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (662, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (662, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (662, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (662, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (662, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (662, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (663, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (663, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (663, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (663, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (663, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (664, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (664, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (665, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (665, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (665, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (665, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (666, 2, 1800, 3);
INSERT INTO detalles_pedidos
  VALUES (666, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (667, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (667, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (667, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (667, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (667, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (667, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (668, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (668, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (668, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (668, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (668, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (669, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (669, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (669, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (669, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (669, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (669, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (670, 12, 22.8, 5);
INSERT INTO detalles_pedidos
  VALUES (670, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (670, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (671, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (671, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (671, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (671, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (671, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (671, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (671, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (672, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (672, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (672, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (672, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (672, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (673, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (673, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (673, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (674, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (674, 30, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (675, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (675, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (675, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (675, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (675, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (676, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (676, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (676, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (676, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (676, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (676, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (676, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (677, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (677, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (677, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (677, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (677, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (677, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (678, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (678, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (678, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (678, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (678, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (678, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (678, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (679, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (679, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (679, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (679, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (679, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (679, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (679, 31, 21.34, 6);
INSERT INTO detalles_pedidos
  VALUES (679, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (680, 8, 48.5, 6);
INSERT INTO detalles_pedidos
  VALUES (680, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (680, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (680, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (680, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (680, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (681, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (681, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (681, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (681, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (682, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (682, 7, 49, 2);
INSERT INTO detalles_pedidos
  VALUES (682, 12, 23.5, 3);
INSERT INTO detalles_pedidos
  VALUES (682, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (682, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (682, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (682, 32, 32, 4);
INSERT INTO detalles_pedidos
  VALUES (682, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (683, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (684, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (684, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (684, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (684, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (684, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (684, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (684, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (684, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (685, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (685, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (685, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (685, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (685, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (685, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (685, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (686, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (686, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (686, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (686, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (686, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (686, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (687, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (687, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (687, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (687, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (687, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (688, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (688, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (688, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (688, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (688, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (690, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (690, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (690, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (690, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (691, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (691, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (691, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (691, 18, 179, 3);
INSERT INTO detalles_pedidos
  VALUES (691, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (691, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (691, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (692, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (692, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (693, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (693, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (693, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (693, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (694, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (694, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (694, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (694, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (694, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (694, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (695, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (695, 24, 69, 2);
INSERT INTO detalles_pedidos
  VALUES (696, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (696, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (696, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (696, 20, 14.55, 6);
INSERT INTO detalles_pedidos
  VALUES (696, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (696, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (696, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (696, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (697, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (697, 20, 15, 2);
INSERT INTO detalles_pedidos
  VALUES (697, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (698, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (698, 17, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (698, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (698, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (699, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (699, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (699, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (699, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (700, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (700, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (701, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (701, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (701, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (702, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (702, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (702, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (702, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (702, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (702, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (702, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (703, 20, 15, 2);
INSERT INTO detalles_pedidos
  VALUES (703, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (704, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (704, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (705, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (705, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (706, 8, 50, 3);
INSERT INTO detalles_pedidos
  VALUES (706, 18, 173.63, 6);
INSERT INTO detalles_pedidos
  VALUES (706, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (706, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (707, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (708, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (708, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (708, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (708, 18, 179, 1);
INSERT INTO detalles_pedidos
  VALUES (708, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (708, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (708, 38, 161.02, 6);
INSERT INTO detalles_pedidos
  VALUES (709, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (709, 12, 23.5, 1);
INSERT INTO detalles_pedidos
  VALUES (709, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (709, 22, 82, 3);
INSERT INTO detalles_pedidos
  VALUES (709, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (709, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (709, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (710, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (710, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (710, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (710, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (710, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (711, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (711, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (711, 14, 139.95, 3);
INSERT INTO detalles_pedidos
  VALUES (711, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (711, 24, 69, 2);
INSERT INTO detalles_pedidos
  VALUES (711, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (711, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (711, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (712, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (712, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (712, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (712, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (712, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (713, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (714, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (714, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (714, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (714, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (714, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (714, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (714, 31, 21.34, 6);
INSERT INTO detalles_pedidos
  VALUES (714, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (715, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (715, 7, 49, 2);
INSERT INTO detalles_pedidos
  VALUES (715, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (715, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (715, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (715, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (716, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (716, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (717, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (717, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (717, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (717, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (717, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (717, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (718, 12, 22.8, 6);
INSERT INTO detalles_pedidos
  VALUES (718, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (718, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (719, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (719, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (719, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (720, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (720, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (720, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (721, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (721, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (721, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (721, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (722, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (722, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (722, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (723, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (723, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (723, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (723, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (724, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (724, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (724, 18, 179, 2);
INSERT INTO detalles_pedidos
  VALUES (724, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (724, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (725, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (725, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (726, 3, 75, 2);
INSERT INTO detalles_pedidos
  VALUES (726, 8, 48.5, 5);
INSERT INTO detalles_pedidos
  VALUES (726, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (726, 18, 179, 1);
INSERT INTO detalles_pedidos
  VALUES (726, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (726, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (727, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (727, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (727, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (727, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (727, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (727, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (727, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (728, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (728, 22, 82, 1);
INSERT INTO detalles_pedidos
  VALUES (728, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (729, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (729, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (729, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (730, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (730, 9, 32.01, 5);
INSERT INTO detalles_pedidos
  VALUES (730, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (730, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (731, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (731, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (731, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (731, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (731, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (731, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (732, 18, 179, 2);
INSERT INTO detalles_pedidos
  VALUES (732, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (732, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (732, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (733, 8, 50, 1);
INSERT INTO detalles_pedidos
  VALUES (733, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (733, 24, 69, 1);
INSERT INTO detalles_pedidos
  VALUES (733, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (733, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (734, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (735, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (735, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (735, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (735, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (735, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (735, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (736, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (736, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (736, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (737, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (738, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (738, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (738, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (738, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (739, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (740, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (740, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (740, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (740, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (740, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (740, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (740, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (741, 2, 1800, 4);
INSERT INTO detalles_pedidos
  VALUES (741, 8, 48.5, 5);
INSERT INTO detalles_pedidos
  VALUES (741, 14, 139.95, 1);
INSERT INTO detalles_pedidos
  VALUES (741, 20, 15, 1);
INSERT INTO detalles_pedidos
  VALUES (741, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (741, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (742, 5, 7.45, 1);
INSERT INTO detalles_pedidos
  VALUES (742, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (742, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (742, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (742, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (743, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (743, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (743, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (743, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (744, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (744, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (744, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (744, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (744, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (744, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (744, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (744, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (745, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (745, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (745, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (745, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (745, 24, 69, 3);
INSERT INTO detalles_pedidos
  VALUES (745, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (745, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (745, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (746, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (746, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (746, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (746, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (746, 32, 32, 4);
INSERT INTO detalles_pedidos
  VALUES (746, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (747, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (747, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (747, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (747, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (747, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (747, 35, 39, 2);
INSERT INTO detalles_pedidos
  VALUES (748, 5, 7.45, 4);
INSERT INTO detalles_pedidos
  VALUES (748, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (748, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (748, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (748, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (749, 8, 50, 4);
INSERT INTO detalles_pedidos
  VALUES (750, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (750, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (750, 15, 4.99, 4);
INSERT INTO detalles_pedidos
  VALUES (750, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (750, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (750, 30, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (750, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (750, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (751, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (751, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (751, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (751, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (751, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (752, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (752, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (752, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (752, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (752, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (752, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (752, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (752, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (754, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (755, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (755, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (755, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (755, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (755, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (755, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (755, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (756, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (756, 26, 125, 2);
INSERT INTO detalles_pedidos
  VALUES (756, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (757, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (757, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (757, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (757, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (757, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (757, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (757, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (758, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (759, 8, 50, 4);
INSERT INTO detalles_pedidos
  VALUES (759, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (759, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (760, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (760, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (760, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (760, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (760, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (760, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (760, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (761, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (761, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (761, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (761, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (761, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (761, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (762, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (762, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (762, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (762, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (762, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (762, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (762, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (762, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (763, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (763, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (764, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (764, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (765, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (765, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (765, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (765, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (765, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (766, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (766, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (767, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (767, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (767, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (767, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (767, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (767, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (768, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (769, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (769, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (769, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (769, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (769, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (769, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (769, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (769, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (770, 10, 36, 4);
INSERT INTO detalles_pedidos
  VALUES (771, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (771, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (772, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (772, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (772, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (772, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (773, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (774, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (774, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (774, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (774, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (774, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (775, 3, 75, 3);
INSERT INTO detalles_pedidos
  VALUES (775, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (775, 15, 4.99, 4);
INSERT INTO detalles_pedidos
  VALUES (775, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (775, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (775, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (776, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (776, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (776, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (776, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (777, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (777, 18, 179, 3);
INSERT INTO detalles_pedidos
  VALUES (777, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (777, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (778, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (778, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (778, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (779, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (779, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (779, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (779, 24, 69, 2);
INSERT INTO detalles_pedidos
  VALUES (779, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (779, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (779, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (780, 5, 7.45, 1);
INSERT INTO detalles_pedidos
  VALUES (780, 10, 34.92, 5);
INSERT INTO detalles_pedidos
  VALUES (780, 15, 4.99, 1);
INSERT INTO detalles_pedidos
  VALUES (780, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (780, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (780, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (780, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (780, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (781, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (781, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (781, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (781, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (781, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (782, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (783, 2, 1800, 3);
INSERT INTO detalles_pedidos
  VALUES (783, 10, 34.92, 6);
INSERT INTO detalles_pedidos
  VALUES (783, 18, 173.63, 5);
INSERT INTO detalles_pedidos
  VALUES (783, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (783, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (784, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (784, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (784, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (785, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (785, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (785, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (786, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (786, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (786, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (786, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (787, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (787, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (787, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (787, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (787, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (787, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (787, 32, 31.04, 5);
INSERT INTO detalles_pedidos
  VALUES (787, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (788, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (788, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (788, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (788, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (789, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (789, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (789, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (789, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (790, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (790, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (790, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (790, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (790, 25, 139, 3);
INSERT INTO detalles_pedidos
  VALUES (790, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (791, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (791, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (791, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (792, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (792, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (793, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (793, 22, 79.54, 5);
INSERT INTO detalles_pedidos
  VALUES (793, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (794, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (794, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (794, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (795, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (795, 22, 82, 4);
INSERT INTO detalles_pedidos
  VALUES (795, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (796, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (796, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (796, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (797, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (797, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (797, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (797, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (797, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (797, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (797, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (797, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (798, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (798, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (798, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (798, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (799, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (799, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (799, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (799, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (799, 30, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (799, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (800, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (800, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (800, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (800, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (801, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (801, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (801, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (801, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (801, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (801, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (802, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (802, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (803, 18, 179, 3);
INSERT INTO detalles_pedidos
  VALUES (803, 38, 161.02, 5);
INSERT INTO detalles_pedidos
  VALUES (804, 5, 7.45, 3);
INSERT INTO detalles_pedidos
  VALUES (804, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (804, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (804, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (804, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (805, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (805, 14, 139.95, 3);
INSERT INTO detalles_pedidos
  VALUES (805, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (806, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (806, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (806, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (806, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (806, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (807, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (807, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (807, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (807, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (808, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (808, 22, 82, 4);
INSERT INTO detalles_pedidos
  VALUES (808, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (809, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (809, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (809, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (809, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (809, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (810, 15, 4.99, 3);
INSERT INTO detalles_pedidos
  VALUES (810, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (810, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (811, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (811, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (812, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (812, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (812, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (812, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (813, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (813, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (813, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (813, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (813, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (813, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (813, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (813, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (814, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (815, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (815, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (815, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (815, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (815, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (815, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (815, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (817, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (817, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (817, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (817, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (817, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (818, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (818, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (818, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (818, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (819, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (819, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (819, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (819, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (819, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (819, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (819, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (820, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (821, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (821, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (822, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (822, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (822, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (822, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (822, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (823, 29, 34, 2);
INSERT INTO detalles_pedidos
  VALUES (824, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (824, 22, 79.54, 5);
INSERT INTO detalles_pedidos
  VALUES (825, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (825, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (825, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (826, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (826, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (826, 13, 65.47, 6);
INSERT INTO detalles_pedidos
  VALUES (826, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (826, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (826, 31, 21.34, 6);
INSERT INTO detalles_pedidos
  VALUES (827, 5, 7.45, 2);
INSERT INTO detalles_pedidos
  VALUES (827, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (827, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (827, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (827, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (828, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (828, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (828, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (828, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (828, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (828, 40, 180, 2);
INSERT INTO detalles_pedidos
  VALUES (829, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (829, 7, 47.53, 5);
INSERT INTO detalles_pedidos
  VALUES (829, 13, 67.5, 3);
INSERT INTO detalles_pedidos
  VALUES (829, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (829, 32, 32, 4);
INSERT INTO detalles_pedidos
  VALUES (829, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (830, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (830, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (831, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (831, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (831, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (832, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (833, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (833, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (833, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (833, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (833, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (834, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (834, 12, 23.5, 3);
INSERT INTO detalles_pedidos
  VALUES (834, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (834, 22, 82, 3);
INSERT INTO detalles_pedidos
  VALUES (834, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (834, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (834, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (835, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (835, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (835, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (836, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (836, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (836, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (836, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (837, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (837, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (837, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (837, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (838, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (838, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (838, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (838, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (838, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (838, 33, 19, 1);
INSERT INTO detalles_pedidos
  VALUES (838, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (839, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (839, 9, 33, 2);
INSERT INTO detalles_pedidos
  VALUES (839, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (839, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (839, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (840, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (840, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (840, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (841, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (841, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (841, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (841, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (841, 22, 82, 4);
INSERT INTO detalles_pedidos
  VALUES (841, 27, 24, 3);
INSERT INTO detalles_pedidos
  VALUES (841, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (841, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (842, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (842, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (843, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (843, 24, 69, 3);
INSERT INTO detalles_pedidos
  VALUES (844, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (844, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (844, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (844, 34, 27, 4);
INSERT INTO detalles_pedidos
  VALUES (845, 18, 179, 4);
INSERT INTO detalles_pedidos
  VALUES (846, 5, 7.23, 6);
INSERT INTO detalles_pedidos
  VALUES (846, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (846, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (846, 29, 34, 4);
INSERT INTO detalles_pedidos
  VALUES (846, 37, 189, 4);
INSERT INTO detalles_pedidos
  VALUES (847, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (847, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (847, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (847, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (847, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (847, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (847, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (848, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (848, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (848, 17, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (848, 29, 34, 4);
INSERT INTO detalles_pedidos
  VALUES (848, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (849, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (849, 27, 23.28, 6);
INSERT INTO detalles_pedidos
  VALUES (850, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (850, 21, 53.35, 5);
INSERT INTO detalles_pedidos
  VALUES (850, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (850, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (851, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (851, 14, 139.95, 3);
INSERT INTO detalles_pedidos
  VALUES (851, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (851, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (851, 29, 32.98, 5);
INSERT INTO detalles_pedidos
  VALUES (851, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (851, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (852, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (852, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (852, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (852, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (852, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (852, 26, 125, 3);
INSERT INTO detalles_pedidos
  VALUES (852, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (853, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (853, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (853, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (853, 16, 28, 3);
INSERT INTO detalles_pedidos
  VALUES (853, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (853, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (853, 36, 160.05, 5);
INSERT INTO detalles_pedidos
  VALUES (854, 2, 1746, 5);
INSERT INTO detalles_pedidos
  VALUES (855, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (856, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (856, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (856, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (856, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (856, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (856, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (857, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (858, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (858, 19, 47, 2);
INSERT INTO detalles_pedidos
  VALUES (858, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (858, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (859, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (859, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (859, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (860, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (860, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (860, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (860, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (860, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (861, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (861, 12, 23.5, 4);
INSERT INTO detalles_pedidos
  VALUES (861, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (861, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (861, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (861, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (861, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (862, 2, 1746, 6);
INSERT INTO detalles_pedidos
  VALUES (862, 12, 22.8, 5);
INSERT INTO detalles_pedidos
  VALUES (862, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (862, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (863, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (864, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (864, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (864, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (864, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (864, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (864, 26, 125, 4);
INSERT INTO detalles_pedidos
  VALUES (864, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (864, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (865, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (865, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (865, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (865, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (865, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (865, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (865, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (865, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (866, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (867, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (867, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (867, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (867, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (867, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (868, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (868, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (868, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (868, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (869, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (869, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (870, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (870, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (870, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (870, 27, 24, 4);
INSERT INTO detalles_pedidos
  VALUES (870, 35, 37.83, 6);
INSERT INTO detalles_pedidos
  VALUES (871, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (871, 15, 4.99, 4);
INSERT INTO detalles_pedidos
  VALUES (871, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (871, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (872, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (872, 6, 635, 3);
INSERT INTO detalles_pedidos
  VALUES (872, 11, 1600.5, 5);
INSERT INTO detalles_pedidos
  VALUES (872, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (872, 21, 55, 4);
INSERT INTO detalles_pedidos
  VALUES (872, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (872, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (872, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (873, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (873, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (873, 24, 69, 2);
INSERT INTO detalles_pedidos
  VALUES (873, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (874, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (874, 18, 173.63, 6);
INSERT INTO detalles_pedidos
  VALUES (874, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (874, 38, 166, 3);
INSERT INTO detalles_pedidos
  VALUES (875, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (875, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (876, 12, 23.5, 1);
INSERT INTO detalles_pedidos
  VALUES (876, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (876, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (877, 24, 69, 2);
INSERT INTO detalles_pedidos
  VALUES (878, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (878, 14, 139.95, 3);
INSERT INTO detalles_pedidos
  VALUES (878, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (879, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (879, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (879, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (879, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (880, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (880, 33, 19, 4);
INSERT INTO detalles_pedidos
  VALUES (881, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (881, 14, 139.95, 3);
INSERT INTO detalles_pedidos
  VALUES (881, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (881, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (881, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (881, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (881, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (882, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (882, 15, 4.84, 5);
INSERT INTO detalles_pedidos
  VALUES (882, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (882, 39, 175, 3);
INSERT INTO detalles_pedidos
  VALUES (883, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (883, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (883, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (883, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (883, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (883, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (884, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (885, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (885, 33, 19, 2);
INSERT INTO detalles_pedidos
  VALUES (886, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (886, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (886, 19, 47, 3);
INSERT INTO detalles_pedidos
  VALUES (886, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (886, 29, 32.98, 6);
INSERT INTO detalles_pedidos
  VALUES (886, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (886, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (887, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (887, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (887, 26, 125, 1);
INSERT INTO detalles_pedidos
  VALUES (887, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (887, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (888, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (888, 12, 23.5, 2);
INSERT INTO detalles_pedidos
  VALUES (888, 20, 15, 2);
INSERT INTO detalles_pedidos
  VALUES (888, 28, 28.13, 6);
INSERT INTO detalles_pedidos
  VALUES (888, 36, 165, 3);
INSERT INTO detalles_pedidos
  VALUES (889, 29, 34, 4);
INSERT INTO detalles_pedidos
  VALUES (890, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (891, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (891, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (891, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (891, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (891, 21, 55, 3);
INSERT INTO detalles_pedidos
  VALUES (891, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (891, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (891, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (892, 35, 39, 4);
INSERT INTO detalles_pedidos
  VALUES (893, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (893, 22, 82, 4);
INSERT INTO detalles_pedidos
  VALUES (893, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (894, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (894, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (895, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (895, 6, 615.95, 6);
INSERT INTO detalles_pedidos
  VALUES (895, 11, 1600.5, 6);
INSERT INTO detalles_pedidos
  VALUES (895, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (895, 33, 19, 3);
INSERT INTO detalles_pedidos
  VALUES (895, 38, 166, 1);
INSERT INTO detalles_pedidos
  VALUES (896, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (896, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (896, 17, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (896, 29, 34, 1);
INSERT INTO detalles_pedidos
  VALUES (896, 37, 189, 3);
INSERT INTO detalles_pedidos
  VALUES (897, 10, 36, 1);
INSERT INTO detalles_pedidos
  VALUES (897, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (897, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (897, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (897, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (897, 40, 174.6, 6);
INSERT INTO detalles_pedidos
  VALUES (898, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (899, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (899, 14, 139.95, 4);
INSERT INTO detalles_pedidos
  VALUES (899, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (899, 24, 69, 4);
INSERT INTO detalles_pedidos
  VALUES (899, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (899, 34, 26.19, 5);
INSERT INTO detalles_pedidos
  VALUES (899, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (900, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (900, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (900, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (900, 31, 21.34, 5);
INSERT INTO detalles_pedidos
  VALUES (901, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (901, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (901, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (901, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (902, 2, 1800, 4);
INSERT INTO detalles_pedidos
  VALUES (902, 22, 79.54, 5);
INSERT INTO detalles_pedidos
  VALUES (903, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (903, 9, 32.01, 6);
INSERT INTO detalles_pedidos
  VALUES (903, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (903, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (903, 40, 180, 3);
INSERT INTO detalles_pedidos
  VALUES (904, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (904, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (904, 17, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (904, 30, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (904, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (905, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (905, 10, 36, 4);
INSERT INTO detalles_pedidos
  VALUES (905, 15, 4.99, 4);
INSERT INTO detalles_pedidos
  VALUES (905, 20, 14.55, 6);
INSERT INTO detalles_pedidos
  VALUES (905, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (905, 30, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (905, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (905, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (906, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (906, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (906, 13, 67.5, 4);
INSERT INTO detalles_pedidos
  VALUES (906, 19, 47, 4);
INSERT INTO detalles_pedidos
  VALUES (906, 25, 139, 1);
INSERT INTO detalles_pedidos
  VALUES (906, 39, 175, 2);
INSERT INTO detalles_pedidos
  VALUES (907, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (907, 22, 79.54, 6);
INSERT INTO detalles_pedidos
  VALUES (907, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (908, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (908, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (908, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (909, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (909, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (909, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (909, 33, 18.43, 5);
INSERT INTO detalles_pedidos
  VALUES (910, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (910, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (910, 11, 1650, 3);
INSERT INTO detalles_pedidos
  VALUES (910, 16, 27.16, 5);
INSERT INTO detalles_pedidos
  VALUES (910, 21, 53.35, 6);
INSERT INTO detalles_pedidos
  VALUES (910, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (910, 31, 22, 2);
INSERT INTO detalles_pedidos
  VALUES (910, 36, 165, 2);
INSERT INTO detalles_pedidos
  VALUES (911, 14, 135.75, 5);
INSERT INTO detalles_pedidos
  VALUES (911, 34, 27, 1);
INSERT INTO detalles_pedidos
  VALUES (912, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (912, 7, 49, 4);
INSERT INTO detalles_pedidos
  VALUES (912, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (912, 28, 29, 4);
INSERT INTO detalles_pedidos
  VALUES (912, 34, 27, 3);
INSERT INTO detalles_pedidos
  VALUES (912, 40, 180, 4);
INSERT INTO detalles_pedidos
  VALUES (913, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (913, 28, 28.13, 5);
INSERT INTO detalles_pedidos
  VALUES (914, 21, 55, 1);
INSERT INTO detalles_pedidos
  VALUES (915, 16, 28, 1);
INSERT INTO detalles_pedidos
  VALUES (916, 7, 49, 1);
INSERT INTO detalles_pedidos
  VALUES (916, 13, 65.47, 5);
INSERT INTO detalles_pedidos
  VALUES (916, 19, 45.59, 5);
INSERT INTO detalles_pedidos
  VALUES (916, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (916, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (916, 37, 189, 2);
INSERT INTO detalles_pedidos
  VALUES (917, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (917, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (917, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (917, 25, 134.83, 5);
INSERT INTO detalles_pedidos
  VALUES (917, 35, 39, 1);
INSERT INTO detalles_pedidos
  VALUES (918, 36, 165, 4);
INSERT INTO detalles_pedidos
  VALUES (919, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (919, 6, 615.95, 5);
INSERT INTO detalles_pedidos
  VALUES (919, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (919, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (919, 27, 23.28, 5);
INSERT INTO detalles_pedidos
  VALUES (919, 32, 31.04, 6);
INSERT INTO detalles_pedidos
  VALUES (919, 37, 183.33, 6);
INSERT INTO detalles_pedidos
  VALUES (920, 5, 7.23, 5);
INSERT INTO detalles_pedidos
  VALUES (921, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (921, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (921, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (921, 31, 22, 1);
INSERT INTO detalles_pedidos
  VALUES (922, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (922, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (922, 17, 45, 3);
INSERT INTO detalles_pedidos
  VALUES (922, 25, 139, 2);
INSERT INTO detalles_pedidos
  VALUES (922, 33, 18.43, 6);
INSERT INTO detalles_pedidos
  VALUES (923, 5, 7.45, 2);
INSERT INTO detalles_pedidos
  VALUES (923, 10, 34.92, 6);
INSERT INTO detalles_pedidos
  VALUES (923, 15, 4.99, 2);
INSERT INTO detalles_pedidos
  VALUES (923, 20, 15, 4);
INSERT INTO detalles_pedidos
  VALUES (923, 25, 139, 4);
INSERT INTO detalles_pedidos
  VALUES (923, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (923, 35, 39, 3);
INSERT INTO detalles_pedidos
  VALUES (924, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (924, 39, 175, 1);
INSERT INTO detalles_pedidos
  VALUES (925, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (925, 12, 22.8, 6);
INSERT INTO detalles_pedidos
  VALUES (925, 18, 179, 4);
INSERT INTO detalles_pedidos
  VALUES (925, 24, 66.93, 6);
INSERT INTO detalles_pedidos
  VALUES (925, 30, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (925, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (926, 1, 1200, 4);
INSERT INTO detalles_pedidos
  VALUES (926, 6, 635, 4);
INSERT INTO detalles_pedidos
  VALUES (926, 20, 15, 2);
INSERT INTO detalles_pedidos
  VALUES (926, 25, 134.83, 6);
INSERT INTO detalles_pedidos
  VALUES (926, 30, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (926, 35, 37.83, 5);
INSERT INTO detalles_pedidos
  VALUES (926, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (927, 8, 50, 1);
INSERT INTO detalles_pedidos
  VALUES (927, 16, 27.16, 6);
INSERT INTO detalles_pedidos
  VALUES (927, 24, 66.93, 5);
INSERT INTO detalles_pedidos
  VALUES (927, 32, 32, 1);
INSERT INTO detalles_pedidos
  VALUES (927, 40, 174.6, 5);
INSERT INTO detalles_pedidos
  VALUES (928, 7, 47.53, 6);
INSERT INTO detalles_pedidos
  VALUES (928, 17, 43.65, 5);
INSERT INTO detalles_pedidos
  VALUES (928, 27, 24, 1);
INSERT INTO detalles_pedidos
  VALUES (928, 37, 183.33, 5);
INSERT INTO detalles_pedidos
  VALUES (929, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (929, 14, 139.95, 1);
INSERT INTO detalles_pedidos
  VALUES (929, 36, 160.05, 6);
INSERT INTO detalles_pedidos
  VALUES (930, 20, 15, 1);
INSERT INTO detalles_pedidos
  VALUES (931, 20, 15, 3);
INSERT INTO detalles_pedidos
  VALUES (931, 40, 180, 1);
INSERT INTO detalles_pedidos
  VALUES (932, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (932, 17, 45, 2);
INSERT INTO detalles_pedidos
  VALUES (932, 30, 45, 4);
INSERT INTO detalles_pedidos
  VALUES (933, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (933, 27, 24, 2);
INSERT INTO detalles_pedidos
  VALUES (934, 7, 49, 2);
INSERT INTO detalles_pedidos
  VALUES (934, 15, 4.84, 6);
INSERT INTO detalles_pedidos
  VALUES (934, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (934, 39, 175, 4);
INSERT INTO detalles_pedidos
  VALUES (935, 1, 1200, 3);
INSERT INTO detalles_pedidos
  VALUES (935, 11, 1650, 1);
INSERT INTO detalles_pedidos
  VALUES (935, 22, 82, 2);
INSERT INTO detalles_pedidos
  VALUES (935, 32, 32, 3);
INSERT INTO detalles_pedidos
  VALUES (936, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (936, 9, 33, 4);
INSERT INTO detalles_pedidos
  VALUES (936, 20, 15, 1);
INSERT INTO detalles_pedidos
  VALUES (936, 28, 29, 2);
INSERT INTO detalles_pedidos
  VALUES (936, 36, 165, 1);
INSERT INTO detalles_pedidos
  VALUES (937, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (937, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (937, 13, 67.5, 1);
INSERT INTO detalles_pedidos
  VALUES (937, 19, 47, 1);
INSERT INTO detalles_pedidos
  VALUES (937, 31, 22, 3);
INSERT INTO detalles_pedidos
  VALUES (937, 37, 189, 1);
INSERT INTO detalles_pedidos
  VALUES (938, 1, 1164, 5);
INSERT INTO detalles_pedidos
  VALUES (938, 7, 49, 3);
INSERT INTO detalles_pedidos
  VALUES (938, 13, 67.5, 2);
INSERT INTO detalles_pedidos
  VALUES (938, 19, 45.59, 6);
INSERT INTO detalles_pedidos
  VALUES (938, 31, 22, 4);
INSERT INTO detalles_pedidos
  VALUES (939, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (939, 14, 139.95, 2);
INSERT INTO detalles_pedidos
  VALUES (939, 22, 79.54, 5);
INSERT INTO detalles_pedidos
  VALUES (939, 30, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (939, 38, 166, 2);
INSERT INTO detalles_pedidos
  VALUES (940, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (940, 6, 635, 2);
INSERT INTO detalles_pedidos
  VALUES (940, 11, 1650, 4);
INSERT INTO detalles_pedidos
  VALUES (940, 16, 28, 4);
INSERT INTO detalles_pedidos
  VALUES (940, 21, 55, 2);
INSERT INTO detalles_pedidos
  VALUES (940, 26, 121.25, 5);
INSERT INTO detalles_pedidos
  VALUES (940, 34, 26.19, 6);
INSERT INTO detalles_pedidos
  VALUES (940, 39, 169.75, 6);
INSERT INTO detalles_pedidos
  VALUES (941, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (941, 6, 635, 1);
INSERT INTO detalles_pedidos
  VALUES (941, 11, 1650, 2);
INSERT INTO detalles_pedidos
  VALUES (941, 16, 28, 2);
INSERT INTO detalles_pedidos
  VALUES (941, 29, 34, 3);
INSERT INTO detalles_pedidos
  VALUES (941, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (941, 39, 169.75, 5);
INSERT INTO detalles_pedidos
  VALUES (942, 1, 1200, 2);
INSERT INTO detalles_pedidos
  VALUES (942, 14, 135.75, 6);
INSERT INTO detalles_pedidos
  VALUES (942, 38, 166, 4);
INSERT INTO detalles_pedidos
  VALUES (943, 1, 1200, 1);
INSERT INTO detalles_pedidos
  VALUES (943, 9, 33, 1);
INSERT INTO detalles_pedidos
  VALUES (943, 17, 45, 1);
INSERT INTO detalles_pedidos
  VALUES (943, 26, 121.25, 6);
INSERT INTO detalles_pedidos
  VALUES (943, 34, 27, 2);
INSERT INTO detalles_pedidos
  VALUES (944, 1, 1164, 6);
INSERT INTO detalles_pedidos
  VALUES (944, 9, 33, 3);
INSERT INTO detalles_pedidos
  VALUES (944, 17, 43.65, 6);
INSERT INTO detalles_pedidos
  VALUES (944, 32, 32, 2);
INSERT INTO detalles_pedidos
  VALUES (944, 40, 180, 2);

-- Inserción en PEDIDOS_HISTORICO


-- Inserción en DETALLES_PEDIDOS_HISTORICO


-- Inserción en PROVEEDORES

insert into proveedores
  VALUES (1, 'Shinoman, Incorporated', 'Calle Sur 34', 
   'Belmonte', 'MADRID', '28001', '(91) 888-1234', '(91) 888-1235', 
   'http://www.shinoman.com/', 'Sales@Shiniman.com');
insert into proveedores
  VALUES (2, 'Viscount', 'Calle Comercio 19', 'Santa Amalia', 
   'MALAGA', '29127', '(95) 777-1234', '(95) 777-1235', 
   'http://www.viscountbikes.com/', 'pedidos@ViscountBikes.com');
insert into proveedores
  VALUES (3, 'Nikoma of America', 'Carretera del Norte 88', 
   'Batres', 'MADRID', '28324', '(91) 666-1234', '(91) 666-1235', 
   'http://www.nikomabikes.com/', 'BuyBikes@NikomaBikes.com');
insert into proveedores
  VALUES (4, 'ProFormance', 'Calle San Cirilo 29', 'Ademuz', 
   'VALENCIA', '46012', '(96) 444-1234', '(96) 444-1235', 
   'http://www.ProFormBikes.com/', 'Sales@ProFormBikes.com');
insert into proveedores
  VALUES (5, 'Kona, Incorporated', 'Apartado de correos 28429', 
   'Robledo', 'MADRID', '28052', '(91) 333-1234', '(91) 333-1235', 
   'http://www.konabikes.com/', 'Sales@KonaBikes.com');
insert into proveedores
  VALUES (6, 'Big Sky Mountain Bikes', 'Carretera del Sol 20', 
   'Albatana', 'ALBACETE', '02653', '(967) 222-1234', '(967) 222-1235', 
   NULL, NULL);
insert into proveedores
  VALUES (7, 'Dog Ear', 'Avda. Mar Salada 57', 'Navalon', 
   'VALENCIA', '46003', '(96) 888-9876', '(96) 888-9877', 
   NULL, NULL);
insert into proveedores
  VALUES (8, 'Sun Sports Suppliers', 'Apartado 10082', 
   'Saucedilla', 'CACERES', '10003', '(927) 777-9876', 
   '(310) 777-9877', NULL, NULL);
insert into proveedores
  VALUES (9, 'Lone Star Bike Supply', 'Calle del rey 74', 
   'Escalonilla', 'TOLEDO', '45915', '(925) 666-9876', '(925) 666-9877', 
   NULL, NULL);
insert into proveedores
  VALUES (10, 'Armadillo Brand', 'Calle de al lado 123', 
   'Dosbarrios', 'TOLEDO', '45137', '(925) 444-9876', '(925) 444-9877', 
   'http://www.DilloBikes.com/', 'Bikeproductos@DilloBikes.com');
insert into proveedores
  VALUES (11, 'Astro Paper productos', 'Avda. del Rio 56', 
   'Castroviejo', 'LA RIOJA', '26637', '(941) 555-9876', '(941) 555-9875', 
   NULL, NULL);

-- Inserción en PRODUCTOS_PROVEEDORES

insert into productos_proveedores
  VALUES (1, 4, 804, 6);
insert into productos_proveedores
  VALUES (1, 9, 854.22, 7);
insert into productos_proveedores
  VALUES (2, 6, 1269, 9);
insert into productos_proveedores
  VALUES (2, 9, 1477.81, 7);
insert into productos_proveedores
  VALUES (3, 7, 54.19, 10);
insert into productos_proveedores
  VALUES (3, 9, 57.27, 6);
insert into productos_proveedores
  VALUES (4, 6, 44.22, 10);
insert into productos_proveedores
  VALUES (4, 9, 41.62, 14);
insert into productos_proveedores
  VALUES (5, 7, 5.38, 10);
insert into productos_proveedores
  VALUES (5, 9, 5.87, 9);
insert into productos_proveedores
  VALUES (6, 2, 403.22, 3);
insert into productos_proveedores
  VALUES (6, 9, 448.73, 7);
insert into productos_proveedores
  VALUES (7, 2, 31.12, 3);
insert into productos_proveedores
  VALUES (8, 8, 39.32, 10);
insert into productos_proveedores
  VALUES (8, 9, 37.88, 14);
insert into productos_proveedores
  VALUES (9, 3, 21.53, 4);
insert into productos_proveedores
  VALUES (10, 2, 22.86, 3);
insert into productos_proveedores
  VALUES (11, 3, 1076.62, 4);
insert into productos_proveedores
  VALUES (11, 9, 1178.65, 7);
insert into productos_proveedores
  VALUES (12, 1, 14.51, 2);
insert into productos_proveedores
  VALUES (12, 6, 15.44, 10);
insert into productos_proveedores
  VALUES (12, 9, 15.02, 14);
insert into productos_proveedores
  VALUES (13, 1, 41.68, 2);
insert into productos_proveedores
  VALUES (13, 6, 43.99, 10);
insert into productos_proveedores
  VALUES (13, 9, 43.77, 14);
insert into productos_proveedores
  VALUES (14, 6, 98.66, 9);
insert into productos_proveedores
  VALUES (14, 9, 101.22, 14);
insert into productos_proveedores
  VALUES (15, 4, 3.34, 6);
insert into productos_proveedores
  VALUES (15, 6, 3.79, 10);
insert into productos_proveedores
  VALUES (15, 9, 3.88, 14);
insert into productos_proveedores
  VALUES (16, 4, 18.76, 6);
insert into productos_proveedores
  VALUES (16, 6, 19.33, 10);
insert into productos_proveedores
  VALUES (16, 9, 19.33, 14);
insert into productos_proveedores
  VALUES (17, 1, 27.79, 2);
insert into productos_proveedores
  VALUES (17, 6, 28.55, 10);
insert into productos_proveedores
  VALUES (17, 9, 28.55, 14);
insert into productos_proveedores
  VALUES (18, 2, 113.66, 3);
insert into productos_proveedores
  VALUES (19, 2, 29.84, 3);
insert into productos_proveedores
  VALUES (20, 7, 10.84, 10);
insert into productos_proveedores
  VALUES (20, 9, 11.54, 6);
insert into productos_proveedores
  VALUES (21, 7, 39.74, 10);
insert into productos_proveedores
  VALUES (21, 9, 41.5, 9);
insert into productos_proveedores
  VALUES (22, 10, 63.55, 15);
insert into productos_proveedores
  VALUES (23, 6, 69.54, 15);
insert into productos_proveedores
  VALUES (23, 9, 64.39, 14);
insert into productos_proveedores
  VALUES (24, 6, 55.91, 15);
insert into productos_proveedores
  VALUES (24, 7, 53.88, 10);
insert into productos_proveedores
  VALUES (24, 9, 52.27, 14);
insert into productos_proveedores
  VALUES (25, 9, 105.29, 14);
insert into productos_proveedores
  VALUES (25, 10, 101.58, 15);
insert into productos_proveedores
  VALUES (26, 3, 81.56, 4);
insert into productos_proveedores
  VALUES (26, 6, 79.88, 15);
insert into productos_proveedores
  VALUES (27, 3, 15.66, 4);
insert into productos_proveedores
  VALUES (27, 6, 16.88, 10);
insert into productos_proveedores
  VALUES (27, 9, 15.88, 14);
insert into productos_proveedores
  VALUES (28, 3, 18.92, 4);
insert into productos_proveedores
  VALUES (28, 6, 20.56, 10);
insert into productos_proveedores
  VALUES (28, 9, 19.04, 14);
insert into productos_proveedores
  VALUES (29, 5, 23.38, 8);
insert into productos_proveedores
  VALUES (29, 6, 24.44, 10);
insert into productos_proveedores
  VALUES (29, 9, 23.99, 14);
insert into productos_proveedores
  VALUES (30, 8, 33.3, 12);
insert into productos_proveedores
  VALUES (30, 9, 35.32, 8);
insert into productos_proveedores
  VALUES (30, 10, 32.87, 15);
insert into productos_proveedores
  VALUES (31, 7, 15.85, 15);
insert into productos_proveedores
  VALUES (31, 8, 16.28, 12);
insert into productos_proveedores
  VALUES (31, 9, 16.93, 7);
insert into productos_proveedores
  VALUES (31, 10, 16.9, 9);
insert into productos_proveedores
  VALUES (32, 6, 24.77, 15);
insert into productos_proveedores
  VALUES (32, 7, 24.12, 10);
insert into productos_proveedores
  VALUES (32, 8, 23.68, 12);
insert into productos_proveedores
  VALUES (33, 6, 15.23, 15);
insert into productos_proveedores
  VALUES (33, 8, 14.06, 12);
insert into productos_proveedores
  VALUES (34, 6, 19.04, 9);
insert into productos_proveedores
  VALUES (34, 9, 23.86, 3);
insert into productos_proveedores
  VALUES (34, 10, 19.32, 10);
insert into productos_proveedores
  VALUES (35, 6, 27.49, 9);
insert into productos_proveedores
  VALUES (35, 9, 28.22, 6);
insert into productos_proveedores
  VALUES (36, 6, 122.88, 10);
insert into productos_proveedores
  VALUES (36, 7, 119.21, 10);
insert into productos_proveedores
  VALUES (36, 9, 122.78, 14);
insert into productos_proveedores
  VALUES (37, 2, 120.02, 3);
insert into productos_proveedores
  VALUES (37, 6, 125.99, 10);
insert into productos_proveedores
  VALUES (37, 9, 124.89, 14);
insert into productos_proveedores
  VALUES (38, 9, 136.98, 6);
insert into productos_proveedores
  VALUES (38, 10, 128.65, 15);
insert into productos_proveedores
  VALUES (39, 6, 137.55, 7);
insert into productos_proveedores
  VALUES (39, 7, 126.44, 10);
insert into productos_proveedores
  VALUES (40, 6, 154.87, 10);
insert into productos_proveedores
  VALUES (40, 9, 136.35, 14);

commit;

