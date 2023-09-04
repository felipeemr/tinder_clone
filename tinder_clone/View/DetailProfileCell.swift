//
//  DetailProfileCell.swift
//  tinder_clone
//
//  Created by Felipe Moraes Rocha on 04/09/23.
//

import UIKit

class DetailProfileCell: UICollectionViewCell {
    var user: Usuario? {
        didSet {
            if let user = user {
                nameLabel.text = user.nome
                ageLabel.text = String(user.idade)
                descriptionLabel.text = user.frase
            }
        }
    }
    let nameLabel: UILabel = .textBolLabel(32)
    let ageLabel: UILabel = .textBolLabel(28)
    let descriptionLabel: UILabel = .textBolLabel(18, numberOfLines: 2)

    override init(frame: CGRect) {
        super.init(frame: frame)

        let nameAgeStackView = UIStackView(arrangedSubviews: [nameLabel,ageLabel, UIView()])
        nameAgeStackView.spacing = 12
        
        let detailsStackView = UIStackView(arrangedSubviews: [nameAgeStackView, descriptionLabel])
        detailsStackView.distribution = .fillEqually
        detailsStackView.axis = .vertical
        addSubview(detailsStackView)
        detailsStackView.preencherSuperview(padding: .init(top: 20,
                                                           left: 20,
                                                           bottom: 20,
                                                           right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
