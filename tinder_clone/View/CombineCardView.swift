//
//  CombineCardView.swift
//  tinder_clone
//
//  Created by Felipe on 30/08/21.
//

import UIKit

class CombineCardView: UIView {
    
    
    var usuario: Usuario?{
        didSet{
            if let usuario = usuario{
                fotoImageView.image = UIImage(named: usuario.foto)
                nomeLabel.text = usuario.nome
                idadeLabel.text = String(usuario.idade) 
                fraseLabel.text = usuario.frase
            }
        }
    }

    
    let fotoImageView: UIImageView = .fotoImageView()
    let deslikeImageView:UIImageView = .iconCard(named: "card-deslike")
    let likeImageView:UIImageView = .iconCard(named: "card-like")
    
    let nomeLabel:UILabel = .textBolLabel(32, textColor: .white)
    let idadeLabel:UILabel = .textLabel(28, textColor: .white)
    let fraseLabel:UILabel = .textLabel(16, textColor: .white, numberOfLines: 2)
    
    var callback: ((Usuario) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        
        nomeLabel.adicionaShandow()
        idadeLabel.adicionaShandow()
        fraseLabel.adicionaShandow()
        
        
        addSubview(fotoImageView)
        addSubview(deslikeImageView)
        deslikeImageView.preencher(
            top: topAnchor,
            leading: nil,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 20, left: 0, bottom: 0, right: 20)
        )
        addSubview(likeImageView)
        likeImageView.preencher(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: nil,
            bottom: nil,
            padding: .init(top: 20, left: 20, bottom: 0, right: 0)
        )
        
        fotoImageView.preencherSuperview()
        
        let nomeIdadestackView = UIStackView (arrangedSubviews: [nomeLabel, idadeLabel, UIView()])
        nomeIdadestackView.spacing = 12
        
        let stackView = UIStackView(arrangedSubviews: [nomeIdadestackView,fraseLabel])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.preencher(top: nil,
                            leading: leadingAnchor,
                            trailing: trailingAnchor,
                            bottom: bottomAnchor,
                            padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        let tap = UITapGestureRecognizer(target: self, action: #selector(visualizarClique))
        stackView.isUserInteractionEnabled = true
        stackView.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    @objc func visualizarClique() {
        
        if let usuario = self.usuario {
            self.callback?(usuario)
        }
    }
}
