//
//  AuthViewController.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/17.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class AuthViewController: TodoBaseController {
   private(set) lazy var authModel = AuthModel()
   private(set) lazy var authView: AuthView = AuthView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupLayout() {
        self.view = authView
        authView.mailTextField.delegate = self
        authView.passwordTextField.delegate = self
    }
    
    override func setupEvent() {
        authView.loginButton.addTarget(self, action: #selector(loginEvent), for: .touchUpInside)
    }
    
    
    @objc func loginEvent(){
        let mail = authView.mailTextField.text ?? ""
        let password = authView.passwordTextField.text ?? ""
        if (!mail.isEmpty && !password.isEmpty) {
            let result = authModel.login(mail: mail, password: password)
            if(!result.isEmpty) {
                print(result)
                let vc = TodoListViewController()
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

extension AuthViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
}
