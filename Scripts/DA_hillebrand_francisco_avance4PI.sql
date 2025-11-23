/*Seleccionamos la base de datos*/
USE FastFood;

/*1.Listar todos los productos y sus categorías
Pregunta: ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?*/
SELECT Pro.Nombre AS Producto, Cat.Nombre AS Categoria
FROM Producto Pro
LEFT JOIN Categoria Cat
ON Pro.CategoriaID = Cat.CategoriaID;

/*2.Obtener empleados y su sucursal asignada
Pregunta: ¿Cómo puedo saber a qué sucursal está asignado cada empleado?*/
SELECT CONCAT(Emp.Nombre,' ',Emp.Apellido) AS Empleado, Suc.Nombre AS Sucursal
FROM Empleado Emp
LEFT JOIN Sucursal Suc
ON Emp.SucursalID = Suc.SucursalID;

/*Respuesta utilizando un procedimiento
CREATE PROCEDURE EmpleadoSucursal
	@EmpleadoID INT
AS
BEGIN
	SELECT CONCAT(Emp.Nombre,' ',Emp.Apellido) AS Empleado, Suc.Nombre AS Sucursal
	FROM Empleado Emp
	LEFT JOIN Sucursal Suc
	ON Emp.SucursalID = Suc.SucursalID
	WHERE Emp.EmpleadoID = @EmpleadoID
END;

EXEC EmpleadoSucursal @EmpleadoID = 1; --Llamada al procedimiento*/

/*3.Identificar productos sin categoría asignada
Pregunta: ¿Existen productos que no tienen una categoría asignada?*/
SELECT Pro.Nombre AS Producto, Cat.Nombre AS Categoria
FROM Producto Pro
LEFT JOIN Categoria Cat
ON Pro.CategoriaID = Cat.CategoriaID
WHERE Pro.CategoriaID IS NULL;

/*4.Detalle completo de órdenes
Pregunta: ¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo el Nombre del cliente, 
Nombre del empleado que tomó la orden, y Nombre del mensajero que la entregó?*/
/*Recordar: La tabla Mensajero, solo almacena a los mensajeros externos, los empleados con el rol de mensajero, se almacenan en la tabla Empleado*/
SELECT Ord.OrdenID,
	   Ord.TotalCompra,
	   Ord.KilometrosRecorrer,
	   Ord.FechaDespacho,
	   Ord.FechaEntrega,
	   Ord.FechaOrdenTomada,
	   Ord.FechaOrdenLista,
	   CONCAT(Emp.Nombre,' ',Emp.Apellido) AS Empleado,
	   Ord.SucursalID,
	   CONCAT(Men.Nombre,' ',Men.Apellido) AS MensajeroExterno,
	   CONCAT(Cli.Nombre,' ',Cli.Apellido) AS Cliente,
	   Ord.TipoPagoID,
	   Ord.OrigenID
FROM Orden Ord
LEFT JOIN Empleado Emp -- Aclaro nuevamente que hay casos en los que una orden está relacionado a un mensajero externo y no a un empleado con rol de mensajero, por eso hago un left join
ON Ord.EmpleadoID = Emp.EmpleadoID
LEFT JOIN Mensajero Men -- Aclaro nuevamente que hay casos en los que una orden está relacionado a un empelado y no a un mensajero externo, por eso hago un left join
ON Ord.MensajeroID = Men.MensajeroID
INNER JOIN Cliente Cli
ON Ord.ClienteID = Cli.ClienteID
ORDER BY Ord.TotalCompra DESC;

/*5.Productos vendidos por sucursal
Pregunta: ¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?*/
SELECT 
    Suc.Nombre AS Sucursal,
    Cat.Nombre AS Categoria,
    SUM(DetOrd.Cantidad) AS CantidadVendida
