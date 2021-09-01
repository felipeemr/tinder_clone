//
//  CombineCardView.swift
//  tinder_clone
//
//  Created by Felipe on 30/08/21.
//

import UIKit

class CombineCardView: UIView {
    
    let fotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pessoa-1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let nomeLabel:UILabel = .textBolLabel(32, textColor: .white)
    let idadeLabel:UILabel = .textLabel(32, textColor: .white)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        layer.borderWidth = 0.3
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        clipsToBounds = true
        
        nomeLabel.text = "Ana Laura"
        idadeLabel.text = "20"
        nomeLabel.adicionaShandow()
        idadeLabel.adicionaShandow()
        addSubview(fotoImageView)
        fotoImageView.preencherSuperview()
        
        let stackView = UIStackView (arrangedSubviews: [nomeLabel, idadeLabel, UIView()])
        stackView.spacing = 12
        addSubview(stackView)
        stackView.preencher(top: nil,
                            leading: leadingAnchor,
                            trailing: trailingAnchor,
                            bottom: bottomAnchor,
                            padding: .init(top: 0, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
