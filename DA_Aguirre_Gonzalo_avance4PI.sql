--########## FAST FOOD ##########--

-- Crear una vista que muestre junto con la información del cliente

CREATE VIEW Promedio_Precio_Producto AS
	SELECT c.Categoria_ID, AVG(p.Precio) AS Promedio, c.Categoria
	FROM Productos p
	INNER JOIN Categoria c ON p.Categoria_ID = c.Categoria_ID
	GROUP BY c.Categoria_ID, c.Categoria


SELECT * 
FROM Promedio_Precio_Producto
ORDER BY Promedio DESC;


DECLARE @Cliente_ID INT
SET @Cliente_ID = 1
SELECT * FROM Clientes
WHERE Cliente_ID = @Cliente_ID;

SELECT * FROM Ordenes

SELECT 
    Cliente_ID, 
    Fecha_Orden_Tomada, 
    Ordenes.Fecha_Entrega,
    DATEDIFF(day, Fecha_Orden_Tomada, Ordenes.Fecha_Entrega) AS DuracionDias
FROM 
    Ordenes;

CREATE PROCEDURE Agregar_Cliente
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @Direccion VARCHAR(100)
AS
BEGIN
    INSERT INTO Clientes(Nombre, Apellido, Direccion)
    VALUES (@Nombre, @Apellido, @Direccion);
END;


SELECT
    Cliente_ID,
    Fecha_Entrega,
    Fecha_Orden_Tomada,
    CASE 
        WHEN DATEDIFF(hour, Fecha_Orden_Tomada, Fecha_Entrega) < 2 THEN 'Corto'
        WHEN DATEDIFF(hour, Fecha_Orden_Tomada, Fecha_Entrega) BETWEEN 2 AND 3 THEN 'Medio'
        ELSE 'Largo'
    END AS Duracion
FROM
    Ordenes;

CREATE VIEW Turno_Salida AS(
SELECT
    Cliente_ID,
    Fecha_Orden_Tomada,
    CASE
        WHEN DATEPART(hour, Fecha_Orden_Tomada) BETWEEN 6 AND 11 THEN 'Mañana'
        WHEN DATEPART(hour, Fecha_Orden_Tomada) BETWEEN 12 AND 18 THEN 'Tarde'
        ELSE 'Noche'
    END AS TurnoSalida
FROM
    Ordenes
	);

SELECT * FROM Turno_Salida

SELECT
    Ordenes.Orden_ID,
    Ordenes.Total_Compra,
    CASE
        WHEN Total_Compra > (SELECT AVG(Total_Compra) FROM Ordenes) THEN 'Sobre Promedio'
        ELSE 'Normal'
    END AS EstadoPrecio
FROM
    Ordenes;

--Listar todos los productos y sus categorías
--Pregunta: ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?
SELECT * FROM Productos
SELECT * FROM Sucursales

CREATE VIEW Producto_Ctategoria AS (

SELECT P.Producto_ID, P.Productos, C.Categoria_ID, c.Categoria
FROM Productos P
INNER JOIN Categoria c ON P.Categoria_ID = c.Categoria_ID 
);

SELECT * FROM Producto_Ctategoria

/*
Obtener empleados y su sucursal asignada
Pregunta: ¿Cómo puedo saber a qué sucursal está asignado cada empleado?
*/
SELECT * FROM Sucursales

CREATE VIEW Empleado_En_Sucursal AS (

SELECT E.Empleado_ID, E.Nombre AS Nombre_Ampleado, E.Apellido AS Apellido_Empleado, S.Nombre AS Sucursal_Nombre
FROM Empleados E
INNER JOIN Sucursales S ON E.Sucursal_ID = E.Sucursal_ID
);

SELECT * FROM Empleado_En_Sucursal

/*
Identificar productos sin categoría asignada
Pregunta: ¿Existen productos que no tienen una categoría asignada?
*/

SELECT * FROM Productos

SELECT Categoria
FROM Categoria
WHERE Categoria_ID IS NULL;


-- EN ESTE CASO ME SALE COMO QUE NO HAY PRODUCTOS NULLOS NO SE SI ES PORQUE BORRE EN CASCADA EN LA AVANCE 2 CREO QUE TENFRA QUE SALIR NULLO DEBIDO A QUE BORRE UNA CATEGORIA

/*
Detalle completo de órdenes
Pregunta: ¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo el Nombre del cliente, Nombre del empleado que tomó la orden, y Nombre del mensajero que la entregó?
*/

SELECT * FROM Clientes
SELECT * FROM Mensageros
SELECT * FROM Ordenes

CREATE VIEW DETALLE_FASTFOOD AS (

SELECT O.Orden_ID, C.Nombre AS Nombre_Cliente, C.Apellido AS Apellido_Cliente, E.Nombre AS Nombre_Empleado, M.Nombre AS Nombre_Mensajero, M.Apellido AS Apellido_Mensajero, O.Total_Compra, O.Fecha_Orden_Tomada
FROM Ordenes O
JOIN Clientes C ON O.Cliente_ID = C.Cliente_ID
JOIN Empleados E ON O.Empleado_ID = E.Empleado_ID
JOIN Mensageros M ON O.Mensagero_ID = M.Mensagero_id

);

SELECT * FROM DETALLE_FASTFOOD

/*
Productos vendidos por sucursal
Pregunta: ¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?
*/
SELECT * FROM Categoria
SELECT * FROM Detalle
SELECT * FROM Productos
SELECT * FROM Sucursales
SELECT * FROM Ordenes

SELECT COUNT(*) AS [Cantidad Total Productos]
FROM Productos;

-- ARTICULOS POR CATEGORIA
SELECT COUNT(Productos) AS CANTIDAD
FROM Productos
GROUP BY Categoria_ID;

