-- Consultas con WHERE

-- 1. Obtener huéspedes de nacionalidad "Venezolana"
SELECT * FROM huesped WHERE nacionalidad = 'Venezolana';

-- 2. Listar habitaciones disponibles
SELECT * FROM habitacion WHERE estado = 'Disponible';

-- 3. Buscar reservas con estado "Pendiente"
SELECT * FROM reserva WHERE estado_reserva = 'Pendiente';

-- Ordenamiento con ORDER BY

-- 4. Listar huéspedes ordenados alfabéticamente por apellido
SELECT * FROM huesped ORDER BY apellido ASC;

-- 5. Listar pagos ordenados por fecha más reciente primero
SELECT * FROM pago ORDER BY fecha_pago DESC;

-- Agrupación con GROUP BY

-- 6. Contar cuántos huéspedes hay por nacionalidad
SELECT nacionalidad, COUNT(*) AS total_huespedes
FROM huesped
GROUP BY nacionalidad;

-- 7. Calcular el ingreso total por cada método de pago
SELECT metodo_pago, SUM(importe) AS total_ingresos
FROM pago
GROUP BY metodo_pago;

-- Filtrar datos agregados con HAVING

-- 8. Mostrar solo nacionalidades con más de 2 huéspedes registrados
SELECT nacionalidad, COUNT(*) AS total_huespedes
FROM huesped
GROUP BY nacionalidad
HAVING COUNT(*) > 2;

-- 9. Mostrar solo los métodos de pago que han generado más de $100 en ingresos
SELECT metodo_pago, SUM(importe) AS total_ingresos
FROM pago
GROUP BY metodo_pago
HAVING SUM(importe) > 100;

-- Funciones de agregación

-- 10. Obtener la cantidad total de reservas
SELECT COUNT(*) AS total_reservas FROM reserva;

-- 11. Obtener el precio promedio de las habitaciones
SELECT AVG(precio_noche_persona) AS precio_promedio
FROM habitacion;

-- 12. Obtener el total de ingresos generados por pagos confirmados
SELECT SUM(importe) AS total_ingresos
FROM pago
WHERE estado_pago = 'Pagado';
