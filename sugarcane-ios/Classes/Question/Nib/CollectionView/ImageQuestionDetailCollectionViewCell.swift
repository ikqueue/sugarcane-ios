//
//  ImageQuestionDetailCollectionViewCell.swift
//  sugarcane-ios
//
//  Created by Riseplus on 11/1/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

class ImageQuestionDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageVIEW: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.clear.cgColor
        imageVIEW.setCornerRadius()
        backgroundColor = UIColor.white
    }

}
