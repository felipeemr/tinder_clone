//
//  UsuarioService.swift
//  tinder_clone
//
//  Created by Felipe on 31/08/21.
//

import Foundation


class UsuarioService {
    
    static let shared = UsuarioService()
    
    let usuarios: [Usuario] = [
    Usuario(id: 101, nome: "Maria Silva", idade: 20, match: true, frase: "Ultimo a dar match chama", foto: "pessoa-1"),
    Usuario(id: 102, nome: "Livia Silva", idade: 25, match: true, frase: "Ultimo a dar match chama", foto: "pessoa-2"),
    Usuario(id: 103, nome: "Catrina Moreira", idade: 30, match: true, frase: "Ultimo a dar match chama", foto: "pessoa-3"),
    Usuario(id: 104, nome: "Maria Oliveira", idade: 21, match: true, frase: "Ultimo a dar match chama", foto: "pessoa-4"),
    Usuario(id: 105, nome: "Marta Nascimento", idade: 19, match: true, frase: "Ultimo a dar match chama", foto: "pessoa-5"),
    Usuario(id: 106, nome: "Olivia Silva", idade: 27, match: true, frase: "Ultimo a dar match chama", foto: "pessoa-6"),
    Usuario(id: 107, nome: "Larissa Silva", idade: 23, match: true, frase: "Ultimo a dar match chama", foto: "pessoa-7")]
    
    func buscaUsuarios(completion: @escaping([Usuario]?, Error?) -> ()){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completion(self.usuarios, nil)
        }
    }
}
