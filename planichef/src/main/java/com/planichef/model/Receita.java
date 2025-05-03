package com.planichef.model;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Data
@Entity
@Table(name = "receitas")
public class Receita {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "cardapio_id", nullable = false)
    private Cardapio cardapio;

    @Column(nullable = false)
    private String nome;

    @Column(columnDefinition = "TEXT")
    private String instrucoes;

    @Column
    private Integer tempoPreparo;

    @Column
    private Integer porcoes;

    @ManyToMany
    @JoinTable(
        name = "receita_ingredientes",
        joinColumns = @JoinColumn(name = "receita_id"),
        inverseJoinColumns = @JoinColumn(name = "ingrediente_id")
    )
    private List<Ingrediente> ingredientes;

    @Column
    private String nivelDificuldade;

    @Column
    private String categoria;
} 