package com.mamuka.apimamuka.controllers;

import com.mamuka.apimamuka.dtos.ProjetoDto;
import com.mamuka.apimamuka.models.ProjetoModel;
import com.mamuka.apimamuka.repositories.ProjetoRepository;
import com.mamuka.apimamuka.repositories.UsuarioRepository;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping(value = "/projetos", produces = {"application/json"})
public class ProjetoController {
    @Autowired
    ProjetoRepository projetoRepository;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @GetMapping
    public ResponseEntity<List<ProjetoModel>> listarProjetos(){
        return  ResponseEntity.status(HttpStatus.OK).body(projetoRepository.findAll());
    }

    @GetMapping("/{idProjeto}")
    public ResponseEntity<Object> exibirProjeto(@PathVariable(value = "idProjeto")UUID id){
        Optional<ProjetoModel> projetoBuscado = projetoRepository.findById(id);

        if (projetoBuscado.isEmpty()){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Projeto não encontrado");
        }

        return ResponseEntity.status(HttpStatus.OK).body(projetoBuscado.get());
    }

    //@PostMapping
    @PostMapping
    public ResponseEntity<Object> cadastrarProjeto(@RequestBody @Valid ProjetoDto projetoDto){
        ProjetoModel projetoModel = new ProjetoModel();

        BeanUtils.copyProperties(projetoDto, projetoModel);

        var gestor = usuarioRepository.findById(projetoDto.id_usuario());

        if (gestor.isPresent()){
            projetoModel.setGestor(gestor.get());
        } else {
            ResponseEntity.status(HttpStatus.BAD_REQUEST).body("id_gestor não encontrado");
        }


        return ResponseEntity.status(HttpStatus.CREATED).body(projetoRepository.save(projetoModel));
    }


}
