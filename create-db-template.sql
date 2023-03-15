-- Active: 1676926302033@@127.0.0.1@3306@bd_smfp
CREATE DATABASE bd_SMFP;

USE bd_SMFP;

CREATE TABLE tbUsuario(
    idUsuario INT PRIMARY KEY AUTO_INCREMENT
    ,nome_usuario VARCHAR(50) NOT NULL
    ,email_usuario VARCHAR(100) NOT NULL UNIQUE
    ,senha_usuario VARCHAR(50) NOT NULL
    ,telefone_usuario VARCHAR(15) NOT NULL
);

CREATE TABLE tbConfig(
    idConfig INT PRIMARY KEY AUTO_INCREMENT
    ,tempo_dispersao INT
);

CREATE TABLE tbAmbiente(
    idAmbiente INT PRIMARY KEY AUTO_INCREMENT
    ,nome_ambiente VARCHAR(50)
    ,desc_ambiente VARCHAR(150)
);

CREATE TABLE tbSensor(
    idSensor INT PRIMARY KEY AUTO_INCREMENT
    ,porta_sensor VARCHAR(6) NOT NULL
);

INSERT INTO tbUsuario (nome_usuario, email_usuario, senha_usuario, telefone_usuario)
VALUES ('Admin', 'admin@techIdeas.com', 'admin', '(11) 9999-9999')
       ,('Itaquera', 'itaquera@shopping.com', 'itaquera123', '(11) 1111-1111')
       ,('Aricanduva', 'aricanduva@shopping.com', 'aricanduva123', '(11) 2222-2222');

INSERT INTO tbAmbiente (nome_ambiente, desc_ambiente)
VALUES ('Praça de Alimentação', 'Área de alimentação com diversas opções de restaurantes.')
    ,('Cinema', 'Salas de cinema com as últimas novidades do cinema mundial.')
    ,('Lojas de Departamento', 'Área com diversas lojas de departamento.')
    ,('Estacionamento', 'Área de estacionamento para veículos.')
    ,('Livraria', 'Loja especializada em livros de todos os gêneros.')
    ,('Academia', 'Academia com equipamentos modernos e treinadores especializados.')
    ,('Brinquedoteca', 'Espaço para crianças se divertirem com diversos brinquedos.')
    ,('Cafeteria', 'Cafeteria com diversas opções de bebidas e comidas rápidas.')
    ,('Salão de Beleza', 'Salão de beleza com profissionais qualificados.')
    ,('Pet Shop', 'Loja especializada em produtos e serviços para animais de estimação.')
    ,('Boutique', 'Loja com roupas e acessórios de grife.')
    ,('Teatro', 'Espaço para apresentações teatrais e shows musicais.');
    
INSERT INTO tbConfig (tempo_dispersao)
	VALUES (5), 
		   (12), 
           (8), 
           (17), 
           (20), 
           (3), 
           (10), 
           (19), 
           (2), 
           (15);

INSERT INTO tbSensor (porta_sensor)
VALUES ('A01')
    ,('B02')
    ,('C03')
    ,('D04')
    ,('E05')
    ,('F06')
    ,('G07')
    ,('H08')
    ,('I09')
    ,('J10')
    ,('K11')
    ,('L12');
    
SELECT * FROM tbUsuario;
SELECT * FROM tbConfig;
SELECT * FROM tbAmbiente;
SELECT * FROM tbSensor;