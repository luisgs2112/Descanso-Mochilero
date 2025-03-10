-- Inserción de datos en la tabla huesped
INSERT INTO huesped (nombre, apellido, nacionalidad, dni_pasaporte, fecha_nacimiento, correo_electronico, telefono, fecha_llegada, fecha_salida, comentarios_necesidades, habitacion_asignada) 
VALUES 
    ('Sarah', 'Pérez', 'Venezolana', 'V123456', '1995-06-15', 'sarahperez@gmail.com', '5551234567', '2025-03-01', '2025-03-10', 'Alergia al mani', 1),
    ('Ana', 'Gómez', 'Venezolana', 'V654321', '1988-09-22', 'anagomez@gmail.com', '666987654', '2025-03-02', '2025-03-11', 'Alérgica al polvo', 2);

-- Inserción de datos en la tabla habitacion
INSERT INTO habitacion (id_habitacion, numero_habitacion, tipo_habitacion, capacidad, descripcion, precio_noche_persona, estado, servicio_incluido, inventario_ropa_cama)
VALUES 
    (1, 15, 'Privada', 2, 'Habitación con baño privado', 50.00, 'Disponible', 'WiFi, Baño privado, TV', '2 sábanas, 2 almohadas'),
    (2, 16, 'Dormitorio', 4, 'Cama en dormitorio compartido', 15.00, 'Ocupada', 'WiFi, Locker, Luz individual', '1 sábana, 1 almohada por cama');

-- Inserción de datos en la tabla reserva
INSERT INTO reserva (id_reserva, id_habitacion, id_huesped, fecha_llegada, fecha_salida, numero_personas, precio_total, estado_reserva)
VALUES 
    (5, 15, 37, '2025-03-01', '2025-03-10', 1, 250.00, 'Confirmada'),
    (6, 16, 38, '2025-03-02', '2025-03-11', 1, 90.00, 'Pendiente');

-- Inserción de datos en la tabla pago
INSERT INTO pago (id_pago, id_reserva, concepto, importe, fecha_pago, metodo_pago, estado_pago)
VALUES 
    (1, 5, 'Alojamiento', 250.00, '2025-03-01 00:00:00', 'Tarjeta de crédito', 'Pagado'),
    (2, 6, 'Alojamiento', 45.00, '2025-03-01 00:00:00', 'Efectivo', 'Pendiente');

-- Inserción de datos en la tabla limpieza
INSERT INTO limpieza (id_limpieza, id_habitacion, id_personal_limpieza, fecha_limpieza, estado_limpieza, observaciones)
VALUES 
    (1, 15, 1, '2025-03-09', 'Completada', 'Todo limpio'),
    (2, 16, 2, '2025-03-10', 'Pendiente', 'Falta reponer sábanas');

-- Inserción de datos en la tabla actividad_tour
INSERT INTO actividad_tour (id_actividad, nombre_actividad, descripcion, fecha_hora, precio, plazas_disponibles)
VALUES 
    (1, 'Tour por la ciudad', 'Recorrido por los principales puntos turísticos', '2025-03-14 10:00:00', 20.00, 10),
    (2, 'Clase de cocina', 'Aprende a cocinar comida local', '2025-03-15 18:00:00', 25.00, 5);

-- Inserción de datos en la tabla reseñas
INSERT INTO reseñas (id_reseña, id_huesped, id_reserva, comentario, puntuacion, fecha_resena)
VALUES 
    (2, 37, 5, 'Excelente servicio y limpieza.', 10, '2025-03-16'),
    (3, 38, 6, 'Buena ubicación, pero ruido por la noche.', 7, '2025-03-19');

-- Inserción de datos en la tabla comunicacion
INSERT INTO comunicacion (id_comunicacion, id_huesped, tipo_comunicacion, contenido, fecha_envio, estado_comunicacion, canal)
VALUES 
    (1, 37, 'Pre-estancia', 'Confirmación de reserva', '2025-02-26 12:00:00', 'Enviado', 'WhatsApp'),
    (2, 38, 'Durante estancia', 'Recordatorio de check-in', '2025-03-06 15:00:00', 'Pendiente', 'Correo electronico');

-- Inserción de datos en la tabla inventario
INSERT INTO inventario (id_suministro, nombre_suministro, cantidad_stock, proveedor, fecha_ultima_compra)
VALUES 
    (1, 'Jabón', 100, 'Proveedor Jabones C.A', '2025-02-15'),
    (2, 'Papel higiénico', 50, 'Proveedor Mayoristas S.A', '2025-02-16');
