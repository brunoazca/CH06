//
//  User.swift
//  UberEats
//
//  Created by Bruno Azambuja Carvalho on 05/02/25.
//

import Foundation

class User {
    let ID:String = UUID().uuidString
    var nome: String
    var numero: String
    var email: String
    var enderecos: [String] = []
    var lojasCurtidas: [Loja] = []
    var carrinho: Compra? = nil
    var compras: [Compra] = []
    
    init(nome: String, numero: String, email: String, enderecos: [String], compras: [Compra]) {
        self.nome = nome
        self.numero = numero
        self.email = email
    }
}
