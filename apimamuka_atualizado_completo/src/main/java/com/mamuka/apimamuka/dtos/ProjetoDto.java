package com.mamuka.apimamuka.dtos;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.UUID;

public record ProjetoDto(
        @NotNull UUID id_usuario,
        @NotBlank String nome_projeto,
        @NotBlank String status_projeto,

        @NotBlank String responsavel,

        @NotNull Date data_inicio,
        @NotNull Date data_conclusao
) {
}
