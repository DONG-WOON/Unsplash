//
//  SampleViewModel.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import Foundation

class SampleViewModel {
    
    var list = Observable<[User]>(value: [])
    
    init() {
        list.value = [
            User(name: "Hue", age: 21),
            User(name: "Jack", age: 23),
            User(name: "Bran", age: 20),
            User(name: "kokojong", age: 21)
        ]
    }
    
    var numberOfRowsInSection: Int {
        list.value.count
    }
    
    func user(at indexPath: IndexPath) -> User {
        return list.value[indexPath.row]
    }
    
    func addUser(at indexPath: IndexPath) {
        list.value.append(list.value[indexPath.row])
    }
}
