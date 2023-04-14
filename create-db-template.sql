-- Active: 1679521204876@@127.0.0.1@3306@bd_smfp
DROP DATABASE bd_smfp;

CREATE DATABASE bd_SMFP;

USE bd_SMFP;

CREATE TABLE tbToken(
    idToken INT PRIMARY KEY AUTO_INCREMENT
    ,tokenHash VARCHAR(64) UNIQUE
);


CREATE TABLE tbConfig(
    idConfig INT PRIMARY KEY AUTO_INCREMENT
    ,tempoDispersao INT
);

CREATE TABLE tbSetor(
    idSetor INT PRIMARY KEY AUTO_INCREMENT
    ,nomeSetor VARCHAR(50)
);

CREATE TABLE tbAmbiente(
    idAmbiente INT PRIMARY KEY AUTO_INCREMENT
    ,idSetor INT
    ,nomeAmbiente VARCHAR(50)
    ,descAmbiente VARCHAR(150)
    ,setorAmbiente INT
    ,idConfig INT 
    ,CONSTRAINT fk_tbAmbiente_idSetor FOREIGN KEY (idSetor) REFERENCES tbSetor(idSetor)
    ,CONSTRAINT fk_tbAmbiente_idConfig FOREIGN KEY (idConfig) REFERENCES tbConfig(idConfig)
);


CREATE TABLE tbSensor(
    idSensor INT PRIMARY KEY AUTO_INCREMENT
    ,idAmbiente INT
    ,portaSensor VARCHAR(6) NOT NULL
    ,CONSTRAINT fk_tbSensor_idAmbiente FOREIGN KEY (idAmbiente) REFERENCES tbAmbiente(idAmbiente)
);

CREATE TABLE tbMetricas (
    idMetrica INT PRIMARY KEY AUTO_INCREMENT
    ,idSensor INT
    ,dateMetrica TIMESTAMP NOT NULL
    ,valMetrica INT
    ,CONSTRAINT fk_tbMetricas_idSensor FOREIGN KEY (idSensor) REFERENCES tbSensor(idSensor)
);

CREATE TABLE tbEmpresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT
    ,fkToken INT
    ,fkAmbiente INT
    ,nomeEmpresa VARCHAR(50) NOT NULL
    ,cnpjEmpresa VARCHAR(18) NOT NULL
    ,CONSTRAINT fk_tbEmpresa_tbToken FOREIGN KEY (fkToken) REFERENCES tbToken(idToken)
    ,CONSTRAINT fk_tbEmpresa_tbAmbiente FOREIGN KEY (fkAmbiente) REFERENCES tbAmbiente(idAmbiente)
);

CREATE TABLE tbUsuario(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT
    ,fkEmpresa INT
    ,nomeUsuario VARCHAR(50) NOT NULL
    ,emailUsuario VARCHAR(100) NOT NULL UNIQUE
    ,senhaUsuario VARCHAR(64) NOT NULL
    ,CONSTRAINT fk_tbUsuario_tbEmpresa FOREIGN KEY (fkEmpresa) REFERENCES tbEmpresa(idEmpresa)
);
/* INSERTS */

/* GENERATE TOKEN */
INSERT INTO tbToken(tokenHash)
    VALUES (SHA2(UUID(), 256));

INSERT INTO tbEmpresa(idToken, nomeEmpresa, cnpjEmpresa)
VALUES
    (1, 'Shopping A', '11.111.111/0001-11')
    ,(2, 'Shopping B', '22.222.222/0001-22')
    ,(3, 'Shopping C', '33.333.333/0001-33')
    ,(4, 'Shopping D', '44.444.444/0001-44')
    ,(5, 'Shopping E', '55.555.555/0001-55')
    ,(6, 'Shopping F', '66.666.666/0001-66')
    ,(7, 'Shopping G', '77.777.777/0001-77')
    ,(8, 'Shopping H', '88.888.888/0001-88');

