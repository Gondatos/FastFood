--########## LLENANDO LOS DATOS DE FAST FOOD ##########--

USE Fast_Food

-- TABLA 1 CATEGORIA
--SELECCION PARA VER COMO CARGAR LOS DATOS
SELECT * FROM Categoria
GO

INSERT INTO Categoria(Categoria) VALUES --LOS NUMEROS REPRESENTAN EL ID
	('Comida Rapida'),--1
	('Postres'),--2
	('Bebidas'),--3
	('Ensaladas'),--4
	('Desayuno'),--5
	('Cafeteria'),--6
	('Helados'),--7
	('Comida Vegana'),--8
	('Carnes'),--9
	('Pizzas');--10

SELECT * FROM Categoria

-- TABLA 2 PRODUCTOS					
--SELECCION PARA VER COMO CARGAR LOS DATOS
SELECT * FROM Productos
	('Hamburguesa Deluxe', 9.99), 
	('Cheeseburger', 7.99), 
	('Pizza Margarita', 11.99), 
	('Pizza Pepperoni', 12.99), 
	('Helado de Chocolate', 2.99), 
	('Helado de Vainilla', 2.99), 
	('Ensalada César', 5.99), 
	('Ensalada Griega', 6.99), 
	('Pastel de Zanahoria', 3.99), 
	('Brownie', 2.99);

UPDATE Productos SET Categoria_ID = 1 WHERE Productos = 'Hamburguesa Deluxe';
UPDATE Productos SET Categoria_ID = 1 WHERE Productos = 'Cheeseburger';
UPDATE Productos SET Categoria_ID = 10 WHERE Productos = 'Pizza Margarita';
UPDATE Productos SET Categoria_ID = 10 WHERE Productos = 'Pizza Pepperoni';
UPDATE Productos SET Categoria_ID = 7 WHERE Productos = 'Helado de Chocolate';
UPDATE Productos SET Categoria_ID = 7 WHERE Productos = 'Helado de Vainilla';
UPDATE Productos SET Categoria_ID = 4 WHERE Productos = 'Ensalada César';
UPDATE Productos SET Categoria_ID = 4 WHERE Productos = 'Ensalada Griega';
UPDATE Productos SET Categoria_ID = 2 WHERE Productos = 'Pastel de Zanahoria';
UPDATE Productos SET Categoria_ID = 2 WHERE Productos = 'Brownie';

SELECT * FROM Productos

-- TABLA DE DEPARTAMENTOS					
SELECT * FROM Departamentos

INSERT INTO Departamentos(Departamento) VALUES
	('Administracion'), --1
	('Ventas'), --2
	('Cocina'), --3
	('Cafeteria'), --4
	('Logistica'), --5
	('Servicio'), --6
	('Restaurante'), --7
	('Mantenimiento'); --8

SELECT * FROM Departamentos

-- TABLA DE ROL					
SELECT * FROM Rol

INSERT INTO Rol(Rol) VALUES
	('Vendedor'), --1
	('Mensajero'); --2

-- TABLA  SUCURSAL	
SELECT * FROM Sucursales

-- LAS COLUMNAS QUE CREEE NO CORESPONDEN A LOS DATOS PROSEDO A MODIFICAR LA TABLA PARA CARGAR DATOS
ALTER TABLE Sucursales
ADD Nombre VARCHAR (100),
	Direccion VARCHAR (200);

-- MEDIANTE LOS ERRORES PUEDO QUITAR LA DEPENDANCIA FOREING
ALTER TABLE Sucursales
DROP CONSTRAINT FK__Sucursale__Produ__22751F6C;

ALTER TABLE Sucursales
DROP CONSTRAINT FK__Sucursale__Categ__236943A5;

-- SIN DEPENDENCIA SE PUEDEN QUIETAR LAS COLUMNAS SIN DATOS ESPECIFICOS
ALTER TABLE Sucursales
DROP COLUMN Producto_ID, Categoria_ID;

