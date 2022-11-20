//
//  PictureGalleryViewController.swift
//  Navigation
//
//  Created by Никита Бурин on 16.11.2022.
//

import UIKit

class PictureGalleryViewController: UIViewController {
   
    var indexOfPhotoRow: Int!
  
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: photoAlbum[indexOfPhotoRow].image)
        return image
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        let myImage = UIImage(named: "xmark")
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .white
        
        self.view.addSubview(closeButton)
        self.view.addSubview(image)
        
        UIView.animate(withDuration: 0.7, delay: 0.2){
            NSLayoutConstraint.activate([
                self.image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.image.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                self.image.heightAnchor.constraint(equalToConstant: 400),
                self.image.widthAnchor.constraint(equalToConstant: 400),
            ])
            self.image.layoutIfNeeded()
        }
            
        UIView.animate(withDuration: 0.3, delay: 0.8){
                NSLayoutConstraint.activate([
                    self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                    self.closeButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
                    self.closeButton.heightAnchor.constraint(equalToConstant: 30),
                    self.closeButton.widthAnchor.constraint(equalToConstant: 30)
                ])
                self.closeButton.layoutIfNeeded()
            }
    }
    
    @objc func close(){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        self.view.window?.layer.add(transition, forKey: nil)
        self.navigationItem.setHidesBackButton(false, animated: false)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
}
