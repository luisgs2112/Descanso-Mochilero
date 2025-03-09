-- 1. Eliminar una reserva específica
DELETE FROM reserva
WHERE id_reserva = 5;

-- 2. Eliminar un huésped específico
DELETE FROM huesped
WHERE id_huesped = 37;

-- 3. Eliminar una habitación específica (asegurándose de que no esté ocupada por reservas)
DELETE FROM habitacion
WHERE id_habitacion = 3 
AND id_habitacion NOT IN (SELECT id_habitacion FROM reserva);