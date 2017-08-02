//
//  ViewController.swift
//  provadorModusPonens
//
//  Created by Vanessa Soares Vieira on 26/07/17.
//  Copyright © 2017 Vanessa Soares Vieira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var todosOperandos: [Operando] = []
       
    @IBOutlet weak var sentenca: UITextField!
    
    @IBOutlet weak var respostaEsperada: UITextField!
    
    @IBAction func provar(_ sender: Any) {
        if (respostaEsperada.text != "" && todosOperandos.count > 0) {
            for index in 0..<todosOperandos.count {
                if (todosOperandos[index].afirmacao == true && todosOperandos[index].implicados.contains(respostaEsperada.text!)) {
                    // alerta dizendo que encontrou a resposta esperada
                    let alertController = UIAlertController(title: "Parabéns!", message: "Sua base de dados encontrou a resposta esperada!", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    break
                } else {
                    // nao achou a resposta esperada
                    
                    let alertController = UIAlertController(title: "Oops!", message: "Infelizmente sua base de dados não encontrou a resposta esperada.", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
        respostaEsperada.text = ""
    }
    
    
    @IBAction func adicionarSentenca(_ sender: Any) {
        
        print(todosOperandos)
        
        
        if (sentenca.text != "") {
            var sentencaSemEspaco = sentenca.text?.replacingOccurrences(of: " ", with: "")
            
            print("string nao vazia")
            
            // se tem mais de 1 caractere (no caso de ter implicação)
            if (sentencaSemEspaco?.characters.count != 1) {
                print("string maior que 1")
                
                var operandosSeparados = sentencaSemEspaco?.components(separatedBy: "->")
                
                // checa se tem algum operando
                if (todosOperandos.isEmpty) {
                    let operando = Operando(nome: (operandosSeparados?[0])!, afirmacao: false)
                    
                    operando.adicionarImplicados(operandoSeparado: (operandosSeparados?[1])!)
                    
                    todosOperandos.append(operando)
                    
                    print(operando.nome)
                    print(operando.afirmacao)
                    print(operando.implicados)
                    
                } else {
                    
                    // checando na lista de todos os operandos
                    for index in 0..<todosOperandos.count {
                        print ("entrou no for")
                        
                        // se o operando já existir na lista de operandos
                        if (todosOperandos[index].nome == operandosSeparados?[0]) {
                            
                            todosOperandos[index].adicionarImplicados(operandoSeparado: (operandosSeparados?[1])!)
                            
                            print(todosOperandos[index].nome)
                            print(todosOperandos[index].afirmacao)
                            print(todosOperandos[index].implicados)
                            
                        } else {
                            // cria o operando caso ele não exista
                            
                            let operando = Operando(nome: (operandosSeparados?[0])!, afirmacao: false)
                            
                            operando.adicionarImplicados(operandoSeparado: (operandosSeparados?[1])!)
                            
                            todosOperandos.append(operando)
                            
                            print(operando.nome)
                            print(operando.afirmacao)
                            print(operando.implicados)
                            
                        }
                    }
                }
            } else {
                // se a sentenca é afirmacao
                if (todosOperandos.isEmpty) {
                    let operando = Operando(nome: sentenca.text!, afirmacao: true)
                    
                    todosOperandos.append(operando)
                    
                    print(operando.nome)
                    print(operando.afirmacao)
                    print(operando.implicados)
                    
                } else {
                    
                    // checando na lista de todos os operandos
                    for index in 0..<todosOperandos.count {
                        print ("entrou no for")
                        
                        // se o operando já existir na lista de operandos
                        if (todosOperandos[index].nome == sentenca.text!) {
                            
                            todosOperandos[index].afirmacao = true
                            
                            print(todosOperandos[index].nome)
                            print(todosOperandos[index].afirmacao)
                            print(todosOperandos[index].implicados)
                            
                        } else {
                            // cria o operando caso ele não exista
                            
                            let operando = Operando(nome: sentenca.text!, afirmacao: true)
                            
                            todosOperandos.append(operando)
                            
                            print(operando.nome)
                            print(operando.afirmacao)
                            print(operando.implicados)
                            
                        }
                    }
                    
                }
                
            }
        }
        sentenca.text = ""
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

