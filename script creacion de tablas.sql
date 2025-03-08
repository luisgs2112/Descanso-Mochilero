--Creacion de la tabla Huesped
CREATE TABLE Huesped (
    id_huesped SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(100),
    dni_pasaporte VARCHAR(50) UNIQUE NOT NULL,
    fecha_nacimiento DATE,
    correo_electronico VARCHAR(150) UNIQUE,
    telefono VARCHAR(50),
    fecha_llegada DATE,
    fecha_salida DATE,
    comentarios_necesidades TEXT,
    habitacion_asignada INTEGER
);

--Creacion de la tabla Habitacion
CREATE TABLE Habitacion (
    id_habitacion SERIAL PRIMARY KEY,
    numero_habitacion INTEGER UNIQUE NOT NULL,
    tipo_habitacion VARCHAR(100) NOT NULL,
    capacidad INTEGER NOT NULL CHECK (capacidad > 0),
    descripcion TEXT,
    precio_noche_persona DECIMAL(10,2) NOT NULL CHECK (precio_noche_persona >= 0),
    estado VARCHAR(50) NOT NULL,
    servicio_incluido TEXT,
    inventario_ropa_cama TEXT
);

--Creacion de la tabla Reserva
CREATE TABLE Reserva (
    id_reserva SERIAL PRIMARY KEY,
    id_habitacion INTEGER REFERENCES Habitacion(id_habitacion) ON DELETE CASCADE,
    id_huesped INTEGER REFERENCES Huesped(id_huesped) ON DELETE CASCADE,
    fecha_llegada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    numero_personas INTEGER NOT NULL CHECK (numero_personas > 0),
    precio_total DECIMAL(10,2) NOT NULL CHECK (precio_total >= 0),
    estado_reserva VARCHAR(50) NOT NULL
);

--Creacion de la tabla Actividad y Tour
CREATE TABLE Actividad_Tour (
    id_actividad SERIAL PRIMARY KEY,
    nombre_actividad VARCHAR(255) NOT NULL,
    descripcion TEXT,
    fecha_hora TIMESTAMP NOT NULL,
    precio DECIMAL(10,2) NOT NULL CHECK (precio >= 0),
    plazas_disponibles INTEGER NOT NULL CHECK (plazas_disponibles >= 0)
);

--Creacion de la tabla Pago
CREATE TABLE Pago (
    id_pago SERIAL PRIMARY KEY,
    id_reserva INTEGER REFERENCES Reserva(id_reserva) ON DELETE CASCADE,
    concepto TEXT NOT NULL,
    importe DECIMAL(10,2) NOT NULL CHECK (importe >= 0),
    fecha_pago DATE NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    estado_pago VARCHAR(50) NOT NULL
);

--Creacion de la tabla Limpieza
CREATE TABLE Limpieza (
    id_limpieza SERIAL PRIMARY KEY,
    id_habitacion INTEGER REFERENCES Habitacion(id_habitacion) ON DELETE CASCADE,
    id_personal_limpieza INTEGER NOT NULL,
    fecha_limpieza DATE NOT NULL,
    estado_limpieza VARCHAR(50) NOT NULL,
    observaciones TEXT
);

--Creacion de la tabla Comunicacion con Huespedes
CREATE TABLE Comunicacion_Huesped (
    id_comunicacion SERIAL PRIMARY KEY,
    id_huesped INTEGER REFERENCES Huesped(id_huesped) ON DELETE CASCADE,
    tipo_comunicacion VARCHAR(50) NOT NULL,
    contenido TEXT NOT NULL,
    fecha_envio TIMESTAMP NOT NULL,
    estado_comunicacion VARCHAR(50) NOT NULL,
    canal VARCHAR(50) NOT NULL
);

--Creacion de la tabla Reseñas
CREATE TABLE Reseñas (
    id_reseña SERIAL PRIMARY KEY,
    id_huesped INTEGER REFERENCES Huesped(id_huesped) ON DELETE CASCADE,
    id_reserva INTEGER REFERENCES Reserva(id_reserva) ON DELETE SET NULL,
    comentario TEXT,
    puntuacion INTEGER NOT NULL CHECK (puntuacion BETWEEN 1 AND 5),
    fecha_resena DATE NOT NULL
);

--Creacion de la tabla Inventario
CREATE TABLE Inventario (
    id_suministro SERIAL PRIMARY KEY,
    nombre_suministro VARCHAR(255) NOT NULL,
    cantidad_stock INTEGER NOT NULL CHECK (cantidad_stock >= 0),
    proveedor VARCHAR(255),
    fecha_ultima_compra DATE
);
