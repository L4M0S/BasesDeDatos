CREATE DATABASE Biblioteca;

USE Biblioteca;



CREATE TABLE usuarios (
  u_id int NOT NULL,
  u_nombre varchar(50) NOT NULL,
  u_tipo varchar(7) NOT NULL,
  PRIMARY KEY (u_id)
);

INSERT INTO usuarios VALUES (1,'usuario1','alumno');
INSERT INTO usuarios VALUES (2,'usuario2','alumno');
INSERT INTO usuarios VALUES (3,'usuario3','alumno');
INSERT INTO usuarios VALUES (4,'usuario4','alumno');
INSERT INTO usuarios VALUES (5,'usuario5','maestro');
INSERT INTO usuarios VALUES (6,'usuario6','maestro');

CREATE TABLE libros (
  l_id int NOT NULL,
  l_nombre varchar(50) NOT NULL,
  l_autor varchar(50) NOT NULL,
  l_especialidad varchar(20) NOT NULL,
  PRIMARY KEY (l_id)
);

INSERT INTO libros VALUES (1,'libro1','autor1','especialidad1');
INSERT INTO libros VALUES (2,'libro2','autor1','especialidad1');
INSERT INTO libros VALUES (3,'libro3','autor1','especialidad1');
INSERT INTO libros VALUES (4,'libro4','autor1','especialidad1');
INSERT INTO libros VALUES (5,'libro5','autor1','especialidad1');
INSERT INTO libros VALUES (6,'libro6','autor2','especialidad2');
INSERT INTO libros VALUES (7,'libro7','autor2','especialidad2');
INSERT INTO libros VALUES (8,'libro8','autor2','especialidad2');
INSERT INTO libros VALUES (9,'libro9','autor2','especialidad2');
INSERT INTO libros VALUES (10,'libro10','autor2','especialidad2');
INSERT INTO libros VALUES (11,'libro11','autor3','especialidad3');
INSERT INTO libros VALUES (12,'libro12','autor3','especialidad3');
INSERT INTO libros VALUES (13,'libro13','autor3','especialidad3');
INSERT INTO libros VALUES (14,'libro14','autor3','especialidad3');
INSERT INTO libros VALUES (15,'libro15','autor3','especialidad3');
INSERT INTO libros VALUES (16,'libro16','autor4','especialidad4');
INSERT INTO libros VALUES (17,'libro17','autor4','especialidad4');
INSERT INTO libros VALUES (18,'libro18','autor4','especialidad4');
INSERT INTO libros VALUES (19,'libro19','autor4','especialidad4');
INSERT INTO libros VALUES (20,'libro20','autor4','especialidad4');
INSERT INTO libros VALUES (21,'libro21','autor5','especialidad5');
INSERT INTO libros VALUES (22,'libro22','autor5','especialidad5');
INSERT INTO libros VALUES (23,'libro23','autor5','especialidad5');
INSERT INTO libros VALUES (24,'libro24','autor5','especialidad5');
INSERT INTO libros VALUES (25,'libro25','autor5','especialidad5');

CREATE TABLE revistas (
  r_id int NOT NULL,
  r_nombre varchar(50) NOT NULL,
  r_fecha date NOT NULL,
  r_volumenes int NOT NULL,
  PRIMARY KEY (r_id)
);

INSERT INTO revistas VALUES (1,'revista1','2010-12-20',5);
INSERT INTO revistas VALUES (2,'revista2','2015-08-07',8);
INSERT INTO revistas VALUES (3,'revista3','2018-02-10',13);

CREATE TABLE periodicos (
  p_id int NOT NULL,
  p_tipo varchar(50) NOT NULL,
  p_fecha date NOT NULL,
  p_editorial varchar(20) NOT NULL,
  PRIMARY KEY (p_id)
);

