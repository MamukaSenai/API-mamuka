-- Inserir dados na tabela tb_tipoUsuario
INSERT INTO tb_tipoUsuario (id, tipoUsuario) VALUES
(UUID_TO_BIN(UUID()), 'Administrador'),
(UUID_TO_BIN(UUID()), 'Usuário Comum');

-- Inserir dados na tabela tb_usuario
INSERT INTO tb_usuario 
(id, nome, cpf, dataNascimento, statusAtividade, departamento, responsavel, perfil, cargo, email, senha, id_tipoUsuario) VALUES
(UUID_TO_BIN(UUID()), 'João Silva', '123.456.789-01', '1990-01-01', 1, 'TI', 'Rogerio', 'Analista', 'ADM', 'joao@email.com', 'senha123', UUID_TO_BIN('c103b5c1-8fde-11ee-825a-b445067b7e54')),
(UUID_TO_BIN(UUID()), 'Maria Oliveira', '987.654.321-01', '1985-05-15', 1, 'RH', 'Thiago', 'Analista', 'Cliente', 'maria@email.com', 'senha123', UUID_TO_BIN('c103bb78-8fde-11ee-825a-b445067b7e54'));

-- Inserir dados na tabela tb_projeto
INSERT INTO tb_projeto (id, nomeProjeto, statusProjeto, dataInicio, dataConclusao, id_usuario) VALUES
(UUID_TO_BIN(UUID()), 'Projeto A', 'Em Andamento', '2023-01-15 08:00:00', '2023-03-30 17:00:00', UUID_TO_BIN('d1a53083-8fde-11ee-825a-b445067b7e54')),
(UUID_TO_BIN(UUID()), 'Projeto B', 'Concluído', '2022-11-01 10:30:00', '2023-01-10 15:45:00', UUID_TO_BIN('d1a53b53-8fde-11ee-825a-b445067b7e54'));

-- Inserir dados na tabela tb_tarefa
INSERT INTO tb_tarefa (id, nomeTarefa, statusTarefa, dataInicio, dataConclusao, id_usuario, id_projeto) VALUES
(UUID_TO_BIN(UUID()), 'Tarefa 1', 'Em Andamento', '2023-01-20 09:00:00', '2023-01-25 15:00:00', UUID_TO_BIN('d1a53083-8fde-11ee-825a-b445067b7e54'), UUID_TO_BIN('efe2fbe7-8fdf-11ee-825a-b445067b7e54')),
(UUID_TO_BIN(UUID()), 'Tarefa 2', 'Concluída', '2022-11-05 11:00:00', '2022-11-10 14:30:00', UUID_TO_BIN('d1a53b53-8fde-11ee-825a-b445067b7e54'), UUID_TO_BIN('efe30783-8fdf-11ee-825a-b445067b7e54'));




