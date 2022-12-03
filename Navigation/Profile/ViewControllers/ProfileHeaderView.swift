//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Никита Бурин on 11.10.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = ""
    
    var profileName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "What The Duck"
        label.textColor = .black
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
        return label
    }()
    
    var profilePhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bounds = CGRect(x: 0, y: 0, width: 125, height: 125)
        imageView.layer.cornerRadius = imageView.bounds.size.width/2
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0.6)
        imageView.image = UIImage(named: "duck")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"HelveticaNeue-Regular", size: 14)
        label.textColor = .darkGray
        return label
    }()
    
    lazy var statusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Add status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        textField.font = UIFont(name:"HelveticaNeue-Regular", size: 15)
        textField.layer.cornerRadius = 12
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.leftViewMode = UITextField.ViewMode.always
        textField.leftView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.placeholder = "Enter your status"
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func setupLayout(){

        addSubview(profileName)
        addSubview(profilePhoto)
        addSubview(statusLabel)
        addSubview(statusButton)
        addSubview(statusTextField)
        
        NSLayoutConstraint.activate([
            profileName.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            profileName.leftAnchor.constraint(equalTo: profilePhoto.rightAnchor, constant: 16),
            profileName.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

            profilePhoto.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profilePhoto.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            profilePhoto.heightAnchor.constraint(equalToConstant: profilePhoto.bounds.size.height),
            profilePhoto.widthAnchor.constraint(equalToConstant: profilePhoto.bounds.size.width),

            statusLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 10),
            statusLabel.leftAnchor.constraint(equalTo: profileName.leftAnchor),
            statusLabel.rightAnchor.constraint(equalTo: profileName.rightAnchor),

            statusButton.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 16),
            statusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            statusTextField.leftAnchor.constraint(equalTo: profileName.leftAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
    
    @objc func buttonPressed(){
        
        guard statusTextField.text == "" else {
            statusLabel.text = statusText
            statusTextField.text = ""
            return
        }
        statusTextField.layer.borderColor = .init(red: 1, green: 0, blue: 0, alpha: 0.5)
        statusTextField.shake()
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        
        statusText = textField.text!
        
        guard textField.text != "" else {return}
        textField.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
    }
}


