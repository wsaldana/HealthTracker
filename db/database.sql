SELECT * FROM information_schema.tables WHERE table_schema = 'public'

SELECT * FROM usuarios;
SELECT * FROM historial_medico;

DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS historial_medico;
DROP TABLE IF EXISTS medicos;

CREATE TABLE medicos(
	id_medico SERIAL NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	correo VARCHAR(50) NOT NULL,
	contrasena VARCHAR NOT NULL,
	telefono VARCHAR(50)
);

CREATE TABLE historial_medico(
	id_historial SERIAL NOT NULL PRIMARY KEY,
	tipo_de_sangre VARCHAR(50) NOT NULL,
	padecimientos VARCHAR(50),
	cirugias VARCHAR(50),
	enfermedades_hereditarias VARCHAR(50)
);

CREATE TABLE usuarios(
	id_usuario SERIAL NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	correo VARCHAR(50) NOT NULL,
	contrasena VARCHAR NOT NULL,
	telefono VARCHAR(50),
	estado VARCHAR(50),
	foto VARCHAR(250),
	medico INT NOT NULL REFERENCES medicos(id_medico),
	historial_medico INT NOT NULL REFERENCES historial_medico(id_historial)
);

INSERT INTO medicos VALUES
	(default, 'Dr. Simi', 'simi@gmail.com', crypt('123', gen_salt('bf')), '+502 8934-7225'),
	(default, 'Dr. House', 'house@gmail.com', crypt('321', gen_salt('bf')), '+502 2547-9413');

INSERT INTO historial_medico VALUES 
	(default, 'A+', 'Padecimeintos random', 'Apendicectomía', 'Alguna que otra'),
	(default, 'B+', 'Padecimeintos...', 'N/A', 'N/A'), 
	(default, 'A-', 'N/A', '', ''),
	(default, 'O+', 'Alergias a la kriptonita', 'Cirugías random', 'No se'), 
	(default, 'AB+', 'Ejemplo de padecimientos', 'N/A', 'Puede ser');


create table sintomas (dolor_cabeza float not null, molestia_espalda_baja float not null,
diarrea float not null, sangrados float not null, calambres float not null,  presion float,
niveles_azucar float, peso float, fecha date not null )


alter table sintomas add id_usuario int, add foreign key (id_usuario) references usuarios(id_usuario)


