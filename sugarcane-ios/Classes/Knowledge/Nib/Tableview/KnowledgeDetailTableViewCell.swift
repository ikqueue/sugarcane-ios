//
//  KnowledgeDetailTableViewCell.swift
//  sugarcane-ios
//
//  Created by Riseplus on 10/31/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

class KnowledgeDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var setImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setImage.image = UIImage(named: "calendar-green")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
