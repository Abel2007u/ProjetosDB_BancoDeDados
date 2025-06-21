/* Lógico_A8-OngDB: */

CREATE TABLE Doador (
    Id_Doador INTEGER PRIMARY KEY,
    nomeDoador VARCHAR,
    tipoDoador VARCHAR,
    CPFCNPJDoador INTEGER UNIQUE,
    emailDoador VARCHAR,
    telefoneDoador VARCHAR,
    enderecoDoador VARCHAR,
    dataCadastroDoador DATE
);

CREATE TABLE Voluntario (
    id_Voluntario INTEGER PRIMARY KEY,
    nomeVoluntario VARCHAR,
    CPFVoluntario INTEGER UNIQUE,
    emailVoluntario VARCHAR,
    telefoneVoluntario VARCHAR,
    habilidadeVoluntario VARCHAR,
    disponibilidadeVoluntario VARCHAR
);

CREATE TABLE Projeto (
    id_Projeto INTEGER PRIMARY KEY,
    nomeProjeto VARCHAR,
    descricaoProjeto VARCHAR,
    dataInicioProjeto DATE,
    dataFimPrevistaProjeto DATE,
    statusProjeto VARCHAR,
    orcamentoProjeto INTEGER
);

CREATE TABLE Doacao (
    id_Doacoes INTEGER PRIMARY KEY,
    valorDoacao DOUBLE,
    dataDoacao DATE,
    tipoDoacao VARCHAR,
    descricaoItemDoacao VARCHAR,
    fk_Projeto_id_Projeto INTEGER,
    fk_Doador_id_Doador INTEGER
);

CREATE TABLE Evento (
    id_Evento INTEGER PRIMARY KEY,
    nomeEvento VARCHAR,
    descricaoEvento VARCHAR,
    dataEvento DATE,
    localEvento VARCHAR,
    tipoEvento VARCHAR
);

CREATE TABLE Fazer (
    fk_Doacao_id_Doacoes INTEGER,
    fk_Doador_Id_Doador INTEGER
);

CREATE TABLE Participar (
    fk_Voluntario_id_Voluntario INTEGER,
    fk_Projeto_id_Projeto INTEGER,
    dataInicioParticipacao DATE,
    dataFimParticipacao DATE
);

CREATE TABLE Estar (
    fk_Doador_Id_Doador INTEGER,
    fk_Evento_id_Evento INTEGER,
    dataInscricao DATE
);

CREATE TABLE Colaborar (
    fk_Voluntario_id_Voluntario INTEGER,
    fk_Evento_id_Evento INTEGER,
    funcaoExercida VARCHAR
);
 
ALTER TABLE Doacao ADD CONSTRAINT FK_Doacao_2
    FOREIGN KEY (fk_Projeto_id_Projeto)
    REFERENCES Projeto (id_Projeto)
    ON DELETE CASCADE;
 
ALTER TABLE Doacao ADD CONSTRAINT FK_Doacao_3
    FOREIGN KEY (fk_Doador_id_Doador???)
    REFERENCES ??? (???);
 
ALTER TABLE Fazer ADD CONSTRAINT FK_Fazer_1
    FOREIGN KEY (fk_Doacao_id_Doacoes)
    REFERENCES Doacao (id_Doacoes)
    ON DELETE RESTRICT;
 
ALTER TABLE Fazer ADD CONSTRAINT FK_Fazer_2
    FOREIGN KEY (fk_Doador_Id_Doador)
    REFERENCES Doador (Id_Doador)
    ON DELETE RESTRICT;
 
ALTER TABLE Participar ADD CONSTRAINT FK_Participar_1
    FOREIGN KEY (fk_Voluntario_id_Voluntario)
    REFERENCES Voluntario (id_Voluntario)
    ON DELETE RESTRICT;
 
ALTER TABLE Participar ADD CONSTRAINT FK_Participar_2
    FOREIGN KEY (fk_Projeto_id_Projeto)
    REFERENCES Projeto (id_Projeto)
    ON DELETE RESTRICT;
 
ALTER TABLE Estar ADD CONSTRAINT FK_Estar_1
    FOREIGN KEY (fk_Doador_Id_Doador)
    REFERENCES Doador (Id_Doador)
    ON DELETE RESTRICT;
 
ALTER TABLE Estar ADD CONSTRAINT FK_Estar_2
    FOREIGN KEY (fk_Evento_id_Evento)
    REFERENCES Evento (id_Evento)
    ON DELETE RESTRICT;
 
ALTER TABLE Colaborar ADD CONSTRAINT FK_Colaborar_1
    FOREIGN KEY (fk_Voluntario_id_Voluntario)
    REFERENCES Voluntario (id_Voluntario)
    ON DELETE RESTRICT;
 
ALTER TABLE Colaborar ADD CONSTRAINT FK_Colaborar_2
    FOREIGN KEY (fk_Evento_id_Evento)
    REFERENCES Evento (id_Evento)
    ON DELETE RESTRICT;