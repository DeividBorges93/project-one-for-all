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

INSERT INTO SpotifyClone.artistas(nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

INSERT INTO SpotifyClone.albuns(titulo, artista_id, ano_lancamento)
VALUES
  ('Envious', 1, 1990),
  ('Exuberant', 1, 1993),
  ('Hallowed Steam', 2, 1995),
  ('Incandescent', 3, 1998),
  ('Temporary Culture', 4, 2001),
  ('Library of liberty', 4, 2003),
  ('Chained Down', 5, 2007),
  ('Cabinet of fools', 5, 2012),
  ('No guarantees', 5, 2015),
  ('Apparatus', 6, 2015);

INSERT INTO SpotifyClone.cancoes(nome, duracao_segundos, album_id)
VALUES
  ("Soul For Us", 200, 1),
  ("Reflections Of Magic", 163, 1),
  ("Dance With Her Own", 116, 1),
  ("Troubles Of My Inner Fire", 203, 2),
  ("Time Fireworks", 152, 2),
  ("Magic Circus", 105, 3),
  ("Honey, So Do I", 207, 3),
  ("Sweetie, Let's Go Wild", 139, 3),
  ("She Knows", 244, 3),
  ("Fantasy For Me", 100, 4),
  ("Celebration Of More", 146, 4),
  ("Rock His Everything", 223, 4),
  ("Home Forever", 231, 4),
  ("Diamond Power", 241, 4),
  ("Let's Be Silly", 132, 4),
  ("Thang Of Thunder", 240, 5),
  ("Words Of Her Life", 185, 5),
  ("Without My Streets", 176, 5),
  ("Need Of The Evening", 190, 6),
  ("History Of My Roses", 222, 6),
  ("Without My Love", 111, 6),
  ("Walking And Game", 123, 6),
  ("Young And Father", 197, 6),
  ("Finding My Traditions", 179, 7),
  ("Walking And Man", 229, 7),
  ("Hard And Time", 135, 7),
  ("Honey, I'm A Lone Wolf", 150, 7),
  ("She Thinks I Won't Stay Tonight", 166, 8),
  ("He Heard You're Bad For Me", 154, 8),
  ("He Hopes We Can't Stay", 210, 8),
  ("I Know I Know", 117, 8),
  ("He's Walking Away", 159, 9),
  ("He's Trouble", 138, 9),
  ("I Heard I Want To Bo Alone", 120, 9),
  ("I Ride Alone", 151, 9),
  ("Honey", 79, 10),
  ("You Cheated On Me", 95, 10),
  ("Wouldn't It Be Nice", 213, 10),
  ("Baby", 136, 10),
  ("You Make Me Feel So..", 83, 10);

