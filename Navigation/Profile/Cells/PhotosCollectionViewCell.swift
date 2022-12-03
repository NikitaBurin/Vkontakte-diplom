//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Никита Бурин on 05.11.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    static let reusableID = "PhotosCell"
    
    var photo: UIImageView = {
        var photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleToFill
        return photo
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
      
        contentView.addSubview(photo)
       
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photo.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            photo.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingDataSource(massiv: Picture){
        photo.image = UIImage(named: massiv.image)
    }
    
   
}