INSERT INTO Sucursales(Nombre, Direccion) VALUES
	('Sucursal Central', '1234 Main St'),
	('Sucursal Norte', '5678 North St'),
	('Sucursal Este', '9101 East St'),
	('Sucursal Oeste', '1121 West St'),
	('Sucursal Sur', '3141 South St'),
	('Sucursal Playa', '1516 Beach St'),
	('Sucursal Montaña', '1718 Mountain St'),
	('Sucursal Valle', '1920 Valley St'),
	('Sucursal Lago', '2122 Lake St'),
	('Sucursal Bosque', '2324 Forest St');

-- TABLA  EMPLEADOS					
SELECT * FROM Empleados

-- MODIFICAMOS LA TABLA PARA CARGAR LOS DATOS CORRECTOS
--ELIMINAMOS LA DEPENDANCIA
ALTER TABLE Empleados
DROP CONSTRAINT UQ__Empleado__C035B8DD0668B1C8

--SACAMOS LA COLUMNA DNI
ALTER TABLE Empleados
DROP COLUMN DNI

-- VOY A BREAR UNA TABLA PRIMERO PARA GARANTIZAR LA NO DUPLICIDAD FUTURA DE LOS DATOS
CREATE TABLE Posiciones (
	Posicion_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Posicion VARCHAR (100) NOT NULL
);

-- CARGAMOS LOS DATOS DE LAS POSICIONES CORRESPONDIENTES
SELECT * FROM Posiciones

INSERT INTO Posiciones(Posicion) VALUES
	('Gerente'), --1
	('Subgerente'), --2
	('Cajero'), --3
	('Cocinero'), --4
	('Barista'), --5
	('Repartidor'), --6 
	('Atención al Cliente'), --7
	('Encargado de Turno'), --8
	('Mesero'), --9
	('Auxiliar de Limpieza'); --10

-- SUMAMOS LA COLUMNA EN LA TABLA DE EMPLEADOS DE POSICIONES 
ALTER TABLE Empleados
ADD Posicion_ID INT FOREIGN KEY (Posicion_ID) REFERENCES Posiciones(Posicion_ID); 

INSERT INTO Empleados(Nombre, Apellido, Posicion_ID, Departamento_ID, Sucursal_ID, Rol_ID) VALUES
	('John', 'Doe', 1, 1, 1, 1),
	('Jane', 'Smith', 2, 2, 1, 1),
	('Bill', 'Jones', 3, 2, 1, 1),
	('Alice', 'Johnson', 4, 3, 1, 1),
	('Tom', 'Brown', 5, 4, 1, 1),
	('Emma', 'Davis', 6, 5, 1, 2),
	('Lucas', 'Miller', 7, 6, 1, 1),
	('Olivia', 'García', 8, 1, 1, 1),
	('Ethan', 'Martinez', 9, 7, 1, 1),
	('Sophia', 'Rodriguez', 10, 8, 1, 1);

SELECT * FROM Empleados

-- TABLA CLIENTE					
SELECT * FROM Clientes

-- MODIFICAMOS LA TABLA
ALTER TABLE Clientes
DROP CONSTRAINT UQ__Clientes__F692CF07705729F2

ALTER TABLE Clientes
DROP CONSTRAINT UQ__Clientes__CFEC40CDEE083DFE

ALTER TABLE Clientes
DROP COLUMN [E-Mail], Contacto

ALTER TABLE Clientes 
ADD Direccion VARCHAR (200)

INSERT INTO Clientes(Nombre, Apellido, Direccion) VALUES
	('Cliente', 'Uno', '1000 A Street'),
	('Cliente', 'Dos', '1001 B Street'),
	('Cliente', 'Tres', '1002 C Street'),
	('Cliente', 'Cuatro', '1003 D Street'),
	('Cliente', 'Cinco', '1004 E Street'),
	('Cliente', 'Seis', '1005 F Street'),
	('Cliente', 'Siete', '1006 G Street'),
	('Cliente', 'Ocho', '1007 H Street'),
	('Cliente', 'Nueve', '1008 I Street'),
	('Cliente', 'Diez', '1009 J Street');

--TABLA ORIGEN					
SELECT * FROM Origen

