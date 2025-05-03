package com.planichef.model;

import jakarta.persistence.*;
import lombok.Data;
import java.util.List;

@Data
@Entity
@Table(name = "usuarios")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String nome;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String senha;

    @OneToMany(mappedBy = "usuario", cascade = CascadeType.ALL)
    private List<Cardapio> cardapios;

    @ElementCollection
    @CollectionTable(name = "preferencias_alimentares")
    private List<String> preferenciasAlimentares;

    @ElementCollection
    @CollectionTable(name = "restricoes_dieteticas")
    private List<String> restricoesDieteticas;
} 