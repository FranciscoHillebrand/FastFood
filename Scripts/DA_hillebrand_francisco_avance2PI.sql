/*Seleccionamos la base de datos*/
USE FastFood;

/*Inserción de datos*/
/*Tabla Categoría*/
INSERT INTO Categoria (Nombre) VALUES
('Hamburguesas'),
('Pizzas'),
('Bebidas'),
('Postres'),
('Wraps'),
('Ensaladas'),
('Papas'),
('Complementos'),
('Café'),
('Jugos'),
('Sandwiches'),
('Pollo'),
('Tacos'),
('Sopas'),
('Smoothies'),
('Helados'),
('Combos'),
('Snacks'),
('Desayunos'),
('Especiales');


SELECT * FROM Categoria;--Sentencia para visualizar todos los registros de la tabla categoria

/*Tabla Producto*/
INSERT INTO Producto (Nombre, Precio, CategoriaID) VALUES
('Hamburguesa Clásica', 1200.00, 1),
('Hamburguesa Doble', 1800.00, 1),
('Pizza Mozzarella', 2000.00, 2),
('Pizza Pepperoni', 2200.00, 2),
('Coca-Cola 500ml', 600.00, 3),
('Sprite 500ml', 600.00, 3),
('Brownie', 700.00, 4),
('Cheesecake', 750.00, 4),
('Wrap Pollo', 1300.00, 5),
('Ensalada César', 1100.00, 6),
('Papas Fritas', 500.00, 7),
('Nuggets 8 piezas', 950.00, 8),
('Café Americano', 450.00, 9),
('Jugo Naranja', 500.00, 10),
('Sandwich Jamón y Queso', 800.00, 11),
('Pollo Frito', 1400.00, 12),
('Taco Carne', 750.00, 13),
('Sopa del día', 600.00, 14),
('Smoothie Fresa', 900.00, 15),
('Helado Vainilla', 400.00, 16);


SELECT * FROM Producto;--Sentencia para visualizar todos los registros de la tabla Producto

/*Tabla Sucursal*/
INSERT INTO Sucursal (Nombre, Direccion) VALUES
('Sucursal Centro', 'Av. Principal 123'),
('Sucursal Norte', 'Calle 10 Nº456'),
('Sucursal Sur', 'Boulevard Sur 789'),
('Sucursal Este', 'Ruta 5 km 12'),
('Sucursal Oeste', 'Camino Real 234'),
('Sucursal La Costa', 'Av. del Mar 99'),
('Sucursal Shopping Plaza', 'Mall Level 2'),
('Sucursal Terminal', 'Terminal de Ómnibus'),
('Sucursal Parque', 'Av. del Parque 350'),
('Sucursal Mercado', 'Puesto 24 Mercado Central'),
('Sucursal Industrial', 'Polígono Calle 8'),
('Sucursal San Juan', 'San Juan 1020'),
('Sucursal Córdoba', 'Gral Paz 300'),
('Sucursal Misiones', 'Costanera 2000'),
('Sucursal Rosario', 'Bv Oroño 1200'),
('Sucursal Mendoza', 'San Martín 900'),
('Sucursal Tucumán', '24 de Septiembre 100'),
('Sucursal Salta', 'Belgrano 450'),
('Sucursal Neuquén', 'Roca 670'),
('Sucursal Bahía Blanca', 'Colón 1200');

SELECT * FROM Sucursal;--Sentencia para visualizar todos los registros de la tabla Sucursal

/*Tabla Puesto*/
INSERT INTO Puesto (Nombre) VALUES
('Cajero'),
('Cocinero'),
('Mensajero'),
('Supervisor'),
('Encargado'),
('Limpieza'),
('Atención al Cliente'),
('Administrativo'),
('Auxiliar Cocina'),
('Barista'),
('Jefe de Turno'),
('Repartidor'),
('Marketing'),
('Contador'),
('Logística'),
('Seguridad'),
('Compras'),
('Recursos Humanos'),
('Gerente'),
('Delivery');


