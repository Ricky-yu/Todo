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
    private var selectedDelteTaskIds = [Int]()
    private(set) var Task:[String] = []{
        didSet {
            notificationCenter.post(name: .init(rawValue: "todoList"),
                                    object: nil,
                                    userInfo: ["todoList": Task])
        }
    }
    
    func setup(uuid: String) {
        let docRef = db.collection("users").document(uuid)
        docRef.getDocument { (document, error) in
            if let tasks = document.flatMap({
                $0.data().flatMap({ (data) in
                    return data["todoList"] as? [String]
                })
            }) {
                self.Task = tasks
            } else {
                // TODO データが無い時の処理を考える
                print("Document does not exist")
            }
        }
    }
    
    @objc func touch(id: Int){
        if let index = selectedDelteTaskIds.firstIndex(of: id) {
            selectedDelteTaskIds.remove(at: index)
        } else {
            selectedDelteTaskIds.append(id)
        }
    }
}
