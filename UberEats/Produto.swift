//
//  Produto.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 05/02/25.
//

import Foundation

class Produto {
    let ID: String = UUID().uuidString
    var loja: Loja
    var nome: String
    var descricao: String
    var categoria: Categoria
    var preco: Float
    var promocao: Float = 0
    
    enum Categoria: String {
        case cafeDaManha = "Café da Manhã"
        case bebidaSemAlcool = "Bebida Sem Álcool"
        case pratoPronto = "Prato Pronto"
        case petiscos = "Petiscos"
        case doces = "Doces"
        case congelados = "Congelados"
    }
    
    init(loja: Loja, nome: String, descricao: String, categoria: Categoria, preco: Float, promocao: Float) {
        self.loja = loja
        self.nome = nome
        self.descricao = descricao
        self.categoria = categoria
        self.preco = preco
        self.promocao = promocao
    }
}
