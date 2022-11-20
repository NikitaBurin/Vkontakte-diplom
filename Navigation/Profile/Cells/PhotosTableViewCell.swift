//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Никита Бурин on 20.10.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let firstPhoto: UIImageView = {
        let firstPhoto = UIImageView()
        firstPhoto.translatesAutoresizingMaskIntoConstraints = false
        firstPhoto.layer.cornerRadius = 6
        firstPhoto.clipsToBounds = true
        return firstPhoto
    }()
    
    let secondPhoto: UIImageView = {
        let secondPhoto = UIImageView()
        secondPhoto.translatesAutoresizingMaskIntoConstraints = false
        secondPhoto.layer.cornerRadius = 6
        secondPhoto.clipsToBounds = true
        return secondPhoto
    }()
    
    let thirdPhoto: UIImageView = {
        let thirdPhoto = UIImageView()
        thirdPhoto.translatesAutoresizingMaskIntoConstraints = false
        thirdPhoto.layer.cornerRadius = 6
        thirdPhoto.clipsToBounds = true
        return thirdPhoto
    }()
    
    let fourthPhoto: UIImageView = {
        let fourthPhoto = UIImageView()
        fourthPhoto.translatesAutoresizingMaskIntoConstraints = false
        fourthPhoto.layer.cornerRadius = 6
        fourthPhoto.clipsToBounds = true
        return fourthPhoto
    }()
    
    let cellName: UILabel = {
        let cellName = UILabel()
        cellName.translatesAutoresizingMaskIntoConstraints = false
        cellName.font = UIFont.boldSystemFont(ofSize: 19)
        cellName.text = "Photo gallery"
        return cellName
    }()
    
    let arrowImage: UIImageView = {
        let arrow = UIImageView(image: UIImage(systemName: "arrow.right"))
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.tintColor = .black
        return arrow
    }()
    
    let widthPhoto = (UIScreen.main.bounds.width - 48) / 4
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        settingCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingCell(){
        contentView.addSubview(firstPhoto)
        contentView.addSubview(secondPhoto)
        contentView.addSubview(thirdPhoto)
        contentView.addSubview(fourthPhoto)
        contentView.addSubview(cellName)
        contentView.addSubview(arrowImage)
        
        NSLayoutConstraint.activate([
        
            cellName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            cellName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            cellName.widthAnchor.constraint(equalToConstant: 300),
            cellName.heightAnchor.constraint(equalToConstant: 20),

            arrowImage.centerYAnchor.constraint(equalTo: cellName.centerYAnchor),
            arrowImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
            arrowImage.heightAnchor.constraint(equalToConstant: 25),
            arrowImage.widthAnchor.constraint(equalToConstant: 25),
            
            firstPhoto.topAnchor.constraint(equalTo: cellName.bottomAnchor, constant: 12),
            firstPhoto.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            firstPhoto.widthAnchor.constraint(equalToConstant: widthPhoto),
            firstPhoto.heightAnchor.constraint(equalToConstant: 80),
            
            secondPhoto.topAnchor.constraint(equalTo: cellName.bottomAnchor, constant: 12),
            secondPhoto.leftAnchor.constraint(equalTo: firstPhoto.rightAnchor, constant: 8),
            secondPhoto.widthAnchor.constraint(equalToConstant: widthPhoto),
            secondPhoto.heightAnchor.constraint(equalToConstant: 80),
            
            thirdPhoto.topAnchor.constraint(equalTo: cellName.bottomAnchor, constant: 12),
            thirdPhoto.leftAnchor.constraint(equalTo: secondPhoto.rightAnchor, constant: 8),
            thirdPhoto.widthAnchor.constraint(equalToConstant: widthPhoto),
            thirdPhoto.heightAnchor.constraint(equalToConstant: 80),
            
            fourthPhoto.topAnchor.constraint(equalTo: cellName.bottomAnchor, constant: 12),
            fourthPhoto.leftAnchor.constraint(equalTo: thirdPhoto.rightAnchor, constant: 8),
            fourthPhoto.widthAnchor.constraint(equalToConstant: widthPhoto),
            fourthPhoto.heightAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    func settingDataSource(massiv: Photo){
        firstPhoto.image = UIImage(named: massiv.firstPhoto)
        secondPhoto.image = UIImage(named: massiv.secondPhoto)
        thirdPhoto.image = UIImage(named: massiv.thirdPhoto)
        fourthPhoto.image = UIImage(named: massiv.fourthPhoto)
    }
}
