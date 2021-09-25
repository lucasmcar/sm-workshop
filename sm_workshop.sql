use  db_sm_workshop;

-- ----------------------------------------------
-- Tabela Usuario --
-- ----------------------------------------------
create table  TB_SM_USUARIO(
    ID_USUARIO int not null auto_increment,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    SENHA VARCHAR(100) NOT NULL,
    DATA_CADASTRO DATETIME,
    PRIMARY KEY(ID_USUARIO)
);

-- ----------------------------------------------
-- Tabela cliente --
-- ----------------------------------------------
create table TB_SM_CLIENTE(
    ID_CLIENTE int not null auto_increment,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    DATA_CADASTRO DATETIME,
    ID_USUARIO INT,
    PRIMARY KEY(ID_CLIENTE)
);

-- ----------------------------------------------
-- Tabela veículo --
-- ----------------------------------------------

create table TB_SM_VEICULO(
    ID_VEICULO int not null auto_increment,
    NOME VARCHAR(100) NOT NULL,
    MARCA VARCHAR(100) NOT NULL,
    PLACA VARCHAR(9) NOT NULL,
    COR VARCHAR (100) NOT NULL,
    ANO INT(4) NOT NULL,
    ID_SERVICO INT,
    ID_CLIENTE INT,
    PRIMARY KEY(ID_VEICULO)
);

-- ----------------------------------------------
-- Tabela Nível --
-- ----------------------------------------------

create table TB_SM_NIVEL(
    ID_NIVEL int not null auto_increment,
    NOME VARCHAR(100) NOT NULL,
    ID_USUARIO INT,
    PRIMARY KEY(ID_NIVEL)
);

-- ---------------------------------------------
-- Tabela Servico --
-- ---------------------------------------------
create table TB_SM_SERVICO(
    ID_SERVICO int not null auto_increment,
    SERVICO VARCHAR(100),
    DESC_SERVICO TEXT,
    DATA_ENTRADA DATE,
    DATA_PREVISTA_ENTREGA DATE,
    DATA_ENTREGA DATE,
    ID_STATUS INT,
    PRIMARY KEY(ID_SERVICO)
);

-- ---------------------------------------------
-- Tabela Status --
-- ---------------------------------------------
create table TB_SM_STATUS(
    ID_STATUS int not null auto_increment,
    ANDAMENTO VARCHAR(255),
    DIAS_ENTREGA INT,
    PRIMARY KEY(ID_STATUS)
);

-- ---------------------------------------------
-- Foreign keys --
-- ---------------------------------------------

-- ---------------------------------------------
-- Adicionar FK na tabela CLIENTE --
-- ---------------------------------------------
ALTER TABLE
    `TB_SM_CLIENTE`
ADD CONSTRAINT
    `FK_USUARIO`
FOREIGN KEY
    (`ID_USUARIO`)
REFERENCES
    `TB_SM_USUARIO` (`ID_USUARIO`);

-- ---------------------------------------------
-- Adicionar FKs na tabela Veiculo --
-- ---------------------------------------------

ALTER TABLE
    `TB_SM_VEICULO`
ADD CONSTRAINT
    `FK_SERVICO`
FOREIGN KEY
    (`ID_SERVICO`)
REFERENCES
    `TB_SM_SERVICO`(`ID_SERVICO`);

ALTER TABLE
    `TB_SM_VEICULO`
ADD CONSTRAINT
    `FK_CLIENTE`
FOREIGN KEY
    (`ID_CLIENTE`)
REFERENCES
    `TB_SM_CLIENTE` (`ID_CLIENTE`);

-- ---------------------------------------------
-- Adicionar FKs na tabela Nivel --
-- ---------------------------------------------
ALTER TABLE
    `TB_SM_NIVEL`
ADD CONSTRAINT
    `FK_USUARIO`
FOREIGN KEY
    (`ID_USUARIO`)
REFERENCES
    `TB_SM_USUARIO` (`ID_USUARIO`);

-- ---------------------------------------------
-- Adicionar FKs na tabela SERVICO --
-- ---------------------------------------------

ALTER TABLE
    `TB_SM_SERVICO`
ADD CONSTRAINT
    `FK_STATUS`
FOREIGN KEY
    (`ID_STATUS`)
REFERENCES
    `TB_SM_STATUS` (`ID_STATUS`);