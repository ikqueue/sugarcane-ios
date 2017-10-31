//
//  UITableView.swift
//  sugarcane-ios
//
//  Created by Riseplus on 10/31/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

extension UITableView {
    
    // MARK: - register Cell
    func registerKnowledgeDetailCell() -> Void {
        let cell = UINib(nibName: "KnowledgeDetailTableViewCell", bundle:nil)
        self.register(cell, forCellReuseIdentifier: "KnowledgeDetailTableViewCell")
    }
    func registerQuestionTableViewCell() -> Void {
        let cell = UINib(nibName: "QuestionTableViewCell", bundle:nil)
        self.register(cell, forCellReuseIdentifier: "QuestionTableViewCell")
    }
    // MARK: - Hegiht
    func setHeightCellAutomatic(estimatedRowHeight:CGFloat?) {
        if let temp = estimatedRowHeight {
            self.estimatedRowHeight = temp
        } else {
            self.estimatedRowHeight = 60
        }
        self.rowHeight = UITableViewAutomaticDimension
    }
    
    func UITableViewEdgeInsetsCell() -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
}
