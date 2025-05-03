package com.planichef.model;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Data
@Entity
@Table(name = "ingredientes")
public class Ingrediente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nome;

    @Column
    private String unidadeMedida;

    @Column
    private Double quantidade;

    @ManyToMany(mappedBy = "ingredientes")
    private List<Receita> receitas;

    @Column
    private String categoria;

    @Column
    private Boolean perecivel;
} 