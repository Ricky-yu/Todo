//
//  AuthModel.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/17.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
import FirebaseAuth
class AuthModel {
    func login(mail:String, password:String)-> String {
        var uuid:String = ""
        Auth.auth().signIn(withEmail: mail, password: password) { [weak self] authResult, error in
            print(authResult?.user.uid)
            uuid = authResult?.user.uid ?? ""
        }
        return uuid
   }
}
