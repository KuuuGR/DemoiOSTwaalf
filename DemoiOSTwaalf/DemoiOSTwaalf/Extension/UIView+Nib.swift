//
//  File.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 21.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

protocol DummyUIViewNib {}
extension UIView: DummyUIViewNib {
    
    @discardableResult
    class func fromNib<T : UIView>() -> T {
        if Bundle.main.url(forResource: className(self), withExtension: "nib") != nil {
            return Bundle.main.loadNibNamed(className(self), owner: self, options: nil)?.first as! T
        } else {
            return self.init(frame: CGRect(x: 0, y: 0, width: 1, height: 1)) as! T
        }
    }
    
    func addMarginConstraints(left: CGFloat = 0, top: CGFloat = 0, right: CGFloat = 0, bottom: CGFloat = 0) {
        addConstraints([
            NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: self.superview, attribute: .left, multiplier: 1, constant: left),
            NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: self.superview, attribute: .top, multiplier: 1, constant: top),
            NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: self.superview, attribute: .right, multiplier: 1, constant: right),
            NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: self.superview, attribute: .bottom, multiplier: 1, constant: bottom)
            ])
    }
}
