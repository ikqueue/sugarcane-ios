//
//  HotilneTableViewCell.swift
//  sugarcane-ios
//
//  Created by Riseplus on 11/1/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

protocol didSendCallDelegate {
    func sendPhone(phone: String)
}

class HotilneTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageVIEW: UIImageView!
    @IBOutlet weak var callButton: UIButton!
    @IBAction func callAction(_ sender: Any) {
        delegate.sendPhone(phone: descriptionLabel.text!)
    }
    
    var delegate : didSendCallDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageVIEW.image = UIImage(named: "call-line")
        callButton.setImage(UIImage(named: "call-green"), for: .normal)
        descriptionLabel.text = "1234567890"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