INSERT INTO periodicos VALUES (1,'periodico1','2010-12-20','editorial1');
INSERT INTO periodicos VALUES (2,'periodico2','2015-08-07','editorial2');
INSERT INTO periodicos VALUES (3,'periodico3','2018-02-10','editorial3');

CREATE TABLE reportes (
  id int NOT NULL,
  usuario int NOT NULL,
  libro int NOT NULL,
  fecha_p date NOT NULL,
  fecha_v date NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT reportes1 FOREIGN KEY (usuario) REFERENCES usuarios (u_id),
  CONSTRAINT reportes2 FOREIGN KEY (libro) REFERENCES libros (l_id)
);

INSERT INTO reportes VALUES (1,1,1,'2018-11-15','2018-11-29');
INSERT INTO reportes VALUES (2,2,4,'2018-11-20','2018-11-25');
INSERT INTO reportes VALUES (3,3,10,'2018-11-24','2018-11-27');
INSERT INTO reportes VALUES (4,4,10,'2018-11-25','2018-11-29');
INSERT INTO reportes VALUES (5,5,14,'2018-11-26','2018-11-30');
INSERT INTO reportes VALUES (6,6,21,'2018-11-27','2018-11-30');

SELECT l_id, l_nombre, l_especialidad FROM libros WHERE l_especialidad='especialidad4';
SELECT * FROM revistas;
SELECT u_nombre, u_tipo FROM usuarios WHERE u_tipo='maestro';
SELECT COUNT(libro) l_id, l_nombre, l_autor, l_especialidad, libro FROM libros, reportes WHERE l_id=libro GROUP BY libro ORDER BY l_id DESC;
SELECT l_id, l_nombre, l_autor, l_especialidad, fecha_v FROM libros, reportes WHERE fecha_v>fecha_p AND fecha_v<(fecha_p+7) AND l_id=libro;
SELECT l_id, l_nombre, l_autor, l_especialidad, fecha_p FROM libros, reportes WHERE fecha_p='2018-11-26' AND l_id=libro;

select * from mysql.user;

CREATE USER 'consultor'@'localhost' IDENTIFIED BY 'consultor';
GRANT SELECT ON * . * TO 'consultor'@'localhost';

CREATE USER 'insertor'@'localhost' IDENTIFIED BY 'insertor';
GRANT SELECT ON * . * TO 'insertor'@'localhost';
GRANT INSERT ON * . * TO 'insertor'@'localhost';

CREATE USER 'modificador'@'localhost' IDENTIFIED BY 'modificador';
GRANT SELECT ON * . * TO 'modificador'@'localhost';
GRANT UPDATE ON * . * TO 'modificador'@'localhost';

CREATE USER 'eliminador'@'localhost' IDENTIFIED BY 'eliminador';
GRANT SELECT ON * . * TO 'eliminador'@'localhost';
GRANT DELETE ON * . * TO 'eliminador'@'localhost';

CREATE TRIGGER disparador BEFORE INSERT ON usuarios FOR EACH ROW
  DELETE FROM revistas;

  SHOW GRANTS FOR 'consultor'@'localhost';
  SHOW GRANTS FOR 'insertor'@'localhost'
  SHOW GRANTS FOR 'modificador'@'localhost'
  SHOW GRANTS FOR 'eliminador'@'localhost'

/*
SELECT l_id, l_nombre, l_autor, l_especialidad, libro FROM libros, reportes WHERE l_id=libro ORDER BY libro;
SELECT COUNT(libro) FROM reportes GROUP BY libro ORDER BY libro;
SELECT COUNT(libro) l_id, l_nombre, l_autor, l_especialidad, libro FROM libros, reportes GROUP BY libro ORDER BY libro;

SELECT nombrecampo AS valor, COUNT( * ) AS veces
FROM nombretabla t
GROUP BY nombrecampo
HAVING veces = ( 
SELECT COUNT( * ) maximo
FROM nombretabla
GROUP BY nombrecampo
ORDER BY maximo DESC 
LIMIT 1 )
*/