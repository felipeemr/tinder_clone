//
//  DetalheHeaderView.swift
//  tinder_clone
//
//  Created by Felipe Moraes Rocha on 04/09/23.
//

import UIKit

class DetalheHeaderView: UICollectionReusableView {
    var photoImageView: UIImageView = .fotoImageView(named: "pessoa-1")
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(photoImageView)
        photoImageView.preencherSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
