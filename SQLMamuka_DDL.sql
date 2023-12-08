CREATE DATABASE bd_Mamuka;

USE bd_Mamuka;

CREATE TABLE tb_tipousuario (
id  BINARY(16) NOT NULL,
tipo_usuario VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE tb_usuario (
id BINARY(16) NOT NULL,
id_tipousuario BINARY(16) NOT NULL,
nome VARCHAR(255) NOT NULL,
cpf VARCHAR(255) NOT NULL, /*confirmar*/
data_nascimento DATE,
status_atividade BOOL,
departamento VARCHAR(255) NOT NULL,
id_responsavel BINARY(16) NOT NULL, /* melhor id(responsavel) para api */
perfil VARCHAR(255) NOT NULL,
cargo VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
senha VARCHAR(255) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY(id_tipousuario) REFERENCES tb_tipousuario(id),
UNIQUE KEY email (email)
);

CREATE TABLE tb_projeto (
id BINARY(16) NOT NULL,
id_gestor BINARY(16) NOT NULL,
nome_projeto VARCHAR(255) NOT NULL,
status_projeto VARCHAR(255) NOT NULL,
data_inicio DATETIME,
data_conclusao DATETIME,
PRIMARY KEY (id),
FOREIGN KEY(id_gestor) REFERENCES tb_usuario(id)
);

CREATE TABLE tb_tarefa(
id BINARY(16) NOT NULL,
id_dev BINARY(16) NOT NULL,
id_projeto BINARY(16) NOT NULL,
nome_tarefa VARCHAR(255) NOT NULL,
status_tarefa VARCHAR(255) NOT NULL,
data_inicio DATETIME,
data_conclusao DATETIME,
PRIMARY KEY (id),
FOREIGN KEY(id_dev) REFERENCES tb_usuario(id),
FOREIGN KEY(id_projeto) REFERENCES tb_projeto(id)
);

DROP TABLE tb_tipousuario;
DROP TABLE  tb_usuario;

ALTER TABLE tb_usuario
ADD column senha VARCHAR(255) NOT NULL;


USE bd_Mamuka;
SELECT * from tb_projeto;
SELECT * from  tb_usuario;


ALTER TABLE tb_usuario MODIFY status_atividade VARCHAR(255);  /* Descobrir como vai acrescentar NOT NULL */