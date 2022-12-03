//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Никита Бурин on 11.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 325
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
        
        view.backgroundColor = .white
    
        self.view.addSubview(tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        if indexPath.section == 0 {
            height = 150}
        else if indexPath.section == 1{
            height = 320.0
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count: Int = 0
        if section == 0 {
            count = cellPhoto.count
        } else if section == 1 {
          count = forPost.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        var recell = UITableViewCell()
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell") as! PhotosTableViewCell
            let x = cellPhoto[indexPath.row]
            cell.settingDataSource(massiv: x)
            recell = cell
            
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
            let x = forPost[indexPath.row]
            cell.settingDataSource(massiv: x)
            recell = cell
            
        }
        return recell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        var config = UISwipeActionsConfiguration()
        if indexPath.section == 1 {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            forPost.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            complete(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
               configuration.performsFirstActionWithFullSwipe = true
               config = configuration
        }
        return config
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            var header = UIView()
            header = ProfileHeaderView()
            header.backgroundColor = .white
            return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        var height: CGFloat = 0
        
        if section == 0 {
            height = 220 }
        
        return height
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            navigationController?.pushViewController(PhotoGalleryViewController(), animated: true)
        } else if indexPath.section == 1 {
            if let customImage = UIImage(named: forPost[indexPath.row].image){
                showFullPost(picture: customImage, author: forPost[indexPath.row].author, discript: forPost[indexPath.row].discription, likes: forPost[indexPath.row].likes, views: forPost[indexPath.row].views)
            }
            forPost[indexPath.row].views += 1
            tableView.reloadData()
            }
    }

    func showFullPost(picture: UIImage, author: String, discript: String, likes: Int, views: Int) {
        
        let postImage = UIImageView()
        postImage.image = picture
        postImage.backgroundColor = .white
        postImage.contentMode = .scaleAspectFit
        postImage.isUserInteractionEnabled = true
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.backgroundColor = .black
           
        let authorLabel = UILabel(frame: .zero)
        authorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLabel.textColor = .black
        authorLabel.text = author
        authorLabel.numberOfLines = 2
        authorLabel.translatesAutoresizingMaskIntoConstraints = false

        let postDiscript = UILabel(frame: .zero)
        postDiscript.font = UIFont.systemFont(ofSize: 14)
        postDiscript.textColor = .systemGray
        postDiscript.textAlignment = .left
        postDiscript.numberOfLines = 0
        postDiscript.text = discript
        postDiscript.lineBreakMode = .byWordWrapping
        postDiscript.isUserInteractionEnabled = true
        postDiscript.translatesAutoresizingMaskIntoConstraints = false
    
        let likesLabel = UILabel(frame: .zero)
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        likesLabel.textColor = .black
        likesLabel.numberOfLines = 2
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.text = "Likes: \(likes)"
        likesLabel.isUserInteractionEnabled = true

        let viewsLabel = UILabel(frame: .zero)
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        viewsLabel.textColor = .black
        viewsLabel.textAlignment = .right
        viewsLabel.numberOfLines = 2
        viewsLabel.isUserInteractionEnabled = true
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.text = "Views: \(views)"
        
        let postView = UIView()
        postView.backgroundColor = .white
        postView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(postView)
        postView.addSubview(postImage)
        postView.addSubview(authorLabel)
        postView.addSubview(postDiscript)
        postView.addSubview(likesLabel)
        postView.addSubview(viewsLabel)

        let closeFullPost = UITapGestureRecognizer(target: self, action: #selector(closeFullPost))
        postView.addGestureRecognizer(closeFullPost)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        
        
        NSLayoutConstraint.activate([
            
            postView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            postView.leftAnchor.constraint(equalTo: view.leftAnchor),
            postView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: 180),
            authorLabel.leftAnchor.constraint(equalTo: postView.leftAnchor, constant: 16),
            authorLabel.rightAnchor.constraint(equalTo: postView.rightAnchor),
            authorLabel.heightAnchor.constraint(equalToConstant: 50),
            
            postImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            postImage.leftAnchor.constraint(equalTo: postView.leftAnchor),
            postImage.rightAnchor.constraint(equalTo: postView.rightAnchor),
            postImage.heightAnchor.constraint(equalToConstant: 320),
            
            postDiscript.topAnchor.constraint(equalTo: postImage.bottomAnchor),
            postDiscript.leftAnchor.constraint(equalTo: postView.leftAnchor, constant: 16),
            postDiscript.rightAnchor.constraint(equalTo: postView.rightAnchor, constant: -16),
            postDiscript.heightAnchor.constraint(equalToConstant: 50),

            likesLabel.topAnchor.constraint(equalTo: postDiscript.bottomAnchor),
            likesLabel.leftAnchor.constraint(equalTo: postView.leftAnchor, constant: 16),
            likesLabel.heightAnchor.constraint(equalToConstant: 20),
            likesLabel.widthAnchor.constraint(equalToConstant: 100),
            
            viewsLabel.topAnchor.constraint(equalTo: postDiscript.bottomAnchor),
            viewsLabel.rightAnchor.constraint(equalTo: postView.rightAnchor, constant: -16),
            viewsLabel.leftAnchor.constraint(equalTo: postView.rightAnchor, constant: -100),
            viewsLabel.heightAnchor.constraint(equalToConstant: 20)
        
        ])
        
    }

    @objc func closeFullPost(_ tap: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        tap.view?.removeFromSuperview()
    }
}

extension UIView {
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
}

