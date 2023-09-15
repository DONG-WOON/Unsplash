//
//  User.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import Foundation


class User {
    let _id: UUID
    var name: String
    var age: Int
    
    var introduce: String { "\(name): \(age)살" }
    
    init(_id: UUID = UUID(), name: String, age: Int) {
        self._id = _id
        self.name = name
        self.age = age
    }
}

extension User: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(_id)
        hasher.combine(name)
        hasher.combine(age)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs._id == rhs._id
    }
}
