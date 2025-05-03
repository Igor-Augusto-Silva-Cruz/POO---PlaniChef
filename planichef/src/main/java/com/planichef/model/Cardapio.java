package com.planichef.model;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;
import java.util.List;

@Data
@Entity
@Table(name = "cardapios")
public class Cardapio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    @Column(nullable = false)
    private LocalDate data;

    @Column(nullable = false)
    private String pratoPrincipal;

    @Column
    private String acompanhamento;

    @Column
    private String sobremesa;

    @OneToMany(mappedBy = "cardapio", cascade = CascadeType.ALL)
    private List<Receita> receitas;

    @Column
    private String observacoes;
} 