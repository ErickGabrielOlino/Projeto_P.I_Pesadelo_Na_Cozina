/* Grupo 09
Arthur Almeida Souza — RA01261026 
Erick Gabriel Olino — RA01261083 
Hugo Gutierrez Suenaga — RA01261072 
Leandro Bezerra Mendes — RA01261051 
Nicoly Ribeiro Baptista — RA01261073 
Pedro Henrique Passareli da Silva — RA01261040 
Samara Machata — RA01261087 
*/
USE smor;

CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (25) NOT NULL,
sobrenome VARCHAR (100) NOT NULL,
usuario VARCHAR(50) NOT NULL UNIQUE,
email VARCHAR (150) NOT NULL UNIQUE,
hashSenha VARCHAR (100) NOT NULL,
CONSTRAINT chkEmail CHECK(email LIKE ('%@%'))
);

CREATE TABLE cliente (
idCliente INT PRIMARY KEY,
cpf CHAR (15) NOT NULL UNIQUE,
Telefone VARCHAR (20) NOT NULL UNIQUE,
endereco VARCHAR (150) NOT NULL,
cep char(9) NOT NULL,
numEndereco INT NOT NULL,
complemento VARCHAR (100),
CONSTRAINT chkCep CHECK(cep LIKE '%-%')
);

CREATE TABLE contrato (
idContrato INT PRIMARY KEY AUTO_INCREMENT,
nomeRestaurante VARCHAR (50) NOT NULL,
cnpj CHAR(18) NOT NULL UNIQUE,
cep char(9) NOT NULL,
numEndereco INT NOT NULL,
complemento VARCHAR (100),
qtdAmbiente INT NOT NULL,
qtdMesa INT NOT NULL,
InfoAdcional VARCHAR (150),
CONSTRAINT chkQtdAmbiente CHECK (qtdAmbiente >= 0),
CONSTRAINT chkQtdMesa CHECK (qtdMesa >= 0)
);

CREATE TABLE ambiente (
idAmbiente INT PRIMARY KEY AUTO_INCREMENT,
numMesas INT NOT NULL,
mobilidade VARCHAR (5) NOT NULL,
NumCadeiras INT NOT NULL,
observacoes VARCHAR (150),
CONSTRAINT chkMobilidade CHECK(mobilidade IN('Fixa','Movel')),
CONSTRAINT chkNumCadeiras CHECK(NumCadeiras >= 0)
);

CREATE TABLE ambiente2 (
idAmbiente INT PRIMARY KEY AUTO_INCREMENT,
numMesas INT NOT NULL,
mobilidade VARCHAR (5) NOT NULL,
NumCadeiras INT NOT NULL,
observacoes VARCHAR (150),
CONSTRAINT chkMobilidade2 CHECK(mobilidade IN('Fixa','Movel')),
CONSTRAINT chkNumCadeiras2 CHECK(NumCadeiras >= 0)
);

CREATE TABLE mesa (
idMesa INT PRIMARY KEY AUTO_INCREMENT,
numeroMesa VARCHAR(4) NOT NULL UNIQUE,
disponibilidade VARCHAR(20),
qtdCadeiras INT ,
CONSTRAINT chkDisponibilidade CHECK(disponibilidade IN('Em Uso','Livre')),
CONSTRAINT chkQtdCadeiras CHECK (qtdCadeiras >= 0)
);

/* CREATE TABLE uso_mesa(
idUso INT PRIMARY KEY AUTO_INCREMENT,
entrada DATETIME DEFAULT (CURDATE()),
saida DATETIME DEFAULT (CURDATE()),
numeroMesa VARCHAR(4)
); */

CREATE TABLE uso_mesa(
idUso INT PRIMARY KEY AUTO_INCREMENT,
entrada DATETIME,
saida DATETIME,
numeroMesa VARCHAR(4)
);
-- insert