SELECT * FROM Puesto;--Sentencia para visualizar todos los registros de la tabla Puesto

/*Tabla Rol*/
INSERT INTO Rol (Nombre) VALUES
('Empleado'),
('Mensajero'),
('Administrador'),
('Supervisor'),
('Gerente'),
('Operador'),
('Cocinero'),
('Cajero'),
('Repartidor'),
('Jefe de Turno'),
('Encargado'),
('Barista'),
('Limpieza'),
('RRHH'),
('Logística'),
('Marketing'),
('Vendedor'),
('Contable'),
('Auditor');

SELECT * FROM Rol;--Sentencia para visualizar todos los registros de la tabla Rol

/*Tabla Departamento*/
INSERT INTO Departamento (Nombre) VALUES
('Cocina'),
('Caja'),
('Delivery'),
('Administración'),
('Recursos Humanos'),
('Compras'),
('Logística'),
('Contabilidad'),
('Marketing'),
('Calidad'),
('Operaciones'),
('Seguridad'),
('Tecnología'),
('Atención Cliente'),
('Mantenimiento'),
('Gerencia'),
('Auditoría'),
('Almacén'),
('Sistemas'),
('Soporte');

SELECT * FROM Departamento;--Sentencia para visualizar todos los registros de la tabla Departamento

/*Tabla Cliente*/
INSERT INTO Cliente (DNI, Nombre, Apellido, FechaNacimiento, Direccion) VALUES
(30111222, 'Juan', 'Pérez', '1990-05-14', 'Calle 123'),
(30111223, 'Ana', 'Gómez', '1985-09-23', 'Calle 124'),
(30111224, 'Pedro', 'López', '1992-01-10', 'Calle 125'),
(30111225, 'Lucía', 'Martínez', '1988-11-30', 'Calle 126'),
(30111226, 'Mario', 'Fernández', '1995-06-05', 'Calle 127'),
(30111227, 'Sofía', 'Díaz', '1999-03-15', 'Calle 128'),
(30111228, 'Diego', 'Torres', '1991-07-19', 'Calle 129'),
(30111229, 'Carla', 'Suárez', '1987-04-20', 'Calle 130'),
(30111230, 'Javier', 'Molina', '1993-12-01', 'Calle 131'),
(30111231, 'Mariana', 'Ríos', '1986-08-25', 'Calle 132'),
(30111232, 'Fernando', 'Castro', '1994-02-11', 'Calle 133'),
(30111233, 'Valeria', 'Acosta', '1997-09-08', 'Calle 134'),
(30111234, 'Pablo', 'Sosa', '1990-06-17', 'Calle 135'),
(30111235, 'Julieta', 'Herrera', '1998-03-22', 'Calle 136'),
(30111236, 'Matías', 'Paz', '1991-12-13', 'Calle 137'),
(30111237, 'Agustina', 'Silva', '1989-10-29', 'Calle 138'),
(30111238, 'Tomás', 'Peralta', '1996-01-04', 'Calle 139'),
(30111239, 'Camila', 'Gutiérrez', '1993-07-14', 'Calle 140'),
(30111240, 'Nicolás', 'Méndez', '1995-11-27', 'Calle 141'),
(30111241, 'Martina', 'Ramos', '1992-04-30', 'Calle 142');

SELECT * FROM Cliente;--Sentencia para visualizar todos los registros de la tabla Cliente

/*Tabla Origen*/
INSERT INTO Origen (TipoOrigen) VALUES
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

SELECT * FROM Origen;--Sentencia para visualizar todos los registros de la tabla Origen

INSERT INTO TipoPago (NombreTipoPago) VALUES
('Efectivo'),
('Tarjeta Débito'),
('Tarjeta Crédito'),
('Mercado Pago'),
('Transferencia'),
('Cheque'),
('QR Bancario'),
('Tarjeta Alimentar'),
('Pago Link'),
('Débito Automático'),
('Billetera Virtual'),
('Vale Empresa'),
('Gift Card'),
('Criptomonedas'),
('PayPal');

