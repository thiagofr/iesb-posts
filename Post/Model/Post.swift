//
//  Post.swift
//  Post
//
//  Created by Thiago Franca Sousa on 11/04/21.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId, id: Int
    let title, body: String
}
