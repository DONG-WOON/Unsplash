//
//  Extension+String.swift
//  Unsplash
//
//  Created by 서동운 on 9/11/23.
//

import Foundation


extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(number: Int) -> String {
        return String(format: self.localized, number)
    }
}
