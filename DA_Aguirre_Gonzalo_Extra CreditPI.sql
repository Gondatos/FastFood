--########## EXTRA CREDIR FAST-FOOD ##########--

--Expansión de datos:

SELECT * FROM Categoria

INSERT INTO Categoria(Categoria) VALUES
('Sopas'), ('Sandwiches'), ('Mariscos'), ('Tacos'), ('Buffet'),
('Sushi'), ('Barbacoa'), ('Pasta'), ('Desayuno Rápido'), ('Batidos'),
('Platos Internacionales'), ('Platos Infantiles'), ('Menú Saludable'), ('Menú Sin Gluten'), ('Comida Oriental'),
('Comida Mediterránea'), ('Aperitivos'), ('Comida Orgánica'), ('Menú Degustación'), ('Platos del Día');

SELECT*FROM Productos

INSERT INTO Productos(Productos, Categoria_ID, Precio) VALUES
('Nachos con Queso', 27, 5.99), ('Aros de Cebolla', 27, 4.99), 
('Costillas de Cerdo', 17, 18.99), ('Pollo a la Barbacoa', 17, 12.99),
('Batido de Chocolate', 20, 3.99), ('Batido de Plátano', 20, 3.99),
('Refresco de Cola', 3, 1.99), ('Limonada', 3, 1.99),
('Buffet de Desayuno', 15, 12.99), ('Buffet de Almuerzo', 15, 15.99),
('Café Americano', 6, 2.99), ('Capuchino', 6, 3.99),
('Bistec a la Parrilla', 9, 22.99), ('Lomo de Cerdo', 9, 19.99),
('Paella', 26, 14.99), ('Hummus con Pita', 26, 6.99),
('Quinoa Bowl', 28, 11.99), ('Tofu Orgánico', 28, 9.99),
('Pollo Kung Pao', 25, 13.99), ('Rollos Primavera', 25, 7.99),
('Hamburguesa con Queso', 1, 5.99), ('Papas Fritas', 1, 2.99),
('Hamburguesa Vegana', 8, 7.99), ('Tacos Veganos', 8, 8.99),
('Huevos Revueltos', 5, 4.99), ('Pancakes', 5, 5.99),
('Sandwich de Desayuno', 19, 3.99), ('Parfait de Yogurt', 19, 4.99),
('Ensalada de Pollo', 4, 7.99), ('Ensalada de Atún', 4, 6.99),
('Helado de Fresa', 7, 2.99), ('Helado de Menta', 7, 2.99),
('Camarones al Ajillo', 13, 15.99), ('Ceviche', 13, 12.99),
('Menú Degustación de Mariscos', 29, 25.99), ('Menú Degustación de Carnes', 29, 28.99),
('Ensalada de Kale', 23, 9.99), ('Wrap de Pollo', 23, 8.99),
('Pizza Sin Gluten', 24, 11.99), ('Pasta Sin Gluten', 24, 10.99),
('Espagueti Boloñesa', 18, 9.99), ('Lasaña', 18, 11.99),
('Pizza Hawaiana', 10, 12.99), ('Pizza Cuatro Quesos', 10, 13.99),
('Salmón a la Parrilla', 30, 18.99), ('Pollo al Horno', 30, 14.99),
('Nuggets de Pollo', 22, 5.99), ('Macarrones con Queso', 22, 4.99),
('Pad Thai', 21, 12.99), ('Curry de Pollo', 21, 13.99),
('Tarta de Queso', 2, 4.99), ('Mousse de Chocolate', 2, 3.99),
('BLT', 12, 6.99), ('Sandwich de Atún', 12, 6.99),
('Sopa de Verduras', 11, 4.99), ('Sopa de Fideos', 11, 5.49),
('Roll de Atún', 16, 12.99), ('Roll California', 16, 11.99),
('Tacos de Pescado', 14, 8.99), ('Tacos de Pollo', 14, 7.99);

SELECT*FROM Empleados