INSERT INTO Origen(Origen) VALUES
	('En línea'),
	('Presencial'),
	('Teléfono'),
	('Drive Thru'),
	('App Móvil'),
	('Redes Sociales'),
	('Correo Electrónico'),
	('Publicidad'),
	('Recomendación'),
	('Evento');

-- TABLA MENSAGERO		
SELECT * FROM Mensageros

ALTER TABLE Mensageros
DROP CONSTRAINT UQ__Mensager__12419D6BB9D2E832

ALTER TABLE Mensageros
DROP COLUMN [E_Mail]

INSERT INTO Mensageros(Nombre, Apellido, [Interno/Externo]) VALUES
	('Mensajero', 'Uno', 0),
	('Mensajero', 'Dos', 1),
	('Mensajero', 'Tres', 0),
	('Mensajero', 'Cuatro', 1),
	('Mensajero', 'Cinco', 0),
	('Mensajero', 'Seis', 1),
	('Mensajero', 'Siete', 0),
	('Mensajero', 'Ocho', 1),
	('Mensajero', 'Nueve', 0),
	('Mensajero', 'Diez', 1);


-- TABLA TIPO DE PAGO					

INSERT INTO Tipo_Pago(Tipo) VALUES
	('Efectivo'),
	('Tarjeta de Crédito'),
	('Tarjeta de Débito'),
	('PayPal'),
	('Transferencia Bancaria'),
	('Criptomonedas'),
	('Cheque'),
	('Vale de Comida'),
	('Cupón de Descuento'), 
	('Pago Móvil');

SELECT * FROM Tipo_Pago

-- ORDEN DE CANTIDADES					
-- FALTA LA COLUMNA PRECIO SE VA A CREAR
ALTER TABLE Detalle
ADD Precio NUMERIC(10,2)

INSERT INTO Detalle(Orden_ID, Producto_ID, Cantidad, Precio) VALUES
	(1, 1, 3, 23.44),
	(1, 2, 5, 45.14),
	(1, 3, 4, 46.37),
	(1, 4, 4, 42.34),
	(1, 5, 1, 18.25),
	(1, 6, 4, 20.08),
	(1, 7, 2, 13.31),
	(1, 8, 2, 20.96),
	(1, 9, 4, 30.13),
	(1, 10, 3, 38.34);

SELECT * FROM Detalle

-- TABLA DE ORDENES					
SELECT * FROM Ordenes

