/*Seleccionamos la base de datos*/
USE FastFood;

/*1.Total de ventas globales
Pregunta: ¿Cuál es el total de ventas (TotalCompra) a nivel global?*/
SELECT SUM(TotalCompra) AS TotalVentas 
FROM Orden;

/*2.Promedio de precios de productos por categoría
Pregunta: ¿Cuál es el precio promedio de los productos dentro de cada categoría?*/
SELECT Cat.Nombre AS Categoria, AVG(Pro.Precio) AS PrecioPromedio 
FROM Producto Pro
INNER JOIN Categoria Cat
ON Pro.CategoriaID = Cat.CategoriaID
GROUP BY Cat.Nombre
ORDER BY PrecioPromedio DESC;

/*3.Orden mínima y máxima por sucursal
Pregunta: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?*/
SELECT Suc.Nombre AS Sucursal, MIN(Ord.TotalCompra) AS OrdenMinima, MAX(Ord.TotalCompra) AS OrdenMaxima
FROM Orden Ord
INNER JOIN Sucursal Suc
ON Ord.SucursalID = Suc.SucursalID
GROUP BY Suc.Nombre;

/*4. Mayor número de kilómetros recorridos para entrega
Pregunta: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?*/
SELECT MAX(KilometrosRecorrer) AS MáximoKilometrosRecorridos
FROM Orden;

/*5.Promedio de cantidad de productos por orden
Pregunta: ¿Cuál es la cantidad promedio de productos por orden?*/
SELECT OrdenID, AVG(Cantidad) AS CantidadPromedioProductos
FROM DetalleOrden
GROUP BY OrdenID;

/*6.Total de ventas por tipo de pago
Pregunta: ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?*/
SELECT Tdp.NombreTipoPago AS TipoPago, SUM(Ord.TotalCompra) AS TotalCompra
FROM Orden Ord
INNER JOIN TipoPago Tdp
ON Ord.TipoPagoID = Tdp.TipoPagoID
GROUP BY Tdp.NombreTipoPago
ORDER BY TotalCompra DESC;

/*7.Sucursal con la venta promedio más alta
Pregunta: ¿Cuál Sucursal tiene el ingreso promedio más alto?*/
SELECT TOP 1 Suc.Nombre AS Sucursal, AVG(Ord.TotalCompra) AS IngresosPromedios
FROM Orden Ord
INNER JOIN Sucursal Suc
ON Ord.SucursalID = Suc.SucursalID
GROUP BY Suc.Nombre 
ORDER BY IngresosPromedios DESC;

/*8.Sucursal con la mayor cantidad de ventas por encima de un umbral
Pregunta: ¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?*/
SELECT Suc.Nombre AS Sucursal, SUM(Ord.TotalCompra) AS VentasTotales
FROM Orden Ord
INNER JOIN Sucursal Suc
ON Ord.SucursalID = Suc.SucursalID
GROUP BY Suc.Nombre
HAVING SUM(Ord.TotalCompra) > 1000;

/*9.Comparación de ventas promedio antes y después de una fecha específica
Pregunta: ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?*/
SELECT DISTINCT (SELECT AVG(TotalCompra) FROM Orden WHERE FechaOrdenTomada < '2023-07-01') AS ANTES, 
				(SELECT AVG(TotalCompra) FROM Orden WHERE FechaOrdenTomada > '2023-07-01') AS DESPUES
FROM Orden;

/*10.Análisis de actividad de ventas por horario
Pregunta: ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, 
cuál es el ingreso promedio de estas ventas, 
y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?*/
SELECT HorarioVenta, COUNT(OrdenID) AS CantidadVentas, AVG(TotalCompra) AS IngresoPromedio, MAX(TotalCompra) AS ImporteMaximo
FROM Orden
GROUP BY HorarioVenta;