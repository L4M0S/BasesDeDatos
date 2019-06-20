/*CREATE TABLE diagnostico (
  folio int NOT NULL,
  paciente int NOT NULL,
  servicio int NOT NULL,
  medicamento int NOT NULL,
  medico int NOT NULL,
  PRIMARY KEY (folio),
  CONSTRAINT diagnostico FOREIGN KEY (paciente) REFERENCES pacientes (id),
  CONSTRAINT diagnostico FOREIGN KEY (servicio) REFERENCES servicios (id),
  CONSTRAINT diagnostico FOREIGN KEY (medicamento) REFERENCES medicamentos (id),
  CONSTRAINT diagnostico FOREIGN KEY (medico) REFERENCES medicos (id)
);*/

CREATE TABLE medicamentos (
  id int NOT NULL,
  nombre varchar(20) NOT NULL,
  costo int NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE servicios (
  id int NOT NULL,
  nombre varchar(15) NOT NULL,
  costo int NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE especialidades (
  id int NOT NULL,
  nombre varchar(15) NOT NULL,
  costo int NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE pacientes (
  id int NOT NULL,
  nombre varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE medicos (
  id int NOT NULL,
  nombre varchar(50) NOT NULL,
  especialidad int,
  PRIMARY KEY (id),
  CONSTRAINT medicos FOREIGN KEY (especialidad) REFERENCES especialidades (id)
);

CREATE TABLE medicos_pacientes  (
  medico int NOT NULL,
  paciente int NOT NULL,
  CONSTRAINT medicos_pacientes1 FOREIGN KEY (medico) REFERENCES medicos (id),
  CONSTRAINT medicos_pacientes2 FOREIGN KEY (paciente) REFERENCES pacientes (id)
);

CREATE TABLE pacientes_medicamentos (
  paciente int NOT NULL,
  medicamento int NOT NULL,
  CONSTRAINT pacientes_medicamentos1 FOREIGN KEY (paciente) REFERENCES pacientes (id),
  CONSTRAINT pacientes_medicamentos2 FOREIGN KEY (medicamento) REFERENCES medicamentos (id)
);

CREATE TABLE pacientes_servicios (
  paciente int NOT NULL,
  servicio int NOT NULL,
  CONSTRAINT pacientes_servicios1 FOREIGN KEY (paciente) REFERENCES pacientes (id),
  CONSTRAINT pacientes_servicios2 FOREIGN KEY (servicio) REFERENCES servicios (id)
);

CREATE TABLE pacientes_especialidad (
  paciente int NOT NULL,
  especialidad int NOT NULL,
  CONSTRAINT pacientes_especialidad1 FOREIGN KEY (paciente) REFERENCES pacientes (id),
  CONSTRAINT pacientes_especialidad2 FOREIGN KEY (especialidad) REFERENCES servicios (id)
);

CREATE TABLE costos (
  paciente int NOT NULL,
  medicamento int NOT NULL,
  CONSTRAINT costos1 FOREIGN KEY (paciente) REFERENCES pacientes (id),
  CONSTRAINT costos2 FOREIGN KEY (medicamento) REFERENCES medicamentos (id)
);

INSERT INTO medicamentos VALUES (1,'medicamento1',5);
INSERT INTO medicamentos VALUES (2,'medicamento2',10);
INSERT INTO medicamentos VALUES (3,'medicamento3',15);
INSERT INTO medicamentos VALUES (4,'medicamento4',20);
INSERT INTO medicamentos VALUES (5,'medicamento5',25);
INSERT INTO medicamentos VALUES (6,'medicamento6',30);
INSERT INTO medicamentos VALUES (7,'medicamento7',35);
INSERT INTO medicamentos VALUES (8,'medicamento8',40);
INSERT INTO medicamentos VALUES (9,'medicamento9',45);
INSERT INTO medicamentos VALUES (10,'medicamento10',50);

INSERT INTO pacientes VALUES (1,'paciente1');
INSERT INTO pacientes VALUES (2,'paciente2');
INSERT INTO pacientes VALUES (3,'paciente3');
INSERT INTO pacientes VALUES (4,'paciente4');
INSERT INTO pacientes VALUES (5,'paciente5');
INSERT INTO pacientes VALUES (6,'paciente6');
INSERT INTO pacientes VALUES (7,'paciente7');
INSERT INTO pacientes VALUES (8,'paciente8');
INSERT INTO pacientes VALUES (9,'paciente9');
INSERT INTO pacientes VALUES (10,'paciente10');
INSERT INTO pacientes VALUES (11,'paciente11');
INSERT INTO pacientes VALUES (12,'paciente12');
INSERT INTO pacientes VALUES (13,'paciente13');
INSERT INTO pacientes VALUES (14,'paciente14');
INSERT INTO pacientes VALUES (15,'paciente15');
INSERT INTO pacientes VALUES (16,'paciente16');
INSERT INTO pacientes VALUES (17,'paciente17');
INSERT INTO pacientes VALUES (18,'paciente18');
INSERT INTO pacientes VALUES (19,'paciente19');
INSERT INTO pacientes VALUES (20,'paciente20');

INSERT INTO servicios VALUES (1,'servicio1',5);
INSERT INTO servicios VALUES (2,'servicio2',10);
INSERT INTO servicios VALUES (3,'servicio3',15);
INSERT INTO servicios VALUES (4,'servicio4',20);
INSERT INTO servicios VALUES (5,'servicio5',25);

INSERT INTO especialidades VALUES (1,'especialidad1',5);
INSERT INTO especialidades VALUES (2,'especialidad2',10);
INSERT INTO especialidades VALUES (3,'especialidad3',15);
INSERT INTO especialidades VALUES (4,'especialidad4',20);
INSERT INTO especialidades VALUES (5,'especialidad5',25);

INSERT INTO medicos VALUES (1,'medico1',1);
INSERT INTO medicos VALUES (2,'medico2',1);
INSERT INTO medicos VALUES (3,'medico3',2);
INSERT INTO medicos VALUES (4,'medico4',2);
INSERT INTO medicos VALUES (5,'medico5',3);
INSERT INTO medicos VALUES (6,'medico6',3);
INSERT INTO medicos VALUES (7,'medico7',4);
INSERT INTO medicos VALUES (8,'medico8',4);
INSERT INTO medicos VALUES (9,'medico9',5);
INSERT INTO medicos VALUES (10,'medico10',5);

INSERT INTO medicos_pacientes VALUES (1,1);
INSERT INTO medicos_pacientes VALUES (1,2);
INSERT INTO medicos_pacientes VALUES (1,3);
INSERT INTO medicos_pacientes VALUES (2,4);
INSERT INTO medicos_pacientes VALUES (3,5);
INSERT INTO medicos_pacientes VALUES (3,6);

INSERT INTO pacientes_medicamentos VALUES (1,1);
INSERT INTO pacientes_medicamentos VALUES (1,2);
INSERT INTO pacientes_medicamentos VALUES (1,3);
INSERT INTO pacientes_medicamentos VALUES (2,4);
INSERT INTO pacientes_medicamentos VALUES (3,5);
INSERT INTO pacientes_medicamentos VALUES (3,6);

INSERT INTO pacientes_servicios VALUES (1,1);
INSERT INTO pacientes_servicios VALUES (1,2);
INSERT INTO pacientes_servicios VALUES (1,3);
INSERT INTO pacientes_servicios VALUES (2,4);
INSERT INTO pacientes_servicios VALUES (3,5);
INSERT INTO pacientes_servicios VALUES (3,1);

INSERT INTO pacientes_especialidad VALUES (1,1);
INSERT INTO pacientes_especialidad VALUES (2,1);
INSERT INTO pacientes_especialidad VALUES (3,2);
INSERT INTO pacientes_especialidad VALUES (4,3);
INSERT INTO pacientes_especialidad VALUES (5,3);
INSERT INTO pacientes_especialidad VALUES (6,3);

INSERT INTO costos VALUES (1,1);
INSERT INTO costos VALUES (1,2);
INSERT INTO costos VALUES (1,3);
INSERT INTO costos VALUES (2,4);
INSERT INTO costos VALUES (3,5);
INSERT INTO costos VALUES (3,6);

SELECT nombre, especialidad FROM medicos WHERE especialidad=1;
SELECT paciente, nombre FROM pacientes_especialidad, pacientes WHERE especialidad=3 and id=paciente;
SELECT paciente, medicamento, costo FROM pacientes_medicamentos, servicios where id=medicamento order by paciente;
SELECT paciente, servicio, nombre FROM pacientes_servicios, pacientes WHERE id=paciente;
SELECT paciente, servicio, costo FROM pacientes_servicios, servicios where id=servicio order by paciente;
SELECT medico, paciente, nombre, especialidad FROM medicos_pacientes, medicos WHERE id=medico;