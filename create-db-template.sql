-- Active: 1679521204876@@127.0.0.1@3306@bd_smfp
DROP DATABASE bd_smfp;

CREATE DATABASE bd_SMFP;

USE bd_SMFP;

CREATE TABLE tbToken(
    idToken INT PRIMARY KEY AUTO_INCREMENT
    ,tokenHash VARCHAR(64) UNIQUE
);

CREATE TABLE tbEmpresa (
    idEmpresa INT AUTO_INCREMENT
    ,fkToken INT UNIQUE
    ,nomeEmpresa VARCHAR(50) NOT NULL
    ,cnpjEmpresa VARCHAR(18) NOT NULL
    ,PRIMARY KEY(idEmpresa, fkToken)
    ,CONSTRAINT fk_tbEmpresa_tbToken FOREIGN KEY (fkToken) REFERENCES tbToken(idToken)
);

CREATE TABLE tbUsuario(
    idUsuario INT
    ,fkEmpresa INT
    ,nomeUsuario VARCHAR(50) NOT NULL
    ,emailUsuario VARCHAR(100) NOT NULL UNIQUE
    ,senhaUsuario VARCHAR(64) NOT NULL
    ,CONSTRAINT fk_tbUsuario_tbEmpresa FOREIGN KEY (fkEmpresa) REFERENCES tbEmpresa(idEmpresa)
    ,PRIMARY KEY(idUsuario, fkEmpresa)
);

CREATE TABLE tbSetor(
    idSetor INT PRIMARY KEY AUTO_INCREMENT
    ,nomeSetor VARCHAR(50)
);

CREATE TABLE tbAmbiente(
    idAmbiente INT
    ,fkEmpresa INT
    ,fkSetor INT
    ,tempoDispersao INT
    ,nomeAmbiente VARCHAR(50)
    ,descAmbiente VARCHAR(150)
    ,CONSTRAINT fk_tbAmbiente_tbEmpresa FOREIGN KEY (fkEmpresa) REFERENCES tbEmpresa(idEmpresa)
    ,CONSTRAINT fk_tbAmbiente_tbSetor FOREIGN KEY (fkSetor) REFERENCES tbSetor(idSetor)
    ,PRIMARY KEY(idAmbiente, fkEmpresa)
);

CREATE TABLE tbSensor(
    idSensor INT
    ,fkAmbiente INT
    ,fkEmpresa INT
    ,portaSensor VARCHAR(6) NOT NULL
    ,CONSTRAINT fk_tbSensor_fkAmbiente FOREIGN KEY (fkAmbiente) REFERENCES tbAmbiente(idAmbiente)
    ,CONSTRAINT fk_tbSensor_tbEmpresa FOREIGN KEY (fkEmpresa) REFERENCES tbEmpresa(idEmpresa)
    ,PRIMARY KEY(idSensor, fkAmbiente, fkEmpresa)
);

CREATE TABLE tbMetricas (
    idMetrica INT
    ,fkSensor INT
    ,fkAmbiente INT
    ,fkEmpresa INT
    ,dateMetrica TIMESTAMP NOT NULL
    ,valMetrica INT
    ,CONSTRAINT fk_tbMetricas_fkSensor FOREIGN KEY (fkSensor) REFERENCES tbSensor(idSensor)
    ,CONSTRAINT fk_tbMetricas_fkAmbiente FOREIGN KEY (fkAmbiente) REFERENCES tbAmbiente(idAmbiente)
    ,CONSTRAINT fk_tbMetricas_tbEmpresa FOREIGN KEY (fkEmpresa) REFERENCES tbEmpresa(idEmpresa)
    ,PRIMARY KEY(idMetrica, fkSensor, fkAmbiente, fkEmpresa)
);

/* INSERTS */

