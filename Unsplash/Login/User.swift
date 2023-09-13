//
//  User.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import Foundation


struct User {
    var name: String
    var age: Int
    
    var introduce: String { "\(name): \(age)살" }
}
