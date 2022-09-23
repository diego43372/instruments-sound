/* --------------------------------------------------------------------------------------- */
/* ------------------------------------ CONSULTAS--- ------------------------------------- */
/* --------------------------------------------------------------------------------------- */


-- --------------------------------------------------------------------------------------- --
-- CREAR TABLA
-- --------------------------------------------------------------------------------------- --
drop table if exists productos;

create table productos(
codigo_producto integer auto_increment,
cantidad integer,
nombre_producto varchar (60),
precio_producto float ,
stock integer,
referencia varchar (100),
primary key (codigo)

);
-- --------------------------------------------------------------------------------------- --
-- INSERTAR DATOS EN LA TABLA
-- --------------------------------------------------------------------------------------- --

INSERT INTO productos(codigo_producto,cantidad, nombre_producto, precio_producto, stock, referencia) VALUES (1,12, 'guitarra_electrica', 3000.00,12, 'ge02');
INSERT INTO productos(codigo_producto,cantidad, nombre_producto, precio_producto, stock, referencia) VALUES (2,5, 'bateria', 5000.00,5, 'ba01');
INSERT INTO productos(codigo_producto,cantidad, nombre_producto, precio_producto, stock, referencia) VALUES (3,2, 'piano', 1200000.00,2, 'pi04');


-- --------------------------------------------------------------------------------------- --
-- ELIMINAR  TABLA
-- --------------------------------------------------------------------------------------- --

delete from productos;

delete from productos where nombre_producto='guitarra_electrica';

delete from productos where referencia='ba01';

-- --------------------------------------------------------------------------------------- --
-- ACTUALIZAR TABLA
-- --------------------------------------------------------------------------------------- --
select * from productos;

update productos set stock=0;

select * from productos;

select nombre_producto,precio_producto from productos;

update productos set nombre_producto='guitarra_eletrica'
  where nombre_producto='guitarra_bajo';

select nombre_producto,precio_producto from productos;
-- --------------------------------------------------------------------------------------- --
-- CONSULTAR TABLA
-- --------------------------------------------------------------------------------------- --

SELECT cantidad, precio_producto from productos;

SELECT * from productos;

-- --------------------------------------------------------------------------------------- --
-- MULTI TABLA
-- --------------------------------------------------------------------------------------- --
drop table if exists productos, pedidos;

create table productos(
codigo_producto integer auto_increment,
cantidad integer,
nombre_producto varchar (60),
precio_producto float ,
stock integer,
referencia varchar (100),
primary key (codigo_producto)

);


create table pedidos(
codigo_pedido integer auto_increment,
nombre varchar(20),
direccion varchar(30),
primary key(codigo_pedido)
 );

INSERT INTO productos(codigo_producto,cantidad, nombre_producto, precio_producto, stock, referencia) VALUES (1,12, 'guitarra_electrica', 3000.00,12, 'ge02');
INSERT INTO productos(codigo_producto,cantidad, nombre_producto, precio_producto, stock, referencia) VALUES (2,5, 'bateria', 5000.00,5, 'ba01');
INSERT INTO productos(codigo_producto,cantidad, nombre_producto, precio_producto, stock, referencia) VALUES (3,2, 'piano', 1200000.00,2, 'pi04');

insert into pedidos (codigo_pedido,nombre,direccion) values(1,'juan','soacha14');
insert into pedidos (codigo_pedido,nombre,direccion) values(2,'nicolas','pereira22');
insert into pedidos (codigo_pedido,nombre,direccion) values(3,'maria','kilometro 58'); 
insert into pedidos (codigo_pedido,nombre,direccion) values(4,'diego','bogota5');



select * from productos;

select * from pedidos;

select * from productos
  join pedidos
  on productos.codigo_pedido=pedidos.codigo_producto;