/* GENERATE TOKEN */
INSERT INTO tbToken(tokenHash)
    VALUES (SHA2(UUID(), 256))
        ,(SHA2(UUID(), 256))
        ,(SHA2(UUID(), 256))
        ,(SHA2(UUID(), 256))
        ,(SHA2(UUID(), 256))
        ,(SHA2(UUID(), 256))
        ,(SHA2(UUID(), 256))
        ,(SHA2(UUID(), 256));

INSERT INTO tbEmpresa(`fkToken`, `nomeEmpresa`, `cnpjEmpresa`)
VALUES
    (1, 'Shopping A', '11.111.111/0001-11')
    ,(2, 'Shopping B', '22.222.222/0001-22')
    ,(3, 'Shopping C', '33.333.333/0001-33')
    ,(4, 'Shopping D', '44.444.444/0001-44')
    ,(5, 'Shopping E', '55.555.555/0001-55')
    ,(6, 'Shopping F', '66.666.666/0001-66')
    ,(7, 'Shopping G', '77.777.777/0001-77')
    ,(8, 'Shopping H', '88.888.888/0001-88');

INSERT INTO tbUsuario (`fkEmpresa`, `idUsuario`,`nomeUsuario`,`emailUsuario`,`senhaUsuario`)
VALUES
    (1, 1, 'João Silva', 'joao.silva@exemplo.com', SHA2('senha123', 256))
    ,(1, 2, 'Maria Santos', 'maria.santos@exemplo.com', SHA2('senha456', 256))
    ,(2, 1, 'Pedro Oliveira', 'pedro.oliveira@exemplo.com', SHA2('senha789', 256))
    ,(2, 2, 'Carla Ferreira', 'carla.ferreira@exemplo.com', SHA2('senhaabc', 256))
    ,(3, 1, 'Lucas Costa', 'lucas.costa@exemplo.com', SHA2('senhaxyz', 256))
    ,(3, 2, 'Ana Souza', 'ana.souza@exemplo.com', SHA2('senha123', 256))
    ,(4, 1, 'Paulo Rodrigues', 'paulo.rodrigues@exemplo.com', SHA2('senha456', 256))
    ,(4, 2, 'Fernanda Alves', 'fernanda.alves@exemplo.com', SHA2('senha789', 256))
    ,(5, 1, 'Rafaela Pereira', 'rafaela.pereira@exemplo.com', SHA2('senhaabc', 256))
    ,(5, 2, 'Marcelo Santos', 'marcelo.santos@exemplo.com', SHA2('senhaxyz', 256))
    ,(6, 1, 'Amanda Ferreira', 'amanda.ferreira@exemplo.com', SHA2('senha123', 256))
    ,(6, 2, 'Thiago Costa', 'thiago.costa@exemplo.com', SHA2('senha456', 256))
    ,(7, 1, 'Gabriela Oliveira', 'gabriela.oliveira@exemplo.com', SHA2('senha789', 256))
    ,(7, 2, 'Marina Souza', 'marina.souza@exemplo.com', SHA2('senhaabc', 256))
    ,(8, 1, 'Vinícius Rodrigues', 'vinicius.rodrigues@exemplo.com', SHA2('senhaxyz', 256))
    ,(8, 2, 'Bruna Alves', 'bruna.alves@exemplo.com', SHA2('senha123', 256));

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

