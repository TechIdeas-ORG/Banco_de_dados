DROP DATABASE bd_SMFP;

CREATE DATABASE bd_SMFP;

USE bd_SMFP;

CREATE TABLE
    tbToken(
        idToken INT PRIMARY KEY AUTO_INCREMENT,
        tokenHash VARCHAR(64) UNIQUE
    );

CREATE TABLE
    tbEmpresa (
        idEmpresa INT AUTO_INCREMENT,
        fkToken INT UNIQUE,
        nomeEmpresa VARCHAR(50) NOT NULL,
        cnpjEmpresa VARCHAR(18) NOT NULL,
        PRIMARY KEY(idEmpresa, fkToken),
        CONSTRAINT fk_tbEmpresa_tbToken FOREIGN KEY (fkToken) REFERENCES tbToken(idToken) ON DELETE CASCADE
    );

CREATE TABLE
    tbUsuario(
        idUsuario INT AUTO_INCREMENT,
        fkEmpresa INT,
        nomeUsuario VARCHAR(50) NOT NULL,
        emailUsuario VARCHAR(100) NOT NULL UNIQUE,
        senhaUsuario VARCHAR(64) NOT NULL,
        CONSTRAINT fk_tbUsuario_tbEmpresa FOREIGN KEY (fkEmpresa) REFERENCES tbEmpresa(idEmpresa) ON DELETE CASCADE,
        PRIMARY KEY(idUsuario, fkEmpresa),
        fkAdministrador INT,
        FOREIGN KEY (fkAdministrador) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE
    );

CREATE TABLE
    tbAmbiente(
        idAmbiente INT AUTO_INCREMENT,
        fkEmpresa INT,
        nomeAmbiente VARCHAR(50),
        descAmbiente VARCHAR(150),
        setorAmbiente VARCHAR(35),
        minimoPessoas INT,
        mediaPessoas INT,
        maximoPessoas INT,
        CONSTRAINT fk_tbAmbiente_tbEmpresa FOREIGN KEY (fkEmpresa) REFERENCES tbEmpresa(idEmpresa) ON DELETE CASCADE,
        PRIMARY KEY(idAmbiente, fkEmpresa)
    );

CREATE TABLE
    tbSensor(
        idSensor INT AUTO_INCREMENT,
        fkAmbiente INT,
        portaSensor VARCHAR(6) NOT NULL,
        CONSTRAINT fk_tbSensor_fkAmbiente FOREIGN KEY (fkAmbiente) REFERENCES tbAmbiente(idAmbiente) ON DELETE CASCADE,
        PRIMARY KEY(idSensor, fkAmbiente)
    );

CREATE TABLE
    tbMetricas (
        idMetrica INT AUTO_INCREMENT,
        fkSensor INT,
        dateMetrica TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        valMetrica INT,
        CONSTRAINT fk_tbMetricas_fkSensor FOREIGN KEY (fkSensor) REFERENCES tbSensor(idSensor) ON DELETE CASCADE,
        PRIMARY KEY(idMetrica, fkSensor)
    );

/* INSERTS */

/* GENERATE TOKEN */

INSERT INTO tbToken(tokenHash)
VALUES (SHA2(UUID(), 256)), (SHA2(UUID(), 256)), (SHA2(UUID(), 256)), (SHA2(UUID(), 256)), (SHA2(UUID(), 256)), (SHA2(UUID(), 256)), (SHA2(UUID(), 256)), (SHA2(UUID(), 256)), (SHA2(UUID(), 256));