FROM Orden Ord
INNER JOIN Sucursal Suc ON Ord.SucursalID = Suc.SucursalID
INNER JOIN DetalleOrden DetOrd ON Ord.OrdenID = DetOrd.OrdenID
INNER JOIN Producto Prod ON DetOrd.ProductoID = Prod.ProductoID
INNER JOIN Categoria Cat ON Prod.CategoriaID = Cat.CategoriaID
GROUP BY Suc.Nombre, Cat.Nombre
ORDER BY Suc.Nombre, Cat.Nombre;


/*CONSULTAS AVANZADAS*/
/*6.Eficiencia de los mensajeros: 
¿Cuál es el tiempo promedio desde el despacho hasta la entrega 
de los pedidos gestionados por todo el equipo de mensajería?*/
SELECT 
	AVG(DATEDIFF(MINUTE, FechaDespacho, FechaEntrega)) AS TiempoPromedioMinutos
FROM Orden
WHERE (EmpleadoID IS NOT NULL OR MensajeroID IS NOT NULL)-- Necesario para asegurarnos que haya sido despachado por alguien
  AND FechaDespacho IS NOT NULL
  AND FechaEntrega IS NOT NULL;
--Respuesta agrupada por OrdenID, para ver el tiempo promedio para cada orden
/*SELECT 
    OrdenID,
	AVG(DATEDIFF(MINUTE, FechaDespacho, FechaEntrega)) AS TiempoPromedioMinutos
FROM Orden
WHERE (EmpleadoID IS NOT NULL OR MensajeroID IS NOT NULL)
  AND FechaDespacho IS NOT NULL
  AND FechaEntrega IS NOT NULL
GROUP BY OrdenID;*/

/*7.Análisis de Ventas por Origen de Orden: 
¿Qué canal de ventas genera más ingresos?*/
SELECT 
    Ogn.TipoOrigen AS Canal,
    SUM(Ord.TotalCompra) AS TotalIngresos
FROM Orden Ord
INNER JOIN Origen Ogn ON Ord.OrigenID = Ogn.OrigenID
GROUP BY Ogn.TipoOrigen
ORDER BY TotalIngresos DESC;

/*8.Productividad de los Empleados:
¿Cuál es el nivel de ingreso generado por Empleado?*/
SELECT 
    CONCAT(Emp.Nombre,' ', Emp.Apellido) AS Empleado,
    ISNULL(SUM(Ord.TotalCompra),0) AS TotalIngresosGenerados,
	Rol.Nombre AS Rol
FROM Orden Ord
RIGHT JOIN Empleado Emp 
ON Ord.EmpleadoID = Emp.EmpleadoID
INNER JOIN Rol 
ON Emp.RolID = Rol.RolID
GROUP BY Emp.Nombre, Emp.Apellido, Rol.Nombre
ORDER BY TotalIngresosGenerados DESC;

/*9.Análisis de Demanda por Horario y Día: 
¿Cómo varía la demanda de productos a lo largo del día? 
NOTA: Esta consulta no puede ser implementada sin una definición clara del horario (mañana, tarde, noche) en la base de datos existente. 
Asumiremos que HorarioVenta refleja esta información correctamente.*/
SELECT 
    HorarioVenta,
    COUNT(Ord.OrdenID) AS CantidadPedidos,
    SUM(Ord.TotalCompra) AS TotalIngresos,
	SUM(Det.Cantidad) AS Demanda
FROM Orden Ord
INNER JOIN DetalleOrden Det
ON Ord.OrdenID = Det.OrdenID
GROUP BY HorarioVenta
ORDER BY HorarioVenta;

/*10.Comparación de Ventas Mensuales:
¿Cuál es la tendencia de los ingresos generados en cada periodo mensual?*/
--Para responder, tuve en cuenta las ordenes presenciales, drive thru y las entregas a domicilio. Por eso tome FechaEntrega y FechaOrdenTomada 
SELECT 
    FORMAT(
      ISNULL(FechaEntrega, FechaOrdenTomada), 
      'yyyy-MM'
    ) AS Periodo,
    SUM(TotalCompra) AS TotalIngresos
FROM Orden
GROUP BY FORMAT(ISNULL(FechaEntrega, FechaOrdenTomada), 'yyyy-MM')
ORDER BY Periodo;
