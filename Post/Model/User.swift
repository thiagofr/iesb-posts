//
//  User.swift
//  Post
//
//  Created by Thiago Franca Sousa on 11/04/21.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name, username, email: String
}