SELECT * FROM TipoPago;--Sentencia para visualizar todos los registros de la tabla TipoPago

/*Tabla Mensajero*/
INSERT INTO Mensajero (Nombre, Apellido) VALUES
('Carlos', 'Romero'),
('Miguel', 'Ortiz'),
('Alejandro', 'Morales'),
('Daniel', 'Ruiz'),
('Federico', 'Ramírez'),
('Gustavo', 'Navarro'),
('Oscar', 'Aguilar'),
('Raúl', 'Medina'),
('Ricardo', 'Castillo'),
('Santiago', 'Delgado'),
('Jorge', 'Serrano'),
('Eduardo', 'Vega'),
('Adrián', 'Mendoza'),
('Gabriel', 'Reyes'),
('Lucas', 'Herrera'),
('Hernán', 'Ibarra'),
('Maximiliano', 'Cruz'),
('Matías', 'Ortiz'),
('Ramiro', 'Pereyra'),
('Emiliano', 'Gómez');

SELECT * FROM Mensajero;--Sentencia para visualizar todos los registros de la tabla Mensajero

/*Tabla Empleado*/
INSERT INTO Empleado (Nombre, Apellido, FechaNacimiento, SucursalID, PuestoID, RolID, DepartamentoID) VALUES
('Lucas', 'Martínez', '1990-03-15', 1, 3, 2, 3),
('Martín', 'Fernández', '1988-07-21', 2, 2, 7, 1),
('Laura', 'Gómez', '1992-11-30', 3, 1, 8, 2),
('Sofía', 'Díaz', '1995-05-12', 4, 3, 2, 3),      
('Tomás', 'Pérez', '1991-09-18', 5, 4, 4, 10),
('Agustina', 'Torres', '1994-12-25', 6, 5, 5, 16),
('Nicolás', 'Sosa', '1989-08-02', 7, 6, 13, 15),
('Valentina', 'López', '1996-02-28', 8, 7, 17, 14),
('Franco', 'Ruiz', '1993-04-04', 9, 9, 17, 1),
('Luciana', 'Ramírez', '1990-06-09', 10, 3, 2, 3), 
('Sebastián', 'García', '1992-10-15', 11, 10, 11, 9),
('Camila', 'Molina', '1997-03-07', 12, 3, 2, 3),   
('Federico', 'Ríos', '1987-12-19', 13, 12, 17, 3),
('Julieta', 'Silva', '1991-11-23', 14, 3, 2, 3), 
('Gonzalo', 'Paz', '1994-01-30', 15, 14, 15, 7),
('Milagros', 'Peralta', '1988-09-14', 16, 15, 16, 11),
('Matías', 'Gutiérrez', '1995-07-26', 17, 3, 2, 3),
('Florencia', 'Méndez', '1993-02-17', 18, 16, 17, 6),
('Ramiro', 'Ramos', '1996-05-08', 19, 17, 17, 8),
('Catalina', 'Herrera', '1990-04-29', 20, 18, 17, 5);

SELECT * FROM Empleado;--Sentencia para visualizar todos los registros de la tabla Empleado

