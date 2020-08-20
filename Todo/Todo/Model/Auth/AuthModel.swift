//
//  AuthModel.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/17.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class AuthModel {
    func saveUserInfo(uuid:String){
        UserDefaults.standard.set(uuid, forKey: "isLogined")
    }
}
