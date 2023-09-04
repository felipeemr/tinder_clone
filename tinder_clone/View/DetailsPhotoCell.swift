//
//  DetailsPhotoCell.swift
//  tinder_clone
//
//  Created by Felipe Moraes Rocha on 04/09/23.
//

import UIKit


class DetailPhotoCell: UICollectionViewCell {
    
    var labelDescription: UILabel = .textLabel(16)
    let slidePhotoVC = SlidePhotoVC()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        labelDescription.text = "Fotos do insta"
        addSubview(labelDescription)
        labelDescription.preencher(top: topAnchor,
                                   leading: leadingAnchor,
                                   trailing: trailingAnchor,
                                   bottom: nil,
                                   padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
        addSubview(slidePhotoVC.view)
        slidePhotoVC.view.preencher(top: labelDescription.bottomAnchor,
                                    leading: leadingAnchor,
                                    trailing: trailingAnchor,
                                    bottom: bottomAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
