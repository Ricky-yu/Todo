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
    private var uuid: String = ""
    private var db = Firestore.firestore()
    private var selectedDelteTaskIds = [Int](){
        didSet {
            notificationCenter.post(name: .init(rawValue: "selectedDelteTaskIds"),
                                    object: nil,
                                    userInfo: ["selectedDelteTaskIds": selectedDelteTaskIds])
        }
    }
    private(set) var Task:[String: Any] = [:]{
        didSet {
            notificationCenter.post(name: .init(rawValue: "todoList"),
                                    object: nil,
                                    userInfo: ["todoList": Task])
        }
    }
    
    func setup(uuid: String) {
        self.uuid = uuid
        setDate(uuid: self.uuid)
    }
    func setDate(uuid: String){
        let docRef = db.collection("users").document(uuid)
        docRef.getDocument { (document, error) in
            if let tasks = document.flatMap({
                return $0.data()
            }) {
                self.Task = tasks
            } else {
                // TODO データが無い時の処理を考える
                print("Document does not exist")
            }
        }
    }
    
    @objc func addDeleteTaskId(id: Int){
        print(id)
        if let index = selectedDelteTaskIds.firstIndex(of: id) {
            selectedDelteTaskIds.remove(at: index)
        } else {
            selectedDelteTaskIds.append(id)
        }
    }
    
    @objc func deleteTasks(){
        for id in selectedDelteTaskIds {
            db.collection("users").document(self.uuid).updateData([
                "\(id)": FieldValue.delete(),
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        }
        selectedDelteTaskIds.removeAll()
        setDate(uuid: self.uuid)
    }
    
    @objc func addTask(id: Int, text: String){
        Task["\(id)"] = text
        db.collection("users").document(self.uuid).setData(Task) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        setDate(uuid: self.uuid)
    }
}
