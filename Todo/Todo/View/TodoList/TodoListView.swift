//
//  TodoListView.swift
//  Todo
//
//  Created by chen.sinyu on 2020/08/18.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class TodoListView: BaseView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TodoListCell.self, forCellReuseIdentifier: "TodoListCell")
        return tableView
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
        addSubview(tableView)
    }
    
    private func setLayout() {
        tableView.snp_makeConstraints{(make) -> Void in
            make.width.equalTo(self)
            make.height.equalTo(self)
            make.center.equalTo(self)
        }
    }
}
