//
//  TodoListViewController.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/18.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
import Firebase
class TodoListViewController: TodoBaseController {
    private var uuid: String?
    private(set) lazy var todoLsitView: TodoListView = TodoListView()
    private var db = Firestore.firestore()
    private var todoList: [String]?
    convenience init(uuid: String) {
        self.init()
        self.uuid = uuid
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupLayout() {
        self.navigationItem.hidesBackButton = true
        self.view.backgroundColor = UIColor.pink
        self.view = todoLsitView
        todoLsitView.tableView.delegate = self
        todoLsitView.tableView.dataSource = self
        let docRef = db.collection("users").document("mdn7oVXrkDcvXAgmnj7qPTaF5WK2")
        
        docRef.getDocument { (document, error) in
            if let tasks = document.flatMap({
                $0.data().flatMap({ (data) in
                    return data["todoList"] as? [String]
                })
            }) {
                self.todoList = tasks
                self.todoLsitView.tableView.reloadData()
            } else {
                print("Document does not exist")
            }
        }
        
    }
    
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath) as! TodoListCell
        cell.label.text = self.todoList?[indexPath.row] ?? ""
        return cell
    }
    
}
