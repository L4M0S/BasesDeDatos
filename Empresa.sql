CREATE DATABASE Empresa;

USE Empresa;

CREATE TABLE empleados (
  e_id int NOT NULL,
  e_nombre varchar(50) NOT NULL,
  e_proyecto int NOT NULL,
  PRIMARY KEY (e_id)
);

CREATE TABLE proyectosActuales (
  pa_id int NOT NULL,
  pa_nombre varchar(50) NOT NULL,
  PRIMARY KEY (pa_id)
);

CREATE TABLE proyectosTerminados (
  pt_id int NOT NULL,
  pt_nombre varchar(50) NOT NULL,
  PRIMARY KEY (pt_id)
);

DROP TRIGGER disparador;

CREATE TRIGGER disparador BEFORE DELETE ON proyectosActuales FOR EACH ROW
  INSERT INTO proyectosTerminados SELECT * FROM proyectosActuales WHERE pa_id=1;

  INSERT INTO proyectosActuales VALUES (1,'proyecto1');
  INSERT INTO proyectosActuales VALUES (2,'proyecto2');
  INSERT INTO proyectosActuales VALUES (3,'proyecto3');
  INSERT INTO proyectosActuales VALUES (4,'proyecto4');
  INSERT INTO proyectosActuales VALUES (5,'proyecto5');

 DELETE FROM proyectosActuales WHERE pa_id=1;

CREATE TRIGGER disparador BEFORE DELETE ON proyectosActuales FOR EACH ROW
  insert into proyectosTerminados values(old.pa_id,old.pa_nombre);

CREATE TRIGGER disparador2 BEFORE DELETE ON proyectosActuales FOR EACH ROW 	
  update empleados SET e_proyecto=0 where e_proyecto=old.pa_id;


  INSERT INTO empleados VALUES (1,'empleado1',1);
  INSERT INTO empleados VALUES (2,'empleado2',2);
  INSERT INTO empleados VALUES (3,'empleado3',3);
  INSERT INTO empleados VALUES (4,'empleado4',4);
  INSERT INTO empleados VALUES (5,'empleado5',5);