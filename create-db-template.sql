-- Active: 1676926302033@@127.0.0.1@3306
CREATE DATABASE bd_SMFP;

USE bd_SMFP;

CREATE TABLE tbUsuario(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT
    ,nomeUsuario VARCHAR(50) NOT NULL
    ,emailUsuario VARCHAR(100) NOT NULL UNIQUE
    ,senhaUsuario VARCHAR(50) NOT NULL
    ,telefoneUsuario VARCHAR(18) NOT NULL
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
)

CREATE TABLE tbSensor(
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    ,portaSensor VARCHAR(6) NOT NULL,
)