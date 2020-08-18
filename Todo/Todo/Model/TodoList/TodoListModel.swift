//
//  TodoListModel.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/19.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
import Firebase
class TodoListModel {
    let notificationCenter = NotificationCenter()
    private var db = Firestore.firestore()
    private(set) var Task:[String] = []{
        didSet {
            notificationCenter.post(name: .init(rawValue: "todoList"),
                                    object: nil,
                                    userInfo: ["todoList": Task])
        }
    }
    
    init() {
        let docRef = db.collection("users").document("mdn7oVXrkDcvXAgmnj7qPTaF5WK2")
        
        docRef.getDocument { (document, error) in
            if let tasks = document.flatMap({
                $0.data().flatMap({ (data) in
                    return data["todoList"] as? [String]
                })
            }) {
                print(tasks)
                self.Task = tasks
            } else {
                print("Document does not exist")
            }
        }
    }
}