-- VENTAS POR CADA SUCURSAL
SELECT SUM(O.Orden_ID) AS [CANTIDAD ORDENES], SUM(D.Producto_ID) AS [CANTIDAD PRODUCTOS]
FROM Detalle D
INNER JOIN Ordenes O ON O.Orden_ID = D.Orden_ID
GROUP BY O.Orden_ID;
-- 
SELECT SUM(O.Orden_ID) AS [CANTIDAD ORDENES], COUNT(D.Producto_ID) AS [CANTIDAD PRODUCTOS]
FROM Detalle D
INNER JOIN Ordenes O ON O.Orden_ID = D.Orden_ID
GROUP BY O.Orden_ID;

SELECT C.Categoria, COUNT(O.Orden_ID) AS [Cantidad Ordenes], COUNT(D.Producto_ID) AS [Productos X Orden], SUM(D.Producto_ID) AS [Total Productos]
FROM Ordenes O
INNER JOIN Detalle D ON O.Orden_ID = D.Orden_ID
INNER JOIN Productos P ON D.Producto_ID = P.Producto_ID
INNER JOIN Categoria C ON P.Categoria_ID = C.Categoria_ID
GROUP BY C.Categoria;


CREATE VIEW [VENTAS X SUCURSAL] AS (
SELECT S.Nombre, C.Categoria, SUM(D.Cantidad) AS [Total Vendidos]
FROM Ordenes o
INNER JOIN Detalle D ON O.Orden_ID = D.Orden_ID
INNER JOIN Productos P ON D.Producto_ID = P.Producto_ID
INNER JOIN Categoria C ON P.Categoria_ID = C.Categoria_ID
INNER JOIN Sucursales S ON O.Sucursal_ID = S.Sucursal_ID
GROUP BY S.Nombre, C.Categoria
);

SELECT * FROM [VENTAS X SUCURSAL]


--Eficiencia de los mensajeros: ¿Cuál es el tiempo promedio desde el despacho hasta la entrega de los pedidos gestionados por todo el equipo de mensajería?

SELECT * FROM Ordenes

CREATE VIEW [EFICIENCIA MENSAJEROS] AS(
SELECT M.Apellido, DATEDIFF(MINUTE, O.Fecha_Despacho, O.Fecha_Entrega) AS TIEMP
FROM Ordenes O
INNER JOIN Mensageros M ON O.Mensagero_ID = M.Mensagero_id
);

SELECT * FROM [EFICIENCIA MENSAJEROS]

--Análisis de Ventas por Origen de Orden: ¿Qué canal de ventas genera más ingresos?

SELECT * FROM Origen

SELECT O.Orden_ID, O.Origen_ID, P.Origen, SUM(O.Total_Compra) AS [Ingresos Totales]
FROM Ordenes O
INNER JOIN Origen P ON O.Origen_ID = P.Origen_ID
GROUP BY O.Orden_ID, O.Origen_ID, P.Origen
ORDER BY [Ingresos Totales] DESC;

SELECT O.Origen_ID, P.Origen, SUM(O.Total_Compra) AS [Ingresos Totales]
FROM Ordenes O
INNER JOIN Origen P ON O.Origen_ID = P.Origen_ID
GROUP BY O.Origen_ID, P.Origen
ORDER BY [Ingresos Totales] DESC;



--Productividad de los Empleados: ¿Cuál es el nivel de ingreso generado por Empleado?

SELECT * FROM Empleados
SELECT * FROM Ordenes

SELECT E.Empleado_ID, E.Apellido, SUM(O.Total_Compra) AS [Ingresos Totales]
FROM Ordenes O
INNER JOIN Empleados E ON O.Empleado_ID = E.Empleado_ID
GROUP BY E.Empleado_ID, E.Apellido
ORDER BY [Ingresos Totales] DESC;

--Análisis de Demanda por Horario y Día: ¿Cómo varía la demanda de productos a lo largo del día? NOTA: Esta consulta no puede ser implementada sin una definición clara del horario (mañana, tarde, noche) en la base de datos existente. Asumiremos que HorarioVenta refleja esta información correctamente.

SELECT * FROM Hora_Venta
SELECT * FROM Ordenes
SELECT * FROM Detalle

SELECT H.Periodo_Tiempo, O.Hora_Venta_ID, COUNT(O.Orden_ID) AS [Total Ventas], SUM(D.Cantidad) AS [Total Productos Vendidos]
FROM Ordenes O
INNER JOIN Detalle D ON O.Orden_ID = D.Orden_ID
INNER JOIN Hora_Venta H ON O.Hora_Venta_ID = H.Hora_Venta_ID
GROUP BY O.Hora_Venta_ID, H.Periodo_Tiempo
ORDER BY O.Hora_Venta_ID;


--Comparación de Ventas Mensuales: ¿Cuál es la tendencia de los ingresos generados en cada periodo mensual?

SELECT*FROM Ordenes

SELECT YEAR(Fecha_Orden_Tomada) AS AÑO, MONTH(Fecha_Orden_Tomada) AS MES , SUM(Total_Compra) AS [INGRESO TOTAL]
FROM Ordenes
GROUP BY YEAR(Fecha_Orden_Tomada), MONTH(Fecha_Orden_Tomada)


--Análisis de Fidelidad del Cliente

SELECT TOP 5 Cliente_ID, COUNT(Orden_ID) AS [Numero Ordenes], MONTH(Fecha_Orden_Tomada) AS MES 
FROM Ordenes
GROUP BY Cliente_ID, MONTH(Fecha_Orden_Tomada)
ORDER BY [Numero Ordenes] DESC;




















