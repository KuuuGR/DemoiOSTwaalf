//
//  BigButton.swift
//  DemoiOSTwaalf
//
//  Created by Grzesiek Kulesza on 22.06.2018.
//  Copyright © 2018 Grzesiek Kulesza. All rights reserved.
//

import UIKit

class RoundButton: ShadedButton {
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //self.backgroundColor = UIColor.dGreen
        layer.cornerRadius = self.frame.size.height/6
        setTitleColor(UIColor.dBlack, for: .normal)
        layer.borderWidth = 2
        layer.borderColor = UIColor.dWhite.cgColor
        
        titleLabel?.font =  UIFont(name: "Roboto-Medium", size: 21.0) ?? UIFont.systemFont(ofSize: 5.0)
        // self.titleLabel?.font =  UIFont(name: "Papyrus", size: 21.0) ?? UIFont.systemFont(ofSize: 2.0)
        
    }
}
