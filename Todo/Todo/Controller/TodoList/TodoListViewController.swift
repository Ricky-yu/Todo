//
//  TodoListViewController.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/18.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class TodoListViewController: TodoBaseController {
    private var uuid: String?
    private(set) lazy var todoLsitView: TodoListView = TodoListView()
    
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
    }
    
}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(TodoListCell.self), for: indexPath) as? TodoListCell ?? tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
 
}
