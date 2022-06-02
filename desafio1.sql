DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
  id INT PRIMARY KEY AUTO_INCREMENT,
  tipo_plano VARCHAR(20) NOT NULL,
  valor_plano DECIMAL(3,2) NOT NULL
);

CREATE TABLE SpotifyClone.usuarios(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(25) NOT NULL,
  idade INT NOT NULL,
  id_plano INT,
  data_assinatura DATETIME,
  FOREIGN KEY (id_plano) REFERENCES SpotifyClone.planos(id)
  );

CREATE TABLE SpotifyClone.artistas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(25) NOT NULL
);

CREATE TABLE SpotifyClone.albuns(
  id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(50) NOT NULL,
  artista_id INT,
  ano_lancamento INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(id)
);

