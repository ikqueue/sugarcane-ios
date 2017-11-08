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
    func registerHotilneTableViewCell() -> Void {
        let cell = UINib(nibName: "HotilneTableViewCell", bundle:nil)
        self.register(cell, forCellReuseIdentifier: "HotilneTableViewCell")
    }
    func registerAddressTableViewCell() -> Void {
        let cell = UINib(nibName: "AddressTableViewCell", bundle:nil)
        self.register(cell, forCellReuseIdentifier: "AddressTableViewCell")
    }
    func registerEmailTableViewCell() -> Void {
        let cell = UINib(nibName: "EmailTableViewCell", bundle:nil)
        self.register(cell, forCellReuseIdentifier: "EmailTableViewCell")
    }
    func registerHeadQuestionDetailTableViewCell() -> Void {
        let cell = UINib(nibName: "HeadQuestionDetailTableViewCell", bundle:nil)
        self.register(cell, forCellReuseIdentifier: "HeadQuestionDetailTableViewCell")
    }
    func registerDescriptionQuestionDetailTableViewCell() -> Void {
        let cell = UINib(nibName: "DescriptionQuestionDetailTableViewCell", bundle:nil)
        self.register(cell, forCellReuseIdentifier: "DescriptionQuestionDetailTableViewCell")
    }
    func registerImageQuestionDetailTableViewCell() -> Void {
        let cell = UINib(nibName: "ImageQuestionDetailTableViewCell", bundle:nil)
        self.register(cell, forCellReuseIdentifier: "ImageQuestionDetailTableViewCell")
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
    
    
}
