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

	SELECT cargo, COUNT(cargo) AS qtdMembro FROM membro GROUP BY cargo;

	SELECT e.nomeEvento, COUNT(c.fkEvento) as QtdPessoas FROM comissao c JOIN evento e ON fkEvento = idEvento GROUP BY e.nomeEvento;

	SELECT mu.idMural AS idAviso, mu.titulo, mu.descricao, mu.fkMembro, me.idMembro AS idUsuario, me.nome, me.email, me.senha 
    FROM mural mu JOIN membro me ON fkMembro = idMembro;
    
    SELECT idEvento, nomeEvento FROM evento;




-- INSERTS
INSERT INTO membro (nome, email, dtNasc, cargo, cpf, telefone, senha)
VALUES
  ("Violet Snider","proin.dolor@google.org","2004-02-15", 'Diretoria', 464, "995153858", 114),
  ("Shad Mcdaniel","dui.nec@aol.edu","1998-04-06", 'Diretoria', 646,"953590835",151),
  ("Davis Malone","ipsum.suspendisse.sagittis@aol.com","2002-04-18", 'Diretoria', 675,"952111811",178),
  ("George Dixon","mattis.velit@outlook.ca","2002-01-30", 'Diretoria', 957,"913814598",141),
  ("Michelle Barry","tristique.pellentesque@yahoo.com","2001-08-09", 'Diretoria', 525,"972243188",112),
  ("Demetria Riggs","semper.nam.tempor@icloud.couk","2001-10-19", 'Diretoria', 217,"911473784",178),
  ("Fiona Dudley","elit.elit.fermentum@outlook.com","2001-08-30", 'Diretoria', 989,"918682635",188),
  ("Shelley Clark","lacus.quisque@yahoo.couk","1997-09-30",'Diretoria', 873, "987241227",165),
  ("Jonah Foster","cursus.a@hotmail.edu","2001-01-20", 'Diretoria', 709,"952394488",107),
  ("Hakeem Parks","semper.nam.tempor@outlook.net","1999-05-20", 'Diretoria', 423,"987268512",144);
  
INSERT INTO membro (nome, email, dtNasc, cargo, cpf, telefone, senha)
VALUES
  ("Remedios Pratt","sem.molestie@icloud.couk","2004-07-06", 'Membro', 944,"974788290",129),
  ("Malik Irwin","quis.accumsan@outlook.org","2000-10-30", 'Membro', 885,"958265360",178),
  ("Shafira Mitchell","adipiscing@google.com","1999-09-29", 'Membro', 380,"938145119",147),
  ("Silas Porter","ornare.placerat@hotmail.com","1999-10-21", 'Membro', 847,"984858701",179),
  ("Evelyn Stout","adipiscing.elit.curabitur@google.edu","2000-02-11", 'Membro', 393,"978417451",182),
  ("Tanner Haynes","mauris.sit@yahoo.couk","1998-05-05", 'Membro', 226,"983445295",130),
  ("Colleen Neal","ridiculus.mus@google.edu","2004-01-19", 'Membro', 956,"958845265",189),
  ("Jonas Puckett","ac@yahoo.edu","2004-09-10", 'Membro', 322,"969123364",136),
  ("Basil Sears","nulla.interdum@outlook.edu","1998-05-15", 'Membro', 243,"944071357",149),
  ("Jaquelyn Lawson","sed.orci.lobortis@yahoo.ca","1999-01-14", 'Membro', 125,"984642791",182);
INSERT INTO membro (nome, email, dtNasc, cargo, cpf, telefone, senha)
VALUES
  ("Tyrone Gillespie","dignissim@icloud.edu","2001-11-22", 'Membro', 899,"962493814",122),
  ("Rina Chase","velit.eu@yahoo.com","1999-09-18", 'Membro', 374,"971784583",108),
  ("Odette Barry","integer@outlook.ca","2004-07-18", 'Membro', 641,"964464946",169),
  ("Thomas Rosales","aenean.gravida@google.net","2003-12-08", 'Membro', 659,"970224556",178),
  ("Dane Palmer","consectetuer.cursus@google.edu","1999-12-10", 'Membro', 530,"980813825",194),
  ("Neil Simmons","lacus.varius.et@outlook.edu","2001-10-02", 'Membro', 266,"956428972",156),
  ("Leah Fuller","a.feugiat@google.couk","2002-08-15", 'Membro', 761,"933643639",123),
  ("Deacon Greene","libero.dui@yahoo.net","2004-04-26", 'Membro', 666,"963263012",158),
  ("Carson Short","suspendisse@protonmail.ca","2001-02-07", 'Membro', 303,"942912631",124),
  ("Ivy Bradford","cras.interdum.nunc@icloud.couk","2002-06-10", 'Membro', 492,"996508362",147);
INSERT INTO membro (nome, email, dtNasc, cargo, cpf, telefone, senha)
VALUES
  ("Cleo Gibbs","sociis.natoque@outlook.com","2001-08-15", 'Membro', 868,"938651555",163),
  ("TaShya Todd","quis.pede@hotmail.ca","1997-12-24", 'Membro', 169,"982480371",178),
  ("George England","elit.nulla@aol.org","2001-07-09", 'Membro', 433,"966339319",113),
  ("Geraldine Slater","volutpat.nunc@yahoo.edu","2003-08-09", 'Membro', 729,"920726286",175),
  ("Brynn Moon","non.sapien.molestie@protonmail.couk","1999-08-23", 'Membro', 858,"988452238",118),
  ("Adele Dominguez","magna@yahoo.net","2001-05-16", 'Membro', 380,"939466801",181),
  ("Damian Robinson","nulla@protonmail.ca","2000-06-04", 'Membro', 283,"931702454",142),
  ("TaShya French","mus.proin@google.ca","2000-12-23", 'Membro', 608,"912267247",161),
  ("Ariel Cervantes","diam.vel@protonmail.ca","2003-06-11", 'Membro', 350,"944616145",107),
  ("Robert Dean","aenean@aol.net","2000-03-31", 'Membro', 756,"952258529",109);


-- SQL SERVER
-- CREATE TABLE membro(
--     idMembro INT PRIMARY KEY IDENTITY(1,1),
--     nome VARCHAR(55),
--     email VARCHAR(60),
--     dtNasc DATE,
--     cargo VARCHAR(45),
--     CHECK (cargo IN('Membro', 'Diretoria')),
--     cpf CHAR(11),
--     telefone CHAR(9),
--     senha VARCHAR(35)
-- );

-- CREATE TABLE evento(
--     idEvento INT PRIMARY KEY IDENTITY(1,1),
--     nomeEvento VARCHAR(60),
--     dt DATE,
--     localEvento VARCHAR(60),
--     descricao VARCHAR(100)
-- );

-- CREATE TABLE comissao(
--     idComissao INT PRIMARY KEY IDENTITY(1,1),
--     fkMembro INT,
--     fkEvento INT,
--     area VARCHAR(45),
--     FOREIGN KEY(fkMembro) REFERENCES membro(idMembro),
--     FOREIGN KEY(fkEvento) REFERENCES evento(idEvento)
-- );

-- CREATE TABLE mural(
--     idMural INT PRIMARY KEY IDENTITY(1,1),
--     fkMembro INT,
--     titulo VARCHAR(45),
--     descricao VARCHAR(150),
--     FOREIGN KEY(fkMembro) REFERENCES membro(idMembro)
-- );

