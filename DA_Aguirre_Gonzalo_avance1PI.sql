--########## FAST FOOF DATE BASE ##########--					
CREATE DATABASE Fast_Food
GO
					
-- SELECCIONAR BASE DE DATOS					
USE Fast_Food
GO
					
-- ORDENES Y RELACION DE TABLAS LOS NUMEROS REPRESENTAN LAS TABLAS RELACIONADAS			
/*					
1-CATEGORIA: CONTIENE CATEGORIA DE PRODUCTOS					
1-PRODUCTO: CONTIENE PRODUCTOS ASOCIADO A CATEGORIAS					
'					
2-DEPARTAMENTO: CONTIENE LOS DEPARTAMENTOS DONDE PERTENECEN LOS EMPLEADOS					
2-ROLES: CONTIENE LAS ACTIVIDADES QUE DESEMPEÑAN LOS EMPLEADOS					
2-EMPLEADOS: CONTIENE LOS EMPLEADOS CON SU ROL, DEPARTAMENTO Y SUCURSAL					
'					
3-SUCURSAL: CONTIENE LAS SUCURSALES					
4-CLIENTE: CONTIENE LOS CLIENTES					
5-ORIGEN: CONTIENE LOS ORIGENES DE LAS ORDENES					
6-MENSAGERO: CONTIENE EL NOMBRE DE LOS CADETES Y SI SON INTERNOS O EXTERNOS					
7-TIPO_DE_PAGO: CONTIENE LA MODALIDAD DE PAGO DE LAS ORDENES					
'					
1-DETALLE: CONTIENE LAS CANTIDADES DE PRODUCTOS Y SU RELACION CON LA ORDEN					
8-ORDENES: CONTIENE DETALLES DE ORDEN COMO EMPLEADO, MENSAJERO, CLIENTE, ORIGEN, TIPO DE PAGO, FECHA Y TOTALES					
*/					
					
					
-- TABLA 1 CATEGORIA					
CREATE TABLE Categoria(					
	Categoria_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),				
	Categoria VARCHAR (100) NOT NULL UNIQUE,				
	)				
GO				
					
-- TABLA 2 PRODUCTOS					
CREATE TABLE Productos(					
	Producto_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),				
	Productos VARCHAR (125) UNIQUE NOT NULL,				
	Precio NUMERIC (10, 2) NOT NULL,				
	Categoria_ID INT FOREIGN KEY (Categoria_ID) REFERENCES Categoria(Categoria_ID)				
)					
GO					
					
-- TABLA DE DEPARTAMENTOS					
CREATE TABLE Departamentos(					
	Departamentos_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),				
	Departamento VARCHAR (100) NOT NULL UNIQUE,				
)					
GO					

-- TABLA DE ROL					
CREATE TABLE Rol(					
	Rol_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),				
	Rol VARCHAR (100) NOT NULL UNIQUE				
)					
GO					
					
					
-- TABLA  SUCURSAL					
CREATE TABLE Sucursales(					
	Sucursal_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Producto_ID INT FOREIGN KEY (Producto_ID) REFERENCES Productos(Producto_ID),				
	Categoria_ID INT FOREIGN KEY (Categoria_ID) REFERENCES Categoria(Categoria_ID)				
)					
GO					
		
-- TABLA  EMPLEADOS					
CREATE TABLE Empleados(					
	Empleado_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),				
	Nombre VARCHAR (100) NOT NULL,				
	Apellido VARCHAR (100) NOT NULL,				
	DNI	INT NOT NULL UNIQUE,			
	Sucursal_ID INT FOREIGN KEY (Sucursal_ID) REFERENCES Sucursales(Sucursal_ID),				
	Rol_ID INT FOREIGN KEY (Rol_ID) REFERENCES Rol(Rol_ID),				
	Departamento_ID INT FOREIGN KEY (Departamento_ID) REFERENCES Departamentos(Departamentos_ID),		
)					
GO

-- TABLA CLIENTE					
CREATE TABLE Clientes(					
	Cliente_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),				
	Nombre VARCHAR (100) NOT NULL,				
	Apellido VARCHAR (100) NOT NULL,				
	[E-Mail] VARCHAR (100) NOT NULL UNIQUE,				
	Contacto INT UNIQUE				
)					
GO					
					
--TABLA ORIGEN					
CREATE TABLE Origen(					
	Origen_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),				
	Origen VARCHAR (100) NOT NULL UNIQUE				
)					
GO					
					
-- TABLA MENSAGERO					
CREATE TABLE Mensageros(					
	Mensagero_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),				
	Nombre VARCHAR (100) NOT NULL,				
	Apellido VARCHAR (100) NOT NULL,				
	E_Mail VARCHAR (100) NOT NULL UNIQUE,				
	[Interno/Externo] BIT -- 1 INTERNO, 0 EXTERNO				
)					
GO					
					
-- TABLA TIPO DE PAGO					
CREATE TABLE Tipo_Pago(					
	Tipo_Pago_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),				
	Tipo VARCHAR (100) NOT NULL UNIQUE				
)					
GO					
				
-- ORDEN DE DETALLE			
CREATE TABLE Detalle(					
	Detalle_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Orden_ID INT,
	Producto_ID INT FOREIGN KEY (Producto_ID) REFERENCES Productos(Producto_ID),				
	Cantidad INT				
)					
GO					

-- TABLA DE ORDENES					
CREATE TABLE Ordenes(					
	Orden_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),				
	Detalle_ID INT FOREIGN KEY (Detalle_ID) REFERENCES Detalle(Detalle_ID),				
	Empleado_ID INT FOREIGN KEY (Empleado_ID) REFERENCES Empleados(Empleado_ID),				
	Sucursal_ID INT FOREIGN KEY (Sucursal_ID) REFERENCES Sucursales(Sucursal_ID),				
	Cliente_ID INT FOREIGN KEY (Cliente_ID) REFERENCES Clientes(Cliente_ID),				
	Origen_ID INT FOREIGN KEY (Origen_ID) REFERENCES Origen(Origen_ID),				
	Mensagero_ID INT FOREIGN KEY (Mensagero_ID) REFERENCES Mensageros(Mensagero_ID),				
	Tipo_Pago_ID INT FOREIGN KEY (Tipo_Pago_ID) REFERENCES Tipo_Pago(Tipo_Pago_ID),				
	Fecha_Orden_Tomada DATETIME,				
	Hora_Venta TIME,				
	Fecha_Orden_Lista DATETIME,				
	Fecha_Despacho DATETIME,				
	Fecha_Entrega DATETIME,				
	Kilometros_Recorrer INT,				
	Total_Compra DECIMAL NOT NULL,				
)					
GO					
	
