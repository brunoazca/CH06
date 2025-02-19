//
//  Loja.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 05/02/25.
//

import Foundation

class Loja: Equatable {
    static func == (lhs: Loja, rhs: Loja) -> Bool {
        return lhs.nome == rhs.nome
    }
    
    var nome: String
    var tipo: Tipo
    var local: String
    var horario: HorarioFuncionamento
    var produtos: [Produto]
    
    enum Tipo: String, CaseIterable {
        case mercado = "Mercado"
        case conveniencia = "Conveniência"
        case alcool = "Álcool"
        case eletronicos = "Eletrônicos"
        case saude = "Saúde"
    }
    
    init(nome: String, tipo: Tipo, local: String, horario: HorarioFuncionamento, produtos: [Produto]) {
        self.nome = nome
        self.tipo = tipo
        self.local = local
        self.horario = horario
        self.produtos = produtos
    }
    
    func getProductCategories() -> [Produto.Categoria]{
        var categorias: [Produto.Categoria] = []
        for produto in produtos {
            if(!categorias.contains(produto.categoria)){
                categorias.append(produto.categoria)
            }
        }
        return categorias
    }
    
    func getProductsFromCategory(_ category: Produto.Categoria)->[Produto]{
        var produtos: [Produto] = []
        for produto in self.produtos {
            if(produto.categoria == category){
                produtos.append(produto)
            }
        }
        return produtos
    }
}

struct HorarioFuncionamento {
    var inicio: Int
    var final: Int
}