INSERT INTO Ordenes(Cliente_ID, Empleado_ID, Sucursal_ID, Mensagero_ID, Tipo_Pago_ID, Origen_ID, Hora_Venta_ID, Total_Compra, Kilometros_Recorrer, Fecha_Despacho, Fecha_Entrega, Fecha_Orden_Tomada, Fecha_Orden_Lista) VALUES
(1, 1, 1, 1, 1, 1, 1, 1053.51, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 2, 1075.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 3, 920.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 4, 4, 4, 4, 4, 1, 930.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 5, 5, 5, 5, 5, 2, 955.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 6, 6, 6, 6, 1, 3, 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 1, 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 2, 1085.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 9, 9, 9, 9, 4, 3, 1095.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 10, 10, 10, 10, 5, 1, 900.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');

-- LA COLUMNA DE HORA_VENTA TIENE SOLO FORMATO DE HORA LA VOY A REHACER PARA TENERLA EN EL FORMATO CORRECTO
ALTER TABLE Ordenes
DROP COLUMN Hora_Venta

--VOY A VREAR UNA TABLA PARA NO REPETIR MCUHAS VECES MAÑANA TARDE O NOCHE Y GUARME POR LA ASOGNACION DE UN ID
CREATE TABLE Hora_Venta(
	Hora_Venta_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Periodo_Tiempo VARCHAR (100)
)
GO

INSERT INTO Hora_Venta(Periodo_Tiempo) VALUES
	('Mañana'), --1
	('Tarde'), --2
	('Noche'); --3
GO

SELECT * FROM Hora_Venta

ALTER TABLE Ordenes
ADD Hora_Venta_ID INT


SELECT * FROM Ordenes



-- EN ESTE CASO ME DOY CUENTA QUE CUANDO CREE LAS TABLAS ANTERIORES DEFINI A LA TABLA ORDEN COMO TA TABLA FINAL
-- EN LOS DATOS QUE ME BRINDARON LA TABLA DETALLE ESTA PENSADO COMO EL FINAL DE LAS TABLAS SI BIEN PUDE HACER EL EJERCICIO
-- ME DOY CUENTA QUE HAY UNA INCONSISTENCIA ENTRE LAS TABLAS DETALLE Y ORDENES
-- PARA ASEGURAR LA CONCISTENCIA SERIA BUENO QUE ELIMONE LA COLUMNA DE DETALLE EN LA TABLA ORDENES

ALTER TABLE Ordenes
DROP CONSTRAINT FK__Ordenes__Detalle__607251E5
DROP COLUMN Detalle_ID

-- AHORA TENGO QUE DENOMONIAR A DETALLE_ID COMO CLAVE FORANEA DE ORDENES

ALTER TABLE Detalle
ADD CONSTRAINT FK_Orden_ID FOREIGN KEY (Orden_ID) REFERENCES Ordenes(Orden_ID);

-- ME DA ERROR PORQUE PREVIAMENTE HICE UNA CARGA DE 2 VALORES A ORDENES LO CUAL YO TENGO CARGADO COMO LA ORDEN 1 Y EN LA TABLA DE ORDEN EMPIEZA POR LA 3

UPDATE Detalle
SET Orden_ID = 3
WHERE Orden_ID = 1;

-- CORREGI LOS VALORES Y AL COINCIDIR CON LA TABLA ORDEN PUEDE CREAR LA CLAVE FORANEA 



-- Aumentar el precio de todos los productos en la categoría 1
SELECT * FROM Productos

UPDATE Productos 
SET Precio = Precio + 1 
WHERE Categoria_ID = 1;


-- Cambiar la posición de todos los empleados del departamento 'Cocina' a 'Chef'
SELECT * FROM Empleados
SELECT * FROM Departamentos

UPDATE Departamentos
SET Departamento = 'Chef'
WHERE Departamento = 'Cocina';


-- Actualizar la dirección de una sucursal específica
SELECT * FROM Sucursales

UPDATE Sucursales
SET Direccion = '1234 Nueva Direccion'
WHERE Sucursal_ID = 1;


--ELIMINACIONES DE EJEMPLO (DELETE)

/*1. Eliminar una orden específica
Imaginemos que quieres eliminar una orden específica, 
por ejemplo, la orden con OrdenID = 10. 
Esta operación eliminaría la orden junto con sus detalles asociados 
(deberías asegurarte de eliminar o actualizar cualquier dato relacionado 
para mantener la integridad referencial).
*/

DELETE FROM Detalle WHERE Orden_ID = 10;
DELETE FROM Ordenes WHERE Orden_ID = 10;

SELECT * FROM Ordenes
SELECT * FROM Detalle


/*2. Eliminar todos los productos de una categoría específica
Si decides dejar de ofrecer todos los "Postres" 
(supongamos que Categorias.CategoriaID = 2 para "Postres"), 
podrías querer eliminar todos los productos asociados a esa categoría.
*/

DELETE FROM Productos WHERE CategoriaID = 2;
--Antes de ejecutar este comando, deberías considerar si hay órdenes que incluyen estos productos y decidir cómo manejar esas referencias.

SELECT * FROM Categoria
SELECT * FROM Productos
SELECT * FROM Detalle

SELECT * FROM Productos
JOIN Categoria ON Productos.Categoria_ID = Categoria.Categoria_ID
WHERE Categoria.Categoria_ID = 2; -- TENGO DOS PRODUCTOS, PRODUCTO_ID 9, 10


SELECT * FROM Detalle
JOIN Productos ON Productos.Producto_ID = Detalle.Producto_ID
WHERE Producto_ID = 9;

SELECT * FROM Detalle
JOIN Productos ON Detalle.Producto_ID = Productos.Producto_ID
WHERE Productos.Producto_ID IN (9, 10);

-- VEIEND EL DETALLE DE COMPRA AFECTIVAMENTE TENGO DOS COMPRAS DE LOS PRODUCTOS CUYA CATEGORIA ES 2

DELETE FROM Detalle
WHERE Producto_ID IN (
	SELECT Producto_ID FROM Productos
	WHERE Categoria = 'Postres' 
);
GO
-- NO FUNCIONO ME FALTA ACER REFERENCIA A
DELETE FROM Detalle
WHERE Producto_ID IN (
    SELECT Producto_ID FROM Productos
    WHERE Categoria_ID = (
        SELECT Categoria_ID FROM Categoria
        WHERE Categoria = 'Postres'
)
);
GO

/*3. Eliminar empleados de una sucursal que cerró
Si una sucursal cierra, por ejemplo, 
SucursalID = 10 (Sucursal Bosque), 
podrías necesitar eliminar a todos los empleados asociados con esa sucursal.
*/

DELETE FROM Empleados WHERE SucursalID = 10;

SELECT * FROM Sucursales
SELECT * FROM Empleados

SELECT * FROM Empleados
JOIN Sucursales ON Sucursales.Sucursal_ID = Empleados.Sucursal_ID
WHERE Sucursales.Sucursal_ID = 10; -- NO TENGO EMPLEADOS EN LA SUCURSAL 10 TODOS SON DE LA SUCURSAL 1



/*Registros únicos
Pregunta: ¿Cuál es la cantidad total de registros únicos en la tabla de órdenes?
*/

SELECT COUNT(DISTINCT Ordenes.Orden_ID) AS OrdenesTotales
FROM Ordenes; -- 9

/*Empleados por departamento
Pregunta: ¿Cuántos empleados existen en cada departamento?
*/

SELECT * FROM Empleados 
SELECT Empleados.Departamento_ID, COUNT(*) AS Empleasdos_X_Departamensto
FROM Empleados
GROUP BY Departamento_ID;-- DEPARTAMENTO 1 Y 2 = 2 EMPLEADOS EL RESTO 1

/*Productos por categoría
Pregunta: ¿Cuántos productos hay por código de categoría?
*/

SELECT * FROM Productos

SELECT Productos.Producto_ID, COUNT(*) AS Producto_X_Categoria
FROM Productos
GROUP BY Producto_ID;-- TENGO SOLO UN PRODUCTO POR CATEGORIA HAY QUE RECORDAR QUE BORRE LA CATEGORIA POSTRES QUE TENIA 2 PRODUCTOS

/*
Importación de clientes
Pregunta: ¿Cuántos clientes se han importado a la tabla de clientes?
*/

SELECT COUNT(*) AS Cliente_Total
FROM Clientes; --10

/* Análisis de desempeño de sucursales
Pregunta: ¿Cuáles son las sucursales con un promedio de Facturación/Ingresos superior a 1000.00
y que minimizan sus costos en base al promedio de kilómetros recorridos de todas de sus entregas gestionadas?
Para un mejor relevamiento, ordene el listado por el Promedio Km Recorridos.*/

SELECT * FROM Ordenes

SELECT Sucursal_ID, Total_Compra
FROM Ordenes
WHERE Total_Compra > 1000
ORDER BY Total_Compra DESC;-- SUCURSALES CON FACTURACION SUPERIOR A 1000 9, 2, 7, 1

SELECT Sucursal_ID, Kilometros_Recorrer
FROM Ordenes
WHERE Total_Compra > 1000
ORDER BY Kilometros_Recorrer ASC --SUCURSALES CON MENOER KM A RECORR 9, 1, 7, 2

SELECT Sucursal_ID, AVG(Total_Compra) AS Promedio_Total_Compra, AVG(Kilometros_Recorrer) AS Promedio_Km_Recorridos
FROM Ordenes
GROUP BY Sucursal_ID
HAVING AVG(Total_Compra) > 1000
ORDER BY Promedio_Km_Recorridos DESC; --LAS SUCURSALES SON 2, 7, 1, 9



