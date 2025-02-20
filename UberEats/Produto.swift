//
//  Produto.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 05/02/25.
//

import Foundation

class Produto {
    let ID: String = UUID().uuidString
    var nome: String
    var descricao: String
    var imageName: String = comidas.randomElement()!
    var categoria: Categoria
    var preco: Float
    var promocao: Float? = nil
    
    enum Categoria: String {
        case cafeDaManha = "Café da Manhã"
        case ingrediente = "Ingredientes"
        case bebidaSemAlcool = "Bebida Sem Álcool"
        case pratoPronto = "Prato Pronto"
        case petiscos = "Petiscos"
        case doces = "Doces"
        case congelados = "Congelados"
        case higiene = "Higiene"
        case beleza = "Beleza"
        case saude = "Saúde"
        case computador = "Computador"
        case cerveja = "Cerveja"
        case vinho = "Vinho"
        case gin = "Gin"
        case cachaca = "Cachaça"
    }
    
    init(nome: String, descricao: String, categoria: Categoria, preco: Float, promocao: Float?) {
        self.nome = nome
        self.descricao = descricao
        self.categoria = categoria
        self.preco = preco
        self.promocao = promocao
    }
}
