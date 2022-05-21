//
//  News.swift
//  Navigation
//
//  Created by User on 03.05.2022.
//

struct News: Decodable {
    
    struct Post: Decodable {
        let author, description, image: String
        var likes: Int
        var views: Int
        
        enum CodingKeys: String, CodingKey {
            case author, description, image, likes, views
        }
    }
    
    
    let posts: [Post]
}

