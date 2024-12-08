/*
SGDB: MySQL
BBDD: Compañía Aérea
Fecha: ????
Analista Técnico: ????
*/
-- Crear base de datos Compañía Aérea
CREATE DATABASE IF NOT EXISTS Companya_Aerea;

-- Usar base de datos Compañía Aérea
use Companya_Aerea;

-- Crear tabla T_AVION
CREATE TABLE IF NOT EXISTS T_AVION(
  matricula CHAR(6) NOT NULL,
  fabricante VARCHAR(50) NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  capacidad SMALLINT NOT NULL,
  autonomia SMALLINT NOT NULL,
  CONSTRAINT PK_AVION PRIMARY KEY (matricula)
);


-- Crear tabla T_PERSONAL
CREATE TABLE IF NOT EXISTS T_PERSONAL(
  identificador INT,
  nombre VARCHAR(50) NOT NULL,
  categoria_profesional VARCHAR(25) NOT NULL,
  CONSTRAINT PK_PERSONAL PRIMARY KEY(identificador)
);

-- Crear tabla T_PASAJERO
CREATE TABLE IF NOT EXISTS T_PASAJERO(
  DNI CHAR(9),
  nombre VARCHAR(50) NOT NULL,
  CONSTRAINT PK_PASAJERO PRIMARY KEY(DNI)
);


-- Crear tabla T_VUELO
CREATE TABLE IF NOT EXISTS T_VUELO(
  identificador INT, 
  fecha DATE NOT NULL,
  aeropuerto_origen VARCHAR(50) NOT NULL,
  aeropuerto_destino VARCHAR(50) NOT NULL,
  matricula_avion CHAR(6) NOT NULL,
  CONSTRAINT PK_VUELO PRIMARY KEY(identificador),
  CONSTRAINT FK_VUELO_AVION 
	FOREIGN KEY (matricula_avion) REFERENCES T_AVION(matricula)
);

-- Crear tabla T_PASAJERO_VUELO
CREATE TABLE IF NOT EXISTS T_PASAJERO_VUELO(
  id_vuelo INT,
  DNI_pasajero CHAR(9),
  numero_asiento SMALLINT NOT NULL,
  clase ENUM('Turista', 'Primera', 'Business') NOT NULL,
  CONSTRAINT PK_PASAJERO_VUELO PRIMARY KEY(id_vuelo, DNI_pasajero),
  CONSTRAINT FK_PASAJEROVUELO_PASAJERO
	FOREIGN KEY (DNI_pasajero) REFERENCES T_PASAJERO(DNI),
  CONSTRAINT FK_PASAJEROVUELO_VUELO
	FOREIGN KEY (id_vuelo) REFERENCES T_VUELO(identificador)
);

-- Crear tabla T_PERSONAL_VUELO
CREATE TABLE IF NOT EXISTS T_PERSONAL_VUELO(
  id_vuelo INT,
  id_personal INT,
  puesto VARCHAR(50) NOT NULL,
  CONSTRAINT PK_PERSONAL_VUELO PRIMARY KEY(id_vuelo, id_personal),
  CONSTRAINT FK_PERSONALVUELO_PERSONAL
	FOREIGN KEY(id_personal) REFERENCES T_PERSONAL(identificador),
  CONSTRAINT FK_PERSONALVUELO_VUELO
	FOREIGN KEY(id_vuelo) REFERENCES T_VUELO(identificador)
);

