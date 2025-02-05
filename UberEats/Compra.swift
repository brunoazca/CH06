//
//  Compra.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 05/02/25.
//

import Foundation

class Compra {
    let ID: String = UUID().uuidString
    let loja: Loja
    var produtos: [Produto]
    var valor: Float
    var endereco: String
    var horarioPedido: Int
    var horarioChegada: Int
    var status: StatusCompra
    var entregador: Entregador? = nil
    
    
    enum StatusCompra{
        case naoPaga
        case aguardandoPagamento
        case aguardandoLoja
        case emPreparo
        case aCaminho
        case entregue
    }
    
    init(loja: Loja, produtos: [Produto], valor: Float, endereco: String, horarioPedido: Int, horarioChegada: Int, status: StatusCompra) {
        self.loja = loja
        self.produtos = produtos
        self.valor = valor
        self.endereco = endereco
        self.horarioPedido = horarioPedido
        self.horarioChegada = horarioChegada
        self.status = status
    }

}
