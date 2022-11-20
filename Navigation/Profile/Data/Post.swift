//
//  Post.swift
//  Navigation
//
//  Created by Никита Бурин on 10.10.2022.
//

import Foundation

struct Post {
    var author: String
    var discription: String
    var image: String
    var likes: Int
    var views: Int
}

var firstPlace = Post(author: "France football Ballon d'Or",
                      discription: "1st place - Karim Benzema",
                      image: "benzema",
                      likes: 0,
                      views: 0)
var secondPlace = Post(author: "France football Ballon d'Or",
                       discription: "2nd place - Sadio Mane",
                       image: "mane",
                       likes: 0,
                       views: 0)
var thirdPlace = Post(author: "France football Ballon d'Or",
                      discription: "3rd place - Kevin de Bruyne",
                      image: "kevin",
                      likes: 0,
                      views: 0)
var fourthPlace = Post(author: "France football Ballon d'Or",
                       discription: "4th place - Robert Lewandowski",
                       image: "lewa",
                       likes: 0,
                       views: 0)
var fifthPlace = Post(author: "France football Ballon d'Or",
                      discription: "5th place - Mohamed Salah",
                      image: "salah",
                      likes: 0,
                      views: 0)

var forPost = [firstPlace, secondPlace, thirdPlace, fourthPlace, fifthPlace]
