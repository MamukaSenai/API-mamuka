package com.mamuka.apimamuka.models;

public enum TipoModel {
    ADMIN("admin"),
    DESENVOLVEDOR("dev"),
    GESTOR("gestor");

    private String tipo;

    TipoModel(String tipo) {
        this.tipo = tipo;
    }

    public String getRole() {
        return tipo;
    }
}
