--########## CONSULTAS FAST FOOD ##########--

--Total de ventas globales
Pregunta: ¿Cuál es el total de ventas (TotalCompra) a nivel global?

SELECT * FROM Ordenes

SELECT SUM(Total_Compra) AS Ventas_Globales
FROM Ordenes; -- Ventas_Globales = 8939

--Promedio de precios de productos por categoría
Pregunta: ¿Cuál es el precio promedio de los productos dentro de cada categoría?

SELECT * FROM Productos
SELECT * FROM Categoria

-- ERROR SINTAXIS INCORRECTA
SELECT C.Categoria, P.Categoria_ID, AVG(Precio) AS P.Promedio  
FROM Productos
INNER JOIN  P.Categoria_ID = C.Categoria
GROUP BY Categoria_ID
ORDER BY Promedio DESC;

-- AHORA SI 
SELECT Categoria_ID, AVG(Precio) AS Promedio 
FROM Productos
GROUP BY Categoria_ID
ORDER BY Promedio DESC;


SELECT c.Categoria_ID, AVG(p.Precio) AS Promedio, c.Categoria
FROM Productos p
INNER JOIN Categoria c ON p.Categoria_ID = c.Categoria_ID
GROUP BY c.Categoria_ID, c.Categoria
ORDER BY Promedio DESC;
/*	
10	12.490000	Pizzas
1	9.990000	Comida Rapida
4	6.490000	Ensaladas
2	3.490000	Postres
7	2.990000	Helados
*/

--Orden mínima y máxima por sucursal
Pregunta: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?

SELECT * FROM Ordenes
SELECT MAX(Total_Compra) AS Valor_Max, MIN(Total_Compra)AS Valor_Min
FROM Ordenes; -- VALOR MAXIMO = 1095, VOLOR MINIMO = 900

-- Mayor número de kilómetros recorridos para entrega
Pregunta: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?

SELECT MAX(Ordenes.Kilometros_Recorrer)AS KM_Total
FROM Ordenes -- 15KM

--Promedio de cantidad de productos por orden
Pregunta: ¿Cuál es la cantidad promedio de productos por orden?

SELECT * FROM Detalle
SELECT Detalle_ID, AVG(Detalle.Cantidad) AS Prom
FROM Detalle
GROUP BY Detalle_ID 
ORDER BY Prom DESC;
/*
	DEBIDO A QUE TENGO TODOS LOS PEDIDOS COMO UNA SOLA ORDEN LOS AGRUPE POR DETALLE_ID A FIN DE SABER EL PROMEDIO PEDIDO
		2	PROM 5
		3	PROM 4
		4	PROM 4
		6	PROM 4
		1	PROM 3
		7	PROM 2
		8	PROM 2
		5	PROM 1
*/

--Total de ventas por tipo de pago
Pregunta: ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?

SELECT * FROM Ordenes

SELECT Tipo_Pago_ID, SUM(Total_Compra) / COUNT(Tipo_Pago_ID) AS DISTRIBUCION
FROM Ordenes
GROUP BY Tipo_Pago_ID
ORDER BY DISTRIBUCION DESC;


WITH TotalFacturacion AS (
    SELECT SUM(Total_Compra) AS FacturacionTotal
    FROM Ordenes
)
SELECT Tipo_Pago_ID, SUM(Total_Compra) AS FACTURACIONTOTALPORMETODO,
					SUM(Total_Compra) * 100 / (SELECT TotalFacturacion FROM TotalFacturacion)) AS PORSENTAJEFACTURADO
FROM Ordenes
GROUP BY Tipo_Pago_ID DESC;

WITH TotalFacturacion AS (
    SELECT SUM(Total_Compra) AS FacturacionTotal
    FROM Ordenes
)
SELECT Tipo_Pago_ID, SUM(Total_Compra) AS FacturacionTotalPorMetodo, (SUM(Total_Compra) * 100.0 / (SELECT FacturacionTotal FROM TotalFacturacion)) AS PorcentajeFacturacion
FROM Ordenes
GROUP BY Tipo_Pago_ID
ORDER BY Tipo_Pago_ID DESC;



--Sucursal con la venta promedio más alta
Pregunta: ¿Cuál Sucursal tiene el ingreso promedio más alto?

SELECT * FROM Ordenes

SELECT Sucursal_ID, MAX(Total_Compra) AS Monto_Total
FROM Ordenes
GROUP BY Sucursal_ID
ORDER BY Monto_Total DESC;
/*SUCUR_ID/ MONTO
	9		1095
	2		1075
	7		1065
	1		1054
	5		955
	6		945
	4		930
	3		920
	10		900
*/

Sucursal con la mayor cantidad de ventas por encima de un umbral
Pregunta: ¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?

