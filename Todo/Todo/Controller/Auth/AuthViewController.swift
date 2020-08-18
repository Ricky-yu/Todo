//
//  AuthViewController.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/17.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
import FirebaseAuth
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
        guard let email = authView.mailTextField.text, let password = authView.passwordTextField.text else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if (result?.user) != nil {
                let vc = TodoListViewController(uuid: (result?.user.uid)!)
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                self.alert(title: "メッセージ", message: "登録失敗しました")
            }
        }
    }
    
    func alert(title:String, message:String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler: nil))
        present(alertController, animated: true)
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
