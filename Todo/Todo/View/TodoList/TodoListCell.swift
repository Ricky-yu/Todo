//
//  TodoListCell.swift
//  Todo
//
//  Created by chen.sinyu on 2020/08/18.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class TodoListCell: TodoListBaseTableViewCell {
    let iconButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "iconDeleteBefore"), for: .normal)
        return btn
    }()
    
    let label: UILabel = {
        let lbel = UILabel()
        lbel.textColor = .black
        lbel.font = UIFont.boldSystemFont(ofSize: 17)
        return lbel
    }()
    
    override func setupUI() {
        
        contentView.addSubview(iconButton)
        contentView.addSubview(label)
        iconButton.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0))
            make.width.equalTo(50)
        }
        label.snp_makeConstraints{(make) -> Void in
            make.left.equalTo(iconButton.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(30)
            make.top.equalTo(iconButton)
        }
    }
}