/*Tabla Orden*/
INSERT INTO Orden (HorarioVenta, TotalCompra, KilometrosRecorrer, FechaDespacho, FechaEntrega, FechaOrdenTomada, FechaOrdenLista, EmpleadoID, MensajeroID, ClienteID, SucursalID, TipoPagoID, OrigenID) VALUES
('mañana', 3200.00, 5.0, '2025-07-05 09:10', '2025-07-05 09:45', '2025-07-05 09:00', '2025-07-05 09:05', 1, NULL, 1, 1, 1, 1),
('tarde', 1500.00, 2.5, '2025-07-05 14:20', '2025-07-05 14:50', '2025-07-05 14:00', '2025-07-05 14:10', NULL, 1, 2, 2, 2, 2),
('noche', 2200.00, 3.8, '2025-07-05 20:15', '2025-07-05 20:50', '2025-07-05 20:00', '2025-07-05 20:05', 4, NULL, 3, 3, 3, 3),
('mañana', 2800.00, 4.2, '2025-07-06 10:10', '2025-07-06 10:45', '2025-07-06 10:00', '2025-07-06 10:05', NULL, 2, 4, 4, 4, 4),
('tarde', 1800.00, 1.5, '2025-07-06 13:50', '2025-07-06 14:15', '2025-07-06 13:40', '2025-07-06 13:45', 10, NULL, 5, 5, 5, 5),
('noche', 2500.00, 3.0, '2025-07-06 19:20', '2025-07-06 19:50', '2025-07-06 19:10', '2025-07-06 19:15', NULL, 3, 6, 6, 6, 6),
('mañana', 1950.00, 2.0, '2025-07-07 09:30', '2025-07-07 09:55', '2025-07-07 09:15', '2025-07-07 09:20', 12, NULL, 7, 7, 7, 7),
('tarde', 3000.00, 5.5, '2025-07-07 14:45', '2025-07-07 15:20', '2025-07-07 14:30', '2025-07-07 14:35', NULL, 4, 8, 8, 8, 8),
('noche', 1700.00, 2.8, '2025-07-07 20:00', '2025-07-07 20:35', '2025-07-07 19:50', '2025-07-07 19:55', 14, NULL, 9, 9, 9, 9),
('mañana', 2100.00, 3.5, '2025-07-08 09:20', '2025-07-08 09:50', '2025-07-08 09:05', '2025-07-08 09:10', NULL, 5, 10, 10, 10, 10),
('mañana', 1200.00, 3.0, '2025-07-10 09:00', '2025-07-10 09:30', '2025-07-10 08:50', '2025-07-10 08:55', 1, NULL, 1, 1, 1, 1),
('tarde', 1500.00, 4.2, '2025-07-10 15:00', '2025-07-10 15:30', '2025-07-10 14:50', '2025-07-10 14:55', NULL, 1, 2, 1, 2, 2),
('noche', 1800.00, 2.8, '2025-07-10 20:00', '2025-07-10 20:30', '2025-07-10 19:50', '2025-07-10 19:55', 2, NULL, 3, 2, 3, 3),
('mañana', 1100.00, 3.5, '2025-07-11 09:30', '2025-07-11 10:00', '2025-07-11 09:20', '2025-07-11 09:25', NULL, 2, 4, 2, 4, 4),
('tarde', 2000.00, 5.0, '2025-07-11 15:10', '2025-07-11 15:40', '2025-07-11 15:00', '2025-07-11 15:05', 3, NULL, 5, 3, 1, 1),
('noche', 2200.00, 4.7, '2025-07-11 20:20', '2025-07-11 20:50', '2025-07-11 20:10', '2025-07-11 20:15', NULL, 3, 6, 3, 2, 2),
('mañana', 1300.00, 3.3, '2025-07-12 09:10', '2025-07-12 09:40', '2025-07-12 09:00', '2025-07-12 09:05', 4, NULL, 7, 4, 3, 3),
('tarde', 1700.00, 4.1, '2022-07-12 15:30', '2022-07-12 16:00', '2022-07-12 15:20', '2022-07-12 15:25', NULL, 4, 8, 4, 4, 4),
('noche', 1400.00, 2.9, '2022-07-12 20:00', '2022-07-12 20:30', '2022-07-12 19:50', '2022-07-12 19:55', 5, NULL, 9, 5, 1, 1),
('mañana', 1600.00, 3.7, '2022-07-13 09:20', '2022-07-13 09:50', '2022-07-13 09:10', '2022-07-13 09:15', NULL, 5, 10, 5, 2, 2),
('tarde', 1900.00, 4.0, '2022-07-13 15:40', '2022-07-13 16:10', '2022-07-13 15:30', '2022-07-13 15:35', 6, NULL, 11, 6, 3, 3),
('noche', 2100.00, 4.8, '2022-07-13 20:10', '2022-07-13 20:40', '2022-07-13 20:00', '2022-07-13 20:05', NULL, 6, 12, 6, 4, 4),
('mañana', 1700.00, 3.1, '2022-07-14 09:10', '2022-07-14 09:40', '2022-07-14 09:00', '2022-07-14 09:05', 7, NULL, 13, 7, 1, 1),
('tarde', 1500.00, 3.9, '2022-07-14 15:20', '2022-07-14 15:50', '2022-07-14 15:10', '2022-07-14 15:15', NULL, 7, 14, 7, 2, 2),
('noche', 1800.00, 4.6, '2022-07-14 20:30', '2022-07-14 21:00', '2022-07-14 20:20', '2022-07-14 20:25', 8, NULL, 15, 8, 3, 3),
('mañana', 1400.00, 3.2, '2022-07-15 09:30', '2022-07-15 10:00', '2022-07-15 09:20', '2022-07-15 09:25', NULL, 8, 16, 8, 4, 4),
('tarde', 1600.00, 4.4, '2022-07-15 15:50', '2022-07-15 16:20', '2022-07-15 15:40', '2022-07-15 15:45', 9, NULL, 17, 9, 1, 1),
('noche', 2000.00, 5.1, '2022-07-15 20:50', '2022-07-15 21:20', '2022-07-15 20:40', '2022-07-15 20:45', NULL, 9, 18, 9, 2, 2),
('mañana', 1900.00, 3.6, '2022-07-16 09:40', '2022-07-16 10:10', '2022-07-16 09:30', '2022-07-16 09:35', 10, NULL, 19, 10, 3, 3),
('tarde', 2200.00, 4.9, '2022-07-16 15:10', '2022-07-16 15:40', '2022-07-16 15:00', '2022-07-16 15:05', NULL, 10, 20, 10, 4, 4);

