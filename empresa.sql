-- Crear la base de datos "empresa"
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Crear la tabla "sucursales"
CREATE TABLE sucursales (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    puesto VARCHAR(100) NOT NULL,
    dias_semana VARCHAR(100) NOT NULL,
    turno VARCHAR(100) NOT NULL
);

-- Crear la tabla "empleados"
CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad INT CHECK (edad BETWEEN 18 AND 120),
    id_sucursal INT NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    turno VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES sucursales (id_sucursal)
);

-- Crear la tabla "videojuegos"
CREATE TABLE videojuegos (
    id_videojuego INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    clasificacion_edad VARCHAR(10) NOT NULL,
    disponibilidad BOOLEAN NOT NULL,
    id_sucursal INT NOT NULL,
    FOREIGN KEY (id_sucursal) REFERENCES sucursales (id_sucursal)
);

-- Crear la tabla "clientes"
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Crear la tabla "alquileres"
CREATE TABLE alquileres (
    id_alquiler INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_videojuego INT NOT NULL,
    fecha_alquiler DATE NOT NULL,
    fecha_devolucion DATE,
    id_sucursal INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_videojuego) REFERENCES videojuegos (id_videojuego),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales (id_sucursal)
);


-- INSERT INTO sucursal
INSERT INTO sucursales (nombre, direccion, puesto, dias_semana, turno)
VALUES
    ('Sucursal 1', 'Av. Corrientes 2154, Buenos Aires', 'Gerente, Asistente, Cajero, Vendedor', 'LUNES-VIERNES', 'MAÑANA, TARDE, NOCHE'),
    ('Sucursal 2', 'Av. Paseo Colon 556, Buenos Aires', 'Gerente, Asistente, Cajero, Vendedor', 'LUNES-VIERNES', 'MAÑANA, TARDE, NOCHE'),
    ('Sucursal 3', 'Av. Garay 1104, Buenos Aires', 'Gerente, Asistente, Cajero, Vendedor', 'LUNES-SABADO', 'MAÑANA, TARDE'),
    ('Sucursal 4', 'Av Patricios 252, Buenos Aires', 'Gerente, Asistente, Cajero, Vendedor', 'LUNES-VIERNES', 'MAÑANA, TARDE, NOCHE');

-- INSERT INTO empleados
INSERT INTO empleados (nombre, apellido, edad, id_sucursal, puesto, turno)
VALUES
    ('Juan', 'Perez', 30, 1, 'Gerente', 'Mañana'),
    ('Maria', 'Gomez', 25, 1, 'Asistente', 'Tarde'),
    ('Carlos', 'Lopez', 28, 2, 'Gerente', 'Mañana'),
    ('Laura', 'Rodriguez', 22, 2, 'Asistente', 'Tarde'),
    ('Pedro', 'Martinez', 26, 3, 'Gerente', 'Mañana');

