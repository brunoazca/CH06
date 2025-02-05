//
//  AppLibrary.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 05/02/25.
//

import Foundation

class AppLibrary {
    static let instance = AppLibrary()
    private init() {}
    
    var User: User? = nil
    
    var Lojas: [Loja] = [
        Loja(
            nome: "Assaí Atacadista",
            tipo: .mercado,
            local: "Avenida Brasil, 5000 - Rio de Janeiro",
            horario: HorarioFuncionamento(inicio: 6, final: 22),
            produtos: [
                Produto(nome: "Arroz 5kg", descricao: "Arroz branco tipo 1", categoria: .ingrediente, preco: 24.99, promocao: 19.99),
                Produto(nome: "Feijão Preto 1kg", descricao: "Feijão preto selecionado", categoria: .ingrediente, preco: 8.99, promocao: 7.99),
                Produto(nome: "Óleo de Soja 900ml", descricao: "Óleo de soja refinado", categoria: .ingrediente, preco: 7.50, promocao: nil),
                Produto(nome: "Macarrão Espaguete 500g", descricao: "Massa de trigo especial", categoria: .ingrediente, preco: 5.99, promocao: 4.99),
                Produto(nome: "Cerveja Pilsen 350ml", descricao: "Cerveja tradicional", categoria: .cerveja, preco: 3.99, promocao: 3.49)
            ]
        ),
        Loja(
            nome: "Brewteco",
            tipo: .alcool,
            local: "Rua Dias Ferreira, 420 - Leblon, Rio de Janeiro",
            horario: HorarioFuncionamento(inicio: 17, final: 2),
            produtos: [
                Produto(nome: "Chopp Pilsen 300ml", descricao: "Chopp artesanal gelado", categoria: .cerveja, preco: 10.00, promocao: 8.00),
                Produto(nome: "IPA Lata 473ml", descricao: "Cerveja IPA artesanal", categoria: .cerveja, preco: 15.00, promocao: 13.50),
                Produto(nome: "Gin Importado 750ml", descricao: "Gin premium europeu", categoria: .gin, preco: 89.99, promocao: 79.99),
                Produto(nome: "Cachaça Artesanal 700ml", descricao: "Cachaça envelhecida em carvalho", categoria: .cachaca, preco: 59.99, promocao: nil),
                Produto(nome: "Vinho Branco Chardonnay", descricao: "Vinho chileno Chardonnay", categoria: .vinho, preco: 74.99, promocao: 69.99)
            ]
        ),
        Loja(
            nome: "Épou",
            tipo: .eletronicos,
            local: "Rua Visconde de Pirajá, 200 - Ipanema, Rio de Janeiro",
            horario: HorarioFuncionamento(inicio: 8, final: 22),
            produtos: [
                Produto(nome: "Notebook i7", descricao: "Laptop com processador Intel i7", categoria: .computador, preco: 4999.99, promocao: nil),
                Produto(nome: "Fone Bluetooth", descricao: "Fone de ouvido sem fio com cancelamento de ruído", categoria: .computador, preco: 299.99, promocao: 249.99),
                Produto(nome: "Mouse Gamer RGB", descricao: "Mouse com sensor de alta precisão", categoria: .computador, preco: 179.99, promocao: 149.99)
            ]
        ),
        Loja(
            nome: "Pão de Açúcar",
            tipo: .mercado,
            local: "Avenida das Américas, 7000 - Barra da Tijuca, Rio de Janeiro",
            horario: HorarioFuncionamento(inicio: 7, final: 23),
            produtos: [
                Produto(nome: "Iogurte Grego", descricao: "Iogurte cremoso natural", categoria: .cafeDaManha, preco: 4.99, promocao: 3.99),
                Produto(nome: "Chocolate 90g", descricao: "Chocolate amargo 70%", categoria: .doces, preco: 7.99, promocao: 6.99),
                Produto(nome: "Granola Premium 500g", descricao: "Mix de cereais com frutas secas", categoria: .cafeDaManha, preco: 14.99, promocao: nil),
                Produto(nome: "Suco Detox 1L", descricao: "Suco verde com couve e limão", categoria: .bebidaSemAlcool, preco: 12.99, promocao: 11.99),
                Produto(nome: "Pão Integral 400g", descricao: "Pão rico em fibras", categoria: .cafeDaManha, preco: 9.99, promocao: 8.49)
            ]
        ),
        Loja(
            nome: "Zona Sul",
            tipo: .mercado,
            local: "Rua Jardim Botânico, 100 - Jardim Botânico, Rio de Janeiro",
            horario: HorarioFuncionamento(inicio: 6, final: 23),
            produtos: [
                Produto(nome: "Salmão Congelado 500g", descricao: "Filé de salmão congelado", categoria: .congelados, preco: 39.99, promocao: 34.99),
                Produto(nome: "Vinho Tinto Merlot", descricao: "Vinho chileno Merlot", categoria: .vinho, preco: 49.99, promocao: 44.99),
                Produto(nome: "Queijo Brie 200g", descricao: "Queijo brie francês", categoria: .petiscos, preco: 29.99, promocao: nil),
                Produto(nome: "Azeitona Verde 300g", descricao: "Azeitona sem caroço", categoria: .petiscos, preco: 14.99, promocao: 12.99),
                Produto(nome: "Suco Natural de Uva 1L", descricao: "100% suco sem açúcar", categoria: .bebidaSemAlcool, preco: 19.99, promocao: 17.99)
            ]
        ),
        Loja(
            nome: "Droga Raia",
            tipo: .saude,
            local: "Rua Voluntários da Pátria, 45 - Botafogo, Rio de Janeiro",
            horario: HorarioFuncionamento(inicio: 7, final: 22),
            produtos: [
                Produto(nome: "Vitamina C 1g", descricao: "Suplemento de vitamina C efervescente", categoria: .saude, preco: 29.99, promocao: 24.99),
                Produto(nome: "Máscara N95", descricao: "Máscara de proteção respiratória", categoria: .higiene, preco: 12.99, promocao: 9.99),
                Produto(nome: "Shampoo Anticaspa 200ml", descricao: "Shampoo para controle de caspa", categoria: .higiene, preco: 21.99, promocao: nil),
                Produto(nome: "Creme Hidratante 250ml", descricao: "Hidratação intensa para pele", categoria: .beleza, preco: 39.99, promocao: 34.99),
                Produto(nome: "Protetor Solar FPS 50", descricao: "Protetor solar para rosto", categoria: .beleza, preco: 69.99, promocao: 59.99)
            ]
        )
    ]


    
}