SELECT * FROM Orden;--Sentencia para visualizar todos los registros de la tabla Orden

/*Tabla DetalleOrden*/
INSERT INTO DetalleOrden (OrdenID, ProductoID, Cantidad, Precio) VALUES
(1, 1, 2, 1200.00),
(1, 5, 1, 600.00),
(2, 4, 1, 2200.00),
(3, 2, 1, 1800.00),
(3, 6, 2, 600.00),
(4, 9, 2, 1300.00),
(4, 11, 1, 500.00),
(5, 12, 2, 950.00),
(6, 7, 3, 700.00),
(6, 3, 1, 2000.00),
(7, 13, 2, 450.00),
(8, 10, 1, 1100.00),
(8, 15, 2, 800.00),
(9, 14, 2, 500.00),
(9, 16, 1, 1400.00),
(10, 17, 3, 750.00),
(10, 20, 1, 400.00),
(1, 6, 2, 600.00), 
(1, 2, 1, 600.00),
(2, 3, 1, 1000.00), 
(2, 6, 2, 250.00),
(3, 5, 1, 1200.00), 
(3, 8, 2, 300.00),
(4, 7, 2, 550.00), 
(4, 8, 1, 550.00),
(5, 9, 1, 1400.00), 
(5, 10, 1, 200.00),
(6, 2, 1, 1800.00), 
(6, 9, 2, 200.00),
(7, 4, 1, 1000.00), 
(7, 5, 2, 150.00),
(8, 6, 1, 1300.00), 
(8, 7, 1, 400.00),
(9, 8, 2, 700.00),
(9, 9, 1, 700.00),
(10, 10, 1, 1600.00), 
(10, 1, 1, 200.00), 
(11, 2, 1, 1700.00), 
(11, 3, 2, 100.00),
(12, 4, 2, 950.00), 
(12, 5, 1, 550.00),
(13, 6, 1, 1800.00),
(13, 7, 1, 100.00),
(14, 8, 1, 1200.00), 
(14, 9, 2, 100.00),
(15, 10, 2, 800.00), 
(15, 1, 1, 800.00),
(16, 2, 2, 900.00), 
(16, 3, 1, 200.00),
(17, 4, 1, 1700.00),
(17, 5, 2, 200.00),
(18, 6, 2, 1000.00), 
(18, 7, 1, 1000.00),
(19, 8, 2, 950.00), 
(19, 9, 1, 200.00),
(20, 10, 1, 2000.00),
(20, 1, 1, 200.00);

