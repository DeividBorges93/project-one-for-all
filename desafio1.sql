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

CREATE TABLE SpotifyClone.cancoes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(70) NOT NULL,
  duracao_segundos INT NOT NULL,
  album_id INT,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(id)
);

CREATE TABLE SpotifyClone.historico_reproducoes(
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  data_reproducao DATETIME,
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(id),
  FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(id),
  PRIMARY KEY(usuario_id, cancao_id)
);

CREATE TABLE SpotifyClone.seguindo_artista(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(id),
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(id),
  PRIMARY KEY(usuario_id, artista_id)
);

