//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Никита Бурин on 18.10.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    var author: UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = UIFont.boldSystemFont(ofSize: 20)
        author.numberOfLines = 2
        return author
    }()
    
    var picture: UIImageView = {
        let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.backgroundColor = .black
        picture.contentMode = .scaleAspectFit
        picture.isUserInteractionEnabled = true
        return picture
    }()
    
    var discript: UITextView = {
        let discript = UITextView()
        discript.translatesAutoresizingMaskIntoConstraints = false
        discript.font = UIFont.systemFont(ofSize: 14)
        discript.textColor = .lightGray
        return discript
    }()
    
   lazy var likes: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = UIFont.systemFont(ofSize: 16)
        likes.textColor = .black
        likes.isUserInteractionEnabled = true
        likes.text = "likes: \(sumLikes)"
        return likes
    }()
    
    var views: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = UIFont.systemFont(ofSize: 16)
        views.textColor = .black
        views.text = "views: \(forPost)"
        views.textAlignment = .right
        return views
    }()
    
    var sumLikes: Int = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        settingPost()
        addLikesRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func settingPost(){
        contentView.addSubview(author)
        contentView.addSubview(picture)
        contentView.addSubview(discript)
        contentView.addSubview(likes)
        contentView.addSubview(views)
    
        NSLayoutConstraint.activate([
            author.topAnchor.constraint(equalTo: topAnchor),
            author.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            author.rightAnchor.constraint(equalTo: rightAnchor),
            author.heightAnchor.constraint(equalToConstant: 50),
            
            picture.topAnchor.constraint(equalTo: author.bottomAnchor),
            picture.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            picture.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            picture.heightAnchor.constraint(equalToConstant: 200),
            
            discript.topAnchor.constraint(equalTo: picture.bottomAnchor),
            discript.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            discript.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            discript.heightAnchor.constraint(equalToConstant: 50),
            
            likes.topAnchor.constraint(equalTo: discript.bottomAnchor),
            likes.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            likes.rightAnchor.constraint(equalTo: leftAnchor, constant: 100),
            likes.heightAnchor.constraint(equalToConstant: 20),
            
            views.topAnchor.constraint(equalTo: discript.bottomAnchor),
            views.rightAnchor.constraint(equalTo: picture.rightAnchor),
            views.leftAnchor.constraint(equalTo: rightAnchor, constant: -100),
            views.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func settingDataSource(massiv: Post){
        author.text = massiv.author
        picture.image = UIImage(named: massiv.image)
        discript.text = massiv.discription
        views.text = "views: \(massiv.views)"
    }
    
    func addLikesRecognizer(){
        lazy var tapOneMoreLike = UITapGestureRecognizer(target: self, action: #selector(tapOneMoreLike))
        likes.addGestureRecognizer(tapOneMoreLike)
    }
    
    @objc func tapOneMoreLike(){
        sumLikes += 1
        likes.text = "likes: \(sumLikes)"
    }
}
    
    
    