INSERT INTO Empleados (Nombre, Apellido, Posicion_ID, Departamento_ID, Sucursal_ID, Rol_ID) VALUES
    ('Carlos', 'Fernández', 3, 2, 2, 1),
    ('Marta', 'López', 4, 3, 2, 1),
    ('Ana', 'Martínez', 5, 4, 2, 1),
    ('Pedro', 'Sánchez', 6, 5, 2, 2),
    ('Lucía', 'Pérez', 7, 6, 2, 1),
    ('Javier', 'Gómez', 8, 1, 2, 1),
    ('Rosa', 'Díaz', 9, 7, 2, 1),
    ('Miguel', 'Herrera', 10, 8, 2, 1),
    ('Elena', 'Ruiz', 1, 1, 3, 1),
    ('Laura', 'Jiménez', 2, 2, 3, 1),
    ('Andrés', 'García', 3, 2, 3, 1),
    ('Carolina', 'Torres', 4, 3, 3, 1),
    ('Fernando', 'Navarro', 5, 4, 3, 1),
    ('Isabel', 'Gutiérrez', 6, 5, 3, 2),
    ('Gabriel', 'Molina', 7, 6, 3, 1),
    ('Natalia', 'Flores', 8, 1, 3, 1),
    ('Samuel', 'Castillo', 9, 7, 3, 1),
    ('Patricia', 'Morales', 10, 8, 3, 1);

-- CLIENTES

INSERT INTO Clientes (Nombre, Apellido, Direccion) VALUES
    ('Cliente', 'Once', '1010 K Street'),
    ('Cliente', 'Doce', '1011 L Street'),
    ('Cliente', 'Trece', '1012 M Street'),
    ('Cliente', 'Catorce', '1013 N Street'),
    ('Cliente', 'Quince', '1014 O Street'),
    ('Cliente', 'Dieciséis', '1015 P Street'),
    ('Cliente', 'Diecisiete', '1016 Q Street'),
    ('Cliente', 'Dieciocho', '1017 R Street'),
    ('Cliente', 'Diecinueve', '1018 S Street'),
    ('Cliente', 'Veinte', '1019 T Street');


-- ORDENES

INSERT INTO Ordenes (Cliente_ID, Empleado_ID, Sucursal_ID, Mensagero_ID, Tipo_Pago_ID, Origen_ID, Hora_Venta_ID, Total_Compra, Kilometros_Recorrer, Fecha_Despacho, Fecha_Entrega, Fecha_Orden_Tomada, Fecha_Orden_Lista) VALUES
    (11, 6, 1, 3, 2, 2, 2, 1023.75, 6.2, '2023-11-05 10:30:00', '2023-11-05 11:00:00', '2023-11-05 10:00:00', '2023-11-05 10:15:00'),
    (12, 7, 2, 4, 3, 1, 1, 1005.50, 8.3, '2023-12-10 12:30:00', '2023-12-10 13:00:00', '2023-12-10 12:00:00', '2023-12-10 12:15:00'),
    (13, 8, 3, 5, 1, 3, 3, 995.00, 3.9, '2023-12-15 15:30:00', '2023-12-15 16:00:00', '2023-12-15 15:00:00', '2023-12-15 15:15:00'),
    (14, 9, 4, 6, 2, 5, 2, 1030.25, 7.1, '2023-12-20 17:30:00', '2023-12-20 18:00:00', '2023-12-20 17:00:00', '2023-12-20 17:15:00'),
    (15, 10, 5, 7, 3, 4, 1, 1075.75, 4.4, '2023-12-25 19:30:00', '2023-12-25 20:00:00', '2023-12-25 19:00:00', '2023-12-25 19:15:00'),
    (16, 11, 6, 8, 2, 3, 3, 1100.00, 9.2, '2023-12-30 08:30:00', '2023-12-30 09:00:00', '2023-12-30 08:00:00', '2023-12-30 08:15:00'),
    (17, 12, 7, 9, 1, 2, 2, 1125.50, 2.8, '2024-01-05 11:30:00', '2024-01-05 12:00:00', '2024-01-05 11:00:00', '2024-01-05 11:15:00'),
    (18, 13, 8, 10, 3, 1, 1, 1150.75, 5.5, '2024-01-10 13:30:00', '2024-01-10 14:00:00', '2024-01-10 13:00:00', '2024-01-10 13:15:00'),
    (19, 14, 9, 1, 2, 5, 2, 1175.25, 6.6, '2024-01-15 15:30:00', '2024-01-15 16:00:00', '2024-01-15 15:00:00', '2024-01-15 15:15:00'),
    (20, 15, 10, 2, 1, 4, 3, 1200.00, 8.0, '2024-01-20 17:30:00', '2024-01-20 18:00:00', '2024-01-20 17:00:00', '2024-01-20 17:15:00');





