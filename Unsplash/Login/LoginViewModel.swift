//
//  LoginViewModel.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import Foundation

struct LoginViewModel {
    var id = Observable(value: "")
    var pw = Observable(value: "")
    var isValid = Observable(value: false)
    
    init() {
    }
    
    func checkValidation() {
        if id.value.count >= 6 && pw.value.count >= 4 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func login(completion: () -> Void) {
        
        UserDefaults.standard.set(id.value, forKey: "id")

        completion()
    }
}
