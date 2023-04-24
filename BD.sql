CREATE TABLE usuarios(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(50),
	contra VARCHAR(50)
);

CREATE TABLE alumnos (
  dni_alumno VARCHAR(8) PRIMARY KEY,
  id_usuario INT,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  fecha_nacimiento DATE,
  CONSTRAINT fk_alumnos_usuarios
  FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

CREATE TABLE cursos(
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
	nombre_curso VARCHAR(50),
	semestre INTEGER CHECK (semestre > 0 AND semestre < 13),
	horas_academicas INTEGER NOT NULL,
	total_estudiantes INTEGER DEFAULT 0
);

CREATE TABLE profesores (
	profesor_dni varchar(8) PRIMARY KEY NOT NULL,
	profesor_nombre varchar(100),
	profesor_apellido varchar(100),
	profesor_fecha_nac DATE,
	id_usuario int,
	id_curso int,
  CONSTRAINT fk_profesores_usuarios
  FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
  CONSTRAINT fk_profesores_cursos
  FOREIGN KEY (id_curso) REFERENCES cursos (id_curso)
);

CREATE TABLE secciones (
	id_seccion int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nombre_seccion varchar(50),
  id_curso int,
  CONSTRAINT fk_secciones_cursos
  FOREIGN KEY (id_curso) REFERENCES cursos (id_curso)

);


DELIMITER $$
CREATE TRIGGER tr_cursos BEFORE INSERT ON cursos
FOR EACH ROW
BEGIN
  IF NEW.semestre <= 0 OR NEW.semestre >= 13 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El semestre debe ser mayor que 0 y menor que 13';
  END IF;
END $$
DELIMITER ;


