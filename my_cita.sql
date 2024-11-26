
CREATE DATABASE my_cita;

use my_cita;
-- Tabla para almacenar la información de los pacientes
CREATE TABLE Pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
	tipo_identificacion_paciente VARCHAR(50) NOT NULL,
    identificacion_paciente VARCHAR(50) NOT NULL UNIQUE,
    nombre_paciente VARCHAR(100) NOT NULL,
    apellido_paciente VARCHAR(100) UNIQUE NOT NULL,
    telefono_paciente VARCHAR(15),
    fecha_nacimiento_paciente DATE,
    direccion_paciente TEXT,
	ciudad_paciente VARCHAR(100) NOT NULL,
    departamento_paciente VARCHAR(100) NOT NULL,
    pais_paciente VARCHAR(100) NOT NULL,
    fecha_registro_paciente TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from Pacientes;

-- Tabla para almacenar la información de los Especialista 
CREATE TABLE Especialista (
	id_especialista INT AUTO_INCREMENT PRIMARY KEY,
    tipo_identificacion_especialista VARCHAR(50) NOT NULL,
    identificacion_especialista VARCHAR(50) NOT NULL UNIQUE,
    nombre_especialista VARCHAR(100) NOT NULL,
    apellido_especialista VARCHAR(100) UNIQUE NOT NULL,
    especialidad_especialista VARCHAR(100),
    telefono_especialista VARCHAR(15),
    ciudad_especialista VARCHAR(100) NOT NULL,
    departamento_especialista VARCHAR(100) NOT NULL,
    pais_especialista VARCHAR(100) NOT NULL,
    fecha_registro_especialista TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

select * from Especialista;

-- Tabla para almacenar la información de la disponibilidad los Especialista
CREATE TABLE Disponibilidad_Especialista (
    id_disponibilidad_especialista INT AUTO_INCREMENT PRIMARY KEY,
	id_especialista  INT,
    dia_semana VARCHAR(20),  -- Ejemplo: "Lunes", "Martes", etc.
    hora_inicio TIME,
    hora_fin TIME,
    FOREIGN KEY (id_especialista ) REFERENCES Especialista (id_especialista)
);

select * from Disponibilidad_Especialista;

-- Tabla de Citas Disponibilidad_Profesionales
CREATE TABLE Citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
	id_especialista INT,
    id_disponibilidad_especialista  INT,
    fecha_cita DATE,
	dia_semana VARCHAR(20),
    hora_cita TIME,
    enlace_virtual VARCHAR(255),  -- Enlace de la cita virtual (por ejemplo, un enlace de Zoom o Google Meet)
    observaciones TEXT,
 
    FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    FOREIGN KEY (id_especialista) REFERENCES Especialista(id_especialista),
    FOREIGN KEY (id_disponibilidad_especialista) REFERENCES Disponibilidad_Especialista(id_disponibilidad_especialista)
);

select * from Citas;


INSERT INTO Pacientes (id_paciente,tipo_identificacion_paciente, identificacion_paciente, nombre_paciente, apellido_paciente, telefono_paciente, fecha_nacimiento_paciente, direccion_paciente, ciudad_paciente, departamento_paciente, pais_paciente)
VALUES 
('001','Cédula', '1234567890', 'Juan', 'Pérez', '3001234567', '1985-03-15', 'Calle 123, Barrio La Paz', 'Bogotá', 'Cundinamarca', 'Colombia'),
('002','Pasaporte', 'A123456789', 'Ana', 'Gómez', '3109876543', '1990-08-22', 'Carrera 45, Apt 101', 'Medellín', 'Antioquia', 'Colombia'),
('003','Cédula', '9876543210', 'Carlos', 'Mendoza', '3201122334', '1987-01-30', 'Avenida 22, Casa 25', 'Cali', 'Valle del Cauca', 'Colombia'),
('004','Cédula', '1122334455', 'Lucía', 'Martínez', '3114455667', '1995-11-05', 'Calle 99, Barrio Santa Teresa', 'Cartagena', 'Bolívar', 'Colombia'),
('005','Pasaporte', 'B987654321', 'Pedro', 'Jiménez', '3152233445', '1983-02-14', 'Avenida 50, Oficina 302', 'Barranquilla', 'Atlántico', 'Colombia');

select* from Pacientes;

