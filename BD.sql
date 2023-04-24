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


DELIMITER $$
CREATE TRIGGER tr_cursos BEFORE INSERT ON cursos
FOR EACH ROW
BEGIN
  IF NEW.semestre <= 0 OR NEW.semestre >= 13 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El semestre debe ser mayor que 0 y menor que 13';
  END IF;
END $$
DELIMITER ;


CREATE TABLE cursos(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	nombre_curso VARCHAR(50),
	semestre INTEGER CHECK (semestre > 0 AND semestre < 13),
	horas_academicas INTEGER NOT NULL,
	total_estudiantes INTEGER DEFAULT 0
);






