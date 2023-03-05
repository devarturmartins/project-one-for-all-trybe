DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano(
	id_plano INT PRIMARY KEY AUTO_INCREMENT,
    plano VARCHAR(30) NOT NULL,
    valor_plano DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE users(
	id_users INT PRIMARY KEY AUTO_INCREMENT,
    nome_users VARCHAR(255) NOT NULL,
    idade_users VARCHAR(3) NOT NULL,
	id_plano INT NOT NULL,
    data_assinatura_users DATE NOT NULL,
    FOREIGN KEY (id_plano) REFERENCES plano(id_plano)
    
) engine = InnoDB;

CREATE TABLE artistas(
	id_artista INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(255) NOT NULL
) engine = InnoDB;

CREATE TABLE artistas_seguidos(
	id_users INT NOT NULL,
	id_artista INT NOT NULL,
    PRIMARY KEY (id_users, id_artista),
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista),
    FOREIGN KEY (id_users) REFERENCES users(id_users)
) engine = InnoDB;



CREATE TABLE albuns(
	id_album INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(255) NOT NULL,
    ano_lancamento VARCHAR(4) NOT NULL,
    id_artista INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
) engine = InnoDB;

CREATE TABLE cancoes(
	id_cancao INT PRIMARY KEY AUTO_INCREMENT,
    nome_cancao VARCHAR(255) NOT NULL,
    id_album INT NOT NULL,
    FOREIGN KEY (id_album) REFERENCES albuns(id_album)
) engine = InnoDB;

CREATE TABLE duracao(
	duracao_segundos DECIMAL(5,2) NOT NULL,
    id_cancao INT NOT NULL,
    FOREIGN KEY (id_cancao) REFERENCES cancoes(id_cancao)
) engine = InnoDB;

CREATE TABLE reproducao(
    -- historico_reproducao_id INT PRIMARY KEY AUTO_INCREMENT,
	id_users INT NOT NULL,
    id_cancao INT NOT NULL,
    data_reproducao DATETIME,
    historico_reproducao VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_users, id_cancao),
    FOREIGN KEY (id_users) REFERENCES users(id_users),
    FOREIGN KEY (id_cancao) REFERENCES cancoes(id_cancao)
) engine = InnoDB;

INSERT INTO plano (plano, valor_plano)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitario', 5.99),
  ('pessoal', 6.99);
  
INSERT INTO users (nome_users, idade_users, id_plano, data_assinatura_users)
VALUES
  ('Barbara Liskov', '82', 1, '2019-10-20'),
  ('Robert Cecil Martin', '58', 1, '2017-01-06'),
  ('Ada Lovelace', '37', 2, '2017-12-30'),
  ('Martin Fowler', '46', 2, '2017-01-17'),
  ('Sandi Metz', '58', 2, '2018-04-29'),
  ('Paulo Freire', '19', 3, '2018-02-14'),
  ('Bell Hooks', '26', 3, '2018-01-05'),
  ('Christopher Alexander', '85', 4, '2019-06-05'),
  ('Judith Butler', '45', 4, '2020-05-13'),
  ('Jorge Amado', '58', 4, '2017-02-17');
  
    
INSERT INTO artistas (id_artista, nome_artista) VALUES
    ('1', 'Beyoncé'),
    ('2', 'Queen'),
    ('3', 'Elis Regina'),
    ('4', 'Baco Exu do Blues'),
    ('5', 'Blind Guardian'),
    ('6', 'Nina Simone');

INSERT INTO artistas_seguidos (id_users, id_artista) VALUES
  (1,1),
  (1,2),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (4,4),
  (5,5),
  (5,6),
  (6,1),
  (6,6),
  (7,6),
  (9,3),
  (10,2);
  
  INSERT INTO albuns (id_album, nome_album, ano_lancamento, id_artista) VALUES
	('1', 'Renaissance', '2022', 1),
    ('2', 'Jazz', '1978', 2),
    ('3', 'Hot Space', '1982', 2),
    ('4', 'Falso Brilhante', '1998', 3),
    ('5', 'Vento de Maio', '2001', 3),
    ('6', 'QVVJFA?', '2003', 4),
    ('7', 'Somewhere Far Beyond', '2007', 5),
    ('8', 'I Put A Spell On You', '2012', 6);
    
INSERT INTO cancoes (id_cancao, nome_cancao, id_album) VALUES 
	('1', 'BREAK MY SOUL', '1'),
    ('2', "VIRGO'S GROOVE", '1'),
    ('3', 'ALIEN SUPERSTAR', '1'),
    ('4', "Don't Stop Me Now", '2'),
    ('5', 'Under Pressure', '3'),
    ('6', 'Como Nossos Pais', '4'),
    ('7', 'O Medo de Amar é o Medo de Ser Livre', '5'),
    ('8', 'Samba em Paris', '6'),
    ('9', "The Bard's Song", '7'),
    ('10', 'Feeling Good', '8');
    
INSERT INTO duracao (duracao_segundos, id_cancao) VALUES
	('279', '1'),
    ('369', '2'),
    ('116', '3'),
    ('203', '4'),
    ('152', '5'),
    ('105', '6'),
    ('207', '7'),
    ('267', '8'),
    ('244', '9'),
    ('100', '10');
    
INSERT INTO reproducao (id_users, id_cancao, data_reproducao, historico_reproducao) VALUES
	(1, 8,"2022-02-28 10:45:55", 'Samba em Paris'),
    (1, 2,"2020-05-02 05:30:35", "VIRGO'S GROOVE"),
    (1, 10, "2020-03-06 11:22:33", "Feeling Good"),
    (2, 10, "2022-08-05 08:05:17", "Feeling Good"),
    (2, 7, "2020-01-02 07:40:33", 'O Medo de Amar é o Medo de Ser Livre'),
    (3, 10, "2020-11-13 16:55:13", 'Feeling Good'),
    (3, 2, "2020-12-05 18:38:30", "VIRGO'S GROOVE"),
    (4, 8, "2021-08-15 17:10:10", 'Samba em Paris'),
    (5, 8, "2022-01-09 01:44:33", 'Samba em Paris'),
    (5, 5, "2020-08-06 15:23:43", 'Under Pressure'),
    (6, 7, "2017-01-24 00:31:17", 'O Medo de Amar é o Medo de Ser Livre'),
    (6, 1, "2017-10-12 12:35:20", "BREAK MY SOUL"),
    (7, 4, "2011-12-15 22:30:49", "Don't Stop Me Now"),
    (8, 4, "2012-03-17 14:56:41", "Don't Stop Me Now"),
    (9, 9, "2022-02-24 21:14:22", "The Bard's Song"),
    (10, 3, "2015-12-13 08:30:22", "ALIEN SUPERSTAR");
    

