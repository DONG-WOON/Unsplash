//
//  ViewController.swift
//  Unsplash
//
//  Created by 서동운 on 9/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nicknameTextField.placeholder = NSLocalizedString(StringKey.nickname_placeholder, comment: "")
        let value = NSLocalizedString(StringKey.nickname_result, comment: "")
        resultLabel.text = String(format: value, "고래밥", "다마고치")
        
        
        let ageDescription = StringKey.age_result.localized(number: 13)
        resultLabel.text = ageDescription
        
    }
}