SELECT * FROM DetalleOrden;--Sentencia para visualizar todos los registros de la tabla DetalleOrden

/*Sentencias UPDATE*/
/*Sentencias de Ejemplo Proporcionadas en la lecture*/
-- Aumentar el precio de todos los productos en la categoría 1
UPDATE Producto SET Precio = Precio + 1 WHERE CategoriaID = 1;

-- Actualizar la dirección de una sucursal específica
UPDATE Sucursal SET Direccion = '1234 New Address St' WHERE SucursalID = 1;

--Actualizar el nombre del Puesto con el ID número 2
UPDATE Puesto SET Nombre = 'Cocinero Principal' WHERE PuestoID = 2;

--Actualizar el nombre del Tipo de Pago con el ID número 5
UPDATE TipoPago SET NombreTipoPago = 'Transferencia Bancaria' WHERE TipoPagoID = 5;

--Actualizar el nombre del Cliente con el ID número 1
UPDATE Cliente SET Nombre = 'Juan Carlos' WHERE ClienteID = 1;

--Actualizar el Rol del Empleado con el ID número 4
UPDATE Empleado SET RolID = 5 WHERE EmpleadoID = 4;

--Actualizar el Horario de Venta de la Orden con el ID número 1
UPDATE Orden SET HorarioVenta = 'mañana' WHERE OrdenID = 1;

--Actualizar el Tipo de Origen del Origen con el ID número 1
UPDATE Origen SET TipoOrigen = 'Instagram' WHERE OrigenID = 1;

/*Sentencias DELETE*/
/*Sentencias de Ejemplo Proporcionadas en la lecture*/

/*Eliminar una orden específica
Imaginemos que quieres eliminar una orden específica, 
por ejemplo, la orden con OrdenID = 10. 
Esta operación eliminaría la orden junto con sus detalles asociados */

DELETE FROM DetalleOrden WHERE OrdenID = 11;
DELETE FROM Orden WHERE OrdenID = 11;

/*Eliminar todos los productos de una categoría específica
Si decides dejar de ofrecer todos los "Postres" 
(supongamos que Categorias.CategoriaID = 2 para "Postres"), 
podrías querer eliminar todos los productos asociados a esa categoría.*/

/*
	Si queremos eliminar un producto, se debería eliminar dicho producto de los detalle de la orden
	Hacer esto puede que no sea recomendable, ya que se perderia información sobre esa orden.
	Así que antes de eliminar un producto, crearía un atributo en la tabla producto, que sea un booleano y almacene la existencia o no de ese producto.
	Entonces si el producto ya no existe, este atributo sera FALSO.
*/
/*
	Si quiero eliminar el producto, la sentencia sería la siguiente.
	Primero elimino dicho producto de los detalle de la orden, y luego elimino el producto
*/

DELETE FROM DetalleOrden WHERE ProductoID IN (SELECT ProductoID FROM Producto  WHERE CategoriaID = 2);
DELETE FROM Producto WHERE CategoriaID = 2;


/*Eliminar empleados de una sucursal que cerró
Si una sucursal cierra, por ejemplo, 
SucursalID = 10 (Sucursal Bosque), 
podrías necesitar eliminar a todos los empleados asociados con esa sucursal.*/

/*
	Si queremos eliminar un empleado, se debería eliminar el EmpleadoID de todas las ordenes y sus detalles
	Hacer esto puede que no sea recomendable, ya que se perderia información sobre esa orden.
	Así que antes de eliminar un empleado, crearía un atributo en la tabla empleado, que sea un booleano y almacene la existencia o no de ese empleado.
	Entonces si el empleado ya no existe, este atributo sera FALSO.
*/

