//
//  AuthView.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/17.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class AuthView: BaseView {
        let mailTextField: UITextField = {
            let textField = UITextField()
            textField.backgroundColor = UIColor.white
            textField.textColor = UIColor.gray
            textField.tintColor = UIColor.darkGray
            textField.font = UIFont.systemFont(ofSize: 15)
            textField.placeholder = "メールアドレス入力"
            textField.layer.cornerRadius = 15
            textField.borderStyle = .roundedRect
            textField.clearButtonMode = .whileEditing
            textField.returnKeyType = .done
            return textField
        }()
        
        let passwordTextField: UITextField = {
               let textField = UITextField()
               textField.backgroundColor = UIColor.white
               textField.textColor = UIColor.gray
               textField.tintColor = UIColor.darkGray
               textField.font = UIFont.systemFont(ofSize: 15)
               textField.placeholder = "パスワード入力"
               textField.layer.cornerRadius = 15
               textField.borderStyle = .roundedRect
               textField.isSecureTextEntry = true
               textField.clearButtonMode = .whileEditing
               textField.returnKeyType = .done
               return textField
           }()
    
        let loginButton: UIButton = {
            let loginBtn = UIButton()
            let rgba = UIColor.pink
            loginBtn.backgroundColor = rgba
            loginBtn.setTitle("Login", for:.normal)
            loginBtn.setTitleColor(UIColor.white, for: .normal)
            loginBtn.titleLabel?.font = .boldSystemFont(ofSize: 20)
            loginBtn.layer.borderWidth = 0.5
            loginBtn.layer.borderColor = UIColor.black.cgColor
            loginBtn.layer.cornerRadius = 5.0
            return loginBtn
        }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviews() {
        addSubview(mailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
    }
    
    private func setLayout() {
        mailTextField.snp_makeConstraints{(make) -> Void in
            make.width.equalTo(screenWidth/2)
            make.center.equalTo(self)
        }
        passwordTextField.snp_makeConstraints{(make) -> Void in
            make.width.equalTo(screenWidth/2)
            make.bottom.equalTo(mailTextField).offset(40)
            make.left.equalTo(mailTextField).offset(0)
        }
        loginButton.snp_makeConstraints{(make) -> Void in
            make.height.equalTo(passwordTextField).offset(10)
            make.width.equalTo(passwordTextField).offset(-30)
            make.bottom.equalTo(passwordTextField).offset(60)
            make.centerX.equalTo(passwordTextField)
        }
    }
}
