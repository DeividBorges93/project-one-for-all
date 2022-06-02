DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo_plano VARCHAR(20) NOT NULL,
  valor_plano DECIMAL(3,2) NOT NULL
);

