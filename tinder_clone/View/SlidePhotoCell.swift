//
//  SlidePhotoCell.swift
//  tinder_clone
//
//  Created by Felipe Moraes Rocha on 04/09/23.
//

import UIKit

class SlidePhotoCell: UICollectionViewCell {
    
    var photoImageView: UIImageView = .fotoImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 8
        clipsToBounds = true
        addSubview(photoImageView)
        
        photoImageView.preencherSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