-- DETALLES
SELECT*FROM Detalle

INSERT INTO Detalle (Orden_ID, Producto_ID, Cantidad, Precio) VALUES
    (11, 1, 2, 23.44),
    (11, 2, 3, 45.14),
    (12, 3, 1, 46.37),
    (12, 4, 4, 42.34),
    (13, 5, 2, 18.25),
    (13, 6, 3, 20.08),
    (14, 7, 1, 13.31),
    (14, 8, 2, 20.96),
    (15, 9, 3, 30.13),
    (15, 10, 2, 38.34),
    (16, 1, 4, 23.44),
    (16, 2, 5, 45.14),
    (17, 3, 1, 46.37),
    (17, 4, 4, 42.34),
    (18, 5, 2, 18.25),
    (18, 6, 3, 20.08),
    (19, 7, 1, 13.31),
    (19, 8, 2, 20.96),
    (20, 9, 3, 30.13),
    (20, 10, 2, 38.34);




-- CONSUMO POR MES
CREATE VIEW [VENTAS MENSUALES] AS(
SELECT MONTH(Fecha_Orden_Tomada) AS Mes, SUM(Total_Compra) AS TotalVentas
FROM Ordenes
GROUP BY MONTH(Fecha_Orden_Tomada)
);


-- PRUDUCTOS VENDIDOS POR REGION
SELECT S.Nombre, P.Productos, SUM(D.Cantidad) AS [Total Vendidos]
FROM Detalle D
INNER JOIN Ordenes O ON D.Orden_ID = O.Orden_ID
INNER JOIN Productos P ON D.Producto_ID = P.Producto_ID
INNER JOIN Sucursales S ON O.Sucursal_ID = S.Sucursal_ID
GROUP BY S.Nombre, P.Productos;



-- INGRESOS POR PRODUCTOS
SELECT P.Productos, SUM(D.Precio * D.Cantidad) AS [Ingresos Totales]
FROM Detalle D
INNER JOIN Productos P ON D.Producto_ID = P.Producto_ID
GROUP BY P.Productos
ORDER BY [Ingresos Totales] DESC;


-- EFICIENCIADE MENSAJEROS YA TENIA LA VISTA HCHA DE ANTES
SELECT*FROM [EFICIENCIA MENSAJEROS]

SELECT*FROM[dbo].[DETALLE_FASTFOOD]
SELECT*FROM[dbo].[EFICIENCIA MENSAJEROS]
SELECT*FROM[dbo].[Producto_Ctategoria]
SELECT*FROM[dbo].[Promedio_Precio_Producto]
SELECT*FROM[dbo].[Turno_Salida]
SELECT*FROM[dbo].[VENTAS X SUCURSAL]







-- INDICE RPIMARY KEY
CREATE INDEX idx_orden_id ON Ordenes(Orden_ID);

-- INDICE FOREIGN KET
CREATE INDEX idx_cliente_id ON Ordenes(Cliente_ID);
CREATE INDEX idx_empleado_id ON Ordenes(Empleado_ID);
CREATE INDEX idx_sucursal_id ON Ordenes(Sucursal_ID);

-- INDICE COLUMNA MONTOS
CREATE INDEX idx_total_compra ON Ordenes(Total_Compra);






