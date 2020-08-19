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
    let deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.setImage(UIImage(named: "trash"), for: .normal)
        deleteButton.layer.masksToBounds = true
        deleteButton.layer.cornerRadius = 30.0
        deleteButton.layer.shadowOpacity = 4
        deleteButton.layer.shadowRadius = 30.0
        deleteButton.layer.shadowColor = UIColor.black.cgColor
        deleteButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        deleteButton.backgroundColor = UIColor.white
        return deleteButton
    }()
    let addButton: UIButton = {
        let addButton = UIButton()
        addButton.setImage(UIImage(named: "add"), for: .normal)
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = 30.0
        addButton.layer.shadowOpacity = 4
        addButton.layer.shadowRadius = 30.0
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        addButton.backgroundColor = UIColor.theme
        return addButton
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
        addSubview(deleteButton)
        addSubview(addButton)
    }
    
    private func setLayout() {
        tableView.snp_makeConstraints{(make) -> Void in
            make.width.equalTo(self)
            make.height.equalTo(self)
            make.center.equalTo(self)
        }
        deleteButton.snp_makeConstraints{(make) -> Void in
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.left.equalTo(self).offset(40)
            make.bottom.equalTo(self).offset(-80)
        }
        addButton.snp_makeConstraints{(make) -> Void in
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.right.equalTo(self).offset(-40)
            make.bottom.equalTo(self).offset(-80)
        }
    }
}
