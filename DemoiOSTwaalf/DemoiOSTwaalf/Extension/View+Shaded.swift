//
//  View+Shaded.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 22.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import Foundation
import UIKit

protocol Shaded { }
protocol TopShaded { }
protocol SectionView { }

extension UIView {
    open override func awakeFromNib() {
        super.awakeFromNib()
        // TODO: Customization
        if self is Shaded {
            layer.masksToBounds = false
            layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.24).cgColor
            layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            layer.shadowOpacity = 1.0
            layer.shadowRadius = 2.0
        } else if self is TopShaded {
            layer.masksToBounds = false
            layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
            layer.shadowOffset = CGSize(width: 0.0, height: -4.0)
            layer.shadowOpacity = 1.0
            layer.shadowRadius = 4.0
        } else if self is SectionView {
            layer.masksToBounds = false
            layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
            layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            layer.shadowOpacity = 1.0
            layer.shadowRadius = 4.0
        }
    }
}
