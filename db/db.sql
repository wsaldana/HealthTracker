SELECT * FROM information_schema.tables WHERE table_schema = 'public'

SELECT * FROM usuarios;
SELECT * FROM historial_medico;

DROP TABLE IF EXISTS historial_medico;
CREATE TABLE historial_medico(
	id_historial SERIAL NOT NULL PRIMARY KEY,
	tipo_de_sangre VARCHAR(50) NOT NULL,
	padecimientos VARCHAR(50),
	cirugias VARCHAR(50),
	enfermedades_hereditarias VARCHAR(50)
);

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios(
	id_usuario SERIAL NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	correo VARCHAR(50) NOT NULL,
	contrasena VARCHAR NOT NULL,
	telefono VARCHAR(50),
	historial_medico INT NOT NULL REFERENCES historial_medico(id_historial)
);

INSERT INTO historial_medico VALUES 
	(default, 'A+', '', '', ''),
	(default, 'B+', '', '', ''), 
	(default, 'A-', '', '', ''),
	(default, 'O+', '', '', ''), 
	(default, 'AB+', '', '', '');

INSERT INTO usuarios VALUES 
	(default, 'Walter', 'walter@gmail.com', crypt('123', gen_salt('bf')), '502 12345678', 1),
	(default, 'Gabriel', 'gabriel@gmail.com', crypt('456', gen_salt('bf')), '502 32165498', 2),
	(default, 'Jose', 'jose@gmail.com', crypt('789', gen_salt('bf')), '502 14725836', 3),
	(default, 'Hugo', 'hugo@gmail.com', crypt('321', gen_salt('bf')), '502 36925814', 4),
	(default, 'Andrea', 'andrear@gmail.com', crypt('654', gen_salt('bf')), '502 15987536', 5);
	
	


