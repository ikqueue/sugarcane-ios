//
//  UINavigationController.swift
//  sugarcane-ios
//
//  Created by Riseplus on 10/31/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    // MARK: - Title
    func setTitleKnowledgeNavi() -> Void {
        navigationBar.topItem?.title = "คลังความรู้"
    }
    
    func setTitleQuestionNavi() -> Void {
        navigationBar.topItem?.title = "สอบถามและปรึกษา"
    }
    
    // MARK: - Color
    func setColorKnowledgeNavi() -> Void {
        navigationBar.barTintColor = UIColor(red:0.16, green:0.54, blue:0.80, alpha:1.0)
        navigationBar.tintColor = UIColor.white
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
}
