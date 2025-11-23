/*Creación de la Base de Datos con espacio en el disco C
En caso de que se quiera crear la base de datos sin especificar un espacio en el disco C, es suficiente utilizar la sentencia CREATE DATABASE FastFoodDB*/
CREATE DATABASE [FastFood]
ON
( NAME = 'FastFoodData',
  FILENAME = 'C:\Henry\SQL\FastFoodDB\BD\FastFood.mdf',
  SIZE = 50MB,
  MAXSIZE = 1GB,
  FILEGROWTH = 10MB )
LOG ON
( NAME = 'FastFoodLog',
  FILENAME = 'C:\Henry\SQL\FastFoodDB\BD\FastFood.ldf',
  SIZE = 25MB,
  MAXSIZE = 256MB,
  FILEGROWTH = 10MB  );

  /*Sentencia necesaria para ubicarnos en la base de datos recién creada*/
  USE FastFood;

  /*Creación de las Tablas según el modelo semántico proporcionado*/
  /*Tabla Categoría*/
  CREATE TABLE Categoria (
	CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre NVARCHAR(255) NOT NULL
  );
  
  /*Tabla Producto*/
  CREATE TABLE Producto(
	ProductoID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre NVARCHAR(255) NOT NULL,
	Precio DECIMAL(10,2) NOT NULL,
	CategoriaID INT NOT NULL,
	CONSTRAINT FKCategoriaProducto FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)--Creación de la foreign key
  );

  /*Tabla Sucursal*/
  CREATE TABLE Sucursal(
	SucursalID INT IDENTITY (1,1) PRIMARY KEY,
	Nombre NVARCHAR(255) NOT NULL,
	Direccion NVARCHAR(255) NOT NULL
  );

  /*Tabla Puesto*/
  CREATE TABLE Puesto(
	PuestoID INT IDENTITY (1,1) PRIMARY KEY,
	Nombre NVARCHAR(255) NOT NULL
  );

  /*Tabla Rol*/
  CREATE TABLE Rol(
	RolID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre NVARCHAR(255) NOT NULL
  );

  /*Tabla Departamento*/
  CREATE TABLE Departamento(
	DepartamentoID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre NVARCHAR(255) NOT NULL
  );

  /*Tabla Empleado*/
  CREATE TABLE Empleado(
	EmpleadoID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre NVARCHAR(255) NOT NULL,
	Apellido NVARCHAR (255) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	SucursalID INT NOT NULL,
	PuestoID INT,
	RolID INT,
	DepartamentoID INT,
	--Creación de las respectivas foreign key
	CONSTRAINT FKSucursalEmpleado FOREIGN KEY (SucursalID) REFERENCES Sucursal(SucursalID),
	CONSTRAINT FKDepartamentoEmpleado FOREIGN KEY (DepartamentoID) REFERENCES Departamento(DepartamentoID),
	CONSTRAINT FKPuestoEmpleado FOREIGN KEY (PuestoID) REFERENCES Puesto(PuestoID),
	CONSTRAINT FKRolEmpleado FOREIGN KEY (RolID) REFERENCES Rol(RolID)
  );

  /*Tabla Cliente*/
  CREATE TABLE Cliente(
	ClienteID INT IDENTITY(1,1) PRIMARY KEY,
	DNI INT NOT NULL,
	Nombre NVARCHAR(255) NOT NULL,
	Apellido NVARCHAR (255) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	Direccion NVARCHAR(255) NOT NULL
  );

  /*Tabla Origen*/
  CREATE TABLE Origen(
	OrigenID INT IDENTITY(1,1) PRIMARY KEY,
	TipoOrigen NVARCHAR(255) NOT NULL
  );

  /*Tabla TipoPago*/
  CREATE TABLE TipoPago(
	TipoPagoID INT IDENTITY(1,1) PRIMARY KEY,
	NombreTipoPago NVARCHAR(255) NOT NULL
  );

  /*Tabla Mensajero*/
  /*Aclaración Importante: Esta tabla solo almacena a los mensajeros externos, los mensajeros internos se almacenan en la tabla empleados con el rol de mensajero*/
  CREATE TABLE Mensajero(
	MensajeroID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre NVARCHAR(255) NOT NULL,
	Apellido NVARCHAR (255) NOT NULL
  );

  /*Tabla Orden*/
  CREATE TABLE Orden (
	OrdenID INT IDENTITY(1,1) PRIMARY KEY,
	HorarioVenta NVARCHAR(255) NOT NULL,
	TotalCompra DECIMAL(10,2) NOT NULL,
	KilometrosRecorrer DECIMAL(10,2) NULL,
	FechaDespacho DATETIME NULL,
	FechaEntrega DATETIME NULL,
	FechaOrdenTomada DATETIME NULL,
	FechaOrdenLista DATETIME NULL,
	EmpleadoID INT NULL,
	SucursalID INT NOT NULL,
	MensajeroID INT NULL,
	ClienteID INT NOT NULL,
	TipoPagoID INT NOT NULL,
	OrigenID INT NOT NULL,
	/*Restricciones*/
	--Restricción que permita que solo se puedan ingresar los tipos de HorarioVenta correctos
	CONSTRAINT CheckHorarioVenta CHECK (HorarioVenta IN ('mañana', 'tarde', 'noche')),
	--Restriccion necesaria ya que las ordenes las realiza un empleado con el rol de Mensajero o Un Mensajero Externo, es decir, no pueden ser entregadas por ambos
	CONSTRAINT CHKOrdenMensajero CHECK ((EmpleadoID IS NOT NULL AND MensajeroID IS NULL) OR (EmpleadoID IS NULL AND MensajeroID IS NOT NULL)),
	--Foreign Key
	CONSTRAINT FKSucursalOrden FOREIGN KEY (SucursalID) REFERENCES Sucursal(SucursalID),
	CONSTRAINT FKEmpleadoOrden FOREIGN KEY (EmpleadoID) REFERENCES Empleado(EmpleadoID),
	CONSTRAINT FKMensajeroOrden FOREIGN KEY (MensajeroID) REFERENCES Mensajero(MensajeroID),
	CONSTRAINT FKClienteOrden FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
	CONSTRAINT FKTipoPagoOrden FOREIGN KEY (TipoPagoID) REFERENCES TipoPago(TipoPagoID),
	CONSTRAINT FKOrigenOrden FOREIGN KEY (OrigenID) REFERENCES Origen(OrigenID),
  );

  /*Tabla DetalleOrden*/
  CREATE TABLE DetalleOrden(
	OrdenID INT NOT NULL,
	ProductoID INT NOT NULL,
	Cantidad INT NOT NULL,
	Precio DECIMAL(10,2) NOT NULL,
	--La Primary Key está formada por el ID de la Orden y del Producto, evitando los duplicados y manteniendo la integridad referencial
	PRIMARY KEY(OrdenID,ProductoID),
	/*Restricciones*/
	--Restricciones para que la cantidad del producto y el precio del detalle no sea 0 ni negativo
	CONSTRAINT CHKCantidad CHECK(Cantidad > 0),
	CONSTRAINT CHKPrecio CHECK(Precio > 0),
	--Foreign Key
	CONSTRAINT FKOrdenDetalleOrden FOREIGN KEY (OrdenID) REFERENCES Orden(OrdenID),
	CONSTRAINT FKProductoDetalleOrden FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
  );
