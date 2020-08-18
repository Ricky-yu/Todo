//
//  TodoListCell.swift
//  Todo
//
//  Created by chen.sinyu on 2020/08/18.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class TodoListCell: TodoListBaseTableViewCell {
    private  lazy var iconButton: UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "iconDeleteBefore"), for: .normal)
        return btn
    }()
    
    override func setupUI() {
        contentView.addSubview(iconButton)
        iconButton.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0))
            make.width.equalTo(50)
        }
    }
}
