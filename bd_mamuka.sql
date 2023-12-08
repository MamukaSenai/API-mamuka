DROP DATABASE bd_mamuka;

CREATE DATABASE bd_mamuka;

USE bd_mamuka;

drop table tb_usuario;

drop table tb_projeto;

drop table tb_tarefa;

select * from tb_projeto;

CREATE TABLE tb_usuario(
id BINARY(16) NOT NULL,
nome VARCHAR(255) NOT NULL,
cpf VARCHAR(255) NOT NULL UNIQUE,
dataNascimento DATE,
statusAtividade BOOL,
departamento VARCHAR(255) NOT NULL,
responsavel BINARY(16) NOT NULL,
perfil VARCHAR(255) NOT NULL,
cargo VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
senha VARCHAR(255) NOT NULL UNIQUE,
PRIMARY KEY (id)
);

DROP TABLE tb_projeto;

CREATE TABLE tb_projeto (
id BINARY(16) NOT NULL,
nomeProjeto VARCHAR(255) NOT NULL,
statusProjeto VARCHAR(255) NOT NULL,
dataInicio VARCHAR(255),
dataConclusao VARCHAR(255),
id_usuario BINARY(16),
PRIMARY KEY (id),
FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id)
);

DROP TABLE tb_tarefa;

CREATE TABLE tb_tarefa (
id BINARY(16) NOT NULL,
nomeTarefa VARCHAR(255) NOT NULL,
statusTarefa VARCHAR(255) NOT NULL,
dataInicio VARCHAR(255),
dataConclusao VARCHAR(255),
id_usuario BINARY(16),
id_projeto BINARY(16) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id),
FOREIGN KEY (id_projeto) REFERENCES tb_projeto (id)
);

INSERT INTO tb_projeto (id, nomeProjeto, statusProjeto, dataInicio, dataConclusao, id_usuario) VALUES
(UUID_TO_BIN(UUID()), 'Projeto A', 'Em Andamento', '2023-01-15 08:00:00', '2023-03-30 17:00:00', UUID_TO_BIN('24fe413e-17d1-4f9c-a1f5-f092d21bffbb')),
(UUID_TO_BIN(UUID()), 'Projeto B', 'Concluído', '2022-11-01 10:30:00', '2023-01-10 15:45:00', UUID_TO_BIN('24fe413e-17d1-4f9c-a1f5-f092d21bffbb'));