INSERT INTO usuario VALUES
(DEFAULT, 'Thays','Lima','SrTata','ThaysLima@outlook.com','tf28r7dqj98'),
(DEFAULT, 'Gabriel','Vicente Priska','Priska','Gabriel.priska@gmail.com','7pnc38wyreu'),
(DEFAULT, 'Paula','Viera Jesus','PaulaWin','Paula.WinAmarelo@outlook.com','491x70qk8s7');
SELECT * FROM usuario;

INSERT INTO cliente VALUES
(1,'830.814.216-51','+55 11 95837-0758','Rua machado de asis São-Paulo','09864-054',842,'Apartamento 1008'),
(2,'973.012.836-21','+55 11 97684-1497','Av dos emirados São Bernado','83764-412',1600,'Torre B Apartamento 1509'),
(3,'733.926.537-52','+55 59 96824-2491','Avenida Gloria Gaynor São-Paulo','09564-330',1025,'Apto 2550');

INSERT INTO contrato VALUES
(DEFAULT,'TatasRestaurantes','12.345.678/0001-95','09934-853',782,'',2,20,'Algumas mesas são para 6 pessoas'),
(DEFAULT,'TatasRestaurantes','47.829.130/0001-62','04567-210',154,'',1,10,'Com área externa');

INSERT INTO ambiente VALUES
(DEFAULT,'10','Fixa','40',''),
(DEFAULT,'5','Movel','20',''),
(DEFAULT,'5','Fixa','30','');

INSERT INTO ambiente2 VALUES
(DEFAULT,'5','Fixa','20',''),
(DEFAULT,'5','Fixa','30','Mesas área externa');

INSERT INTO mesa VALUES
(DEFAULT,1,'Livre','4'),
(DEFAULT,2,'Em uso','4'),
(DEFAULT,3,'Livre','4'),
(DEFAULT,4,'Livre','4'),
(DEFAULT,5,'Em uso','4'),
(DEFAULT,6,'Em uso','4'),
(DEFAULT,7,'Livre','4'),
(DEFAULT,8,'Livre','4'),
(DEFAULT,9,'Em uso','4'),
(DEFAULT,10,'Livre','4');

/*CREATE TABLE uso_mesa(
idUso INT PRIMARY KEY AUTO_INCREMENT,
entrada DATETIME default(CURDATE()),
saida DATETIME,
numeroMesa VARCHAR(4)
);
*/

INSERT INTO uso_mesa VALUE
(DEFAULT,'2026-03-09 07:18:23','2026-03-09 08:52:47',1),
(DEFAULT,'2026-03-09 08:47:15','2026-03-09 10:11:39',2),
(DEFAULT,'2026-03-09 09:05:54','2026-03-09 11:36:12',3),
(DEFAULT,'2026-03-09 10:22:31','2026-03-09 12:03:58',4),
(DEFAULT,'2026-03-09 11:14:09','2026-03-09 13:27:44',5),
(DEFAULT,'2026-03-09 12:09:36','2026-03-09 14:41:05',6),
(DEFAULT,'2026-03-09 13:33:48','2026-03-09 15:02:17',7),
(DEFAULT,'2026-03-09 14:56:02','2026-03-09 17:18:29',8),
(DEFAULT,'2026-03-09 16:07:41','2026-03-09 18:49:53',9),
(DEFAULT,'2026-03-09 18:21:27','2026-03-09 20:05:14',10);

SELECT * FROM usuario;
UPDATE usuario SET sobrenome = 'De Morais' 
	WHERE idUsuario = 2;
    
SELECT * FROM cliente;
DELETE FROM cliente WHERE idCliente = 3;

SELECT * FROM contrato;
UPDATE contrato SET InfoAdcional = ''
	WHERE idContrato = 2;

SELECT * FROM ambiente;
SELECT * FROM ambiente2;
TRUNCATE ambiente2;
SELECT * FROM uso_mesa;
SELECT entrada AS HorárioEntrada, saida AS Horário_Saída, numeroMesa AS Numero_da_Mesa FROM uso_mesa;