/*
	Si quiero eliminar el empleado, la sentencia sería la siguiente.
	Primero elimino los detalles de la orden que corresponde al empleado que quiero eliminar.
	Luego elimino la orden.
	Y por último al empleado.
*/
DELETE FROM DetalleOrden WHERE OrdenID IN (SELECT OrdenID FROM Orden WHERE EmpleadoID IN (SELECT EmpleadoID FROM Empleado WHERE SucursalID = 10));
DELETE FROM Orden WHERE EmpleadoID IN (SELECT EmpleadoID FROM Empleado WHERE SucursalID = 10);
DELETE FROM Empleado WHERE SucursalID = 10;

/*Eliminar los registros del Mensajero con ID 1*/
/*Primero debería eliminar las órdenes que entregó*/
DELETE FROM DetalleOrden WHERE OrdenID IN (SELECT OrdenID FROM Orden WHERE MensajeroID IN (SELECT MensajeroID FROM Orden WHERE MensajeroID = 1));
DELETE FROM Orden WHERE MensajeroID IN (SELECT MensajeroID FROM Orden WHERE MensajeroID = 1);
DELETE FROM Mensajero WHERE MensajeroID = 1;

/*Eliminarel Cliente con ID 1*/
/*Primero debería eliminar las órdenes que pidió*/
DELETE FROM DetalleOrden WHERE OrdenID IN (SELECT OrdenID FROM Orden WHERE ClienteID IN (SELECT ClienteID FROM Orden WHERE ClienteID = 1));
DELETE FROM Orden WHERE ClienteID IN (SELECT ClienteID FROM Orden WHERE ClienteID = 1);
DELETE FROM Cliente WHERE ClienteID = 1;

/*CONSULTAS*/

/*Registros únicos*/
/*Pregunta: ¿Cuál es la cantidad total de registros únicos en la tabla de órdenes?*/
SELECT COUNT(DISTINCT OrdenID) AS CantidadOrdenes 
FROM Orden;

/*Empleados por departamento*/
/*Pregunta: ¿Cuántos empleados existen en cada departamento?*/
SELECT Dep.Nombre AS NombreDepartamento, COUNT(Dep.Nombre) AS CantidadEmpleados 
FROM Empleado Emp 
INNER JOIN Departamento Dep ON Emp.DepartamentoID = Dep.DepartamentoID 
GROUP BY Dep.Nombre;

/*Productos por categoría*/
/*Pregunta: ¿Cuántos productos hay por código de categoría?*/
SELECT CategoriaID,COUNT(ProductoID) AS CantidadProducto 
FROM Producto 
GROUP BY CategoriaID;

/*Importación de clientes*/
/*Pregunta: ¿Cuántos clientes se han importado a la tabla de clientes?*/
/*Cuento con la columna ClienteID para ignorar los nulos*/
SELECT COUNT(ClienteID) AS Clientes
FROM Cliente; 

/*Análisis de desempeño de sucursales*/
/*Pregunta: ¿Cuáles son las sucursales con un promedio de Facturación/Ingresos superior a 1000.00 
y que minimizan sus costos en base al promedio de kilómetros recorridos de todas de sus entregas gestionadas? 
Para un mejor relevamiento, ordene el listado por el Promedio Km Recorridos.*/
SELECT Suc.Nombre, AVG(Ord.TotalCompra) AS Facturacion, AVG(Ord.KilometrosRecorrer) AS KilometrosRecorridos, ( AVG(Ord.TotalCompra)/AVG(Ord.KilometrosRecorrer)) AS GananciaPorKilometro
FROM Orden Ord
INNER JOIN Sucursal Suc
ON Ord.SucursalID = Suc.SucursalID
GROUP BY Suc.Nombre
HAVING AVG(Ord.TotalCompra) > 1000 
ORDER BY KilometrosRecorridos DESC;

/*
	Con la columna GananciaPorKilometro intento mostrar el ratio de ganancia de cada Sucursal por los kilometros que han recorrido las órdenes realizadas
	Vemos que las sucursales que menos kilometros recorren, son las que más ganan.
*/
