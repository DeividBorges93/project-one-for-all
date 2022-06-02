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

INSERT INTO SpotifyClone.planos(tipo_plano, valor_plano)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitario', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.usuarios(nome, idade, id_plano, data_assinatura)
VALUES
  ('Thati', 23, 1, '2019-10-20'),
  ('Cintia', 35, 2, '2017-12-30'),
  ('Bill', 20, 3, '2019-06-05'),
  ('Roger', 45, 4, '2020-05-13'),
  ('Norman', 58, 4, '2017-02-17'),
  ('Patrick', 33, 2, '2017-01-06'),
  ('Vivian', 26, 3, '2018-01-05'),
  ('Carol', 19, 3, '2018-02-14'),
  ('Angelina', 42, 2, '2018-04-29'),
  ('Paul', 46, 2, '2017-01-17');

