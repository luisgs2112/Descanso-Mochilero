                                      --Consultas avanzadas --

-- 1. INNER JOIN: Obtener todas las reservas con informacion del huésped
SELECT r.id_reserva, h.nombre, h.apellido, r.fecha_llegada, r.fecha_salida, r.estado_reserva
FROM reserva r
INNER JOIN huesped h ON r.id_huesped = h.id_huesped;

-- 2. LEFT JOIN: Listar todas las habitaciones y sus reservas (si existen)
SELECT hab.numero_habitacion, hab.tipo_habitacion, res.id_reserva, res.estado_reserva
FROM habitacion hab
LEFT JOIN reserva res ON hab.id_habitacion = res.id_habitacion;

-- 3. RIGHT JOIN: Mostrar todos los huespedes y sus reservas (si tienen)
SELECT h.nombre, h.apellido, r.id_reserva, r.estado_reserva
FROM reserva r
RIGHT JOIN huesped h ON r.id_huesped = h.id_huesped;

-- 4. Subconsulta: Obtener huespedes que hayan realizado pagos mayores al promedio de todos los pagos
SELECT nombre, apellido FROM huesped
WHERE id_huesped IN (
    SELECT id_huesped FROM pago
    WHERE importe > (SELECT AVG(importe) FROM pago)
);

-- 5. Subconsulta: Obtener la reserva con el mayor precio total
SELECT * FROM reserva
WHERE precio_total = (SELECT MAX(precio_total) FROM reserva);

-- 6. Expresión correlacionada: Obtener la última reserva de cada huesped
SELECT r.* FROM reserva r
WHERE fecha_llegada = (
    SELECT MAX(fecha_llegada) FROM reserva
    WHERE id_huesped = r.id_huesped
);

-- 7. Vista materializada: Crear una vista con el resumen de ingresos por metodo de pago
CREATE MATERIALIZED VIEW resumen_ingresos AS
SELECT metodo_pago, SUM(importe) AS total_ingresos
FROM pago
GROUP BY metodo_pago;

-- 8. Refrescar la vista materializada cuando sea necesario
REFRESH MATERIALIZED VIEW resumen_ingresos;
