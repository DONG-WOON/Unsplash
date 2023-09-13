//
//  LoginViewController.swift
//  Unsplash
//
//  Created by 서동운 on 9/12/23.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    let viewModel = LoginViewModel()
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var loginResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.id.bind { id in
            self.idTextField.text = id
        }
        
        viewModel.pw.bind { pw in
            self.pwTextField.text = pw
        }
        
        viewModel.isValid.bind { isValid in
            self.loginButton.backgroundColor = isValid ? .systemIndigo : .systemBackground
            self.loginButton.tintColor = isValid ? .white : .label
        }
        
        idTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
        pwTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
//        loginButton.rx.tap
//            .bind {  in
//            <#code#>
//            }.dispose()
//
//        idTextField.rx.controlEvent(.editingChanged).bind { <#()#> in
//            /
//        }
        loginButton.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
    }
    
    @objc func textDidChange(_ textField: UITextField) {
        if textField == idTextField {
            viewModel.id.value = textField.text ?? ""
        } else if textField == pwTextField {
            viewModel.pw.value = textField.text ?? ""
        }
        
        viewModel.checkValidation()
    }
    
    @objc func loginButtonDidTapped() {
        viewModel.login() {
            print("로그인서ㅓㅓㅓㅓㅓㅓㅇ공")
        }
    }
}
