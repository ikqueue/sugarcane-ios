//
//  UICollectionView.swift
//  sugarcane-ios
//
//  Created by Riseplus on 10/31/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    // MARK: - register Cell
    func registerKnowledgeCell() -> Void {
        let cell = UINib(nibName: "KnowledgeCollectionCell", bundle:nil)
        self.register(cell, forCellWithReuseIdentifier: "KnowledgeCollectionCell")
    }
    func registerKnowledgeSearchCell() -> Void {
        let cell = UINib(nibName: "KnowledgeSearchCollectionViewCell", bundle:nil)
        self.register(cell, forCellWithReuseIdentifier: "KnowledgeSearchCollectionViewCell")
    }
    
    
    // MARK: - UIEdgeInsetsMake
    func UIEdgeInsetsZero() -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func UIEdgeInsetsCell() -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 10, 10, 10)
    }
    
    // MARK: - size
    func sizeCell() -> CGSize {
        return CGSize(width: self.frame.size.width/2-15, height: 300)
    }
    
    // MARK: - Colour
    func setBackgroundCollectionWhite() -> Void {
        backgroundColor = UIColor.white
    }
    
}
