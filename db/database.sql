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

INSERT INTO usuarios VALUES 
	(default, 'Luisa Hernandez', 'luisa@gmail.com', crypt('123', gen_salt('bf')), '502 1234-5678', '8 meses de embarazo sin complicaciones', 'https://farm4.static.flickr.com/3424/3729244504_07ae21e6a9_o.png', 1,1),
	(default, 'Fiona de Shrek', 'fiona@gmail.com', crypt('456', gen_salt('bf')), '502 32165498',  '7 meses de embarazo con diabetes', 'https://img.women.com/images/images/000/027/550/large/Shrek_Fiona_Hero_Image.png.jpg?1470702831', 1,2),
	(default, 'Patricia Estrella', 'paty@gmail.com', crypt('789', gen_salt('bf')), '502 14725836', '9 meses de embarazo con retraso de fecha', 'https://i.pinimg.com/736x/17/91/b5/1791b5696a8a7dace26ad529d5244c92.jpg', 1, 3),
	(default, 'Otra Paciente', 'otra@gmail.com', crypt('123', gen_salt('bf')), '502 1234-5678', '8 meses de embarazo sin complicaciones', 'https://i.pinimg.com/originals/57/2b/9d/572b9d13ec085687b53b7daec5b82996.jpg', 1,4),
	(default, 'Paciente Random', 'random@gmail.com', crypt('456', gen_salt('bf')), '502 32165498',  '7 meses de embarazo con diabetes', 'https://i.ytimg.com/vi/-GVDwdR8jSI/maxresdefault.jpg', 1,5),
	(default, 'Ejemplo Paciente', 'ejemplo@gmail.com', crypt('789', gen_salt('bf')), '502 14725836', '9 meses de embarazo con retraso de fecha', 'https://i.pinimg.com/originals/1d/dd/04/1ddd0455e8e059c2f1081730baabf799.png', 1, 1),
	(default, 'Luisa Hernandez', 'luisa@gmail.com', crypt('123', gen_salt('bf')), '502 1234-5678', '8 meses de embarazo sin complicaciones', 'https://farm4.static.flickr.com/3424/3729244504_07ae21e6a9_o.png', 1,1),
	(default, 'Fiona de Shrek', 'fiona@gmail.com', crypt('456', gen_salt('bf')), '502 32165498',  '7 meses de embarazo con diabetes', 'https://img.women.com/images/images/000/027/550/large/Shrek_Fiona_Hero_Image.png.jpg?1470702831', 1,2),
	(default, 'Patricia Estrella', 'paty@gmail.com', crypt('789', gen_salt('bf')), '502 14725836', '9 meses de embarazo con retraso de fecha', 'https://i.pinimg.com/736x/17/91/b5/1791b5696a8a7dace26ad529d5244c92.jpg', 1, 3),
	(default, 'Otra Paciente', 'otra@gmail.com', crypt('123', gen_salt('bf')), '502 1234-5678', '8 meses de embarazo sin complicaciones', 'https://i.pinimg.com/originals/57/2b/9d/572b9d13ec085687b53b7daec5b82996.jpg', 1,4),
	(default, 'Paciente Random', 'random@gmail.com', crypt('456', gen_salt('bf')), '502 32165498',  '7 meses de embarazo con diabetes', 'https://i.ytimg.com/vi/-GVDwdR8jSI/maxresdefault.jpg', 1,5),
	(default, 'Ejemplo Paciente', 'ejemplo@gmail.com', crypt('789', gen_salt('bf')), '502 14725836', '9 meses de embarazo con retraso de fecha', 'https://i.pinimg.com/originals/1d/dd/04/1ddd0455e8e059c2f1081730baabf799.png', 1, 1),

	(default, 'Luisa Hernandez2', 'luisa@gmail.com', crypt('123', gen_salt('bf')), '502 1234-5678', '8 meses de embarazo sin complicaciones', 'https://farm4.static.flickr.com/3424/3729244504_07ae21e6a9_o.png', 2,1),
	(default, 'Fiona de Shrek2', 'fiona@gmail.com', crypt('456', gen_salt('bf')), '502 32165498',  '7 meses de embarazo con diabetes', 'https://img.women.com/images/images/000/027/550/large/Shrek_Fiona_Hero_Image.png.jpg?1470702831', 2,2),
	(default, 'Patricia Estrella2', 'paty@gmail.com', crypt('789', gen_salt('bf')), '502 14725836', '9 meses de embarazo con retraso de fecha', 'https://i.pinimg.com/736x/17/91/b5/1791b5696a8a7dace26ad529d5244c92.jpg', 2, 3),
	(default, 'Otra Paciente2', 'otra@gmail.com', crypt('123', gen_salt('bf')), '502 1234-5678', '8 meses de embarazo sin complicaciones', 'https://i.pinimg.com/originals/57/2b/9d/572b9d13ec085687b53b7daec5b82996.jpg', 2,4),
	(default, 'Paciente Random2', 'random@gmail.com', crypt('456', gen_salt('bf')), '502 32165498',  '7 meses de embarazo con diabetes', 'https://i.ytimg.com/vi/-GVDwdR8jSI/maxresdefault.jpg', 1,5),
	(default, 'Ejemplo Paciente2', 'ejemplo@gmail.com', crypt('789', gen_salt('bf')), '502 14725836', '9 meses de embarazo con retraso de fecha', 'https://i.pinimg.com/originals/1d/dd/04/1ddd0455e8e059c2f1081730baabf799.png', 2, 1),
	(default, 'Luisa Hernandez2', 'luisa@gmail.com', crypt('123', gen_salt('bf')), '502 1234-5678', '8 meses de embarazo sin complicaciones', 'https://farm4.static.flickr.com/3424/3729244504_07ae21e6a9_o.png', 1,1),
	(default, 'Fiona de Shrek2', 'fiona@gmail.com', crypt('456', gen_salt('bf')), '502 32165498',  '7 meses de embarazo con diabetes', 'https://img.women.com/images/images/000/027/550/large/Shrek_Fiona_Hero_Image.png.jpg?1470702831', 2,2),
	(default, 'Patricia Estrella2', 'paty@gmail.com', crypt('789', gen_salt('bf')), '502 14725836', '9 meses de embarazo con retraso de fecha', 'https://i.pinimg.com/736x/17/91/b5/1791b5696a8a7dace26ad529d5244c92.jpg', 2, 3),
	(default, 'Otra Paciente2', 'otra@gmail.com', crypt('123', gen_salt('bf')), '502 1234-5678', '8 meses de embarazo sin complicaciones', 'https://i.pinimg.com/originals/57/2b/9d/572b9d13ec085687b53b7daec5b82996.jpg', 2,4),
	(default, 'Paciente Random2', 'random@gmail.com', crypt('456', gen_salt('bf')), '502 32165498',  '7 meses de embarazo con diabetes', 'https://i.ytimg.com/vi/-GVDwdR8jSI/maxresdefault.jpg', 2,5),
	(default, 'Ejemplo Paciente2', 'ejemplo@gmail.com', crypt('789', gen_salt('bf')), '502 14725836', '9 meses de embarazo con retraso de fecha', 'https://i.pinimg.com/originals/1d/dd/04/1ddd0455e8e059c2f1081730baabf799.png', 2, 1);

