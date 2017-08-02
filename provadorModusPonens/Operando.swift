//
//  Operando.swift
//  provadorModusPonens
//
//  Created by Vanessa Soares Vieira on 27/07/17.
//  Copyright © 2017 Vanessa Soares Vieira. All rights reserved.
//

import Foundation

class Operando {
    let nome : String
    
    var afirmacao : Bool
    
    var implicados : [String] = []
    
    init (nome: String, afirmacao: Bool) {
        self.nome = nome
        self.afirmacao = afirmacao
    }
    
    func adicionarImplicados(operandoSeparado: String) {
        if (self.implicados.contains(operandoSeparado)) {
            print("já contém o operando digitado")
        } else {
            self.implicados.append(operandoSeparado)
        }
    }
    
}
