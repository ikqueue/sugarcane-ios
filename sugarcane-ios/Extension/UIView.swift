//
//  UIView.swift
//  sugarcane-ios
//
//  Created by Riseplus on 10/31/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

extension UIView {
    
    func setBackgroundWhite() -> Void {
        backgroundColor = UIColor.white
    }
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}
