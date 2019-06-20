CREATE DATABASE usuarios;

USE usuarios;


CREATE TABLE usuarios (
  u_id int NOT NULL AUTO_INCREMENT,
  u_nombre varchar(50) NOT NULL,
  u_pass varchar(50) NOT NULL,
  u_tipo int NOT NULL,
  PRIMARY KEY (u_id)
);

INSERT INTO usuarios (u_nombre,u_pass,u_tipo) VALUES ('usuario1','usuario1',1);