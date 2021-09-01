//
//  UsuarioService.swift
//  tinder_clone
//
//  Created by Felipe on 31/08/21.
//

import Foundation


class usuarioService {
    
    static let shared = usuarioService()
    
    let usuarios: [Usuario] = [
    Usuario(id: 101, nome: "Maria Silva", idade: 20, match: true, frase: "Ultimo a dar match chama", foto: "pessoa-1")]
    
    func buscaUsuarios() -> [Usuario]{
        
        return self.usuarios
        
    }
}
