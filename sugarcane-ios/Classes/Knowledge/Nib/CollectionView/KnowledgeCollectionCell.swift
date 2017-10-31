//
//  KnowledgeCollectionCell.swift
//  sugarcane-ios
//
//  Created by Riseplus on 10/30/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

class KnowledgeCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 4
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.clear.cgColor
        imageView.backgroundColor = UIColor.darkGray
        imageView.setCornerRadius()
        
    }

}
