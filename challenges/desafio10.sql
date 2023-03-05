-- Descomente e altere as linhas abaixo:

USE SpotifyClone;
CREATE TABLE favorites(
id_users INT,
id_music INT,
PRIMARY KEY(id_users, id_music),
FOREIGN KEY(id_users) REFERENCES users(id_users),
FOREIGN KEY(id_music) REFERENCES cancoes(id_cancao)
) engine = InnoDB;

INSERT INTO favorites (id_users, id_music) VALUES
	('1', '3'),
	('1', '6'),
	('1', '10'),
	('2', '4'),
	('3', '1'),
	('3', '3'),
	('4', '7'),
	('4', '4'),
	('5', '10'),
	('5', '2'),
	('8', '4'),
	('9', '7'),
	('10', '3');