SELECT Sucursal_ID, SUM(Total_Compra) AS TOTAL
FROM Ordenes
GROUP BY Sucursal_ID
HAVING SUM(Total_Compra) > 1000;
/*
SUCURSAL_ID / TOTAL
		1		1054
		2		1075
		7		1065
		9		1095
*/

WITH SUMATOTAL AS (
	SELECT Sucursal_ID, SUM(Total_Compra) AS TOTAL
	FROM Ordenes
	GROUP BY Sucursal_ID
)
SELECT Sucursal_ID, TOTAL
FROM SUMATOTAL
WHERE TOTAL > 1000;


Comparación de ventas promedio antes y después de una fecha específica
Pregunta: ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?

SELECT * FROM Ordenes

SELECT Fecha_Orden_Tomada, AVG(Total_Compra) AS TOTAL
FROM Ordenes
WHERE Fecha_Orden_Tomada < 2023-07-01
GROUP BY Fecha_Orden_Tomada
ORDER BY Fecha_Orden_Tomada DESC;

SELECT Fecha_Orden_Tomada, AVG(Total_Compra) AS TOTAL
FROM Ordenes
WHERE Fecha_Orden_Tomada >= '2023-07-01'
GROUP BY Fecha_Orden_Tomada
ORDER BY Fecha_Orden_Tomada DESC;

SELECT AVG(Total_Compra) AS Promedio_Ventas_Antes
FROM Ordenes
WHERE Fecha_Orden_Tomada < '2023-07-01'

SELECT AVG(Total_Compra) AS Promedio_Ventas_Despues
FROM Ordenes
WHERE Fecha_Orden_Tomada >= '2023-07-01'


SELECT AVG(Total_Compra) AS Promedio_Ventas_Antes
FROM Ordenes
WHERE Fecha_Orden_Tomada < '2023-07-01'
UNION ALL
SELECT AVG(Total_Compra) AS Promedio_Ventas_Despues
FROM Ordenes
WHERE Fecha_Orden_Tomada >= '2023-07-01'

-- SOLO ESTOY ROBANDO CAUNTO ME PERMITA EL WITH SE QUE NO ES NECESARIO SOLO CON UNION YA PUEDO VER ANTES Y DESPUESDE LA FECHA

SELECT (SELECT AVG(Total_Compra)
		FROM Ordenes
		WHERE Fecha_Orden_Tomada < '2023-07-01') AS 'ANTES',
		(SELECT AVG(Total_Compra)
		FROM Ordenes
		WHERE Fecha_Orden_Tomada >= '2023-07-01') AS 'DESPUES' ;


WITH VentasAntes AS (
    SELECT AVG(Total_Compra) AS Promedio_Ventas_Antes
    FROM Ordenes
    WHERE Fecha_Orden_Tomada < '2023-07-01'
),
VentasDespues AS (
    SELECT AVG(Total_Compra) AS Promedio_Ventas_Despues
    FROM Ordenes
    WHERE Fecha_Orden_Tomada >= '2023-07-01'
)
SELECT
    VentasAntes.Promedio_Ventas_Antes,
    VentasDespues.Promedio_Ventas_Despues
FROM
    VentasAntes, VentasDespues;

-- VentasAntes = 979.83333, VentasDespues = 1020.00   


--Análisis de actividad de ventas por horario
Pregunta: ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?


SELECT Hora_Venta_ID, COUNT(*) AS Cantidad_Ventas
FROM Ordenes
GROUP BY Hora_Venta_ID
ORDER BY Cantidad_Ventas DESC;
/*
1	4
3	3
2	2
*/

SELECT Hora_Venta_ID, AVG(Total_Compra) AS Ingreso_Promedio
FROM Ordenes
GROUP BY Hora_Venta_ID;
/*
1	987.250000
2	1015.000000
3	986.666666
*/

SELECT Hora_Venta_ID, MAX(Total_Compra) AS Importe_Maximo
FROM Ordenes
GROUP BY Hora_Venta_ID;
/*
1	1065
2	1075
3	1095
*/


SELECT Hora_Venta_ID, 
       COUNT(*) AS Cantidad_Ventas,
       AVG(Total_Compra) AS Ingreso_Promedio,
       MAX(Total_Compra) AS Importe_Maximo
FROM Ordenes
GROUP BY Hora_Venta_ID
ORDER BY Cantidad_Ventas DESC;
 /*
MAñana	4	987.250000	1065
Noche	3	986.666666	1095
Tarde	2	1015.000000	1075
*/

WITH Ventas AS (
    SELECT Hora_Venta_ID,
           COUNT(*) AS Cantidad_Ventas,
           AVG(Total_Compra) AS Ingreso_Promedio,
           MAX(Total_Compra) AS Importe_Maximo
    FROM Ordenes
    GROUP BY Hora_Venta_ID
)
SELECT Hora_Venta_ID, Cantidad_Ventas, Ingreso_Promedio, Importe_Maximo
FROM Ventas
ORDER BY Cantidad_Ventas DESC;



