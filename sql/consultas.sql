-- Ejercicio 2

SELECT
t.ciudad,
SUM(v.valor)
FROM tiendas as t
INNER JOIN ventas as v
ON t.tienda_id = v.tienda_id
GROUP BY t.ciudad
ORDER BY SUM(v.valor) DESC

-- Ejercicio 3
-- Obtenga el Top 10 de productos con mayores ventas.
-- Resultado esperado:
--  Producto
--  Categoría
--  Ventas

SELECT
p.nombre_producto,
p.categoria,
SUM(v.valor) AS venta_total
FROM productos as p
INNER JOIN ventas as v
ON p.producto_id = v.producto_id
GROUP BY p.nombre_producto, p.categoria
ORDER BY venta_total DESC
LIMIT 10

-- Ejercicio 4
-- Calcule las ventas totales por año y mes.
-- Resultado esperado:
--  Año
--  Mes
--  Ventas Totales

SELECT
    EXTRACT(YEAR FROM fecha) AS ano,
    EXTRACT(MONTH FROM fecha) AS mes,
    SUM(valor) AS ventas_totales
FROM ventas
GROUP BY ano, mes
ORDER BY ano, mes;

-- Ejercicio 5
-- Identifique las tiendas que presentan mayores ventas.
-- Resultado esperado:
--  Tienda
--  Ciudad
--  Ventas

SELECT
t.tienda_id,
t.ciudad,
SUM(v.valor) AS Ventas
FROM tiendas as t
INNER JOIN ventas as v
ON t.tienda_id = v.tienda_id
GROUP BY t.tienda_id, t.ciudad
ORDER BY Ventas DESC

--Ejercicio 6
-- Calcule la participación de cada categoría sobre las ventas totales.
-- Resultado esperado:
--  Categoría
--  Ventas
--  Participación %
SELECT
p.categoria,
SUM(v.valor),
ROUND(
        SUM(v.valor) * 100.0 /
        (SELECT SUM(valor) FROM ventas),
        2
    ) AS participacion_porcentaje
FROM ventas v
INNER JOIN productos p
    ON v.producto_id = p.producto_id
GROUP BY p.categoria
ORDER BY ventas_totales DESC;

