SELECT *,bin_to_UUID(id) as ID FROM tb_tipousuario;

drop procedure select_tipo_usuario;

create procedure select_tipo_usuario(varId varchar(255))
SELECT *,bin_to_UUID(id) as ID FROM tb_tipousuario
where tb_tipousuario.tipoUsuario = varId;

call select_tipo_usuario('Administrador');