//
//  BaseView.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/17.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.background
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