INSERT INTO Especialista (id_especialista,tipo_identificacion_especialista, identificacion_especialista, nombre_especialista, apellido_especialista, especialidad_especialista, telefono_especialista, ciudad_especialista, departamento_especialista, pais_especialista)
VALUES 
('001','Cédula', '0012345678', 'Dr. Mario', 'Suárez', 'Psicología', '3101234567', 'Bogotá', 'Cundinamarca', 'Colombia'),
('002','Cédula', 'B123456789', 'Dra. Isabel', 'López', 'Psiquiatría', '3209876543', 'Medellín', 'Antioquia', 'Colombia'),
('003','Cédula', '8765432109', 'Dr. Luis', 'Ramírez', 'Psicología', '3001122334', 'Cali', 'Valle del Cauca', 'Colombia'),
('004','Cédula', '2233445566', 'Dra. Mariana', 'Torres', 'Psicoterapia', '3112233445', 'Cartagena', 'Bolívar', 'Colombia'),
('005','Cédula', 'A876543210', 'Dr. Jorge', 'Martínez', 'Neuropsicología', '3144455667', 'Barranquilla', 'Atlántico', 'Colombia');

select* from Especialista;

INSERT INTO Disponibilidad_Especialista (id_disponibilidad_especialista, id_especialista,dia_semana, hora_inicio, hora_fin)
VALUES
(1,1, 'Lunes', '08:00:00', '12:00:00'),
(2,1, 'Lunes', '14:00:00', '18:00:00'),
(3,2, 'Martes', '08:00:00', '12:00:00'),
(4,2, 'Martes', '14:00:00', '18:00:00'),
(5,3, 'Miércoles', '08:00:00', '12:00:00'),
(6,3, 'Miércoles', '14:00:00', '18:00:00'),
(7,4, 'Jueves', '08:00:00', '12:00:00'),
(8,4, 'Jueves', '14:00:00', '18:00:00'),
(9,5, 'Viernes', '08:00:00', '12:00:00'),
(10,5, 'Viernes', '14:00:00', '18:00:00');


select* from Disponibilidad_Especialista;

select* from Citas;
INSERT INTO Citas (id_cita,id_paciente, id_especialista, id_disponibilidad_especialista, fecha_cita, hora_cita, enlace_virtual, observaciones, dia_semana)
VALUES
(1, 1, 1,1, '2024-11-18', '08:00:00', 'https://zoom.us/j/123456789', 'Cita de seguimiento, ansiedad y estrés', 'Lunes'),
(2, 2, 2,2, '2024-11-19', '09:00:00', 'https://zoom.us/j/987654321', 'Consulta para manejo de depresión', 'Martes'),
(3, 3, 3,3, '2024-11-20', '10:00:00', 'https://zoom.us/j/456789123', 'Terapia para problemas de autoestima', 'Miércoles'),
(4, 4, 4,4, '2024-11-21', '14:00:00', 'https://zoom.us/j/741852963', 'Terapia de pareja y manejo de conflictos', 'Jueves'),
(5, 5, 5,5, '2024-11-22', '09:00:00', 'https://zoom.us/j/258369741', 'Evaluación neuropsicológica para diagnóstico', 'Viernes');

-- Agendar las citas de un paciente

INSERT INTO Citas (id_paciente, id_especialista, id_disponibilidad_especialista, fecha_cita, hora_cita, enlace_virtual, observaciones, dia_semana)
VALUES 
(1, 2, 1, '2024-11-19', '09:00:00', 'https://zoom.us/j/123456789', 'Consulta para manejo de depresión', 'Martes');

-- Consultar el horario entre semana de un especialista
SELECT e.nombre_especialista, e.apellido_especialista, d.dia_semana, d.hora_inicio, d.hora_fin
FROM Especialista e
JOIN Disponibilidad_Especialista d ON e.id_especialista = d.id_especialista
WHERE e.id_especialista = 2;  -- Modificar la fecha según lo necesites

-- Ver todas las citas y las observaciones de un paciente
SELECT  p.nombre_paciente,p.apellido_paciente, e.nombre_especialista, e.apellido_especialista, c.fecha_cita, c.hora_cita, c.enlace_virtual, c.observaciones
FROM Citas c
JOIN Pacientes p ON c.id_paciente = p.id_paciente
JOIN Especialista e ON c.id_especialista = e.id_especialista
WHERE c.id_paciente = 1;  -- Reemplazar con el ID del paciente

-- Ver las citas programadas para un profesional en un día específico
SELECT c.fecha_cita, c.hora_cita, c.enlace_virtual, c.observaciones, p.nombre_paciente, p.apellido_paciente
FROM Citas c
JOIN Especialista e ON c.id_especialista = e.id_especialista
JOIN Pacientes p ON c.id_paciente = p.id_paciente
WHERE e.id_especialista = 1  -- Modificar con el ID del profesional
AND c.fecha_cita = '2024-11-18';  -- Modificar la fecha según lo necesites

--  Obtener la cantidad de citas agendadas para cada especialista

SELECT e.nombre_especialista, 
       e.apellido_especialista, 
       c.fecha_cita, 
       COUNT(c.id_cita) AS citas_agendadas
FROM Citas c
JOIN Especialista e ON c.id_especialista = e.id_especialista
GROUP BY e.id_especialista, c.fecha_cita
ORDER BY e.id_especialista, c.fecha_cita;