INSERT INTO tbUsuario (`idEmpresa`,`nomeUsuario`,`emailUsuario`,`senhaUsuario`)
VALUES
    (1, 'João Silva', 'joao.silva@exemplo.com', SHA2('senha123', 256))
    ,(1, 'Maria Santos', 'maria.santos@exemplo.com', SHA2('senha456', 256))
    ,(2, 'Pedro Oliveira', 'pedro.oliveira@exemplo.com', SHA2('senha789', 256))
    ,(2, 'Carla Ferreira', 'carla.ferreira@exemplo.com', SHA2('senhaabc', 256))
    ,(3, 'Lucas Costa', 'lucas.costa@exemplo.com', SHA2('senhaxyz', 256))
    ,(3, 'Ana Souza', 'ana.souza@exemplo.com', SHA2('senha123', 256))
    ,(4, 'Paulo Rodrigues', 'paulo.rodrigues@exemplo.com', SHA2('senha456', 256))
    ,(4, 'Fernanda Alves', 'fernanda.alves@exemplo.com', SHA2('senha789', 256))
    ,(5, 'Rafaela Pereira', 'rafaela.pereira@exemplo.com', SHA2('senhaabc', 256))
    ,(5, 'Marcelo Santos', 'marcelo.santos@exemplo.com', SHA2('senhaxyz', 256))
    ,(6, 'Amanda Ferreira', 'amanda.ferreira@exemplo.com', SHA2('senha123', 256))
    ,(6, 'Thiago Costa', 'thiago.costa@exemplo.com', SHA2('senha456', 256))
    ,(7, 'Gabriela Oliveira', 'gabriela.oliveira@exemplo.com', SHA2('senha789', 256))
    ,(7, 'Marina Souza', 'marina.souza@exemplo.com', SHA2('senhaabc', 256))
    ,(8, 'Vinícius Rodrigues', 'vinicius.rodrigues@exemplo.com', SHA2('senhaxyz', 256))
    ,(8, 'Bruna Alves', 'bruna.alves@exemplo.com', SHA2('senha123', 256));

INSERT INTO tbSetor (`nomeSetor`)
VALUES
    ('Vestuário')
    ,('Calçados')
    ,('Acessórios')
    ,('Joalheria e Bijuterias')
    ,('Cosméticos e Perfumaria')
    ,('Livros e Papelaria')
    ,('Esportes')
    ,('Brinquedos e Jogos')
    ,('Eletrônicos')
    ,('Cama, Mesa e Banho')
    ,('Móveis e Decoração')
    ,('Supermercado')
    ,('Farmácia')
    ,('Restaurantes')
    ,('Fast-food')
    ,('Cinema');


INSERT INTO tbConfig (tempoDispersao) VALUES (5),(5),(5),(30),(30),(60),(90),(10),(10),(10);

INSERT INTO tbAmbiente (`idConfig`, `idSetor`, `nomeAmbiente`, `descAmbiente`) 
VALUES 
   (1, 1, 'Loja de Roupa 1', 'Ambiente para lojas de roupas femininas')
    ,(2, 1, 'Loja de Roupa 2', 'Ambiente para lojas de roupas masculinas')
    ,(3, 1, 'Loja de Roupa 3', 'Ambiente para lojas de roupas infantis')
    ,(4, 15, 'Fast Food', 'Ambiente para estabelecimentos de fast food')
    ,(5, 15, 'Restaurantes', 'Ambiente para restaurantes')
    ,(6, 8, 'Parque de Diversões', 'Ambiente para o parque de diversões')
    ,(7, 16, 'Salas de Cinema', 'Ambiente para salas de cinema')
    ,(8, 2, 'Lojas de Calçados', 'Ambiente para lojas de calçados')
    ,(9, 3, 'Lojas de Acessórios', 'Ambiente para lojas de acessórios')
    ,(10, 9, 'Lojas de Eletrônicos', 'Ambiente para lojas de eletrônicos')
    ,(11, 9, 'Lojas de Eletrodomésticos', 'Ambiente para lojas de eletrodomésticos');

INSERT INTO tbambiente_tbusuario (`idAmbiente`, `idUsuario`)
VALUES 
    (1, 1)
    ,(2, 1)
    ,(3, 1)
    ,(4, 1)
    ,(5, 1)
    ,(6, 2)
    ,(7, 2)
    ,(8, 2)
    ,(9, 2)
    ,(10, 2)
    ,(11, 2);

INSERT INTO tbSensor (`idAmbiente`, `portaSensor`)
VALUES
    (1, 'COM1')
    ,(2, 'COM2')
    ,(3, 'COM3')
    ,(4, 'COM4')
    ,(5, 'COM5')
    ,(6, 'COM6')
    ,(7, 'COM7')
    ,(8, 'COM8')
    ,(9, 'COM9')
    ,(10, 'COM10')
    ,(11, 'COM11');

INSERT INTO tbMetricas (idSensor, dateMetrica, valMetrica)
VALUES
    (1, NOW(), 1)
    ,(2, NOW(), 1)
    ,(3, NOW(), 1)
    ,(4, NOW(), 1)
    ,(5, NOW(), 1)
    ,(6, NOW(), 1)
    ,(7, NOW(), 1)
    ,(8, NOW(), 1)
    ,(9, NOW(), 1)
    ,(10, NOW(), 1)
    ,(11, NOW(), 1);

/* SELECTS */
