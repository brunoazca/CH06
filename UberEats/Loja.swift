//
//  Loja.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 05/02/25.
//

import Foundation

class Loja {
    var nome: String
    var tipo: Tipo
    var local: String
    var horario: HorarioFuncionamento
    var produtos: [Produto]
    
    enum Tipo {
        case mercado
        case conveniencia
        case alcool
        case eletronicos
        case saude
    }
    
    init(nome: String, tipo: Tipo, local: String, horario: HorarioFuncionamento, produtos: [Produto]) {
        self.nome = nome
        self.tipo = tipo
        self.local = local
        self.horario = horario
        self.produtos = produtos
    }
}

struct HorarioFuncionamento {
    var inicio: Int
    var final: Int
}
