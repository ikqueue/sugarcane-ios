//
//  EmailTableViewCell.swift
//  sugarcane-ios
//
//  Created by Riseplus on 11/1/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

class EmailTableViewCell: UITableViewCell {

    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageIcon.image = UIImage(named: "envelope")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
