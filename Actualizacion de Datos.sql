--Actualización de datos --

-- Actualizar el estado de la habitación a 'Ocupada'
UPDATE habitacion
SET estado = 'Ocupado'
WHERE numero_habitacion = 1;

-- Actualizar Nacionalidad 
UPDATE huesped
SET nacionalidad = 'Venezolano'
WHERE id_huesped = 1;