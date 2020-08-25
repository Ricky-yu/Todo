//
//  TodoListViewController.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/18.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit
class TodoListViewController: TodoBaseController {
    private(set) lazy var todoLsitView: TodoListView = TodoListView()
    private(set) lazy var todoListModel =  TodoListModel()
    private var todoList:[String] = []
    private var selectedDelteTaskIds: [Int]?
    convenience init(uuid: String) {
        self.init()
        todoListModel.setup(uuid: uuid)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        todoListModel.notificationCenter.removeObserver(self)
    }
    
    override func setupLayout() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.barTintColor = UIColor.theme
        self.view.backgroundColor = UIColor.theme
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
        todoListModel.notificationCenter.addObserver(forName: .init(rawValue: "selectedDelteTaskIds"),
                                                     object: nil,
                                                     queue: nil,
                                                     using: { [unowned self] notification in
                                                        if let selectedDelteTaskIds = notification.userInfo?["selectedDelteTaskIds"] as? [Int] {
                                                            self.selectedDelteTaskIds = selectedDelteTaskIds
                                                        }
        })
        todoLsitView.deleteButton.addTarget(self, action: Selector(("onDeleteButtonTapped:")), for: .touchUpInside)
        todoLsitView.addButton.addTarget(self, action: Selector(("onAddButtonTapped:")), for: .touchUpInside)
    }
    
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath) as! TodoListCell
        let index = todoList.count - indexPath.row - 1
        cell.label.text = self.todoList[index]
        cell.iconButton.tag = index
        if(selectedDelteTaskIds?.firstIndex(of: index) != nil) {
            cell.iconButton.isSelected = true
            cell.iconButton.setImage(UIImage(named: "iconDelete"), for: .normal)
        }else{
            cell.iconButton.isSelected = false
            cell.iconButton.setImage(UIImage(named: "iconDeleteBefore"), for: .normal)
        }
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
        todoListModel.addDeleteTaskId(id: sender.tag)
    }
    
    @objc func onDeleteButtonTapped(_ sender:UIButton) {
        todoListModel.deleteTasks()
    }
    
    @objc func onAddButtonTapped(_ sender:UIButton) {
        let alertController = UIAlertController(title: "タスクを追加",
                                                message: "追加したいタスクを記入してください",
                                                preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: .default,
                                                handler: {(action: UIAlertAction) -> Void in
                                                    self.todoListModel.addTask(text: alertController.textFields!.first!.text!)
        }))
        present(alertController, animated: true)
    }
}
