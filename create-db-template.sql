CREATE DATABASE bd_SMFP;

USE bd_SMFP;

CREATE TABLE tbUsuario(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT
    ,nomeUsuario VARCHAR(50) NOT NULL
    ,emailUsuario VARCHAR(100) NOT NULL UNIQUE
    ,senhaUsuario VARCHAR(50) NOT NULL
);

CREATE TABLE tbConfig(
    idConfig INT PRIMARY KEY AUTO_INCREMENT
    ,tempoDispersao INT
);

CREATE TABLE tbAmbiente(
    idAmbiente INT PRIMARY KEY AUTO_INCREMENT
    ,idUsuario INT
    ,nomeAmbiente VARCHAR(50)
    ,descAmbiente VARCHAR(150)
    ,idConfig INT 
    ,CONSTRAINT fk_tbAmbiente_idConfig FOREIGN KEY (idConfig) REFERENCES tbConfig(idConfig)
    ,CONSTRAINT fk_tbAmbiente_idUsuario FOREIGN KEY (idUsuario) REFERENCES tbUsuario(idUsuario)
);

CREATE TABLE tbSensor(
    idSensor INT PRIMARY KEY AUTO_INCREMENT
    ,idAmbiente INT
    ,portaSensor VARCHAR(6) NOT NULL
    ,CONSTRAINT fk_tbSensor_idAmbiente FOREIGN KEY (idAmbiente) REFERENCES tbAmbiente(idAmbiente)
);
