//
//  TodoSetting.swift
//  Todo
//
//  Created by CHEN SINYU on 2020/08/17.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//
import Foundation
import UIKit
import SnapKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

extension UIColor {
    class var background: UIColor {
        return UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    class var pink: UIColor {
        return UIColor(red: 255/255, green: 128/255, blue: 168/255, alpha: 1.0)
    }
    
    class var theme: UIColor {
        return UIColor(red: 29/255, green: 221/255, blue: 43/255, alpha:1.0)
    }
}

extension UIView{
    
    func waitingOpen(){
        let wating = UIActivityIndicatorView()
        self.addSubview(wating)
        let parent = self
        wating.translatesAutoresizingMaskIntoConstraints = false
        wating.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 0.0).isActive = true
        wating.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: 0.0).isActive = true
        wating.style = .whiteLarge
        wating.color = .white
        wating.startAnimating()
    }
    func waitingClose(){
        let watings = self.subviews.filter{ $0 is UIActivityIndicatorView }.map({ $0 as! UIActivityIndicatorView })
        for waiting in watings{
            waiting.stopAnimating()
            waiting.removeFromSuperview()
        }
    }
}
