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
        titleLabel.text = "Mock Up Lorem Ipsum is a dummy text that is mainly used by the printing and design industry"
        detailLabel.text = "Lorem Ipsum is a dummy text that is mainly used by the printing and design industry. It is intended to show how the type will look before the end product is available.Lorem Ipsum has been the industry's standard dummy text ever since the 1500:s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum dummy texts was available for many years on adhesive sheets in different sizes and typefaces from a company called Letraset.When computers came along, Aldus included lorem ipsum in its PageMaker publishing software, and you now see it wherever designers, content designers, art directors, user interface developers and web designer are at work.They use it daily when using programs such as Adobe Photoshop, Paint Shop Pro, Dreamweaver, FrontPage, PageMaker, FrameMaker, Illustrator, Flash, Indesign etc."
        dateLabel.text = "01/12/2017"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
