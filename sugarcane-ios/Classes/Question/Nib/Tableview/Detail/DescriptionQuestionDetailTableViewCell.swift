//
//  DescriptionQuestionDetailTableViewCell.swift
//  sugarcane-ios
//
//  Created by Riseplus on 11/1/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

class DescriptionQuestionDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var setView: UIView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: setView.frame.width, height: setView.frame.height))
        let image = UIImage(named: "chat-line-bg")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        setView.addSubview(imageView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