INSERT INTO tbAmbiente (`fkEmpresa`, `idAmbiente`, `fkSetor`, `tempoDispersao`, `nomeAmbiente`, `descAmbiente`) 
VALUES 
   (1, 1,  1, 30, 'Loja de Roupa 1', 'Ambiente para lojas de roupas femininas')
    ,(1, 2, 1, 25, 'Loja de Roupa 2', 'Ambiente para lojas de roupas masculinas')
    ,(2, 1, 1, 28, 'Loja de Roupa 3', 'Ambiente para lojas de roupas infantis')
    ,(2, 2, 15, 10, 'Fast Food', 'Ambiente para estabelecimentos de fast food')
    ,(3, 1, 14, 60, 'Restaurantes', 'Ambiente para restaurantes')
    ,(3, 2, 8, 120, 'Parque de Diversões', 'Ambiente para o parque de diversões')
    ,(4, 1, 16, 120, 'Salas de Cinema', 'Ambiente para salas de cinema')
    ,(4, 2, 2, 18, 'Lojas de Calçados', 'Ambiente para lojas de calçados')
    ,(5, 1, 3, 13, 'Lojas de Acessórios', 'Ambiente para lojas de acessórios')
    ,(5, 2, 9, 10, 'Lojas de Eletrônicos', 'Ambiente para lojas de eletrônicos')
    ,(6, 1, 11, 12,'Lojas de Eletrodomésticos', 'Ambiente para lojas de eletrodomésticos');


INSERT INTO tbSensor (`fkEmpresa`, `fkAmbiente`, `idSensor`, `portaSensor`)
VALUES
    (1, 1, 1, 'COM1')
    ,(1, 2, 1, 'COM2')
    ,(2, 1, 1, 'COM3')
    ,(2, 2, 1, 'COM4')
    ,(3, 1, 1, 'COM5')
    ,(3, 2, 1, 'COM6')
    ,(4, 1, 1, 'COM7')
    ,(4, 2, 1, 'COM8')
    ,(5, 1, 1, 'COM9')
    ,(5, 2, 1, 'COM10')
    ,(6, 1, 1, 'COM11');

INSERT INTO tbMetricas (`fkEmpresa`, `fkAmbiente`, `fkSensor`, `idMetrica`, `dateMetrica`, `valMetrica`)
VALUES
    (1, 1, 1, 1, NOW(), 1)
    ,(1, 2, 1, 1, NOW(), 1)
    ,(2, 1, 1, 1, NOW(), 1)
    ,(2, 2, 1, 1, NOW(), 1)
    ,(3, 1, 1, 1, NOW(), 1)
    ,(3, 2, 1, 1, NOW(), 1)
    ,(4, 1, 1, 1, NOW(), 1)
    ,(4, 2, 1, 1, NOW(), 1)
    ,(5, 1, 1, 1, NOW(), 1)
    ,(5, 2, 1, 1, NOW(), 1)
    ,(6, 1, 1, 1, NOW(), 1);

    
/* SELECTS */

/* TODOS OS DADOS */
SELECT * FROM tbToken;
SELECT * FROM tbEmpresa;
SELECT * FROM tbUsuario;
SELECT * FROM tbSetor;
SELECT * FROM tbAmbiente;
SELECT * FROM tbSensor;
SELECT * FROM tbMetricas;

/* NOME, EMAIL, NOME DA EMPRESA, ID DO TOKEN DOS USUARIOS DE CADA EMPRESA */
SELECT tbUsuario.`nomeUsuario`, tbUsuario.`emailUsuario`, tbEmpresa.`nomeEmpresa`, tbEmpresa.`fkToken`
    FROM tbUsuario INNER JOIN tbEmpresa 
        ON tbUsuario.`fkEmpresa` = tbEmpresa.`idEmpresa`;

/* VALOR E DATA DAS METRICAS DO SENSOR QUE ESTÁ NO AMBIENTE 'Loja de Roupa 1' DA EMPRESA 'Shopping A' */
SELECT tbMetricas.`valMetrica`, tbMetricas.`dateMetrica` 
    FROM tbMetricas INNER JOIN tbAmbiente
        ON tbMetricas.`fkAmbiente` = tbAmbiente.`idAmbiente`
    INNER JOIN tbEmpresa
        ON tbMetricas.`fkEmpresa` = tbEmpresa.`idEmpresa`
    WHERE tbAmbiente.`nomeAmbiente` = 'Loja de Roupa 1' AND
        tbEmpresa.`nomeEmpresa` = 'Shopping A';
