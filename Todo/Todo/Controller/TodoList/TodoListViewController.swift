//
//  TodoListViewController.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/18.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
class TodoListViewController: TodoBaseController {
    private var uuid: String = ""
    private(set) lazy var todoLsitView: TodoListView = TodoListView()
    private(set) lazy var todoListModel =  TodoListModel()
    private var todoList: [String]?
    convenience init(uuid: String) {
        self.init()
        self.uuid = uuid
        todoListModel.setup(uuid: uuid)
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
    }
    
    override func setupEvent() {
        todoListModel.notificationCenter.addObserver(forName: .init(rawValue: "todoList"),
                                                     object: nil,
                                                     queue: nil,
                                                     using: { [unowned self] notification in
                                                        if let list = notification.userInfo?["todoList"] as? [String] {
                                                            self.todoList = list
                                                            self.todoLsitView.tableView.reloadData()
                                                        }
        })
    }
    
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath) as! TodoListCell
        cell.label.text = self.todoList?[indexPath.row] ?? ""
        cell.iconButton.tag = indexPath.row
        cell.iconButton.addTarget(self, action: Selector(("onSelectIconTapped:")), for: .touchUpInside)
        return cell
    }
    
    @objc func onSelectIconTapped(_ sender:UIButton) {
        if(sender.isSelected){
            sender.setImage(UIImage(named: "iconDeleteBefore"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "iconDelete"), for: .normal)
        }
        sender.isSelected = !sender.isSelected
        todoListModel.touch(id: sender.tag)
    }
    
}
