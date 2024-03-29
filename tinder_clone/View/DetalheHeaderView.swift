//
//  DetalheHeaderView.swift
//  tinder_clone
//
//  Created by Felipe Moraes Rocha on 04/09/23.
//

import UIKit

class DetalheHeaderView: UICollectionReusableView {
    
    var user: Usuario? {
        didSet {
            if let user = user {
                photoImageView.image = UIImage(named: user.foto)
            }
        }
    }
    
    var photoImageView: UIImageView = .fotoImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photoImageView)
        photoImageView.preencherSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
