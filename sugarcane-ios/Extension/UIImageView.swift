//
//  UIImageView.swift
//  sugarcane-ios
//
//  Created by Riseplus on 10/31/17.
//  Copyright © 2017 Riseplus. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setCornerRadius() -> Void {
        self.layer.cornerRadius = 5
    }
    
    func setCalendarImage() -> Void {
        UIImage(named: "calendar-green")
    }
    
}
