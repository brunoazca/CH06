//
//  Entregador.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 05/02/25.
//

import Foundation

class Entregador{
    let ID: String = UUID().uuidString
    var nome: String
    var veiculo: String
    var nota: Float
    var numeroAvaliacoes: Int = 0
    
    init(nome: String, veiculo: String, nota: Float) {
        self.nome = nome
        self.veiculo = veiculo
        self.nota = nota
    }
}