-- INSERT INTO videojuegos
INSERT INTO videojuegos (titulo, plataforma, genero, clasificacion_edad, disponibilidad, id_sucursal)
VALUES
    ('The Last of Us', 'PlayStation 4', 'Acción, Aventura', '18+', 1, 1),
    ('Super Mario Odyssey', 'Nintendo Switch', 'Plataformas', 'Todos', 1, 2),
    ('FIFA 22', 'Xbox One', 'Deportes', 'Todos', 1, 3),
    ('Assassin''s Creed Valhalla', 'PlayStation 5', 'Acción, Aventura', '18+', 1, 4),
    ('Minecraft', 'PC', 'Sandbox', 'Todos', 1, 1),
    ('Red Dead Redemption 2', 'PlayStation 4', 'Acción, Aventura', '18+', 1, 1),
    ('The Legend of Zelda: Breath of the Wild', 'Nintendo Switch', 'Acción, Aventura', '12+', 1, 2),
    ('GTA V', 'Xbox One', 'Acción, Aventura', '18+', 1, 3),
    ('Call of Duty: Warzone', 'PC', 'Disparos', '18+', 1, 4),
    ('Animal Crossing: New Horizons', 'Nintendo Switch', 'Simulación', 'Todos', 1, 1),
    ('Resident Evil Village', 'PlayStation 5', 'Acción, Aventura', '18+', 1, 2),
    ('F1 2021', 'Xbox Series X', 'Deportes, Carreras', 'Todos', 1, 3),
    ('Super Smash Bros. Ultimate', 'Nintendo Switch', 'Lucha', 'Todos', 1, 4),
    ('Assassin''s Creed Odyssey', 'PlayStation 4', 'Acción, Aventura', '18+', 1, 1),
    ('Cyberpunk 2077', 'PC', 'Acción, RPG', '18+', 1, 2),
    ('FIFA 23', 'PlayStation 5', 'Deportes', 'Todos', 1, 3),
    ('Mortal Kombat 11', 'Xbox Series X', 'Lucha', '18+', 1, 4),
    ('The Witcher 3: Wild Hunt', 'Nintendo Switch', 'Acción, RPG', '18+', 1, 1),
    ('Pokémon Sword', 'Nintendo Switch', 'RPG', 'Todos', 1, 2),
    ('NBA 2K22', 'PlayStation 4', 'Deportes', 'Todos', 1, 3),
    ('Battlefield 2042', 'PC', 'Disparos', '18+', 1, 4),
    ('Super Mario Party', 'Nintendo Switch', 'Fiesta', 'Todos', 1, 1),
    ('God of War', 'PlayStation 4', 'Acción, Aventura', '18+', 1, 2),
    ('Halo Infinite', 'Xbox Series X', 'Acción, Disparos', '18+', 1, 3),
    ('Just Dance 2023', 'Nintendo Switch', 'Baile', 'Todos', 1, 4);
    

-- INSERT INTO clientes
INSERT INTO clientes (nombre, apellido, direccion, telefono, email)
VALUES
    ('Lucas', 'Gonzalez', 'Av. Rivadavia 1234, Buenos Aires', '1122334455', 'lucas.gonzalez@gmail.com'),
    ('Martina', 'Lopez', 'Av. Callao 567, Buenos Aires', '1133445566', 'martina.lopez@gmail.com'),
    ('Alejandro', 'Fernandez', 'Av. Santa Fe 890, Buenos Aires', '1144556677', 'alejandro.fernandez@gmail.com'),
    ('Valentina', 'Rodriguez', 'Av. Cabildo 4321, Buenos Aires', '1155667788', 'valentina.rodriguez@gmail.com'),
    ('Diego', 'Perez', 'Av. Corrientes 987, Buenos Aires', '1166778899', 'diego.perez@gmail.com');

-- INSERT INTO alquiler
INSERT INTO alquileres (id_cliente, id_videojuego, fecha_alquiler, fecha_devolucion, id_sucursal)
VALUES
    (1, 1, '2023-06-01', '2023-06-05', 1),
    (2, 3, '2023-06-02', '2023-06-06', 2),
    (3, 2, '2023-06-03', '2023-06-07', 3),
    (4, 4, '2023-06-04', NULL, 1),
    (5, 5, '2023-06-05', NULL, 2);

-- Query: Gerente de cada sucursal
SELECT s.nombre AS sucursal, CONCAT(e.nombre, ' ', e.apellido) AS gerente
FROM sucursales s
JOIN empleados e ON s.id_sucursal = e.id_sucursal
WHERE e.puesto = 'Gerente';

-- Query: Cantidad de asistentes de la Sucursal 1
SELECT COUNT(*) AS cantidad_asistentes
FROM empleados
WHERE id_sucursal = 1 AND puesto = 'Asistente';

-- Query: Cantidad de empleados que trabajan a la mañana en la Sucursal 2
SELECT COUNT(*) AS cantidad_empleados_mañana
FROM empleados
WHERE id_sucursal = 2 AND turno = 'Mañana';

/* -- Insertar copias de videojuegos en cada sucursal
INSERT INTO videojuegos (titulo, plataforma, genero, clasificacion_edad, disponibilidad, id_sucursal)
SELECT v.titulo, v.plataforma, v.genero, v.clasificacion_edad, v.disponibilidad, s.id_sucursal
FROM videojuegos v
CROSS JOIN sucursales s; */


SELECT * FROM videojuegos;

-- cantidad de videos juegos en cada sucursal
SELECT s.nombre AS sucursales, COUNT(*) AS cantidad_videojuegos
FROM sucursales s
JOIN videojuegos v ON s.id_sucursal = v.id_sucursal
GROUP BY s.id_sucursal, s.nombre;