SELECT * FROM usuarios u INNER JOIN historial_medico hm ON u.historial_medico = hm.id_historial WHERE u.medico = 1;
create table sintomas (dolor_cabeza float not null, molestia_espalda_baja float not null,
diarrea float not null, sangrados float not null, calambres float not null,  presion float,
niveles_azucar float, peso float, fecha date not null )


alter table sintomas add id_usuario int, add foreign key (id_usuario) references usuarios(id_usuario)

select * from sintomas s 

ALTER TABLE sintomas 
    ALTER COLUMN diarrea TYPE int,
    ALTER COLUMN sangrados TYPE int,
    ALTER COLUMN dolor_cabeza TYPE int,
    ALTER COLUMN molestia_espalda_baja TYPE int,
    ALTER COLUMN calambres TYPE int

    insert into sintomas values (1.4, 2.5, 1.5, 1.4, 1.4, null, null, 150.5, '2021-08-06', 1, 9)

ALTER TABLE sintomas 
DROP COLUMN presion,
DROP COLUMN niveles_azucar,
DROP COLUMN peso;


ALTER TABLE sintomas 
ADD CONSTRAINT rango_dolor_cabeza 
CHECK (
	dolor_cabeza >= 0 and dolor_cabeza <=10
);
    
ALTER TABLE sintomas 
ADD CONSTRAINT rango_molestia_espalda_baja 
CHECK (
	molestia_espalda_baja >= 0 and molestia_espalda_baja <=10

);
    
ALTER TABLE sintomas 
ADD CONSTRAINT rango_diarrea 
CHECK (
	diarrea >= 0 and diarrea <=10

);

ALTER TABLE sintomas 
ADD CONSTRAINT rango_sangrados 
CHECK (
	sangrados >= 0 and sangrados <=10

);

ALTER TABLE sintomas 
ADD CONSTRAINT rango_calambres 
CHECK (
	calambres >= 0 and calambres <=10

);
    
    insert into sintomas values (2, 1, 4, 10, 2, 150.5, '2021-08-06', 1, 10)

SELECT * FROM usuarios;

DELETE FROM usuarios
WHERE id_usuario = 12;

DELETE FROM usuarios
WHERE 
id_usuario = 13 
or 
id_usuario = 14
or
id_usuario = 15
or
id_usuario = 16
or
id_usuario = 17
or
id_usuario = 18
or
id_usuario = 19
or
id_usuario = 20
or
id_usuario = 21
or
id_usuario = 22
or
id_usuario = 23
or
id_usuario = 24
or
id_usuario = 28;
