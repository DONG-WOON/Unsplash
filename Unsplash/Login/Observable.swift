//
//  Observable.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import Foundation

protocol Disposable {
    
}

class Observable<Value>: Disposable {
    var listener: ((Value) -> Void)?
    
    var value: Value {
        didSet {
            listener?(value)
        }
    }
    
    init(listener: ( (Value) -> Void)? = nil, value: Value) {
        self.listener = listener
        self.value = value
    }
    
    @discardableResult
    func bind(_ listener: ((Value) -> Void)?) -> Disposable {
        self.listener = listener
        return self
    }
    
    func dispose() {
        
    }
}
