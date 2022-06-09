CREATE DATABASE seinen;

USE seinen;

-- SQL WORKBENCH
CREATE TABLE membro(
    idMembro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(55),
    email VARCHAR(60),
    dtNasc DATE,
    cargo VARCHAR(45),
    CHECK (cargo IN('Membro', 'Diretoria')),
    cpf CHAR(11),
    telefone CHAR(9),
    senha VARCHAR(35)
);

CREATE TABLE evento(
    idEvento INT PRIMARY KEY AUTO_INCREMENT,
    nomeEvento VARCHAR(60),
    dt DATE,
    localEvento VARCHAR(60),
    descricao VARCHAR(100)
);

CREATE TABLE comissao(
    idComissao INT AUTO_INCREMENT,
    fkMembro INT,
    fkEvento INT,
    PRIMARY KEY(idComissao, fkMembro, fkEvento),
    area VARCHAR(45),
    FOREIGN KEY(fkMembro) REFERENCES membro(idMembro),
    FOREIGN KEY(fkEvento) REFERENCES evento(idEvento)
);

CREATE TABLE mural(
    idMural INT AUTO_INCREMENT,
    fkMembro INT,
    PRIMARY KEY(idMural, fkMembro),
    titulo VARCHAR(45),
    descricao VARCHAR(150),
    FOREIGN KEY(fkMembro) REFERENCES membro(idMembro)
);

truncate comissao;
truncate membro;
truncate evento;
truncate mural;

select * from membro;
select * from evento;
select * from comissao;
select * from mural;


SET FOREIGN_KEY_CHECKS=0;
SET FOREIGN_KEY_CHECKS=1;

select cargo, count(cargo) as qtdMembro from membro group by cargo;

-- SQL SERVER
CREATE TABLE membro(
    idMembro INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(55),
    email VARCHAR(60),
    dtNasc DATE,
    cargo VARCHAR(45),
    CHECK (cargo IN('Membro', 'Diretoria')),
    cpf CHAR(11),
    telefone CHAR(9),
    senha VARCHAR(35)
);

CREATE TABLE evento(
    idEvento INT PRIMARY KEY IDENTITY(1,1),
    nomeEvento VARCHAR(60),
    dt DATE,
    localEvento VARCHAR(60),
    descricao VARCHAR(100)
);

CREATE TABLE comissao(
    idComissao INT PRIMARY KEY IDENTITY(1,1),
    fkMembro INT,
    fkEvento INT,
    area VARCHAR(45),
    FOREIGN KEY(fkMembro) REFERENCES membro(idMembro),
    FOREIGN KEY(fkEvento) REFERENCES evento(idEvento)
);

CREATE TABLE mural(
    idMural INT PRIMARY KEY IDENTITY(1,1),
    fkMembro INT,
    titulo VARCHAR(45),
    descricao VARCHAR(150),
    FOREIGN KEY(fkMembro) REFERENCES membro(idMembro)
);

